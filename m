Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC2F13E51DA
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Aug 2021 06:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237013AbhHJER6 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 10 Aug 2021 00:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237043AbhHJERx (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 10 Aug 2021 00:17:53 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72B5C06179B;
        Mon,  9 Aug 2021 21:17:09 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id mq2-20020a17090b3802b0290178911d298bso3438205pjb.1;
        Mon, 09 Aug 2021 21:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fV8kQqJajr7zTckOLiIM8CrHI+Va9cP1Jx+NUuT6fI0=;
        b=eP/qla48apaA1R94v+6gcKfSIyaZimnSLcowdpUvfMR45LGoG5ErDj+egtOXZ1Qs0z
         j3FMRzGPxr2WSdU3lhDKAPiRQKbZvsjdV7uvfKxWDPhTHCvnFdJp920JX3P6dYszKNWw
         sd2tHa+UdiT7oy30OCWhrv5DX2G7p1uLlzmDwhXZYwo9sj+XhYhpk5DkuoISNmhrn8Ml
         G2oNg9xwP5V5dqCZX2UlcFSLOWluIIs3EGueUNJ/oKbIJdYjursXQ5NxMnEZBNsCedQD
         JiJobZpi9fGsY3p9zNQJFwcPcDzOf/EhPzquv6GvJTnxnuTMtHcQ6nwptZeQq8TstMsl
         SzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fV8kQqJajr7zTckOLiIM8CrHI+Va9cP1Jx+NUuT6fI0=;
        b=H5neX3WcEgXYyyVJsZ2rWmLokY9dWng/4IRnjqOjyxjhdSauzh+OsrAR5QBEFV81FD
         6Gt+wJPtbS3WbBs5veq9g2Y3mFBOzBbEEV+XlbDv3JUUQ4jC635Xj/p+fwiQyUUFnf+m
         JgFqtL2VohTXfxlyDTaV02py6bhAPcUywAv1rOrpztL7jVJmh9ZxavFlwYIRDDYZiOfT
         O6H8xZMdHaUGVpWnAexSGQdxKhC1B0u/zxnFxt3TAcdiWrTTM7o/DJrQ/FQ13gx3oXZ2
         jBCZ3gVlWn9MKk5MdlpdsdswzZo5sy18XAtKrGJ2FrkG2fGKYuP/Vm7Lww7tWNKomgkn
         +XFw==
X-Gm-Message-State: AOAM531Cak/2A/q1mYocYdxA1QVd7HjENp+8I6rfeT6LE5hICmmlDqwY
        qmeyWR+K8+D6weaI78aB08M=
X-Google-Smtp-Source: ABdhPJwXY+fVVUnOHCCeh5QEtimaI4OGRAMzhFaG/6FZAzJdf42FsIHD6enk+Rf4bPtxZhY021/McA==
X-Received: by 2002:a17:902:c711:b029:12c:9b3c:9986 with SMTP id p17-20020a170902c711b029012c9b3c9986mr12553881plp.44.1628569029261;
        Mon, 09 Aug 2021 21:17:09 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id b8sm20132478pjo.51.2021.08.09.21.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 21:17:08 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        davem@davemloft.net, kuba@kernel.org, sudipm.mukherjee@gmail.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com
Subject: [PATCH v6 1/6] Bluetooth: schedule SCO timeouts with delayed_work
Date:   Tue, 10 Aug 2021 12:14:05 +0800
Message-Id: <20210810041410.142035-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210810041410.142035-1-desmondcheongzx@gmail.com>
References: <20210810041410.142035-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

struct sock.sk_timer should be used as a sock cleanup timer. However,
SCO uses it to implement sock timeouts.

This causes issues because struct sock.sk_timer's callback is run in
an IRQ context, and the timer callback function sco_sock_timeout takes
a spin lock on the socket. However, other functions such as
sco_conn_del and sco_conn_ready take the spin lock with interrupts
enabled.

This inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} lock usage could
lead to deadlocks as reported by Syzbot [1]:
       CPU0
       ----
  lock(slock-AF_BLUETOOTH-BTPROTO_SCO);
  <Interrupt>
    lock(slock-AF_BLUETOOTH-BTPROTO_SCO);

To fix this, we use delayed work to implement SCO sock timouts
instead. This allows us to avoid taking the spin lock on the socket in
an IRQ context, and corrects the misuse of struct sock.sk_timer.

