Return-Path: <linux-bluetooth+bounces-3176-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A280E89783A
	for <lists+linux-bluetooth@lfdr.de>; Wed,  3 Apr 2024 20:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 300D61F23667
	for <lists+linux-bluetooth@lfdr.de>; Wed,  3 Apr 2024 18:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D197315443A;
	Wed,  3 Apr 2024 18:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="emz1ACdJ"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BF1152DEE
	for <linux-bluetooth@vger.kernel.org>; Wed,  3 Apr 2024 18:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712168822; cv=pass; b=b5a7rgzsXXBZLde+IaUPQe00wu81A56UdQKdO2TCrs2tkqEBT02nFfHRrnzj+B9SoVKcSEtdJ1mGfQ7Z31vC4MIytokdLw7ypsfWsUpNOWyYsrkiKzqEyTk8UnvdPfezyiulpUsDu1o7AmRKym61t9jYI7rqlbVj2p0hw1zyVDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712168822; c=relaxed/simple;
	bh=IzDRwvRMtddxrcgA/d2EGmSsyrT1/2HWTtkkQjxzHCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qwouFFmJfn2DbIoxQW/iZkG5s2Fn1JWkHIRE86g6QpBofft/Kqx4pRazZd3PhmZvMaYyIU6ARIn8t4IL//IkdBkv2snV3qR6x7tcwtxVDvjWimFUZBveYODu6k2OcrAGMgeFELmbTGeG7BnuKJUHhZjq1MdQNl8QBNO0zmz3IqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=emz1ACdJ; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from monolith.lan (unknown [193.138.7.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pav)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4V8tWD5CC8z49Q6j;
	Wed,  3 Apr 2024 21:26:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1712168808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NjOGKLkJqAhwNUuD79hb5Z7gLNl4MQtD5KrjZOxfySs=;
	b=emz1ACdJP1a80bOVJdKZr+G+3tyE5Fpy9cBkDP6857BLHLRpx05fFuaT37yi2An8dg3Xhs
	gy+Yno3Hi22aULGfVTK+3N79P7bay7b3q9ZuZQtyHHjJ3H+yaaZbomj76nk580HloVlOC6
	WzVPd61mplh2BQzr/eluK0o15V78NrNenHQPyDHq3GrWlra6YGf0O5nCMUll+fAgygGzcd
	t6S842imTBG3QJPvbEIBqJikTS084treir25zIv32gm/QOUIcTzYOuDjkX9tg8MHpmm0Lj
	bW9xdZtwvPJ/plgB8MavHyLVMB61jE+2ZmFjVc0TOlGs7EP9MB7BPNlOley70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1712168808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NjOGKLkJqAhwNUuD79hb5Z7gLNl4MQtD5KrjZOxfySs=;
	b=ewzvigxooydtZbp3nQUiX3/WvaUuBBELo57SoEynYUNZ3llKQHnZNZdn0BcDvjvHK5btQ5
	36d1WiyhoWk64ciHIemFHbNnDjKTYCsxFpf0wrudPYlC4kSHJL+VJge5llj8TvO6JThIBO
	eW35C0y4hQJRpzviyPZXF6M1plKksOE4Z7CLXS57edCepsoEoQ26oq+7AgCYUbU1dBg9/S
	nDiiYl4LtkmrF14wiN5ca5yEhHNTPGTeig9Yqhs7q0LNmYinHgW5NX5eKVOUw+D/WnzRla
	qXK60jnkoP4LB9vAWaAu1D3uj2j1MMcqLHbhO8G1IOb/AkOsp93TxIbIVjp6mw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pav smtp.mailfrom=pav@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1712168808; a=rsa-sha256;
	cv=none;
	b=oTt9il2DCnyFVkaqeGu42YGmxFGnhAQUggX3hT7aOYQ8bm+phAgX2QsY6mQnzqcH4l0AiO
	LaBnYYzK38nSHIGUSRuk0IpaQuUC/b38unkffo4Ok0G7ELvdLzl6gr2ISHtwU1DsqF8KPS
	JkhsEwoWFwDElGp/zvYCDt2GE9DPunBOB+gfLSYcRRiWMF0U2C0y+aCvXPovkhnDEFpaA5
	1KrhJlCKa3e5e/1BQCeVRRfi9QJiXRuodlPyEyi3MAF0Orx8dKALihmX7JeyoNfSYZNzSm
	1SQLOvSYDpmNo1vYdTSYzuwFSpsqCvS1VV9lkjH9+LdMZnFQwe6zEUlT6uhwkw==
