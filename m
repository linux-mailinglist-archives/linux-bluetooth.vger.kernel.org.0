Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD9F0642B1C
	for <lists+linux-bluetooth@lfdr.de>; Mon,  5 Dec 2022 16:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbiLEPMF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 5 Dec 2022 10:12:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231924AbiLEPMA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 5 Dec 2022 10:12:00 -0500
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC541B8
        for <linux-bluetooth@vger.kernel.org>; Mon,  5 Dec 2022 07:11:59 -0800 (PST)
Received: from dggpemm500007.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NQn7L3tfNz15N33;
        Mon,  5 Dec 2022 23:11:10 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 5 Dec
 2022 23:11:56 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <marcel@holtmann.org>, <johan.hedberg@gmail.com>,
        <luiz.dentz@gmail.com>
CC:     <linux-bluetooth@vger.kernel.org>, <yangyingliang@huawei.com>
Subject: [PATCH 0/6] Bluetooth: don't call kfree_skb() under spin_lock_irqsave()
Date:   Mon, 5 Dec 2022 23:09:22 +0800
Message-ID: <20221205150928.4017973-1-yangyingliang@huawei.com>
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
trying to call kfree_skb() after spin_lock_irqsave().

Yang Yingliang (6):
  Bluetooth: hci_qca: don't call kfree_skb() under spin_lock_irqsave()
  Bluetooth: hci_ll: don't call kfree_skb() under spin_lock_irqsave()
  Bluetooth: hci_h5: don't call kfree_skb() under spin_lock_irqsave()
  Bluetooth: hci_bcsp: don't call kfree_skb() under spin_lock_irqsave()
  Bluetooth: hci_core: don't call kfree_skb() under spin_lock_irqsave()
  Bluetooth: RFCOMM: don't call kfree_skb() under spin_lock_irqsave()

 drivers/bluetooth/hci_bcsp.c | 6 +++++-
 drivers/bluetooth/hci_h5.c   | 6 +++++-
 drivers/bluetooth/hci_ll.c   | 3 ++-
 drivers/bluetooth/hci_qca.c  | 3 ++-
 net/bluetooth/hci_core.c     | 6 +++++-
 net/bluetooth/rfcomm/core.c  | 4 +++-
 6 files changed, 22 insertions(+), 6 deletions(-)

-- 
2.25.1

