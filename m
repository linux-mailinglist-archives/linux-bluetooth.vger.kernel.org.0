Return-Path: <linux-bluetooth+bounces-10200-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD09A2CEA8
	for <lists+linux-bluetooth@lfdr.de>; Fri,  7 Feb 2025 22:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24E233AB7D8
	for <lists+linux-bluetooth@lfdr.de>; Fri,  7 Feb 2025 21:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E3E1A3177;
	Fri,  7 Feb 2025 21:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGbt3Jki"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D7C195FEF
	for <linux-bluetooth@vger.kernel.org>; Fri,  7 Feb 2025 21:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738962122; cv=none; b=cXV+iHE5V4Kzv+UV99AaKpQMR5+e5dXZyzQ2JEBbRtKnGe44qSEU9kGb7dgnawzXbOc6tGB9s0y60AH+IOSI+U8rI/PjW5cG2M7uaPavEW+aK6/J34C8r1+RZHmXyfIRkx2++ubb20blsfRpIWDRV3nX/l1Zw+4VU3c+O6VI+dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738962122; c=relaxed/simple;
	bh=MoR/MpgVY1PZCslp//xtF93vCjVMIt883qCqL6ozvAI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Y2C376dkN9zqtUM2Tsm5+TDu/AaCHNmen6bkOWjEhqJ7H5aAkWn5dFj+yTiQ2tFAJCGiK8x6wT231jlp149T5M+F2Y6OWTW9uHOX3eyqArPozgmisRz1+O/PQV1C2dAL4VYMSSz8nRv8vvWz2nZjrIDQ1OSTGT3nhXu2DiNby+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGbt3Jki; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-51f22008544so423157e0c.1
        for <linux-bluetooth@vger.kernel.org>; Fri, 07 Feb 2025 13:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738962118; x=1739566918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dw9LzBv+bCPtYftgDCAmka7+H8S/R5ArcI72i41mFSE=;
        b=FGbt3JkiBMsHdObfRM9TG9KMyVElcWniJSUXzBs4iB41LqwVQiBBONOJgC4zAu7kka
         Q+V6HfpT8L9lcN6zqPssHtQ4mzTrPgduHnEz1izbH5O0qPK5b/Bt5jiifKg3T8/PSGMY
         kHfQiW+8JPPp1UIGGjFlTutmmZk6SYsd7dr//PIKssy1nBwtvJxpWcyTE9n2nvbxoO4M
         5mD/o/IgDVe9SzqWMbPJFy+YplD9RYI5qTXXbSpG/U0FvzkgRZfD6ZtXPihM50G9Ua8f
         vj9ujtvhUbvChmeV+OjfBs+ga1+T4I7Ldu0fA1eTC2RqSH0GFnIWy8hkOhVUpllFzuua
         9MYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738962118; x=1739566918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dw9LzBv+bCPtYftgDCAmka7+H8S/R5ArcI72i41mFSE=;
        b=jiXEZFfHXbmBflPMeqFKIlpuiM58iYruq1JZ6Cr7QZ9csLv0tLgitycQELwzgqN/oC
         AD+W6apFUBaAa/tF4eZ/aZVivZGO4zDw1Gtl9aozhC9oyGAi/AAoOl1zG6BJ6i4bBi2K
         LOQVi1T1gfJbAngJ+NdfCV7KgCi1qtEpCgMXU11UWctJPiP7tcAVwWR0EsCc5R+1sT2l
         OAD4ty24z6Wsox/qGQC31En0Cc1PBsbssMu933+ezPe868fmZCZm8a6xb/2xNjDdlBKv
         LivnWy3pMigrn+tOj20ZnNGQn1/YneQYRp/ypIKrq1oF2ue/KdUlhqj6jzDvUMGADJyz
         rVNg==
X-Gm-Message-State: AOJu0YyRj3EBUNovFF/MeaS7Ph1CJLvzTNIwxpyp9RrdIiE6aIjp4AJV
	3cw0Im1xNHmpKVNq65ii0JQUag0+tHsa25L0jjo6AcY/0BXvR+Hk8sHSCA==
