Return-Path: <linux-bluetooth+bounces-9136-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F499E4145
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Dec 2024 18:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8E6BB64F21
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Dec 2024 17:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7703C3DABFC;
	Wed,  4 Dec 2024 16:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMzrSmJk"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE83320E03F
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Dec 2024 16:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331539; cv=none; b=odMTRcZGpjmnw0NcsBSn8O1mcGdMWYMwfy/dJtYH4jNSf9AaHbYRw31qNGanJjN0YEB+tbvHkvcGquxfkfi3WSXD8GvjErrqK523d+clGUt+mBPYKsxzJD/NgGXKowKCJ108yx5BBUjgiE4fCzuT3nzpbPwEALyBrDUitbrx+5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331539; c=relaxed/simple;
	bh=iCD5hXRSIWEIQ5SExOCw/Wh9rMNiuriPOkpx83qrSag=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K6Qup8Ufu8tbKxj97gUm7obd3WLXgM6QOor/NaAgZJHCdL8MCgSM1nEimKGbrO6M5NyDGe5mbM/XxLdrKlB2tVlx3Mxq7N/lqszAwemqQcNUGQVSU8NdcXebaMiIBXprESb2qLWyPKgG2BhN+HKw3soTrCJ8w3mVQWoSzcNMFNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMzrSmJk; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afa53874beso428853137.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 04 Dec 2024 08:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733331536; x=1733936336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpNOmsOh9au1UqhDYBpxGF/X8rMrrs6ollw7OD4If6s=;
        b=GMzrSmJk75UT70ad2Lz/cg5amV2r54R5K7iCK+iVxHlEb+0Wdqd2DupJNlk2Qsa67O
         VdquDcnAPJJn86Gs3ZKoOEiw4+wIkTtkclxQlgm8Kdqq/zbN/s1UQ6p5AWvxI4YAbFVb
         n9wwfRme2qLuXAVC0opp1tyakaoNgj0uSC7+avfVwZv1ysg4wKqC0f62GBnVrj41L0+T
         Hvyq28aeJS+pFSqTgAjygR+kSj3mKAVRp4VRZ5ueJFhUZflV+OEJpbZQS1Nw0SMEg8DD
         j7/RDAhFmgWQSzFGurEsMiLQiqpB/KW3I3DNgyuYmQK3da1Pz1mz5Ib2VKZ+1McaDrn8
         XMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733331536; x=1733936336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpNOmsOh9au1UqhDYBpxGF/X8rMrrs6ollw7OD4If6s=;
        b=Dawjqqux+PmbtxHsoK+x7b66Ni2kB89LBeAG1TjgwidbscPMctrjtEvcu786qJK/P0
         PUWqqeOHea02nOfIdYiRs90vvakZOGIftliNJRdcaAk8IniOn6o0b8uQE0A/xE20jAIT
         CrAcf2frq5r7mzGfpLKDfvKzyr6ysbGOGImKLL7ECfqWd94YeJl8ujK+XQeb7blXD0G6
         4ra+2iJV08H/u/jD8ZCAKWXSIFbsLBV4sDAAFIRixmGqdfM2gV2zPImP35HGzdXQa7PS
         LS9aFOyzgXHuLnqD94+kWRgK5du6ypd+vII+cnrhHz3tsvvXsfRJRdqPLm0RizEVll/5
         dz3w==
X-Gm-Message-State: AOJu0Yydl5pRiF7aMy94lkqDF9N/VOdvKWB9g6pAzRycPGwZ8/jfqezK
	mLHXkpSTWBBCqNv46KnAj8NikCEBb7Kaid2uA65mGvTVCDnY/ZQlM05Krg==
X-Gm-Gg: ASbGnct3RY+N//QoEL1D4Ac5Ptg8LtjaPRZ1yl3VDq51UEpQXziyPRv4D4IkKmKLYXt
	IuwPUZX6Aol26bAC6f/3vAI/6Xj75GGwq7izNcFMA38uKQbGKJaTFDWMTbK539u4hF/hgJSSUVz
	tQtOSKsHLuskGh45LiqiZp6oBRISi5hwOyWR/S+OgQghMAhn+jYungR3s71rHkr/zIHWxuUPpoz
	DWk5JeNppI/a6Pt2J+JLEp2NDaoXy00/OQAEqp7tyn5Tpb61ySjDF7p8hx3Y2TRtoMd5ge2cqQw
	bXr6OYrw35O3ac/Jya/Tpw==
