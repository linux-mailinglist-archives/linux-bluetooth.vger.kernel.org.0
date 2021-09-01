Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2753FD04C
	for <lists+linux-bluetooth@lfdr.de>; Wed,  1 Sep 2021 02:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241446AbhIAA1V (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 31 Aug 2021 20:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241398AbhIAA1U (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 31 Aug 2021 20:27:20 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47CC5C061575
        for <linux-bluetooth@vger.kernel.org>; Tue, 31 Aug 2021 17:26:24 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id g184so975468pgc.6
        for <linux-bluetooth@vger.kernel.org>; Tue, 31 Aug 2021 17:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oyY+Qj1v1ce0ewZFAidlMwWq7Ceg2ohLUWvByrJdMb8=;
        b=VxniagMmuRoe0vPC7fMMyZrC7D8p0oR66J9dHFuS5Gddk0/CTSjKxdClDpcDVcd/pf
         2/rzUJGy0v/D4OEFKY6SqDGTcvk5OF9HPLVrN2JBisAWvvZJLdjeYZUpb+dTbeZpo0X0
         7/kClKWcK6jttbU6O/jXTPhjx1j5toe8IHcFcrYJXTjtPzqydgRkHi8I3UGyMfc8y8a7
         Ik3CcP8pyJupBTy7k0leemoSj95y1TuUTzhZPLtKwlzwA6UgnNPGWVOtjhajjI9jRtz1
         dljauwkVNtn55SfZnXpg2EdHm4mUWvpFevHyi2zskJ0AfM5Y0FX+083ckLBk+YBkCTa8
         rXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oyY+Qj1v1ce0ewZFAidlMwWq7Ceg2ohLUWvByrJdMb8=;
        b=T/d3CQQb3HtreTy8yh1dR+SjltxdbXst/BUd9aICVGH8v+bl0XmP8BmM0pMP7dvkiR
         SUfEdsRRR/Kj2kT3IqHCfjeetYz/ZoXw221u8aW0c137eQUE7clYtnVGX2BK1oiJ9ofZ
         Z30YykAFuTwV61jhNs1uJlytTEbXZCdY7E2sDrP4pJ70/50oLviFAeVMYFGYr+x5XSlv
         VAJk0akEt+fMCUWN/YKeSjvYJq+Vue61kaHsmBSX7qBxm8Q+vppwOK06zRCSt+W7Q9Xs
         ic2i0twDObHjnVtIPTXdaEk9LMGKO8BVfoMeWkRk4qg2FxDmg7PPr7+ePO1FKnxYb1pA
         S4dg==
X-Gm-Message-State: AOAM532u7iWWgYAuaQxCmmaBOMv2SrinKsDaIf7gGG52py9weQnoaQrU
        vMYaoWc3B8oJHs+Mztkl29c9wSbJh7o=
X-Google-Smtp-Source: ABdhPJyx4MjbNAAH/vmu2a76JUWM3l9+XT6zSusOhZKUjyuYWK23YDN9BqpatQL9pm94ZRkk63o+dQ==
X-Received: by 2002:a62:1ec7:0:b0:3eb:2693:90e2 with SMTP id e190-20020a621ec7000000b003eb269390e2mr31234147pfe.52.1630455983512;
        Tue, 31 Aug 2021 17:26:23 -0700 (PDT)
Received: from lvondent-mobl4.intel.com (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id gm5sm4054655pjb.32.2021.08.31.17.26.22
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 17:26:23 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 3/4] Bluetooth: SCO: Replace use of memcpy_from_msg with bt_skb_sendmsg
Date:   Tue, 31 Aug 2021 17:26:20 -0700
Message-Id: <20210901002621.414016-3-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901002621.414016-1-luiz.dentz@gmail.com>
References: <20210901002621.414016-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This makes use of bt_skb_sendmsg instead of allocating a different
buffer to be used with memcpy_from_msg which cause one extra copy.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 net/bluetooth/sco.c | 34 +++++++++++-----------------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index b62c91c627e2..60fb4dc73bc2 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -280,27 +280,19 @@ static int sco_connect(struct hci_dev *hdev, struct sock *sk)
 	return err;
 }
 
-static int sco_send_frame(struct sock *sk, void *buf, int len,
-			  unsigned int msg_flags)
+static int sco_send_frame(struct sock *sk, struct sk_buff *skb)
 {
 	struct sco_conn *conn = sco_pi(sk)->conn;
-	struct sk_buff *skb;
-	int err;
 
 	/* Check outgoing MTU */
-	if (len > conn->mtu)
+	if (skb->len > conn->mtu)
 		return -EINVAL;
 
-	BT_DBG("sk %p len %d", sk, len);
+	BT_DBG("sk %p len %d", sk, skb->len);
 
-	skb = bt_skb_send_alloc(sk, len, msg_flags & MSG_DONTWAIT, &err);
-	if (!skb)
-		return err;
-
-	memcpy(skb_put(skb, len), buf, len);
 	hci_send_sco(conn->hcon, skb);
 
-	return len;
+	return skb->len;
 }
 
 static void sco_recv_frame(struct sco_conn *conn, struct sk_buff *skb)
@@ -722,7 +714,7 @@ static int sco_sock_sendmsg(struct socket *sock, struct msghdr *msg,
 			    size_t len)
 {
 	struct sock *sk = sock->sk;
-	void *buf;
+	struct sk_buff *skb;
 	int err;
 
 	BT_DBG("sock %p, sk %p", sock, sk);
@@ -734,24 +726,20 @@ static int sco_sock_sendmsg(struct socket *sock, struct msghdr *msg,
 	if (msg->msg_flags & MSG_OOB)
 		return -EOPNOTSUPP;
 
-	buf = kmalloc(len, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	if (memcpy_from_msg(buf, msg, len)) {
-		kfree(buf);
-		return -EFAULT;
-	}
+	skb = bt_skb_sendmsg(sk, msg, len, 0, 0);
+	if (IS_ERR_OR_NULL(skb))
+		return PTR_ERR(skb);
 
 	lock_sock(sk);
 
 	if (sk->sk_state == BT_CONNECTED)
-		err = sco_send_frame(sk, buf, len, msg->msg_flags);
+		err = sco_send_frame(sk, skb);
 	else
 		err = -ENOTCONN;
 
 	release_sock(sk);
-	kfree(buf);
+	if (err)
+		kfree_skb(skb);
 	return err;
 }
 
-- 
2.31.1

