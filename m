Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9D8354FE8
	for <lists+linux-bluetooth@lfdr.de>; Tue,  6 Apr 2021 11:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232440AbhDFJbW (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 6 Apr 2021 05:31:22 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:44014 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbhDFJbW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 6 Apr 2021 05:31:22 -0400
Received: from localhost.localdomain (p4ff9fed5.dip0.t-ipconnect.de [79.249.254.213])
        by mail.holtmann.org (Postfix) with ESMTPSA id 881A6CED1E
        for <linux-bluetooth@vger.kernel.org>; Tue,  6 Apr 2021 11:38:56 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH] Bluetooth: Fix default values for advertising interval
Date:   Tue,  6 Apr 2021 11:31:09 +0200
Message-Id: <20210406093109.196954-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The DISCOV_LE_FAST_ADV_INT_{MIN,MAX} contants are in msec, but then used
later on directly while it is suppose to be N * 0.625 ms according to
the Bluetooth Core specification.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 include/net/bluetooth/hci_core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 6288518fe096..1101589422d8 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -1754,8 +1754,8 @@ void hci_mgmt_chan_unregister(struct hci_mgmt_chan *c);
 #define DISCOV_INTERLEAVED_INQUIRY_LEN	0x04
 #define DISCOV_BREDR_INQUIRY_LEN	0x08
 #define DISCOV_LE_RESTART_DELAY		msecs_to_jiffies(200)	/* msec */
-#define DISCOV_LE_FAST_ADV_INT_MIN     100     /* msec */
-#define DISCOV_LE_FAST_ADV_INT_MAX     150     /* msec */
+#define DISCOV_LE_FAST_ADV_INT_MIN	0x00A0	/* 100 msec */
+#define DISCOV_LE_FAST_ADV_INT_MAX	0x00F0	/* 150 msec */
 
 void mgmt_fill_version_info(void *ver);
 int mgmt_new_settings(struct hci_dev *hdev);
-- 
2.30.2

