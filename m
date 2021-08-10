Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BADAF3DFF64
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Aug 2021 12:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237304AbhHDK1Y (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 4 Aug 2021 06:27:24 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:62871 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235383AbhHDK1X (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 4 Aug 2021 06:27:23 -0400
Received: from fsav415.sakura.ne.jp (fsav415.sakura.ne.jp [133.242.250.114])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 174AR0PO083503;
        Wed, 4 Aug 2021 19:27:00 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav415.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav415.sakura.ne.jp);
 Wed, 04 Aug 2021 19:27:00 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav415.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 174AQx5B083499
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 4 Aug 2021 19:26:59 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: [PATCH v4] Bluetooth: defer cleanup of resources in
 hci_unregister_dev()
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        LinMa <linma@zju.edu.cn>
References: <290fe7c7-c14f-8685-af09-419faa0e4d1f@i-love.sakura.ne.jp>
 <CAHk-=wgRzabeP3CLZmFWO5EXrqWSvSL8uKwbSYRWw2xT9RVBrQ@mail.gmail.com>
 <c8cf9848-1405-af75-6f05-b7b82c2619a7@i-love.sakura.ne.jp>
Message-ID: <e9e2738d-78a7-1def-a86f-937951d139a7@i-love.sakura.ne.jp>
Date:   Wed, 4 Aug 2021 19:26:56 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <c8cf9848-1405-af75-6f05-b7b82c2619a7@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

syzbot is hitting might_sleep() warning at hci_sock_dev_event()
due to calling lock_sock() with rw spinlock held [1].

It seems that history of this locking problem is a trial and error.

Commit b40df5743ee8aed8 ("[PATCH] bluetooth: fix socket locking in
hci_sock_dev_event()") in 2.6.21-rc4 changed bh_lock_sock() to lock_sock()
as an attempt to fix lockdep warning.

Then, commit 4ce61d1c7a8ef4c1 ("[BLUETOOTH]: Fix locking in
hci_sock_dev_event().") in 2.6.22-rc2 changed lock_sock() to
local_bh_disable() + bh_lock_sock_nested() as an attempt to fix
sleep in atomic context warning.

Then, commit 4b5dd696f81b210c ("Bluetooth: Remove local_bh_disable() from
hci_sock.c") in 3.3-rc1 removed local_bh_disable().

Then, commit e305509e678b3a4a ("Bluetooth: use correct lock to prevent UAF
of hdev object") in 5.13-rc5 again changed bh_lock_sock_nested() to
lock_sock() as an attempt to fix CVE-2021-3573.

This difficulty comes from current implementation that
hci_sock_dev_event(HCI_DEV_UNREG) is responsible for dropping all
references from sockets because hci_unregister_dev() immediately reclaims
resources as soon as returning from hci_sock_dev_event(HCI_DEV_UNREG).
But the history suggests that hci_sock_dev_event(HCI_DEV_UNREG) was not
doing what it should do.

Therefore, instead of trying to detach sockets from device, let's accept
not detaching sockets from device at hci_sock_dev_event(HCI_DEV_UNREG),
by moving actual cleanup of resources from hci_unregister_dev() to
hci_cleanup_dev() which is called by bt_host_release() when all references
to this unregistered device (which is a kobject) are gone.

Since hci_sock_dev_event(HCI_DEV_UNREG) no longer resets hci_pi(sk)->hdev,
we need to check whether this device was unregistered and return an error
based on HCI_UNREGISTER flag. There might be subtle behavioral difference
in "monitor the hdev" functionality; please report if you found something
went wrong due to this patch.

Link: https://syzkaller.appspot.com/bug?extid=a5df189917e79d5e59c9 [1]
Reported-by: syzbot <syzbot+a5df189917e79d5e59c9@syzkaller.appspotmail.com>
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Fixes: e305509e678b3a4a ("Bluetooth: use correct lock to prevent UAF of hdev object")
---
v4: Don't touch "monitor the hdev" functions.

v3: Unexport hci_unregister_dev because only bt_host_release calls it
    and both hci_core.o and hci_sysfs.o are combined into bluetooth.o.

    Rename hci_release_dev to hci_cleanup_dev and call it only when
    HCI_UNREGISTER was set, for syzbot
    <syzbot+47c6d0efbb7fe2f7a5b8@syzkaller.appspotmail.com> is reporting
    that bt_host_release might be called without hci_register_dev and
    hci_unregister_dev.

    Return -EPIPE instead of 0 if HCI_UNREGISTER was set, in order to
    make sure that userspace finds that the device was unregistred.

v2: Add hci_release_dev and make bt_host_release call it instead of making
    bt_host_release public.

 include/net/bluetooth/hci_core.h |  1 +
 net/bluetooth/hci_core.c         | 16 +++++------
 net/bluetooth/hci_sock.c         | 49 +++++++++++++++++++++-----------
 net/bluetooth/hci_sysfs.c        |  3 ++
 4 files changed, 45 insertions(+), 24 deletions(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index a53e94459ecd..db4312e44d47 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -1230,6 +1230,7 @@ struct hci_dev *hci_alloc_dev(void);
 void hci_free_dev(struct hci_dev *hdev);
 int hci_register_dev(struct hci_dev *hdev);
 void hci_unregister_dev(struct hci_dev *hdev);
+void hci_cleanup_dev(struct hci_dev *hdev);
 int hci_suspend_dev(struct hci_dev *hdev);
 int hci_resume_dev(struct hci_dev *hdev);
 int hci_reset_dev(struct hci_dev *hdev);
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 2560ed2f144d..e1a545c8a69f 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3996,14 +3996,10 @@ EXPORT_SYMBOL(hci_register_dev);
 /* Unregister HCI device */
 void hci_unregister_dev(struct hci_dev *hdev)
 {
-	int id;
-
 	BT_DBG("%p name %s bus %d", hdev, hdev->name, hdev->bus);
 
 	hci_dev_set_flag(hdev, HCI_UNREGISTER);
 
-	id = hdev->id;
-
 	write_lock(&hci_dev_list_lock);
 	list_del(&hdev->list);
 	write_unlock(&hci_dev_list_lock);
@@ -4038,7 +4034,14 @@ void hci_unregister_dev(struct hci_dev *hdev)
 	}
 
 	device_del(&hdev->dev);
+	/* Actual cleanup is deferred until hci_cleanup_dev(). */
+	hci_dev_put(hdev);
+}
+EXPORT_SYMBOL(hci_unregister_dev);
 
+/* Cleanup HCI device */
+void hci_cleanup_dev(struct hci_dev *hdev)
+{
 	debugfs_remove_recursive(hdev->debugfs);
 	kfree_const(hdev->hw_info);
 	kfree_const(hdev->fw_info);
@@ -4063,11 +4066,8 @@ void hci_unregister_dev(struct hci_dev *hdev)
 	hci_blocked_keys_clear(hdev);
 	hci_dev_unlock(hdev);
 
-	hci_dev_put(hdev);
-
-	ida_simple_remove(&hci_index_ida, id);
+	ida_simple_remove(&hci_index_ida, hdev->id);
 }
-EXPORT_SYMBOL(hci_unregister_dev);
 
 /* Suspend HCI device */
 int hci_suspend_dev(struct hci_dev *hdev)
diff --git a/net/bluetooth/hci_sock.c b/net/bluetooth/hci_sock.c
index b04a5a02ecf3..f1128c2134f0 100644
--- a/net/bluetooth/hci_sock.c
+++ b/net/bluetooth/hci_sock.c
@@ -59,6 +59,17 @@ struct hci_pinfo {
 	char              comm[TASK_COMM_LEN];
 };
 
+static struct hci_dev *hci_hdev_from_sock(struct sock *sk)
+{
+	struct hci_dev *hdev = hci_pi(sk)->hdev;
+
+	if (!hdev)
+		return ERR_PTR(-EBADFD);
+	if (hci_dev_test_flag(hdev, HCI_UNREGISTER))
+		return ERR_PTR(-EPIPE);
+	return hdev;
+}
+
 void hci_sock_set_flag(struct sock *sk, int nr)
 {
 	set_bit(nr, &hci_pi(sk)->flags);
@@ -759,19 +770,13 @@ void hci_sock_dev_event(struct hci_dev *hdev, int event)
 	if (event == HCI_DEV_UNREG) {
 		struct sock *sk;
 
-		/* Detach sockets from device */
+		/* Wake up sockets using this dead device */
 		read_lock(&hci_sk_list.lock);
 		sk_for_each(sk, &hci_sk_list.head) {
-			lock_sock(sk);
 			if (hci_pi(sk)->hdev == hdev) {
-				hci_pi(sk)->hdev = NULL;
 				sk->sk_err = EPIPE;
-				sk->sk_state = BT_OPEN;
 				sk->sk_state_change(sk);
-
-				hci_dev_put(hdev);
 			}
-			release_sock(sk);
 		}
 		read_unlock(&hci_sk_list.lock);
 	}
@@ -930,10 +935,10 @@ static int hci_sock_reject_list_del(struct hci_dev *hdev, void __user *arg)
 static int hci_sock_bound_ioctl(struct sock *sk, unsigned int cmd,
 				unsigned long arg)
 {
-	struct hci_dev *hdev = hci_pi(sk)->hdev;
+	struct hci_dev *hdev = hci_hdev_from_sock(sk);
 
-	if (!hdev)
-		return -EBADFD;
+	if (IS_ERR(hdev))
+		return PTR_ERR(hdev);
 
 	if (hci_dev_test_flag(hdev, HCI_USER_CHANNEL))
 		return -EBUSY;
@@ -1103,6 +1108,18 @@ static int hci_sock_bind(struct socket *sock, struct sockaddr *addr,
 
 	lock_sock(sk);
 
+	/* Allow detaching from dead device and attaching to alive device, if
+	 * the caller wants to re-bind (instead of close) this socket in
+	 * response to hci_sock_dev_event(HCI_DEV_UNREG) notification.
+	 */
+	hdev = hci_pi(sk)->hdev;
+	if (hdev && hci_dev_test_flag(hdev, HCI_UNREGISTER)) {
+		hci_pi(sk)->hdev = NULL;
+		sk->sk_state = BT_OPEN;
+		hci_dev_put(hdev);
+	}
+	hdev = NULL;
+
 	if (sk->sk_state == BT_BOUND) {
 		err = -EALREADY;
 		goto done;
@@ -1379,9 +1396,9 @@ static int hci_sock_getname(struct socket *sock, struct sockaddr *addr,
 
 	lock_sock(sk);
 
-	hdev = hci_pi(sk)->hdev;
-	if (!hdev) {
-		err = -EBADFD;
+	hdev = hci_hdev_from_sock(sk);
+	if (IS_ERR(hdev)) {
+		err = PTR_ERR(hdev);
 		goto done;
 	}
 
@@ -1743,9 +1760,9 @@ static int hci_sock_sendmsg(struct socket *sock, struct msghdr *msg,
 		goto done;
 	}
 
-	hdev = hci_pi(sk)->hdev;
-	if (!hdev) {
-		err = -EBADFD;
+	hdev = hci_hdev_from_sock(sk);
+	if (IS_ERR(hdev)) {
+		err = PTR_ERR(hdev);
 		goto done;
 	}
 
diff --git a/net/bluetooth/hci_sysfs.c b/net/bluetooth/hci_sysfs.c
index 9874844a95a9..b69d88b88d2e 100644
--- a/net/bluetooth/hci_sysfs.c
+++ b/net/bluetooth/hci_sysfs.c
@@ -83,6 +83,9 @@ void hci_conn_del_sysfs(struct hci_conn *conn)
 static void bt_host_release(struct device *dev)
 {
 	struct hci_dev *hdev = to_hci_dev(dev);
+
+	if (hci_dev_test_flag(hdev, HCI_UNREGISTER))
+		hci_cleanup_dev(hdev);
 	kfree(hdev);
 	module_put(THIS_MODULE);
 }
-- 
2.18.4


