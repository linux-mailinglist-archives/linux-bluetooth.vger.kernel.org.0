Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAEF63662DA
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Apr 2021 02:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233879AbhDUAHv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 20 Apr 2021 20:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233807AbhDUAHu (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 20 Apr 2021 20:07:50 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEEBAC06174A
        for <linux-bluetooth@vger.kernel.org>; Tue, 20 Apr 2021 17:07:17 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id w10so28034110pgh.5
        for <linux-bluetooth@vger.kernel.org>; Tue, 20 Apr 2021 17:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WUJEQZmIbzYIpNfgaOiKZszAjQ/uaNWppRm9k3vwwm8=;
        b=qs2D+XePGcFyaY8hbKXD76j0bai0/tBWfr+guqRSWvrJMDu7V0QaV/MiRaML/b5GEG
         8th8ncyyaVQL3tQ3DWaB+xGR3Ezkhy7nv1sHYNnuf7h06fiRCitpFq1/ZKyLrrCnoIFZ
         s8xY8PCbOWHqvHCaJUL7zIjYKrL7XEFVhF4moWbfcJK7vcdJaznKWMnrAIs7DmPhCHZW
         kdy7g3Ll6KYFr20T8GKhsqlgHQEg+oUBeTdAZUsKxycOgYaFNoVRRS3yC6yOkV4Ps49e
         YLjOZso5tcIQNe6jA9aYLJSrgGrFVAkHT1ZSRzbp7nXnYSjVGNxBOm/aoF9uys7j1g88
         NI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WUJEQZmIbzYIpNfgaOiKZszAjQ/uaNWppRm9k3vwwm8=;
        b=OekOghWubVFHmxa8A526147mfsmHz6ZPxgkeKUga+G1OsPeptLfJMjwvMG+WUbe7Og
         cUjh1i5UxlTEhchsufCnXmkByXZClo35aB7+GNyaRHEjyuclvvBVYRLaoEnxEx4/SftY
         Q2Dd4GC16nmtlqCNQvOuzdzUxG4Y8ErFnCN1PKfZ9cXfXj43cLpDe80sF1/eILrXxW/V
         OhRLiNTYRps5gYcm75qnscjbxrOP/80FXKOjfYP9HZEy5g0VBsVlo907vb8YJa1Z6sry
         PcLQMIAUbAAFkPkE+xd5KCFSdt7Xob0TWB+PjIYnRWkCYubAQxXvTVTCFAvyYyjS2sI5
         lfwg==
X-Gm-Message-State: AOAM533eVH2VEONE4o1us8EtJxH6qPf9UA5uokon31s/UMTLwOoMFAM5
        66oKmF4eK4wA+IUr8wegsXzdaR1PPvc=
X-Google-Smtp-Source: ABdhPJx/5w86NP2ToIXzTI2z2O2J8+nci+6MH+rZ2go1Zt7Esx6o2Sl5JcUM4jy0mM2O4HSEraO6IA==
X-Received: by 2002:a63:190b:: with SMTP id z11mr18893027pgl.314.1618963637080;
        Tue, 20 Apr 2021 17:07:17 -0700 (PDT)
Received: from han1-XPS-13-9350.hsd1.or.comcast.net ([2601:1c0:6a01:d830:2814:4d4c:dc67:d170])
        by smtp.gmail.com with ESMTPSA id w6sm138888pfj.85.2021.04.20.17.07.16
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 17:07:16 -0700 (PDT)
From:   Tedd Ho-Jeong An <hj.tedd.an@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [BlueZ v3] monitor: Fix the incorrect vendor name
Date:   Tue, 20 Apr 2021 17:07:15 -0700
Message-Id: <20210421000715.756127-1-hj.tedd.an@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Tedd Ho-Jeong An <tedd.an@intel.com>

This patch fixes the vendor name is alwasy shown as "Microsoft" for the
commands and Unknown name for vendor events.

< HCI Command: Microsoft Secure Send (0x3f|0x0009) plen 249
        Type: Data fragment (0x01)
> HCI Event: Command Complete (0x0e) plen 4
      Microsoft Secure Send (0x3f|0x0009) ncmd 31
        Status: Success (0x00)
---
 monitor/msft.h   |   6 +++
 monitor/packet.c | 132 ++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 114 insertions(+), 24 deletions(-)

diff --git a/monitor/msft.h b/monitor/msft.h
index a268f4bc7..9072c6ef8 100644
--- a/monitor/msft.h
+++ b/monitor/msft.h
@@ -24,6 +24,12 @@
 
 #include <stdint.h>
 
+struct msft_ext {
+	uint16_t opcode;
+	uint8_t  evt_prefix_len;
+	uint8_t  evt_prefix[32];
+} __attribute__ ((packed));
+
 struct vendor_ocf;
 struct vendor_evt;
 
diff --git a/monitor/packet.c b/monitor/packet.c
index d729a01cc..e43470e81 100644
--- a/monitor/packet.c
+++ b/monitor/packet.c
@@ -265,7 +265,7 @@ struct index_data {
 	uint8_t  type;
 	uint8_t  bdaddr[6];
 	uint16_t manufacturer;
-	uint16_t msft_opcode;
+	struct msft_ext msft_ext;
 	size_t   frame;
 };
 
@@ -3939,7 +3939,9 @@ void packet_monitor(struct timeval *tv, struct ucred *cred,
 			index_list[index].type = ni->type;
 			memcpy(index_list[index].bdaddr, ni->bdaddr, 6);
 			index_list[index].manufacturer = fallback_manufacturer;
-			index_list[index].msft_opcode = BT_HCI_CMD_NOP;
+			index_list[index].msft_ext.opcode = BT_HCI_CMD_NOP;
+			index_list[index].msft_ext.evt_prefix_len = 0;
+			memset(index_list[index].msft_ext.evt_prefix, 0, 32);
 		}
 
 		addr2str(ni->bdaddr, str);
@@ -4006,9 +4008,12 @@ void packet_monitor(struct timeval *tv, struct ucred *cred,
 				/*
 				 * Intel controllers that support the
 				 * Microsoft vendor extension are using
-				 * 0xFC1E for VsMsftOpCode.
+				 * 0xFC1E for VsMsftOpCode and 0x50 for event
+				 * code.
 				 */
-				index_list[index].msft_opcode = 0xFC1E;
+				index_list[index].msft_ext.opcode = 0xFC1E;
+				index_list[index].msft_ext.evt_prefix_len = 1;
+				index_list[index].msft_ext.evt_prefix[0] = 0x50;
 				break;
 			case 93:
 				/*
@@ -4016,7 +4021,16 @@ void packet_monitor(struct timeval *tv, struct ucred *cred,
 				 * Microsoft vendor extenions are using
 				 * 0xFCF0 for VsMsftOpCode.
 				 */
-				index_list[index].msft_opcode = 0xFCF0;
+				index_list[index].msft_ext.opcode = 0xFCF0;
+				index_list[index].msft_ext.evt_prefix_len = 8;
+				index_list[index].msft_ext.evt_prefix[0] = 0x23;
+				index_list[index].msft_ext.evt_prefix[1] = 0x79;
+				index_list[index].msft_ext.evt_prefix[2] = 0x54;
+				index_list[index].msft_ext.evt_prefix[3] = 0x33;
+				index_list[index].msft_ext.evt_prefix[4] = 0x77;
+				index_list[index].msft_ext.evt_prefix[5] = 0x88;
+				index_list[index].msft_ext.evt_prefix[6] = 0x97;
+				index_list[index].msft_ext.evt_prefix[7] = 0x68;
 				break;
 			}
 		}
