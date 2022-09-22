Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4719A5E6D28
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Sep 2022 22:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiIVUjG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 22 Sep 2022 16:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbiIVUjE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 22 Sep 2022 16:39:04 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60717FE07F
        for <linux-bluetooth@vger.kernel.org>; Thu, 22 Sep 2022 13:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663879143; x=1695415143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b/n/8iEJviVM8NPDM9ArBf+7Tz/j/bFgnOkCPJQPIGA=;
  b=PY5l7qnGdQnW9nkJimcyF6rIKL3dy8jE7ghexlR49u/u/Afqgue3HIM0
   hhEElBDD9oeAcUkWr3pPZc2SM++q/ZSOfOvekfpuZYqNG9M3LRraglqhT
   sXhMU2icyuWZD3wA/vfc5L4TqbbpdSUQH32nraRAy3NXDD13jmQWVoJdv
   WaQVTH2Ee48Zj7pMWgq45k7wO95gDzws9Tia9oCoKzpopL9B7fM/fvQZq
   /gPseqPb+JWA6x6OYS2VUzj4R9JLioF5lJ0Y3iIyVTJzOutWuuPmfTnhl
   GKbE6I7zb4At2Ve6orUiRZ8NwgksDQblP1rMbKa8qUjy2EO1zTc+nyaz4
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="301303193"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="301303193"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 13:39:00 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="865028664"
Received: from mobl2.amr.corp.intel.com (HELO bgi1-mobl2.amr.corp.intel.com) ([10.212.23.53])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 13:38:59 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     luiz.dentz@gmail.com, brian.gix@intel.com, inga.stotland@intel.com
Subject: [PATCH BlueZ 1/4] mgmt: Add support for Mesh in the kernel
Date:   Thu, 22 Sep 2022 13:38:49 -0700
Message-Id: <20220922203852.494315-2-brian.gix@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922203852.494315-1-brian.gix@intel.com>
References: <20220922203852.494315-1-brian.gix@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

These commands and events allow User space apps to test for Mesh
support, and request incoming mesh packets be delivered and request
outbound mesh packets to be sent. This is the basis for sharing
one controller between the legacy bluetoothd daemon and the mesh
bluetooth-meshd daemon.
---
 doc/mgmt-api.txt | 192 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 157 insertions(+), 35 deletions(-)

diff --git a/doc/mgmt-api.txt b/doc/mgmt-api.txt
index 23ea42228..90d612ed8 100644
--- a/doc/mgmt-api.txt
+++ b/doc/mgmt-api.txt
@@ -3861,45 +3861,132 @@ Add Advertisement Patterns Monitor With RSSI Threshold Command
 				Invalid Parameters
 
 
-Set Quality Report Command
-==========================
+Set Mesh Receiver Command
+=========================
 
 	Command Code:		0x0057
 	Controller Index:	<controller id>
-	Command Parameters:	Quality_Report (1 Octet)
-	Return Parameters:	Current_Settings (4 Octets)
+	Command Parameters:	Enable (1 Octets)
+				Window (2 Octets)
+				Period (2 Octets)
+				Num AD Types (1 Octets)
+				AD Types { }
 
-	This command is used to enable and disable the controller's quality
-	report feature. The allowed values for the Quality_Report command
-	parameter are 0x00 and 0x01. All other values will return Invalid
-	Parameters.
+	This command Enables or Disables Mesh Receiving. When enabled passive
+	scanning remains enabled for this controller.
+
+	The Window/Period values are used to set the Scan Parameters when no
+	other scanning is being done.
+
+	Num AD Types and AD Types parameter, filter Advertising and Scan
+	responses by AD type. Reponses that do not contain at least one of the
+	requested AD types will be ignored. Otherwise they will be delivered
+	with the Mesh Device Found event.
+
+	Possible errors:	Failed
+				No Resources
+				Invalid Parameters
+
+
+Read Mesh Features Command
+==========================
+
+	Command Code:		0x0058
+	Controller Index:	<controller id>
+	Command Parameters:
+	Return Parameters:	Index (2 Octets)
+				Max Handles (1 Octets)
+				Used Handles (1 Octets)
+				Handle { }
 
-	The value 0x00 disables the Quality Report, and the value 0x01
-	enables the Quality Report feature.
+	This command is used to both verify that Outbound Mesh packet
+	support is enabled, and to indicate the number of packets that
+	can and are simultaneously queued.
 
-	This command is only available for the controllers that support
-	either AOSP Bluetooth quality report or Intel telemetry event.
-	It is supported if the supported_settings indicate support for it.
+	Index identifies the HCI Controller that this information is valid for.
 
-	This command requires to use a valid controller index. Otherwise,
-	an Invalid Index status will be returned.
+	Max Handles indicates the maximum number of packets that may be queued.
 
-	The command is sent to the controller to enable/disable the quality
-	report feature, and generates a Command Complete event on success.
-	If the controller failed to execute the action, a Failed status will
-	be returned.
+	Used Handles indicates the number of packets awaiting transmission.
 
