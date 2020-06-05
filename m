Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 114A41EF0D6
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Jun 2020 07:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgFEFPQ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 5 Jun 2020 01:15:16 -0400
Received: from mga09.intel.com ([134.134.136.24]:22227 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725280AbgFEFPP (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 5 Jun 2020 01:15:15 -0400
IronPort-SDR: vnipzEgeBMryh8aqiIV1NYlMIfchuavbYVO53soHUZEHi5MRRuuhe8Ro02cKZZQvaA+ZU9y6Dp
 s2te4M2JJ+lw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 22:15:15 -0700
IronPort-SDR: 4A+Ep2uNZhFSIL13xRPsKpcMQpqGFbH5NsdJtnhPTOSUiRRh4XFlkKNoZH4m2Eis00fz9h+e7Y
 r9Et+9CsRoHw==
X-IronPort-AV: E=Sophos;i="5.73,475,1583222400"; 
   d="scan'208";a="445770204"
Received: from svedanta-mobl1.amr.corp.intel.com (HELO han1-mobl3.jf.intel.com) ([10.254.69.224])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 22:15:15 -0700
From:   Tedd Ho-Jeong An <tedd.an@linux.intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Tedd Ho-Jeong An <tedd.an@intel.com>
Subject: [PATCH 1/2] btp: Update connect event structure
Date:   Thu,  4 Jun 2020 22:15:08 -0700
Message-Id: <20200605051509.10766-1-tedd.an@linux.intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Tedd Ho-Jeong An <tedd.an@intel.com>

This patch updates the connect event struct to align withe the btp spec.

  Opcode 0x82 - Device Connected event
    Controller Index:	<controller id>
    Event parameters:	Address_Type (1 octet)
			Address (6 octets)
			Connection Interval (2 octets)
			Connection Latency (2 octets)
			Supervision Timeout (2 octets)

  This event indicates that a device was connected.
---
 src/shared/btp.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/shared/btp.h b/src/shared/btp.h
index f0ac3a1ee..cc71a71df 100644
--- a/src/shared/btp.h
+++ b/src/shared/btp.h
@@ -259,6 +259,9 @@ struct btp_device_found_ev {
 struct btp_gap_device_connected_ev {
 	uint8_t address_type;
 	bdaddr_t address;
+	uint16_t connection_interval;
+	uint16_t connection_latency;
+	uint16_t supervision_timeout;
 } __packed;
 
 #define BTP_EV_GAP_DEVICE_DISCONNECTED		0x83
-- 
2.25.4

