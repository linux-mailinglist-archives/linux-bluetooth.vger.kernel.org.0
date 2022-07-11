Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C299B563D06
	for <lists+linux-bluetooth@lfdr.de>; Sat,  2 Jul 2022 02:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231506AbiGBASA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 1 Jul 2022 20:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231209AbiGBAR6 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 1 Jul 2022 20:17:58 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA22738D87
        for <linux-bluetooth@vger.kernel.org>; Fri,  1 Jul 2022 17:17:56 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 68so3784050pgb.10
        for <linux-bluetooth@vger.kernel.org>; Fri, 01 Jul 2022 17:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ho+sxgZElF7nrUMR/4lk+lEZ/pi/cNdQ82nKhGHPbho=;
        b=YMcQNwRaGdIxDWfHrpAIvw2USNGmjm6KCueMwyBqfi/SoJWGxi8wKNm27uMVabifI8
         RIY6IfKQVLriDwljtSIc/VxBXlzHMXVLg7nD3hAFrr1G3OCZ11xOGs9j/+KQZEW57dK4
         FHykJr6tFt4RvuU76JPaXvbO/+XGgf+61na/9Q7DG4Kme+6MXhHkb1/w2KdU9VHI4hgG
         ophrx4fHTaVa0VLX8VS1aD/jg/EpWshXh4U3L11rLxuPrxkHKswIfSXXH9Uq5AypsPkX
         yN34w4bSV7yTlp4MS3LCT29DUKBMiyNSIN2hmpmRkcLzeOe8DjgjIBGfnDQUVsIVZnL0
         ynIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ho+sxgZElF7nrUMR/4lk+lEZ/pi/cNdQ82nKhGHPbho=;
        b=nINfre0RrTittvarsbK5LYXNi1YdxpMAQ+t8Wf1PLrwbk3lRvxJxybCYWL0QPAF8Ug
         WMeQwIiMfkAHNi28Wv4DA35C4xQ+RZDMJwEZBHe3lSyc748E0q+e4hZvgSduA+YEppEB
         p4TESQM56ErrN11kanxISVlA2fteGfVIIfey6TTe4v/WWMEtcMEOG0HM4B1YXjqme/2u
         YdXUq/H4DpdpHgz/6V5eYIvVLbDeecheNQjLV/LsiB/cH5L+mA8w7xdoQ0wo6TrLPoq/
         A6SZGxRUmlXyua6qY9ZxjEQ1gb6yS3k1Skx0YF3Ix2RConoamV3gpOIUe/TTIZwMu0LC
         u1Jw==
X-Gm-Message-State: AJIora/hd1zjWtGYwCegSm8R20jowp4S2IONpCveFNh/72uJufK+3u6J
        R0vO93SuXLW9IRHhLR5/PdnQ4LeZAYo=
X-Google-Smtp-Source: AGRyM1tLhiQOhyh2r871M55IlLgk2yd9K5ZUS1VJd5MHbVsn9wm61oaXyHrfCaabcfSEY0ATsDWb6g==
X-Received: by 2002:a05:6a00:1a08:b0:510:979e:f5b with SMTP id g8-20020a056a001a0800b00510979e0f5bmr23552381pfv.34.1656721075600;
        Fri, 01 Jul 2022 17:17:55 -0700 (PDT)
Received: from lvondent-mobl4.. (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0052089e1b88esm16219667pfe.192.2022.07.01.17.17.54
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 17:17:54 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v6 5/7] Bluetooth: ISO: Add broadcast support
Date:   Fri,  1 Jul 2022 17:17:46 -0700
Message-Id: <20220702001748.1003783-5-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220702001748.1003783-1-luiz.dentz@gmail.com>
References: <20220702001748.1003783-1-luiz.dentz@gmail.com>
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

This adds broadcast support for BTPROTO_ISO by extending the
sockaddr_iso with a new struct sockaddr_iso_bc where the socket user
can set the broadcast address when receiving, the SID and the BIS
indexes it wants to synchronize.

When using BTPROTO_ISO for broadcast the roles are:

Broadcaster -> uses connect with address set to BDADDR_ANY:
> tools/isotest -s 00:00:00:00:00:00

Broadcast Receiver -> uses listen with address set to broadcaster:
> tools/isotest -d 00:AA:01:00:00:00

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/bluetooth.h |   2 +
 include/net/bluetooth/iso.h       |  11 +
 net/bluetooth/iso.c               | 393 +++++++++++++++++++++++++++---
 3 files changed, 371 insertions(+), 35 deletions(-)