X-Gm-Gg: ASbGncs2lzvQAPf0bW2h8TjyNxQIKZJnfztTdcjIHJTq8Gy1VtdxhgHTs0EntYdYlhr
	ZaA4mYYNRE2HqNsnSS+XJYpNLLFDU6dS3rB6tM1ofC0s4j4tyhxVy74iqzpReltZAIQkng2DhhN
	XNapgTH2iXyyiUvFamZMMq+FkmHYYC37ogwXmjhq3teMt7bKjNjOZEMlPxxbqrLUZ4hQQlnM1bv
	cSNx4+xhi1WPoK++uDCz/kAtnrF5CbnfHug5Y5OqP1BpHQoTYxg/dso1UN0aCrldWg18LyCM1Fx
	NJQNLiq+wHAlz0kOUs4BKNmPC+z7kBin/t9/Kg5mK8HIBoa9B3wrIdA7/bYSO6o=
X-Google-Smtp-Source: AGHT+IFA8Y9Z0AEDyr2xT8/fy9w3/njegsSFnP2ZVneZSNKOoWlaM1u2oIR947U3yR1YsPKpoYRwsA==
X-Received: by 2002:ac5:c99c:0:b0:51f:306f:f355 with SMTP id 71dfb90a1353d-51f306ff97dmr3263486e0c.4.1738962117323;
        Fri, 07 Feb 2025 13:01:57 -0800 (PST)
Received: from lvondent-mobl5.. (syn-107-146-107-067.res.spectrum.com. [107.146.107.67])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51f22736ed8sm646297e0c.12.2025.02.07.13.01.54
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:01:55 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH v2] Bluetooth: L2CAP: Fix corrupted list in hci_chan_del
Date: Fri,  7 Feb 2025 16:01:53 -0500
Message-ID: <20250207210153.3457111-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This fixes the following trace by reworking the locking of l2cap_conn
so instead of only locking when changing the chan_l list this promotes
chan_lock to a general lock of l2cap_conn so whenever it is being held
it would prevents the likes of l2cap_conn_del to run:

