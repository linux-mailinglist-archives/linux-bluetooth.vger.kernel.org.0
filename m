Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3F37E0494
	for <lists+linux-bluetooth@lfdr.de>; Fri,  3 Nov 2023 15:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377775AbjKCOVq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 3 Nov 2023 10:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjKCOVn (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 3 Nov 2023 10:21:43 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DE21BD
        for <linux-bluetooth@vger.kernel.org>; Fri,  3 Nov 2023 07:21:34 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cc4f777ab9so17559475ad.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 03 Nov 2023 07:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699021293; x=1699626093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XIqurfFq1kf9lcUx0Yx/ZU30I1qIVRd4mCBlnVtaM7M=;
        b=GKCJw8KBjyMratxKjUPgEDeP+nnQ4TwTeEQOPd+0+CaMM7OtyaQEazvgCOoXl2lPa8
         TCBt6DtGNtGYJzjTccwhh6Yyi8hSrHSxRZQiex7xNFtFJy0XY87QFUmRyaf86UnKUWvA
         oisbHrh4u8uJgpU5r/qGIrkY60OVeIZ+5gKgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699021293; x=1699626093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIqurfFq1kf9lcUx0Yx/ZU30I1qIVRd4mCBlnVtaM7M=;
        b=KTgANIcbpYVKDPW08jG+kBgCHz7yvFsPE8DFXMUfAQhv3YW2MTEKNUEa9iTifFauhZ
         wFCvu3hIswYiFgrHPWpVEN+GPWup9YLBR46jbuvZNkqtbXwERvAiNZJJdIK26dlr+q3M
         1TLdMQGAT5j/eyMdAC2ZrdLUa8l73+HVdCkH6UrS2neqwlWOJjjq9CWf9cJZ9itgqGlE
         kY7C4AU3AwxgczEUip62l2n/jufhO9OI4M+c9M2nk4JSm5HVoU/2/8X4WV84k5DurkCS
         E3Z6a/4tyThiUuEA+iDGQOZk9dcqc2XFeTBRNdXB6q1Ol3URzMsyE6btB86chRz19oD6
         XIIw==
X-Gm-Message-State: AOJu0YyQ/A98e5Iz4zX/I9JnSlqZv9xXCTb81dnRL9F2GAM9rosgTjYk
        APWA8eN9wSZpciQbFCPirOBqpVoDW0hdU6AOQdI=
X-Google-Smtp-Source: AGHT+IGPBKrd3C1Wtte1om1voImy+1yN7lEOe8ph1eP0JhyHKmsOkf/1XBkLvJjV6TCHBYVDkzmwRg==
X-Received: by 2002:a17:903:2342:b0:1cc:4cf7:2f5 with SMTP id c2-20020a170903234200b001cc4cf702f5mr16496438plh.35.1699021293369;
        Fri, 03 Nov 2023 07:21:33 -0700 (PDT)
Received: from localhost (231.137.80.34.bc.googleusercontent.com. [34.80.137.231])
        by smtp.gmail.com with UTF8SMTPSA id a6-20020a170902ee8600b001c0a4146961sm1470983pld.19.2023.11.03.07.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 07:21:33 -0700 (PDT)
From:   Ying Hsu <yinghsu@chromium.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     luiz.dentz@gmail.com, linux-kernel@vger.kernel.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        Ying Hsu <yinghsu@chromium.org>
Subject: [PATCH] Bluetooth: Fix deadlock in vhci_send_frame
Date:   Fri,  3 Nov 2023 14:21:26 +0000
Message-ID: <20231103142126.3847457-1-yinghsu@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

syzbot found a potential circular dependency leading to a deadlock:
    -> #3 (&hdev->req_lock){+.+.}-{3:3}:
    __mutex_lock_common+0x1b6/0x1bc2 kernel/locking/mutex.c:599
    __mutex_lock kernel/locking/mutex.c:732 [inline]
    mutex_lock_nested+0x17/0x1c kernel/locking/mutex.c:784
    hci_dev_do_close+0x3f/0x9f net/bluetooth/hci_core.c:551
    hci_rfkill_set_block+0x130/0x1ac net/bluetooth/hci_core.c:935
    rfkill_set_block+0x1e6/0x3b8 net/rfkill/core.c:345
    rfkill_fop_write+0x2d8/0x672 net/rfkill/core.c:1274
    vfs_write+0x277/0xcf5 fs/read_write.c:594
    ksys_write+0x19b/0x2bd fs/read_write.c:650
    do_syscall_x64 arch/x86/entry/common.c:55 [inline]
    do_syscall_64+0x51/0xba arch/x86/entry/common.c:93
    entry_SYSCALL_64_after_hwframe+0x61/0xcb

    -> #2 (rfkill_global_mutex){+.+.}-{3:3}:
    __mutex_lock_common+0x1b6/0x1bc2 kernel/locking/mutex.c:599
    __mutex_lock kernel/locking/mutex.c:732 [inline]
    mutex_lock_nested+0x17/0x1c kernel/locking/mutex.c:784
    rfkill_register+0x30/0x7e3 net/rfkill/core.c:1045
    hci_register_dev+0x48f/0x96d net/bluetooth/hci_core.c:2622
    __vhci_create_device drivers/bluetooth/hci_vhci.c:341 [inline]
    vhci_create_device+0x3ad/0x68f drivers/bluetooth/hci_vhci.c:374
    vhci_get_user drivers/bluetooth/hci_vhci.c:431 [inline]
    vhci_write+0x37b/0x429 drivers/bluetooth/hci_vhci.c:511
    call_write_iter include/linux/fs.h:2109 [inline]
    new_sync_write fs/read_write.c:509 [inline]
    vfs_write+0xaa8/0xcf5 fs/read_write.c:596
    ksys_write+0x19b/0x2bd fs/read_write.c:650
    do_syscall_x64 arch/x86/entry/common.c:55 [inline]
    do_syscall_64+0x51/0xba arch/x86/entry/common.c:93
    entry_SYSCALL_64_after_hwframe+0x61/0xcb

    -> #1 (&data->open_mutex){+.+.}-{3:3}:
    __mutex_lock_common+0x1b6/0x1bc2 kernel/locking/mutex.c:599
    __mutex_lock kernel/locking/mutex.c:732 [inline]
    mutex_lock_nested+0x17/0x1c kernel/locking/mutex.c:784
    vhci_send_frame+0x68/0x9c drivers/bluetooth/hci_vhci.c:75
    hci_send_frame+0x1cc/0x2ff net/bluetooth/hci_core.c:2989
    hci_sched_acl_pkt net/bluetooth/hci_core.c:3498 [inline]
    hci_sched_acl net/bluetooth/hci_core.c:3583 [inline]
    hci_tx_work+0xb94/0x1a60 net/bluetooth/hci_core.c:3654
    process_one_work+0x901/0xfb8 kernel/workqueue.c:2310
    worker_thread+0xa67/0x1003 kernel/workqueue.c:2457
    kthread+0x36a/0x430 kernel/kthread.c:319
    ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:298

    -> #0 ((work_completion)(&hdev->tx_work)){+.+.}-{0:0}:
    check_prev_add kernel/locking/lockdep.c:3053 [inline]
    check_prevs_add kernel/locking/lockdep.c:3172 [inline]
    validate_chain kernel/locking/lockdep.c:3787 [inline]
    __lock_acquire+0x2d32/0x77fa kernel/locking/lockdep.c:5011
    lock_acquire+0x273/0x4d5 kernel/locking/lockdep.c:5622
    __flush_work+0xee/0x19f kernel/workqueue.c:3090
    hci_dev_close_sync+0x32f/0x1113 net/bluetooth/hci_sync.c:4352
    hci_dev_do_close+0x47/0x9f net/bluetooth/hci_core.c:553
    hci_rfkill_set_block+0x130/0x1ac net/bluetooth/hci_core.c:935
    rfkill_set_block+0x1e6/0x3b8 net/rfkill/core.c:345
    rfkill_fop_write+0x2d8/0x672 net/rfkill/core.c:1274
    vfs_write+0x277/0xcf5 fs/read_write.c:594
    ksys_write+0x19b/0x2bd fs/read_write.c:650
    do_syscall_x64 arch/x86/entry/common.c:55 [inline]
    do_syscall_64+0x51/0xba arch/x86/entry/common.c:93
    entry_SYSCALL_64_after_hwframe+0x61/0xcb

This change removes the need for acquiring the open_mutex in
vhci_send_frame, thus eliminating the potential deadlock while
maintaining the required packet ordering.

Fixes: 92d4abd66f70 ("Bluetooth: vhci: Fix race when opening vhci device")
Signed-off-by: Ying Hsu <yinghsu@chromium.org>
---
Tested this commit using a C reproducer on qemu-x86_64.

 drivers/bluetooth/hci_vhci.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_vhci.c b/drivers/bluetooth/hci_vhci.c
index f3892e9ce800..572d68d52965 100644
--- a/drivers/bluetooth/hci_vhci.c
+++ b/drivers/bluetooth/hci_vhci.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <asm/unaligned.h>
 
+#include <linux/atomic.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/slab.h>
@@ -44,6 +45,7 @@ struct vhci_data {
 	bool wakeup;
 	__u16 msft_opcode;
 	bool aosp_capable;
+	atomic_t initialized;
 };
 
 static int vhci_open_dev(struct hci_dev *hdev)
@@ -75,11 +77,10 @@ static int vhci_send_frame(struct hci_dev *hdev, struct sk_buff *skb)
 
 	memcpy(skb_push(skb, 1), &hci_skb_pkt_type(skb), 1);
 
-	mutex_lock(&data->open_mutex);
 	skb_queue_tail(&data->readq, skb);
-	mutex_unlock(&data->open_mutex);
 
-	wake_up_interruptible(&data->read_wait);
+	if (atomic_read(&data->initialized))
+		wake_up_interruptible(&data->read_wait);
 	return 0;
 }
 
@@ -464,7 +465,8 @@ static int __vhci_create_device(struct vhci_data *data, __u8 opcode)
 	skb_put_u8(skb, 0xff);
 	skb_put_u8(skb, opcode);
 	put_unaligned_le16(hdev->id, skb_put(skb, 2));
-	skb_queue_tail(&data->readq, skb);
+	skb_queue_head(&data->readq, skb);
+	atomic_inc(&data->initialized);
 
 	wake_up_interruptible(&data->read_wait);
 	return 0;
-- 
2.42.0.869.gea05f2083d-goog

