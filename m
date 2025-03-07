Return-Path: <linux-bluetooth+bounces-10990-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC7CA56FEF
	for <lists+linux-bluetooth@lfdr.de>; Fri,  7 Mar 2025 19:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E4297A811B
	for <lists+linux-bluetooth@lfdr.de>; Fri,  7 Mar 2025 18:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E94241668;
	Fri,  7 Mar 2025 18:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="B5uw3yT3"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA0F18FC92
	for <linux-bluetooth@vger.kernel.org>; Fri,  7 Mar 2025 18:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741370529; cv=pass; b=UYOwTuWHVXEnsleVyf0KAMk92G/wk0NGZHVtQsAyAUZyWjdkcLpgmjw/1N5WEDrjBFxUSQMz6zMTpd/5eCVMoIEUG2shjvf/fGip4zBi8a3w18Y9QHI6avOh1n8tksD8O2PAR/MQNxNC53bExzzBN2pMvsStcAO8dO+nyMu7LFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741370529; c=relaxed/simple;
	bh=yumEmpbN2MEy4HR0ELu7efNuKnshv9gIxDx9RV7Q2+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bOY6pUBPxT3xrH6OJ6exb5Exa8NOhU2COifSQySR4qWG4MgFX21zUNOcikpOl2gPNCZKE9sfGb85v5gfmg+XAcN17CmQGpKzLZr9bu/My62T9uocHRzvNDMURLHyc03G3sg69rNH6TaOyx/W4HhR22jtAcuWplQe9DQ0W2VBWW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=B5uw3yT3; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from monolith.lan (unknown [193.138.7.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pav)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Z8YyX4D1BzylZ;
	Fri,  7 Mar 2025 20:01:56 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1741370517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GpfrvS38rqzSKds6++urKSjloPOYY0pqHouYeBAfW4M=;
	b=B5uw3yT3L6Vn2zd34DdBDZfSzgKLAflbMb+/keUw2KFMwR8pJaH1PSz87F43f3apDBMR4e
	uc8Hb2t0haO3T2fwwaKXmk+gDH/2G5EdbGrtoRHJvK3++15gXZhZUQaUa3De0xp47euJN9
	xoaODADOfGRNJ04cHKoWlmKOajf/gyE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1741370517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GpfrvS38rqzSKds6++urKSjloPOYY0pqHouYeBAfW4M=;
	b=XFmjO48HQvkMZiJXuicWCMIW1wu4ttjLu4JusftXpHgJiEvxodVVobiYvFBV/awfPB/wSo
	fsap5VyvzyXwf5UU0CYY6MYpsp0Bx0bYifoJN3fvA1hrh4lS2Gh8Apj6GjAAG3xiGkET1C
	eB/MEjOy6WZ9mQZegHFksAVDiwEnRkA=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pav smtp.mailfrom=pav@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1741370517; a=rsa-sha256; cv=none;
	b=vy40ih0lmI0wk3ODg9eRQCKK5mt8Pe2QkJT27VFSCfyWaH7R4SZ8vk5AWt8OAFCFitw8WP
	Eo1V7MCHyKhA4AgoTc2gEkq9PBWyd9/cNQR81v7hqAtXmQlVloVMXi3tGMZq1geEfIB2qY
	XExmnh4o2H1UD88bYF78R718RHP23XE=
From: Pauli Virtanen <pav@iki.fi>
To: linux-bluetooth@vger.kernel.org
Cc: Pauli Virtanen <pav@iki.fi>
Subject: [PATCH BlueZ v3 3/6] bthost: add hooks receiving SCO connections and data
Date: Fri,  7 Mar 2025 20:00:56 +0200
Message-ID: <a03dcf5ccf4dbc7950a8615408f26ca008728be2.1741370367.git.pav@iki.fi>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <747adb1a5f2a6b7b25e823bf22f8795f4c7c6322.1741370367.git.pav@iki.fi>
References: <747adb1a5f2a6b7b25e823bf22f8795f4c7c6322.1741370367.git.pav@iki.fi>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add hooks for new SCO connections and receiving SCO data. SCO
connection accept/reject flow remains unimplemented.
---
 emulator/bthost.c | 130 +++++++++++++++++++++++++++++++++++++++++++++-
 emulator/bthost.h |  10 ++++
 monitor/bt.h      |   1 +
 3 files changed, 139 insertions(+), 2 deletions(-)

diff --git a/emulator/bthost.c b/emulator/bthost.c
index a76b02ecc..5db750aae 100644
--- a/emulator/bthost.c
+++ b/emulator/bthost.c
@@ -39,6 +39,8 @@
 #define acl_handle(h)		(h & 0x0fff)
 #define acl_flags(h)		(h >> 12)
 
+#define sco_flags_status(f)	(f & 0x03)
+
 #define iso_flags_pb(f)		(f & 0x0003)
 #define iso_flags_ts(f)		((f >> 2) & 0x0001)
 #define iso_flags_pack(pb, ts)	(((pb) & 0x03) | (((ts) & 0x01) << 2))
@@ -138,8 +140,14 @@ struct rfcomm_chan_hook {
 	struct rfcomm_chan_hook *next;
 };
 
+struct sco_hook {
+	bthost_sco_hook_func_t func;
+	void *user_data;
+	bthost_destroy_func_t destroy;
+};
+
 struct iso_hook {
-	bthost_cid_hook_func_t func;
+	bthost_iso_hook_func_t func;
 	void *user_data;
 	bthost_destroy_func_t destroy;
 };
@@ -155,6 +163,7 @@ struct btconn {
 	struct rcconn *rcconns;
 	struct cid_hook *cid_hooks;
 	struct rfcomm_chan_hook *rfcomm_chan_hooks;
+	struct sco_hook *sco_hook;
 	struct iso_hook *iso_hook;
 	struct btconn *next;
 	void *smp_data;
@@ -241,6 +250,8 @@ struct bthost {
 	void *cmd_complete_data;
 	bthost_new_conn_cb new_conn_cb;
 	void *new_conn_data;
+	bthost_new_conn_cb new_sco_cb;
+	void *new_sco_data;
 	bthost_accept_conn_cb accept_iso_cb;
 	bthost_new_conn_cb new_iso_cb;
 	void *new_iso_data;
@@ -326,9 +337,13 @@ static void btconn_free(struct btconn *conn)
 		free(hook);
 	}
 
+	if (conn->sco_hook && conn->sco_hook->destroy)
+		conn->sco_hook->destroy(conn->sco_hook->user_data);
+
 	if (conn->iso_hook && conn->iso_hook->destroy)
 		conn->iso_hook->destroy(conn->iso_hook->user_data);
 
+	free(conn->sco_hook);
 	free(conn->iso_hook);
 	free(conn->recv_data);
 	free(conn);
@@ -722,6 +737,30 @@ void bthost_add_cid_hook(struct bthost *bthost, uint16_t handle, uint16_t cid,
 	conn->cid_hooks = hook;
 }
 
+void bthost_add_sco_hook(struct bthost *bthost, uint16_t handle,
+				bthost_sco_hook_func_t func, void *user_data,
+				bthost_destroy_func_t destroy)
+{
+	struct sco_hook *hook;
+	struct btconn *conn;
+
+	conn = bthost_find_conn(bthost, handle);
+	if (!conn || conn->sco_hook)
+		return;
+
+	hook = malloc(sizeof(*hook));
+	if (!hook)
+		return;
+
+	memset(hook, 0, sizeof(*hook));
+
+	hook->func = func;
+	hook->user_data = user_data;
+	hook->destroy = destroy;
+
+	conn->sco_hook = hook;
+}
+
 void bthost_add_iso_hook(struct bthost *bthost, uint16_t handle,
 				bthost_iso_hook_func_t func, void *user_data,
 				bthost_destroy_func_t destroy)
@@ -1184,6 +1223,29 @@ static void init_conn(struct bthost *bthost, uint16_t handle,
 	}
 }
 
+static void init_sco(struct bthost *bthost, uint16_t handle,
+				const uint8_t *bdaddr, uint8_t addr_type)
+{
+	struct btconn *conn;
+
+	bthost_debug(bthost, "SCO handle 0x%4.4x", handle);
+
+	conn = malloc(sizeof(*conn));
+	if (!conn)
+		return;
+
+	memset(conn, 0, sizeof(*conn));
+	conn->handle = handle;
+	memcpy(conn->bdaddr, bdaddr, 6);
+	conn->addr_type = addr_type;
+
+	conn->next = bthost->conns;
+	bthost->conns = conn;
+
+	if (bthost->new_sco_cb)
+		bthost->new_sco_cb(handle, bthost->new_sco_data);
+}
+
 static void evt_conn_complete(struct bthost *bthost, const void *data,
 								uint8_t len)
 {
@@ -1195,7 +1257,13 @@ static void evt_conn_complete(struct bthost *bthost, const void *data,
 	if (ev->status)
 		return;
 
-	init_conn(bthost, le16_to_cpu(ev->handle), ev->bdaddr, BDADDR_BREDR);
+	if (ev->link_type == 0x00) {
+		init_sco(bthost, le16_to_cpu(ev->handle), ev->bdaddr,
+								BDADDR_BREDR);
+	} else if (ev->link_type == 0x01) {
+		init_conn(bthost, le16_to_cpu(ev->handle), ev->bdaddr,
+								BDADDR_BREDR);
+	}
 }
 
 static void evt_disconn_complete(struct bthost *bthost, const void *data,
@@ -1397,6 +1465,20 @@ static void evt_simple_pairing_complete(struct bthost *bthost, const void *data,
 		return;
 }
 
+static void evt_sync_conn_complete(struct bthost *bthost, const void *data,
+								uint8_t len)
+{
+	const struct bt_hci_evt_sync_conn_complete *ev = data;
+
+	if (len < sizeof(*ev))
+		return;
+
+	if (ev->status)
+		return;
+
+	init_sco(bthost, le16_to_cpu(ev->handle), ev->bdaddr, BDADDR_BREDR);
+}
+
 static void evt_le_conn_complete(struct bthost *bthost, const void *data,
 								uint8_t len)
 {
@@ -1705,6 +1787,10 @@ static void process_evt(struct bthost *bthost, const void *data, uint16_t len)
 		evt_disconn_complete(bthost, param, hdr->plen);
 		break;
 
+	case BT_HCI_EVT_SYNC_CONN_COMPLETE:
+		evt_sync_conn_complete(bthost, param, hdr->plen);
+		break;
+
 	case BT_HCI_EVT_NUM_COMPLETED_PACKETS:
 		evt_num_completed_packets(bthost, param, hdr->plen);
 		break;
@@ -2947,6 +3033,36 @@ static void process_acl(struct bthost *bthost, const void *data, uint16_t len)
 	}
 }
 
+static void process_sco(struct bthost *bthost, const void *data, uint16_t len)
+{
+	const struct bt_hci_sco_hdr *sco_hdr = data;
+	uint16_t handle, sco_len;
+	uint8_t status;
+	struct btconn *conn;
+	struct sco_hook *hook;
+
+	sco_len = le16_to_cpu(sco_hdr->dlen);
+	if (len != sizeof(*sco_hdr) + sco_len)
+		return;
+
+	handle = acl_handle(sco_hdr->handle);
+	status = sco_flags_status(acl_flags(sco_hdr->handle));
+
+	conn = bthost_find_conn(bthost, handle);
+	if (!conn) {
+		bthost_debug(bthost, "Unknown handle: 0x%4.4x", handle);
+		return;
+	}
+
+	bthost_debug(bthost, "SCO data: %u bytes", sco_len);
+
+	hook = conn->sco_hook;
+	if (!hook)
+		return;
+
+	hook->func(sco_hdr->data, sco_len, status, hook->user_data);
+}
+
 static void process_iso_data(struct bthost *bthost, struct btconn *conn,
 					const void *data, uint16_t len)
 {
@@ -3062,6 +3178,9 @@ void bthost_receive_h4(struct bthost *bthost, const void *data, uint16_t len)
 	case BT_H4_ACL_PKT:
 		process_acl(bthost, data + 1, len - 1);
 		break;
+	case BT_H4_SCO_PKT:
+		process_sco(bthost, data + 1, len - 1);
+		break;
 	case BT_H4_ISO_PKT:
 		process_iso(bthost, data + 1, len - 1);
 		break;
@@ -3085,6 +3204,13 @@ void bthost_set_connect_cb(struct bthost *bthost, bthost_new_conn_cb cb,
 	bthost->new_conn_data = user_data;
 }
 
+void bthost_set_sco_cb(struct bthost *bthost, bthost_new_conn_cb cb,
+							void *user_data)
+{
+	bthost->new_sco_cb = cb;
+	bthost->new_sco_data = user_data;
+}
+
 void bthost_set_iso_cb(struct bthost *bthost, bthost_accept_conn_cb accept,
 				bthost_new_conn_cb cb, void *user_data)
 {
diff --git a/emulator/bthost.h b/emulator/bthost.h
index 2c5b0d516..405d66bf0 100644
--- a/emulator/bthost.h
+++ b/emulator/bthost.h
@@ -51,6 +51,9 @@ typedef void (*bthost_new_conn_cb) (uint16_t handle, void *user_data);
 void bthost_set_connect_cb(struct bthost *bthost, bthost_new_conn_cb cb,
 							void *user_data);
 
+void bthost_set_sco_cb(struct bthost *bthost, bthost_new_conn_cb cb,
+							void *user_data);
+
 void bthost_set_iso_cb(struct bthost *bthost, bthost_accept_conn_cb accept,
 				bthost_new_conn_cb cb, void *user_data);
 
@@ -69,6 +72,13 @@ typedef void (*bthost_cid_hook_func_t)(const void *data, uint16_t len,
 void bthost_add_cid_hook(struct bthost *bthost, uint16_t handle, uint16_t cid,
 				bthost_cid_hook_func_t func, void *user_data);
 
+typedef void (*bthost_sco_hook_func_t)(const void *data, uint16_t len,
+					uint8_t status, void *user_data);
+
+void bthost_add_sco_hook(struct bthost *bthost, uint16_t handle,
+				bthost_sco_hook_func_t func, void *user_data,
+				bthost_destroy_func_t destroy);
+
 typedef void (*bthost_iso_hook_func_t)(const void *data, uint16_t len,
 							void *user_data);
 
diff --git a/monitor/bt.h b/monitor/bt.h
index 6fb81abfe..e708e580f 100644
--- a/monitor/bt.h
+++ b/monitor/bt.h
@@ -523,6 +523,7 @@ struct bt_hci_acl_hdr {
 struct bt_hci_sco_hdr {
 	uint16_t handle;
 	uint8_t  dlen;
+	uint8_t  data[];
 } __attribute__ ((packed));
 
 struct bt_hci_iso_hdr {
-- 
2.48.1


