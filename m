Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B22E11A1894
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Apr 2020 01:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgDGXZ2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Apr 2020 19:25:28 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:49216 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgDGXZ2 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Apr 2020 19:25:28 -0400
Received: from localhost.localdomain (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id D5410CECDD
        for <linux-bluetooth@vger.kernel.org>; Wed,  8 Apr 2020 01:35:01 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH] Bluetooth: Enable LE Enhanced Connection Complete event.
Date:   Wed,  8 Apr 2020 01:25:23 +0200
Message-Id: <20200407232523.1013507-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

In case LL Privacy is supported by the controller, it is also a good
idea to use the LE Enhanced Connection Complete event for getting all
information about the new connection and its addresses.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 net/bluetooth/hci_core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index fb210f7ab7ab..d8d543e3dc9f 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -638,6 +638,14 @@ static int hci_init3_req(struct hci_request *req, unsigned long opt)
 		if (hdev->le_features[0] & HCI_LE_DATA_LEN_EXT)
 			events[0] |= 0x40;	/* LE Data Length Change */
 
+		/* If the controller supports LL Privacy feature, enable
+		 * the corresponding event.
+		 */
+		if (hdev->le_features[0] & HCI_LE_LL_PRIVACY)
+			events[1] |= 0x02;	/* LE Enhanced Connection
+						 * Complete
+						 */
+
 		/* If the controller supports Extended Scanner Filter
 		 * Policies, enable the correspondig event.
 		 */
-- 
2.25.2

