Return-Path: <linux-bluetooth+bounces-6233-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5577993295E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jul 2024 16:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FCCA284C70
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jul 2024 14:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A931B0118;
	Tue, 16 Jul 2024 14:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMpEdInU"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7D11B0103;
	Tue, 16 Jul 2024 14:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721140248; cv=none; b=P80ziTT+V7d8yvkxx4x6NtBSZXo9EIiX1bEzcnuoRt6Rpmg9XUsuY1BpUpEE71GIWu53rsWVMjI8IOxQMP9EHvo9bSe9AD3mSrqmnEtxbycnRTQyercoGkJGOnNzXvN/TRXfpMyM+MZbJEGGBZNJDwEvxD65WqQN9SRUwIhWi+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721140248; c=relaxed/simple;
	bh=rpt6V8R5x61DJSB/3S3GK2NF0QY8Ptd/pvj4btpY0Rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TcHdtOeDRVZv29QlqDLIRERSqfXiZQ0yOsez/lRWKfkrEdIvW4KUmARBh0u2rkyL/A6gANRJFfEFth1qOtDqThSgsqIxmFMJrQsacxuCw4fThBWuRhec3+DGy0xuTDbmj23cqXCxl21GQT+MK8cgtahX0cNJWz9tTLjCyBO/SzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMpEdInU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB1AC4AF0D;
	Tue, 16 Jul 2024 14:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721140248;
	bh=rpt6V8R5x61DJSB/3S3GK2NF0QY8Ptd/pvj4btpY0Rw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LMpEdInUazRO9PSVgW+8JJxTjTLipthdkNWquKHjSaw6xfY26pYQIVSEBX9DDW718
	 0b747CaKchzP0gnyN562iYenmEZ2gZ9iZwpOzzGGphemnEbiYp0sJZISBTDsCTsZG2
	 tp9ypOOS6epXr5taIemlXOIBn1oybD0fuqxSWIhvfCmPIcGNyfXxqsoLEb17vM0pq6
	 nkN6LcgFxq5bqdaMtfk/HEUZAslTiJdvFfsiVJE9O1wWcFKC2wXbmTS8YT1B7KFhUT
	 dUZOHA+5sKRClWoeHMitACto71lUNV4FU/rWCPymwNzYDwxraq0wNzW18cYE1rYaiZ
	 tLHVP9n85KWPQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	syzbot <syzbot+da0a9c9721e36db712e8@syzkaller.appspotmail.com>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 2/3] Bluetooth: hci_core: cancel all works upon hci_unregister_dev()
Date: Tue, 16 Jul 2024 10:30:41 -0400
Message-ID: <20240716143043.2714553-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716143043.2714553-1-sashal@kernel.org>
References: <20240716143043.2714553-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.317
Content-Transfer-Encoding: 8bit

From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

[ Upstream commit 0d151a103775dd9645c78c97f77d6e2a5298d913 ]

syzbot is reporting that calling hci_release_dev() from hci_error_reset()
due to hci_dev_put() from hci_error_reset() can cause deadlock at
destroy_workqueue(), for hci_error_reset() is called from
hdev->req_workqueue which destroy_workqueue() needs to flush.

We need to make sure that hdev->{rx_work,cmd_work,tx_work} which are
queued into hdev->workqueue and hdev->{power_on,error_reset} which are
queued into hdev->req_workqueue are no longer running by the moment

       destroy_workqueue(hdev->workqueue);
       destroy_workqueue(hdev->req_workqueue);

are called from hci_release_dev().

Call cancel_work_sync() on these work items from hci_unregister_dev()
as soon as hdev->list is removed from hci_dev_list.

Reported-by: syzbot <syzbot+da0a9c9721e36db712e8@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=da0a9c9721e36db712e8
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/bluetooth/hci_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 47f1eec0eb35f..504f6aa4e95db 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3288,7 +3288,11 @@ void hci_unregister_dev(struct hci_dev *hdev)
 	list_del(&hdev->list);
 	write_unlock(&hci_dev_list_lock);
 
+	cancel_work_sync(&hdev->rx_work);
+	cancel_work_sync(&hdev->cmd_work);
+	cancel_work_sync(&hdev->tx_work);
 	cancel_work_sync(&hdev->power_on);
+	cancel_work_sync(&hdev->error_reset);
 
 	hci_dev_do_close(hdev);
 
-- 
2.43.0


