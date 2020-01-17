Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F40D5140064
	for <lists+linux-bluetooth@lfdr.de>; Fri, 17 Jan 2020 01:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgAQABm (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 16 Jan 2020 19:01:42 -0500
Received: from mail-pj1-f49.google.com ([209.85.216.49]:39514 "EHLO
        mail-pj1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgAQABm (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 16 Jan 2020 19:01:42 -0500
Received: by mail-pj1-f49.google.com with SMTP id e11so2437755pjt.4
        for <linux-bluetooth@vger.kernel.org>; Thu, 16 Jan 2020 16:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QbyV+hz7cK9OYAAv+rZ4E/uE6XSC1iEvP7njyQgfWas=;
        b=SZ1/QmSlMrsiVkrBgBSjQz5rtRf1zqYyUymV+XbviLmWIiBU5ZTDsrCNZ+Nz2mqAIy
         EXIk4pVOttZUKJJB6DADGep0GHr+cFlT9WEl7YNGd+BOEAr5QthO2lpAm98WI8fUzR7k
         bLHe7g2FN2TY8/O9mbIGnEOxnk15DnIVTVDwYstMtlLyZmxPztLARHHcbfR0xmisG43W
         BX+wypufd4c1K8mURUSDbfUTw2poFK+vc/09hd7uGziIiiOmRrPP/D+6VwT1xOsnyU72
         4PxdpNJ5qYUuK9vPwG8+H2Hdp75Ew++HAnVYXDINmSWMa5DeiEo7doTSpOIwkxeVuFRb
         u1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QbyV+hz7cK9OYAAv+rZ4E/uE6XSC1iEvP7njyQgfWas=;
        b=RrDpu2nBEJHB42UfWijG2hz2Jg0R7G5RYwgSlsJ04zUmvmVf7foAz3MBC+LWiML6ue
         W/jAkp4Uh247UAc3lJCeG2D7f9g3IpJQ3AsiwIWZpYLFzQ8ygL6L6yjqs6Ulydp3DqiN
         9AbjeGu/iYmRTg0ABWEHFZJdsHN2KUsSwQa+FlYveEEnLE54BQhUoknzFmR60KActahT
         M3qbWbA4h/CeZ5hJGVsvgGS19SKoRA7ZJDn8A+UJPGOTvhYEn1HKVsMJWUASjhnUF6TP
         XDl4iDNL0UhEQZ1/qsH62u1LeNT9MAp/REzuxohnyW0GPJ63HWK+D+kZwrdoQtcZa/Rw
         VTjQ==
X-Gm-Message-State: APjAAAUb3Gd0QCt4m+I6JKzSFzxzFQ9IzZ1wRzhalzRYAExD+vZCK6wN
        GpWtbaDezL53Z3gcSyqcYcfjS3rppJk=
X-Google-Smtp-Source: APXvYqxMMgXV5MR9z7X1HcvYls50bM6boV8bxghdrLvo4+5Phzc1Dsq34oV0sCWLHAGw1PmwLv6oQw==
X-Received: by 2002:a17:902:7c0f:: with SMTP id x15mr35692820pll.267.1579219299720;
        Thu, 16 Jan 2020 16:01:39 -0800 (PST)
Received: from localhost.localdomain ([192.102.209.39])
        by smtp.gmail.com with ESMTPSA id v8sm26405055pff.151.2020.01.16.16.01.38
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 16:01:39 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 2/2] Bluetooth: Add BTPROTO_ISO socket type
Date:   Thu, 16 Jan 2020 16:01:37 -0800
Message-Id: <20200117000137.29166-2-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200117000137.29166-1-luiz.dentz@gmail.com>
References: <20200117000137.29166-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This introduces a new socket type BTPROTO_ISO which is used to transfer
ISO packets between userspace and kernel similarly to how BTPROTO_SCO
works.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/bluetooth.h |   14 +
 include/net/bluetooth/hci_core.h  |   18 +-
 include/net/bluetooth/iso.h       |   36 +
 net/bluetooth/Makefile            |    1 +
 net/bluetooth/af_bluetooth.c      |   10 +-
 net/bluetooth/hci_core.c          |    7 +-
 net/bluetooth/iso.c               | 1393 +++++++++++++++++++++++++++++
 7 files changed, 1474 insertions(+), 5 deletions(-)
 create mode 100644 include/net/bluetooth/iso.h
 create mode 100644 net/bluetooth/iso.c

diff --git a/include/net/bluetooth/bluetooth.h b/include/net/bluetooth/bluetooth.h
index ac3432796a4a..af969f250b7d 100644
--- a/include/net/bluetooth/bluetooth.h
+++ b/include/net/bluetooth/bluetooth.h
@@ -431,6 +431,20 @@ static inline void sco_exit(void)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_BT_LE)
+int iso_init(void);
+void iso_exit(void);
+#else
+static inline int iso_init(void)
+{
+	return 0;
+}
+
+static inline void iso_exit(void)
+{
+}
+#endif
+
 int mgmt_init(void);
 void mgmt_exit(void);
 
diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 5bbed4bd6b43..a5bd3da29c28 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -622,6 +622,21 @@ static inline void sco_recv_scodata(struct hci_conn *hcon, struct sk_buff *skb)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_BT_LE)
+int iso_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr, __u8 *flags);
+void iso_recv(struct hci_conn *hcon, struct sk_buff *skb, u16 flags);
+#else
+static inline int iso_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr,
+				  __u8 *flags)
+{
+	return 0;
+}
+static inline void iso_recv(struct hci_conn *hcon, struct sk_buff *skb,
+			    u16 flags)
+{
+}
+#endif
+
 /* ----- Inquiry cache ----- */
 #define INQUIRY_CACHE_AGE_MAX   (HZ*30)   /* 30 seconds */
 #define INQUIRY_ENTRY_AGE_MAX   (HZ*60)   /* 60 seconds */
@@ -1289,8 +1304,7 @@ static inline int hci_proto_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr,
 		return sco_connect_ind(hdev, bdaddr, flags);
 
 	case ISO_LINK:
-		/* TODO: Handle connection indication */
-		return -EINVAL;
+		return iso_connect_ind(hdev, bdaddr, flags);
 
 	default:
 		BT_ERR("unknown link type %d", type);
