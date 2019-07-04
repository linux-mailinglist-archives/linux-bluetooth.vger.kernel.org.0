Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A75375F328
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Jul 2019 09:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbfGDHBN (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 4 Jul 2019 03:01:13 -0400
Received: from mga02.intel.com ([134.134.136.20]:51103 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725879AbfGDHBM (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 4 Jul 2019 03:01:12 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jul 2019 00:01:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,449,1557212400"; 
   d="scan'208";a="169369174"
Received: from ingas-nuc1.sea.intel.com ([10.254.86.21])
  by orsmga006.jf.intel.com with ESMTP; 04 Jul 2019 00:01:12 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] emulator: Fix condition check in btdev_create()
Date:   Thu,  4 Jul 2019 00:01:10 -0700
Message-Id: <20190704070110.13815-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This fixes a case where logical '||' was used with constant operand
and the condition check always resulted in true.

Was: if (type == BTDEV_TYPE_BREDRLE || type == BTDEV_TYPE_LE
                                        || BTDEV_TYPE_BREDRLE50)
Fixed: if (type == BTDEV_TYPE_BREDRLE || type == BTDEV_TYPE_LE
                                        || type == BTDEV_TYPE_BREDRLE50)
---
 emulator/btdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/emulator/btdev.c b/emulator/btdev.c
index f4c79c2d0..38d5b3b1f 100644
--- a/emulator/btdev.c
+++ b/emulator/btdev.c
@@ -645,7 +645,7 @@ struct btdev *btdev_create(enum btdev_type type, uint16_t id)
 	memset(btdev, 0, sizeof(*btdev));
 
 	if (type == BTDEV_TYPE_BREDRLE || type == BTDEV_TYPE_LE
-				|| BTDEV_TYPE_BREDRLE50) {
+				|| type == BTDEV_TYPE_BREDRLE50) {
 		btdev->crypto = bt_crypto_new();
 		if (!btdev->crypto) {
 			free(btdev);
-- 
2.21.0

