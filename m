Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6369F1603D7
	for <lists+linux-bluetooth@lfdr.de>; Sun, 16 Feb 2020 12:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbgBPLUj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 16 Feb 2020 06:20:39 -0500
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:30671 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728009AbgBPLUj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 16 Feb 2020 06:20:39 -0500
Received: from localhost.localdomain ([93.22.36.246])
        by mwinf5d13 with ME
        id 3PLc220055JeL2d03PLcFQ; Sun, 16 Feb 2020 12:20:37 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 16 Feb 2020 12:20:37 +0100
X-ME-IP: 93.22.36.246
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] Bluetooth: Fix a typo in Kconfig
Date:   Sun, 16 Feb 2020 12:20:31 +0100
Message-Id: <20200216112031.19876-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

'internface' has an extra 'n'.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/bluetooth/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index f7aa2dc1ff85..ca0356dbbb08 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -216,7 +216,7 @@ config BT_HCIUART_RTL
 	select BT_RTL
 	help
 	  The Realtek protocol support enables Bluetooth HCI over 3-Wire
-	  serial port internface for Realtek Bluetooth controllers.
+	  serial port interface for Realtek Bluetooth controllers.
 
 	  Say Y here to compile support for Realtek protocol.
 
-- 
2.20.1

