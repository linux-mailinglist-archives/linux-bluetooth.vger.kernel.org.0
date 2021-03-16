Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B216A33D4DE
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Mar 2021 14:29:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235019AbhCPN3J (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 16 Mar 2021 09:29:09 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41380 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhCPN3A (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 16 Mar 2021 09:29:00 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: fdanis)
        with ESMTPSA id BB17B1F448B1
From:   =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= 
        <frederic.danis@collabora.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH Bluez] android/handsfree: Replace g_timeout_add_seconds_full by g_timeout_add_seconds
Date:   Tue, 16 Mar 2021 14:28:44 +0100
Message-Id: <20210316132844.2532-1-frederic.danis@collabora.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The call uses the default priority value and doe not set a destroy
function, in this case g_timeout_add_seconds can be used.
---
 android/handsfree.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/android/handsfree.c b/android/handsfree.c
index 2365356c2..977803111 100644
--- a/android/handsfree.c
+++ b/android/handsfree.c
@@ -2330,9 +2330,7 @@ static void phone_state_incoming(struct hf_device *dev, int num_active,
 	/* send first RING */
 	ring_cb(dev);
 
-	dev->ring = g_timeout_add_seconds_full(G_PRIORITY_DEFAULT,
-							RING_TIMEOUT, ring_cb,
-							dev, NULL);
+	dev->ring = g_timeout_add_seconds(RING_TIMEOUT, ring_cb, dev);
 	if (!dev->ring) {
 		g_free(dev->clip);
 		dev->clip = NULL;
-- 
2.18.0

