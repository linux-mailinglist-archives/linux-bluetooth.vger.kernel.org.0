Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E643E04BA
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Aug 2021 17:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239420AbhHDPsz (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 4 Aug 2021 11:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239409AbhHDPsx (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 4 Aug 2021 11:48:53 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC27CC0613D5;
        Wed,  4 Aug 2021 08:48:39 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id a8so3577655pjk.4;
        Wed, 04 Aug 2021 08:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vp3C+KtcRQlpP3ktxmRwtjoom3vC9256tobMdzr+KLo=;
        b=Hv6DWT6UR0vSemrRLFQOA2Dj0WxkNrQKTcBbLwQ8d8W6kU2l8MosJ30oWS1qqwDRqI
         saE9jm2Ku6U+WdZZhhnuE7KykdQJU/15VNLl40uR1dNQDrL8Ei5HFDMWu2jFhEqmZyvW
         IXpjATDxHT28TyI6fu5f9IDyU5cxxZ9LsxKJm0Vhlfjo/BUN55Oj4V86JZ26zaYjN13o
         dUYMisFueGoLkWwH1mlM+zqmMAecobWcts9Bh2/pi63tN/uUfuOwxqkpYgy4Am4FZ+UN
         4aEHBUtOLsq9+b2TTA/fPbChyWV+KVlsigqLzitRn6FYqocKcbWJXozgEjDWY1pI/8sZ
         CUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vp3C+KtcRQlpP3ktxmRwtjoom3vC9256tobMdzr+KLo=;
        b=P0czZrXRcYRwe9FY902p2KmA0XPi1rHSOrHeW4wV2Dz7KkG5FT/ixaq0c8wz98Xt+k
         qjPZtC8AbqD1SuTUkD9I3n55uv/M/4lvDNecnUkuKNNShd4FVt3gYk8bCTkwVMjgSjC8
         wh6MVGLSUxRbtpn9/uhrBTkWFv27Z0kTuS+YUCWmQuzEAfWK/jqbL4LhWfgPK529dvTq
         2Wz8XplPDDcL9h2I2tspCVESv28cfcZr5iGXXHsxCbiLJ0oXanvkdjxfYSstkYeDCINb
         ggJgWsPHypkNwuZ5EBTBC/76vFLlwxfrpA5IEJR4kZnhP58s/Kw6zjSAl2mAo3P24FS4
         t9vg==
X-Gm-Message-State: AOAM531CAI82h6XOIcFAUwfr5AgzTBd+T2yzEfyMxMZ3bmGcMkRVNosJ
        OvsHYjJaj+FUsb9UL5nuzPg=
X-Google-Smtp-Source: ABdhPJyeupx/uP0zAlAZwAaicY4yVFhc8T1pwXRpIbK9ymWB8Sd6UXvnmpDAUVVWpUb/C7LtUlpcWA==
X-Received: by 2002:a63:1656:: with SMTP id 22mr1266007pgw.163.1628092119370;
        Wed, 04 Aug 2021 08:48:39 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id b15sm4007274pgj.60.2021.08.04.08.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 08:48:38 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        davem@davemloft.net, kuba@kernel.org, sudipm.mukherjee@gmail.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [RESEND PATCH v5 2/6] Bluetooth: avoid circular locks in sco_sock_connect
Date:   Wed,  4 Aug 2021 23:47:08 +0800
Message-Id: <20210804154712.929986-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804154712.929986-1-desmondcheongzx@gmail.com>
References: <20210804154712.929986-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

In a future patch, calls to bh_lock_sock in sco.c should be replaced
by lock_sock now that none of the functions are run in IRQ context.

However, doing so results in a circular locking dependency:

======================================================
WARNING: possible circular locking dependency detected
5.14.0-rc4-syzkaller #0 Not tainted
------------------------------------------------------
syz-executor.2/14867 is trying to acquire lock:
ffff88803e3c1120 (sk_lock-AF_BLUETOOTH-BTPROTO_SCO){+.+.}-{0:0}, at:
lock_sock include/net/sock.h:1613 [inline]
ffff88803e3c1120 (sk_lock-AF_BLUETOOTH-BTPROTO_SCO){+.+.}-{0:0}, at:
sco_conn_del+0x12a/0x2a0 net/bluetooth/sco.c:191

but task is already holding lock:
ffffffff8d2dc7c8 (hci_cb_list_lock){+.+.}-{3:3}, at:
hci_disconn_cfm include/net/bluetooth/hci_core.h:1497 [inline]
ffffffff8d2dc7c8 (hci_cb_list_lock){+.+.}-{3:3}, at:
hci_conn_hash_flush+0xda/0x260 net/bluetooth/hci_conn.c:1608

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #2 (hci_cb_list_lock){+.+.}-{3:3}:
       __mutex_lock_common kernel/locking/mutex.c:959 [inline]
       __mutex_lock+0x12a/0x10a0 kernel/locking/mutex.c:1104
       hci_connect_cfm include/net/bluetooth/hci_core.h:1482 [inline]
       hci_remote_features_evt net/bluetooth/hci_event.c:3263 [inline]
       hci_event_packet+0x2f4d/0x7c50 net/bluetooth/hci_event.c:6240
       hci_rx_work+0x4f8/0xd30 net/bluetooth/hci_core.c:5122
       process_one_work+0x98d/0x1630 kernel/workqueue.c:2276
       worker_thread+0x658/0x11f0 kernel/workqueue.c:2422
       kthread+0x3e5/0x4d0 kernel/kthread.c:319
       ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

-> #1 (&hdev->lock){+.+.}-{3:3}:
       __mutex_lock_common kernel/locking/mutex.c:959 [inline]
       __mutex_lock+0x12a/0x10a0 kernel/locking/mutex.c:1104
       sco_connect net/bluetooth/sco.c:245 [inline]
       sco_sock_connect+0x227/0xa10 net/bluetooth/sco.c:601
       __sys_connect_file+0x155/0x1a0 net/socket.c:1879
       __sys_connect+0x161/0x190 net/socket.c:1896
       __do_sys_connect net/socket.c:1906 [inline]
       __se_sys_connect net/socket.c:1903 [inline]
       __x64_sys_connect+0x6f/0xb0 net/socket.c:1903
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x44/0xae

-> #0 (sk_lock-AF_BLUETOOTH-BTPROTO_SCO){+.+.}-{0:0}:
       check_prev_add kernel/locking/lockdep.c:3051 [inline]
       check_prevs_add kernel/locking/lockdep.c:3174 [inline]
       validate_chain kernel/locking/lockdep.c:3789 [inline]
       __lock_acquire+0x2a07/0x54a0 kernel/locking/lockdep.c:5015
       lock_acquire kernel/locking/lockdep.c:5625 [inline]
       lock_acquire+0x1ab/0x510 kernel/locking/lockdep.c:5590
       lock_sock_nested+0xca/0x120 net/core/sock.c:3170
       lock_sock include/net/sock.h:1613 [inline]
       sco_conn_del+0x12a/0x2a0 net/bluetooth/sco.c:191
       sco_disconn_cfm+0x71/0xb0 net/bluetooth/sco.c:1202
       hci_disconn_cfm include/net/bluetooth/hci_core.h:1500 [inline]
       hci_conn_hash_flush+0x127/0x260 net/bluetooth/hci_conn.c:1608
       hci_dev_do_close+0x528/0x1130 net/bluetooth/hci_core.c:1778
       hci_unregister_dev+0x1c0/0x5a0 net/bluetooth/hci_core.c:4015
       vhci_release+0x70/0xe0 drivers/bluetooth/hci_vhci.c:340
       __fput+0x288/0x920 fs/file_table.c:280
       task_work_run+0xdd/0x1a0 kernel/task_work.c:164
       exit_task_work include/linux/task_work.h:32 [inline]
       do_exit+0xbd4/0x2a60 kernel/exit.c:825
       do_group_exit+0x125/0x310 kernel/exit.c:922
       get_signal+0x47f/0x2160 kernel/signal.c:2808
       arch_do_signal_or_restart+0x2a9/0x1c40 arch/x86/kernel/signal.c:865
       handle_signal_work kernel/entry/common.c:148 [inline]
       exit_to_user_mode_loop kernel/entry/common.c:172 [inline]
       exit_to_user_mode_prepare+0x17d/0x290 kernel/entry/common.c:209
       __syscall_exit_to_user_mode_work kernel/entry/common.c:291 [inline]
       syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:302
       ret_from_fork+0x15/0x30 arch/x86/entry/entry_64.S:288

other info that might help us debug this:

Chain exists of:
  sk_lock-AF_BLUETOOTH-BTPROTO_SCO --> &hdev->lock --> hci_cb_list_lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(hci_cb_list_lock);
                               lock(&hdev->lock);
                               lock(hci_cb_list_lock);
  lock(sk_lock-AF_BLUETOOTH-BTPROTO_SCO);

 *** DEADLOCK ***

The issue is that the lock hierarchy should go from &hdev->lock -->
hci_cb_list_lock --> sk_lock-AF_BLUETOOTH-BTPROTO_SCO. For example,
one such call trace is:

  hci_dev_do_close():
    hci_dev_lock();
    hci_conn_hash_flush():
      hci_disconn_cfm():
        mutex_lock(&hci_cb_list_lock);
	sco_disconn_cfm():
	  sco_conn_del():
	    lock_sock(sk);

However, in sco_sock_connect, we call lock_sock before calling
hci_dev_lock inside sco_connect, thus inverting the lock hierarchy.

We fix this by pulling the call to hci_dev_lock out from sco_connect.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 net/bluetooth/sco.c | 39 ++++++++++++++++-----------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index 89cb987ca9eb..558f8874b65e 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -243,44 +243,32 @@ static int sco_chan_add(struct sco_conn *conn, struct sock *sk,
 	return err;
 }
 
-static int sco_connect(struct sock *sk)
+static int sco_connect(struct hci_dev *hdev, struct sock *sk)
 {
 	struct sco_conn *conn;
 	struct hci_conn *hcon;
-	struct hci_dev  *hdev;
 	int err, type;
 
 	BT_DBG("%pMR -> %pMR", &sco_pi(sk)->src, &sco_pi(sk)->dst);
 
-	hdev = hci_get_route(&sco_pi(sk)->dst, &sco_pi(sk)->src, BDADDR_BREDR);
-	if (!hdev)
-		return -EHOSTUNREACH;
-
-	hci_dev_lock(hdev);
-
 	if (lmp_esco_capable(hdev) && !disable_esco)
 		type = ESCO_LINK;
 	else
 		type = SCO_LINK;
 
 	if (sco_pi(sk)->setting == BT_VOICE_TRANSPARENT &&
-	    (!lmp_transp_capable(hdev) || !lmp_esco_capable(hdev))) {
-		err = -EOPNOTSUPP;
-		goto done;
-	}
+	    (!lmp_transp_capable(hdev) || !lmp_esco_capable(hdev)))
+		return -EOPNOTSUPP;
 
 	hcon = hci_connect_sco(hdev, type, &sco_pi(sk)->dst,
 			       sco_pi(sk)->setting);
-	if (IS_ERR(hcon)) {
-		err = PTR_ERR(hcon);
-		goto done;
-	}
+	if (IS_ERR(hcon))
+		return PTR_ERR(hcon);
 
 	conn = sco_conn_add(hcon);
 	if (!conn) {
 		hci_conn_drop(hcon);
-		err = -ENOMEM;
-		goto done;
+		return -ENOMEM;
 	}
 
 	/* Update source addr of the socket */
@@ -288,7 +276,7 @@ static int sco_connect(struct sock *sk)
 
 	err = sco_chan_add(conn, sk, NULL);
 	if (err)
-		goto done;
+		return err;
 
 	if (hcon->state == BT_CONNECTED) {
 		sco_sock_clear_timer(sk);
@@ -298,9 +286,6 @@ static int sco_connect(struct sock *sk)
 		sco_sock_set_timer(sk, sk->sk_sndtimeo);
 	}
 
-done:
-	hci_dev_unlock(hdev);
-	hci_dev_put(hdev);
 	return err;
 }
 
@@ -595,6 +580,7 @@ static int sco_sock_connect(struct socket *sock, struct sockaddr *addr, int alen
 {
 	struct sockaddr_sco *sa = (struct sockaddr_sco *) addr;
 	struct sock *sk = sock->sk;
+	struct hci_dev  *hdev;
 	int err;
 
 	BT_DBG("sk %p", sk);
@@ -609,12 +595,19 @@ static int sco_sock_connect(struct socket *sock, struct sockaddr *addr, int alen
 	if (sk->sk_type != SOCK_SEQPACKET)
 		return -EINVAL;
 
+	hdev = hci_get_route(&sa->sco_bdaddr, &sco_pi(sk)->src, BDADDR_BREDR);
+	if (!hdev)
+		return -EHOSTUNREACH;
+	hci_dev_lock(hdev);
+
 	lock_sock(sk);
 
 	/* Set destination address and psm */
 	bacpy(&sco_pi(sk)->dst, &sa->sco_bdaddr);
 
-	err = sco_connect(sk);
+	err = sco_connect(hdev, sk);
+	hci_dev_unlock(hdev);
+	hci_dev_put(hdev);
 	if (err)
 		goto done;
 
-- 
2.25.1