list_del corruption, ffff888021297e00->prev is LIST_POISON2 (dead000000000122)
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:61!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 1 UID: 0 PID: 5896 Comm: syz-executor213 Not tainted 6.14.0-rc1-next-20250204-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
RIP: 0010:__list_del_entry_valid_or_report+0x12c/0x190 lib/list_debug.c:59
Code: 8c 4c 89 fe 48 89 da e8 32 8c 37 fc 90 0f 0b 48 89 df e8 27 9f 14 fd 48 c7 c7 a0 c0 60 8c 4c 89 fe 48 89 da e8 15 8c 37 fc 90 <0f> 0b 4c 89 e7 e8 0a 9f 14 fd 42 80 3c 2b 00 74 08 4c 89 e7 e8 cb
RSP: 0018:ffffc90003f6f998 EFLAGS: 00010246
RAX: 000000000000004e RBX: dead000000000122 RCX: 01454d423f7fbf00
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: dffffc0000000000 R08: ffffffff819f077c R09: 1ffff920007eded0
R10: dffffc0000000000 R11: fffff520007eded1 R12: dead000000000122
R13: dffffc0000000000 R14: ffff8880352248d8 R15: ffff888021297e00
FS:  00007f7ace6686c0(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7aceeeb1d0 CR3: 000000003527c000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __list_del_entry_valid include/linux/list.h:124 [inline]
 __list_del_entry include/linux/list.h:215 [inline]
 list_del_rcu include/linux/rculist.h:168 [inline]
 hci_chan_del+0x70/0x1b0 net/bluetooth/hci_conn.c:2858
 l2cap_conn_free net/bluetooth/l2cap_core.c:1816 [inline]
 kref_put include/linux/kref.h:65 [inline]
 l2cap_conn_put+0x70/0xe0 net/bluetooth/l2cap_core.c:1830
 l2cap_sock_shutdown+0xa8a/0x1020 net/bluetooth/l2cap_sock.c:1377
 l2cap_sock_release+0x79/0x1d0 net/bluetooth/l2cap_sock.c:1416
 __sock_release net/socket.c:642 [inline]
 sock_close+0xbc/0x240 net/socket.c:1393
 __fput+0x3e9/0x9f0 fs/file_table.c:448
 task_work_run+0x24f/0x310 kernel/task_work.c:227
 ptrace_notify+0x2d2/0x380 kernel/signal.c:2522
 ptrace_report_syscall include/linux/ptrace.h:415 [inline]
 ptrace_report_syscall_exit include/linux/ptrace.h:477 [inline]
 syscall_exit_work+0xc7/0x1d0 kernel/entry/common.c:173
 syscall_exit_to_user_mode_prepare kernel/entry/common.c:200 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:205 [inline]
 syscall_exit_to_user_mode+0x24a/0x340 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7aceeaf449
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 41 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f7ace668218 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
RAX: fffffffffffffffc RBX: 00007f7acef39328 RCX: 00007f7aceeaf449
RDX: 000000000000000e RSI: 0000000020000100 RDI: 0000000000000004
RBP: 00007f7acef39320 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000003
R13: 0000000000000004 R14: 00007f7ace668670 R15: 000000000000000b
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_del_entry_valid_or_report+0x12c/0x190 lib/list_debug.c:59
Code: 8c 4c 89 fe 48 89 da e8 32 8c 37 fc 90 0f 0b 48 89 df e8 27 9f 14 fd 48 c7 c7 a0 c0 60 8c 4c 89 fe 48 89 da e8 15 8c 37 fc 90 <0f> 0b 4c 89 e7 e8 0a 9f 14 fd 42 80 3c 2b 00 74 08 4c 89 e7 e8 cb
RSP: 0018:ffffc90003f6f998 EFLAGS: 00010246
RAX: 000000000000004e RBX: dead000000000122 RCX: 01454d423f7fbf00
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: dffffc0000000000 R08: ffffffff819f077c R09: 1ffff920007eded0
R10: dffffc0000000000 R11: fffff520007eded1 R12: dead000000000122
R13: dffffc0000000000 R14: ffff8880352248d8 R15: ffff888021297e00
FS:  00007f7ace6686c0(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7acef05b08 CR3: 000000003527c000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

Reported-by: syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com
Tested-by: syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com
Fixes: 6ab54a717189 ("Bluetooth: L2CAP: Fix slab-use-after-free Read in l2cap_send_cmd")
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/l2cap.h |   3 +-
 net/bluetooth/l2cap_core.c    | 132 ++++++++++++----------------------
 net/bluetooth/l2cap_sock.c    |  15 ++--
 3 files changed, 54 insertions(+), 96 deletions(-)

diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
index d9c767cf773d..9189354c568f 100644
--- a/include/net/bluetooth/l2cap.h
+++ b/include/net/bluetooth/l2cap.h
@@ -668,7 +668,7 @@ struct l2cap_conn {
 	struct l2cap_chan	*smp;
 
 	struct list_head	chan_l;
-	struct mutex		chan_lock;
+	struct mutex		lock;
 	struct kref		ref;
 	struct list_head	users;
 };
@@ -970,6 +970,7 @@ void l2cap_chan_del(struct l2cap_chan *chan, int err);
 void l2cap_send_conn_req(struct l2cap_chan *chan);
 
 struct l2cap_conn *l2cap_conn_get(struct l2cap_conn *conn);
+struct l2cap_conn *l2cap_conn_hold_unless_zero(struct l2cap_conn *conn);
 void l2cap_conn_put(struct l2cap_conn *conn);
 
 int l2cap_register_user(struct l2cap_conn *conn, struct l2cap_user *user);
diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index adb8c33ac595..6cdc1dc3a7f9 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -119,7 +119,6 @@ static struct l2cap_chan *l2cap_get_chan_by_scid(struct l2cap_conn *conn,
 {
 	struct l2cap_chan *c;
 
-	mutex_lock(&conn->chan_lock);
 	c = __l2cap_get_chan_by_scid(conn, cid);
 	if (c) {
 		/* Only lock if chan reference is not 0 */
@@ -127,7 +126,6 @@ static struct l2cap_chan *l2cap_get_chan_by_scid(struct l2cap_conn *conn,
 		if (c)
 			l2cap_chan_lock(c);
 	}
-	mutex_unlock(&conn->chan_lock);
 
 	return c;
 }
@@ -140,7 +138,6 @@ static struct l2cap_chan *l2cap_get_chan_by_dcid(struct l2cap_conn *conn,
 {
 	struct l2cap_chan *c;
 
-	mutex_lock(&conn->chan_lock);
 	c = __l2cap_get_chan_by_dcid(conn, cid);
 	if (c) {
 		/* Only lock if chan reference is not 0 */
@@ -148,7 +145,6 @@ static struct l2cap_chan *l2cap_get_chan_by_dcid(struct l2cap_conn *conn,
 		if (c)
 			l2cap_chan_lock(c);
 	}
-	mutex_unlock(&conn->chan_lock);
 
 	return c;
 }
@@ -418,7 +414,7 @@ static void l2cap_chan_timeout(struct work_struct *work)
 	if (!conn)
 		return;
 
-	mutex_lock(&conn->chan_lock);
+	mutex_lock(&conn->lock);
 	/* __set_chan_timer() calls l2cap_chan_hold(chan) while scheduling
 	 * this work. No need to call l2cap_chan_hold(chan) here again.
 	 */
@@ -439,7 +435,7 @@ static void l2cap_chan_timeout(struct work_struct *work)
 	l2cap_chan_unlock(chan);
 	l2cap_chan_put(chan);
 
-	mutex_unlock(&conn->chan_lock);
+	mutex_unlock(&conn->lock);
 }
 
 struct l2cap_chan *l2cap_chan_create(void)
@@ -641,9 +637,9 @@ void __l2cap_chan_add(struct l2cap_conn *conn, struct l2cap_chan *chan)
 
 void l2cap_chan_add(struct l2cap_conn *conn, struct l2cap_chan *chan)
 {
-	mutex_lock(&conn->chan_lock);
+	mutex_lock(&conn->lock);
 	__l2cap_chan_add(conn, chan);
-	mutex_unlock(&conn->chan_lock);
+	mutex_unlock(&conn->lock);
 }
 
 void l2cap_chan_del(struct l2cap_chan *chan, int err)
@@ -731,9 +727,9 @@ void l2cap_chan_list(struct l2cap_conn *conn, l2cap_chan_func_t func,
 	if (!conn)
 		return;
 
-	mutex_lock(&conn->chan_lock);
+	mutex_lock(&conn->lock);
 	__l2cap_chan_list(conn, func, data);
-	mutex_unlock(&conn->chan_lock);
+	mutex_unlock(&conn->lock);
 }
 
 EXPORT_SYMBOL_GPL(l2cap_chan_list);
@@ -745,7 +741,7 @@ static void l2cap_conn_update_id_addr(struct work_struct *work)
 	struct hci_conn *hcon = conn->hcon;
 	struct l2cap_chan *chan;
 
-	mutex_lock(&conn->chan_lock);
+	mutex_lock(&conn->lock);
 
 	list_for_each_entry(chan, &conn->chan_l, list) {
 		l2cap_chan_lock(chan);
@@ -754,7 +750,7 @@ static void l2cap_conn_update_id_addr(struct work_struct *work)
 		l2cap_chan_unlock(chan);
 	}
 
-	mutex_unlock(&conn->chan_lock);
+	mutex_unlock(&conn->lock);
 }
 
 static void l2cap_chan_le_connect_reject(struct l2cap_chan *chan)
@@ -1507,8 +1503,6 @@ static void l2cap_conn_start(struct l2cap_conn *conn)
 
 	BT_DBG("conn %p", conn);
 
-	mutex_lock(&conn->chan_lock);
-
 	list_for_each_entry_safe(chan, tmp, &conn->chan_l, list) {
 		l2cap_chan_lock(chan);
 
@@ -1577,8 +1571,6 @@ static void l2cap_conn_start(struct l2cap_conn *conn)
 
 		l2cap_chan_unlock(chan);
 	}
-
-	mutex_unlock(&conn->chan_lock);
 }
 
 static void l2cap_le_conn_ready(struct l2cap_conn *conn)
@@ -1624,7 +1616,7 @@ static void l2cap_conn_ready(struct l2cap_conn *conn)
 	if (hcon->type == ACL_LINK)
 		l2cap_request_info(conn);
 
-	mutex_lock(&conn->chan_lock);
+	mutex_lock(&conn->lock);
 
 	list_for_each_entry(chan, &conn->chan_l, list) {
 
@@ -1642,7 +1634,7 @@ static void l2cap_conn_ready(struct l2cap_conn *conn)
 		l2cap_chan_unlock(chan);
 	}
 
-	mutex_unlock(&conn->chan_lock);
+	mutex_unlock(&conn->lock);
 
 	if (hcon->type == LE_LINK)
 		l2cap_le_conn_ready(conn);
@@ -1657,14 +1649,10 @@ static void l2cap_conn_unreliable(struct l2cap_conn *conn, int err)
 
 	BT_DBG("conn %p", conn);
 
-	mutex_lock(&conn->chan_lock);
-
 	list_for_each_entry(chan, &conn->chan_l, list) {
 		if (test_bit(FLAG_FORCE_RELIABLE, &chan->flags))
 			l2cap_chan_set_err(chan, err);
 	}
-
-	mutex_unlock(&conn->chan_lock);
 }
 
 static void l2cap_info_timeout(struct work_struct *work)
@@ -1675,7 +1663,9 @@ static void l2cap_info_timeout(struct work_struct *work)
 	conn->info_state |= L2CAP_INFO_FEAT_MASK_REQ_DONE;
 	conn->info_ident = 0;
 
+	mutex_lock(&conn->lock);
 	l2cap_conn_start(conn);
+	mutex_unlock(&conn->lock);
 }
 
 /*
@@ -1767,6 +1757,8 @@ static void l2cap_conn_del(struct hci_conn *hcon, int err)
 
 	BT_DBG("hcon %p conn %p, err %d", hcon, conn, err);
 
+	mutex_lock(&conn->lock);
+
 	kfree_skb(conn->rx_skb);
 
 	skb_queue_purge(&conn->pending_rx);
@@ -1785,8 +1777,6 @@ static void l2cap_conn_del(struct hci_conn *hcon, int err)
 	/* Force the connection to be immediately dropped */
 	hcon->disc_timeout = 0;
 
-	mutex_lock(&conn->chan_lock);
-
 	/* Kill channels */
 	list_for_each_entry_safe(chan, l, &conn->chan_l, list) {
 		l2cap_chan_hold(chan);
@@ -1800,12 +1790,14 @@ static void l2cap_conn_del(struct hci_conn *hcon, int err)
 		l2cap_chan_put(chan);
 	}
 
-	mutex_unlock(&conn->chan_lock);
-
 	if (conn->info_state & L2CAP_INFO_FEAT_MASK_REQ_SENT)
 		cancel_delayed_work_sync(&conn->info_timer);
 
+	hci_chan_del(conn->hchan);
+	conn->hchan = NULL;
+
 	hcon->l2cap_data = NULL;
+	mutex_unlock(&conn->lock);
 	l2cap_conn_put(conn);
 }
 