diff --git a/include/net/bluetooth/iso.h b/include/net/bluetooth/iso.h
new file mode 100644
index 000000000000..dd0bfccc0e28
--- /dev/null
+++ b/include/net/bluetooth/iso.h
@@ -0,0 +1,36 @@
+/*
+   BlueZ - Bluetooth protocol stack for Linux
+   Copyright (C) 2019 Intel Corporation
+
+   This program is free software; you can redistribute it and/or modify
+   it under the terms of the GNU General Public License version 2 as
+   published by the Free Software Foundation;
+
+   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
+   OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF THIRD PARTY RIGHTS.
+   IN NO EVENT SHALL THE COPYRIGHT HOLDER(S) AND AUTHOR(S) BE LIABLE FOR ANY
+   CLAIM, OR ANY SPECIAL INDIRECT OR CONSEQUENTIAL DAMAGES, OR ANY DAMAGES
+   WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+   ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+   OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+
+   ALL LIABILITY, INCLUDING LIABILITY FOR INFRINGEMENT OF ANY PATENTS,
+   COPYRIGHTS, TRADEMARKS OR OTHER RIGHTS, RELATING TO USE OF THIS
+   SOFTWARE IS DISCLAIMED.
+*/
+
+#ifndef __ISO_H
+#define __ISO_H
+
+/* ISO defaults */
+#define ISO_DEFAULT_MTU		251
+
+/* ISO socket address */
+struct sockaddr_iso {
+	sa_family_t	iso_family;
+	bdaddr_t	iso_bdaddr;
+	__u8		iso_bdaddr_type;
+};
+
+#endif /* __ISO_H */
diff --git a/net/bluetooth/Makefile b/net/bluetooth/Makefile
index fda41c0b4781..9f1f669b8c7e 100644
--- a/net/bluetooth/Makefile
+++ b/net/bluetooth/Makefile
@@ -17,6 +17,7 @@ bluetooth-y := af_bluetooth.o hci_core.o hci_conn.o hci_event.o mgmt.o \
 	ecdh_helper.o hci_request.o mgmt_util.o
 
 bluetooth-$(CONFIG_BT_BREDR) += sco.o
+bluetooth-$(CONFIG_BT_LE) += iso.o
 bluetooth-$(CONFIG_BT_HS) += a2mp.o amp.o
 bluetooth-$(CONFIG_BT_LEDS) += leds.o
 bluetooth-$(CONFIG_BT_DEBUGFS) += hci_debugfs.o
diff --git a/net/bluetooth/af_bluetooth.c b/net/bluetooth/af_bluetooth.c
index efed33261ac3..d1f29b8413ab 100644
--- a/net/bluetooth/af_bluetooth.c
+++ b/net/bluetooth/af_bluetooth.c
@@ -757,12 +757,18 @@ static int __init bt_init(void)
 	if (err)
 		goto cleanup_cap;
 
-	err = mgmt_init();
+	err = iso_init();
 	if (err)
 		goto cleanup_sco;
 
+	err = mgmt_init();
+	if (err)
+		goto cleanup_iso;
+
 	return 0;
 
+cleanup_iso:
+	iso_exit();
 cleanup_sco:
 	sco_exit();
 cleanup_cap:
