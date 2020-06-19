Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB2A2002FC
	for <lists+linux-bluetooth@lfdr.de>; Fri, 19 Jun 2020 09:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730725AbgFSHuG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 19 Jun 2020 03:50:06 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:41664 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729548AbgFSHuG (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 19 Jun 2020 03:50:06 -0400
Received: from localhost.localdomain (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id 8FAF7CECF0
        for <linux-bluetooth@vger.kernel.org>; Fri, 19 Jun 2020 09:59:56 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH] Bluetooth: Fix debug statement with double endian conversion
Date:   Fri, 19 Jun 2020 09:50:00 +0200
Message-Id: <20200619075000.138897-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The current_flags field is already in CPU endian and so no need to
convert it again from little-endian.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 net/bluetooth/mgmt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 2a732cab1dc9..a27620ba7f3d 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -3950,8 +3950,7 @@ static int set_device_flags(struct sock *sk, struct hci_dev *hdev, void *data,
 	u32 current_flags = __le32_to_cpu(cp->current_flags);
 
 	bt_dev_dbg(hdev, "Set device flags %pMR (type 0x%x) = 0x%x",
-		   &cp->addr.bdaddr, cp->addr.type,
-		   __le32_to_cpu(current_flags));
+		   &cp->addr.bdaddr, cp->addr.type, current_flags);
 
 	if ((supported_flags | current_flags) != supported_flags) {
 		bt_dev_warn(hdev, "Bad flag given (0x%x) vs supported (0x%0x)",
-- 
2.26.2

