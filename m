Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F346B6E209C
	for <lists+linux-bluetooth@lfdr.de>; Fri, 14 Apr 2023 12:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbjDNKUd (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 14 Apr 2023 06:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbjDNKU0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 14 Apr 2023 06:20:26 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521C88A62
        for <linux-bluetooth@vger.kernel.org>; Fri, 14 Apr 2023 03:20:20 -0700 (PDT)
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PyXR65K3ZzSsDp;
        Fri, 14 Apr 2023 18:16:18 +0800 (CST)
Received: from huawei.com (10.175.101.6) by canpemm500010.china.huawei.com
 (7.192.105.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 14 Apr
 2023 18:20:17 +0800
From:   Liu Jian <liujian56@huawei.com>
To:     <marcel@holtmann.org>, <johan.hedberg@gmail.com>,
        <luiz.dentz@gmail.com>, <zyytlz.wz@163.com>,
        <linux-bluetooth@vger.kernel.org>
CC:     <liujian56@huawei.com>
Subject: [PATCH Bluetooth] Revert "Bluetooth: btsdio: fix use after free bug in btsdio_remove due to unfinished work"
Date:   Fri, 14 Apr 2023 18:30:06 +0800
Message-ID: <20230414103006.200788-1-liujian56@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This reverts commit 1e9ac114c4428fdb7ff4635b45d4f46017e8916f.

This patch introduces a possible null-ptr-def problem. Revert it. And the
fixed bug by this patch have resolved by commit 73f7b171b7c0 ("Bluetooth:
btsdio: fix use after free bug in btsdio_remove due to race condition").

Fixes: 1e9ac114c442 ("Bluetooth: btsdio: fix use after free bug in btsdio_remove due to unfinished work")
Signed-off-by: Liu Jian <liujian56@huawei.com>
---
 drivers/bluetooth/btsdio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bluetooth/btsdio.c b/drivers/bluetooth/btsdio.c
index 51000320e1ea..f19d31ee37ea 100644
--- a/drivers/bluetooth/btsdio.c
+++ b/drivers/bluetooth/btsdio.c
@@ -354,7 +354,6 @@ static void btsdio_remove(struct sdio_func *func)
 
 	BT_DBG("func %p", func);
 
-	cancel_work_sync(&data->work);
 	if (!data)
 		return;
 
-- 
2.34.1

