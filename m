Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7AD1A16B4
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Apr 2020 22:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgDGUWy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Apr 2020 16:22:54 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:60168 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbgDGUWy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Apr 2020 16:22:54 -0400
Received: from localhost.localdomain (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 25F2DCECDC
        for <linux-bluetooth@vger.kernel.org>; Tue,  7 Apr 2020 22:32:27 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH] Bluetooth: Use extra variable to make code more readable
Date:   Tue,  7 Apr 2020 22:22:48 +0200
Message-Id: <20200407202248.994848-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

When starting active scanning for discovery the whitelist is not needed
to be used. So the filter_policy is 0x00. To make the core more readable
use a variable name instead of just setting 0 as paramter.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 net/bluetooth/hci_request.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index 14cfa59ea9ed..619647a11b95 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -2735,6 +2735,8 @@ static int active_scan(struct hci_request *req, unsigned long opt)
 	uint16_t interval = opt;
 	struct hci_dev *hdev = req->hdev;
 	u8 own_addr_type;
+	/* White list is not used for discovery */
+	u8 filter_policy = 0x00;
 	int err;
 
 	BT_DBG("%s", hdev->name);
@@ -2756,7 +2758,7 @@ static int active_scan(struct hci_request *req, unsigned long opt)
 		own_addr_type = ADDR_LE_DEV_PUBLIC;
 
 	hci_req_start_scan(req, LE_SCAN_ACTIVE, interval, DISCOV_LE_SCAN_WIN,
-			   own_addr_type, 0);
+			   own_addr_type, filter_policy);
 	return 0;
 }
 
-- 
2.25.2

