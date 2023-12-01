Return-Path: <linux-bluetooth+bounces-328-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9B480168B
	for <lists+linux-bluetooth@lfdr.de>; Fri,  1 Dec 2023 23:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BCFD1C20D9E
	for <lists+linux-bluetooth@lfdr.de>; Fri,  1 Dec 2023 22:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F5E619CF;
	Fri,  1 Dec 2023 22:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frUDt8FD"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A99D63
	for <linux-bluetooth@vger.kernel.org>; Fri,  1 Dec 2023 14:39:09 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-da077db5145so1055053276.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 01 Dec 2023 14:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701470347; x=1702075147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nilNZRtTQifRr2NjZFoVre08KbRTer2dFroHFKuf5O4=;
        b=frUDt8FDXmDs+DVg6LCb8ds8XgD3KCTWoRs+8tce534dC3IC7WgEpfb3PE1u5W67CF
         2wKq0Qf9WSqpOmhiFQPn7LI04LOL35SUDgZ/oodRPEl2S7XWcLQZujeWgCjoCp0vP64g
         Q60BtUpjuQlCgUOYPtgbATtGF+Qt136yrn2tujgL8ujZ/79rkxyKH89/StMdZJhcjoLx
         v1Acpri0Vybui6wgBz9zziLS+1MSuKkUR9hpSN3R7PqueOQr47WZEPqqyzI3IVemHuP5
         h2MDZkctN0WJy5noV3BaDHjAbaGuDGHRiYWS5glSt/W9EGY7xqaZtbHKLs58U5Vh8BGV
         HNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701470347; x=1702075147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nilNZRtTQifRr2NjZFoVre08KbRTer2dFroHFKuf5O4=;
        b=LFBJ7iLoZAJ8dY87RBVZhawG4J4x+seIcXbtdJRxXmUMvTkwEe4EuauPas/mLOjw9u
         8viVo/ttPQo1/cWZKCB65bcw5BAa98B1Sqt0kdyCP75nSRMLZtQ759ZHBLM8uVXHV+jX
         rqjRa1V6jFi26fBNVezFIpT8UPtf5wDq02A+V1A7dU7Hv3rW6JmQr/1jfXXbZshaNFzC
         GRJiMjC+Q2AnEDvG+/Vfo3ETIsFWb22CuJ2cRO+glvE0K1hQDS6ll0LYBMdEY4BQG2St
         z9bEuKOMtedu6oszUZwbWMLcgRzkScZLKLR/YF5GGOqb/ZfshG1UJZGosjSJM6wS483Z
         /6Gw==
X-Gm-Message-State: AOJu0Yyb3TtZoddM7VzFTC4t4fd5jQ3DmeE8TzXMTMzcYM4b/Z6v4DF4
	uvSMEK5uJIEdgnMmaKrhUDEbwmLFbtSU8g==
X-Google-Smtp-Source: AGHT+IHuKPWDP7fX3e5Vqrmh3i3uW7/2EBPD7A/QX38i9O6gNeo0qOd6aL6u9ICVenf2FcyoLHp4zg==
X-Received: by 2002:a25:c44:0:b0:db7:dad0:76ac with SMTP id 65-20020a250c44000000b00db7dad076acmr178050ybm.72.1701470346950;
        Fri, 01 Dec 2023 14:39:06 -0800 (PST)
Received: from lvondent-mobl4.. (071-047-239-151.res.spectrum.com. [71.47.239.151])
        by smtp.gmail.com with ESMTPSA id b18-20020a0c9b12000000b0065b13180892sm1915411qve.16.2023.12.01.14.39.05
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 14:39:06 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v2 3/7] test-bap: Add SCC Config QoS, VS tests
Date: Fri,  1 Dec 2023 17:38:56 -0500
Message-ID: <20231201223900.2498565-3-luiz.dentz@gmail.com>
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

4.8.4 Unicast Client Initiates Config QoS – Vendor-Specific (Page 46)

  Test Purpose:
  Verify that a Unicast Client IUT can initiate a Config QoS operation for a
  vendor-specific codec.

  Pass verdict:
  The IUT successfully writes to the ASE Control Point characteristic with the
  opcode set to 0x02 (Config QoS) and the specified parameters.

Test Summary
------------
BAP/UCL/SCC/BV-099-C [UCL SNK Config QoS, VS]        Passed
BAP/UCL/SCC/BV-100-C [UCL SRC Config QoS, VS]        Passed
Total: 2, Passed: 2 (100.0%), Failed: 0, Not Run: 0
---
 unit/test-bap.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/unit/test-bap.c b/unit/test-bap.c
index 303388e35c14..fdfedde6b965 100644
--- a/unit/test-bap.c
+++ b/unit/test-bap.c
@@ -2146,11 +2146,54 @@ static void test_scc_qos_lc3(void)
 			test_client, &cfg_src_48_6_2, SCC_SRC_48_6_2);
 }
 
+static struct test_config cfg_snk_qos_vs = {
+	.cc = IOV_NULL,
+	.qos = QOS_UCAST,
+	.snk = true,
+	.vs = true,
+	.state = BT_BAP_STREAM_STATE_QOS
+};
+
+#define SCC_SNK_QOS_VS \
+	SCC_SNK_VS, \
+	QOS_SNK(0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, \
+		0x00, 0x00, 0x00)
+
+static struct test_config cfg_src_qos_vs = {
+	.cc = IOV_NULL,
+	.qos = QOS_UCAST,
+	.src = true,
+	.vs = true,
+	.state = BT_BAP_STREAM_STATE_QOS
+};
+
+#define SCC_SRC_QOS_VS \
+	SCC_SRC_VS, \
+	QOS_SRC(0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, \
+		0x00, 0x00, 0x00)
+
+/* Test Purpose:
+ * Verify that a Unicast Client IUT can initiate a Config QoS operation for a
+ * vendor-specific codec.
+ *
+ * Pass verdict:
+ * The IUT successfully writes to the ASE Control Point characteristic with the
+ * opcode set to 0x02 (Config QoS) and the specified parameters.
+ */
+static void test_scc_qos_vs(void)
+{
+	define_test("BAP/UCL/SCC/BV-099-C [UCL SNK Config QoS, VS]",
+			test_client, &cfg_src_qos_vs, SCC_SRC_QOS_VS);
+	define_test("BAP/UCL/SCC/BV-100-C [UCL SRC QoS Codec, VS]",
+			test_client, &cfg_snk_qos_vs, SCC_SNK_QOS_VS);
+}
+
 static void test_scc(void)
 {
 	test_scc_cc_lc3();
 	test_scc_cc_vs();
 	test_scc_qos_lc3();
+	test_scc_qos_vs();
 }
 
 int main(int argc, char *argv[])
-- 
2.43.0


