Return-Path: <linux-bluetooth+bounces-18629-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKrlDKeKemkE7gEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18629-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 23:16:07 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEECA9766
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 23:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AAD43020EFC
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 22:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99527344D81;
	Wed, 28 Jan 2026 22:15:58 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFAF344D87
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 22:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769638558; cv=none; b=IegICyOF+UucHy5kmbKlLtEQeOpo2eGFrLO/U9onRMcNtd3caLYDvG2+Ygl2M80u/dpCsT8XLqR/MP1fXGh5uedcfev8aO0mT52XD7L3NcVZQV86lFH3uwZdUxCb4YHtnyvdgGf/7S8L5kIRLuC306L2MvIab1YuwG20J/azvns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769638558; c=relaxed/simple;
	bh=7W5v3JqJfkKyE/N0ZPnKOKFOQ//UpkLWwnCuxksvFJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZv/jbg9x/TXYfMKfMKIjIfhFoDlZG2sQbebA8CSqtpb6TS09AVdqY6PUeq2x3vO4xawdR/uDLY3q+4t0FjZzHTElYyHjmM435roMY3MHMc3uKnSyjQqYL6/pyhWgal92dU/YyB2hemNDkV8MHCRVnHf/+pKdYQD2zVkPCHByXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCD724440D;
	Wed, 28 Jan 2026 22:15:48 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Cc: Paul Otto <potto@ieee.org>
Subject: [PATCH BlueZ v7 15/16] client: Expand GATT submenu documentation
Date: Wed, 28 Jan 2026 23:12:05 +0100
Message-ID: <20260128221536.2319084-16-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128221536.2319084-1-hadess@hadess.net>
References: <20260128221536.2319084-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieeggeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeelieffleeuuedtffethfejgfeutdeutdejudethfetiedthfdugedtkeeigeegteenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemlegsvdelmegtugefieemieekfhgumegttdelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemlegsvdelmegtugefieemieekfhgumegttdelfedphhgvlhhopeholhhimhhpihgtpdhmrghilhhfrhhomhephhgruggvshhssehhrgguvghsshdrnhgvthdpqhhiugepveevffejvdeggeegtdffpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepvddprhgtphhtthhopehlihhnuhigqdgslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhothhtohesihgvvggvrdhorhhg
X-GND-State: clean
X-GND-Score: -100
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[hadess.net];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18629-lists,linux-bluetooth=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[hadess@hadess.net,linux-bluetooth@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ieee.org:email]
X-Rspamd-Queue-Id: CAEECA9766
X-Rspamd-Action: no action

From: Paul Otto <potto@ieee.org>

From:
https://github.com/potto216/bluez/blob/master/client/bluetoothctl-gatt.rst

Closes: https://github.com/bluez/bluez/issues/747
---
 doc/bluetoothctl-gatt.rst | 79 +++++++++++++++++++++++++++------------
 1 file changed, 56 insertions(+), 23 deletions(-)

diff --git a/doc/bluetoothctl-gatt.rst b/doc/bluetoothctl-gatt.rst
index b2f45d56c7cb..6c72302ae935 100644
--- a/doc/bluetoothctl-gatt.rst
+++ b/doc/bluetoothctl-gatt.rst
@@ -25,147 +25,180 @@ Generic Attribute Commands
 list-attributes
 ---------------
 
-List attributes.
+Lists the attributes of either the local device or a remote device,
+encompassing services, characteristics, and handles. This command provides
+a comprehensive overview of the available Bluetooth attributes, which can
+be further interacted with using other commands.
 
-:Usage: **> list-attributes <attribute/UUID>**
+:Usage: **> list-attributes <attribute/UUID> <dev/local>**
 
 select-attribute
 ----------------
 
-Select attribute.
+Selects a specific attribute on either the local or remote device for
+subsequent operations. Before you can read or write to an attribute, you
+must select it with this command. This establishes a context for many
+other commands (read, write, notify, etc.), specifying the attribute
+they should operate on.
 
-:Usage: **> select-attribute <attribute/UUID>**
+:Usage: **> select-attribute <attribute/UUID/local>**
 
 attribute-info
 --------------
 
-Select attribute.
+Displays detailed information about an attribute. If no attribute or
+UUID is specified, it shows information about the currently selected
+attribute. This command is useful for understanding the properties and
+capabilities of an attribute.
 
 :Usage: **> attribute-info [attribute/UUID]**
 
 read
 ----
 
