Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4191FCFCD
	for <lists+linux-bluetooth@lfdr.de>; Wed, 17 Jun 2020 16:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbgFQOjb (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 17 Jun 2020 10:39:31 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:49147 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727055AbgFQOja (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 17 Jun 2020 10:39:30 -0400
Received: from localhost.localdomain (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id E7F95CECE3
        for <linux-bluetooth@vger.kernel.org>; Wed, 17 Jun 2020 16:49:17 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 14/14] Bluetooth: mgmt: Use command complete on success for set system config
Date:   Wed, 17 Jun 2020 16:39:20 +0200
Message-Id: <13f017e592c175aa4af83f09521305da3c7edd74.1592404644.git.marcel@holtmann.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1592404644.git.marcel@holtmann.org>
References: <cover.1592404644.git.marcel@holtmann.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The command status reply is only for failure. When completing set system
config command, the reply has to be command complete.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Alain Michaud <alainm@chromium.org>
---
 net/bluetooth/mgmt_config.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/net/bluetooth/mgmt_config.c b/net/bluetooth/mgmt_config.c
index 8e7ad2a51dbb..8d01a8ff85e9 100644
--- a/net/bluetooth/mgmt_config.c
+++ b/net/bluetooth/mgmt_config.c
@@ -247,9 +247,8 @@ int set_def_system_config(struct sock *sk, struct hci_dev *hdev, void *data,
 		buffer += exp_len;
 	}
 
-	return mgmt_cmd_status(sk, hdev->id,
-			       MGMT_OP_SET_DEF_SYSTEM_CONFIG,
-			       MGMT_STATUS_SUCCESS);
+	return mgmt_cmd_complete(sk, hdev->id,
+				 MGMT_OP_SET_DEF_SYSTEM_CONFIG, 0, NULL, 0);
 }
 
 int read_def_runtime_config(struct sock *sk, struct hci_dev *hdev, void *data,
-- 
2.26.2

