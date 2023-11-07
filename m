Return-Path: <linux-bluetooth+bounces-10-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7027E3BE2
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Nov 2023 13:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 207ECB20D51
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Nov 2023 12:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1272C2E410;
	Tue,  7 Nov 2023 12:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hr2fpUp3"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E6E2E3FB
	for <linux-bluetooth@vger.kernel.org>; Tue,  7 Nov 2023 12:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7FF0C433C7;
	Tue,  7 Nov 2023 12:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699359032;
	bh=Y1ktz73axHvB1S6fM4tWRaj7MQKptp4lepIFDsFKEoc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hr2fpUp3uDywMaz1u9GOCCkYzaDnAtLtSH+P0tFZ0mn0rkhnMf8VRlNngHXSAUBcO
	 766tcb/oLHNt9HvLBOW+TMKiPc9MX7n1stNigkV4TPqsddoNAvF4LrVz9lTcf4QrLJ
	 sYbb2AiK5g0d3dW3MN15+j6fng0OfugXSDVslFonp5BA+pLUBFG7jXJjzYKwFFbXEI
	 vAF0kFYO5Z23jDv3N8yTfBULmHvdxynVxZPMnBjSCMPi2vd4JUGMUfwmmft5VAMW1K
	 StmV/qVc9itmhKJRSGOVKx4Pnv3X5/Rwuh97bKi5V8lnMsjomudMUMx4yUbgPt3Xzm
	 cTdn78UfjA6aA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: ZhengHan Wang <wzhmmmmm@gmail.com>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 24/30] Bluetooth: Fix double free in hci_conn_cleanup
Date: Tue,  7 Nov 2023 07:08:39 -0500
Message-ID: <20231107120922.3757126-24-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107120922.3757126-1-sashal@kernel.org>
References: <20231107120922.3757126-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
Content-Transfer-Encoding: 8bit

From: ZhengHan Wang <wzhmmmmm@gmail.com>

[ Upstream commit a85fb91e3d728bdfc80833167e8162cce8bc7004 ]

syzbot reports a slab use-after-free in hci_conn_hash_flush [1].
After releasing an object using hci_conn_del_sysfs in the
hci_conn_cleanup function, releasing the same object again
using the hci_dev_put and hci_conn_put functions causes a double free.
Here's a simplified flow:

hci_conn_del_sysfs:
  hci_dev_put
    put_device
      kobject_put
        kref_put
          kobject_release
            kobject_cleanup
              kfree_const
                kfree(name)

hci_dev_put:
  ...
    kfree(name)

hci_conn_put:
  put_device
    ...
      kfree(name)

This patch drop the hci_dev_put and hci_conn_put function
call in hci_conn_cleanup function, because the object is
freed in hci_conn_del_sysfs function.

This patch also fixes the refcounting in hci_conn_add_sysfs() and
hci_conn_del_sysfs() to take into account device_add() failures.

This fixes CVE-2023-28464.

Link: https://syzkaller.appspot.com/bug?id=1bb51491ca5df96a5f724899d1dbb87afda61419 [1]

Signed-off-by: ZhengHan Wang <wzhmmmmm@gmail.com>
Co-developed-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/bluetooth/hci_conn.c  |  6 ++----
 net/bluetooth/hci_sysfs.c | 23 ++++++++++++-----------
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index 6d6192f514d0f..c529ac4d7acf9 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -169,13 +169,11 @@ static void hci_conn_cleanup(struct hci_conn *conn)
 			hdev->notify(hdev, HCI_NOTIFY_CONN_DEL);
 	}
 
-	hci_conn_del_sysfs(conn);
-
 	debugfs_remove_recursive(conn->debugfs);
 
-	hci_dev_put(hdev);
+	hci_conn_del_sysfs(conn);
 
-	hci_conn_put(conn);
+	hci_dev_put(hdev);
 }
 
 static void hci_acl_create_connection(struct hci_conn *conn)
diff --git a/net/bluetooth/hci_sysfs.c b/net/bluetooth/hci_sysfs.c
index 15b33579007cb..367e32fe30eb8 100644
--- a/net/bluetooth/hci_sysfs.c
+++ b/net/bluetooth/hci_sysfs.c
@@ -35,7 +35,7 @@ void hci_conn_init_sysfs(struct hci_conn *conn)
 {
 	struct hci_dev *hdev = conn->hdev;
 
-	BT_DBG("conn %p", conn);
+	bt_dev_dbg(hdev, "conn %p", conn);
 
 	conn->dev.type = &bt_link;
 	conn->dev.class = &bt_class;
@@ -48,27 +48,30 @@ void hci_conn_add_sysfs(struct hci_conn *conn)
 {
 	struct hci_dev *hdev = conn->hdev;
 
-	BT_DBG("conn %p", conn);
+	bt_dev_dbg(hdev, "conn %p", conn);
 
 	if (device_is_registered(&conn->dev))
 		return;
 
 	dev_set_name(&conn->dev, "%s:%d", hdev->name, conn->handle);
 
-	if (device_add(&conn->dev) < 0) {
+	if (device_add(&conn->dev) < 0)
 		bt_dev_err(hdev, "failed to register connection device");
-		return;
-	}
-
-	hci_dev_hold(hdev);
 }
 
 void hci_conn_del_sysfs(struct hci_conn *conn)
 {
 	struct hci_dev *hdev = conn->hdev;
 
-	if (!device_is_registered(&conn->dev))
+	bt_dev_dbg(hdev, "conn %p", conn);
+
+	if (!device_is_registered(&conn->dev)) {
+		/* If device_add() has *not* succeeded, use *only* put_device()
+		 * to drop the reference count.
+		 */
+		put_device(&conn->dev);
 		return;
+	}
 
 	while (1) {
 		struct device *dev;
@@ -80,9 +83,7 @@ void hci_conn_del_sysfs(struct hci_conn *conn)
 		put_device(dev);
 	}
 
-	device_del(&conn->dev);
-
-	hci_dev_put(hdev);
+	device_unregister(&conn->dev);
 }
 
 static void bt_host_release(struct device *dev)
-- 
2.42.0