@@ -9323,19 +9337,20 @@ static const char *get_supported_command(int bit)
 	return NULL;
 }
 
-static const char *current_vendor_str(void)
+static const char *current_vendor_str(uint16_t ocf)
 {
 	uint16_t manufacturer, msft_opcode;
 
 	if (index_current < MAX_INDEX) {
 		manufacturer = index_list[index_current].manufacturer;
-		msft_opcode = index_list[index_current].msft_opcode;
+		msft_opcode = index_list[index_current].msft_ext.opcode;
 	} else {
 		manufacturer = fallback_manufacturer;
 		msft_opcode = BT_HCI_CMD_NOP;
 	}
 
-	if (msft_opcode != BT_HCI_CMD_NOP)
+	if (msft_opcode != BT_HCI_CMD_NOP &&
+				cmd_opcode_ocf(msft_opcode) == ocf)
 		return "Microsoft";
 
 	switch (manufacturer) {
@@ -9350,13 +9365,34 @@ static const char *current_vendor_str(void)
 	return NULL;
 }
 
+static const char *current_vendor_evt_str(uint8_t evt)
+{
+	uint16_t manufacturer;
+
+	if (index_current < MAX_INDEX)
+		manufacturer = index_list[index_current].manufacturer;
+	else
+		manufacturer = fallback_manufacturer;
+
+	switch (manufacturer) {
+	case 2:
+		return "Intel";
+	case 15:
+		return "Broadcom";
+	case 93:
+		return "Realtek";
+	}
+
+	return NULL;
+}
+
 static const struct vendor_ocf *current_vendor_ocf(uint16_t ocf)
 {
 	uint16_t manufacturer, msft_opcode;
 
 	if (index_current < MAX_INDEX) {
 		manufacturer = index_list[index_current].manufacturer;
-		msft_opcode = index_list[index_current].msft_opcode;
+		msft_opcode = index_list[index_current].msft_ext.opcode;
 	} else {
 		manufacturer = fallback_manufacturer;
 		msft_opcode = BT_HCI_CMD_NOP;
@@ -9378,18 +9414,12 @@ static const struct vendor_ocf *current_vendor_ocf(uint16_t ocf)
 
 static const struct vendor_evt *current_vendor_evt(uint8_t evt)
 {
-	uint16_t manufacturer, msft_opcode;
+	uint16_t manufacturer;
 
-	if (index_current < MAX_INDEX) {
+	if (index_current < MAX_INDEX)
 		manufacturer = index_list[index_current].manufacturer;
-		msft_opcode = index_list[index_current].msft_opcode;
-	} else {
+	else
 		manufacturer = fallback_manufacturer;
-		msft_opcode = BT_HCI_CMD_NOP;
-	}
-
-	if (msft_opcode != BT_HCI_CMD_NOP)
-		return NULL;
 
 	switch (manufacturer) {
 	case 2:
@@ -9401,6 +9431,27 @@ static const struct vendor_evt *current_vendor_evt(uint8_t evt)
 	return NULL;
 }
 
+static const struct vendor_evt *current_vendor_msft_evt(const void *data,
+							uint8_t size)
+{
+	uint8_t *prefix, prefix_len;
+
+	if (index_current < MAX_INDEX) {
+		prefix_len = index_list[index_current].msft_ext.evt_prefix_len;
+		prefix = index_list[index_current].msft_ext.evt_prefix;
+	} else
+		return NULL;
+
+	/* MSFT extension events start with the MSFT event prefix which is
+	 * defined by the vendor and followed by the MSFT event code.
+	 */
+	if (size > prefix_len && !memcmp(data, prefix, prefix_len)) {
+		return msft_vendor_evt();
+	}
+
+	return NULL;
+}
+
 static void inquiry_complete_evt(const void *data, uint8_t size)
 {
 	const struct bt_hci_evt_inquiry_complete *evt = data;
@@ -9573,7 +9624,7 @@ static void cmd_complete_evt(const void *data, uint8_t size)
 			const struct vendor_ocf *vnd = current_vendor_ocf(ocf);
 
 			if (vnd) {
-				const char *str = current_vendor_str();
+				const char *str = current_vendor_str(ocf);
 
 				if (str) {
 					snprintf(vendor_str, sizeof(vendor_str),
@@ -9665,7 +9716,7 @@ static void cmd_status_evt(const void *data, uint8_t size)
 			const struct vendor_ocf *vnd = current_vendor_ocf(ocf);
 
 			if (vnd) {
-				const char *str = current_vendor_str();
+				const char *str = current_vendor_str(ocf);
 
 				if (str) {
 					snprintf(vendor_str, sizeof(vendor_str),
@@ -11012,13 +11063,46 @@ static void le_meta_event_evt(const void *data, uint8_t size)
 
 static void vendor_evt(const void *data, uint8_t size)
 {
-	uint8_t subevent = *((const uint8_t *) data);
+	uint8_t subevent;
 	struct subevent_data vendor_data;
 	char vendor_str[150];
-	const struct vendor_evt *vnd = current_vendor_evt(subevent);
+	const struct vendor_evt *vnd;
+
+	/* For MSFT Extension event only */
+	vnd = current_vendor_msft_evt(data, size);
+	if (vnd) {
+		snprintf(vendor_str, sizeof(vendor_str),
+					"Microsoft %s", vnd->str);
+		print_indent(6, COLOR_HCI_EVENT, "", vendor_str, COLOR_OFF,
+					" length: %u", size);
+
+		if (!vnd->evt_func) {
+			packet_hexdump(data, size);
+			return;
+		}
+
+		if (vnd->evt_fixed) {
+			if (size != vnd->evt_size) {
+				print_text(COLOR_ERROR, "invalid packet size");
+				packet_hexdump(data, size);
+				return;
+			}
+		} else {
+			if (size < vnd->evt_size) {
+				print_text(COLOR_ERROR, "too short packet");
+				packet_hexdump(data, size);
+				return;
+			}
+		}
+
+		vnd->evt_func(data, size);
+		return;
+	}
 
+	subevent = *((const uint8_t *) data);
+	vnd = current_vendor_evt(subevent);
 	if (vnd) {
-		const char *str = current_vendor_str();
+		const char *str = current_vendor_evt_str(subevent);
 
 		if (str) {
 			snprintf(vendor_str, sizeof(vendor_str),
@@ -11419,7 +11503,7 @@ void packet_hci_command(struct timeval *tv, struct ucred *cred, uint16_t index,
 			const struct vendor_ocf *vnd = current_vendor_ocf(ocf);
 
 			if (vnd) {
-				const char *str = current_vendor_str();
+				const char *str = current_vendor_str(ocf);
 
 				if (str) {
 					snprintf(vendor_str, sizeof(vendor_str),
-- 
2.25.1

