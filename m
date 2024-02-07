Return-Path: <linux-bluetooth+bounces-1675-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 707DC84D310
	for <lists+linux-bluetooth@lfdr.de>; Wed,  7 Feb 2024 21:34:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 957241C24FF7
	for <lists+linux-bluetooth@lfdr.de>; Wed,  7 Feb 2024 20:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E341E525;
	Wed,  7 Feb 2024 20:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jR6GqrHa"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C3D1DFC1
	for <linux-bluetooth@vger.kernel.org>; Wed,  7 Feb 2024 20:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707338064; cv=none; b=PnUWrGPI5YTl0KsmUu3STjfLtjpdwmpYiF2darS8LVyBEaKbkWgVD2OcA4eU01N6pRGEayOpafjOF7oMG8ea3jQZlbOrY2IVbNOrolLND/KoOnOXUFR64xdTXGqO0mSKCPViBtuxeoW4L3ggrbbhBSCSpJvXQEQ4mUCKvv2vcDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707338064; c=relaxed/simple;
	bh=+senxQzRi/BSKq88rNzPhBmMeNgnHUhqJ12995VLSvo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=A5L3ce70RgqgfnGN/t5EuQqBShQJ0KZc1EhdG+mPSZ0gczX8p5SM77F5Qkrxe6JsTuRh6iUCSIRqVVlXRw+26hz3FMA9Z0lU9OduZhEXiX+/Tr68CtAgvLxVCKnXE+/fpLzTq8xarCCowBoxeEyTS9v0ru1xahlmeP1iA+P6kss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jR6GqrHa; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4c035b3203dso406524e0c.2
        for <linux-bluetooth@vger.kernel.org>; Wed, 07 Feb 2024 12:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707338060; x=1707942860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UFqW85g738ZJBKsao/neXIDJiHPMj8JK2ruHy8245gg=;
        b=jR6GqrHaCbwZG4hd0MsmBUivVOj7qw/ysIAfzyOXpVcmj7n59QCBaT8brtYsjH6gWs
         Ki6NLSA9Y0r04a+LIt8mYOitneG6dyO9gm1iH9tafAkJeNHXDRhU7RnTvC+s1lBcM43/
         Z9xrS3NFoKPFdnw1f4ct6eSRy7nEerVlWSBEOfxd6J5CUXWrHtZe5K+HAxL+hn+WlbKo
         eqg9UUwDNIxq2ZbWvPrZuhmRSfaFdLu36GTgqhDGgPhJ1j2+2Fef0zwjewGutu1ycXiu
         8vK4qdF/xY4hN7KJiFVefOUSL6zcB5SCk1pPVJifqsAypwH7hydoJJqdHPxuxEfIErCO
         3twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707338060; x=1707942860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UFqW85g738ZJBKsao/neXIDJiHPMj8JK2ruHy8245gg=;
        b=OljpsqF3fTr++8n28RrppY7BFmXPCr2tojhkRpgHwUERZ55laHEagoSdfcqenlXZzP
         0jyfgTnMB0AK3hFG/g65pZY6eH0AagLv89fT2VMsa41vaWuSY/9x5acNf+6aRkrMLfSI
         5ErqTBikszCMu46IQytaX0BDvJG4hMe21WGAQhU5CGFSgwRCWXH0lfLUuJ9p1k4SMCNz
         cE4ItJLbk/ZaPhujrYvLnMrm61Zw33x/GBO8IH/fVw/JP7ik3TGbKSb1gSoOHauSjpAE
         nb1uclBXSm3A1KIm2Sli50SFVgXDcaVfBRELqTd6BU171O4XfrupQxFF4awwunsmP7eM
         wnqQ==
X-Gm-Message-State: AOJu0YyW8M3vb7FSxgYvuLEX4v5yk59qG5196CMtk3rocbAN0bOLBTyu
	PAkIvcZdqDzUgLWaPa+rKucpPIwVI6AIAp9Maqo8OuVNRr//5V2n+3N2mfmL
X-Google-Smtp-Source: AGHT+IEdYbxBcNxK6VCHAP4htN6c8f3l5ubERYHdFWsB+0RuZXP0lsH+4sQdl4wYjXdKvk4BpzS1Yg==
X-Received: by 2002:a05:6122:2785:b0:4bd:8926:8e15 with SMTP id el5-20020a056122278500b004bd89268e15mr3758675vkb.0.1707338060015;
        Wed, 07 Feb 2024 12:34:20 -0800 (PST)
