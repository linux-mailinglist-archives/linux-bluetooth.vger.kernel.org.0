Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9851338DE
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Jan 2020 02:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgAHB6r (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Jan 2020 20:58:47 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:8237 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726281AbgAHB6r (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Jan 2020 20:58:47 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 3B879F3BA94340F21B4D;
        Wed,  8 Jan 2020 09:58:46 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Wed, 8 Jan 2020 09:58:35 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
CC:     YueHaibing <yuehaibing@huawei.com>,
        <linux-bluetooth@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] Bluetooth: hci_qca: Remove set but not used variable 'opcode'
Date:   Wed, 8 Jan 2020 01:54:31 +0000
Message-ID: <20200108015431.51996-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/bluetooth/hci_qca.c: In function 'qca_controller_memdump':
drivers/bluetooth/hci_qca.c:980:6: warning:
 variable 'opcode' set but not used [-Wunused-but-set-variable]

It is never used since commit d841502c79e3 ("Bluetooth: hci_qca: Collect
controller memory dump during SSR"), so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/bluetooth/hci_qca.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 9392cc7f9908..c9a0c55ef832 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -977,7 +977,7 @@ static void qca_controller_memdump(struct work_struct *work)
 	struct qca_dump_size *dump;
 	char *memdump_buf;
 	char nullBuff[QCA_DUMP_PACKET_SIZE] = { 0 };
-	u16 opcode, seq_no;
+	u16 seq_no;
 	u32 dump_size;
 
 	while ((skb = skb_dequeue(&qca->rx_memdump_q))) {
@@ -993,7 +993,6 @@ static void qca_controller_memdump(struct work_struct *work)
 
 		qca->memdump_state = QCA_MEMDUMP_COLLECTING;
 		cmd_hdr = (void *) skb->data;
-		opcode = __le16_to_cpu(cmd_hdr->opcode);
 		seq_no = __le16_to_cpu(cmd_hdr->seq_no);
 		skb_pull(skb, sizeof(struct qca_memdump_event_hdr));



