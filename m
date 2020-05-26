Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E276A1AABFB
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 Apr 2020 17:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1414739AbgDOPf1 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 Apr 2020 11:35:27 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:44238 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1414737AbgDOPf0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 Apr 2020 11:35:26 -0400
Received: from localhost.localdomain (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 0F1ADCECEE
        for <linux-bluetooth@vger.kernel.org>; Wed, 15 Apr 2020 17:44:59 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH] Bluetooth: Enhanced Connection Complete event belongs to LL Privacy
Date:   Wed, 15 Apr 2020 17:35:16 +0200
Message-Id: <20200415153516.38267-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The Enhanced Connection Complete event is use in conjunction with LL
Privacy and not Extended Advertising.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 net/bluetooth/hci_core.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 0d726d59a492..51d399273276 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -719,14 +719,6 @@ static int hci_init3_req(struct hci_request *req, unsigned long opt)
 						 * Report
 						 */
 
-		/* If the controller supports the LE Extended Create Connection
-		 * command, enable the corresponding event.
-		 */
-		if (use_ext_conn(hdev))
-			events[1] |= 0x02;      /* LE Enhanced Connection
-						 * Complete
-						 */
-
 		/* If the controller supports the LE Extended Advertising
 		 * command, enable the corresponding event.
 		 */
-- 
2.25.2