@@ -1813,7 +1805,6 @@ static void l2cap_conn_free(struct kref *ref)
 {
 	struct l2cap_conn *conn = container_of(ref, struct l2cap_conn, ref);
 
-	hci_chan_del(conn->hchan);
 	hci_conn_put(conn->hcon);
 	kfree(conn);
 }
@@ -2924,8 +2915,6 @@ static void l2cap_raw_recv(struct l2cap_conn *conn, struct sk_buff *skb)
 
 	BT_DBG("conn %p", conn);
 
-	mutex_lock(&conn->chan_lock);
-
 	list_for_each_entry(chan, &conn->chan_l, list) {
 		if (chan->chan_type != L2CAP_CHAN_RAW)
 			continue;
@@ -2940,8 +2929,6 @@ static void l2cap_raw_recv(struct l2cap_conn *conn, struct sk_buff *skb)
 		if (chan->ops->recv(chan, nskb))
 			kfree_skb(nskb);
 	}
-
-	mutex_unlock(&conn->chan_lock);
 }
 
 /* ---- L2CAP signalling commands ---- */
@@ -3960,7 +3947,6 @@ static void l2cap_connect(struct l2cap_conn *conn, struct l2cap_cmd_hdr *cmd,
 		goto response;
 	}
 
-	mutex_lock(&conn->chan_lock);
 	l2cap_chan_lock(pchan);
 
 	/* Check if the ACL is secure enough (if not SDP) */