Received: from lvondent-mobl4.. (071-047-239-151.res.spectrum.com. [71.47.239.151])
        by smtp.gmail.com with ESMTPSA id cm20-20020a056122421400b004bddbe70026sm299945vkb.46.2024.02.07.12.34.18
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 12:34:18 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH v1] Bluetooth: hci_conn: Always use sk_timeo as conn_timeout
Date: Wed,  7 Feb 2024 15:34:18 -0500
Message-ID: <20240207203418.2986142-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This aligns the use socket sk_timeo as conn_timeout when initiating a
connection and then use it when scheduling the resulting HCI command,
that way the command is actually aborted synchronously thus not
blocking commands generated by hci_abort_conn_sync to inform the
controller the connection is to be aborted.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/hci_core.h |  5 +++--
 include/net/bluetooth/l2cap.h    |  2 +-
 net/bluetooth/hci_conn.c         |  8 +++++---
 net/bluetooth/hci_sync.c         |  2 +-
 net/bluetooth/l2cap_core.c       | 10 ++++------
 net/bluetooth/l2cap_sock.c       |  3 ++-
 net/bluetooth/mgmt.c             |  3 ++-
 net/bluetooth/sco.c              |  3 ++-
 8 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 34aa9d0290fe..2bdea85b7c44 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -1495,9 +1495,10 @@ struct hci_conn *hci_connect_le(struct hci_dev *hdev, bdaddr_t *dst,
 				u16 conn_timeout, u8 role);
 struct hci_conn *hci_connect_acl(struct hci_dev *hdev, bdaddr_t *dst,
 				 u8 sec_level, u8 auth_type,
-				 enum conn_reasons conn_reason);
+				 enum conn_reasons conn_reason, u16 timeout);
 struct hci_conn *hci_connect_sco(struct hci_dev *hdev, int type, bdaddr_t *dst,
-				 __u16 setting, struct bt_codec *codec);
+				 __u16 setting, struct bt_codec *codec,
+				 u16 timeout);
 struct hci_conn *hci_bind_cis(struct hci_dev *hdev, bdaddr_t *dst,
 			      __u8 dst_type, struct bt_iso_qos *qos);
 struct hci_conn *hci_bind_bis(struct hci_dev *hdev, bdaddr_t *dst,
diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
index 92d7197f9a56..a4278aa618ab 100644
--- a/include/net/bluetooth/l2cap.h
+++ b/include/net/bluetooth/l2cap.h
@@ -939,7 +939,7 @@ int l2cap_add_scid(struct l2cap_chan *chan,  __u16 scid);
 struct l2cap_chan *l2cap_chan_create(void);
 void l2cap_chan_close(struct l2cap_chan *chan, int reason);
 int l2cap_chan_connect(struct l2cap_chan *chan, __le16 psm, u16 cid,
-		       bdaddr_t *dst, u8 dst_type);
+		       bdaddr_t *dst, u8 dst_type, u16 timeout);
 int l2cap_chan_reconfigure(struct l2cap_chan *chan, __u16 mtu);
 int l2cap_chan_send(struct l2cap_chan *chan, struct msghdr *msg, size_t len);
 void l2cap_chan_busy(struct l2cap_chan *chan, int busy);
diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index a4beed8587eb..8164502234c5 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -1607,7 +1607,7 @@ struct hci_conn *hci_connect_le_scan(struct hci_dev *hdev, bdaddr_t *dst,
 
 struct hci_conn *hci_connect_acl(struct hci_dev *hdev, bdaddr_t *dst,
 				 u8 sec_level, u8 auth_type,
-				 enum conn_reasons conn_reason)
+				 enum conn_reasons conn_reason, u16 timeout)
 {
 	struct hci_conn *acl;
 
@@ -1643,6 +1643,7 @@ struct hci_conn *hci_connect_acl(struct hci_dev *hdev, bdaddr_t *dst,
 		acl->sec_level = BT_SECURITY_LOW;
 		acl->pending_sec_level = sec_level;
 		acl->auth_type = auth_type;
+		acl->conn_timeout = timeout;
 
 		err = hci_acl_create_connection_sync(hdev, acl);
 		if (err) {
@@ -1683,14 +1684,15 @@ static struct hci_link *hci_conn_link(struct hci_conn *parent,
 }
 
 struct hci_conn *hci_connect_sco(struct hci_dev *hdev, int type, bdaddr_t *dst,
-				 __u16 setting, struct bt_codec *codec)
+				 __u16 setting, struct bt_codec *codec,
+				 u16 timeout)
 {
 	struct hci_conn *acl;
 	struct hci_conn *sco;
 	struct hci_link *link;
 
 	acl = hci_connect_acl(hdev, dst, BT_SECURITY_LOW, HCI_AT_NO_BONDING,
-			      CONN_REASON_SCO_CONNECT);
+			      CONN_REASON_SCO_CONNECT, timeout);
 	if (IS_ERR(acl))
 		return acl;
 
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 617407b81ffe..788a889210d8 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -6548,7 +6548,7 @@ static int __hci_acl_create_connection_sync(struct hci_dev *hdev, void *data)
 	err = __hci_cmd_sync_status_sk(hdev, HCI_OP_CREATE_CONN,
 				       sizeof(cp), &cp,
 				       HCI_EV_CONN_COMPLETE,
-				       HCI_ACL_CONN_TIMEOUT, NULL);
+				       conn->conn_timeout, NULL);
 
 	if (err == -ETIMEDOUT)
 		hci_abort_conn_sync(hdev, conn, HCI_ERROR_LOCAL_HOST_TERM);
diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index ab5a9d42fae7..467b242d8be0 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -6925,7 +6925,7 @@ static void l2cap_chan_by_pid(struct l2cap_chan *chan, void *data)
 }
 
 int l2cap_chan_connect(struct l2cap_chan *chan, __le16 psm, u16 cid,
-		       bdaddr_t *dst, u8 dst_type)
+		       bdaddr_t *dst, u8 dst_type, u16 timeout)
 {
 	struct l2cap_conn *conn;
 	struct hci_conn *hcon;
@@ -7018,19 +7018,17 @@ int l2cap_chan_connect(struct l2cap_chan *chan, __le16 psm, u16 cid,
 
 		if (hci_dev_test_flag(hdev, HCI_ADVERTISING))
 			hcon = hci_connect_le(hdev, dst, dst_type, false,
-					      chan->sec_level,
-					      HCI_LE_CONN_TIMEOUT,
+					      chan->sec_level, timeout,
 					      HCI_ROLE_SLAVE);
 		else
 			hcon = hci_connect_le_scan(hdev, dst, dst_type,
-						   chan->sec_level,
-						   HCI_LE_CONN_TIMEOUT,
+						   chan->sec_level, timeout,
 						   CONN_REASON_L2CAP_CHAN);
 
 	} else {
 		u8 auth_type = l2cap_get_auth_type(chan);
 		hcon = hci_connect_acl(hdev, dst, chan->sec_level, auth_type,
-				       CONN_REASON_L2CAP_CHAN);
+				       CONN_REASON_L2CAP_CHAN, timeout);
 	}
 
 	if (IS_ERR(hcon)) {
diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
index ee7a41d6994f..4287aa6cc988 100644
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@ -254,7 +254,8 @@ static int l2cap_sock_connect(struct socket *sock, struct sockaddr *addr,
 		chan->mode = L2CAP_MODE_LE_FLOWCTL;
 
 	err = l2cap_chan_connect(chan, la.l2_psm, __le16_to_cpu(la.l2_cid),
-				 &la.l2_bdaddr, la.l2_bdaddr_type);
+				 &la.l2_bdaddr, la.l2_bdaddr_type,
+				 sk->sk_sndtimeo);
 	if (err)
 		return err;
 
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 064a67157d43..78ab562807d0 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -3444,7 +3444,8 @@ static int pair_device(struct sock *sk, struct hci_dev *hdev, void *data,
 
 	if (cp->addr.type == BDADDR_BREDR) {
 		conn = hci_connect_acl(hdev, &cp->addr.bdaddr, sec_level,
-				       auth_type, CONN_REASON_PAIR_DEVICE);
+				       auth_type, CONN_REASON_PAIR_DEVICE,
+				       HCI_ACL_CONN_TIMEOUT);
 	} else {
 		u8 addr_type = le_addr_type(cp->addr.type);
 		struct hci_conn_params *p;
diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index c736186aba26..43daf965a01e 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -264,7 +264,8 @@ static int sco_connect(struct sock *sk)
 	}
 
 	hcon = hci_connect_sco(hdev, type, &sco_pi(sk)->dst,
-			       sco_pi(sk)->setting, &sco_pi(sk)->codec);
+			       sco_pi(sk)->setting, &sco_pi(sk)->codec,
+			       sk->sk_sndtimeo);
 	if (IS_ERR(hcon)) {
 		err = PTR_ERR(hcon);
 		goto unlock;
-- 
2.43.0


