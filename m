Return-Path: <linux-bluetooth+bounces-330-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B4280168D
	for <lists+linux-bluetooth@lfdr.de>; Fri,  1 Dec 2023 23:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E64C281E65
	for <lists+linux-bluetooth@lfdr.de>; Fri,  1 Dec 2023 22:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1514A208D1;
	Fri,  1 Dec 2023 22:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHhU3w/4"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FCC2AD
	for <linux-bluetooth@vger.kernel.org>; Fri,  1 Dec 2023 14:39:08 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-423c28db22eso31307921cf.1
        for <linux-bluetooth@vger.kernel.org>; Fri, 01 Dec 2023 14:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701470346; x=1702075146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t38I7isXqv/ES50wHXw9PxvfK4JUo5+b4s5BEI76vRc=;
        b=ZHhU3w/4OG6wXajQlTkykV9i9N9kQ8ZoU0SQ0TS/whxT/dub3NfRpcLRIhWMY0JqYy
         xIu/IBnphkexLeBZb+YLVFp/Eh8RnxMPTDATt5h1y81vyioy7+p9GJYMfcgUoOfZkM4e
         n8tSvi+HOjBa09Kt3hIogtT7p/o3FdOntn3NTHGkR+t2o3z3KR9guLixFMJxubyNNE3Y
         RG4l5rNEGI4NlqL40EZk91xN6d1qkWJwrZxNOli1IjZkBS60mkBoQw6t7oyGWF/1ACgL
         qXwxjo6cQjnzKoGoOLwdIQBPPmHjObZ0kNuhsKG0lKFVpRAEjJv58iqcW7MyZrDUbvct
         nY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701470346; x=1702075146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t38I7isXqv/ES50wHXw9PxvfK4JUo5+b4s5BEI76vRc=;
        b=sZULZ50AgJwaKA2/jdXfSNl9JBh/k9WbnVZgFp285B4+LYNvo9oEyA+Om9DufGtcff
         BnV4k3zIovsNTTu/8Eu6dSMNBEdCIR1fwlHjooJzfi9exgcqJDaW64UiGeVYS6fwKC1e
         BHWa5h1wdww2aiShYosKfa1+B9DaY1f0X9ODfhzPgEK3oUOj9pvaPZyH5WtnTdFTOLqB
         NZZDj5Cts5ULDmQSDUUGHp/RM8XLlb6BszQgb927O2nZyZDPMVI1DeIyg8R58dXouSxl
         qIhDDSc+Mi3335mkhYq4/nNCqtPNlLL6v5/8Ud/OmC+MAoJNZSmM9l9ljhu2fdGZZEI2
         BMVQ==
X-Gm-Message-State: AOJu0YzN0kU+j8uMym9kabejbV3E8X2MQ64H7FgEnDnnBIRUH8xz2LAb
	1+QGAIPvmlPV4ANT8Yj6sfF4VZX4YCQvwA==
X-Google-Smtp-Source: AGHT+IGzQ4HwrxtnxTyYNupWQUTgYsP2q1P4Fq3R1nYhHLppSKRm6wdjVk/7NBfje+yZFEixFpE89Q==
X-Received: by 2002:a05:6214:2b50:b0:67a:a814:969a with SMTP id jy16-20020a0562142b5000b0067aa814969amr123129qvb.51.1701470345608;
        Fri, 01 Dec 2023 14:39:05 -0800 (PST)
Received: from lvondent-mobl4.. (071-047-239-151.res.spectrum.com. [71.47.239.151])
        by smtp.gmail.com with ESMTPSA id b18-20020a0c9b12000000b0065b13180892sm1915411qve.16.2023.12.01.14.39.03
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 14:39:03 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v2 2/7] test-bap: Introduce QoS tests for LC3
Date: Fri,  1 Dec 2023 17:38:55 -0500
Message-ID: <20231201223900.2498565-2-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231201223900.2498565-1-luiz.dentz@gmail.com>
References: <20231201223900.2498565-1-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

4.8.3 Unicast Client Initiates Config QoS – LC3
(Page 43)

  Test Purpose:
  Verify that a Unicast Client IUT can initiate a Config QoS operation for the
  LC3 codec.

  Pass verdict:
  The IUT successfully writes to the ASE Control Point characteristic with the
  opcode set to 0x02 (Config QoS) and the specified parameters.