X-Google-Smtp-Source: AGHT+IE+zqq5dfIUi7wK/yUcvH/JNKTkipoeD2b7wGLhu9rcLGasm35ej69nnGK9HbyTXM3YVEFngA==
X-Received: by 2002:a05:6102:548a:b0:4af:5cd4:b08a with SMTP id ada2fe7eead31-4af973f739cmr10248316137.26.1733331535987;
        Wed, 04 Dec 2024 08:58:55 -0800 (PST)
Received: from lvondent-mobl5.. (syn-107-146-107-067.res.spectrum.com. [107.146.107.67])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b82a0e475sm2449898241.7.2024.12.04.08.58.53
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 08:58:54 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH v2] Bluetooth: hci_core: Fix sleeping function called from invalid context
Date: Wed,  4 Dec 2024 11:58:49 -0500
Message-ID: <20241204165849.392564-2-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241204165849.392564-1-luiz.dentz@gmail.com>
References: <20241204165849.392564-1-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This reworks hci_cb_list to not use mutex hci_cb_list_lock to avoid bugs
like the bellow:

BUG: sleeping function called from invalid context at kernel/locking/mutex.c:585
in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 5070, name: kworker/u9:2
preempt_count: 0, expected: 0
RCU nest depth: 1, expected: 0
4 locks held by kworker/u9:2/5070:
 #0: ffff888015be3948 ((wq_completion)hci0#2){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3229 [inline]
 #0: ffff888015be3948 ((wq_completion)hci0#2){+.+.}-{0:0}, at: process_scheduled_works+0x8e0/0x1770 kernel/workqueue.c:3335
 #1: ffffc90003b6fd00 ((work_completion)(&hdev->rx_work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3230 [inline]
 #1: ffffc90003b6fd00 ((work_completion)(&hdev->rx_work)){+.+.}-{0:0}, at: process_scheduled_works+0x91b/0x1770 kernel/workqueue.c:3335
 #2: ffff8880665d0078 (&hdev->lock){+.+.}-{3:3}, at: hci_le_create_big_complete_evt+0xcf/0xae0 net/bluetooth/hci_event.c:6914
 #3: ffffffff8e132020 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire include/linux/rcupdate.h:298 [inline]
 #3: ffffffff8e132020 (rcu_read_lock){....}-{1:2}, at: rcu_read_lock include/linux/rcupdate.h:750 [inline]
 #3: ffffffff8e132020 (rcu_read_lock){....}-{1:2}, at: hci_le_create_big_complete_evt+0xdb/0xae0 net/bluetooth/hci_event.c:6915
CPU: 0 PID: 5070 Comm: kworker/u9:2 Not tainted 6.8.0-syzkaller-08073-g480e035fc4c7 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
Workqueue: hci0 hci_rx_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
 __might_resched+0x5d4/0x780 kernel/sched/core.c:10187
 __mutex_lock_common kernel/locking/mutex.c:585 [inline]
 __mutex_lock+0xc1/0xd70 kernel/locking/mutex.c:752
 hci_connect_cfm include/net/bluetooth/hci_core.h:2004 [inline]
 hci_le_create_big_complete_evt+0x3d9/0xae0 net/bluetooth/hci_event.c:6939
 hci_event_func net/bluetooth/hci_event.c:7514 [inline]
 hci_event_packet+0xa53/0x1540 net/bluetooth/hci_event.c:7569
 hci_rx_work+0x3e8/0xca0 net/bluetooth/hci_core.c:4171
 process_one_work kernel/workqueue.c:3254 [inline]
 process_scheduled_works+0xa00/0x1770 kernel/workqueue.c:3335
 worker_thread+0x86d/0xd70 kernel/workqueue.c:3416
 kthread+0x2f0/0x390 kernel/kthread.c:388
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:243
 </TASK>