@@ -780,6 +786,8 @@ static void __exit bt_exit(void)
 {
 	mgmt_exit();
 
+	iso_exit();
+
 	sco_exit();
 
 	l2cap_exit();
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index b07b94fd335d..ae1fa67abf7c 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -4539,8 +4539,11 @@ static void hci_isodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 	conn = hci_conn_hash_lookup_handle(hdev, handle);
 	hci_dev_unlock(hdev);
 
-	/* TODO: Send to upper protocol */
-	if (!conn) {
+	if (conn) {
+		/* Send to upper protocol */
+		iso_recv(conn, skb, flags);
+		return;
+	} else {
 		bt_dev_err(hdev, "ISO packet for unknown connection handle %d",
 			   handle);
 	}
diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
new file mode 100644
index 000000000000..bf50f60f8919
--- /dev/null
+++ b/net/bluetooth/iso.c
@@ -0,0 +1,1393 @@
+/*
+   BlueZ - Bluetooth protocol stack for Linux
+   Copyright (C) 2019 Intel Corporation
+
+   This program is free software; you can redistribute it and/or modify
+   it under the terms of the GNU General Public License version 2 as
+   published by the Free Software Foundation;
+
+   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
+   OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF THIRD PARTY RIGHTS.
+   IN NO EVENT SHALL THE COPYRIGHT HOLDER(S) AND AUTHOR(S) BE LIABLE FOR ANY
+   CLAIM, OR ANY SPECIAL INDIRECT OR CONSEQUENTIAL DAMAGES, OR ANY DAMAGES
+   WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+   ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+   OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+
+   ALL LIABILITY, INCLUDING LIABILITY FOR INFRINGEMENT OF ANY PATENTS,
+   COPYRIGHTS, TRADEMARKS OR OTHER RIGHTS, RELATING TO USE OF THIS
+   SOFTWARE IS DISCLAIMED.
+*/
+
+/* Bluetooth ISO sockets. */
+
+#include <linux/module.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/sched/signal.h>
+
+#include <net/bluetooth/bluetooth.h>
+#include <net/bluetooth/hci_core.h>
+#include <net/bluetooth/iso.h>
+
+static const struct proto_ops iso_sock_ops;
+
+static struct bt_sock_list iso_sk_list = {
+	.lock = __RW_LOCK_UNLOCKED(iso_sk_list.lock)
+};
+
+/* ---- ISO connections ---- */
+struct iso_conn {
+	struct hci_conn	*hcon;
+
+	spinlock_t	lock;
+	struct sock	*sk;
+
+	struct sk_buff	*rx_skb;
+	__u32		rx_len;
+};
+
+#define iso_conn_lock(c)	spin_lock(&c->lock);
+#define iso_conn_unlock(c)	spin_unlock(&c->lock);
+
+static void iso_sock_close(struct sock *sk);
+static void iso_sock_kill(struct sock *sk);
+
+/* ----- ISO socket info ----- */
+#define iso_pi(sk) ((struct iso_pinfo *) sk)
+
+struct iso_pinfo {
+	struct bt_sock		bt;
+	bdaddr_t		src;
+	__u8			src_type;
+	bdaddr_t		dst;
+	__u8			dst_type;
+	__u32			flags;
+	struct bt_iso_qos	in_qos;
+	struct bt_iso_qos	out_qos;
+	struct iso_conn		*conn;
+};
+
+/* ---- ISO timers ---- */
+#define ISO_CONN_TIMEOUT	(HZ * 40)
+#define ISO_DISCONN_TIMEOUT	(HZ * 2)
+
+static void iso_sock_timeout(struct timer_list *t)
+{
+	struct sock *sk = from_timer(sk, t, sk_timer);
+
+	BT_DBG("sock %p state %d", sk, sk->sk_state);
+
+	bh_lock_sock(sk);
+	sk->sk_err = ETIMEDOUT;
+	sk->sk_state_change(sk);
+	bh_unlock_sock(sk);
+
+	iso_sock_kill(sk);
+	sock_put(sk);
+}
+
+static void iso_sock_set_timer(struct sock *sk, long timeout)
+{
+	BT_DBG("sock %p state %d timeout %ld", sk, sk->sk_state, timeout);
+	sk_reset_timer(sk, &sk->sk_timer, jiffies + timeout);
+}
+
+static void iso_sock_clear_timer(struct sock *sk)
+{
+	BT_DBG("sock %p state %d", sk, sk->sk_state);
+	sk_stop_timer(sk, &sk->sk_timer);
+}
+
+/* ---- ISO connections ---- */
+static struct iso_conn *iso_conn_add(struct hci_conn *hcon)
+{
+	struct iso_conn *conn = hcon->iso_data;
+
+	if (conn)
+		return conn;
+
+	conn = kzalloc(sizeof(struct iso_conn), GFP_KERNEL);
+	if (!conn)
+		return NULL;
+
+	spin_lock_init(&conn->lock);
+
+	hcon->iso_data = conn;
+	conn->hcon = hcon;
+
+	BT_DBG("hcon %p conn %p", hcon, conn);
+
+	return conn;
+}
+
+/* Delete channel.
+ * Must be called on the locked socket. */
+static void iso_chan_del(struct sock *sk, int err)
+{
+	struct iso_conn *conn;
+
+	conn = iso_pi(sk)->conn;
+
+	BT_DBG("sk %p, conn %p, err %d", sk, conn, err);
+
+	if (conn) {
+		iso_conn_lock(conn);
+		conn->sk = NULL;
+		iso_pi(sk)->conn = NULL;
+		iso_conn_unlock(conn);
+
+		if (conn->hcon)
+			hci_conn_drop(conn->hcon);
+	}
+
+	sk->sk_state = BT_CLOSED;
+	sk->sk_err   = err;
+	sk->sk_state_change(sk);
+
+	sock_set_flag(sk, SOCK_ZAPPED);
+}
+
+static void iso_conn_del(struct hci_conn *hcon, int err)
+{
+	struct iso_conn *conn = hcon->iso_data;
+	struct sock *sk;
+
+	if (!conn)
+		return;
+
+	BT_DBG("hcon %p conn %p, err %d", hcon, conn, err);
+
+	/* Kill socket */
+	iso_conn_lock(conn);
+	sk = conn->sk;
+	iso_conn_unlock(conn);
+
+	if (sk) {
+		sock_hold(sk);
+		bh_lock_sock(sk);
+		iso_sock_clear_timer(sk);
+		iso_chan_del(sk, err);
+		bh_unlock_sock(sk);
+		iso_sock_kill(sk);
+		sock_put(sk);
+	}
+
+	hcon->iso_data = NULL;
+	kfree(conn);
+}
+
+static void __iso_chan_add(struct iso_conn *conn, struct sock *sk,
+			   struct sock *parent)
+{
+	BT_DBG("conn %p", conn);
+
+	iso_pi(sk)->conn = conn;
+	conn->sk = sk;
+
+	if (parent)
+		bt_accept_enqueue(parent, sk, true);
+}
+
+static int iso_chan_add(struct iso_conn *conn, struct sock *sk,
+			struct sock *parent)
+{
+	int err = 0;
+
+	iso_conn_lock(conn);
+	if (conn->sk)
+		err = -EBUSY;
+	else
+		__iso_chan_add(conn, sk, parent);
+
+	iso_conn_unlock(conn);
+	return err;
+}
+
+static int iso_connect(struct sock *sk)
+{
+	struct iso_conn *conn;
+	struct hci_conn *hcon;
+	struct hci_dev  *hdev;
+	int err;
+
+	BT_DBG("%pMR -> %pMR", &iso_pi(sk)->src, &iso_pi(sk)->dst);
+
+	hdev = hci_get_route(&iso_pi(sk)->dst, &iso_pi(sk)->src,
+			     iso_pi(sk)->dst_type);
+	if (!hdev)
+		return -EHOSTUNREACH;
+
+	hci_dev_lock(hdev);
+
+	if (!cis_master_capable(hdev)) {
+		err = -EOPNOTSUPP;
+		goto done;
+	}
+
+	/* Fail if either PHYs are marked as disabled */
+	if (!iso_pi(sk)->in_qos.phy && !iso_pi(sk)->out_qos.phy) {
+		err = -EINVAL;
+		goto done;
+	}
+
+	hcon = hci_connect_cis(hdev, &iso_pi(sk)->dst, iso_pi(sk)->dst_type,
+			       &iso_pi(sk)->in_qos, &iso_pi(sk)->out_qos);
+	if (IS_ERR(hcon)) {
+		err = PTR_ERR(hcon);
+		goto done;
+	}
+
+	conn = iso_conn_add(hcon);
+	if (!conn) {
+		hci_conn_drop(hcon);
+		err = -ENOMEM;
+		goto done;
+	}
+
+	/* Update source addr of the socket */
+	bacpy(&iso_pi(sk)->src, &hcon->src);
+
+	err = iso_chan_add(conn, sk, NULL);
+	if (err)
+		goto done;
+
+	if (hcon->state == BT_CONNECTED) {
+		iso_sock_clear_timer(sk);
+		sk->sk_state = BT_CONNECTED;
+	} else {
+		sk->sk_state = BT_CONNECT;
+		iso_sock_set_timer(sk, sk->sk_sndtimeo);
+	}
+
+done:
+	hci_dev_unlock(hdev);
+	hci_dev_put(hdev);
+	return err;
+}
+
+static int iso_send_frame(struct sock *sk, struct msghdr *msg, int len)
+{
+	struct iso_conn *conn = iso_pi(sk)->conn;
+	struct sk_buff *skb, **frag;
+	struct hci_iso_data_hdr *hdr;
+	int err, sent = 0;
+	unsigned int count;
+	static __u16 sn;
+
+	BT_DBG("sk %p len %d", sk, len);
+
+	count = min_t(unsigned int, iso_pi(sk)->out_qos.mtu, len);
+
+	skb = bt_skb_send_alloc(sk, count, msg->msg_flags & MSG_DONTWAIT, &err);
+	if (!skb)
+		return err;
+
+	/* Create ISO data header */
+	hdr = skb_put(skb, HCI_ISO_DATA_HDR_SIZE);
+	hdr->sn = cpu_to_le16(sn++);
+	hdr->slen = cpu_to_le16(hci_iso_data_len_pack(len,
+						      HCI_ISO_STATUS_VALID));
+
+	if (!copy_from_iter_full(skb_put(skb, count), count, &msg->msg_iter)) {
+		kfree_skb(skb);
+		return -EFAULT;
+	}
+
+	sent += count;
+	len -= count;
+
+	BT_DBG("skb %p len %d", sk, count);
+
+	/* Continuation fragments */
+	frag = &skb_shinfo(skb)->frag_list;
+	while (len) {
+		struct sk_buff *tmp;
+
+		count = min_t(unsigned int, iso_pi(sk)->out_qos.mtu, len);
+
+		tmp = bt_skb_send_alloc(sk, count,
+					msg->msg_flags & MSG_DONTWAIT, &err);
+		if (IS_ERR(tmp))
+			return PTR_ERR(tmp);
+
+		*frag = tmp;
+
+		if (!copy_from_iter_full(skb_put(skb, count), count,
+					 &msg->msg_iter)) {
+			kfree_skb(skb);
+			return -EFAULT;
+		}
+
+		sent += count;
+		len  -= count;
+
+		BT_DBG("frag %p len %d", *frag, count);
+
+		skb->len += (*frag)->len;
+		skb->data_len += (*frag)->len;
+
+		frag = &(*frag)->next;
+	}
+
+	hci_send_iso(conn->hcon, skb);
+
+	return sent;
+}
+
+static void iso_recv_frame(struct iso_conn *conn, struct sk_buff *skb)
+{
+	struct sock *sk;
+
+	iso_conn_lock(conn);
+	sk = conn->sk;
+	iso_conn_unlock(conn);
+
+	if (!sk)
+		goto drop;
+
+	BT_DBG("sk %p len %d", sk, skb->len);
+
+	if (sk->sk_state != BT_CONNECTED)
+		goto drop;
+
+	if (!sock_queue_rcv_skb(sk, skb))
+		return;
+
+drop:
+	kfree_skb(skb);
+}
+
+/* -------- Socket interface ---------- */
+static struct sock *__iso_get_sock_listen_by_addr(bdaddr_t *ba)
+{
+	struct sock *sk;
+
+	sk_for_each(sk, &iso_sk_list.head) {
+		if (sk->sk_state != BT_LISTEN)
+			continue;
+
+		if (!bacmp(&iso_pi(sk)->src, ba))
+			return sk;
+	}
+
+	return NULL;
+}
+
+/* Find socket listening on source bdaddr.
+ * Returns closest match.
+ */
+static struct sock *iso_get_sock_listen(bdaddr_t *src)
+{
+	struct sock *sk = NULL, *sk1 = NULL;
+
+	read_lock(&iso_sk_list.lock);
+
+	sk_for_each(sk, &iso_sk_list.head) {
+		if (sk->sk_state != BT_LISTEN)
+			continue;
+
+		/* Exact match. */
+		if (!bacmp(&iso_pi(sk)->src, src))
+			break;
+
+		/* Closest match */
+		if (!bacmp(&iso_pi(sk)->src, BDADDR_ANY))
+			sk1 = sk;
+	}
+
+	read_unlock(&iso_sk_list.lock);
+
+	return sk ? sk : sk1;
+}
+
+static void iso_sock_destruct(struct sock *sk)
+{
+	BT_DBG("sk %p", sk);
+
+	skb_queue_purge(&sk->sk_receive_queue);
+	skb_queue_purge(&sk->sk_write_queue);
+}
+
+static void iso_sock_cleanup_listen(struct sock *parent)
+{
+	struct sock *sk;
+
+	BT_DBG("parent %p", parent);
+
+	/* Close not yet accepted channels */
+	while ((sk = bt_accept_dequeue(parent, NULL))) {
+		iso_sock_close(sk);
+		iso_sock_kill(sk);
+	}
+
+	parent->sk_state  = BT_CLOSED;
+	sock_set_flag(parent, SOCK_ZAPPED);
+}
+
+/* Kill socket (only if zapped and orphan)
+ * Must be called on unlocked socket.
+ */
+static void iso_sock_kill(struct sock *sk)
+{
+	if (!sock_flag(sk, SOCK_ZAPPED) || sk->sk_socket ||
+	    sock_flag(sk, SOCK_DEAD))
+		return;
+
+	BT_DBG("sk %p state %d", sk, sk->sk_state);
+
+	/* Kill poor orphan */
+	bt_sock_unlink(&iso_sk_list, sk);
+	sock_set_flag(sk, SOCK_DEAD);
+	sock_put(sk);
+}
+
+static void __iso_sock_close(struct sock *sk)
+{
+	BT_DBG("sk %p state %d socket %p", sk, sk->sk_state, sk->sk_socket);
+
+	switch (sk->sk_state) {
+	case BT_LISTEN:
+		iso_sock_cleanup_listen(sk);
+		break;
+
+	case BT_CONNECTED:
+	case BT_CONFIG:
+		if (iso_pi(sk)->conn->hcon) {
+			sk->sk_state = BT_DISCONN;
+			iso_sock_set_timer(sk, ISO_DISCONN_TIMEOUT);
+			iso_conn_lock(iso_pi(sk)->conn);
+			hci_conn_drop(iso_pi(sk)->conn->hcon);
+			iso_pi(sk)->conn->hcon = NULL;
+			iso_conn_unlock(iso_pi(sk)->conn);
+		} else
+			iso_chan_del(sk, ECONNRESET);
+		break;
+
+	case BT_CONNECT2:
+	case BT_CONNECT:
+	case BT_DISCONN:
+		iso_chan_del(sk, ECONNRESET);
+		break;
+
+	default:
+		sock_set_flag(sk, SOCK_ZAPPED);
+		break;
+	}
+}
+
+/* Must be called on unlocked socket. */
+static void iso_sock_close(struct sock *sk)
+{
+	iso_sock_clear_timer(sk);
+	lock_sock(sk);
+	__iso_sock_close(sk);
+	release_sock(sk);
+	iso_sock_kill(sk);
+}
+
+static void iso_sock_init(struct sock *sk, struct sock *parent)
+{
+	BT_DBG("sk %p", sk);
+
+	if (parent) {
+		sk->sk_type = parent->sk_type;
+		bt_sk(sk)->flags = bt_sk(parent)->flags;
+		security_sk_clone(parent, sk);
+	}
+}
+
+static struct proto iso_proto = {
+	.name		= "ISO",
+	.owner		= THIS_MODULE,
+	.obj_size	= sizeof(struct iso_pinfo)
+};
+
+static struct bt_iso_qos default_qos = {
+	.sca		= 0x00,
+	.packing	= 0x00,
+	.framing	= 0x00,
+	.interval	= 0,
+	.latency	= 0,
+	.mtu		= 0,
+	.phy		= BT_ISO_PHY_ANY,
+	.rtn		= 0x00,
+};
+
+static struct sock *iso_sock_alloc(struct net *net, struct socket *sock,
+				   int proto, gfp_t prio, int kern)
+{
+	struct sock *sk;
+
+	sk = sk_alloc(net, PF_BLUETOOTH, prio, &iso_proto, kern);
+	if (!sk)
+		return NULL;
+
+	sock_init_data(sock, sk);
+	INIT_LIST_HEAD(&bt_sk(sk)->accept_q);
+
+	sk->sk_destruct = iso_sock_destruct;
+	sk->sk_sndtimeo = ISO_CONN_TIMEOUT;
+
+	sock_reset_flag(sk, SOCK_ZAPPED);
+
+	sk->sk_protocol = proto;
+	sk->sk_state    = BT_OPEN;
+
+	/* Set address type as public as default src address is BDADDR_ANY */
+	iso_pi(sk)->src_type = BDADDR_LE_PUBLIC;
+
+	/* TODO: Add proper defaults */
+	iso_pi(sk)->in_qos = default_qos;
+	iso_pi(sk)->out_qos = default_qos;
+
+	timer_setup(&sk->sk_timer, iso_sock_timeout, 0);
+
+	bt_sock_link(&iso_sk_list, sk);
+	return sk;
+}
+
+static int iso_sock_create(struct net *net, struct socket *sock, int protocol,
+			   int kern)
+{
+	struct sock *sk;
+
+	BT_DBG("sock %p", sock);
+
+	sock->state = SS_UNCONNECTED;
+
+	if (sock->type != SOCK_SEQPACKET)
+		return -ESOCKTNOSUPPORT;
+
+	sock->ops = &iso_sock_ops;
+
+	sk = iso_sock_alloc(net, sock, protocol, GFP_ATOMIC, kern);
+	if (!sk)
+		return -ENOMEM;
+
+	iso_sock_init(sk, NULL);
+	return 0;
+}
+
+static int iso_sock_bind(struct socket *sock, struct sockaddr *addr,
+			 int addr_len)
+{
+	struct sockaddr_iso *sa = (struct sockaddr_iso *) addr;
+	struct sock *sk = sock->sk;
+	int err = 0;
+
+	BT_DBG("sk %p %pMR type %u", sk, &sa->iso_bdaddr, sa->iso_bdaddr_type);
+
+	if (!addr || addr_len < sizeof(struct sockaddr_iso) ||
+	    addr->sa_family != AF_BLUETOOTH)
+		return -EINVAL;
+
+	lock_sock(sk);
+
+	if (sk->sk_state != BT_OPEN) {
+		err = -EBADFD;
+		goto done;
+	}
+
+	if (sk->sk_type != SOCK_SEQPACKET) {
+		err = -EINVAL;
+		goto done;
+	}
+
+	/* Check if the address type is of LE type */
+	if (!bdaddr_type_is_le(sa->iso_bdaddr_type)) {
+		err = -EINVAL;
+		goto done;
+	}
+
+	bacpy(&iso_pi(sk)->src, &sa->iso_bdaddr);
+	iso_pi(sk)->src_type = sa->iso_bdaddr_type;
+
+	sk->sk_state = BT_BOUND;
+
+done:
+	release_sock(sk);
+	return err;
+}
+
+static int iso_sock_connect(struct socket *sock, struct sockaddr *addr,
+			    int alen, int flags)
+{
+	struct sockaddr_iso *sa = (struct sockaddr_iso *) addr;
+	struct sock *sk = sock->sk;
+	int err;
+
+	BT_DBG("sk %p", sk);
+
+	if (alen < sizeof(struct sockaddr_iso) ||
+	    addr->sa_family != AF_BLUETOOTH)
+		return -EINVAL;
+
+	if (sk->sk_state != BT_OPEN && sk->sk_state != BT_BOUND)
+		return -EBADFD;
+
+	if (sk->sk_type != SOCK_SEQPACKET)
+		return -EINVAL;
+
+	/* Check if the address type is of LE type */
+	if (!bdaddr_type_is_le(sa->iso_bdaddr_type))
+		return -EINVAL;
+
+	lock_sock(sk);
+
+	bacpy(&iso_pi(sk)->dst, &sa->iso_bdaddr);
+	iso_pi(sk)->dst_type = sa->iso_bdaddr_type;
+
+	err = iso_connect(sk);
+	if (err)
+		goto done;
+
+	err = bt_sock_wait_state(sk, BT_CONNECTED,
+				 sock_sndtimeo(sk, flags & O_NONBLOCK));
+
+done:
+	release_sock(sk);
+	return err;
+}
+
+static int iso_sock_listen(struct socket *sock, int backlog)
+{
+	struct sock *sk = sock->sk;
+	bdaddr_t *src = &iso_pi(sk)->src;
+	int err = 0;
+
+	BT_DBG("sk %p backlog %d", sk, backlog);
+
+	lock_sock(sk);
+
+	if (sk->sk_state != BT_BOUND) {
+		err = -EBADFD;
+		goto done;
+	}
+
+	if (sk->sk_type != SOCK_SEQPACKET) {
+		err = -EINVAL;
+		goto done;
+	}
+
+	write_lock(&iso_sk_list.lock);
+
+	if (__iso_get_sock_listen_by_addr(src)) {
+		err = -EADDRINUSE;
+		goto unlock;
+	}
+
+	sk->sk_max_ack_backlog = backlog;
+	sk->sk_ack_backlog = 0;
+
+	sk->sk_state = BT_LISTEN;
+
+unlock:
+	write_unlock(&iso_sk_list.lock);
+
+done:
+	release_sock(sk);
+	return err;
+}
+
+static int iso_sock_accept(struct socket *sock, struct socket *newsock,
+			   int flags, bool kern)
+{
+	DEFINE_WAIT_FUNC(wait, woken_wake_function);
+	struct sock *sk = sock->sk, *ch;
+	long timeo;
+	int err = 0;
+
+	lock_sock(sk);
+
+	timeo = sock_rcvtimeo(sk, flags & O_NONBLOCK);
+
+	BT_DBG("sk %p timeo %ld", sk, timeo);
+
+	/* Wait for an incoming connection. (wake-one). */
+	add_wait_queue_exclusive(sk_sleep(sk), &wait);
+	while (1) {
+		if (sk->sk_state != BT_LISTEN) {
+			err = -EBADFD;
+			break;
+		}
+
+		ch = bt_accept_dequeue(sk, newsock);
+		if (ch)
+			break;
+
+		if (!timeo) {
+			err = -EAGAIN;
+			break;
+		}
+
+		if (signal_pending(current)) {
+			err = sock_intr_errno(timeo);
+			break;
+		}
+
+		release_sock(sk);
+
+		timeo = wait_woken(&wait, TASK_INTERRUPTIBLE, timeo);
+		lock_sock(sk);
+	}
+	remove_wait_queue(sk_sleep(sk), &wait);
+
+	if (err)
+		goto done;
+
+	newsock->state = SS_CONNECTED;
+
+	BT_DBG("new socket %p", ch);
+
+done:
+	release_sock(sk);
+	return err;
+}
+
+static int iso_sock_getname(struct socket *sock, struct sockaddr *addr,
+			    int peer)
+{
+	struct sockaddr_iso *sa = (struct sockaddr_iso *) addr;
+	struct sock *sk = sock->sk;
+
+	BT_DBG("sock %p, sk %p", sock, sk);
+
+	addr->sa_family = AF_BLUETOOTH;
+
+	if (peer) {
+		bacpy(&sa->iso_bdaddr, &iso_pi(sk)->dst);
+		sa->iso_bdaddr_type = iso_pi(sk)->dst_type;
+	} else {
+		bacpy(&sa->iso_bdaddr, &iso_pi(sk)->src);
+		sa->iso_bdaddr_type = iso_pi(sk)->src_type;
+	}
+
+	return sizeof(struct sockaddr_iso);
+}
+
+static int iso_sock_sendmsg(struct socket *sock, struct msghdr *msg,
+			    size_t len)
+{
+	struct sock *sk = sock->sk;
+	int err;
+
+	BT_DBG("sock %p, sk %p", sock, sk);
+
+	err = sock_error(sk);
+	if (err)
+		return err;
+
+	if (msg->msg_flags & MSG_OOB)
+		return -EOPNOTSUPP;
+
+	lock_sock(sk);
+
+	if (sk->sk_state == BT_CONNECTED)
+		err = iso_send_frame(sk, msg, len);
+	else
+		err = -ENOTCONN;
+
+	release_sock(sk);
+	return err;
+}
+
+static void iso_conn_defer_accept(struct hci_conn *conn)
+{
+	struct hci_cp_le_accept_cis cp;
+	struct hci_dev *hdev = conn->hdev;
+
+	BT_DBG("conn %p", conn);
+
+	conn->state = BT_CONFIG;
+
+	cp.handle = cpu_to_le16(conn->handle);
+
+	hci_send_cmd(hdev, HCI_OP_LE_ACCEPT_CIS, sizeof(cp), &cp);
+}
+
+static int iso_sock_recvmsg(struct socket *sock, struct msghdr *msg,
+			    size_t len, int flags)
+{
+	struct sock *sk = sock->sk;
+	struct iso_pinfo *pi = iso_pi(sk);
+
+	lock_sock(sk);
+
+	if (sk->sk_state == BT_CONNECT2 &&
+	    test_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags)) {
+		iso_conn_defer_accept(pi->conn->hcon);
+		sk->sk_state = BT_CONFIG;
+
+		release_sock(sk);
+		return 0;
+	}
+
+	release_sock(sk);
+
+	return bt_sock_recvmsg(sock, msg, len, flags);
+}
+
+static bool check_qos(struct bt_iso_qos *qos)
+{
+	/* If no PHY is enable MTU must be 0 */
+	if (!qos->phy && qos->mtu)
+		return false;
+
+	if (qos->interval && (qos->interval < 0xff || qos->interval > 0xfffff))
+		return false;
+
+	if (qos->sca > 0x07)
+		return false;
+
+	if (qos->packing > 0x01)
+		return false;
+
+	if (qos->framing > 0x01)
+		return false;
+
+	if (qos->latency && (qos->latency < 0x05 || qos->latency > 0xfa0))
+		return false;
+
+	if (qos->phy > BT_ISO_PHY_ANY)
+		return false;
+
+	return true;
+}
+
+static int iso_sock_setsockopt(struct socket *sock, int level, int optname,
+			       char __user *optval, unsigned int optlen)
+{
+	struct sock *sk = sock->sk;
+	int len, err = 0;
+	struct bt_iso_qos qos;
+	u32 opt;
+
+	BT_DBG("sk %p", sk);
+
+	lock_sock(sk);
+
+	switch (optname) {
+
+	case BT_DEFER_SETUP:
+		if (sk->sk_state != BT_BOUND && sk->sk_state != BT_LISTEN) {
+			err = -EINVAL;
+			break;
+		}
+
+		if (get_user(opt, (u32 __user *) optval)) {
+			err = -EFAULT;
+			break;
+		}
+
+		if (opt)
+			set_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags);
+		else
+			clear_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags);
+		break;
+
+	case BT_ISO_IN_QOS:
+		if (sk->sk_state != BT_OPEN && sk->sk_state != BT_BOUND &&
+		    sk->sk_state != BT_CONNECT2) {
+			err = -EINVAL;
+			break;
+		}
+
+		qos = iso_pi(sk)->in_qos;
+
+		len = min_t(unsigned int, sizeof(qos), optlen);
+		if (copy_from_user((char *)&qos, optval, len)) {
+			err = -EFAULT;
+			break;
+		}
+
+		if (!check_qos(&qos)) {
+			err = -EINVAL;
+			break;
+		}
+
+		iso_pi(sk)->in_qos = qos;
+		break;
+
+	case BT_ISO_OUT_QOS:
+		if (sk->sk_state != BT_OPEN && sk->sk_state != BT_BOUND &&
+		    sk->sk_state != BT_CONNECT2) {
+			err = -EINVAL;
+			break;
+		}
+
+		qos = iso_pi(sk)->out_qos;
+
+		len = min_t(unsigned int, sizeof(qos), optlen);
+		if (copy_from_user((char *)&qos, optval, len)) {
+			err = -EFAULT;
+			break;
+		}
+
+		if (!check_qos(&qos)) {
+			err = -EINVAL;
+			break;
+		}
+
+		iso_pi(sk)->out_qos = qos;
+		break;
+
+	default:
+		err = -ENOPROTOOPT;
+		break;
+	}
+
+	release_sock(sk);
+	return err;
+}
+
+static int iso_sock_getsockopt(struct socket *sock, int level, int optname,
+			       char __user *optval, int __user *optlen)
+{
+	struct sock *sk = sock->sk;
+	int len, err = 0;
+	struct bt_iso_qos qos;
+
+	BT_DBG("sk %p", sk);
+
+	if (get_user(len, optlen))
+		return -EFAULT;
+
+	lock_sock(sk);
+
+	switch (optname) {
+
+	case BT_DEFER_SETUP:
+		if (sk->sk_state != BT_BOUND && sk->sk_state != BT_LISTEN) {
+			err = -EINVAL;
+			break;
+		}
+
+		if (put_user(test_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags),
+			     (u32 __user *)optval))
+			err = -EFAULT;
+
+		break;
+
+	case BT_ISO_IN_QOS:
+		qos = iso_pi(sk)->in_qos;
+
+		len = min_t(unsigned int, len, sizeof(qos));
+		if (copy_to_user(optval, (char *)&qos, len))
+			err = -EFAULT;
+
+		break;
+
+	case BT_ISO_OUT_QOS:
+		qos = iso_pi(sk)->out_qos;
+
+		len = min_t(unsigned int, len, sizeof(qos));
+		if (copy_to_user(optval, (char *)&qos, len))
+			err = -EFAULT;
+
+		break;
+
+	default:
+		err = -ENOPROTOOPT;
+		break;
+	}
+
+	release_sock(sk);
+	return err;
+}
+
+static int iso_sock_shutdown(struct socket *sock, int how)
+{
+	struct sock *sk = sock->sk;
+	int err = 0;
+
+	BT_DBG("sock %p, sk %p", sock, sk);
+
+	if (!sk)
+		return 0;
+
+	sock_hold(sk);
+	lock_sock(sk);
+
+	if (!sk->sk_shutdown) {
+		sk->sk_shutdown = SHUTDOWN_MASK;
+		iso_sock_clear_timer(sk);
+		__iso_sock_close(sk);
+
+		if (sock_flag(sk, SOCK_LINGER) && sk->sk_lingertime &&
+		    !(current->flags & PF_EXITING))
+			err = bt_sock_wait_state(sk, BT_CLOSED,
+						 sk->sk_lingertime);
+	}
+
+	release_sock(sk);
+	sock_put(sk);
+
+	return err;
+}
+
+static int iso_sock_release(struct socket *sock)
+{
+	struct sock *sk = sock->sk;
+	int err = 0;
+
+	BT_DBG("sock %p, sk %p", sock, sk);
+
+	if (!sk)
+		return 0;
+
+	iso_sock_close(sk);
+
+	if (sock_flag(sk, SOCK_LINGER) && sk->sk_lingertime &&
+	    !(current->flags & PF_EXITING)) {
+		lock_sock(sk);
+		err = bt_sock_wait_state(sk, BT_CLOSED, sk->sk_lingertime);
+		release_sock(sk);
+	}
+
+	sock_orphan(sk);
+	iso_sock_kill(sk);
+	return err;
+}
+
+static void iso_conn_ready(struct iso_conn *conn)
+{
+	struct sock *parent;
+	struct sock *sk = conn->sk;
+
+	BT_DBG("conn %p", conn);
+
+	if (sk) {
+		iso_sock_clear_timer(sk);
+		bh_lock_sock(sk);
+		sk->sk_state = BT_CONNECTED;
+		sk->sk_state_change(sk);
+		bh_unlock_sock(sk);
+	} else {
+		iso_conn_lock(conn);
+
+		if (!conn->hcon) {
+			iso_conn_unlock(conn);
+			return;
+		}
+
+		parent = iso_get_sock_listen(&conn->hcon->src);
+		if (!parent) {
+			iso_conn_unlock(conn);
+			return;
+		}
+
+		bh_lock_sock(parent);
+
+		sk = iso_sock_alloc(sock_net(parent), NULL,
+				    BTPROTO_ISO, GFP_ATOMIC, 0);
+		if (!sk) {
+			bh_unlock_sock(parent);
+			iso_conn_unlock(conn);
+			return;
+		}
+
+		iso_sock_init(sk, parent);
+
+		bacpy(&iso_pi(sk)->src, &conn->hcon->src);
+		iso_pi(sk)->src_type = conn->hcon->src_type;
+		bacpy(&iso_pi(sk)->dst, &conn->hcon->dst);
+		iso_pi(sk)->dst_type = conn->hcon->dst_type;
+
+		hci_conn_hold(conn->hcon);
+		__iso_chan_add(conn, sk, parent);
+
+		if (test_bit(BT_SK_DEFER_SETUP, &bt_sk(parent)->flags))
+			sk->sk_state = BT_CONNECT2;
+		else
+			sk->sk_state = BT_CONNECTED;
+
+		/* Wake up parent */
+		parent->sk_data_ready(parent);
+
+		bh_unlock_sock(parent);
+
+		iso_conn_unlock(conn);
+	}
+}
+
+/* ----- ISO interface with lower layer (HCI) ----- */
+int iso_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr, __u8 *flags)
+{
+	struct sock *sk;
+	int lm = 0;
+
+	BT_DBG("hdev %s, bdaddr %pMR", hdev->name, bdaddr);
+
+	/* Find listening sockets */
+	read_lock(&iso_sk_list.lock);
+	sk_for_each(sk, &iso_sk_list.head) {
+		if (sk->sk_state != BT_LISTEN)
+			continue;
+
+		if (!bacmp(&iso_pi(sk)->src, &hdev->bdaddr) ||
+		    !bacmp(&iso_pi(sk)->src, BDADDR_ANY)) {
+			lm |= HCI_LM_ACCEPT;
+
+			if (test_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags))
+				*flags |= HCI_PROTO_DEFER;
+			break;
+		}
+	}
+	read_unlock(&iso_sk_list.lock);
+
+	return lm;
+}
+
+static void iso_connect_cfm(struct hci_conn *hcon, __u8 status)
+{
+	if (hcon->type != ISO_LINK)
+		return;
+
+	BT_DBG("hcon %p bdaddr %pMR status %d", hcon, &hcon->dst, status);
+
+	if (!status) {
+		struct iso_conn *conn;
+
+		conn = iso_conn_add(hcon);
+		if (conn)
+			iso_conn_ready(conn);
+	} else
+		iso_conn_del(hcon, bt_to_errno(status));
+}
+
+static void iso_disconn_cfm(struct hci_conn *hcon, __u8 reason)
+{
+	if (hcon->type != ISO_LINK)
+		return;
+
+	BT_DBG("hcon %p reason %d", hcon, reason);
+
+	iso_conn_del(hcon, bt_to_errno(reason));
+}
+
+void iso_recv(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
+{
+	struct iso_conn *conn = hcon->iso_data;
+	struct hci_iso_data_hdr *hdr;
+	__u16 pb, ts, len;
+
+	if (!conn)
+		goto drop;
+
+	pb     = hci_iso_flags_pb(flags);
+	ts     = hci_iso_flags_ts(flags);
+
+	BT_DBG("conn %p len %d pb 0x%x ts 0x%x", conn, skb->len, pb, ts);
+
+	switch (pb) {
+	case ISO_START:
+	case ISO_SINGLE:
+		if (conn->rx_len) {
+			BT_ERR("Unexpected start frame (len %d)", skb->len);
+			kfree_skb(conn->rx_skb);
+			conn->rx_skb = NULL;
+			conn->rx_len = 0;
+		}
+
+		/* Start fragment always begin with ISO data header */
+		if ((ts && skb->len < HCI_ISO_TS_DATA_HDR_SIZE) ||
+		    skb->len < HCI_ISO_DATA_HDR_SIZE) {
+			BT_ERR("Frame is too short (len %d)", skb->len);
+			goto drop;
+		}
+
+		if (ts) {
+			/* TODO: add timestamp to the packet? */
+			hdr = (void *) skb->data + 4;
+			skb_pull(skb, HCI_ISO_TS_DATA_HDR_SIZE);
+		} else {
+			hdr = (void *) skb->data;
+			skb_pull(skb, HCI_ISO_DATA_HDR_SIZE);
+		}
+
+		len    = __le16_to_cpu(hdr->slen);
+		flags  = hci_iso_data_flags(len);
+		len    = hci_iso_data_len(len);
+
+		BT_DBG("Start: total len %d, frag len %d flags 0x%4.4x", len,
+		       skb->len, flags);
+
+		if (len == skb->len) {
+			/* Complete frame received */
+			iso_recv_frame(conn, skb);
+			return;
+		}
+
+		if (pb == ISO_SINGLE) {
+			BT_ERR("Frame malformed (len %d, expected len %d)",
+			       skb->len, len);
+			goto drop;
+		}
+
+		if (skb->len > len) {
+			BT_ERR("Frame is too long (len %d, expected len %d)",
+			       skb->len, len);
+			goto drop;
+		}
+
+		/* Allocate skb for the complete frame (with header) */
+		conn->rx_skb = bt_skb_alloc(len, GFP_KERNEL);
+		if (!conn->rx_skb)
+			goto drop;
+
+		skb_copy_from_linear_data(skb, skb_put(conn->rx_skb, skb->len),
+					  skb->len);
+		conn->rx_len = len - skb->len;
+		break;
+
+	case ISO_CONT:
+		BT_DBG("Cont: frag len %d (expecting %d)", skb->len,
+		       conn->rx_len);
+
+		if (!conn->rx_len) {
+			BT_ERR("Unexpected continuation frame (len %d)",
+			       skb->len);
+			goto drop;
+		}
+
+		if (skb->len > conn->rx_len) {
+			BT_ERR("Fragment is too long (len %d, expected %d)",
+			       skb->len, conn->rx_len);
+			kfree_skb(conn->rx_skb);
+			conn->rx_skb = NULL;
+			conn->rx_len = 0;
+			goto drop;
+		}
+
+		skb_copy_from_linear_data(skb, skb_put(conn->rx_skb, skb->len),
+					  skb->len);
+		conn->rx_len -= skb->len;
+		return;
+
+	case ISO_END:
+		skb_copy_from_linear_data(skb, skb_put(conn->rx_skb, skb->len),
+					  skb->len);
+		conn->rx_len -= skb->len;
+
+		if (!conn->rx_len) {
+			/* Complete frame received. iso_recv_frame
+			 * takes ownership of the skb so set the global
+			 * rx_skb pointer to NULL first.
+			 */
+			struct sk_buff *rx_skb = conn->rx_skb;
+			conn->rx_skb = NULL;
+			iso_recv_frame(conn, rx_skb);
+		}
+		break;
+	}
+
+drop:
+	kfree_skb(skb);
+}
+
+static struct hci_cb iso_cb = {
+	.name		= "ISO",
+	.connect_cfm	= iso_connect_cfm,
+	.disconn_cfm	= iso_disconn_cfm,
+};
+
+static int iso_debugfs_show(struct seq_file *f, void *p)
+{
+	struct sock *sk;
+
+	read_lock(&iso_sk_list.lock);
+
+	sk_for_each(sk, &iso_sk_list.head) {
+		seq_printf(f, "%pMR %pMR %d\n", &iso_pi(sk)->src,
+			   &iso_pi(sk)->dst, sk->sk_state);
+	}
+
+	read_unlock(&iso_sk_list.lock);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(iso_debugfs);
+
+static struct dentry *iso_debugfs;
+
+static const struct proto_ops iso_sock_ops = {
+	.family		= PF_BLUETOOTH,
+	.owner		= THIS_MODULE,
+	.release	= iso_sock_release,
+	.bind		= iso_sock_bind,
+	.connect	= iso_sock_connect,
+	.listen		= iso_sock_listen,
+	.accept		= iso_sock_accept,
+	.getname	= iso_sock_getname,
+	.sendmsg	= iso_sock_sendmsg,
+	.recvmsg	= iso_sock_recvmsg,
+	.poll		= bt_sock_poll,
+	.ioctl		= bt_sock_ioctl,
+	.mmap		= sock_no_mmap,
+	.socketpair	= sock_no_socketpair,
+	.shutdown	= iso_sock_shutdown,
+	.setsockopt	= iso_sock_setsockopt,
+	.getsockopt	= iso_sock_getsockopt
+};
+
+static const struct net_proto_family iso_sock_family_ops = {
+	.family	= PF_BLUETOOTH,
+	.owner	= THIS_MODULE,
+	.create	= iso_sock_create,
+};
+
+int __init iso_init(void)
+{
+	int err;
+
+	BUILD_BUG_ON(sizeof(struct sockaddr_iso) > sizeof(struct sockaddr));
+
+	err = proto_register(&iso_proto, 0);
+	if (err < 0)
+		return err;
+
+	err = bt_sock_register(BTPROTO_ISO, &iso_sock_family_ops);
+	if (err < 0) {
+		BT_ERR("ISO socket registration failed");
+		goto error;
+	}
+
+	err = bt_procfs_init(&init_net, "iso", &iso_sk_list, NULL);
+	if (err < 0) {
+		BT_ERR("Failed to create ISO proc file");
+		bt_sock_unregister(BTPROTO_ISO);
+		goto error;
+	}
+
+	BT_INFO("ISO socket layer initialized");
+
+	hci_register_cb(&iso_cb);
+
+	if (IS_ERR_OR_NULL(bt_debugfs))
+		return 0;
+
+	iso_debugfs = debugfs_create_file("iso", 0444, bt_debugfs,
+					  NULL, &iso_debugfs_fops);
+
+	return 0;
+
+error:
+	proto_unregister(&iso_proto);
+	return err;
+}
+
+void iso_exit(void)
+{
+	bt_procfs_cleanup(&init_net, "iso");
+
+	debugfs_remove(iso_debugfs);
+
+	hci_unregister_cb(&iso_cb);
+
+	bt_sock_unregister(BTPROTO_ISO);
+
+	proto_unregister(&iso_proto);
+}
-- 
2.21.0

