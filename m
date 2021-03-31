Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 700E2347A4E
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Mar 2021 15:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236042AbhCXOLZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 24 Mar 2021 10:11:25 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:38102 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236081AbhCXOLG (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 24 Mar 2021 10:11:06 -0400
Received: from localhost.localdomain (p4fefce19.dip0.t-ipconnect.de [79.239.206.25])
        by mail.holtmann.org (Postfix) with ESMTPSA id D821ACED03
        for <linux-bluetooth@vger.kernel.org>; Wed, 24 Mar 2021 15:18:43 +0100 (CET)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 5/5] Bluetooth: Increment management interface revision
Date:   Wed, 24 Mar 2021 15:10:59 +0100
Message-Id: <20210324141059.88009-5-marcel@holtmann.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Increment the mgmt revision due to recent changes.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 net/bluetooth/mgmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 2426a0d38c80..09e099c419f2 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -40,7 +40,7 @@
 #include "msft.h"
 
 #define MGMT_VERSION	1
-#define MGMT_REVISION	19
+#define MGMT_REVISION	20
 
 static const u16 mgmt_commands[] = {
 	MGMT_OP_READ_INDEX_LIST,
-- 
2.30.2