Reported-by: syzbot+2fb0835e0c9cefc34614@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2fb0835e0c9cefc34614
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/hci_core.h | 108 ++++++++++++++++++++-----------
 net/bluetooth/hci_core.c         |   9 +--
 net/bluetooth/iso.c              |   6 ++
 net/bluetooth/l2cap_core.c       |  12 ++--
 net/bluetooth/rfcomm/core.c      |   6 ++
 net/bluetooth/sco.c              |  12 ++--
 6 files changed, 97 insertions(+), 56 deletions(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index ea798f07c5a2..ca22ead85dbe 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -804,7 +804,6 @@ struct hci_conn_params {
 extern struct list_head hci_dev_list;
 extern struct list_head hci_cb_list;
 extern rwlock_t hci_dev_list_lock;
-extern struct mutex hci_cb_list_lock;
 
 #define hci_dev_set_flag(hdev, nr)             set_bit((nr), (hdev)->dev_flags)
 #define hci_dev_clear_flag(hdev, nr)           clear_bit((nr), (hdev)->dev_flags)
@@ -2017,24 +2016,47 @@ struct hci_cb {
 
 	char *name;
 
+	bool (*match)		(struct hci_conn *conn);
 	void (*connect_cfm)	(struct hci_conn *conn, __u8 status);
 	void (*disconn_cfm)	(struct hci_conn *conn, __u8 status);
 	void (*security_cfm)	(struct hci_conn *conn, __u8 status,
-								__u8 encrypt);
+				 __u8 encrypt);
 	void (*key_change_cfm)	(struct hci_conn *conn, __u8 status);
 	void (*role_switch_cfm)	(struct hci_conn *conn, __u8 status, __u8 role);
 };
 
+static inline void hci_cb_lookup(struct hci_conn *conn, struct list_head *list)
+{
+	struct hci_cb *cb, *cpy;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(cb, &hci_cb_list, list) {
+		if (cb->match && cb->match(conn)) {
+			cpy = kmalloc(sizeof(*cpy), GFP_ATOMIC);
+			if (!cpy)
+				break;
+
+			*cpy = *cb;
+			INIT_LIST_HEAD(&cpy->list);
+			list_add_rcu(&cpy->list, list);
+		}
+	}
+	rcu_read_unlock();
+}
+
 static inline void hci_connect_cfm(struct hci_conn *conn, __u8 status)
 {
-	struct hci_cb *cb;
+	struct list_head list;
+	struct hci_cb *cb, *tmp;
 
-	mutex_lock(&hci_cb_list_lock);
-	list_for_each_entry(cb, &hci_cb_list, list) {
+	INIT_LIST_HEAD(&list);
+	hci_cb_lookup(conn, &list);
+
+	list_for_each_entry_safe(cb, tmp, &list, list) {
 		if (cb->connect_cfm)
 			cb->connect_cfm(conn, status);
+		kfree(cb);
 	}
-	mutex_unlock(&hci_cb_list_lock);
 
 	if (conn->connect_cfm_cb)
 		conn->connect_cfm_cb(conn, status);
@@ -2042,22 +2064,43 @@ static inline void hci_connect_cfm(struct hci_conn *conn, __u8 status)
 
 static inline void hci_disconn_cfm(struct hci_conn *conn, __u8 reason)
 {
-	struct hci_cb *cb;
+	struct list_head list;
+	struct hci_cb *cb, *tmp;
 
-	mutex_lock(&hci_cb_list_lock);
-	list_for_each_entry(cb, &hci_cb_list, list) {
+	INIT_LIST_HEAD(&list);
+	hci_cb_lookup(conn, &list);
+
+	list_for_each_entry_safe(cb, tmp, &list, list) {
 		if (cb->disconn_cfm)
 			cb->disconn_cfm(conn, reason);
+		kfree(cb);
 	}
-	mutex_unlock(&hci_cb_list_lock);
 
 	if (conn->disconn_cfm_cb)
 		conn->disconn_cfm_cb(conn, reason);
 }
 
+static inline void hci_security_cfm(struct hci_conn *conn, __u8 status,
+				    __u8 encrypt)
+{
+	struct list_head list;
+	struct hci_cb *cb, *tmp;
+
+	INIT_LIST_HEAD(&list);
+	hci_cb_lookup(conn, &list);
+
+	list_for_each_entry_safe(cb, tmp, &list, list) {
+		if (cb->security_cfm)
+			cb->security_cfm(conn, status, encrypt);
+		kfree(cb);
+	}
+
+	if (conn->security_cfm_cb)
+		conn->security_cfm_cb(conn, status);
+}
+
 static inline void hci_auth_cfm(struct hci_conn *conn, __u8 status)
 {
-	struct hci_cb *cb;
 	__u8 encrypt;
 
 	if (test_bit(HCI_CONN_ENCRYPT_PEND, &conn->flags))
@@ -2065,20 +2108,11 @@ static inline void hci_auth_cfm(struct hci_conn *conn, __u8 status)
 
 	encrypt = test_bit(HCI_CONN_ENCRYPT, &conn->flags) ? 0x01 : 0x00;
 
-	mutex_lock(&hci_cb_list_lock);
-	list_for_each_entry(cb, &hci_cb_list, list) {
-		if (cb->security_cfm)
-			cb->security_cfm(conn, status, encrypt);
-	}
-	mutex_unlock(&hci_cb_list_lock);
-
-	if (conn->security_cfm_cb)
-		conn->security_cfm_cb(conn, status);
+	hci_security_cfm(conn, status, encrypt);
 }
 
 static inline void hci_encrypt_cfm(struct hci_conn *conn, __u8 status)
 {
-	struct hci_cb *cb;
 	__u8 encrypt;
 
 	if (conn->state == BT_CONFIG) {
@@ -2105,40 +2139,38 @@ static inline void hci_encrypt_cfm(struct hci_conn *conn, __u8 status)
 			conn->sec_level = conn->pending_sec_level;
 	}
 
-	mutex_lock(&hci_cb_list_lock);
-	list_for_each_entry(cb, &hci_cb_list, list) {
-		if (cb->security_cfm)
-			cb->security_cfm(conn, status, encrypt);
-	}
-	mutex_unlock(&hci_cb_list_lock);
-
-	if (conn->security_cfm_cb)
-		conn->security_cfm_cb(conn, status);
+	hci_security_cfm(conn, status, encrypt);
 }
 
 static inline void hci_key_change_cfm(struct hci_conn *conn, __u8 status)
 {
-	struct hci_cb *cb;
+	struct list_head list;
+	struct hci_cb *cb, *tmp;
 
-	mutex_lock(&hci_cb_list_lock);
-	list_for_each_entry(cb, &hci_cb_list, list) {
+	INIT_LIST_HEAD(&list);
+	hci_cb_lookup(conn, &list);
+
+	list_for_each_entry_safe(cb, tmp, &list, list) {
 		if (cb->key_change_cfm)
 			cb->key_change_cfm(conn, status);
+		kfree(cb);
 	}
-	mutex_unlock(&hci_cb_list_lock);
 }
 
 static inline void hci_role_switch_cfm(struct hci_conn *conn, __u8 status,
 								__u8 role)
 {
-	struct hci_cb *cb;
+	struct list_head list;
+	struct hci_cb *cb, *tmp;
 
-	mutex_lock(&hci_cb_list_lock);
-	list_for_each_entry(cb, &hci_cb_list, list) {
+	INIT_LIST_HEAD(&list);
+	hci_cb_lookup(conn, &list);
+
+	list_for_each_entry_safe(cb, tmp, &list, list) {
 		if (cb->role_switch_cfm)
 			cb->role_switch_cfm(conn, status, role);
+		kfree(cb);
 	}
-	mutex_unlock(&hci_cb_list_lock);
 }
 
 static inline bool hci_bdaddr_is_rpa(bdaddr_t *bdaddr, u8 addr_type)
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index f9e19f9cb5a3..25d180d225c1 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -2993,9 +2993,7 @@ int hci_register_cb(struct hci_cb *cb)
 {
 	BT_DBG("%p name %s", cb, cb->name);
 
-	mutex_lock(&hci_cb_list_lock);
-	list_add_tail(&cb->list, &hci_cb_list);
-	mutex_unlock(&hci_cb_list_lock);
+	list_add_tail_rcu(&cb->list, &hci_cb_list);
 
 	return 0;
 }
@@ -3005,9 +3003,8 @@ int hci_unregister_cb(struct hci_cb *cb)
 {
 	BT_DBG("%p name %s", cb, cb->name);
 
-	mutex_lock(&hci_cb_list_lock);
-	list_del(&cb->list);
-	mutex_unlock(&hci_cb_list_lock);
+	list_del_rcu(&cb->list);
+	synchronize_rcu();
 
 	return 0;
 }
diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
index 8ed818254dc8..eccdaa16cba0 100644
--- a/net/bluetooth/iso.c
+++ b/net/bluetooth/iso.c
@@ -2154,6 +2154,11 @@ int iso_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr, __u8 *flags)
 	return HCI_LM_ACCEPT;
 }
 
+static bool iso_match(struct hci_conn *hcon)
+{
+	return hcon->type == ISO_LINK || hcon->type == LE_LINK;
+}
+
 static void iso_connect_cfm(struct hci_conn *hcon, __u8 status)
 {
 	if (hcon->type != ISO_LINK) {
@@ -2335,6 +2340,7 @@ void iso_recv(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
 
 static struct hci_cb iso_cb = {
 	.name		= "ISO",
+	.match		= iso_match,
 	.connect_cfm	= iso_connect_cfm,
 	.disconn_cfm	= iso_disconn_cfm,
 };
diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 6544c1ed7143..27b4c4a2ba1f 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -7217,6 +7217,11 @@ static struct l2cap_chan *l2cap_global_fixed_chan(struct l2cap_chan *c,
 	return NULL;
 }
 
+static bool l2cap_match(struct hci_conn *hcon)
+{
+	return hcon->type == ACL_LINK || hcon->type == LE_LINK;
+}
+
 static void l2cap_connect_cfm(struct hci_conn *hcon, u8 status)
 {
 	struct hci_dev *hdev = hcon->hdev;
@@ -7224,9 +7229,6 @@ static void l2cap_connect_cfm(struct hci_conn *hcon, u8 status)
 	struct l2cap_chan *pchan;
 	u8 dst_type;
 
-	if (hcon->type != ACL_LINK && hcon->type != LE_LINK)
-		return;
-
 	BT_DBG("hcon %p bdaddr %pMR status %d", hcon, &hcon->dst, status);
 
 	if (status) {
@@ -7291,9 +7293,6 @@ int l2cap_disconn_ind(struct hci_conn *hcon)
 
 static void l2cap_disconn_cfm(struct hci_conn *hcon, u8 reason)
 {
-	if (hcon->type != ACL_LINK && hcon->type != LE_LINK)
-		return;
-
 	BT_DBG("hcon %p reason %d", hcon, reason);
 
 	l2cap_conn_del(hcon, bt_to_errno(reason));
@@ -7572,6 +7571,7 @@ void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
 
 static struct hci_cb l2cap_cb = {
 	.name		= "L2CAP",
+	.match		= l2cap_match,
 	.connect_cfm	= l2cap_connect_cfm,
 	.disconn_cfm	= l2cap_disconn_cfm,
 	.security_cfm	= l2cap_security_cfm,
diff --git a/net/bluetooth/rfcomm/core.c b/net/bluetooth/rfcomm/core.c
index ad5177e3a69b..4c56ca5a216c 100644
--- a/net/bluetooth/rfcomm/core.c
+++ b/net/bluetooth/rfcomm/core.c
@@ -2134,6 +2134,11 @@ static int rfcomm_run(void *unused)
 	return 0;
 }
 
+static bool rfcomm_match(struct hci_conn *hcon)
+{
+	return hcon->type == ACL_LINK;
+}
+
 static void rfcomm_security_cfm(struct hci_conn *conn, u8 status, u8 encrypt)
 {
 	struct rfcomm_session *s;
@@ -2180,6 +2185,7 @@ static void rfcomm_security_cfm(struct hci_conn *conn, u8 status, u8 encrypt)
 
 static struct hci_cb rfcomm_cb = {
 	.name		= "RFCOMM",
+	.match		= rfcomm_match,
 	.security_cfm	= rfcomm_security_cfm
 };
 
diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index 7eb8d3e04ec4..40c4957cfc0b 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -1397,11 +1397,13 @@ int sco_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr, __u8 *flags)
 	return lm;
 }
 
+static bool sco_match(struct hci_conn *hcon)
+{
+	return hcon->type == SCO_LINK || hcon->type == ESCO_LINK;
+}
+
 static void sco_connect_cfm(struct hci_conn *hcon, __u8 status)
 {
-	if (hcon->type != SCO_LINK && hcon->type != ESCO_LINK)
-		return;
-
 	BT_DBG("hcon %p bdaddr %pMR status %u", hcon, &hcon->dst, status);
 
 	if (!status) {
@@ -1416,9 +1418,6 @@ static void sco_connect_cfm(struct hci_conn *hcon, __u8 status)
 
 static void sco_disconn_cfm(struct hci_conn *hcon, __u8 reason)
 {
-	if (hcon->type != SCO_LINK && hcon->type != ESCO_LINK)
-		return;
-
 	BT_DBG("hcon %p reason %d", hcon, reason);
 
 	sco_conn_del(hcon, bt_to_errno(reason));
@@ -1444,6 +1443,7 @@ void sco_recv_scodata(struct hci_conn *hcon, struct sk_buff *skb)
 
 static struct hci_cb sco_cb = {
 	.name		= "SCO",
+	.match		= sco_match,
 	.connect_cfm	= sco_connect_cfm,
 	.disconn_cfm	= sco_disconn_cfm,
 };
-- 
2.47.1


