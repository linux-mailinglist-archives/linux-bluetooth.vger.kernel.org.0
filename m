Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9380F5B0CF6
	for <lists+linux-bluetooth@lfdr.de>; Wed,  7 Sep 2022 21:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbiIGTPN (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 7 Sep 2022 15:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiIGTPI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 7 Sep 2022 15:15:08 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D9946CF5E
        for <linux-bluetooth@vger.kernel.org>; Wed,  7 Sep 2022 12:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662578106; x=1694114106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FbVrbF50J5aXWFbdzsmp2nJ6EfgMOS2vh4yrlSWxq38=;
  b=VgRoUz232eVEU3n1cK0xM947lWNFVKkymRH6hhQqjXNt9ahsFz5nMTij
   L3pngKLVZdTxhBlLG25KBsosKJQiusE7tW5+maf7Q/Lx6mT9Pio12xCeh
   JDub7ij/iSwD5fR11X/R34AR3Mk6DbKLlrYqCW9skosWTYd3mSINXZy74
   S7+YP0PDFA9sI/ZGYyZCoNdPAN40MTIhumBX0q1b4aaPSwlB2rWUu57ea
   erZUxFXVRuA0uPL0SNJJnqeqcf5gMvV4FSFkOasNfedwRqq8wij16llpD
   VQH/FXQtJpYcarVeBxYg4LzcMrll2vDFBxovKdPGyFlrAAgaW4ImeA3wI
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="360938877"
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208";a="360938877"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 12:15:02 -0700
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208";a="644755644"
Received: from jsanch3-desk4.amr.corp.intel.com (HELO bgi1-mobl2.amr.corp.intel.com) ([10.212.92.69])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 12:15:02 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     luiz.dentz@gmail.com, brian.gix@intel.com
Subject: [PATCH BlueZ 2/2] Bluetooth: Add mesh MGMT cmds/events to btmon parser
Date:   Wed,  7 Sep 2022 12:14:50 -0700
Message-Id: <20220907191450.38262-2-brian.gix@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907191450.38262-1-brian.gix@intel.com>
References: <20220907191450.38262-1-brian.gix@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Signed-off-by: Brian Gix <brian.gix@intel.com>
---
 monitor/packet.c | 111 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/monitor/packet.c b/monitor/packet.c
index 7447e1565..9d4a5e50d 100644
--- a/monitor/packet.c
+++ b/monitor/packet.c
@@ -14191,6 +14191,74 @@ static void mgmt_remove_adv_monitor_patterns_rsp(const void *data,
 	print_field("Handle: %d", handle);
 }
 
+static void mgmt_set_mesh_receiver_cmd(const void *data, uint16_t size)
+{
+	uint8_t enable = get_u8(data);
+	uint16_t window = get_le16(data + 1);
+	uint16_t period = get_le16(data + 3);
+	uint8_t num_ad_types = get_u8(data + 5);
+	const uint8_t *ad_types = data + 6;
+
+	print_field("Enable: %d", enable);
+	print_field("Window: %d", window);
+	print_field("Period: %d", period);
+	print_field("Num AD Types: %d", num_ad_types);
+	size -= 6;
+
+	while (size--)
+		print_field("  AD Type: %d", *ad_types++);
+}
+
+static void mgmt_read_mesh_features_rsp(const void *data, uint16_t size)
+{
+	uint16_t index = get_le16(data);
+	uint8_t max_handles = get_u8(data + 2);
+	uint8_t used_handles = get_u8(data + 3);
+	const uint8_t *handles = data + 4;
+
+	print_field("Index: %d", index);
+	print_field("Max Handles: %d", max_handles);
+	print_field("Used Handles: %d", used_handles);
+	size -= 4;
+
+	while (size--)
+		print_field("  Used Handle: %d", *handles++);
+}
+
+static void mgmt_mesh_send_cmd(const void *data, uint16_t size)
+{
+	const uint8_t *addr = data;
+	uint8_t addr_type = get_u8(data + 6);
+	uint64_t instant = get_le64(data + 7);
+	uint16_t delay = get_le16(data + 15);
+	uint8_t cnt = get_u8(data + 17);
+	uint8_t adv_data_len = get_u8(data + 18);
+
+	data += 19;
+	size -= 19;
+	print_bdaddr(addr);
+	print_field("Addr Type: %d", addr_type);
+	print_field("Instant: 0x%16.16" PRIx64, instant);
+	print_field("Delay: %d", delay);
+	print_field("Count: %d", cnt);
+	print_field("Data Length: %d", adv_data_len);
+	print_hex_field("Data: ", data, size);
+}
+
+static void mgmt_mesh_send_rsp(const void *data, uint16_t size)
+{
+	uint8_t handle = get_u8(data);
+
+	print_field("Handle: %d", handle);
+}
+
+static void mgmt_mesh_send_cancel_cmd(const void *data, uint16_t size)
+{
+	uint8_t handle = get_u8(data);
+
+	print_field("Handle: %d", handle);
+}
+
 struct mgmt_data {
 	uint16_t opcode;
 	const char *str;
@@ -14448,6 +14516,18 @@ static const struct mgmt_data mgmt_command_table[] = {
 				mgmt_add_adv_monitor_patterns_rssi_cmd, 8,
 									false,
 				mgmt_add_adv_monitor_patterns_rsp, 2, true},
+	{ 0x0057, "Set Mesh Receiver",
+				mgmt_set_mesh_receiver_cmd, 6, false,
+				mgmt_null_rsp, 0, true},
+	{ 0x0058, "Read Mesh Features",
+				mgmt_null_cmd, 0, true,
+				mgmt_read_mesh_features_rsp, 4, false},
+	{ 0x0059, "Mesh Send",
+				mgmt_mesh_send_cmd, 19, false,
+				mgmt_mesh_send_rsp, 1, true},
+	{ 0x0056, "Mesh Send Cancel",
+				mgmt_mesh_send_cancel_cmd, 1, true,
+				mgmt_null_rsp, 0, true},
 	{ }
 };
 
@@ -14945,6 +15025,33 @@ static void mgmt_adv_monitor_device_lost_evt(const void *data, uint16_t size)
 	print_field("Addr Type: %d", addr_type);
 }
 
