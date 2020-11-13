Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEFF22B1B02
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Nov 2020 13:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgKMMUm (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 13 Nov 2020 07:20:42 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:8086 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbgKMMUk (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 13 Nov 2020 07:20:40 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CXbz15ffvzLxwk;
        Fri, 13 Nov 2020 19:36:45 +0800 (CST)
Received: from huawei.com (10.175.113.133) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Fri, 13 Nov 2020
 19:36:55 +0800
From:   Wang Hai <wanghai38@huawei.com>
To:     <davem@davemloft.net>, <kuba@kernel.org>, <marcel@holtmann.org>,
        <johan.hedberg@gmail.com>, <jpawlowski@google.com>
CC:     <linux-bluetooth@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH net] Bluetooth: Fix potential null pointer dereference in create_le_conn_complete
Date:   Fri, 13 Nov 2020 19:39:56 +0800
Message-ID: <20201113113956.52187-1-wanghai38@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.113.133]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The pointer 'conn' may be null. Before being used by
hci_connect_le_scan_cleanup(), The pointer 'conn' must be
checked whether it is null.

Fixes: 28a667c9c279 ("Bluetooth: advertisement handling in new connect procedure")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Hai <wanghai38@huawei.com>
---
 net/bluetooth/hci_conn.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index d0c1024bf600..6ca402c90ee1 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -757,6 +757,8 @@ static void create_le_conn_complete(struct hci_dev *hdev, u8 status, u16 opcode)
 	hci_dev_lock(hdev);
 
 	conn = hci_lookup_le_connect(hdev);
+	if (!conn)
+		goto done;
 
 	if (!status) {
 		hci_connect_le_scan_cleanup(conn);
@@ -766,9 +768,6 @@ static void create_le_conn_complete(struct hci_dev *hdev, u8 status, u16 opcode)
 	bt_dev_err(hdev, "request failed to create LE connection: "
 		   "status 0x%2.2x", status);
 
-	if (!conn)
-		goto done;
-
 	hci_le_conn_failed(conn, status);
 
 done:
-- 
2.17.1

