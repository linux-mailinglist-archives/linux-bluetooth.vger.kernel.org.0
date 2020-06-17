Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A101C1FCFD6
	for <lists+linux-bluetooth@lfdr.de>; Wed, 17 Jun 2020 16:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbgFQOj2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 17 Jun 2020 10:39:28 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:51203 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbgFQOj0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 17 Jun 2020 10:39:26 -0400
Received: from localhost.localdomain (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id B753ECECD9
        for <linux-bluetooth@vger.kernel.org>; Wed, 17 Jun 2020 16:49:16 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 04/14] Bluetooth: Replace wakeable in hci_conn_params
Date:   Wed, 17 Jun 2020 16:39:10 +0200
Message-Id: <24b05095824b329641abf80f6fb8d79d2643fa87.1592404644.git.marcel@holtmann.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1592404644.git.marcel@holtmann.org>
References: <cover.1592404644.git.marcel@holtmann.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Replace the wakeable boolean with flags in hci_conn_params and all users
of this boolean. This will be used by the get/set device flags mgmt op.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Reviewed-by: Alain Michaud <alainm@chromium.org>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 include/net/bluetooth/hci_core.h | 2 +-
 net/bluetooth/hci_request.c      | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 0643c737ba85..6f88e5d81bd2 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -660,7 +660,7 @@ struct hci_conn_params {
 
 	struct hci_conn *conn;
 	bool explicit_connect;
-	bool wakeable;
+	u32 current_flags;
 };
 
 extern struct list_head hci_dev_list;
diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index a5b53d3ea508..eee9c007a5fb 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -710,7 +710,8 @@ static int add_to_white_list(struct hci_request *req,
 	}
 
 	/* During suspend, only wakeable devices can be in whitelist */
-	if (hdev->suspended && !params->wakeable)
+	if (hdev->suspended && !hci_conn_test_flag(HCI_CONN_FLAG_REMOTE_WAKEUP,
+						   params->current_flags))
 		return 0;
 
 	*num_entries += 1;
-- 
2.26.2