From: Pauli Virtanen <pav@iki.fi>
To: linux-bluetooth@vger.kernel.org
Cc: Pauli Virtanen <pav@iki.fi>
Subject: [PATCH BlueZ v6 6/7] bthost: handle client L2CAP conn in LE credit based mode
Date: Wed,  3 Apr 2024 21:26:36 +0300
Message-ID: <dbaee7bc348285d6136873c158a4e35b49b37633.1712168788.git.pav@iki.fi>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1712168788.git.pav@iki.fi>
References: <cover.1712168788.git.pav@iki.fi>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow bthost hooks to receive data from L2CAP LE credit based
connections. Handle LE credit header when receiving, and reassemble
received SDU.

Handle L2CAP LE credit header also in bthost_send_cid.
---
 emulator/bthost.c | 205 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 180 insertions(+), 25 deletions(-)

diff --git a/emulator/bthost.c b/emulator/bthost.c
index ca405d721..d69e3d34e 100644
--- a/emulator/bthost.c
+++ b/emulator/bthost.c
@@ -163,11 +163,21 @@ struct btconn {
 	void *recv_data;
 };
 
+enum l2cap_mode {
+	L2CAP_MODE_OTHER,
+	L2CAP_MODE_LE_CRED,
+	L2CAP_MODE_LE_ENH_CRED,
+};
+
 struct l2conn {
+	struct l2conn *next;
 	uint16_t scid;
 	uint16_t dcid;
 	uint16_t psm;
-	struct l2conn *next;
+	enum l2cap_mode mode;
+	uint16_t data_len;
+	uint16_t recv_len;
+	void *recv_data;
 };
 
 struct rcconn {
@@ -276,6 +286,7 @@ struct bthost *bthost_create(void)
 
 static void l2conn_free(struct l2conn *conn)
 {
+	free(conn->recv_data);
 	free(conn);
 }
 
@@ -361,6 +372,7 @@ static struct l2conn *bthost_add_l2cap_conn(struct bthost *bthost,
 	l2conn->psm = psm;
 	l2conn->scid = scid;
 	l2conn->dcid = dcid;
+	l2conn->mode = L2CAP_MODE_OTHER;
 
 	l2conn->next = conn->l2conns;
 	conn->l2conns = l2conn;
@@ -416,6 +428,19 @@ static struct l2conn *btconn_find_l2cap_conn_by_scid(struct btconn *conn,
 	return NULL;
 }
 
+static struct l2conn *btconn_find_l2cap_conn_by_dcid(struct btconn *conn,
+								uint16_t dcid)
+{
+	struct l2conn *l2conn;
+
+	for (l2conn = conn->l2conns; l2conn != NULL; l2conn = l2conn->next) {
+		if (l2conn->dcid == dcid)
+			return l2conn;
+	}
+
+	return NULL;
+}
+
 static struct l2cap_conn_cb_data *bthost_find_l2cap_cb_by_psm(
 					struct bthost *bthost, uint16_t psm)
 {
@@ -610,14 +635,24 @@ static void send_iov(struct bthost *bthost, uint16_t handle, uint16_t cid,
 }
 
 static void send_acl(struct bthost *bthost, uint16_t handle, uint16_t cid,
-						const void *data, uint16_t len)
+				bool sdu_hdr, const void *data, uint16_t len)
 {
-	struct iovec iov;
+	struct iovec iov[2];
+	uint16_t sdu;
+	int num = 0;
+
+	if (sdu_hdr) {
+		sdu = cpu_to_le16(len);
+		iov[num].iov_base = &sdu;
+		iov[num].iov_len = sizeof(sdu);
+		num++;
+	}
 
-	iov.iov_base = (void *) data;
-	iov.iov_len = len;
+	iov[num].iov_base = (void *) data;
+	iov[num].iov_len = len;
+	num++;
 
-	send_iov(bthost, handle, cid, &iov, 1);
+	send_iov(bthost, handle, cid, iov, num);
 }
 
 static uint8_t l2cap_sig_send(struct bthost *bthost, struct btconn *conn,
@@ -712,12 +747,19 @@ void bthost_send_cid(struct bthost *bthost, uint16_t handle, uint16_t cid,
 					const void *data, uint16_t len)
 {
 	struct btconn *conn;
+	struct l2conn *l2conn;
+	bool sdu_hdr = false;
 
 	conn = bthost_find_conn(bthost, handle);
 	if (!conn)
 		return;
 
-	send_acl(bthost, handle, cid, data, len);
+	l2conn = btconn_find_l2cap_conn_by_dcid(conn, cid);
+	if (l2conn && (l2conn->mode == L2CAP_MODE_LE_CRED ||
+			l2conn->mode == L2CAP_MODE_LE_ENH_CRED))
+		sdu_hdr = true;
+
+	send_acl(bthost, handle, cid, sdu_hdr, data, len);
 }
 
 void bthost_send_cid_v(struct bthost *bthost, uint16_t handle, uint16_t cid,
@@ -1780,7 +1822,7 @@ static void rfcomm_sabm_send(struct bthost *bthost, struct btconn *conn,
 	cmd.length = RFCOMM_LEN8(0);
 	cmd.fcs = rfcomm_fcs2((uint8_t *)&cmd);
 
-	send_acl(bthost, conn->handle, l2conn->dcid, &cmd, sizeof(cmd));
+	send_acl(bthost, conn->handle, l2conn->dcid, false, &cmd, sizeof(cmd));
 }
 
 static bool l2cap_conn_rsp(struct bthost *bthost, struct btconn *conn,
@@ -2111,6 +2153,7 @@ static bool l2cap_le_conn_req(struct bthost *bthost, struct btconn *conn,
 				uint8_t ident, const void *data, uint16_t len)
 {
 	const struct bt_l2cap_pdu_le_conn_req *req = data;
+	struct l2cap_conn_cb_data *cb_data;
 	struct bt_l2cap_pdu_le_conn_rsp rsp;
 	uint16_t psm;
 
@@ -2125,7 +2168,8 @@ static bool l2cap_le_conn_req(struct bthost *bthost, struct btconn *conn,
 	rsp.mps = 23;
 	rsp.credits = 1;
 
-	if (bthost_find_l2cap_cb_by_psm(bthost, psm))
+	cb_data = bthost_find_l2cap_cb_by_psm(bthost, psm);
+	if (cb_data)
 		rsp.dcid = cpu_to_le16(conn->next_cid++);
 	else
 		rsp.result = cpu_to_le16(0x0002); /* PSM Not Supported */
@@ -2133,6 +2177,20 @@ static bool l2cap_le_conn_req(struct bthost *bthost, struct btconn *conn,
 	l2cap_sig_send(bthost, conn, BT_L2CAP_PDU_LE_CONN_RSP, ident, &rsp,
 								sizeof(rsp));
 
+	if (!rsp.result) {
+		struct l2conn *l2conn;
+
+		l2conn = bthost_add_l2cap_conn(bthost, conn,
+							le16_to_cpu(rsp.dcid),
+							le16_to_cpu(req->scid),
+							le16_to_cpu(psm));
+		l2conn->mode = L2CAP_MODE_LE_CRED;
+
+		if (cb_data && l2conn->psm == cb_data->psm && cb_data->func)
+			cb_data->func(conn->handle, l2conn->dcid,
+							cb_data->user_data);
+	}
+
 	return true;
 }
 
@@ -2140,11 +2198,14 @@ static bool l2cap_le_conn_rsp(struct bthost *bthost, struct btconn *conn,
 				uint8_t ident, const void *data, uint16_t len)
 {
 	const struct bt_l2cap_pdu_le_conn_rsp *rsp = data;
+	struct l2conn *l2conn;
 
 	if (len < sizeof(*rsp))
 		return false;
 	/* TODO add L2CAP connection before with proper PSM */
-	bthost_add_l2cap_conn(bthost, conn, 0, le16_to_cpu(rsp->dcid), 0);
+	l2conn = bthost_add_l2cap_conn(bthost, conn, 0,
+						le16_to_cpu(rsp->dcid), 0);
+	l2conn->mode = L2CAP_MODE_LE_CRED;
 
 	return true;
 }
@@ -2197,16 +2258,19 @@ static bool l2cap_ecred_conn_rsp(struct bthost *bthost, struct btconn *conn,
 		uint16_t scid[5];
 	} __attribute__ ((packed)) *rsp = data;
 	int num_scid, i;
+	struct l2conn *l2conn;
 
 	if (len < sizeof(*rsp))
 		return false;
 
 	num_scid = len / sizeof(*rsp->scid);
 
-	for (i = 0; i < num_scid; i++)
+	for (i = 0; i < num_scid; i++) {
 		/* TODO add L2CAP connection before with proper PSM */
-		bthost_add_l2cap_conn(bthost, conn, 0,
+		l2conn = bthost_add_l2cap_conn(bthost, conn, 0,
 				      le16_to_cpu(rsp->scid[i]), 0);
+		l2conn->mode = L2CAP_MODE_LE_ENH_CRED;
+	}
 
 
 	return true;
@@ -2334,7 +2398,7 @@ static void rfcomm_ua_send(struct bthost *bthost, struct btconn *conn,
 	cmd.length = RFCOMM_LEN8(0);
 	cmd.fcs = rfcomm_fcs2((uint8_t *)&cmd);
 
-	send_acl(bthost, conn->handle, l2conn->dcid, &cmd, sizeof(cmd));
+	send_acl(bthost, conn->handle, l2conn->dcid, false, &cmd, sizeof(cmd));
 }
 
 static void rfcomm_dm_send(struct bthost *bthost, struct btconn *conn,
@@ -2348,7 +2412,7 @@ static void rfcomm_dm_send(struct bthost *bthost, struct btconn *conn,
 	cmd.length = RFCOMM_LEN8(0);
 	cmd.fcs = rfcomm_fcs2((uint8_t *)&cmd);
 
-	send_acl(bthost, conn->handle, l2conn->dcid, &cmd, sizeof(cmd));
+	send_acl(bthost, conn->handle, l2conn->dcid, false, &cmd, sizeof(cmd));
 }
 
 static void rfcomm_sabm_recv(struct bthost *bthost, struct btconn *conn,
@@ -2637,12 +2701,97 @@ static void process_rfcomm(struct bthost *bthost, struct btconn *conn,
 	}
 }
 
+static void append_l2conn_data(struct bthost *bthost, struct l2conn *conn,
+				const void *data, uint16_t len)
+{
+	if (!conn->recv_data) {
+		bthost_debug(bthost, "Unexpected L2CAP SDU data: sCID 0x%4.4x ",
+								conn->scid);
+		return;
+	}
+
+	if (conn->recv_len + len > conn->data_len) {
+		bthost_debug(bthost, "Unexpected L2CAP SDU data: sCID 0x%4.4x ",
+								conn->scid);
+		return;
+	}
+
+	memcpy(conn->recv_data + conn->recv_len, data, len);
+	conn->recv_len += len;
+
+	bthost_debug(bthost, "L2CAP SDU data: %u/%u bytes", conn->recv_len,
+							conn->data_len);
+}
+
+static void free_l2conn_data(struct l2conn *conn)
+{
+	free(conn->recv_data);
+	conn->recv_data = NULL;
+	conn->recv_len = 0;
+	conn->data_len = 0;
+}
+
+static void new_l2conn_data(struct bthost *bthost, struct l2conn *conn,
+								uint16_t len)
+{
+	free(conn->recv_data);
+	conn->recv_data = malloc(len);
+	conn->recv_len = 0;
+	conn->data_len = len;
+}
+
+static bool process_l2cap_conn(struct bthost *bthost, struct btconn *conn,
+				struct l2conn *l2conn, struct iovec *data)
+{
+	struct bt_l2cap_pdu_le_flowctl_creds creds;
+	uint16_t sdu;
+
+	if (!l2conn)
+		return true;
+
+	switch (l2conn->mode) {
+	case L2CAP_MODE_LE_CRED:
+	case L2CAP_MODE_LE_ENH_CRED:
+		break;
+	case L2CAP_MODE_OTHER:
+		return true;
+	}
+
+	/* Credit-based flow control */
+
+	creds.cid = cpu_to_le16(l2conn->scid);
+	creds.credits = cpu_to_le16(1);
+	l2cap_sig_send(bthost, conn, BT_L2CAP_PDU_LE_FLOWCTL_CREDS, 0,
+							&creds, sizeof(creds));
+
+	if (!l2conn->data_len) {
+		if (!util_iov_pull_le16(data, &sdu)) {
+			free_l2conn_data(l2conn);
+			bthost_debug(bthost, "L2CAP invalid SDU");
+			return false;
+		}
+		new_l2conn_data(bthost, l2conn, sdu);
+	}
+
+	append_l2conn_data(bthost, l2conn, data->iov_base, data->iov_len);
+
+	if (l2conn->recv_len < l2conn->data_len)
+		return false;  /* SDU incomplete */
+
+	l2conn->data_len = 0;
+	data->iov_base = l2conn->recv_data;
+	data->iov_len = l2conn->recv_len;
+
+	return true;
+}
+
 static void process_l2cap(struct bthost *bthost, struct btconn *conn,
-					const void *data, uint16_t len)
+					const void *buf, uint16_t len)
 {
-	const struct bt_l2cap_hdr *l2_hdr = data;
+	const struct bt_l2cap_hdr *l2_hdr = buf;
 	struct cid_hook *hook;
 	struct l2conn *l2conn;
+	struct iovec data;
 	uint16_t cid, l2_len;
 
 	l2_len = le16_to_cpu(l2_hdr->len);
@@ -2655,31 +2804,37 @@ static void process_l2cap(struct bthost *bthost, struct btconn *conn,
 	bthost_debug(bthost, "L2CAP data: %u bytes", l2_len);
 
 	cid = le16_to_cpu(l2_hdr->cid);
+	l2conn = btconn_find_l2cap_conn_by_scid(conn, cid);
+
+	data.iov_base = (void *)l2_hdr->data;
+	data.iov_len = l2_len;
+
+	if (!process_l2cap_conn(bthost, conn, l2conn, &data))
+		return;
 
 	hook = find_cid_hook(conn, cid);
 	if (hook) {
-		hook->func(l2_hdr->data, l2_len, hook->user_data);
+		hook->func(data.iov_base, data.iov_len, hook->user_data);
 		return;
 	}
 
 	switch (cid) {
 	case 0x0001:
-		l2cap_sig(bthost, conn, l2_hdr->data, l2_len);
+		l2cap_sig(bthost, conn, data.iov_base, data.iov_len);
 		break;
 	case 0x0005:
-		l2cap_le_sig(bthost, conn, l2_hdr->data, l2_len);
+		l2cap_le_sig(bthost, conn, data.iov_base, data.iov_len);
 		break;
 	case 0x0006:
-		smp_data(conn->smp_data, l2_hdr->data, l2_len);
+		smp_data(conn->smp_data, data.iov_base, data.iov_len);
 		break;
 	case 0x0007:
-		smp_bredr_data(conn->smp_data, l2_hdr->data, l2_len);
+		smp_bredr_data(conn->smp_data, data.iov_base, data.iov_len);
 		break;
 	default:
-		l2conn = btconn_find_l2cap_conn_by_scid(conn, cid);
 		if (l2conn && l2conn->psm == 0x0003)
-			process_rfcomm(bthost, conn, l2conn, l2_hdr->data,
-								l2_len);
+			process_rfcomm(bthost, conn, l2conn, data.iov_base,
+								data.iov_len);
 		else
 			bthost_debug(bthost,
 					"Packet for unknown CID 0x%04x (%u)",
@@ -3560,7 +3715,7 @@ void bthost_send_rfcomm_data(struct bthost *bthost, uint16_t handle,
 	}
 
 	uih_frame[uih_len - 1] = rfcomm_fcs((void *)hdr);
-	send_acl(bthost, handle, rcconn->scid, uih_frame, uih_len);
+	send_acl(bthost, handle, rcconn->scid, false, uih_frame, uih_len);
 
 	free(uih_frame);
 }
-- 
2.44.0


