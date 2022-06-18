Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4DE454FFC9
	for <lists+linux-bluetooth@lfdr.de>; Sat, 18 Jun 2022 00:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347292AbiFQWRY (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 17 Jun 2022 18:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345459AbiFQWRU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 17 Jun 2022 18:17:20 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67CF15A59F
        for <linux-bluetooth@vger.kernel.org>; Fri, 17 Jun 2022 15:17:18 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id p3-20020a17090a428300b001ec865eb4a2so600792pjg.3
        for <linux-bluetooth@vger.kernel.org>; Fri, 17 Jun 2022 15:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1I5lRhgzEbKbM75T6DtRcqC5Y3wP9GOcYppr6zxtep0=;
        b=GIhfOZcl2pwjrIiS78QYZu1Fr70dJtHhddnbjsd+JERNl6darvGqose6/skB+1WtpE
         Mgv6ksW3/iwsBlnzaPKe6eCKxqijZJqa4+2OJac3/0T63/gwTvx6ki707j77Sh+m3ZhK
         a+vHiqVuvN+PH3sjWimd57hVhU0CivzxYhGX2986sYIl0Aqol3/cuemPw8yLGWMZBM8F
         TYw3GjzkeUiQkXgh8ZjhODPTmrFH4BUL6JA7vjhVdToyHKlUc1frlVu2Cprpfjs8Ttcc
         UBcc+hyA+q06ivKGZZFHKFJzVuhkkcmX2oaSRpy0oqfdB4OChhl4BmIQefogrTdPqc6s
         PsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1I5lRhgzEbKbM75T6DtRcqC5Y3wP9GOcYppr6zxtep0=;
        b=WF6VKGu6VBoRGMj/hp0q1EYLVYLlJxnkE6MHSsbHDhlqa/Z8oHvxLoLX8P0aAZS6xy
         +PWBdWegkHISgsD8r/7KgqWglazyfOuexjNNXoUMSe+RkwIGwO+iPmyxfjq9kjOsqpCI
         ukoI3LOEwc+ICFO0O8yKxUB7ueEK4V2sIgyPC0vW341zDO6qT9DXD3yJWgYbg5v4Avok
         mi3zl8ioSa04Sru+qrN0+ak+uTfG8SuOjq6mfcvUizaEtxZQ8eYtZchtzZyYi4xPmKLb
         fAOt61BdR/pXrpn5nH1rzaMeH4d02U6R9PP5WJBD+Tvh/QhvmqXE7D6eUvo09NOaikPC
         bOrw==
X-Gm-Message-State: AJIora+Tc+Kmu1th9CZHiPRiavEVjSZQJzi5+6mf6sMcnLGW0PgVI+Qt
        /eKGn9+OJ7u1zNaEhYyOd+UFzL/p6lM=
X-Google-Smtp-Source: AGRyM1vmbPISq48VpyVgxSvLPn7i2+Du89+OV6fjmzTSGTyCyUY5BE+kWP2wEtZWGKr6+5jbHENDYA==
X-Received: by 2002:a17:90a:8413:b0:1ea:ebf4:7079 with SMTP id j19-20020a17090a841300b001eaebf47079mr11522161pjn.48.1655504236569;
        Fri, 17 Jun 2022 15:17:16 -0700 (PDT)
Received: from lvondent-mobl4.. (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id jc21-20020a17090325d500b0016184e7b013sm4117261plb.36.2022.06.17.15.17.15
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 15:17:15 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v3 3/7] Bluetooth: Add BTPROTO_ISO socket type
Date:   Fri, 17 Jun 2022 15:17:08 -0700
Message-Id: <20220617221712.1394014-3-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220617221712.1394014-1-luiz.dentz@gmail.com>
References: <20220617221712.1394014-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This introduces a new socket type BTPROTO_ISO which can be enabled with
use of ISO Socket experiemental UUID, it can used to initiate/accept
connections and transfer packets between userspace and kernel similarly
to how BTPROTO_SCO works:

Central -> uses connect with address set to destination bdaddr:
> tools/isotest -s 00:AA:01:00:00:00

Peripheral -> uses listen:
> tools/isotest -d

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/bluetooth.h |   21 +
 include/net/bluetooth/hci_core.h  |   18 +-
 include/net/bluetooth/iso.h       |   21 +
 net/bluetooth/Makefile            |    1 +
 net/bluetooth/af_bluetooth.c      |    4 +-
 net/bluetooth/hci_core.c          |    6 +-
 net/bluetooth/hci_event.c         |    4 +-
 net/bluetooth/iso.c               | 1473 +++++++++++++++++++++++++++++
 net/bluetooth/mgmt.c              |   69 +-
 9 files changed, 1610 insertions(+), 7 deletions(-)
 create mode 100644 include/net/bluetooth/iso.h
 create mode 100644 net/bluetooth/iso.c

diff --git a/include/net/bluetooth/bluetooth.h b/include/net/bluetooth/bluetooth.h
index a3ebd7fa152d..bab566ebe10e 100644
--- a/include/net/bluetooth/bluetooth.h
+++ b/include/net/bluetooth/bluetooth.h
@@ -590,6 +590,27 @@ static inline void sco_exit(void)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_BT_LE)
+int iso_init(void);
+int iso_exit(void);
+bool iso_enabled(void);
+#else
+static inline int iso_init(void)
+{
+	return 0;
+}
+
+static inline int iso_exit(void)
+{
+	return 0;
+}
+
+static inline bool iso_enabled(void)
+{
+	return false;
+}
+#endif
+
 int mgmt_init(void);
 void mgmt_exit(void);
 
diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 955311409e5d..87f22a996158 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -848,6 +848,21 @@ static inline void sco_recv_scodata(struct hci_conn *hcon, struct sk_buff *skb)
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
@@ -1648,8 +1663,7 @@ static inline int hci_proto_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr,
 		return sco_connect_ind(hdev, bdaddr, flags);
 
 	case ISO_LINK:
-		/* TODO: Handle connection indication */
-		return -EINVAL;
+		return iso_connect_ind(hdev, bdaddr, flags);
 
 	default:
 		BT_ERR("unknown link type %d", type);
diff --git a/include/net/bluetooth/iso.h b/include/net/bluetooth/iso.h
new file mode 100644
index 000000000000..13b22d54aab5
--- /dev/null
+++ b/include/net/bluetooth/iso.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * BlueZ - Bluetooth protocol stack for Linux
+ *
+ * Copyright (C) 2022 Intel Corporation
+ */
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
index a52bba8500e1..0e7b7db42750 100644
--- a/net/bluetooth/Makefile
+++ b/net/bluetooth/Makefile
@@ -18,6 +18,7 @@ bluetooth-y := af_bluetooth.o hci_core.o hci_conn.o hci_event.o mgmt.o \
 	eir.o hci_sync.o
 
 bluetooth-$(CONFIG_BT_BREDR) += sco.o
+bluetooth-$(CONFIG_BT_LE) += iso.o
 bluetooth-$(CONFIG_BT_HS) += a2mp.o amp.o
 bluetooth-$(CONFIG_BT_LEDS) += leds.o
 bluetooth-$(CONFIG_BT_MSFTEXT) += msft.o
diff --git a/net/bluetooth/af_bluetooth.c b/net/bluetooth/af_bluetooth.c
index b506409bb498..dc65974f5adb 100644
--- a/net/bluetooth/af_bluetooth.c
+++ b/net/bluetooth/af_bluetooth.c
@@ -38,7 +38,7 @@
 #include "selftest.h"
 
 /* Bluetooth sockets */
-#define BT_MAX_PROTO	8
+#define BT_MAX_PROTO	(BTPROTO_LAST + 1)
 static const struct net_proto_family *bt_proto[BT_MAX_PROTO];
 static DEFINE_RWLOCK(bt_proto_lock);
 
@@ -52,6 +52,7 @@ static const char *const bt_key_strings[BT_MAX_PROTO] = {
 	"sk_lock-AF_BLUETOOTH-BTPROTO_CMTP",
 	"sk_lock-AF_BLUETOOTH-BTPROTO_HIDP",
 	"sk_lock-AF_BLUETOOTH-BTPROTO_AVDTP",
+	"sk_lock-AF_BLUETOOTH-BTPROTO_ISO",
 };
 
 static struct lock_class_key bt_slock_key[BT_MAX_PROTO];
