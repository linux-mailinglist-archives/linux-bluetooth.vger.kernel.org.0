Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE77C323EEF
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Feb 2021 14:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235733AbhBXNzn (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 24 Feb 2021 08:55:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:60442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232560AbhBXNSk (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 24 Feb 2021 08:18:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5225764FBD;
        Wed, 24 Feb 2021 12:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614171371;
        bh=2VEWJFvAyHgCa3YCluySt2gJ7YbrW0/7fKfgFoWYJMs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OCli3l0FsSmJvk14bhqzDxUidV/EnwiuKNIspqBVmG+yVAi8DFhUo2fX72GxQBl2T
         NUhl9dNUxHD7wgGSJTl5XIHX52oLVQh0uNTxq2Ev4edZ6uHzcK/BvjJ8i8cOHPFwIS
         24uPHVfbAyGwrAKCT3aEUGWNEHiCwvo/8LrhdN51sbsCbAE7YWtS3VNW9DePagjtkQ
         drmnLmEVvrFMBmAhJFzlSapOo/00dHt1g8VD97lq09dqyPoM7k65QqczVkGUAR5aQm
         raZSbHfPqf9JEnqWYC1zLFm/os/f9fAYKmBxgo/ZlCljDx1lM0yoFPeCOfcZAnogjm
         Q/zq+cc/kQjmg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Gopal Tiwari <gtiwari@redhat.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 08/11] Bluetooth: Fix null pointer dereference in amp_read_loc_assoc_final_data
Date:   Wed, 24 Feb 2021 07:55:56 -0500
Message-Id: <20210224125600.484437-8-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224125600.484437-1-sashal@kernel.org>
References: <20210224125600.484437-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Gopal Tiwari <gtiwari@redhat.com>

[ Upstream commit e8bd76ede155fd54d8c41d045dda43cd3174d506 ]

kernel panic trace looks like:

 #5 [ffffb9e08698fc80] do_page_fault at ffffffffb666e0d7
 #6 [ffffb9e08698fcb0] page_fault at ffffffffb70010fe
    [exception RIP: amp_read_loc_assoc_final_data+63]
    RIP: ffffffffc06ab54f  RSP: ffffb9e08698fd68  RFLAGS: 00010246
    RAX: 0000000000000000  RBX: ffff8c8845a5a000  RCX: 0000000000000004
    RDX: 0000000000000000  RSI: ffff8c8b9153d000  RDI: ffff8c8845a5a000
    RBP: ffffb9e08698fe40   R8: 00000000000330e0   R9: ffffffffc0675c94
    R10: ffffb9e08698fe58  R11: 0000000000000001  R12: ffff8c8b9cbf6200
    R13: 0000000000000000  R14: 0000000000000000  R15: ffff8c8b2026da0b
    ORIG_RAX: ffffffffffffffff  CS: 0010  SS: 0018
 #7 [ffffb9e08698fda8] hci_event_packet at ffffffffc0676904 [bluetooth]
 #8 [ffffb9e08698fe50] hci_rx_work at ffffffffc06629ac [bluetooth]
 #9 [ffffb9e08698fe98] process_one_work at ffffffffb66f95e7

hcon->amp_mgr seems NULL triggered kernel panic in following line inside
function amp_read_loc_assoc_final_data

        set_bit(READ_LOC_AMP_ASSOC_FINAL, &mgr->state);

Fixed by checking NULL for mgr.

Signed-off-by: Gopal Tiwari <gtiwari@redhat.com>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/bluetooth/amp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/bluetooth/amp.c b/net/bluetooth/amp.c
index e32f341890079..b01b43ab6f834 100644
--- a/net/bluetooth/amp.c
+++ b/net/bluetooth/amp.c
@@ -305,6 +305,9 @@ void amp_read_loc_assoc_final_data(struct hci_dev *hdev,
 	struct hci_request req;
 	int err = 0;
 
+	if (!mgr)
+		return;
+
 	cp.phy_handle = hcon->handle;
 	cp.len_so_far = cpu_to_le16(0);
 	cp.max_len = cpu_to_le16(hdev->amp_assoc_size);
-- 
2.27.0

