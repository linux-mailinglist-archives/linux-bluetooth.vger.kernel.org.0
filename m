Return-Path: <linux-bluetooth+bounces-2537-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABED587C297
	for <lists+linux-bluetooth@lfdr.de>; Thu, 14 Mar 2024 19:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6222628231A
	for <lists+linux-bluetooth@lfdr.de>; Thu, 14 Mar 2024 18:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C489A77652;
	Thu, 14 Mar 2024 18:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="GgjbwI0H"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B2A7762B
	for <linux-bluetooth@vger.kernel.org>; Thu, 14 Mar 2024 18:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710440501; cv=pass; b=PedLht+LSdMpaKgC7RdnPYab6BxDmeyXayXhGMrtI7DH6w5g/DablrqyMu1Qvg/Xr+syzv1UHdgcwAv35vbz2i7r/fnKr+zPrN0LcSPDSLN3b48f21+gM5XUGupCYu9vhKBtCDeHLVHgLvymhwlfJZ8VtCqiuttqO+WU7d0D58w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710440501; c=relaxed/simple;
	bh=1Ux7vU2EN6XfhF2iHSUa7m1yjbwoXsqdQj+LuIZ5DzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJ3cB/0m/oSt7yfLIlrPKuwcTUaL9J6JlQrKUDbV3yB7vw3xymOuWde05HlXebnKpc+/+woMaXlnLlld1SCPp27LfBJ0O4SG2fT0ac3VBT1N9M9p4jpf+jM/MDso1zdHAgVLUXC9FcB5c2cNNyxIssUfMul93m/onMv1z8TtoXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=GgjbwI0H; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from monolith.lan (unknown [193.138.7.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pav)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4TwbLM02frz49PyZ;
	Thu, 14 Mar 2024 20:21:30 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1710440491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DwyCCRgw3xaKuhE1uxZhmGMrtIEPd+B5gXuytRvdC/E=;
	b=GgjbwI0HrLFDszInDQdGkdkLn+6FqYuGmDMFbvcQAhhM6nyzWwJd8FdOpXcetdCMGSZw9N
	E2cIjQU1h04VrQ3NMqYYAOHqL8z1LBQmJh+FmwPo1H1JURBRDnQv1INEMX/DA0+Xa2s4zZ
	w3a78O8/r67FZrcI2+Fid0v3f3rrZb+z0mtLiXXloFKDWealcx3XFOVP5eZ+89Wl/6k2dd
	l4+Jtz9dfhmRGu3WiR/YP3+GQtm1ZnQ62agObCRE4578eN5Kp7oECcph/N9Cx46oWC+0ov
	vrfWOMCrjS2SMQ5LnByWI2Rzn9VzTVXMCYn+E1dH+0Kz251mnNm8OrPC/OYSDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1710440491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DwyCCRgw3xaKuhE1uxZhmGMrtIEPd+B5gXuytRvdC/E=;
	b=SbGEcxg5Y4tJmak01VMZd5u2BoeYkPzTSAOpngAhaiwa0LUUUhV9GfrKzZnPRyyeZIq0xD
	qWAEElfjPv5ffKfPr6UBCU34k66fE+CS8hcXuBcF+u4fN+GhGIRzDZW/UO2atOYr1v3iE1
	r0teZT4WHIrCOuXAyQq2t617k0KAB0HWTBb1+0GoYs1yF+XsHWIIFlhgrzYGhIWU6IQSl3
	VIxwmJX+o+jEj4DJyHCyVEeJ+eZ8Dx49sBrKrSeySgec9wEqADqBUm/6xt/AciSDumN7fO
	M9+tAC3t63ZVSRezh+8dpQh/mZZ3u/sYsUhPWhBiNBm6Slw4DcnawSusg/UCKA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pav smtp.mailfrom=pav@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1710440491; a=rsa-sha256;
	cv=none;
	b=qcEgjWLD6U90XAeXv8ytgIk3CMkbHcFc9m4xIHxzoTMZ0zXbNM1Nsp2bCdZDX+Hlq0Qt7L
	V0947HuwyVQWA52nOOLUQ4hGaP9AMSKutv2h2Rh8lACufI7LEnW4wNWimNVtaLVfreAJ8K
	SakfS/NE8xGXS9jfR29VlPz9BQptrM9iVNCYvQsZqXdOph46gfrvMplAEsAhjuuJTCtbbf
	E9kHQD29FmztmKmGXNx3VAfkLHZC8M2RxSGV2pu3a4cCRqGr3/YXzle6n/h7x8UAAMLsyF
	HMEJBEj/R+VEX9jBppjF1ocRPuQ53qGhg3rpYskTH1olcoVB2d2awXVxmYPNZQ==
From: Pauli Virtanen <pav@iki.fi>
To: linux-bluetooth@vger.kernel.org
Cc: Pauli Virtanen <pav@iki.fi>
Subject: [PATCH BlueZ v2 5/9] sco-tester: add TX timestamping test
Date: Thu, 14 Mar 2024 20:21:14 +0200
Message-ID: <87e454b997d2211e1bea4b017a5f5ca22734550f.1710440408.git.pav@iki.fi>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710440408.git.pav@iki.fi>
References: <cover.1710440408.git.pav@iki.fi>
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
 tools/sco-tester.c | 94 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 91 insertions(+), 3 deletions(-)

diff --git a/tools/sco-tester.c b/tools/sco-tester.c
index ecc65e092..8997e86f7 100644
--- a/tools/sco-tester.c
+++ b/tools/sco-tester.c
@@ -31,6 +31,8 @@
 #include "src/shared/mgmt.h"
 #include "src/shared/util.h"
 
+#include "tester-utils.h"
+
 struct test_data {
 	const void *test_data;
 	struct mgmt *mgmt;
@@ -38,15 +40,20 @@ struct test_data {
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
+	uint32_t so_timestamping;
+	unsigned int send_extra;
 };
 
 static void print_debug(const char *str, void *user_data)
@@ -227,8 +234,10 @@ static void test_data_free(void *test_data)
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
@@ -265,6 +274,16 @@ static const struct sco_client_data connect_send_success = {
 	.send_data = data
 };
 
+static const struct sco_client_data connect_send_tx_timestamping = {
+	.expect_err = 0,
+	.data_len = sizeof(data),
+	.send_data = data,
+	.so_timestamping = (SOF_TIMESTAMPING_SOFTWARE |
+					SOF_TIMESTAMPING_OPT_ID |
+					SOF_TIMESTAMPING_TX_SOFTWARE),
+	.send_extra = 2,
+};
+
 static void client_connectable_complete(uint16_t opcode, uint8_t status,
 					const void *param, uint8_t len,
 					void *user_data)
@@ -595,6 +614,61 @@ static int connect_sco_sock(struct test_data *data, int sk)
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
+	struct so_timestamping so = {
+		.flags = scodata->so_timestamping,
+	};
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
+	for (count = 0; count < scodata->send_extra + 1; ++count)
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
@@ -619,10 +693,20 @@ static gboolean sco_connect_cb(GIOChannel *io, GIOCondition cond,
 
 	if (scodata->send_data) {
 		ssize_t ret;
+		unsigned int count;
+
+		data->step = 0;
 
-		tester_print("Writing %u bytes of data", scodata->data_len);
+		sco_tx_timestamping(data, io);
 
-		ret = write(sk, scodata->send_data, scodata->data_len);
+		tester_print("Writing %u*%u bytes of data",
+				scodata->send_extra + 1, scodata->data_len);
+
+		for (count = 0; count < scodata->send_extra + 1; ++count) {
+			ret = write(sk, scodata->send_data, scodata->data_len);
+			if (scodata->data_len != ret)
+				break;
+		}
 		if (scodata->data_len != ret) {
 			tester_warn("Failed to write %u bytes: %zu %s (%d)",
 					scodata->data_len, ret, strerror(errno),
@@ -633,7 +717,7 @@ static gboolean sco_connect_cb(GIOChannel *io, GIOCondition cond,
 
 	if (-err != scodata->expect_err)
 		tester_test_failed();
-	else
+	else if (!data->step)
 		tester_test_passed();
 
 	return FALSE;
@@ -869,6 +953,10 @@ int main(int argc, char *argv[])
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


