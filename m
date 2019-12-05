Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2E6114564
	for <lists+linux-bluetooth@lfdr.de>; Thu,  5 Dec 2019 18:08:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729894AbfLERIU (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 5 Dec 2019 12:08:20 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:44658 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729711AbfLERIU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 5 Dec 2019 12:08:20 -0500
Received: by mail-ua1-f67.google.com with SMTP id d6so1588831uam.11
        for <linux-bluetooth@vger.kernel.org>; Thu, 05 Dec 2019 09:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rqa3jh+6LIF8YzAGtK9fK9ZOaVj+sTsIrw+GWH4Cjrg=;
        b=Uyz63hAn345BJ8LJhhZZAoGPJVDMxd0b5PnxrN2YnD4IDq28X3+9E09E39DF1q4+ju
         q+UyCJ2bo/PF7yemR6x3EYpALQLPxsot3gaq2sud8tYLik9tdF9t2ETd3nj9jPMwEpZ2
         9FBCp3cFEG/RUTiHRop7+bGuUnEPXS3EZIo/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rqa3jh+6LIF8YzAGtK9fK9ZOaVj+sTsIrw+GWH4Cjrg=;
        b=ahSHl8W/NA6dHRD4wSAxZoFdHCXwaVWsvLhW4+m2j5cNDcQ1C+6DanAVU4DsX8BO8T
         X5BENCVX6O67qvVkOguUXuYz1fkFASKd2M9Ki2+fs/7BIeEPwabx/lC3DQqdwV5oEtL8
         raBRVRdeDZd0XscQT5unC16aSzraf+zKVIdr5pTL3xze81xmsubRQDqa4n9Md32EBn1i
         PRXyyHxdIxDutTNGUrRDjy/IIR31WDqR0Uu39Y9g2Z2ONDPgr/U1e5FakcOk567RUHYg
         1JZ1SWvWykX0lSQtaMgB5mssqwVofX8+fqpYjsbD7LTxasqbuJ7qIs9gL1a05WvlU1p+
         8AIA==
X-Gm-Message-State: APjAAAUYBZ1lNNMrVAaU4+wAXW4eICgy0OCuE06M2E8C61VG8apA8HY0
        BPSMfWfG3iJ2aM1REqjlsc66Qg6fXRY=
X-Google-Smtp-Source: APXvYqx36GUcJd/FkO8U6NTPjNsHUi4/WaXyPjtUqeL7TbiapdDPtADh3fQE/1Fio2UcNtH+DHDfFw==
X-Received: by 2002:ab0:30eb:: with SMTP id d11mr8301445uam.67.1575565698348;
        Thu, 05 Dec 2019 09:08:18 -0800 (PST)
Received: from alain.us-east1-b.c.cloudtop-prod.google.com.internal (239.145.196.35.bc.googleusercontent.com. [35.196.145.239])
        by smtp.gmail.com with ESMTPSA id h2sm4583112vkn.15.2019.12.05.09.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 09:08:03 -0800 (PST)
From:   Alain Michaud <alainm@chromium.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Alain Michaud <alainm@chromium.org>
Subject: [RFC v2] Adding support for blocking keys and mgmt tests.
Date:   Thu,  5 Dec 2019 17:07:31 +0000
Message-Id: <20191205170731.118286-1-alainm@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Here's a newer version with most of your feedback addressed.  Others
responses sent inline in the v1.

---
 lib/mgmt.h       | 17 +++++++++++++
 src/adapter.c    | 65 +++++++++++++++++++++++++++++++++++++++++++++++-
 unit/test-mgmt.c | 33 ++++++++++++++++++++++++
 3 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/lib/mgmt.h b/lib/mgmt.h
index 570dec997..3e2e26e68 100644
--- a/lib/mgmt.h
+++ b/lib/mgmt.h
@@ -583,6 +583,23 @@ struct mgmt_cp_set_phy_confguration {
 	uint32_t	selected_phys;
 } __packed;
 
+#define MGMT_OP_SET_BLOCKED_KEYS	0x0046
+
+#define HCI_BLOCKED_KEY_TYPE_LINKKEY	0x00
+#define HCI_BLOCKED_KEY_TYPE_LTK		0x01
+#define HCI_BLOCKED_KEY_TYPE_IRK		0x02
+
+struct mgmt_blocked_key_info {
+	uint8_t type;
+	uint8_t val[16];
+} __packed;
+
+struct mgmt_cp_set_blocked_keys {
+	uint16_t key_count;
+	struct mgmt_blocked_key_info keys[0];
+} __packed;
+#define MGMT_OP_SET_BLOCKED_KEYS_SIZE 0
+
 
 #define MGMT_EV_CMD_COMPLETE		0x0001
 struct mgmt_ev_cmd_complete {
diff --git a/src/adapter.c b/src/adapter.c
index cef25616f..f571961bb 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -99,10 +99,25 @@
 #define DISTANCE_VAL_INVALID	0x7FFF
 #define PATHLOSS_MAX		137
 
+/**
+ * These are known security keys that have been compromised.
+ * If this grows or there are needs to be platform specific, it is
+ * conceivable that these could be read from a config file.
+*/ 
+static const struct mgmt_blocked_key_info blocked_keys [] = {
+	// Google Titan Security Keys
+	{ HCI_BLOCKED_KEY_TYPE_LTK, {0xbf, 0x01, 0xfb, 0x9d, 0x4e, 0xf3, 0xbc, 0x36,
+		 					0xd8, 0x74, 0xf5, 0x39, 0x41, 0x38, 0x68, 0x4c}},
+	{ HCI_BLOCKED_KEY_TYPE_IRK, {0xa5, 0x99, 0xba, 0xe4, 0xe1, 0x7c, 0xa6, 0x18,
+					0x22, 0x8e, 0x07, 0x56, 0xb4, 0xe8, 0x5f, 0x01}},
+};
+
 static DBusConnection *dbus_conn = NULL;
 
 static bool kernel_conn_control = false;
 
+static bool kernel_blocked_keys_supported = false;
+
 static GList *adapter_list = NULL;
 static unsigned int adapter_remaining = 0;
 static bool powering_down = false;
@@ -8568,6 +8583,40 @@ static bool set_static_addr(struct btd_adapter *adapter)
 	return false;
 }
 
+static void set_blocked_keys_complete(uint8_t status, uint16_t length,
+					const void *param, void *user_data)
+{
+	struct btd_adapter *adapter = user_data;
+
+	if (status != MGMT_STATUS_SUCCESS) {
+		btd_error(adapter->dev_id,
+				"Failed to set blocked keys: %s (0x%02x)",
+				mgmt_errstr(status), status);
+		return;
+	}
+
+	DBG("Successfully set blocked keys for index %u", adapter->dev_id);
+}
+
+static bool set_blocked_keys(struct btd_adapter *adapter)
+{
+	uint8_t buffer[sizeof(struct mgmt_cp_set_blocked_keys) +
+					sizeof(blocked_keys)] = { 0 };
+	struct mgmt_cp_set_blocked_keys *cp =
+					(struct mgmt_cp_set_blocked_keys *)buffer;
+	int i;
+
+	cp->key_count = G_N_ELEMENTS(blocked_keys);
+	for (i = 0; i < cp->key_count; ++i) {
+		cp->keys[i].type = blocked_keys[i].type;
+		memcpy(cp->keys[i].val, blocked_keys[i].val, sizeof(cp->keys[i].val));
+	}
+
+	return mgmt_send(mgmt_master, MGMT_OP_SET_BLOCKED_KEYS, adapter->dev_id,
+					sizeof(buffer),	buffer,	set_blocked_keys_complete,
+					adapter, NULL);
+}
+
 static void read_info_complete(uint8_t status, uint16_t length,
 					const void *param, void *user_data)
 {
@@ -8795,6 +8844,12 @@ static void read_info_complete(uint8_t status, uint16_t length,
 
 	set_name(adapter, btd_adapter_get_name(adapter));
 
+	if (kernel_blocked_keys_supported && !set_blocked_keys(adapter)) {
+		btd_error(adapter->dev_id,
+			"Failed to set blocked keys for index %u", adapter->dev_id);
+		goto failed;
+	}
+
 	if (main_opts.pairable &&
 			!(adapter->current_settings & MGMT_SETTING_BONDABLE))
 		set_mode(adapter, MGMT_OP_SET_BONDABLE, 0x01);
@@ -8972,9 +9027,17 @@ static void read_commands_complete(uint8_t status, uint16_t length,
 	for (i = 0; i < num_commands; i++) {
 		uint16_t op = get_le16(rp->opcodes + i);
 
-		if (op == MGMT_OP_ADD_DEVICE) {
+		switch (op){
+		case MGMT_OP_ADD_DEVICE:
 			DBG("enabling kernel-side connection control");
 			kernel_conn_control = true;
+			break;
+		case MGMT_OP_SET_BLOCKED_KEYS:
+			DBG("kernel supports the set_blocked_keys op");
+			kernel_blocked_keys_supported = true;
+			break;
+		default:
+			break;
 		}
 	}
 }
diff --git a/unit/test-mgmt.c b/unit/test-mgmt.c
index c67678b9a..d73c03f61 100644
--- a/unit/test-mgmt.c
+++ b/unit/test-mgmt.c
@@ -256,6 +256,33 @@ static const struct command_test_data command_test_3 = {
 	.rsp_status = MGMT_STATUS_INVALID_INDEX,
 };
 
+static const unsigned char invalid_key_buffer[] =
+ { 0x01, 0x02 };
+
+static const struct command_test_data command_test_set_blocked_keys1 = {
+ .opcode = MGMT_OP_SET_BLOCKED_KEYS,
+ .index = MGMT_INDEX_NONE,
+ .cmd_data = invalid_key_buffer,
+ .cmd_size = sizeof(invalid_key_buffer),
+ .rsp_data = NULL,
+ .rsp_size = 0,
+ .rsp_status = MGMT_STATUS_INVALID_PARAMS,
+};
+
+static const unsigned char valid_keys_buffer1[] =
+ { 0x01, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
+ 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f };
+
+static const struct command_test_data command_test_set_blocked_keys2 = {
+ .opcode = MGMT_OP_SET_BLOCKED_KEYS,
+ .index = MGMT_INDEX_NONE,
+ .cmd_data = valid_keys_buffer1,
+ .cmd_size = sizeof(valid_keys_buffer1),
+ .rsp_data = NULL,
+ .rsp_size = 0,
+ .rsp_status = MGMT_STATUS_SUCCESS,
+};
+
 static const unsigned char event_index_added[] =
 				{ 0x04, 0x00, 0x01, 0x00, 0x00, 0x00 };
 
@@ -441,6 +468,12 @@ int main(int argc, char *argv[])
 	g_test_add_data_func("/mgmt/response/2", &command_test_3,
 								test_response);
 
+	g_test_add_data_func("/mgmt/command/set_blocked_keys1",
+						&command_test_set_blocked_keys1, test_command);
+
+	g_test_add_data_func("/mgmt/command/set_blocked_keys2",
+						&command_test_set_blocked_keys2, test_command);
+
 	g_test_add_data_func("/mgmt/event/1", &event_test_1, test_event);
 	g_test_add_data_func("/mgmt/event/2", &event_test_1, test_event2);
 
-- 
2.24.0.393.g34dc348eaf-goog

