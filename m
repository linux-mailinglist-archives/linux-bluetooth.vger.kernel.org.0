Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11F14A24CA
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Aug 2019 20:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729521AbfH2SQC (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 29 Aug 2019 14:16:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:57954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729537AbfH2SQC (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 29 Aug 2019 14:16:02 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1ECE02339E;
        Thu, 29 Aug 2019 18:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567102560;
        bh=3LAmf5iuO2TGOiJ96bwKJ56XKMm78CvAPwSFPJtHAMQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HhgHb1J9rIydioefoA+Xc5cX/tw38sk4OhZ/jCkrDtDTBjjRH8Ymzw74u63Z5iTlB
         DkB1drDpHii+GyzFVz62VBVV40R7qiYRYQ0Gm91Ksu7PY/qEoWFNMLIHTIvEdOFQpJ
         adpFfA2Tda3HU6V3L1KZT/f9X8Kk78LB5GrnNLx8=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Fabian Henneke <fabian.henneke@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 08/45] Bluetooth: hidp: Let hidp_send_message return number of queued bytes
Date:   Thu, 29 Aug 2019 14:15:08 -0400
Message-Id: <20190829181547.8280-8-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190829181547.8280-1-sashal@kernel.org>
References: <20190829181547.8280-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Fabian Henneke <fabian.henneke@gmail.com>

[ Upstream commit 48d9cc9d85dde37c87abb7ac9bbec6598ba44b56 ]

Let hidp_send_message return the number of successfully queued bytes
instead of an unconditional 0.

With the return value fixed to 0, other drivers relying on hidp, such as
hidraw, can not return meaningful values from their respective
implementations of write(). In particular, with the current behavior, a
hidraw device's write() will have different return values depending on
whether the device is connected via USB or Bluetooth, which makes it
harder to abstract away the transport layer.

Signed-off-by: Fabian Henneke <fabian.henneke@gmail.com>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/bluetooth/hidp/core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/hidp/core.c b/net/bluetooth/hidp/core.c
index 253975cce943e..7a31aec0c4a36 100644
--- a/net/bluetooth/hidp/core.c
+++ b/net/bluetooth/hidp/core.c
@@ -101,6 +101,7 @@ static int hidp_send_message(struct hidp_session *session, struct socket *sock,
 {
 	struct sk_buff *skb;
 	struct sock *sk = sock->sk;
+	int ret;
 
 	BT_DBG("session %p data %p size %d", session, data, size);
 
@@ -114,13 +115,17 @@ static int hidp_send_message(struct hidp_session *session, struct socket *sock,
 	}
 
 	skb_put_u8(skb, hdr);
-	if (data && size > 0)
+	if (data && size > 0) {
 		skb_put_data(skb, data, size);
+		ret = size;
+	} else {
+		ret = 0;
+	}
 
 	skb_queue_tail(transmit, skb);
 	wake_up_interruptible(sk_sleep(sk));
 
-	return 0;
+	return ret;
 }
 
 static int hidp_send_ctrl_message(struct hidp_session *session,
-- 
2.20.1