As a note, cancel_delayed_work is used instead of
cancel_delayed_work_sync in sco_sock_set_timer and
sco_sock_clear_timer to avoid a deadlock. In the future, the call to
bh_lock_sock inside sco_sock_timeout should be changed to lock_sock to
synchronize with other functions using lock_sock. However, since
sco_sock_set_timer and sco_sock_clear_timer are sometimes called under
the locked socket (in sco_connect and __sco_sock_close),
cancel_delayed_work_sync might cause them to sleep until an
sco_sock_timeout that has started finishes running. But
sco_sock_timeout would also sleep until it can grab the lock_sock.

Using cancel_delayed_work is fine because sco_sock_timeout does not
change from run to run, hence there is no functional difference
between:
1. waiting for a timeout to finish running before scheduling another
timeout
2. scheduling another timeout while a timeout is running.

Link: https://syzkaller.appspot.com/bug?id=9089d89de0502e120f234ca0fc8a703f7368b31e [1]
Reported-by: syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com
Tested-by: syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 net/bluetooth/sco.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index ffa2a77a3e4c..62e638f971a9 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -48,6 +48,8 @@ struct sco_conn {
 	spinlock_t	lock;
 	struct sock	*sk;
 
+	struct delayed_work	timeout_work;
+
 	unsigned int    mtu;
 };
 
@@ -74,9 +76,20 @@ struct sco_pinfo {
 #define SCO_CONN_TIMEOUT	(HZ * 40)
 #define SCO_DISCONN_TIMEOUT	(HZ * 2)
 
-static void sco_sock_timeout(struct timer_list *t)
+static void sco_sock_timeout(struct work_struct *work)
 {
-	struct sock *sk = from_timer(sk, t, sk_timer);
+	struct sco_conn *conn = container_of(work, struct sco_conn,
+					     timeout_work.work);
+	struct sock *sk;
+
+	sco_conn_lock(conn);
+	sk = conn->sk;
+	if (sk)
+		sock_hold(sk);
+	sco_conn_unlock(conn);
+
+	if (!sk)
+		return;
 
 	BT_DBG("sock %p state %d", sk, sk->sk_state);
 
@@ -91,14 +104,21 @@ static void sco_sock_timeout(struct timer_list *t)
 
 static void sco_sock_set_timer(struct sock *sk, long timeout)
 {
+	if (!sco_pi(sk)->conn)
+		return;
+
 	BT_DBG("sock %p state %d timeout %ld", sk, sk->sk_state, timeout);
-	sk_reset_timer(sk, &sk->sk_timer, jiffies + timeout);
+	cancel_delayed_work(&sco_pi(sk)->conn->timeout_work);
+	schedule_delayed_work(&sco_pi(sk)->conn->timeout_work, timeout);
 }
 
 static void sco_sock_clear_timer(struct sock *sk)
 {
+	if (!sco_pi(sk)->conn)
+		return;
+
 	BT_DBG("sock %p state %d", sk, sk->sk_state);
-	sk_stop_timer(sk, &sk->sk_timer);
+	cancel_delayed_work(&sco_pi(sk)->conn->timeout_work);
 }
 
 /* ---- SCO connections ---- */
@@ -179,6 +199,9 @@ static void sco_conn_del(struct hci_conn *hcon, int err)
 		bh_unlock_sock(sk);
 		sco_sock_kill(sk);
 		sock_put(sk);
+
+		/* Ensure no more work items will run before freeing conn. */
+		cancel_delayed_work_sync(&conn->timeout_work);
 	}
 
 	hcon->sco_data = NULL;
@@ -193,6 +216,8 @@ static void __sco_chan_add(struct sco_conn *conn, struct sock *sk,
 	sco_pi(sk)->conn = conn;
 	conn->sk = sk;
 
+	INIT_DELAYED_WORK(&conn->timeout_work, sco_sock_timeout);
+
 	if (parent)
 		bt_accept_enqueue(parent, sk, true);
 }
@@ -500,8 +525,6 @@ static struct sock *sco_sock_alloc(struct net *net, struct socket *sock,
 
 	sco_pi(sk)->setting = BT_VOICE_CVSD_16BIT;
 
-	timer_setup(&sk->sk_timer, sco_sock_timeout, 0);
-
 	bt_sock_link(&sco_sk_list, sk);
 	return sk;
 }
-- 
2.25.1

