Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4232D6451F2
	for <lists+linux-bluetooth@lfdr.de>; Wed,  7 Dec 2022 03:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbiLGCVI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 6 Dec 2022 21:21:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbiLGCU4 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 6 Dec 2022 21:20:56 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADAB35437D
        for <linux-bluetooth@vger.kernel.org>; Tue,  6 Dec 2022 18:20:55 -0800 (PST)
Received: from dggpemm500007.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NRgwg6D7czRpl2;
        Wed,  7 Dec 2022 10:20:03 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 7 Dec
 2022 10:20:52 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <marcel@holtmann.org>, <johan.hedberg@gmail.com>,
        <luiz.dentz@gmail.com>
CC:     <linux-bluetooth@vger.kernel.org>, <yangyingliang@huawei.com>
Subject: [PATCH v2 0/6] Bluetooth: don't call kfree_skb() under spin_lock_irqsave()
Date:   Wed, 7 Dec 2022 10:18:29 +0800
Message-ID: <20221207021835.3012559-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
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
context or with interrupts being disabled. This patchset is
replace kfree_skb() with dev_kfree_skb_irq() under
spin_lock_irqsave().

v1 -> v2:
  Replace kfree_skb() with dev_kfree_skb_irq().

Yang Yingliang (6):
  Bluetooth: hci_qca: don't call kfree_skb() under spin_lock_irqsave()
  Bluetooth: hci_ll: don't call kfree_skb() under spin_lock_irqsave()
  Bluetooth: hci_h5: don't call kfree_skb() under spin_lock_irqsave()
  Bluetooth: hci_bcsp: don't call kfree_skb() under spin_lock_irqsave()
  Bluetooth: hci_core: don't call kfree_skb() under spin_lock_irqsave()
  Bluetooth: RFCOMM: don't call kfree_skb() under spin_lock_irqsave()

 drivers/bluetooth/hci_bcsp.c | 2 +-
 drivers/bluetooth/hci_h5.c   | 2 +-
 drivers/bluetooth/hci_ll.c   | 2 +-
 drivers/bluetooth/hci_qca.c  | 2 +-
 net/bluetooth/hci_core.c     | 2 +-
 net/bluetooth/rfcomm/core.c  | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.1

