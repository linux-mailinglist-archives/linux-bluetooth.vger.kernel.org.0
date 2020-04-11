Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9D81A564D
	for <lists+linux-bluetooth@lfdr.de>; Sun, 12 Apr 2020 01:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730944AbgDKXPE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 11 Apr 2020 19:15:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:57330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730574AbgDKXPD (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 11 Apr 2020 19:15:03 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B716F216FD;
        Sat, 11 Apr 2020 23:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586646903;
        bh=j/J7T8YddQ1GP3noX8Bur2iaAUFZ2iuLy0+IRzGiSN4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZZ2gT/aBD3Grtbb5c7B6fnG4ZoTcAj6v3Nr9PulpwuByrjS5Ml1O6fInPrcAQpNL0
         4ntH8U2wE69IyKwYsM34gWdlMwLUDV/DL0SVXs2JIy9xHE4tZvXpbPnE+2j4FjD4tX
         hHigmy1oAmvef3/xOTd6kg1giObHcRBwD3YvBs1M=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Qiujun Huang <hqjagain@gmail.com>,
        syzbot+4496e82090657320efc6@syzkaller.appspotmail.com,
        Hillf Danton <hdanton@sina.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 13/16] Bluetooth: RFCOMM: fix ODEBUG bug in rfcomm_dev_ioctl
Date:   Sat, 11 Apr 2020 19:14:43 -0400
Message-Id: <20200411231447.27182-13-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411231447.27182-1-sashal@kernel.org>
References: <20200411231447.27182-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Qiujun Huang <hqjagain@gmail.com>

[ Upstream commit 71811cac8532b2387b3414f7cd8fe9e497482864 ]

Needn't call 'rfcomm_dlc_put' here, because 'rfcomm_dlc_exists' didn't
increase dlc->refcnt.

Reported-by: syzbot+4496e82090657320efc6@syzkaller.appspotmail.com
Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
Suggested-by: Hillf Danton <hdanton@sina.com>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/bluetooth/rfcomm/tty.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/bluetooth/rfcomm/tty.c b/net/bluetooth/rfcomm/tty.c
index 8e385a0ae60e0..939fbf7b352d4 100644
--- a/net/bluetooth/rfcomm/tty.c
+++ b/net/bluetooth/rfcomm/tty.c
@@ -413,10 +413,8 @@ static int __rfcomm_create_dev(struct sock *sk, void __user *arg)
 		dlc = rfcomm_dlc_exists(&req.src, &req.dst, req.channel);
 		if (IS_ERR(dlc))
 			return PTR_ERR(dlc);
-		else if (dlc) {
-			rfcomm_dlc_put(dlc);
+		if (dlc)
 			return -EBUSY;
-		}
 		dlc = rfcomm_dlc_alloc(GFP_KERNEL);
 		if (!dlc)
 			return -ENOMEM;
-- 
2.20.1