diff --git a/include/net/bluetooth/bluetooth.h b/include/net/bluetooth/bluetooth.h
index 2a0f8d8e52a5..14f217fa1fdb 100644
--- a/include/net/bluetooth/bluetooth.h
+++ b/include/net/bluetooth/bluetooth.h
@@ -220,6 +220,8 @@ struct bt_codecs {
 #define BT_CODEC_TRANSPARENT	0x03
 #define BT_CODEC_MSBC		0x05
 
+#define BT_ISO_BASE		20
+
 __printf(1, 2)
 void bt_info(const char *fmt, ...);
 __printf(1, 2)
diff --git a/include/net/bluetooth/iso.h b/include/net/bluetooth/iso.h
index 13b22d54aab5..3f4fe8b78e1b 100644
--- a/include/net/bluetooth/iso.h
+++ b/include/net/bluetooth/iso.h
@@ -10,12 +10,23 @@
 
 /* ISO defaults */
 #define ISO_DEFAULT_MTU		251
+#define ISO_MAX_NUM_BIS		0x1f
+
+/* ISO socket broadcast address */
+struct sockaddr_iso_bc {
+	bdaddr_t	bc_bdaddr;
+	__u8		bc_bdaddr_type;
+	__u8		bc_sid;
+	__u8		bc_num_bis;
+	__u8		bc_bis[ISO_MAX_NUM_BIS];
+};
 
 /* ISO socket address */
 struct sockaddr_iso {
 	sa_family_t	iso_family;
 	bdaddr_t	iso_bdaddr;
 	__u8		iso_bdaddr_type;
+	struct sockaddr_iso_bc iso_bc[];
 };
 
 #endif /* __ISO_H */
diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
index f64bc2cabcc7..c0adbaa4dae7 100644
--- a/net/bluetooth/iso.c
+++ b/net/bluetooth/iso.c
@@ -50,8 +50,14 @@ struct iso_pinfo {
 	__u8			src_type;
 	bdaddr_t		dst;
 	__u8			dst_type;
+	__u8			bc_sid;
+	__u8			bc_num_bis;
+	__u8			bc_bis[ISO_MAX_NUM_BIS];
+	__u16			sync_handle;
 	__u32			flags;
 	struct bt_iso_qos	qos;
+	__u8			base_len;
+	__u8			base[HCI_MAX_PER_AD_LENGTH];
 	struct iso_conn		*conn;
 };
 
@@ -130,6 +136,7 @@ static struct iso_conn *iso_conn_add(struct hci_conn *hcon)
 static void iso_chan_del(struct sock *sk, int err)
 {
 	struct iso_conn *conn;
+	struct sock *parent;
 
 	conn = iso_pi(sk)->conn;
 
@@ -147,7 +154,14 @@ static void iso_chan_del(struct sock *sk, int err)
 
 	sk->sk_state = BT_CLOSED;
 	sk->sk_err   = err;
-	sk->sk_state_change(sk);
+
+	parent = bt_sk(sk)->parent;
+	if (parent) {
+		bt_accept_unlink(sk);
+		parent->sk_data_ready(parent);
+	} else {
+		sk->sk_state_change(sk);
+	}
 
 	sock_set_flag(sk, SOCK_ZAPPED);
 }
@@ -218,7 +232,70 @@ static int iso_chan_add(struct iso_conn *conn, struct sock *sk,
 	return err;
 }
 
-static int iso_connect(struct sock *sk)
+static int iso_connect_bis(struct sock *sk)
+{
+	struct iso_conn *conn;
+	struct hci_conn *hcon;
+	struct hci_dev  *hdev;
+	int err;
+
+	BT_DBG("%pMR", &iso_pi(sk)->src);
+
+	hdev = hci_get_route(&iso_pi(sk)->dst, &iso_pi(sk)->src,
+			     iso_pi(sk)->src_type);
+	if (!hdev)
+		return -EHOSTUNREACH;
+
+	hci_dev_lock(hdev);
+
+	if (!bis_capable(hdev)) {
+		err = -EOPNOTSUPP;
+		goto done;
+	}
+
+	/* Fail if out PHYs are marked as disabled */
+	if (!iso_pi(sk)->qos.out.phy) {
+		err = -EINVAL;
+		goto done;
+	}
+
+	hcon = hci_connect_bis(hdev, &iso_pi(sk)->dst, iso_pi(sk)->dst_type,
+			       &iso_pi(sk)->qos, iso_pi(sk)->base_len,
+			       iso_pi(sk)->base);
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
+static int iso_connect_cis(struct sock *sk)
 {
 	struct iso_conn *conn;
 	struct hci_conn *hcon;
@@ -356,10 +433,39 @@ static struct sock *__iso_get_sock_listen_by_addr(bdaddr_t *ba)
 	return NULL;
 }
 
-/* Find socket listening on source bdaddr.
+static struct sock *__iso_get_sock_listen_by_sid(bdaddr_t *ba, bdaddr_t *bc,
+						 __u8 sid)
+{
+	struct sock *sk;
+
+	sk_for_each(sk, &iso_sk_list.head) {
+		if (sk->sk_state != BT_LISTEN)
+			continue;
+
+		if (bacmp(&iso_pi(sk)->src, ba))
+			continue;
+
+		if (bacmp(&iso_pi(sk)->dst, bc))
+			continue;
+
+		if (iso_pi(sk)->bc_sid == sid)
+			return sk;
+	}
+
+	return NULL;
+}
+
+typedef bool (*iso_sock_match_t)(struct sock *sk, void *data);
+
+/* Find socket listening:
+ * source bdaddr (Unicast)
+ * destination bdaddr (Broadcast only)
+ * match func - pass NULL to ignore
+ * match func data - pass -1 to ignore
  * Returns closest match.
  */
-static struct sock *iso_get_sock_listen(bdaddr_t *src)
+static struct sock *iso_get_sock_listen(bdaddr_t *src, bdaddr_t *dst,
+					iso_sock_match_t match, void *data)
 {
 	struct sock *sk = NULL, *sk1 = NULL;
 
@@ -369,6 +475,14 @@ static struct sock *iso_get_sock_listen(bdaddr_t *src)
 		if (sk->sk_state != BT_LISTEN)
 			continue;
 
+		/* Match Broadcast destination */
+		if (bacmp(dst, BDADDR_ANY) && bacmp(&iso_pi(sk)->dst, dst))
+			continue;
+
+		/* Use Match function if provided */
+		if (match && !match(sk, data))
+			continue;
+
 		/* Exact match. */
 		if (!bacmp(&iso_pi(sk)->src, src))
 			break;
@@ -584,6 +698,38 @@ static int iso_sock_create(struct net *net, struct socket *sock, int protocol,
 	return 0;
 }
 
+static int iso_sock_bind_bc(struct socket *sock, struct sockaddr *addr,
+			    int addr_len)
+{
+	struct sockaddr_iso *sa = (struct sockaddr_iso *)addr;
+	struct sock *sk = sock->sk;
+	int i;
+
+	BT_DBG("sk %p bc_sid %u bc_num_bis %u", sk, sa->iso_bc->bc_sid,
+	       sa->iso_bc->bc_num_bis);
+
+	if (addr_len > sizeof(*sa) + sizeof(*sa->iso_bc) ||
+	    sa->iso_bc->bc_num_bis < 0x01 || sa->iso_bc->bc_num_bis > 0x1f)
+		return -EINVAL;
+
+	bacpy(&iso_pi(sk)->dst, &sa->iso_bc->bc_bdaddr);
+	iso_pi(sk)->dst_type = sa->iso_bc->bc_bdaddr_type;
+	iso_pi(sk)->sync_handle = -1;
+	iso_pi(sk)->bc_sid = sa->iso_bc->bc_sid;
+	iso_pi(sk)->bc_num_bis = sa->iso_bc->bc_num_bis;
+
+	for (i = 0; i < iso_pi(sk)->bc_num_bis; i++) {
+		if (sa->iso_bc->bc_bis[i] < 0x01 ||
+		    sa->iso_bc->bc_bis[i] > 0x1f)
+			return -EINVAL;
+
+		memcpy(iso_pi(sk)->bc_bis, sa->iso_bc->bc_bis,
+		       iso_pi(sk)->bc_num_bis);
+	}
+
+	return 0;
+}
+
 static int iso_sock_bind(struct socket *sock, struct sockaddr *addr,
 			 int addr_len)
 {
@@ -618,6 +764,13 @@ static int iso_sock_bind(struct socket *sock, struct sockaddr *addr,
 	bacpy(&iso_pi(sk)->src, &sa->iso_bdaddr);
 	iso_pi(sk)->src_type = sa->iso_bdaddr_type;
 
+	/* Check for Broadcast address */
+	if (addr_len > sizeof(*sa)) {
+		err = iso_sock_bind_bc(sock, addr, addr_len);
+		if (err)
+			goto done;
+	}
+
 	sk->sk_state = BT_BOUND;
 
 done:
@@ -653,7 +806,11 @@ static int iso_sock_connect(struct socket *sock, struct sockaddr *addr,
 	bacpy(&iso_pi(sk)->dst, &sa->iso_bdaddr);
 	iso_pi(sk)->dst_type = sa->iso_bdaddr_type;
 
-	err = iso_connect(sk);
+	if (bacmp(&iso_pi(sk)->dst, BDADDR_ANY))
+		err = iso_connect_cis(sk);
+	else
+		err = iso_connect_bis(sk);
+
 	if (err)
 		goto done;
 
@@ -667,10 +824,59 @@ static int iso_sock_connect(struct socket *sock, struct sockaddr *addr,
 	return err;
 }
 
+static int iso_listen_bis(struct sock *sk)
+{
+	struct hci_dev *hdev;
+	int err = 0;
+
+	BT_DBG("%pMR -> %pMR (SID 0x%2.2x)", &iso_pi(sk)->src,
+	       &iso_pi(sk)->dst, iso_pi(sk)->bc_sid);
+
+	write_lock(&iso_sk_list.lock);
+
+	if (__iso_get_sock_listen_by_sid(&iso_pi(sk)->src, &iso_pi(sk)->dst,
+					 iso_pi(sk)->bc_sid))
+		err = -EADDRINUSE;
+
+	write_unlock(&iso_sk_list.lock);
+
+	if (err)
+		return err;
+
+	hdev = hci_get_route(&iso_pi(sk)->dst, &iso_pi(sk)->src,
+			     iso_pi(sk)->src_type);
+	if (!hdev)
+		return -EHOSTUNREACH;
+
+	hci_dev_lock(hdev);
+
+	err = hci_pa_create_sync(hdev, &iso_pi(sk)->dst, iso_pi(sk)->dst_type,
+				 iso_pi(sk)->bc_sid);
+
+	hci_dev_unlock(hdev);
+
+	return err;
+}
+
+static int iso_listen_cis(struct sock *sk)
+{
+	int err = 0;
+
+	BT_DBG("%pMR", &iso_pi(sk)->src);
+
+	write_lock(&iso_sk_list.lock);
+
+	if (__iso_get_sock_listen_by_addr(&iso_pi(sk)->src))
+		err = -EADDRINUSE;
+
+	write_unlock(&iso_sk_list.lock);
+
+	return err;
+}
+
 static int iso_sock_listen(struct socket *sock, int backlog)
 {
 	struct sock *sk = sock->sk;
-	bdaddr_t *src = &iso_pi(sk)->src;
 	int err = 0;
 
 	BT_DBG("sk %p backlog %d", sk, backlog);
@@ -687,21 +893,19 @@ static int iso_sock_listen(struct socket *sock, int backlog)
 		goto done;
 	}
 
-	write_lock(&iso_sk_list.lock);
+	if (!bacmp(&iso_pi(sk)->dst, BDADDR_ANY))
+		err = iso_listen_cis(sk);
+	else
+		err = iso_listen_bis(sk);
 
-	if (__iso_get_sock_listen_by_addr(src)) {
-		err = -EADDRINUSE;
-		goto unlock;
-	}
+	if (err)
+		goto done;
 
 	sk->sk_max_ack_backlog = backlog;
 	sk->sk_ack_backlog = 0;
 
 	sk->sk_state = BT_LISTEN;
 
-unlock:
-	write_unlock(&iso_sk_list.lock);
-
 done:
 	release_sock(sk);
 	return err;
@@ -883,7 +1087,7 @@ static int iso_sock_recvmsg(struct socket *sock, struct msghdr *msg,
 			release_sock(sk);
 			return 0;
 		case BT_CONNECT:
-			err = iso_connect(sk);
+			err = iso_connect_cis(sk);
 			release_sock(sk);
 			return err;
 		}
@@ -914,10 +1118,6 @@ static bool check_io_qos(struct bt_iso_io_qos *qos)
 
 static bool check_qos(struct bt_iso_qos *qos)
 {
-	/* CIS shall not be set */
-	if (qos->cis != BT_ISO_QOS_CIS_UNSET)
-		return false;
-
 	if (qos->sca > 0x07)
 		return false;
 
@@ -993,6 +1193,29 @@ static int iso_sock_setsockopt(struct socket *sock, int level, int optname,
 
 		break;
 
+	case BT_ISO_BASE:
+		if (sk->sk_state != BT_OPEN && sk->sk_state != BT_BOUND &&
+		    sk->sk_state != BT_CONNECT2) {
+			err = -EINVAL;
+			break;
+		}
+
+		if (optlen > sizeof(iso_pi(sk)->base)) {
+			err = -EOVERFLOW;
+			break;
+		}
+
+		len = min_t(unsigned int, sizeof(iso_pi(sk)->base), optlen);
+
+		if (copy_from_sockptr(iso_pi(sk)->base, optval, len)) {
+			err = -EFAULT;
+			break;
+		}
+
+		iso_pi(sk)->base_len = len;
+
+		break;
+
 	default:
 		err = -ENOPROTOOPT;
 		break;
@@ -1008,6 +1231,8 @@ static int iso_sock_getsockopt(struct socket *sock, int level, int optname,
 	struct sock *sk = sock->sk;
 	int len, err = 0;
 	struct bt_iso_qos qos;
+	u8 base_len;
+	u8 *base;
 
 	BT_DBG("sk %p", sk);
 
@@ -1041,6 +1266,21 @@ static int iso_sock_getsockopt(struct socket *sock, int level, int optname,
 
 		break;
 
+	case BT_ISO_BASE:
+		if (sk->sk_state == BT_CONNECTED) {
+			base_len = iso_pi(sk)->conn->hcon->le_per_adv_data_len;
+			base = iso_pi(sk)->conn->hcon->le_per_adv_data;
+		} else {
+			base_len = iso_pi(sk)->base_len;
+			base = iso_pi(sk)->base;
+		}
+
+		len = min_t(unsigned int, len, base_len);
+		if (copy_to_user(optval, base, len))
+			err = -EFAULT;
+
+		break;
+
 	default:
 		err = -ENOPROTOOPT;
 		break;
@@ -1123,10 +1363,18 @@ struct iso_list_data {
 	int count;
 };
 
+static bool iso_match_big(struct sock *sk, void *data)
+{
+	struct hci_evt_le_big_sync_estabilished *ev = data;
+
+	return ev->handle == iso_pi(sk)->qos.big;
+}
+
 static void iso_conn_ready(struct iso_conn *conn)
 {
 	struct sock *parent;
 	struct sock *sk = conn->sk;
+	struct hci_ev_le_big_sync_estabilished *ev;
 
 	BT_DBG("conn %p", conn);
 
@@ -1140,7 +1388,16 @@ static void iso_conn_ready(struct iso_conn *conn)
 			return;
 		}
 
-		parent = iso_get_sock_listen(&conn->hcon->src);
+		ev = hci_recv_event_data(conn->hcon->hdev,
+					 HCI_EVT_LE_BIG_SYNC_ESTABILISHED);
+		if (ev)
+			parent = iso_get_sock_listen(&conn->hcon->src,
+						     &conn->hcon->dst,
+						     iso_match_big, ev);
+		else
+			parent = iso_get_sock_listen(&conn->hcon->src,
+						     BDADDR_ANY, NULL, NULL);
+
 		if (!parent) {
 			iso_conn_unlock(conn);
 			return;
@@ -1160,6 +1417,17 @@ static void iso_conn_ready(struct iso_conn *conn)
 
 		bacpy(&iso_pi(sk)->src, &conn->hcon->src);
 		iso_pi(sk)->src_type = conn->hcon->src_type;
+
+		/* If hcon has no destination address (BDADDR_ANY) it means it
+		 * was created by HCI_EV_LE_BIG_SYNC_ESTABILISHED so we need to
+		 * initialize using the parent socket destination address.
+		 */
+		if (!bacmp(&conn->hcon->dst, BDADDR_ANY)) {
+			bacpy(&conn->hcon->dst, &iso_pi(parent)->dst);
+			conn->hcon->dst_type = iso_pi(parent)->dst_type;
+			conn->hcon->sync_handle = iso_pi(parent)->sync_handle;
+		}
+
 		bacpy(&iso_pi(sk)->dst, &conn->hcon->dst);
 		iso_pi(sk)->dst_type = conn->hcon->dst_type;
 
@@ -1180,30 +1448,85 @@ static void iso_conn_ready(struct iso_conn *conn)
 	}
 }
 
+static bool iso_match_sid(struct sock *sk, void *data)
+{
+	struct hci_ev_le_pa_sync_established *ev = data;
+
+	return ev->sid == iso_pi(sk)->bc_sid;
+}
+
+static bool iso_match_sync_handle(struct sock *sk, void *data)
+{
+	struct hci_evt_le_big_info_adv_report *ev = data;
+
+	return le16_to_cpu(ev->sync_handle) == iso_pi(sk)->sync_handle;
+}
+
 /* ----- ISO interface with lower layer (HCI) ----- */
+
 int iso_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr, __u8 *flags)
 {
+	struct hci_ev_le_pa_sync_established *ev1;
+	struct hci_evt_le_big_info_adv_report *ev2;
 	struct sock *sk;
 	int lm = 0;
 
-	BT_DBG("hdev %s, bdaddr %pMR", hdev->name, bdaddr);
+	bt_dev_dbg(hdev, "bdaddr %pMR", bdaddr);
 
-	/* Find listening sockets */
-	read_lock(&iso_sk_list.lock);
-	sk_for_each(sk, &iso_sk_list.head) {
-		if (sk->sk_state != BT_LISTEN)
-			continue;
+	/* Broadcast receiver requires handling of some events before it can
+	 * proceed to establishing a BIG sync:
+	 *
+	 * 1. HCI_EV_LE_PA_SYNC_ESTABLISHED: The socket may specify a specific
+	 * SID to listen to and once sync is estabilished its handle needs to
+	 * be stored in iso_pi(sk)->sync_handle so it can be matched once
+	 * receiving the BIG Info.
+	 * 2. HCI_EVT_LE_BIG_INFO_ADV_REPORT: When connect_ind is triggered by a
+	 * a BIG Info it attempts to check if there any listening socket with
+	 * the same sync_handle and if it does then attempt to create a sync.
+	 */
+	ev1 = hci_recv_event_data(hdev, HCI_EV_LE_PA_SYNC_ESTABLISHED);
+	if (ev1) {
+		sk = iso_get_sock_listen(&hdev->bdaddr, bdaddr, iso_match_sid,
+					 ev1);
+		if (sk)
+			iso_pi(sk)->sync_handle = le16_to_cpu(ev1->handle);
 
-		if (!bacmp(&iso_pi(sk)->src, &hdev->bdaddr) ||
-		    !bacmp(&iso_pi(sk)->src, BDADDR_ANY)) {
-			lm |= HCI_LM_ACCEPT;
-
-			if (test_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags))
-				*flags |= HCI_PROTO_DEFER;
-			break;
-		}
+		goto done;
 	}
-	read_unlock(&iso_sk_list.lock);
+
+	ev2 = hci_recv_event_data(hdev, HCI_EVT_LE_BIG_INFO_ADV_REPORT);
+	if (ev2) {
+		sk = iso_get_sock_listen(&hdev->bdaddr, bdaddr,
+					 iso_match_sync_handle, ev2);
+		if (sk) {
+			int err;
+
+			if (ev2->num_bis < iso_pi(sk)->bc_num_bis)
+				iso_pi(sk)->bc_num_bis = ev2->num_bis;
+
+			err = hci_le_big_create_sync(hdev,
+						     &iso_pi(sk)->qos,
+						     iso_pi(sk)->sync_handle,
+						     iso_pi(sk)->bc_num_bis,
+						     iso_pi(sk)->bc_bis);
+			if (err) {
+				bt_dev_err(hdev, "hci_le_big_create_sync: %d",
+					   err);
+				sk = NULL;
+			}
+		}
+	} else {
+		sk = iso_get_sock_listen(&hdev->bdaddr, BDADDR_ANY, NULL, NULL);
+	}
+
+done:
+	if (!sk)
+		return lm;
+
+	lm |= HCI_LM_ACCEPT;
+
+	if (test_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags))
+		*flags |= HCI_PROTO_DEFER;
 
 	return lm;
 }
-- 
2.35.3