Test Summary
------------
BAP/UCL/SCC/BV-035-C [UCL SRC Config QoS, LC3 8_1_1] Passed
BAP/UCL/SCC/BV-036-C [UCL SRC Config QoS, LC3 8_2_1] Passed
BAP/UCL/SCC/BV-037-C [UCL SRC Config QoS, LC3 16_1_1] Passed
BAP/UCL/SCC/BV-038-C [UCL SRC Config QoS, LC3 16_2_1] Passed
BAP/UCL/SCC/BV-039-C [UCL SRC Config QoS, LC3 24_1_1] Passed
BAP/UCL/SCC/BV-040-C [UCL SRC Config QoS, LC3 24_2_1] Passed
BAP/UCL/SCC/BV-041-C [UCL SRC Config QoS, LC3 32_1_1] Passed
BAP/UCL/SCC/BV-042-C [UCL SRC Config QoS, LC3 32_2_1] Passed
BAP/UCL/SCC/BV-043-C [UCL SRC Config QoS, LC3 44.1_1_1] Passed
BAP/UCL/SCC/BV-044-C [UCL SRC Config QoS, LC3 44.1_2_1] Passed
BAP/UCL/SCC/BV-045-C [UCL SRC Config QoS, LC3 48_1_1] Passed
BAP/UCL/SCC/BV-046-C [UCL SRC Config QoS, LC3 48_2_1] Passed
BAP/UCL/SCC/BV-047-C [UCL SRC Config QoS, LC3 48_3_1] Passed
BAP/UCL/SCC/BV-048-C [UCL SRC Config QoS, LC3 48_4_1] Passed
BAP/UCL/SCC/BV-049-C [UCL SRC Config QoS, LC3 48_5_1] Passed
BAP/UCL/SCC/BV-050-C [UCL SRC Config QoS, LC3 48_6_1] Passed
BAP/UCL/SCC/BV-051-C [UCL SNK Config QoS, LC3 8_1_1] Passed
BAP/UCL/SCC/BV-052-C [UCL SNK Config QoS, LC3 8_2_1] Passed
BAP/UCL/SCC/BV-053-C [UCL SNK Config QoS, LC3 16_1_1] Passed
BAP/UCL/SCC/BV-054-C [UCL SNK Config QoS, LC3 16_2_1] Passed
BAP/UCL/SCC/BV-055-C [UCL SNK Config QoS, LC3 24_1_1] Passed
BAP/UCL/SCC/BV-056-C [UCL SNK Config QoS, LC3 24_2_1] Passed
BAP/UCL/SCC/BV-057-C [UCL SNK Config QoS, LC3 32_1_1] Passed
BAP/UCL/SCC/BV-058-C [UCL SNK Config QoS, LC3 32_2_1] Passed
BAP/UCL/SCC/BV-059-C [UCL SNK Config QoS, LC3 44.1_1_1] Passed
BAP/UCL/SCC/BV-060-C [UCL SNK Config QoS, LC3 44.1_2_1] Passed
BAP/UCL/SCC/BV-061-C [UCL SNK Config QoS, LC3 48_1_1] Passed
BAP/UCL/SCC/BV-062-C [UCL SNK Config QoS, LC3 48_2_1] Passed
BAP/UCL/SCC/BV-063-C [UCL SNK Config QoS, LC3 48_3_1] Passed
BAP/UCL/SCC/BV-064-C [UCL SNK Config QoS, LC3 48_4_1] Passed
BAP/UCL/SCC/BV-065-C [UCL SNK Config QoS, LC3 48_5_1] Passed
BAP/UCL/SCC/BV-066-C [UCL SNK Config QoS, LC3 48_6_1] Passed
BAP/UCL/SCC/BV-067-C [UCL SRC Config QoS, LC3 8_1_2] Passed
BAP/UCL/SCC/BV-068-C [UCL SRC Config QoS, LC3 8_2_2] Passed
BAP/UCL/SCC/BV-069-C [UCL SRC Config QoS, LC3 16_1_2] Passed
BAP/UCL/SCC/BV-070-C [UCL SRC Config QoS, LC3 16_2_2] Passed
BAP/UCL/SCC/BV-071-C [UCL SRC Config QoS, LC3 24_1_2] Passed
BAP/UCL/SCC/BV-072-C [UCL SRC Config QoS, LC3 24_2_2] Passed
BAP/UCL/SCC/BV-073-C [UCL SRC Config QoS, LC3 32_1_2] Passed
BAP/UCL/SCC/BV-074-C [UCL SRC Config QoS, LC3 32_2_2] Passed
BAP/UCL/SCC/BV-075-C [UCL SRC Config QoS, LC3 44.1_1_2] Passed
BAP/UCL/SCC/BV-076-C [UCL SRC Config QoS, LC3 44.1_2_2] Passed
BAP/UCL/SCC/BV-077-C [UCL SRC Config QoS, LC3 48_1_2] Passed
BAP/UCL/SCC/BV-078-C [UCL SRC Config QoS, LC3 48_2_2] Passed
BAP/UCL/SCC/BV-079-C [UCL SRC Config QoS, LC3 48_3_2] Passed
BAP/UCL/SCC/BV-080-C [UCL SRC Config QoS, LC3 48_4_2] Passed
BAP/UCL/SCC/BV-081-C [UCL SRC Config QoS, LC3 48_5_2] Passed
BAP/UCL/SCC/BV-082-C [UCL SRC Config QoS, LC3 48_6_2] Passed
BAP/UCL/SCC/BV-083-C [UCL SNK Config QoS, LC3 8_1_2] Passed
BAP/UCL/SCC/BV-084-C [UCL SNK Config QoS, LC3 8_2_2] Passed
BAP/UCL/SCC/BV-085-C [UCL SNK Config QoS, LC3 16_1_2] Passed
BAP/UCL/SCC/BV-086-C [UCL SNK Config QoS, LC3 16_2_2] Passed
BAP/UCL/SCC/BV-087-C [UCL SNK Config QoS, LC3 24_1_2] Passed
BAP/UCL/SCC/BV-088-C [UCL SNK Config QoS, LC3 24_2_2] Passed
BAP/UCL/SCC/BV-089-C [UCL SNK Config QoS, LC3 32_1_2] Passed
BAP/UCL/SCC/BV-090-C [UCL SNK Config QoS, LC3 32_2_2] Passed
BAP/UCL/SCC/BV-091-C [UCL SNK Config QoS, LC3 44.1_1_2] Passed
BAP/UCL/SCC/BV-092-C [UCL SNK Config QoS, LC3 44.1_2_2] Passed
BAP/UCL/SCC/BV-093-C [UCL SNK Config QoS, LC3 48_1_2] Passed
BAP/UCL/SCC/BV-094-C [UCL SNK Config QoS, LC3 48_2_2] Passed
BAP/UCL/SCC/BV-095-C [UCL SNK Config QoS, LC3 48_3_2] Passed
BAP/UCL/SCC/BV-096-C [UCL SNK Config QoS, LC3 48_4_2] Passed
BAP/UCL/SCC/BV-097-C [UCL SNK Config QoS, LC3 48_5_2] Passed
BAP/UCL/SCC/BV-098-C [UCL SNK Config QoS, LC3 48_6_2] Passed
Total: 64, Passed: 64 (100.0%), Failed: 0, Not Run: 0
---
 unit/test-bap.c | 964 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 963 insertions(+), 1 deletion(-)

diff --git a/unit/test-bap.c b/unit/test-bap.c
index adade07dbe9e..303388e35c14 100644
--- a/unit/test-bap.c
+++ b/unit/test-bap.c
@@ -39,6 +39,7 @@ struct test_config {
 	bool snk;
 	bool src;
 	bool vs;
+	uint8_t state;
 };
 
 struct test_data {
@@ -334,7 +335,7 @@ static void test_complete_cb(const void *user_data)
 	tester_test_passed();
 }
 