-Read attribute value.
+Reads the value of an attribute. Requires that an attribute be selected
+beforehand with select-attribute. The optional offset parameter can be
+used for attributes that allow partial reads.
 
 :Usage: **> read [offset]**
 
 write
 -----
 
-Write attribute value.
+Writes a value to an attribute. This command necessitates that an attribute
+be selected in advance using select-attribute. Data must be provided in
+hexadecimal format. Optional offset and type parameters can accommodate
+specific write requirements.
 
 :Usage: **> write <data=xx xx ...> [offset] [type]**
 
 acquire-write
 -------------
 
-Acquire Write file descriptor.
+Acquires a Write file descriptor for a previously selected attribute. This
+is useful for applications that need a file descriptor to perform
+write operations.
 
 :Usage: **> acquire-write**
 
 release-write
 -------------
 
-Release Write file descriptor.
+Releases the Write file descriptor acquired with acquire-write. This
+command is necessary to clean up resources after you're done with the
+write operation.
 
 :Usage: **> release-write**
 
 acquire-notify
 --------------
 
-Acquire Notify file descriptor.
+Acquires a Notify file descriptor for a previously selected attribute.
+This enables applications to listen for notifications on attribute
+value changes.
 
 :Usage: **> acquire-notify**
 
 release-notify
 --------------
 
-Release Notify file descriptor.
+Releases the Notify file descriptor obtained with acquire-notify. Ensures
+resources are freed once notification listening is no longer needed.
 
 :Usage: **> release-notify**
 
 notify
 ------
 
-Notify attribute value.
+Enables or disables notifications for attribute value changes. Before
+this command can be used, the relevant attribute must be selected. This
+command allows applications to be notified of attribute changes without
+polling.
 
 :Usage: **> notify <on/off>**
 
 clone
 -----
 
-Clone a device or attribute.
+Creates a clone of a device or attribute. This can be useful for creating
+a backup or working with a copy for testing purposes.
 
 :Usage: **> clone [dev/attribute/UUID]**
 
 register-application
 --------------------
 
-Register application.
+Registers a new application with the Bluetooth system, allowing for the
+management of services, characteristics, and descriptors under this
+application.
 
 :Usage: **> register-application [UUID ...]**
 
 unregister-application
 ----------------------
 
-Unregister application
+Removes a previously registered application from the Bluetooth system.
 
 :Usage: **> unregister-application**
 
 register-service
 ----------------
 
-Register application service.
+Adds a new service under a registered application. This command is
+crucial for defining new services that devices can offer.
 
 :Usage: **> register-service <UUID> [handle]**
 
 unregister-service
 ------------------
 
-Unregister application service
+Removes a service from a registered application, effectively ceasing
+its availability.
 
 :Usage: **> unregister-service <UUID/object>**
 
 register-includes
 -----------------
 
-Register as Included service.
+Marks a service as included within another service, allowing for
+service hierarchies and complex service structures.
 
 :Usage: **>r egister-includes <UUID> [handle]**
 
 unregister-includes
 -------------------
 
-Unregister Included service.
+Removes an included service relationship, simplifying the service structure.
 
 :Usage: **> unregister-includes <Service-UUID><Inc-UUID>**
 
 register-characteristic
 -----------------------
 
-Register service characteristic.
+Introduces a new characteristic under a service, specifying its properties
+and access permissions with flags.
 
 :Usage: **> register-characteristic <UUID> <Flags=read,write,notify...> [handle]**
 
 unregister-characteristic
 -------------------------
 
-Unregister service characteristic.
+Eliminates a characteristic from a service, removing its functionality.
 
 :Usage: **> unregister-characteristic <UUID/object>**
 
 register-descriptor
 -------------------
 
-Register characteristic descriptor.
+Adds a descriptor to a characteristic, further defining its behavior and
+access controls.
 
 :Usage: **> register-descriptor <UUID> <Flags=read,write...> [handle]**
 
 unregister-descriptor
 ---------------------
 
-Unregister characteristic descriptor.
+Removes a descriptor from a characteristic, simplifying its behavior.
 
 :Usage: **> unregister-descriptor <UUID/object>**
 
-- 
2.52.0