+static void mgmt_mesh_device_found_evt(const void *data, uint16_t size)
+{
+	const uint8_t *addr = data;
+	uint8_t addr_type = get_u8(data + 6);
+	int8_t rssi = get_s8(data + 7);
+	uint64_t instant = get_le64(data + 8);
+	uint32_t flags = get_le32(data + 16);
+	uint16_t eir_len = get_le16(data + 20);
+	const uint8_t *eir_data = data + 22;
+
+	print_bdaddr(addr);
+	print_field("Addr Type: %d", addr_type);
+	print_field("RSSI: %d", rssi);
+	print_field("Instant: 0x%16.16" PRIx64, instant);
+	mgmt_print_device_flags(flags);
+	print_field("EIR Length: %d", eir_len);
+	size -= 22;
+	print_hex_field("EIR Data: ", eir_data, size);
+}
+
+static void mgmt_mesh_packet_cmplt_evt(const void *data, uint16_t size)
+{
+	uint8_t handle = get_u8(data);
+
+	print_field("Handle: %d", handle);
+}
+
 static const struct mgmt_data mgmt_event_table[] = {
 	{ 0x0001, "Command Complete",
 			mgmt_command_complete_evt, 3, false },
@@ -15038,6 +15145,10 @@ static const struct mgmt_data mgmt_event_table[] = {
 			mgmt_adv_monitor_device_found_evt, 16, false },
 	{ 0x0030, "Controller Resumed",
 			mgmt_adv_monitor_device_lost_evt, 9, true },
+	{ 0x0031, "Mesh Device Found",
+			mgmt_mesh_device_found_evt, 22, false },
+	{ 0x0032, "Mesh Packet Complete",
+			mgmt_mesh_packet_cmplt_evt, 1, true },
 	{ }
 };
 
-- 
2.37.2

