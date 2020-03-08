Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 045EC17D296
	for <lists+linux-bluetooth@lfdr.de>; Sun,  8 Mar 2020 09:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgCHIM4 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 8 Mar 2020 04:12:56 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:44744 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgCHIM4 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 8 Mar 2020 04:12:56 -0400
Received: from localhost.localdomain (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id BFB9ECED15
        for <linux-bluetooth@vger.kernel.org>; Sun,  8 Mar 2020 09:22:22 +0100 (CET)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH] Bluetooth: Increment management interface revision
Date:   Sun,  8 Mar 2020 09:12:50 +0100
Message-Id: <20200308081250.126797-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Increment the mgmt revision due to the recently added setting and
command.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 net/bluetooth/mgmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 4abb5daeeca8..4da48618b271 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -38,7 +38,7 @@
 #include "mgmt_util.h"
 
 #define MGMT_VERSION	1
-#define MGMT_REVISION	15
+#define MGMT_REVISION	16
 
 static const u16 mgmt_commands[] = {
 	MGMT_OP_READ_INDEX_LIST,
-- 
2.24.1