@@ -4067,7 +4053,6 @@ static void l2cap_connect(struct l2cap_conn *conn, struct l2cap_cmd_hdr *cmd,
 	}
 
 	l2cap_chan_unlock(pchan);
-	mutex_unlock(&conn->chan_lock);
 	l2cap_chan_put(pchan);
 }
 
@@ -4106,27 +4091,19 @@ static int l2cap_connect_create_rsp(struct l2cap_conn *conn,
 	BT_DBG("dcid 0x%4.4x scid 0x%4.4x result 0x%2.2x status 0x%2.2x",
 	       dcid, scid, result, status);
 
-	mutex_lock(&conn->chan_lock);
-
 	if (scid) {
 		chan = __l2cap_get_chan_by_scid(conn, scid);
-		if (!chan) {
-			err = -EBADSLT;
-			goto unlock;
-		}
+		if (!chan)
+			return -EBADSLT;
 	} else {
 		chan = __l2cap_get_chan_by_ident(conn, cmd->ident);
-		if (!chan) {
-			err = -EBADSLT;
-			goto unlock;
-		}
+		if (!chan)
+			return -EBADSLT;
 	}
 
 	chan = l2cap_chan_hold_unless_zero(chan);
-	if (!chan) {
-		err = -EBADSLT;
-		goto unlock;
-	}
+	if (!chan)
+		return -EBADSLT;
 
 	err = 0;
 
@@ -4164,9 +4141,6 @@ static int l2cap_connect_create_rsp(struct l2cap_conn *conn,
 	l2cap_chan_unlock(chan);
 	l2cap_chan_put(chan);
 
-unlock:
-	mutex_unlock(&conn->chan_lock);
-
 	return err;
 }
 
@@ -4454,11 +4428,7 @@ static inline int l2cap_disconnect_req(struct l2cap_conn *conn,
 
 	chan->ops->set_shutdown(chan);
 
-	l2cap_chan_unlock(chan);
-	mutex_lock(&conn->chan_lock);
-	l2cap_chan_lock(chan);
 	l2cap_chan_del(chan, ECONNRESET);
-	mutex_unlock(&conn->chan_lock);
 
 	chan->ops->close(chan);
 
@@ -4495,11 +4465,7 @@ static inline int l2cap_disconnect_rsp(struct l2cap_conn *conn,
 		return 0;
 	}
 
-	l2cap_chan_unlock(chan);
-	mutex_lock(&conn->chan_lock);
-	l2cap_chan_lock(chan);
 	l2cap_chan_del(chan, 0);
-	mutex_unlock(&conn->chan_lock);
 
 	chan->ops->close(chan);
 
@@ -4697,13 +4663,9 @@ static int l2cap_le_connect_rsp(struct l2cap_conn *conn,
 	BT_DBG("dcid 0x%4.4x mtu %u mps %u credits %u result 0x%2.2x",
 	       dcid, mtu, mps, credits, result);
 
-	mutex_lock(&conn->chan_lock);
-
 	chan = __l2cap_get_chan_by_ident(conn, cmd->ident);
-	if (!chan) {
-		err = -EBADSLT;
-		goto unlock;
-	}
+	if (!chan)
+		return -EBADSLT;
 
 	err = 0;
 
@@ -4751,9 +4713,6 @@ static int l2cap_le_connect_rsp(struct l2cap_conn *conn,
 
 	l2cap_chan_unlock(chan);
 
-unlock:
-	mutex_unlock(&conn->chan_lock);
-
 	return err;
 }
 
@@ -4865,7 +4824,6 @@ static int l2cap_le_connect_req(struct l2cap_conn *conn,
 		goto response;
 	}
 
-	mutex_lock(&conn->chan_lock);
 	l2cap_chan_lock(pchan);
 
 	if (!smp_sufficient_security(conn->hcon, pchan->sec_level,
@@ -4931,7 +4889,6 @@ static int l2cap_le_connect_req(struct l2cap_conn *conn,
 
 response_unlock:
 	l2cap_chan_unlock(pchan);
-	mutex_unlock(&conn->chan_lock);
 	l2cap_chan_put(pchan);
 
 	if (result == L2CAP_CR_PEND)
@@ -5065,7 +5022,6 @@ static inline int l2cap_ecred_conn_req(struct l2cap_conn *conn,
 		goto response;
 	}
 
-	mutex_lock(&conn->chan_lock);
 	l2cap_chan_lock(pchan);
 
 	if (!smp_sufficient_security(conn->hcon, pchan->sec_level,
@@ -5140,7 +5096,6 @@ static inline int l2cap_ecred_conn_req(struct l2cap_conn *conn,
 
 unlock:
 	l2cap_chan_unlock(pchan);
-	mutex_unlock(&conn->chan_lock);
 	l2cap_chan_put(pchan);
 
 response:
@@ -5177,8 +5132,6 @@ static inline int l2cap_ecred_conn_rsp(struct l2cap_conn *conn,
 	BT_DBG("mtu %u mps %u credits %u result 0x%4.4x", mtu, mps, credits,
 	       result);
 
-	mutex_lock(&conn->chan_lock);
-
 	cmd_len -= sizeof(*rsp);
 
 	list_for_each_entry_safe(chan, tmp, &conn->chan_l, list) {
@@ -5264,8 +5217,6 @@ static inline int l2cap_ecred_conn_rsp(struct l2cap_conn *conn,
 		l2cap_chan_unlock(chan);
 	}
 
-	mutex_unlock(&conn->chan_lock);
-
 	return err;
 }
 
@@ -5378,8 +5329,6 @@ static inline int l2cap_le_command_rej(struct l2cap_conn *conn,
 	if (cmd_len < sizeof(*rej))
 		return -EPROTO;
 
-	mutex_lock(&conn->chan_lock);
-
 	chan = __l2cap_get_chan_by_ident(conn, cmd->ident);
 	if (!chan)
 		goto done;
@@ -5394,7 +5343,6 @@ static inline int l2cap_le_command_rej(struct l2cap_conn *conn,
 	l2cap_chan_put(chan);
 
 done:
-	mutex_unlock(&conn->chan_lock);
 	return 0;
 }
 
@@ -6849,8 +6797,12 @@ static void process_pending_rx(struct work_struct *work)
 
 	BT_DBG("");
 
+	mutex_lock(&conn->lock);
+
 	while ((skb = skb_dequeue(&conn->pending_rx)))
 		l2cap_recv_frame(conn, skb);
+
+	mutex_unlock(&conn->lock);
 }
 
 static struct l2cap_conn *l2cap_conn_add(struct hci_conn *hcon)
@@ -6889,7 +6841,7 @@ static struct l2cap_conn *l2cap_conn_add(struct hci_conn *hcon)
 		conn->local_fixed_chan |= L2CAP_FC_SMP_BREDR;
 
 	mutex_init(&conn->ident_lock);
-	mutex_init(&conn->chan_lock);
+	mutex_init(&conn->lock);
 
 	INIT_LIST_HEAD(&conn->chan_l);
 	INIT_LIST_HEAD(&conn->users);
@@ -7080,7 +7032,7 @@ int l2cap_chan_connect(struct l2cap_chan *chan, __le16 psm, u16 cid,
 		}
 	}
 
-	mutex_lock(&conn->chan_lock);
+	mutex_lock(&conn->lock);
 	l2cap_chan_lock(chan);
 
 	if (cid && __l2cap_get_chan_by_dcid(conn, cid)) {
@@ -7121,7 +7073,7 @@ int l2cap_chan_connect(struct l2cap_chan *chan, __le16 psm, u16 cid,
 
 chan_unlock:
 	l2cap_chan_unlock(chan);
-	mutex_unlock(&conn->chan_lock);
+	mutex_unlock(&conn->lock);
 done:
 	hci_dev_unlock(hdev);
 	hci_dev_put(hdev);
@@ -7333,7 +7285,7 @@ static void l2cap_security_cfm(struct hci_conn *hcon, u8 status, u8 encrypt)
 
 	BT_DBG("conn %p status 0x%2.2x encrypt %u", conn, status, encrypt);
 
-	mutex_lock(&conn->chan_lock);
+	mutex_lock(&conn->lock);
 
 	list_for_each_entry(chan, &conn->chan_l, list) {
 		l2cap_chan_lock(chan);
@@ -7407,7 +7359,7 @@ static void l2cap_security_cfm(struct hci_conn *hcon, u8 status, u8 encrypt)
 		l2cap_chan_unlock(chan);
 	}
 
-	mutex_unlock(&conn->chan_lock);
+	mutex_unlock(&conn->lock);
 }
 
 /* Append fragment into frame respecting the maximum len of rx_skb */
@@ -7474,8 +7426,11 @@ static void l2cap_recv_reset(struct l2cap_conn *conn)
 	conn->rx_len = 0;
 }
 
-static struct l2cap_conn *l2cap_conn_hold_unless_zero(struct l2cap_conn *c)
+struct l2cap_conn *l2cap_conn_hold_unless_zero(struct l2cap_conn *c)
 {
+	if (!c)
+		return NULL;
+
 	BT_DBG("conn %p orig refcnt %u", c, kref_read(&c->ref));
 
 	if (!kref_get_unless_zero(&c->ref))
@@ -7506,6 +7461,8 @@ void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
 
 	BT_DBG("conn %p len %u flags 0x%x", conn, skb->len, flags);
 
+	mutex_lock(&conn->lock);
+
 	switch (flags) {
 	case ACL_START:
 	case ACL_START_NO_FLUSH:
@@ -7530,7 +7487,7 @@ void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
 		if (len == skb->len) {
 			/* Complete frame received */
 			l2cap_recv_frame(conn, skb);
-			return;
+			goto unlock;
 		}
 
 		BT_DBG("Start: total len %d, frag len %u", len, skb->len);
@@ -7592,10 +7549,11 @@ void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
 		break;
 	}
 
-	l2cap_conn_put(conn);
-
 drop:
 	kfree_skb(skb);
+unlock:
+	mutex_unlock(&conn->lock);
+	l2cap_conn_put(conn);
 }
 
 static struct hci_cb l2cap_cb = {
diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
index 46ea0bee2259..acd11b268b98 100644
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@ -1326,9 +1326,10 @@ static int l2cap_sock_shutdown(struct socket *sock, int how)
 	/* prevent sk structure from being freed whilst unlocked */
 	sock_hold(sk);
 
-	chan = l2cap_pi(sk)->chan;
 	/* prevent chan structure from being freed whilst unlocked */
-	l2cap_chan_hold(chan);
+	chan = l2cap_chan_hold_unless_zero(l2cap_pi(sk)->chan);
+	if (!chan)
+		goto shutdown_already;
 
 	BT_DBG("chan %p state %s", chan, state_to_string(chan->state));
 
@@ -1358,22 +1359,20 @@ static int l2cap_sock_shutdown(struct socket *sock, int how)
 	release_sock(sk);
 
 	l2cap_chan_lock(chan);
-	conn = chan->conn;
-	if (conn)
-		/* prevent conn structure from being freed */
-		l2cap_conn_get(conn);
+	/* prevent conn structure from being freed */
+	conn = l2cap_conn_hold_unless_zero(chan->conn);
 	l2cap_chan_unlock(chan);
 
 	if (conn)
 		/* mutex lock must be taken before l2cap_chan_lock() */
-		mutex_lock(&conn->chan_lock);
+		mutex_lock(&conn->lock);
 
 	l2cap_chan_lock(chan);
 	l2cap_chan_close(chan, 0);
 	l2cap_chan_unlock(chan);
 
 	if (conn) {
-		mutex_unlock(&conn->chan_lock);
+		mutex_unlock(&conn->lock);
 		l2cap_conn_put(conn);
 	}
 
-- 
2.48.1


