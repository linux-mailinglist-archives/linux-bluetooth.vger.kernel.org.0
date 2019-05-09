Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0481189E4
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 May 2019 14:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfEIMhz (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 May 2019 08:37:55 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:37143 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbfEIMhx (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 May 2019 08:37:53 -0400
Received: from classic.redhat.com (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id C011110001D;
        Thu,  9 May 2019 12:37:51 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Cc:     Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 8/8] android/handsfree: Fix unaligned struct access
Date:   Thu,  9 May 2019 14:37:46 +0200
Message-Id: <20190509123746.8396-8-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190509123746.8396-1-hadess@hadess.net>
References: <20190509123746.8396-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

android/handsfree.c: In function ‘bt_sco_get_fd’:
android/handsfree.c:2913:47: error: taking address of packed member of ‘struct sco_rsp_get_fd’ may result in an unaligned pointer value [-Werror=address-of-packed-member]
 2913 |  if (!dev || !bt_sco_get_fd_and_mtu(sco, &fd, &rsp.mtu))
      |                                               ^~~~~~~~
---
 android/handsfree.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/android/handsfree.c b/android/handsfree.c
index cb348ab9f..ebe03728e 100644
--- a/android/handsfree.c
+++ b/android/handsfree.c
@@ -2903,6 +2903,7 @@ static void bt_sco_get_fd(const void *buf, uint16_t len)
 	struct sco_rsp_get_fd rsp;
 	struct hf_device *dev;
 	bdaddr_t bdaddr;
+	uint16_t mtu;
 	int fd;
 
 	DBG("");
@@ -2910,9 +2911,10 @@ static void bt_sco_get_fd(const void *buf, uint16_t len)
 	android2bdaddr(cmd->bdaddr, &bdaddr);
 
 	dev = find_device(&bdaddr);
-	if (!dev || !bt_sco_get_fd_and_mtu(sco, &fd, &rsp.mtu))
+	if (!dev || !bt_sco_get_fd_and_mtu(sco, &fd, &mtu))
 		goto failed;
 
+	rsp.mtu = mtu;
 	DBG("fd %d mtu %u", fd, rsp.mtu);
 
 	ipc_send_rsp_full(sco_ipc, SCO_SERVICE_ID, SCO_OP_GET_FD,
-- 
2.21.0