-static void bap_config(struct bt_bap_stream *stream,
+static void bap_qos(struct bt_bap_stream *stream,
 					uint8_t code, uint8_t reason,
 					void *user_data)
 {
@@ -342,6 +343,26 @@ static void bap_config(struct bt_bap_stream *stream,
 		tester_test_failed();
 }
 
+static void bap_config(struct bt_bap_stream *stream,
+					uint8_t code, uint8_t reason,
+					void *user_data)
+{
+	struct test_data *data = user_data;
+
+	if (code) {
+		tester_test_failed();
+		return;
+	}
+
+	if (data->cfg->state > BT_BAP_STREAM_STATE_CONFIG) {
+		unsigned int qos_id;
+
+		qos_id = bt_bap_stream_qos(data->stream, &data->cfg->qos,
+					   bap_qos, data);
+		g_assert(qos_id);
+	}
+}
+
 static bool pac_found(struct bt_bap_pac *lpac, struct bt_bap_pac *rpac,
 							void *user_data)
 {
@@ -1185,10 +1206,951 @@ static void test_scc_cc_vs(void)
 			test_client, &cfg_src_vs, SCC_SRC_VS);
 }
 
+static struct test_config cfg_snk_8_1_1 = {
+	.cc = LC3_CONFIG_8_1,
+	.qos = LC3_QOS_8_1_1,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_8_2_1 = {
+	.cc = LC3_CONFIG_8_2,
+	.qos = LC3_QOS_8_2_1,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_16_1_1 = {
+	.cc = LC3_CONFIG_16_1,
+	.qos = LC3_QOS_16_1_1,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_16_2_1 = {
+	.cc = LC3_CONFIG_16_2,
+	.qos = LC3_QOS_16_2_1,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_24_1_1 = {
+	.cc = LC3_CONFIG_24_1,
+	.qos = LC3_QOS_24_1_1,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_24_2_1 = {
+	.cc = LC3_CONFIG_24_2,
+	.qos = LC3_QOS_24_2_1,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_32_1_1 = {
+	.cc = LC3_CONFIG_32_1,
+	.qos = LC3_QOS_32_1_1,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_32_2_1 = {
+	.cc = LC3_CONFIG_32_2,
+	.qos = LC3_QOS_32_2_1,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_44_1_1 = {
+	.cc = LC3_CONFIG_44_1,
+	.qos = LC3_QOS_44_1_1,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_44_2_1 = {
+	.cc = LC3_CONFIG_44_2,
+	.qos = LC3_QOS_44_2_1,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_48_1_1 = {
+	.cc = LC3_CONFIG_48_1,
+	.qos = LC3_QOS_48_1_1,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_48_2_1 = {
+	.cc = LC3_CONFIG_48_2,
+	.qos = LC3_QOS_48_2_1,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_48_3_1 = {
+	.cc = LC3_CONFIG_48_3,
+	.qos = LC3_QOS_48_3_1,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_48_4_1 = {
+	.cc = LC3_CONFIG_48_4,
+	.qos = LC3_QOS_48_4_1,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_48_5_1 = {
+	.cc = LC3_CONFIG_48_5,
+	.qos = LC3_QOS_48_5_1,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_48_6_1 = {
+	.cc = LC3_CONFIG_48_6,
+	.qos = LC3_QOS_48_6_1,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+/* ATT: Write Command (0x52) len 23
+ *  Handle: 0x0022
+ *    Data: 02010000_qos
+ * ATT: Handle Value Notification (0x1b) len 7
+ *  Handle: 0x0022
+ *    Data: 0201010000
+ * ATT: Handle Value Notification (0x1b) len 37
+ *   Handle: 0x0016
+ *     Data: 01010102010a00204e00409c00204e00409c00_qos
+ */
+#define QOS_SNK(_qos...) \
+	IOV_DATA(0x52, 0x22, 0x00, 0x02, 0x01, 0x01, 0x00, 0x00, _qos), \
+	IOV_DATA(0x1b, 0x22, 0x00, 0x02, 0x01, 0x01, 0x00, 0x00), \
+	IOV_NULL, \
+	IOV_DATA(0x1b, 0x16, 0x00, 0x01, 0x02, 0x00, 0x00, _qos)
+
+#define SCC_SNK_8_1_1 \
+	SCC_SNK_8_1, \
+	QOS_SNK(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x1a, 0x00, 0x02, 0x08, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_8_2_1 \
+	SCC_SNK_8_2, \
+	QOS_SNK(0x10, 0x27, 0x00, 0x00, 0x02, 0x1e, 0x00, 0x02, 0x0a, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_16_1_1 \
+	SCC_SNK_16_1, \
+	QOS_SNK(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x1e, 0x00, 0x02, 0x08, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_16_2_1 \
+	SCC_SNK_16_2, \
+	QOS_SNK(0x10, 0x27, 0x00, 0x00, 0x02, 0x28, 0x00, 0x02, 0x0a, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_24_1_1 \
+	SCC_SNK_24_1, \
+	QOS_SNK(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x2d, 0x00, 0x02, 0x08, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_24_2_1 \
+	SCC_SNK_24_2, \
+	QOS_SNK(0x10, 0x27, 0x00, 0x00, 0x02, 0x3c, 0x00, 0x02, 0x0a, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_32_1_1 \
+	SCC_SNK_32_1, \
+	QOS_SNK(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x3c, 0x00, 0x02, 0x08, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_32_2_1 \
+	SCC_SNK_32_2, \
+	QOS_SNK(0x10, 0x27, 0x00, 0x00, 0x02, 0x50, 0x00, 0x02, 0x0a, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_44_1_1 \
+	SCC_SNK_44_1, \
+	QOS_SNK(0xe3, 0x1f, 0x00, 0x00, 0x02, 0x62, 0x00, 0x05, 0x18, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_44_2_1 \
+	SCC_SNK_44_2, \
+	QOS_SNK(0x84, 0x2a, 0x00, 0x00, 0x02, 0x82, 0x00, 0x05, 0x1f, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_48_1_1 \
+	SCC_SNK_48_1, \
+	QOS_SNK(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x4b, 0x00, 0x05, 0x0f, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_48_2_1 \
+	SCC_SNK_48_2, \
+	QOS_SNK(0x10, 0x27, 0x00, 0x00, 0x02, 0x64, 0x00, 0x05, 0x14, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_48_3_1 \
+	SCC_SNK_48_3, \
+	QOS_SNK(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x5a, 0x00, 0x05, 0x0f, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_48_4_1 \
+	SCC_SNK_48_4, \
+	QOS_SNK(0x10, 0x27, 0x00, 0x00, 0x02, 0x78, 0x00, 0x05, 0x14, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_48_5_1 \
+	SCC_SNK_48_5, \
+	QOS_SNK(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x75, 0x00, 0x05, 0x0f, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_48_6_1 \
+	SCC_SNK_48_6, \
+	QOS_SNK(0x10, 0x27, 0x00, 0x00, 0x02, 0x9b, 0x00, 0x05, 0x14, 0x00, \
+		0x40, 0x9c, 0x00)
+
+static struct test_config cfg_src_8_1_1 = {
+	.cc = LC3_CONFIG_8_1,
+	.qos = LC3_QOS_8_1_1,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_8_2_1 = {
+	.cc = LC3_CONFIG_8_2,
+	.qos = LC3_QOS_8_2_1,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_16_1_1 = {
+	.cc = LC3_CONFIG_16_1,
+	.qos = LC3_QOS_16_1_1,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_16_2_1 = {
+	.cc = LC3_CONFIG_16_2,
+	.qos = LC3_QOS_16_2_1,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_24_1_1 = {
+	.cc = LC3_CONFIG_24_1,
+	.qos = LC3_QOS_24_1_1,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_24_2_1 = {
+	.cc = LC3_CONFIG_24_2,
+	.qos = LC3_QOS_24_2_1,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_32_1_1 = {
+	.cc = LC3_CONFIG_32_1,
+	.qos = LC3_QOS_32_1_1,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_32_2_1 = {
+	.cc = LC3_CONFIG_32_2,
+	.qos = LC3_QOS_32_2_1,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_44_1_1 = {
+	.cc = LC3_CONFIG_44_1,
+	.qos = LC3_QOS_44_1_1,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_44_2_1 = {
+	.cc = LC3_CONFIG_44_2,
+	.qos = LC3_QOS_44_2_1,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_48_1_1 = {
+	.cc = LC3_CONFIG_48_1,
+	.qos = LC3_QOS_48_1_1,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_48_2_1 = {
+	.cc = LC3_CONFIG_48_2,
+	.qos = LC3_QOS_48_2_1,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_48_3_1 = {
+	.cc = LC3_CONFIG_48_3,
+	.qos = LC3_QOS_48_3_1,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_48_4_1 = {
+	.cc = LC3_CONFIG_48_4,
+	.qos = LC3_QOS_48_4_1,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_48_5_1 = {
+	.cc = LC3_CONFIG_48_5,
+	.qos = LC3_QOS_48_5_1,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_48_6_1 = {
+	.cc = LC3_CONFIG_48_6,
+	.qos = LC3_QOS_48_6_1,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+/* ATT: Write Command (0x52) len 23
+ *  Handle: 0x0022
+ *    Data: 02030000_qos
+ * ATT: Handle Value Notification (0x1b) len 7
+ *  Handle: 0x0022
+ *    Data: 0201030000
+ * ATT: Handle Value Notification (0x1b) len 37
+ *   Handle: 0x001c
+ *     Data: 03010102010a00204e00409c00204e00409c00_qos
+ */
+#define QOS_SRC(_qos...) \
+	IOV_DATA(0x52, 0x22, 0x00, 0x02, 0x01, 0x03, 0x00, 0x00, _qos), \
+	IOV_DATA(0x1b, 0x22, 0x00, 0x02, 0x01, 0x01, 0x00, 0x00), \
+	IOV_NULL, \
+	IOV_DATA(0x1b, 0x1c, 0x00, 0x03, 0x02, 0x00, 0x00, _qos)
+
+#define SCC_SRC_8_1_1 \
+	SCC_SRC_8_1, \
+	QOS_SRC(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x1a, 0x00, 0x02, 0x08, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_8_2_1 \
+	SCC_SRC_8_2, \
+	QOS_SRC(0x10, 0x27, 0x00, 0x00, 0x02, 0x1e, 0x00, 0x02, 0x0a, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_16_1_1 \
+	SCC_SRC_16_1, \
+	QOS_SRC(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x1e, 0x00, 0x02, 0x08, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_16_2_1 \
+	SCC_SRC_16_2, \
+	QOS_SRC(0x10, 0x27, 0x00, 0x00, 0x02, 0x28, 0x00, 0x02, 0x0a, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_24_1_1 \
+	SCC_SRC_24_1, \
+	QOS_SRC(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x2d, 0x00, 0x02, 0x08, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_24_2_1 \
+	SCC_SRC_24_2, \
+	QOS_SRC(0x10, 0x27, 0x00, 0x00, 0x02, 0x3c, 0x00, 0x02, 0x0a, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_32_1_1 \
+	SCC_SRC_32_1, \
+	QOS_SRC(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x3c, 0x00, 0x02, 0x08, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_32_2_1 \
+	SCC_SRC_32_2, \
+	QOS_SRC(0x10, 0x27, 0x00, 0x00, 0x02, 0x50, 0x00, 0x02, 0x0a, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_44_1_1 \
+	SCC_SRC_44_1, \
+	QOS_SRC(0xe3, 0x1f, 0x00, 0x00, 0x02, 0x62, 0x00, 0x05, 0x18, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_44_2_1 \
+	SCC_SRC_44_2, \
+	QOS_SRC(0x84, 0x2a, 0x00, 0x00, 0x02, 0x82, 0x00, 0x05, 0x1f, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_48_1_1 \
+	SCC_SRC_48_1, \
+	QOS_SRC(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x4b, 0x00, 0x05, 0x0f, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_48_2_1 \
+	SCC_SRC_48_2, \
+	QOS_SRC(0x10, 0x27, 0x00, 0x00, 0x02, 0x64, 0x00, 0x05, 0x14, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_48_3_1 \
+	SCC_SRC_48_3, \
+	QOS_SRC(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x5a, 0x00, 0x05, 0x0f, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_48_4_1 \
+	SCC_SRC_48_4, \
+	QOS_SRC(0x10, 0x27, 0x00, 0x00, 0x02, 0x78, 0x00, 0x05, 0x14, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_48_5_1 \
+	SCC_SRC_48_5, \
+	QOS_SRC(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x75, 0x00, 0x05, 0x0f, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_48_6_1 \
+	SCC_SRC_48_6, \
+	QOS_SRC(0x10, 0x27, 0x00, 0x00, 0x02, 0x9b, 0x00, 0x05, 0x14, 0x00, \
+		0x40, 0x9c, 0x00)
+
+static struct test_config cfg_snk_8_1_2 = {
+	.cc = LC3_CONFIG_8_1,
+	.qos = LC3_QOS_8_1_2,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_8_2_2 = {
+	.cc = LC3_CONFIG_8_2,
+	.qos = LC3_QOS_8_2_2,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_16_1_2 = {
+	.cc = LC3_CONFIG_16_1,
+	.qos = LC3_QOS_16_1_2,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_16_2_2 = {
+	.cc = LC3_CONFIG_16_2,
+	.qos = LC3_QOS_16_2_2,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_24_1_2 = {
+	.cc = LC3_CONFIG_24_1,
+	.qos = LC3_QOS_24_1_2,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_24_2_2 = {
+	.cc = LC3_CONFIG_24_2,
+	.qos = LC3_QOS_24_2_2,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_32_1_2 = {
+	.cc = LC3_CONFIG_32_1,
+	.qos = LC3_QOS_32_1_2,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_32_2_2 = {
+	.cc = LC3_CONFIG_32_2,
+	.qos = LC3_QOS_32_2_2,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_44_1_2 = {
+	.cc = LC3_CONFIG_44_1,
+	.qos = LC3_QOS_44_1_2,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_44_2_2 = {
+	.cc = LC3_CONFIG_44_2,
+	.qos = LC3_QOS_44_2_2,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_48_1_2 = {
+	.cc = LC3_CONFIG_48_1,
+	.qos = LC3_QOS_48_1_2,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_48_2_2 = {
+	.cc = LC3_CONFIG_48_2,
+	.qos = LC3_QOS_48_2_2,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_48_3_2 = {
+	.cc = LC3_CONFIG_48_3,
+	.qos = LC3_QOS_48_3_2,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_48_4_2 = {
+	.cc = LC3_CONFIG_48_4,
+	.qos = LC3_QOS_48_4_2,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_48_5_2 = {
+	.cc = LC3_CONFIG_48_5,
+	.qos = LC3_QOS_48_5_2,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_snk_48_6_2 = {
+	.cc = LC3_CONFIG_48_6,
+	.qos = LC3_QOS_48_6_2,
+	.snk = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+#define SCC_SNK_8_1_2 \
+	SCC_SNK_8_1, \
+	QOS_SNK(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x1a, 0x00, 0x0d, 0x4b, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_8_2_2 \
+	SCC_SNK_8_2, \
+	QOS_SNK(0x10, 0x27, 0x00, 0x00, 0x02, 0x1e, 0x00, 0x0d, 0x5f, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_16_1_2 \
+	SCC_SNK_16_1, \
+	QOS_SNK(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x1e, 0x00, 0x0d, 0x4b, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_16_2_2 \
+	SCC_SNK_16_2, \
+	QOS_SNK(0x10, 0x27, 0x00, 0x00, 0x02, 0x28, 0x00, 0x0d, 0x5f, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_24_1_2 \
+	SCC_SNK_24_1, \
+	QOS_SNK(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x2d, 0x00, 0x0d, 0x4b, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_24_2_2 \
+	SCC_SNK_24_2, \
+	QOS_SNK(0x10, 0x27, 0x00, 0x00, 0x02, 0x3c, 0x00, 0x0d, 0x5f, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_32_1_2 \
+	SCC_SNK_32_1, \
+	QOS_SNK(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x3c, 0x00, 0x0d, 0x4b, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_32_2_2 \
+	SCC_SNK_32_2, \
+	QOS_SNK(0x10, 0x27, 0x00, 0x00, 0x02, 0x50, 0x00, 0x0d, 0x5f, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_44_1_2 \
+	SCC_SNK_44_1, \
+	QOS_SNK(0xe3, 0x1f, 0x00, 0x00, 0x02, 0x62, 0x00, 0x0d, 0x50, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_44_2_2 \
+	SCC_SNK_44_2, \
+	QOS_SNK(0x84, 0x2a, 0x00, 0x00, 0x02, 0x82, 0x00, 0x0d, 0x55, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_48_1_2 \
+	SCC_SNK_48_1, \
+	QOS_SNK(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x4b, 0x00, 0x0d, 0x4b, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_48_2_2 \
+	SCC_SNK_48_2, \
+	QOS_SNK(0x10, 0x27, 0x00, 0x00, 0x02, 0x64, 0x00, 0x0d, 0x5f, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_48_3_2 \
+	SCC_SNK_48_3, \
+	QOS_SNK(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x5a, 0x00, 0x0d, 0x4b, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_48_4_2 \
+	SCC_SNK_48_4, \
+	QOS_SNK(0x10, 0x27, 0x00, 0x00, 0x02, 0x78, 0x00, 0x0d, 0x64, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_48_5_2 \
+	SCC_SNK_48_5, \
+	QOS_SNK(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x75, 0x00, 0x0d, 0x4b, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SNK_48_6_2 \
+	SCC_SNK_48_6, \
+	QOS_SNK(0x10, 0x27, 0x00, 0x00, 0x02, 0x9b, 0x00, 0x0d, 0x64, 0x00, \
+		0x40, 0x9c, 0x00)
+
+static struct test_config cfg_src_8_1_2 = {
+	.cc = LC3_CONFIG_8_1,
+	.qos = LC3_QOS_8_1_2,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_8_2_2 = {
+	.cc = LC3_CONFIG_8_2,
+	.qos = LC3_QOS_8_2_2,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_16_1_2 = {
+	.cc = LC3_CONFIG_16_1,
+	.qos = LC3_QOS_16_1_2,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_16_2_2 = {
+	.cc = LC3_CONFIG_16_2,
+	.qos = LC3_QOS_16_2_2,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_24_1_2 = {
+	.cc = LC3_CONFIG_24_1,
+	.qos = LC3_QOS_24_1_2,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_24_2_2 = {
+	.cc = LC3_CONFIG_24_2,
+	.qos = LC3_QOS_24_2_2,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_32_1_2 = {
+	.cc = LC3_CONFIG_32_1,
+	.qos = LC3_QOS_32_1_2,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_32_2_2 = {
+	.cc = LC3_CONFIG_32_2,
+	.qos = LC3_QOS_32_2_2,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_44_1_2 = {
+	.cc = LC3_CONFIG_44_1,
+	.qos = LC3_QOS_44_1_2,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_44_2_2 = {
+	.cc = LC3_CONFIG_44_2,
+	.qos = LC3_QOS_44_2_2,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_48_1_2 = {
+	.cc = LC3_CONFIG_48_1,
+	.qos = LC3_QOS_48_1_2,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_48_2_2 = {
+	.cc = LC3_CONFIG_48_2,
+	.qos = LC3_QOS_48_2_2,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_48_3_2 = {
+	.cc = LC3_CONFIG_48_3,
+	.qos = LC3_QOS_48_3_2,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_48_4_2 = {
+	.cc = LC3_CONFIG_48_4,
+	.qos = LC3_QOS_48_4_2,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_48_5_2 = {
+	.cc = LC3_CONFIG_48_5,
+	.qos = LC3_QOS_48_5_2,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+static struct test_config cfg_src_48_6_2 = {
+	.cc = LC3_CONFIG_48_6,
+	.qos = LC3_QOS_48_6_2,
+	.src = true,
+	.state = BT_BAP_STREAM_STATE_QOS,
+};
+
+#define SCC_SRC_8_1_2 \
+	SCC_SRC_8_1, \
+	QOS_SRC(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x1a, 0x00, 0x0d, 0x4b, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_8_2_2 \
+	SCC_SRC_8_2, \
+	QOS_SRC(0x10, 0x27, 0x00, 0x00, 0x02, 0x1e, 0x00, 0x0d, 0x5f, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_16_1_2 \
+	SCC_SRC_16_1, \
+	QOS_SRC(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x1e, 0x00, 0x0d, 0x4b, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_16_2_2 \
+	SCC_SRC_16_2, \
+	QOS_SRC(0x10, 0x27, 0x00, 0x00, 0x02, 0x28, 0x00, 0x0d, 0x5f, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_24_1_2 \
+	SCC_SRC_24_1, \
+	QOS_SRC(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x2d, 0x00, 0x0d, 0x4b, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_24_2_2 \
+	SCC_SRC_24_2, \
+	QOS_SRC(0x10, 0x27, 0x00, 0x00, 0x02, 0x3c, 0x00, 0x0d, 0x5f, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_32_1_2 \
+	SCC_SRC_32_1, \
+	QOS_SRC(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x3c, 0x00, 0x0d, 0x4b, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_32_2_2 \
+	SCC_SRC_32_2, \
+	QOS_SRC(0x10, 0x27, 0x00, 0x00, 0x02, 0x50, 0x00, 0x0d, 0x5f, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_44_1_2 \
+	SCC_SRC_44_1, \
+	QOS_SRC(0xe3, 0x1f, 0x00, 0x00, 0x02, 0x62, 0x00, 0x0d, 0x50, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_44_2_2 \
+	SCC_SRC_44_2, \
+	QOS_SRC(0x84, 0x2a, 0x00, 0x00, 0x02, 0x82, 0x00, 0x0d, 0x55, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_48_1_2 \
+	SCC_SRC_48_1, \
+	QOS_SRC(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x4b, 0x00, 0x0d, 0x4b, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_48_2_2 \
+	SCC_SRC_48_2, \
+	QOS_SRC(0x10, 0x27, 0x00, 0x00, 0x02, 0x64, 0x00, 0x0d, 0x5f, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_48_3_2 \
+	SCC_SRC_48_3, \
+	QOS_SRC(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x5a, 0x00, 0x0d, 0x4b, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_48_4_2 \
+	SCC_SRC_48_4, \
+	QOS_SRC(0x10, 0x27, 0x00, 0x00, 0x02, 0x78, 0x00, 0x0d, 0x64, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_48_5_2 \
+	SCC_SRC_48_5, \
+	QOS_SRC(0x4c, 0x1d, 0x00, 0x00, 0x02, 0x75, 0x00, 0x0d, 0x4b, 0x00, \
+		0x40, 0x9c, 0x00)
+
+#define SCC_SRC_48_6_2 \
+	SCC_SRC_48_6, \
+	QOS_SRC(0x10, 0x27, 0x00, 0x00, 0x02, 0x9b, 0x00, 0x0d, 0x64, 0x00, \
+		0x40, 0x9c, 0x00)
+
+/* Test Purpose:
+ * Verify that a Unicast Client IUT can initiate a Config QoS operation for the
+ * LC3 codec.
+ *
+ * Pass verdict:
+ * The IUT successfully writes to the ASE Control Point characteristic with the
+ * opcode set to 0x02 (Config QoS) and the specified parameters.
+ */
+static void test_scc_qos_lc3(void)
+{
+	define_test("BAP/UCL/SCC/BV-035-C [UCL SRC Config QoS, LC3 8_1_1]",
+			test_client, &cfg_snk_8_1_1, SCC_SNK_8_1_1);
+	define_test("BAP/UCL/SCC/BV-036-C [UCL SRC Config QoS, LC3 8_2_1]",
+			test_client, &cfg_snk_8_2_1, SCC_SNK_8_2_1);
+	define_test("BAP/UCL/SCC/BV-037-C [UCL SRC Config QoS, LC3 16_1_1]",
+			test_client, &cfg_snk_16_1_1, SCC_SNK_16_1_1);
+	define_test("BAP/UCL/SCC/BV-038-C [UCL SRC Config QoS, LC3 16_2_1]",
+			test_client, &cfg_snk_16_2_1, SCC_SNK_16_2_1);
+	define_test("BAP/UCL/SCC/BV-039-C [UCL SRC Config QoS, LC3 24_1_1]",
+			test_client, &cfg_snk_24_1_1, SCC_SNK_24_1_1);
+	define_test("BAP/UCL/SCC/BV-040-C [UCL SRC Config QoS, LC3 24_2_1]",
+			test_client, &cfg_snk_24_2_1, SCC_SNK_24_2_1);
+	define_test("BAP/UCL/SCC/BV-041-C [UCL SRC Config QoS, LC3 32_1_1]",
+			test_client, &cfg_snk_32_1_1, SCC_SNK_32_1_1);
+	define_test("BAP/UCL/SCC/BV-042-C [UCL SRC Config QoS, LC3 32_2_1]",
+			test_client, &cfg_snk_32_2_1, SCC_SNK_32_2_1);
+	define_test("BAP/UCL/SCC/BV-043-C [UCL SRC Config QoS, LC3 44.1_1_1]",
+			test_client, &cfg_snk_44_1_1, SCC_SNK_44_1_1);
+	define_test("BAP/UCL/SCC/BV-044-C [UCL SRC Config QoS, LC3 44.1_2_1]",
+			test_client, &cfg_snk_44_2_1, SCC_SNK_44_2_1);
+	define_test("BAP/UCL/SCC/BV-045-C [UCL SRC Config QoS, LC3 48_1_1]",
+			test_client, &cfg_snk_48_1_1, SCC_SNK_48_1_1);
+	define_test("BAP/UCL/SCC/BV-046-C [UCL SRC Config QoS, LC3 48_2_1]",
+			test_client, &cfg_snk_48_2_1, SCC_SNK_48_2_1);
+	define_test("BAP/UCL/SCC/BV-047-C [UCL SRC Config QoS, LC3 48_3_1]",
+			test_client, &cfg_snk_48_3_1, SCC_SNK_48_3_1);
+	define_test("BAP/UCL/SCC/BV-048-C [UCL SRC Config QoS, LC3 48_4_1]",
+			test_client, &cfg_snk_48_4_1, SCC_SNK_48_4_1);
+	define_test("BAP/UCL/SCC/BV-049-C [UCL SRC Config QoS, LC3 48_5_1]",
+			test_client, &cfg_snk_48_5_1, SCC_SNK_48_5_1);
+	define_test("BAP/UCL/SCC/BV-050-C [UCL SRC Config QoS, LC3 48_6_1]",
+			test_client, &cfg_snk_48_6_1, SCC_SNK_48_6_1);
+	define_test("BAP/UCL/SCC/BV-051-C [UCL SNK Config QoS, LC3 8_1_1]",
+			test_client, &cfg_src_8_1_1, SCC_SRC_8_1_1);
+	define_test("BAP/UCL/SCC/BV-052-C [UCL SNK Config QoS, LC3 8_2_1]",
+			test_client, &cfg_src_8_2_1, SCC_SRC_8_2_1);
+	define_test("BAP/UCL/SCC/BV-053-C [UCL SNK Config QoS, LC3 16_1_1]",
+			test_client, &cfg_src_16_1_1, SCC_SRC_16_1_1);
+	define_test("BAP/UCL/SCC/BV-054-C [UCL SNK Config QoS, LC3 16_2_1]",
+			test_client, &cfg_src_16_2_1, SCC_SRC_16_2_1);
+	define_test("BAP/UCL/SCC/BV-055-C [UCL SNK Config QoS, LC3 24_1_1]",
+			test_client, &cfg_src_24_1_1, SCC_SRC_24_1_1);
+	define_test("BAP/UCL/SCC/BV-056-C [UCL SNK Config QoS, LC3 24_2_1]",
+			test_client, &cfg_src_24_2_1, SCC_SRC_24_2_1);
+	define_test("BAP/UCL/SCC/BV-057-C [UCL SNK Config QoS, LC3 32_1_1]",
+			test_client, &cfg_src_32_1_1, SCC_SRC_32_1_1);
+	define_test("BAP/UCL/SCC/BV-058-C [UCL SNK Config QoS, LC3 32_2_1]",
+			test_client, &cfg_src_32_2_1, SCC_SRC_32_2_1);
+	define_test("BAP/UCL/SCC/BV-059-C [UCL SNK Config QoS, LC3 44.1_1_1]",
+			test_client, &cfg_src_44_1_1, SCC_SRC_44_1_1);
+	define_test("BAP/UCL/SCC/BV-060-C [UCL SNK Config QoS, LC3 44.1_2_1]",
+			test_client, &cfg_src_44_2_1, SCC_SRC_44_2_1);
+	define_test("BAP/UCL/SCC/BV-061-C [UCL SNK Config QoS, LC3 48_1_1]",
+			test_client, &cfg_src_48_1_1, SCC_SRC_48_1_1);
+	define_test("BAP/UCL/SCC/BV-062-C [UCL SNK Config QoS, LC3 48_2_1]",
+			test_client, &cfg_src_48_2_1, SCC_SRC_48_2_1);
+	define_test("BAP/UCL/SCC/BV-063-C [UCL SNK Config QoS, LC3 48_3_1]",
+			test_client, &cfg_src_48_3_1, SCC_SRC_48_3_1);
+	define_test("BAP/UCL/SCC/BV-064-C [UCL SNK Config QoS, LC3 48_4_1]",
+			test_client, &cfg_src_48_4_1, SCC_SRC_48_4_1);
+	define_test("BAP/UCL/SCC/BV-065-C [UCL SNK Config QoS, LC3 48_5_1]",
+			test_client, &cfg_src_48_5_1, SCC_SRC_48_5_1);
+	define_test("BAP/UCL/SCC/BV-066-C [UCL SNK Config QoS, LC3 48_6_1]",
+			test_client, &cfg_src_48_6_1, SCC_SRC_48_6_1);
+	define_test("BAP/UCL/SCC/BV-067-C [UCL SRC Config QoS, LC3 8_1_2]",
+			test_client, &cfg_snk_8_1_2, SCC_SNK_8_1_2);
+	define_test("BAP/UCL/SCC/BV-068-C [UCL SRC Config QoS, LC3 8_2_2]",
+			test_client, &cfg_snk_8_2_2, SCC_SNK_8_2_2);
+	define_test("BAP/UCL/SCC/BV-069-C [UCL SRC Config QoS, LC3 16_1_2]",
+			test_client, &cfg_snk_16_1_2, SCC_SNK_16_1_2);
+	define_test("BAP/UCL/SCC/BV-070-C [UCL SRC Config QoS, LC3 16_2_2]",
+			test_client, &cfg_snk_16_2_2, SCC_SNK_16_2_2);
+	define_test("BAP/UCL/SCC/BV-071-C [UCL SRC Config QoS, LC3 24_1_2]",
+			test_client, &cfg_snk_24_1_2, SCC_SNK_24_1_2);
+	define_test("BAP/UCL/SCC/BV-072-C [UCL SRC Config QoS, LC3 24_2_2]",
+			test_client, &cfg_snk_24_2_2, SCC_SNK_24_2_2);
+	define_test("BAP/UCL/SCC/BV-073-C [UCL SRC Config QoS, LC3 32_1_2]",
+			test_client, &cfg_snk_32_1_2, SCC_SNK_32_1_2);
+	define_test("BAP/UCL/SCC/BV-074-C [UCL SRC Config QoS, LC3 32_2_2]",
+			test_client, &cfg_snk_32_2_2, SCC_SNK_32_2_2);
+	define_test("BAP/UCL/SCC/BV-075-C [UCL SRC Config QoS, LC3 44.1_1_2]",
+			test_client, &cfg_snk_44_1_2, SCC_SNK_44_1_2);
+	define_test("BAP/UCL/SCC/BV-076-C [UCL SRC Config QoS, LC3 44.1_2_2]",
+			test_client, &cfg_snk_44_2_2, SCC_SNK_44_2_2);
+	define_test("BAP/UCL/SCC/BV-077-C [UCL SRC Config QoS, LC3 48_1_2]",
+			test_client, &cfg_snk_48_1_2, SCC_SNK_48_1_2);
+	define_test("BAP/UCL/SCC/BV-078-C [UCL SRC Config QoS, LC3 48_2_2]",
+			test_client, &cfg_snk_48_2_2, SCC_SNK_48_2_2);
+	define_test("BAP/UCL/SCC/BV-079-C [UCL SRC Config QoS, LC3 48_3_2]",
+			test_client, &cfg_snk_48_3_2, SCC_SNK_48_3_2);
+	define_test("BAP/UCL/SCC/BV-080-C [UCL SRC Config QoS, LC3 48_4_2]",
+			test_client, &cfg_snk_48_4_2, SCC_SNK_48_4_2);
+	define_test("BAP/UCL/SCC/BV-081-C [UCL SRC Config QoS, LC3 48_5_2]",
+			test_client, &cfg_snk_48_5_2, SCC_SNK_48_5_2);
+	define_test("BAP/UCL/SCC/BV-082-C [UCL SRC Config QoS, LC3 48_6_2]",
+			test_client, &cfg_snk_48_6_2, SCC_SNK_48_6_2);
+	define_test("BAP/UCL/SCC/BV-083-C [UCL SNK Config QoS, LC3 8_1_2]",
+			test_client, &cfg_src_8_1_2, SCC_SRC_8_1_2);
+	define_test("BAP/UCL/SCC/BV-084-C [UCL SNK Config QoS, LC3 8_2_2]",
+			test_client, &cfg_src_8_2_2, SCC_SRC_8_2_2);
+	define_test("BAP/UCL/SCC/BV-085-C [UCL SNK Config QoS, LC3 16_1_2]",
+			test_client, &cfg_src_16_1_2, SCC_SRC_16_1_2);
+	define_test("BAP/UCL/SCC/BV-086-C [UCL SNK Config QoS, LC3 16_2_2]",
+			test_client, &cfg_src_16_2_2, SCC_SRC_16_2_2);
+	define_test("BAP/UCL/SCC/BV-087-C [UCL SNK Config QoS, LC3 24_1_2]",
+			test_client, &cfg_src_24_1_2, SCC_SRC_24_1_2);
+	define_test("BAP/UCL/SCC/BV-088-C [UCL SNK Config QoS, LC3 24_2_2]",
+			test_client, &cfg_src_24_2_2, SCC_SRC_24_2_2);
+	define_test("BAP/UCL/SCC/BV-089-C [UCL SNK Config QoS, LC3 32_1_2]",
+			test_client, &cfg_src_32_1_2, SCC_SRC_32_1_2);
+	define_test("BAP/UCL/SCC/BV-090-C [UCL SNK Config QoS, LC3 32_2_2]",
+			test_client, &cfg_src_32_2_2, SCC_SRC_32_2_2);
+	define_test("BAP/UCL/SCC/BV-091-C [UCL SNK Config QoS, LC3 44.1_1_2]",
+			test_client, &cfg_src_44_1_2, SCC_SRC_44_1_2);
+	define_test("BAP/UCL/SCC/BV-092-C [UCL SNK Config QoS, LC3 44.1_2_2]",
+			test_client, &cfg_src_44_2_2, SCC_SRC_44_2_2);
+	define_test("BAP/UCL/SCC/BV-093-C [UCL SNK Config QoS, LC3 48_1_2]",
+			test_client, &cfg_src_48_1_2, SCC_SRC_48_1_2);
+	define_test("BAP/UCL/SCC/BV-094-C [UCL SNK Config QoS, LC3 48_2_2]",
+			test_client, &cfg_src_48_2_2, SCC_SRC_48_2_2);
+	define_test("BAP/UCL/SCC/BV-095-C [UCL SNK Config QoS, LC3 48_3_2]",
+			test_client, &cfg_src_48_3_2, SCC_SRC_48_3_2);
+	define_test("BAP/UCL/SCC/BV-096-C [UCL SNK Config QoS, LC3 48_4_2]",
+			test_client, &cfg_src_48_4_2, SCC_SRC_48_4_2);
+	define_test("BAP/UCL/SCC/BV-097-C [UCL SNK Config QoS, LC3 48_5_2]",
+			test_client, &cfg_src_48_5_2, SCC_SRC_48_5_2);
+	define_test("BAP/UCL/SCC/BV-098-C [UCL SNK Config QoS, LC3 48_6_2]",
+			test_client, &cfg_src_48_6_2, SCC_SRC_48_6_2);
+}
+
 static void test_scc(void)
 {
 	test_scc_cc_lc3();
 	test_scc_cc_vs();
+	test_scc_qos_lc3();
 }
 
 int main(int argc, char *argv[])
-- 
2.43.0


