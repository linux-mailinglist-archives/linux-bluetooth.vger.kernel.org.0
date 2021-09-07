Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C21054027B0
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Sep 2021 13:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245127AbhIGLWB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Sep 2021 07:22:01 -0400
Received: from mga14.intel.com ([192.55.52.115]:50899 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239767AbhIGLWB (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Sep 2021 07:22:01 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="219856267"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="219856267"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 04:20:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="448960453"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by orsmga002.jf.intel.com with ESMTP; 07 Sep 2021 04:20:33 -0700
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
        tedd.an@intel.com, luiz.von.dentz@intel.com,
        michaelfsun@google.com, Kiran K <kiran.k@intel.com>
Subject: [PATCH v2 1/3] tools/sco-tester: add test cases to get offload codecs
Date:   Tue,  7 Sep 2021 16:55:54 +0530
Message-Id: <20210907112556.11848-1-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Add a test case to query offload codecs supported over sco
---

Notes:
    changes in v2:
     - Fix unused variables

 lib/bluetooth.h    | 18 +++++++++++
 tools/sco-tester.c | 76 ++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 91 insertions(+), 3 deletions(-)

diff --git a/lib/bluetooth.h b/lib/bluetooth.h
index 9ab033ec41a4..0fcf412c6c6b 100644
--- a/lib/bluetooth.h
+++ b/lib/bluetooth.h
@@ -140,6 +140,24 @@ struct bt_voice {
 
 #define BT_SCM_PKT_STATUS	0x03
 
+#define BT_CODEC 19
+struct bt_codec {
+	uint8_t id;
+	uint16_t cid;
+	uint16_t vid;
+	uint8_t data_path_id;
+	uint8_t num_caps;
+	struct codec_caps {
+		uint8_t len;
+		uint8_t data[];
+	} caps[];
+} __attribute__((packed));
+
+struct bt_codecs {
+	uint8_t num_codecs;
+	struct bt_codec codecs[];
+} __attribute__((packed));
+
 /* Connection and socket states */
 enum {
 	BT_CONNECTED = 1, /* Equal to TCP_ESTABLISHED to make net code happy */
diff --git a/tools/sco-tester.c b/tools/sco-tester.c
index 2b8dc0d4a8f8..0c4d9d76e4df 100644
--- a/tools/sco-tester.c
+++ b/tools/sco-tester.c
@@ -38,6 +38,7 @@ struct test_data {
 	enum hciemu_type hciemu_type;
 	unsigned int io_id;
 	bool disable_esco;
+	bool enable_codecs;
 };
 
 struct sco_client_data {
@@ -124,6 +125,18 @@ static void index_removed_callback(uint16_t index, uint16_t length,
 	tester_post_teardown_complete();
 }
 
+static void enable_codec_callback(uint8_t status, uint16_t length,
+					const void *param, void *user_data)
+{
+	if (status != MGMT_STATUS_SUCCESS) {
+		tester_warn("Failed to enable codecs");
+		tester_setup_failed();
+		return;
+	}
+
+	tester_print("Enabled codecs");
+}
+
 static void read_index_list_callback(uint8_t status, uint16_t length,
 					const void *param, void *user_data)
 {
@@ -202,7 +215,7 @@ static void test_data_free(void *test_data)
 	free(data);
 }
 
-#define test_sco_full(name, data, setup, func, _disable_esco) \
+#define test_sco_full(name, data, setup, func, _disable_esco, _enable_codecs) \
 	do { \
 		struct test_data *user; \
 		user = malloc(sizeof(struct test_data)); \
@@ -212,16 +225,20 @@ static void test_data_free(void *test_data)
 		user->io_id = 0; \
 		user->test_data = data; \
 		user->disable_esco = _disable_esco; \
+		user->enable_codecs = _enable_codecs; \
 		tester_add_full(name, data, \
 				test_pre_setup, setup, func, NULL, \
 				test_post_teardown, 2, user, test_data_free); \
 	} while (0)
 
 #define test_sco(name, data, setup, func) \
-	test_sco_full(name, data, setup, func, false)
+	test_sco_full(name, data, setup, func, false, false)
 
 #define test_sco_11(name, data, setup, func) \
-	test_sco_full(name, data, setup, func, true)
+	test_sco_full(name, data, setup, func, true, false)
+
+#define test_offload_sco(name, data, setup, func) \
+	test_sco_full(name, data, setup, func, false, true)
 
 static const struct sco_client_data connect_success = {
 	.expect_err = 0
@@ -281,6 +298,25 @@ static void setup_powered(const void *test_data)
 	mgmt_send(data->mgmt, MGMT_OP_SET_LE, data->mgmt_index,
 				sizeof(param), param, NULL, NULL, NULL);
 
+	if (data->enable_codecs) {
+		/* a6695ace-ee7f-4fb9-881a-5fac66c629af */
+		static const uint8_t uuid[16] = {
+				0xaf, 0x29, 0xc6, 0x66, 0xac, 0x5f, 0x1a, 0x88,
+				0xb9, 0x4f, 0x7f, 0xee, 0xce, 0x5a, 0x69, 0xa6,
+		};
+
+		struct mgmt_cp_set_exp_feature cp;
+
+		memset(&cp, 0, sizeof(cp));
+		memcpy(cp.uuid, uuid, 16);
+		cp.action = 1;
+
+		tester_print("Enabling codecs");
+
+		mgmt_send(data->mgmt, MGMT_OP_SET_EXP_FEATURE, data->mgmt_index,
+			  sizeof(cp), &cp, enable_codec_callback, NULL, NULL);
+	}
+
 	mgmt_send(data->mgmt, MGMT_OP_SET_POWERED, data->mgmt_index,
 					sizeof(param), param,
 					setup_powered_callback, NULL, NULL);
@@ -308,6 +344,37 @@ static void test_socket(const void *test_data)
 	tester_test_passed();
 }
 
+static void test_codecs_getsockopt(const void *test_data)
+{
+	int sk, err;
+	socklen_t len;
+	char buffer[255];
+
+	sk = socket(PF_BLUETOOTH, SOCK_SEQPACKET, BTPROTO_SCO);
+	if (sk < 0) {
+		tester_warn("Can't create socket: %s (%d)", strerror(errno),
+									errno);
+		tester_test_failed();
+		return;
+	}
+
+	len = sizeof(buffer);
+	memset(buffer, 0, len);
+
+	err = getsockopt(sk, SOL_BLUETOOTH, BT_CODEC, buffer, &len);
+	if (err < 0) {
+		tester_warn("Can't get socket option : %s (%d)",
+			    strerror(errno), errno);
+		tester_test_failed();
+		goto end;
+	}
+
+	tester_test_passed();
+
+end:
+	close(sk);
+}
+
 static void test_getsockopt(const void *test_data)
 {
 	int sk, err;
@@ -599,5 +666,8 @@ int main(int argc, char *argv[])
 	test_sco_11("SCO mSBC 1.1 - Failure", &connect_failure, setup_powered,
 							test_connect_transp);
 
+	test_offload_sco("Basic SCO Get Socket Option - Offload - Success",
+				NULL, setup_powered, test_codecs_getsockopt);
+
 	return tester_run();
 }
-- 
2.17.1

