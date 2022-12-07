Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9CA76451F0
	for <lists+linux-bluetooth@lfdr.de>; Wed,  7 Dec 2022 03:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbiLGCVJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 6 Dec 2022 21:21:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbiLGCU5 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 6 Dec 2022 21:20:57 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 398E754459
        for <linux-bluetooth@vger.kernel.org>; Tue,  6 Dec 2022 18:20:55 -0800 (PST)
Received: from dggpemm500007.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NRgsZ67nZzJnQc;
        Wed,  7 Dec 2022 10:17:22 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 7 Dec
 2022 10:20:53 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <marcel@holtmann.org>, <johan.hedberg@gmail.com>,
        <luiz.dentz@gmail.com>
CC:     <linux-bluetooth@vger.kernel.org>, <yangyingliang@huawei.com>
Subject: [PATCH v2 1/6] Bluetooth: hci_qca: don't call kfree_skb() under spin_lock_irqsave()
Date:   Wed, 7 Dec 2022 10:18:30 +0800
Message-ID: <20221207021835.3012559-2-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221207021835.3012559-1-yangyingliang@huawei.com>
References: <20221207021835.3012559-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

It is not allowed to call kfree_skb() from hardware interrupt
context or with interrupts being disabled. So replace kfree_skb()
with dev_kfree_skb_irq() under spin_lock_irqsave().

Fixes: 0ff252c1976d ("Bluetooth: hciuart: Add support QCA chipset for UART")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/bluetooth/hci_qca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 8df11016fd51..bae9b2a408d9 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -912,7 +912,7 @@ static int qca_enqueue(struct hci_uart *hu, struct sk_buff *skb)
 	default:
 		BT_ERR("Illegal tx state: %d (losing packet)",
 		       qca->tx_ibs_state);
-		kfree_skb(skb);
+		dev_kfree_skb_irq(skb);
 		break;
 	}
 
-- 
2.25.1

