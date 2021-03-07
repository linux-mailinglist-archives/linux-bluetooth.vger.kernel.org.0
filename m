Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3B0933016A
	for <lists+linux-bluetooth@lfdr.de>; Sun,  7 Mar 2021 14:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbhCGNvg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 7 Mar 2021 08:51:36 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:42372 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231469AbhCGNvN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 7 Mar 2021 08:51:13 -0500
Received: from localhost.localdomain (p4fefc126.dip0.t-ipconnect.de [79.239.193.38])
        by mail.holtmann.org (Postfix) with ESMTPSA id 1CC71CECFD
        for <linux-bluetooth@vger.kernel.org>; Sun,  7 Mar 2021 14:58:43 +0100 (CET)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 1/2] Bluetooth: Add missing entries for PHY configuration commands
Date:   Sun,  7 Mar 2021 14:51:03 +0100
Message-Id: <20210307135104.106477-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The list of supported mgmt commands for PHY configuration is missing, so
just add them.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 net/bluetooth/mgmt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 90334ac4a135..3c0bec06828a 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -108,6 +108,8 @@ static const u16 mgmt_commands[] = {
 	MGMT_OP_START_LIMITED_DISCOVERY,
 	MGMT_OP_READ_EXT_INFO,
 	MGMT_OP_SET_APPEARANCE,
+	MGMT_OP_GET_PHY_CONFIGURATION,
+	MGMT_OP_SET_PHY_CONFIGURATION,
 	MGMT_OP_SET_BLOCKED_KEYS,
 	MGMT_OP_SET_WIDEBAND_SPEECH,
 	MGMT_OP_READ_CONTROLLER_CAP,
-- 
2.29.2

