Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACAF1A3330
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 Apr 2020 13:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgDIL2R (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 Apr 2020 07:28:17 -0400
Received: from mail.weplayciv.com ([162.221.200.53]:60066 "EHLO
        mail.weplayciv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgDIL2P (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 Apr 2020 07:28:15 -0400
X-Greylist: delayed 558 seconds by postgrey-1.27 at vger.kernel.org; Thu, 09 Apr 2020 07:28:15 EDT
Received: from midgard.internal.axentia.se (h87-96-186-165.cust.a3fiber.se [87.96.186.165])
        by mail.weplayciv.com (Postfix) with ESMTPA id CC82B208C716;
        Thu,  9 Apr 2020 04:18:54 -0700 (PDT)
From:   daniels@umanovskis.se
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-bluetooth@vger.kernel.org, Daniels Umanovskis <du@axentia.se>
Subject: [PATCH] Bluetooth: log advertisement packet length if it gets corrected
Date:   Thu,  9 Apr 2020 13:18:29 +0200
Message-Id: <20200409111829.9508-1-daniels@umanovskis.se>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Daniels Umanovskis <du@axentia.se>

The error could indicate a problem with the Bluetooth device. It
is easier to investigate if the packet's actual length gets logged,
not just the fact that a discrepancy occurred.

Signed-off-by: Daniels Umanovskis <du@axentia.se>
---
 net/bluetooth/hci_event.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 0a591be8b0ae..af7fa7ef94ed 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -5353,7 +5353,8 @@ static void process_adv_report(struct hci_dev *hdev, u8 type, bdaddr_t *bdaddr,
 
 	/* Adjust for actual length */
 	if (len != real_len) {
-		bt_dev_err_ratelimited(hdev, "advertising data len corrected");
+		bt_dev_err_ratelimited(hdev, "advertising data len corrected %u -> %u",
+				       len, real_len);
 		len = real_len;
 	}
 
-- 
2.20.1

