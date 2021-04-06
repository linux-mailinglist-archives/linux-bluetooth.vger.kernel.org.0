Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0159C355C99
	for <lists+linux-bluetooth@lfdr.de>; Tue,  6 Apr 2021 21:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233018AbhDFT4N (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 6 Apr 2021 15:56:13 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:44360 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235595AbhDFT4K (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 6 Apr 2021 15:56:10 -0400
Received: from localhost.localdomain (p4ff9f418.dip0.t-ipconnect.de [79.249.244.24])
        by mail.holtmann.org (Postfix) with ESMTPSA id 2E712CECC8
        for <linux-bluetooth@vger.kernel.org>; Tue,  6 Apr 2021 22:03:44 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v3 4/5] Bluetooth: Set defaults for le_scan_{int,window}_adv_monitor
Date:   Tue,  6 Apr 2021 21:55:55 +0200
Message-Id: <20210406195556.316663-4-marcel@holtmann.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The le_scan_{int,window}_adv_monitor settings have not been set with a
sensible default.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 net/bluetooth/hci_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 0da9b3274986..fd12f1652bdf 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3763,6 +3763,8 @@ struct hci_dev *hci_alloc_dev(void)
 	hdev->le_scan_window_suspend = 0x0012;
 	hdev->le_scan_int_discovery = DISCOV_LE_SCAN_INT;
 	hdev->le_scan_window_discovery = DISCOV_LE_SCAN_WIN;
+	hdev->le_scan_int_adv_monitor = 0x0060;
+	hdev->le_scan_window_adv_monitor = 0x0030;
 	hdev->le_scan_int_connect = 0x0060;
 	hdev->le_scan_window_connect = 0x0060;
 	hdev->le_conn_min_interval = 0x0018;
-- 
2.30.2

