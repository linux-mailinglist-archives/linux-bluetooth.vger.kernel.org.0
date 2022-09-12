Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49DD55B5A63
	for <lists+linux-bluetooth@lfdr.de>; Mon, 12 Sep 2022 14:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiILMpt (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 12 Sep 2022 08:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbiILMpn (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 12 Sep 2022 08:45:43 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A629F167F3
        for <linux-bluetooth@vger.kernel.org>; Mon, 12 Sep 2022 05:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662986742; x=1694522742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kBQRHwmj5jBLZDQZaifMfbtxMnVSmpvncYMBxNKp0GQ=;
  b=hzMt+yPwAqroy0BcAZ/tj0TvXgL1u2xsJswW5rOyBzJc3+kH4qOpQH7p
   SJkNwmezEWGsmVIpo5ewyg3kpPssehRz7Z3Ils1hoSCgdWqdOm14/3h/V
   BzNiMHpgDW3cXqGaan4zPOM6Uj4XrXNrQDbD/yvS7PxVnBDMHpBX2R+18
   GpuXw241N/rIOHMpLWjJ8DDuOTc0Xjqti0p3KaH31zEHqBLRkUZH/m0nv
   1lisjkBmerGPzz+tAyGUfzhXoUXaQbYcC+HZp1uUiaDfjVQUOukQwfqjq
   XcyMqSV5YJq3vI/IT2UrakJNZv1n72vNPTajBZ1/z3HrCmwZjJ33sUnrx
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="284875210"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="284875210"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 05:45:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="758382854"
Received: from bsblt022.iind.intel.com ([10.224.186.21])
  by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2022 05:45:40 -0700
From:   Sathish Narasimman <sathish.narasimman@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Sathish Narasimman <sathish.narasimman@intel.com>
Subject: [PATCH BlueZ 4/4] monitor/att: Add decoding support for Volume Control Serice
Date:   Mon, 12 Sep 2022 18:16:57 +0530
Message-Id: <20220912124657.404551-5-sathish.narasimman@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220912124657.404551-1-sathish.narasimman@intel.com>
References: <20220912124657.404551-1-sathish.narasimman@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This adds decoding support for VCS attributes

> ACL Data RX: Handle 3585 flags 0x02 dlen 7
      ATT: Read Request (0x0a) len 2
        Handle: 0x0017 Type: Volume State (0x2b7d)
< ACL Data TX: Handle 3585 flags 0x00 dlen 8
      ATT: Read Response (0x0b) len 3
        Value: 000000
        Handle: 0x0017 Type: Volume State (0x2b7d)
            Volume Setting: 0
            Not Muted: 0
            Change Counter: 0
> HCI Event: Number of Completed Packets (0x13) plen 5
        Num handles: 1
        Handle: 3585 Address: 49:71:FC:C0:66:C6 (Resolvable)
        Count: 1
> ACL Data RX: Handle 3585 flags 0x02 dlen 7
      ATT: Read Request (0x0a) len 2
        Handle: 0x001c Type: Volume Flags (0x2b7f)
< ACL Data TX: Handle 3585 flags 0x00 dlen 6
      ATT: Read Response (0x0b) len 1
        Value: 01
        Handle: 0x001c Type: Volume Flags (0x2b7f)
            Volume Falg: 1
---
 monitor/att.c | 159 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/monitor/att.c b/monitor/att.c
index b7470f7a2ff4..3c1ff2e2aaa0 100644
--- a/monitor/att.c
+++ b/monitor/att.c
@@ -1590,6 +1590,162 @@ static void pac_context_notify(const struct l2cap_frame *frame)
 	print_pac_context(frame);
 }
 
+static void print_vcs_state(const struct l2cap_frame *frame)
+{
+	uint8_t vol_set, mute, chng_ctr;
+
+	if (!l2cap_frame_get_u8((void *)frame, &vol_set)) {
+		print_text(COLOR_ERROR, "Volume Settings: invalid size");
+		goto done;
+	}
+	print_field("    Volume Setting: %u", vol_set);
+
+	if (!l2cap_frame_get_u8((void *)frame, &mute)) {
+		print_text(COLOR_ERROR, "Mute Filed: invalid size");
+		goto done;
+	}
+
+	switch (mute) {
+	case 0x00:
+		print_field("    Not Muted: %u", mute);
+		break;
+	case 0x01:
+		print_field("    Muted: %u", mute);
+		break;
+	default:
+		print_field("    Unknown Mute Value: %u", mute);
+		break;
+	}
+
+	if (!l2cap_frame_get_u8((void *)frame, &chng_ctr)) {
+		print_text(COLOR_ERROR, "Change Counter: invalid size");
+		goto done;
+	}
+	print_field("    Change Counter: %u", chng_ctr);
+
+done:
+	if (frame->size)
+		print_hex_field("  Data", frame->data, frame->size);
+}
+
+static void vol_state_read(const struct l2cap_frame *frame)
+{
+	print_vcs_state(frame);
+}
+
+static void vol_state_notify(const struct l2cap_frame *frame)
+{
+	print_vcs_state(frame);
+}
+
+static bool vcs_config_cmd(const struct l2cap_frame *frame)
+{
+	if (!l2cap_frame_print_u8((void *)frame, "    Change Counter"))
+		return false;
+
+	return true;
+}
+
+static bool vcs_absolute_cmd(const struct l2cap_frame *frame)
+{
+	if (!l2cap_frame_print_u8((void *)frame, "    Change Counter"))
+		return false;
+
+	if (!l2cap_frame_print_u8((void *)frame, "    Volume Setting"))
+		return false;
+
+	return true;
+}
+
+#define ASE_CMD(_op, _desc, _func) \
+[_op] = { \
+	.desc = _desc, \
+	.func = _func, \
+}
+
+struct vcs_cmd {
+	const char *desc;
+	bool (*func)(const struct l2cap_frame *frame);
+} vcs_cmd_table[] = {
+	/* Opcode = 0x00 (Relative Volume Down) */
+	ASE_CMD(0x00, "Relative Volume Down", vcs_config_cmd),
+	/* Opcode = 0x01 (Relative Volume Up) */
+	ASE_CMD(0x01, "Relative Volume Up", vcs_config_cmd),
+	/* Opcode = 0x02 (Unmute/Relative Volume Down) */
+	ASE_CMD(0x02, "Unmute/Relative Volume Down", vcs_config_cmd),
+	/* Opcode = 0x03 (Unmute/Relative Volume Up) */
+	ASE_CMD(0x03, "Unmute/Relative Volume Up", vcs_config_cmd),
+	/* Opcode = 0x04 (Set Absolute Volume) */
+	ASE_CMD(0x04, "Set Absolute Volume", vcs_absolute_cmd),
+	/* Opcode = 0x05 (Unmute) */
+	ASE_CMD(0x05, "Unmute", vcs_config_cmd),
+	/* Opcode = 0x06 (Mute) */
+	ASE_CMD(0x06, "Mute", vcs_config_cmd),
+};
+
+static struct vcs_cmd *vcs_get_cmd(uint8_t op)
+{
+	if (op > ARRAY_SIZE(vcs_cmd_table))
+		return NULL;
+
+	return &vcs_cmd_table[op];
+}
+
+static void print_vcs_cmd(const struct l2cap_frame *frame)
+{
+	uint8_t op;
+	struct vcs_cmd *cmd;
+
+	if (!l2cap_frame_get_u8((void *)frame, &op)) {
+		print_text(COLOR_ERROR, "opcode: invalid size");
+		goto done;
+	}
+
+	cmd = vcs_get_cmd(op);
+	if (!cmd) {
+		print_field("    Opcode: Reserved (0x%2.2x)", op);
+		goto done;
+	}
+
+	print_field("    Opcode: %s (0x%2.2x)", cmd->desc, op);
+	if (!cmd->func(frame))
+		print_field("    Unknown Opcode");
+
+done:
+	if (frame->size)
+		print_hex_field("  Data", frame->data, frame->size);
+}
+
+static void vol_cp_write(const struct l2cap_frame *frame)
+{
+	print_vcs_cmd(frame);
+}
+
+static void print_vcs_flag(const struct l2cap_frame *frame)
+{
+	uint8_t vol_flag;
+
+	if (!l2cap_frame_get_u8((void *)frame, &vol_flag)) {
+		print_text(COLOR_ERROR, "Volume Flag: invalid size");
+		goto done;
+	}
+	print_field("    Volume Falg: %u", vol_flag);
+
+done:
+	if (frame->size)
+		print_hex_field("  Data", frame->data, frame->size);
+}
+
+static void vol_flag_read(const struct l2cap_frame *frame)
+{
+	print_vcs_flag(frame);
+}
+
+static void vol_flag_notify(const struct l2cap_frame *frame)
+{
+	print_vcs_flag(frame);
+}
+
 #define GATT_HANDLER(_uuid, _read, _write, _notify) \
 { \
 	.uuid = { \
@@ -1617,6 +1773,9 @@ struct gatt_handler {
 	GATT_HANDLER(0x2bcc, pac_loc_read, NULL, pac_loc_notify),
 	GATT_HANDLER(0x2bcd, pac_context_read, NULL, pac_context_notify),
 	GATT_HANDLER(0x2bce, pac_context_read, NULL, pac_context_notify),
+	GATT_HANDLER(0x2b7d, vol_state_read, NULL, vol_state_notify),
+	GATT_HANDLER(0x2b7e, NULL, vol_cp_write, NULL),
+	GATT_HANDLER(0x2b7f, vol_flag_read, NULL, vol_flag_notify),
 };
 
 static struct gatt_handler *get_handler(struct gatt_db_attribute *attr)
-- 
2.25.1

