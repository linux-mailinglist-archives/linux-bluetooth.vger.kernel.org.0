Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1AF39AADD
	for <lists+linux-bluetooth@lfdr.de>; Thu,  3 Jun 2021 21:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhFCTWS (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 3 Jun 2021 15:22:18 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:42018 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbhFCTWQ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 3 Jun 2021 15:22:16 -0400
Received: from fedora.. (p4fefc9d6.dip0.t-ipconnect.de [79.239.201.214])
        by mail.holtmann.org (Postfix) with ESMTPSA id 57FE3CED24
        for <linux-bluetooth@vger.kernel.org>; Thu,  3 Jun 2021 21:28:27 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 5.13-rc4] Bluetooth: Fix VIRTIO_ID_BT assigned number
Date:   Thu,  3 Jun 2021 21:20:26 +0200
Message-Id: <20210603192026.185625-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

It turned out that the VIRTIO_ID_* are not assigned in the virtio_ids.h
file in the upstream kernel. Picking the next free one was wrong and
there is a process that has been followed now.

See https://github.com/oasis-tcs/virtio-spec/issues/108 for details.

Fixes: afd2daa26c7a ("Bluetooth: Add support for virtio transport driver")
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 include/uapi/linux/virtio_ids.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index f0c35ce8628c..4fe842c3a3a9 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -54,7 +54,7 @@
 #define VIRTIO_ID_SOUND			25 /* virtio sound */
 #define VIRTIO_ID_FS			26 /* virtio filesystem */
 #define VIRTIO_ID_PMEM			27 /* virtio pmem */
-#define VIRTIO_ID_BT			28 /* virtio bluetooth */
 #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
+#define VIRTIO_ID_BT			40 /* virtio bluetooth */
 
 #endif /* _LINUX_VIRTIO_IDS_H */
-- 
2.31.1

