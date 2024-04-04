Return-Path: <linux-bluetooth+bounces-3217-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACC8898C07
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Apr 2024 18:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03397B25048
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Apr 2024 16:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A74912CDAA;
	Thu,  4 Apr 2024 16:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="NeMWfbXL"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6775512AAF3
	for <linux-bluetooth@vger.kernel.org>; Thu,  4 Apr 2024 16:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712247698; cv=pass; b=FlZlSotX60M2cyQsT4AnFW8HHbqlunUeAVay+ZIjcio82N0YdatKlwgHNy+tyTqIhKCr5QOSoEaZ1CteEC2nkLzs3v81OVzKHMjcT+yqRnhB0QBgvbpWGVfUVy2LOH1S7Y8BqRqDOjLD2yFo8/O1KJGhal5fR82LozjCPefpxv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712247698; c=relaxed/simple;
	bh=xldpN/Ztu2Do9dZrV7UkQCpP1Vv9sh2Vi+XVCc3dVSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u0Wna9FOoXB/obnpC2Dycs2cxns83JmZoflKx0npqjFBb53IdC9SLP9BS7Bixn7FLRq7JeNsOFQ13YyNrdSh1Ehcv4D7HDhkVXzq940GdGwwDOrzD2LkFNEcYWTsk1EFCIgZ2tMj1uuegQEvT5dQE3AjR9kY+Rdhn7qIvh1WYXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=NeMWfbXL; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from monolith.lan (unknown [193.138.7.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pav)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4V9RhF45H5z49Q5s;
	Thu,  4 Apr 2024 19:21:33 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1712247694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dnBWF1VjdzSymq/rTQxvaH37HMwudo5EZF4FQQ91Egw=;
	b=NeMWfbXL+xfpD+yogybMeSMT+PH4Fm4IU+hjB7A0Fz/KPp3Gtx8HquGOq2xCbHaDee4m6Z
	Y0J8n+eOpqxWDsBGYx3Ggiwh04TELiUkj4Xn7DNljHcuHARn1U2uuDCVkpF00M6ZtRp7mM
	bGPawCFz/BTMZbe0755kV91mBdp+g1u+RjfU5/7UAGTM36E8dHbiCEJDBhK+UT7yAQa/PT
	sUZ/v9eG00ocWa/8gHPbVB6y/+Zstkk14b+vBDCa29yhKZCxY4izDoJu0D26jGfvzASBhD
	u2nzTDUhMaWvMzBG17XabPdbzZ424NDhBlkMnWMwO6XupTdl2LQae8gAKCiUIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1712247694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dnBWF1VjdzSymq/rTQxvaH37HMwudo5EZF4FQQ91Egw=;
	b=IXv4A0dJRfHHG/df7Gy2sC9yFJzfJcTrLDH7sCgalS1uHwcQNqLv6Aiqo6qoOy11jFHHsi
	VvIlaapmxzivav/QPLGmh7AlbsYehIy+HDUwtZnLdFFQVMGnttvp7Wzap0Hn3qX9rBbZo0
	mi0WmiTWRcjy0lllbXJ0s0OkrmkKWSfqdncS7AAiKJg2dlPNP+oIgjKf4OljVNZmh0nASX
	NneJmbJ2qtTGqt8Awd6Wg2TZf6wa1PgRMyh1eiLNRF67pXvjjwx/ZloQKuMr4rm6oJu8b9
	CQCekzaF+ETw1JIWQr7kx35b3jobNRBebWTtvtLDE+RC0bnJCpocnqToL9CgbA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pav smtp.mailfrom=pav@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1712247694; a=rsa-sha256;
	cv=none;
	b=bQSXlHYziFk8cls6C7SiFWU8ZDwm7pfqM/xETe/ysQUdYEbb32Y+d125u0+03PekDV9kR3
	06n6BWGgd+HG40w5kmPKhq49WJvyvxxnhXlnn2uoTUORIpzl7v8BGsmYF1NRoY8WavdybG
	85ltwtw8X8VSCOovFhf/eSyC5fVs7ruHqV+mI4UECB9m25E+6mox3qnpzh5j1F2Yren5tm
	tRY9SW2gfTwTIfHM2ycZ5wxD1sKv3sbOg57RXjkmLhLGtBAkTfozY8K1ylaaXXUXc3PqLg
	vlLSypmTbT/CkHpS2tNBfZr1RoMxygfCAJCquyavQ9AletAPKArM+F8YkdEtBA==
From: Pauli Virtanen <pav@iki.fi>
To: linux-bluetooth@vger.kernel.org
Cc: Pauli Virtanen <pav@iki.fi>
Subject: [PATCH BlueZ v7 5/7] sco-tester: add TX timestamping test
Date: Thu,  4 Apr 2024 19:21:21 +0300
Message-ID: <49c69c978e015dd878d2262842ae22b21f72e56a.1712243675.git.pav@iki.fi>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1712243675.git.pav@iki.fi>
References: <cover.1712243675.git.pav@iki.fi>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add test:

SCO CVSD Send - TX Timestamping
---
 tools/sco-tester.c | 98 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 94 insertions(+), 4 deletions(-)

diff --git a/tools/sco-tester.c b/tools/sco-tester.c
index ecc65e092..ff8a3613f 100644
--- a/tools/sco-tester.c
+++ b/tools/sco-tester.c
@@ -31,6 +31,8 @@
 #include "src/shared/mgmt.h"
 #include "src/shared/util.h"
 
+#include "tester.h"
+
 struct test_data {
 	const void *test_data;
 	struct mgmt *mgmt;
@@ -38,15 +40,24 @@ struct test_data {
 	struct hciemu *hciemu;
 	enum hciemu_type hciemu_type;
 	unsigned int io_id;
+	unsigned int err_io_id;
 	int sk;
 	bool disable_esco;
 	bool enable_codecs;
+	int step;
+	struct tx_tstamp_data tx_ts;
 };
 
 struct sco_client_data {
 	int expect_err;
 	const uint8_t *send_data;
 	uint16_t data_len;
+
+	/* Enable SO_TIMESTAMPING with these flags */
+	uint32_t so_timestamping;
+
+	/* Number of additional packets to send. */
+	unsigned int repeat_send;
 };
 
 static void print_debug(const char *str, void *user_data)
@@ -227,8 +238,10 @@ static void test_data_free(void *test_data)
 			break; \
 		user->hciemu_type = HCIEMU_TYPE_BREDRLE; \
 		user->io_id = 0; \
+		user->err_io_id = 0; \
 		user->sk = -1; \
 		user->test_data = data; \
+		user->step = 0; \
 		user->disable_esco = _disable_esco; \
 		user->enable_codecs = _enable_codecs; \
 		tester_add_full(name, data, \
@@ -265,6 +278,16 @@ static const struct sco_client_data connect_send_success = {
 	.send_data = data
 };
 
+static const struct sco_client_data connect_send_tx_timestamping = {
+	.expect_err = 0,
+	.data_len = sizeof(data),
+	.send_data = data,
+	.so_timestamping = (SOF_TIMESTAMPING_SOFTWARE |
+					SOF_TIMESTAMPING_OPT_ID |
+					SOF_TIMESTAMPING_TX_SOFTWARE),
+	.repeat_send = 2,
+};
+
 static void client_connectable_complete(uint16_t opcode, uint8_t status,
 					const void *param, uint8_t len,
 					void *user_data)
@@ -595,6 +618,59 @@ static int connect_sco_sock(struct test_data *data, int sk)
 	return 0;
 }
 
+static gboolean recv_errqueue(GIOChannel *io, GIOCondition cond,
+							gpointer user_data)
+{
+	struct test_data *data = user_data;
+	const struct sco_client_data *scodata = data->test_data;
+	int sk = g_io_channel_unix_get_fd(io);
+	int err;
+
+	data->step--;
+
+	err = tx_tstamp_recv(&data->tx_ts, sk, scodata->data_len);
+	if (err > 0)
+		return TRUE;
+	else if (!err && !data->step)
+		tester_test_passed();
+	else
+		tester_test_failed();
+
+	data->err_io_id = 0;
+	return FALSE;
+}
+
+static void sco_tx_timestamping(struct test_data *data, GIOChannel *io)
+{
+	const struct sco_client_data *scodata = data->test_data;
+	int so = scodata->so_timestamping;
+	int sk;
+	int err;
+	unsigned int count;
+
+	if (!(scodata->so_timestamping & SOF_TIMESTAMPING_TX_RECORD_MASK))
+		return;
+
+	sk = g_io_channel_unix_get_fd(io);
+
+	tester_print("Enabling TX timestamping");
+
+	tx_tstamp_init(&data->tx_ts, scodata->so_timestamping);
+
+	for (count = 0; count < scodata->repeat_send + 1; ++count)
+		data->step += tx_tstamp_expect(&data->tx_ts);
+
+	err = setsockopt(sk, SOL_SOCKET, SO_TIMESTAMPING, &so, sizeof(so));
+	if (err < 0) {
+		tester_warn("setsockopt SO_TIMESTAMPING: %s (%d)",
+						strerror(errno), errno);
+		tester_test_failed();
+		return;
+	}
+
+	data->err_io_id = g_io_add_watch(io, G_IO_ERR, recv_errqueue, data);
+}
+
 static gboolean sco_connect_cb(GIOChannel *io, GIOCondition cond,
 							gpointer user_data)
 {
@@ -618,11 +694,21 @@ static gboolean sco_connect_cb(GIOChannel *io, GIOCondition cond,
 		tester_print("Successfully connected");
 
 	if (scodata->send_data) {
-		ssize_t ret;
+		ssize_t ret = 0;
+		unsigned int count;
+
+		data->step = 0;
 
-		tester_print("Writing %u bytes of data", scodata->data_len);
+		sco_tx_timestamping(data, io);
 
-		ret = write(sk, scodata->send_data, scodata->data_len);
+		tester_print("Writing %u*%u bytes of data",
+				scodata->repeat_send + 1, scodata->data_len);
+
+		for (count = 0; count < scodata->repeat_send + 1; ++count) {
+			ret = write(sk, scodata->send_data, scodata->data_len);
+			if (scodata->data_len != ret)
+				break;
+		}
 		if (scodata->data_len != ret) {
 			tester_warn("Failed to write %u bytes: %zu %s (%d)",
 					scodata->data_len, ret, strerror(errno),
@@ -633,7 +719,7 @@ static gboolean sco_connect_cb(GIOChannel *io, GIOCondition cond,
 
 	if (-err != scodata->expect_err)
 		tester_test_failed();
-	else
+	else if (!data->step)
 		tester_test_passed();
 
 	return FALSE;
@@ -869,6 +955,10 @@ int main(int argc, char *argv[])
 	test_sco("SCO CVSD Send - Success", &connect_send_success,
 					setup_powered, test_connect);
 
+	test_sco("SCO CVSD Send - TX Timestamping",
+					&connect_send_tx_timestamping,
+					setup_powered, test_connect);
+
 	test_offload_sco("Basic SCO Get Socket Option - Offload - Success",
 				NULL, setup_powered, test_codecs_getsockopt);
 
-- 
2.44.0


