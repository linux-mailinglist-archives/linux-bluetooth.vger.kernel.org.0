Return-Path: <linux-bluetooth+bounces-2468-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F13387A296
	for <lists+linux-bluetooth@lfdr.de>; Wed, 13 Mar 2024 06:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A5651C219AE
	for <lists+linux-bluetooth@lfdr.de>; Wed, 13 Mar 2024 05:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4077C11738;
	Wed, 13 Mar 2024 05:11:25 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 0454714005
	for <linux-bluetooth@vger.kernel.org>; Wed, 13 Mar 2024 05:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710306684; cv=none; b=W6jUGP5PXYbnV0GL3P8xSmuhwcOJ73QdfpXAr4yoP3oQUppk114Oez5UE/llfBZrsmwpbI9zSjT8qSp2xYiAkSQWcei8cglj8+s6wAdeam44tZsG3Y5HM42R8kPmnPcPMFOqRknL43ZVomMHWCOtwGMR6+e6Xsj7GHqJwRtFvYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710306684; c=relaxed/simple;
	bh=20ls82YLtZTjVQoQFdVO2vHSOfswcwvM4SUaEClj+nM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dY8x3ZVe6tnh+bXRK5T1UaawaLoX8kEWIAHVIjSn5xdYMO2iFzZMlCT0YjNSGyDK1fWSDsRy06cqSov3HXEKAoG6+0wkz765ypPWgmwhFcYT89UCZWNWPVdBhAQLTLKufJc6xHO+ulZto4YGkY7GobRQeIKGvx2RIxJfdgHRN0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [103.163.180.2])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 3E0FC602637F2;
	Wed, 13 Mar 2024 13:11:15 +0800 (CST)
X-MD-Sfrom: youwan@nfschina.com
X-MD-SrcIP: 103.163.180.2
From: Youwan Wang <youwan@nfschina.com>
To: marcel@holtmann.org
Cc: johan.hedberg@gmail.com,
	luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org,
	Youwan Wang <youwan@nfschina.com>
Subject: [V1] Bluetooth: btusb: Add return error code
Date: Wed, 13 Mar 2024 13:11:02 +0800
Message-Id: <20240313051102.424926-1-youwan@nfschina.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add return error code

Signed-off-by: Youwan Wang <youwan@nfschina.com>
---
 drivers/bluetooth/btusb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index b8e9de887b5d..ec6bdc9687b1 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2826,8 +2826,10 @@ static int btusb_mtk_hci_wmt_sync(struct hci_dev *hdev,
 		goto err_free_wc;
 	}
 
-	if (data->evt_skb == NULL)
+	if (data->evt_skb == NULL) {
+		err = -ENOBUFS;
 		goto err_free_wc;
+	}
 
 	/* Parse and handle the return WMT event */
 	wmt_evt = (struct btmtk_hci_wmt_evt *)data->evt_skb->data;
-- 
2.25.1


