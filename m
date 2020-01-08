Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 256691339EA
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Jan 2020 05:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgAHEDt (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Jan 2020 23:03:49 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:41662 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725908AbgAHEDs (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Jan 2020 23:03:48 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 579E4F99BDD60A28DFBC;
        Wed,  8 Jan 2020 12:03:46 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Wed, 8 Jan 2020 12:03:36 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-bluetooth@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] Bluetooth: hci_qca: Use vfree() instead of kfree()
Date:   Wed, 8 Jan 2020 03:59:31 +0000
Message-ID: <20200108035931.51209-1-weiyongjun1@huawei.com>
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

Use vfree() instead of kfree() to free vmalloc()
allocated data.

Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory dump during SSR")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/bluetooth/hci_qca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 9392cc7f9908..a17260641283 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -529,7 +529,7 @@ static void hci_memdump_timeout(struct timer_list *t)
 	bt_dev_err(hu->hdev, "clearing allocated memory due to memdump timeout");
 	/* Inject hw error event to reset the device and driver. */
 	hci_reset_dev(hu->hdev);
-	kfree(memdump_buf);
+	vfree(memdump_buf);
 	kfree(qca_memdump);
 	qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
 	del_timer(&qca->memdump_timer);
@@ -1437,7 +1437,7 @@ static void qca_wait_for_dump_collection(struct hci_dev *hdev)
 		bt_dev_err(hu->hdev, "Clearing the buffers due to timeout");
 		if (qca_memdump)
 			memdump_buf = qca_memdump->memdump_buf_tail;
-		kfree(memdump_buf);
+		vfree(memdump_buf);
 		kfree(qca_memdump);
 		qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
 		del_timer(&qca->memdump_timer);