@@ -64,6 +65,7 @@ static const char *const bt_slock_key_strings[BT_MAX_PROTO] = {
 	"slock-AF_BLUETOOTH-BTPROTO_CMTP",
 	"slock-AF_BLUETOOTH-BTPROTO_HIDP",
 	"slock-AF_BLUETOOTH-BTPROTO_AVDTP",
+	"slock-AF_BLUETOOTH-BTPROTO_ISO",
 };
 
 void bt_sock_reclassify_lock(struct sock *sk, int proto)
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 77aa41c181cf..77dfe9aae6ab 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3849,12 +3849,16 @@ static void hci_isodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 	conn = hci_conn_hash_lookup_handle(hdev, handle);
 	hci_dev_unlock(hdev);
 
-	/* TODO: Send to upper protocol */
 	if (!conn) {
 		bt_dev_err(hdev, "ISO packet for unknown connection handle %d",
 			   handle);
+		goto drop;
 	}
 
+	/* Send to upper protocol */
+	iso_recv(conn, skb, flags);
+	return;
+
 drop:
 	kfree_skb(skb);
 }
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index a2097760abec..c6274a0e0e97 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -3828,8 +3828,8 @@ static u8 hci_cc_le_set_cig_params(struct hci_dev *hdev, void *data,
 
 		conn->handle = __le16_to_cpu(rp->handle[i++]);
 
-		BT_DBG("%p handle 0x%4.4x link %p state %u", conn, conn->handle,
-		       conn->link, conn->link->state);
+		bt_dev_dbg(hdev, "%p handle 0x%4.4x link %p state %u", conn,
+			   conn->handle, conn->link, conn->link->state);
 
 		/* Create CIS if LE is already connected */
 		if (conn->link->state == BT_CONNECTED)
diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
new file mode 100644
index 000000000000..4b5499ff2584
--- /dev/null
+++ b/net/bluetooth/iso.c
@@ -0,0 +1,1473 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * BlueZ - Bluetooth protocol stack for Linux
+ *
+ * Copyright (C) 2022 Intel Corporation
+ */
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
+	/* @lock: spinlock protecting changes to iso_conn fields */
+	spinlock_t	lock;
+	struct sock	*sk;
+
+	struct delayed_work	timeout_work;
+
+	struct sk_buff	*rx_skb;
+	__u32		rx_len;
+	__u16		tx_sn;
+};
+
+#define iso_conn_lock(c)	spin_lock(&(c)->lock)
+#define iso_conn_unlock(c)	spin_unlock(&(c)->lock)
+
+static void iso_sock_close(struct sock *sk);
+static void iso_sock_kill(struct sock *sk);
+
+/* ----- ISO socket info ----- */
+#define iso_pi(sk) ((struct iso_pinfo *)sk)
+
+struct iso_pinfo {
+	struct bt_sock		bt;
+	bdaddr_t		src;
+	__u8			src_type;
+	bdaddr_t		dst;
+	__u8			dst_type;
+	__u32			flags;
+	struct bt_iso_qos	qos;
+	struct iso_conn		*conn;
+};
+
+/* ---- ISO timers ---- */
+#define ISO_CONN_TIMEOUT	(HZ * 40)
+#define ISO_DISCONN_TIMEOUT	(HZ * 2)
+
+static void iso_sock_timeout(struct work_struct *work)
+{
+	struct iso_conn *conn = container_of(work, struct iso_conn,
+					     timeout_work.work);
+	struct sock *sk;
+
+	iso_conn_lock(conn);
+	sk = conn->sk;
+	if (sk)
+		sock_hold(sk);
+	iso_conn_unlock(conn);
+
+	if (!sk)
+		return;
+
+	BT_DBG("sock %p state %d", sk, sk->sk_state);
+
+	lock_sock(sk);
+	sk->sk_err = ETIMEDOUT;
+	sk->sk_state_change(sk);
+	release_sock(sk);
+	sock_put(sk);
+}
+
+static void iso_sock_set_timer(struct sock *sk, long timeout)
+{
+	if (!iso_pi(sk)->conn)
+		return;
+
+	BT_DBG("sock %p state %d timeout %ld", sk, sk->sk_state, timeout);
+	cancel_delayed_work(&iso_pi(sk)->conn->timeout_work);
+	schedule_delayed_work(&iso_pi(sk)->conn->timeout_work, timeout);
+}
+
+static void iso_sock_clear_timer(struct sock *sk)
+{
+	if (!iso_pi(sk)->conn)
+		return;
+
+	BT_DBG("sock %p state %d", sk, sk->sk_state);
+	cancel_delayed_work(&iso_pi(sk)->conn->timeout_work);
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
+	conn = kzalloc(sizeof(*conn), GFP_KERNEL);
+	if (!conn)
+		return NULL;
+
+	spin_lock_init(&conn->lock);
+	INIT_DELAYED_WORK(&conn->timeout_work, iso_sock_timeout);
+
+	hcon->iso_data = conn;
+	conn->hcon = hcon;
+	conn->tx_sn = 0;
+
+	BT_DBG("hcon %p conn %p", hcon, conn);
+
+	return conn;
+}
+
+/* Delete channel. Must be called on the locked socket. */
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
+	if (sk)
+		sock_hold(sk);
+	iso_conn_unlock(conn);
+
+	if (sk) {
+		lock_sock(sk);
+		iso_sock_clear_timer(sk);
+		iso_chan_del(sk, err);
+		release_sock(sk);
+		sock_put(sk);
+	}
+
+	/* Ensure no more work items will run before freeing conn. */
+	cancel_delayed_work_sync(&conn->timeout_work);
+
+	hcon->iso_data = NULL;
+	kfree(conn);
+}
+
+static int __iso_chan_add(struct iso_conn *conn, struct sock *sk,
+			  struct sock *parent)
+{
+	BT_DBG("conn %p", conn);
+
+	if (conn->sk) {
+		BT_ERR("conn->sk already set");
+		return -EBUSY;
+	}
+
+	iso_pi(sk)->conn = conn;
+	conn->sk = sk;
+
+	if (parent)
+		bt_accept_enqueue(parent, sk, true);
+
+	return 0;
+}
+
+static int iso_chan_add(struct iso_conn *conn, struct sock *sk,
+			struct sock *parent)
+{
+	int err;
+
+	iso_conn_lock(conn);
+	err = __iso_chan_add(conn, sk, parent);
+	iso_conn_unlock(conn);
+
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
+			     iso_pi(sk)->src_type);
+	if (!hdev)
+		return -EHOSTUNREACH;
+
+	hci_dev_lock(hdev);
+
+	if (!cis_central_capable(hdev)) {
+		err = -EOPNOTSUPP;
+		goto done;
+	}
+
+	/* Fail if either PHYs are marked as disabled */
+	if (!iso_pi(sk)->qos.in.phy && !iso_pi(sk)->qos.out.phy) {
+		err = -EINVAL;
+		goto done;
+	}
+
+	/* Just bind if DEFER_SETUP has been set */
+	if (test_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags)) {
+		hcon = hci_bind_cis(hdev, &iso_pi(sk)->dst,
+				    iso_pi(sk)->dst_type, &iso_pi(sk)->qos);
+		if (IS_ERR(hcon))
+			err = PTR_ERR(hcon);
+		else
+			err = 0;
+		goto done;
+	}
+
+	hcon = hci_connect_cis(hdev, &iso_pi(sk)->dst, iso_pi(sk)->dst_type,
+			       &iso_pi(sk)->qos);
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
+static int iso_send_frame(struct sock *sk, struct sk_buff *skb)
+{
+	struct iso_conn *conn = iso_pi(sk)->conn;
+	struct hci_iso_data_hdr *hdr;
+	int len = 0;
+
+	BT_DBG("sk %p len %d", sk, skb->len);
+
+	if (skb->len > iso_pi(sk)->qos.out.sdu)
+		return -EMSGSIZE;
+
+	len = skb->len;
+
+	/* Push ISO data header */
+	hdr = skb_push(skb, HCI_ISO_DATA_HDR_SIZE);
+	hdr->sn = cpu_to_le16(conn->tx_sn++);
+	hdr->slen = cpu_to_le16(hci_iso_data_len_pack(len,
+						      HCI_ISO_STATUS_VALID));
+
+	if (sk->sk_state == BT_CONNECTED)
+		hci_send_iso(conn->hcon, skb);
+	else
+		len = -ENOTCONN;
+
+	return len;
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
+static void iso_conn_defer_reject(struct hci_conn *conn)
+{
+	struct hci_cp_le_reject_cis cp;
+
+	BT_DBG("conn %p", conn);
+
+	memset(&cp, 0, sizeof(cp));
+	cp.handle = cpu_to_le16(conn->handle);
+	cp.reason = HCI_ERROR_REJ_BAD_ADDR;
+	hci_send_cmd(conn->hdev, HCI_OP_LE_REJECT_CIS, sizeof(cp), &cp);
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
+		} else {
+			iso_chan_del(sk, ECONNRESET);
+		}
+		break;
+
+	case BT_CONNECT2:
+		if (iso_pi(sk)->conn->hcon)
+			iso_conn_defer_reject(iso_pi(sk)->conn->hcon);
+		iso_chan_del(sk, ECONNRESET);
+		break;
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
+#define DEFAULT_IO_QOS \
+{ \
+	.interval	= 10000u, \
+	.latency	= 10u, \
+	.sdu		= 40u, \
+	.phy		= BT_ISO_PHY_2M, \
+	.rtn		= 2u, \
+}
+
+static struct bt_iso_qos default_qos = {
+	.cig		= BT_ISO_QOS_CIG_UNSET,
+	.cis		= BT_ISO_QOS_CIS_UNSET,
+	.sca		= 0x00,
+	.packing	= 0x00,
+	.framing	= 0x00,
+	.in		= DEFAULT_IO_QOS,
+	.out		= DEFAULT_IO_QOS,
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
+	iso_pi(sk)->qos = default_qos;
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
+	struct sockaddr_iso *sa = (struct sockaddr_iso *)addr;
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
+	struct sockaddr_iso *sa = (struct sockaddr_iso *)addr;
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
+	struct sockaddr_iso *sa = (struct sockaddr_iso *)addr;
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
+	struct iso_conn *conn = iso_pi(sk)->conn;
+	struct sk_buff *skb, **frag;
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
+	if (sk->sk_state != BT_CONNECTED)
+		return -ENOTCONN;
+
+	skb = bt_skb_sendmsg(sk, msg, len, conn->hcon->hdev->iso_mtu,
+			     HCI_ISO_DATA_HDR_SIZE, 0);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	len -= skb->len;
+
+	BT_DBG("skb %p len %d", sk, skb->len);
+
+	/* Continuation fragments */
+	frag = &skb_shinfo(skb)->frag_list;
+	while (len) {
+		struct sk_buff *tmp;
+
+		tmp = bt_skb_sendmsg(sk, msg, len, conn->hcon->hdev->iso_mtu,
+				     0, 0);
+		if (IS_ERR(tmp)) {
+			kfree_skb(skb);
+			return PTR_ERR(tmp);
+		}
+
+		*frag = tmp;
+
+		len  -= tmp->len;
+
+		skb->len += tmp->len;
+		skb->data_len += tmp->len;
+
+		BT_DBG("frag %p len %d", *frag, tmp->len);
+
+		frag = &(*frag)->next;
+	}
+
+	lock_sock(sk);
+
+	if (sk->sk_state == BT_CONNECTED)
+		err = iso_send_frame(sk, skb);
+	else
+		err = -ENOTCONN;
+
+	release_sock(sk);
+
+	if (err < 0)
+		kfree_skb(skb);
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
+static bool check_io_qos(struct bt_iso_io_qos *qos)
+{
+	/* If no PHY is enable SDU must be 0 */
+	if (!qos->phy && qos->sdu)
+		return false;
+
+	if (qos->interval && (qos->interval < 0xff || qos->interval > 0xfffff))
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
+static bool check_qos(struct bt_iso_qos *qos)
+{
+	/* CIS shall not be set */
+	if (qos->cis != BT_ISO_QOS_CIS_UNSET)
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
+	if (!check_io_qos(&qos->in))
+		return false;
+
+	if (!check_io_qos(&qos->out))
+		return false;
+
+	return true;
+}
+
+static int iso_sock_setsockopt(struct socket *sock, int level, int optname,
+			       sockptr_t optval, unsigned int optlen)
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
+	case BT_DEFER_SETUP:
+		if (sk->sk_state != BT_BOUND && sk->sk_state != BT_LISTEN) {
+			err = -EINVAL;
+			break;
+		}
+
+		if (copy_from_sockptr(&opt, optval, sizeof(u32))) {
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
+	case BT_ISO_QOS:
+		if (sk->sk_state != BT_OPEN && sk->sk_state != BT_BOUND &&
+		    sk->sk_state != BT_CONNECT2) {
+			err = -EINVAL;
+			break;
+		}
+
+		len = min_t(unsigned int, sizeof(qos), optlen);
+		if (len != sizeof(qos))
+			return -EINVAL;
+
+		memset(&qos, 0, sizeof(qos));
+
+		if (copy_from_sockptr(&qos, optval, len)) {
+			err = -EFAULT;
+			break;
+		}
+
+		if (!check_qos(&qos)) {
+			err = -EINVAL;
+			break;
+		}
+
+		iso_pi(sk)->qos = qos;
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
+	case BT_ISO_QOS:
+		if (sk->sk_state == BT_CONNECTED || sk->sk_state == BT_CONNECT2)
+			qos = iso_pi(sk)->conn->hcon->iso_qos;
+		else
+			qos = iso_pi(sk)->qos;
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
+static void iso_sock_ready(struct sock *sk)
+{
+	BT_DBG("sk %p", sk);
+
+	if (!sk)
+		return;
+
+	lock_sock(sk);
+	iso_sock_clear_timer(sk);
+	sk->sk_state = BT_CONNECTED;
+	sk->sk_state_change(sk);
+	release_sock(sk);
+}
+
+struct iso_list_data {
+	struct hci_conn *hcon;
+	int count;
+};
+
+static void iso_conn_ready(struct iso_conn *conn)
+{
+	struct sock *parent;
+	struct sock *sk = conn->sk;
+
+	BT_DBG("conn %p", conn);
+
+	if (sk) {
+		iso_sock_ready(conn->sk);
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
+		lock_sock(parent);
+
+		sk = iso_sock_alloc(sock_net(parent), NULL,
+				    BTPROTO_ISO, GFP_ATOMIC, 0);
+		if (!sk) {
+			release_sock(parent);
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
+		release_sock(parent);
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
+	if (hcon->type != ISO_LINK) {
+		if (hcon->type != LE_LINK)
+			return;
+
+		/* Check if LE link has failed */
+		if (status && hcon->link) {
+			iso_conn_del(hcon->link, bt_to_errno(status));
+			return;
+		}
+
+		/* Create CIS if pending */
+		hci_le_create_cis(hcon);
+		return;
+	}
+
+	BT_DBG("hcon %p bdaddr %pMR status %d", hcon, &hcon->dst, status);
+
+	if (!status) {
+		struct iso_conn *conn;
+
+		conn = iso_conn_add(hcon);
+		if (conn)
+			iso_conn_ready(conn);
+	} else {
+		iso_conn_del(hcon, bt_to_errno(status));
+	}
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
+		if (ts) {
+			/* TODO: add timestamp to the packet? */
+			hdr = skb_pull_data(skb, HCI_ISO_TS_DATA_HDR_SIZE);
+			if (!hdr) {
+				BT_ERR("Frame is too short (len %d)", skb->len);
+				goto drop;
+			}
+
+		} else {
+			hdr = skb_pull_data(skb, HCI_ISO_DATA_HDR_SIZE);
+			if (!hdr) {
+				BT_ERR("Frame is too short (len %d)", skb->len);
+				goto drop;
+			}
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
+			struct sk_buff *rx_skb = conn->rx_skb;
+
+			/* Complete frame received. iso_recv_frame
+			 * takes ownership of the skb so set the global
+			 * rx_skb pointer to NULL first.
+			 */
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
+static bool iso_inited;
+
+bool iso_enabled(void)
+{
+	return iso_inited;
+}
+
+int iso_init(void)
+{
+	int err;
+
+	BUILD_BUG_ON(sizeof(struct sockaddr_iso) > sizeof(struct sockaddr));
+
+	if (iso_inited)
+		return -EALREADY;
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
+	if (!iso_debugfs) {
+		iso_debugfs = debugfs_create_file("iso", 0444, bt_debugfs,
+						  NULL, &iso_debugfs_fops);
+	}
+
+	iso_inited = true;
+
+	return 0;
+
+error:
+	proto_unregister(&iso_proto);
+	return err;
+}
+
+int iso_exit(void)
+{
+	if (!iso_inited)
+		return -EALREADY;
+
+	bt_procfs_cleanup(&init_net, "iso");
+
+	debugfs_remove(iso_debugfs);
+	iso_debugfs = NULL;
+
+	hci_unregister_cb(&iso_cb);
+
+	bt_sock_unregister(BTPROTO_ISO);
+
+	proto_unregister(&iso_proto);
+
+	iso_inited = false;
+
+	return 0;
+}
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 325695bf2fa9..2847223f7efb 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -3925,10 +3925,16 @@ static const u8 rpa_resolution_uuid[16] = {
 	0xea, 0x11, 0x73, 0xc2, 0x48, 0xa1, 0xc0, 0x15,
 };
 
+/* 6fbaf188-05e0-496a-9885-d6ddfdb4e03e */
+static const u8 iso_socket_uuid[16] = {
+	0x3e, 0xe0, 0xb4, 0xfd, 0xdd, 0xd6, 0x85, 0x98,
+	0x6a, 0x49, 0xe0, 0x05, 0x88, 0xf1, 0xba, 0x6f,
+};
+
 static int read_exp_features_info(struct sock *sk, struct hci_dev *hdev,
 				  void *data, u16 data_len)
 {
-	char buf[102];   /* Enough space for 5 features: 2 + 20 * 5 */
+	char buf[122];   /* Enough space for 6 features: 2 + 20 * 6 */
 	struct mgmt_rp_read_exp_features_info *rp = (void *)buf;
 	u16 idx = 0;
 	u32 flags;
@@ -3992,6 +3998,13 @@ static int read_exp_features_info(struct sock *sk, struct hci_dev *hdev,
 		idx++;
 	}
 
+	if (IS_ENABLED(CONFIG_BT_LE)) {
+		flags = iso_enabled() ? BIT(0) : 0;
+		memcpy(rp->features[idx].uuid, iso_socket_uuid, 16);
+		rp->features[idx].flags = cpu_to_le32(flags);
+		idx++;
+	}
+
 	rp->feature_count = cpu_to_le16(idx);
 
 	/* After reading the experimental features information, enable
@@ -4383,6 +4396,57 @@ static int set_le_simultaneous_roles_func(struct sock *sk, struct hci_dev *hdev,
 	return err;
 }
 
+#ifdef CONFIG_BT_LE
+static int set_iso_socket_func(struct sock *sk, struct hci_dev *hdev,
+			       struct mgmt_cp_set_exp_feature *cp, u16 data_len)
+{
+	struct mgmt_rp_set_exp_feature rp;
+	bool val, changed = false;
+	int err;
+
+	/* Command requires to use the non-controller index */
+	if (hdev)
+		return mgmt_cmd_status(sk, hdev->id,
+				       MGMT_OP_SET_EXP_FEATURE,
+				       MGMT_STATUS_INVALID_INDEX);
+
+	/* Parameters are limited to a single octet */
+	if (data_len != MGMT_SET_EXP_FEATURE_SIZE + 1)
+		return mgmt_cmd_status(sk, MGMT_INDEX_NONE,
+				       MGMT_OP_SET_EXP_FEATURE,
+				       MGMT_STATUS_INVALID_PARAMS);
+
+	/* Only boolean on/off is supported */
+	if (cp->param[0] != 0x00 && cp->param[0] != 0x01)
+		return mgmt_cmd_status(sk, MGMT_INDEX_NONE,
+				       MGMT_OP_SET_EXP_FEATURE,
+				       MGMT_STATUS_INVALID_PARAMS);
+
+	val = cp->param[0] ? true : false;
+	if (val)
+		err = iso_init();
+	else
+		err = iso_exit();
+
+	if (!err)
+		changed = true;
+
+	memcpy(rp.uuid, iso_socket_uuid, 16);
+	rp.flags = cpu_to_le32(val ? BIT(0) : 0);
+
+	hci_sock_set_flag(sk, HCI_MGMT_EXP_FEATURE_EVENTS);
+
+	err = mgmt_cmd_complete(sk, MGMT_INDEX_NONE,
+				MGMT_OP_SET_EXP_FEATURE, 0,
+				&rp, sizeof(rp));
+
+	if (changed)
+		exp_feature_changed(hdev, iso_socket_uuid, val, sk);
+
+	return err;
+}
+#endif
+
 static const struct mgmt_exp_feature {
 	const u8 *uuid;
 	int (*set_func)(struct sock *sk, struct hci_dev *hdev,
@@ -4396,6 +4460,9 @@ static const struct mgmt_exp_feature {
 	EXP_FEAT(quality_report_uuid, set_quality_report_func),
 	EXP_FEAT(offload_codecs_uuid, set_offload_codec_func),
 	EXP_FEAT(le_simultaneous_roles_uuid, set_le_simultaneous_roles_func),
+#ifdef CONFIG_BT_LE
+	EXP_FEAT(iso_socket_uuid, set_iso_socket_func),
+#endif
 
 	/* end with a null feature */
 	EXP_FEAT(NULL, NULL)
-- 
2.35.3