-	The quality report state is maintained by the kernel over the adapter
-	power cycle. When the adapter is powered off, the quality report
-	feature is disabled by the kernel. When the adapter is powered on, it
-	is enabled again by the kernel if it was enabled before.
+	Handle is an array of the currently outstanding packets.
 
 	Possible errors:	Failed
-				Invalid Index
+				No Resources
 				Invalid Parameters
-				Not Supported
 
 
+Transmit Mesh Packet Command
+============================
+
+	Command Code:		0x0059
+	Controller Index:	<controller id>
+	Command Parameters:	Addr (6 octets)
+				Addr Type (1 Octets)
+				Instant (8 Octets)
+				Delay (2 Octets)
+				Count (1 Octets)
+				Data Length (1 Octets)
+				Data (variable)
+
+	Return Parameters:	Handle (1 Octets)
+
+	This command sends a Mesh Packet as a NONCONN LE Advertisement.
+
+	The Addr + Addr Type parameters specifify the address to use in the
+	outbound advertising packet. If BD_ADDR_ANY and LE_RANDOM is set, the
+	kernel will create a single use non-resolvable address.
+
+	The Instant parameter is used in combination with the Delay
+	parameter, to finely time the sending of the Advertising packet. It
+	should be set to the Instant value tag of a received incoming
+	Mesh Device Found Event. It is only useful in POLL-RESPONSE situations
+	where a response must be sent within a negotiated time window. The value
+	of the Instant parameter should not be interpreted by the host, and
+	only has meaning to the controller.
+
+	The Delay parameter, if 0x0000, will cause the packet to be sent
+	at the earliest opportunity. If non-Zero, and the controller supports
+	delayed delivery, the Instant and Delay parameters will be used
+	to delay the outbound packet. While the Instant is not defined, the
+	Delay is specified in milliseconds.
+
+	The Count parameter must be sent to a non-Zero value indicating the
+	number of times this packet will be sent before transmission completes.
+	If the Delay parameter is non-Zero, then Count must be 1 only.
+
+	The Data parameter is an octet array of the AD Type and Mesh Packet.
+
+	This command will return immediately, and if it succeeds, will generate
+	a Mesh Packet Transmission Complete event when after the packet has been
+	sent.
+
+	Possible errors:	Failed
+				Busy
+				No Resources
+				Invalid Parameters
+
+
+Cancel Transmit Mesh Packet Command
+===================================
+
+	Command Code:		0x005A
+	Controller Index:	<controller id>
+	Command Parameters:	Handle (1 Octets)
+
+	This command may be used to cancel an outbound transmission request.
+
+	The Handle parameter is the returned handle from a successful Transmit
+	Mesh Packet request. If Zero is specified as the handle, all outstanding
+	send requests are canceled.
+
+	For each mesh packet canceled, the Mesh Packet Transmission Complete
+	event will be generated, regardless of whether the packet was sent
+	successfully.
+
+	Possible errors:	Failed
+				Invalid Parameters
+
 Command Complete Event
 ======================
 
@@ -5022,20 +5109,55 @@ Advertisement Monitor Device Lost Event
 	This event will be sent to all management sockets.
 
 
-Quality Report Event
-====================
+Mesh Device Found Event
+=======================
 
 	Event code:		0x0031
 	Controller Index:	<controller_id>
-	Event Parameters:	Quality_Spec (1 Octet)
-				Report_Len (2 Octets)
-				Report (0-65535 Octets)
+	Event Parameters:	Address (6 Octets)
+				Address_Type (1 Octet)
+				RSSI (1 Octet)
+				Instant (8 Octets)
+				Flags (4 Octets)
+				AD_Data_Length (2 Octets)
+				AD_Data (0-65535 Octets)
 
-	This event carries the Bluetooth quality report sent by the
-	controller.
+	This event indicates that the controller has received an Advertisement
+	or Scan Result containing an AD Type matching the Mesh scan set.
+
+	The address of the sending device is returned, and must be a valid LE
+	Address_Type.
+
+	Possible values for the Address_Type parameter:
+		0	Reserved (not in use)
+		1	LE Public
+		2	LE Random
+
+	The RSSI field is a signed octet, and is the RSSI reported by the
+	receiving controller.
+
+	The Instant field is 64 bit value that represents the instant in time
+	the packet was received. It's value is not intended to be interpretted
+	by the host, and is only useful if the host wants to make a timed
+	response to the received packet. (i.e. a Poll/Response)
+
+	AD_Length and AD_Data contains the Info structure of Advertising and
+	Scan rsults. To receive this event, AD filters must be requested with
+	the Set Mesh Receiver command command, specifying which AD Types to
+	return. All AD structures will be received in this event if any of the
+	filtered AD Types are present.
+
+	This event will be sent to all management sockets.
+
+
+Mesh Packet Transmit Complete Event
+===================================
+
+	Event code:		0x0032
+	Controller Index:	<controller_id>
+	Event Parameters:	Handle (1 Octets)
 
-	Possible values for the Quality_Spec parameter:
-		0	AOSP Bluetooth Quality Report Event
-		1	Intel Telemetry Event
+	This event indicates that a requested outbound Mesh packet has
+	completed and no longer occupies a transmit slot.
 
 	This event will be sent to all management sockets.
-- 
2.37.3

