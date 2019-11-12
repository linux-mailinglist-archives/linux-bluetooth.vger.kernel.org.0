Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC8DEF9126
	for <lists+linux-bluetooth@lfdr.de>; Tue, 12 Nov 2019 14:56:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbfKLN4u (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 12 Nov 2019 08:56:50 -0500
Received: from bsmtp2.bon.at ([213.33.87.16]:13983 "EHLO bsmtp2.bon.at"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727201AbfKLN4u (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 12 Nov 2019 08:56:50 -0500
Received: from simon-pc.sueba (81.89.61.168.host.vnet.sk [81.89.61.168])
        by bsmtp2.bon.at (Postfix) with ESMTPSA id 47C8S040kTz5tlb;
        Tue, 12 Nov 2019 14:56:48 +0100 (CET)
From:   Simon Mikuda <simon.mikuda@streamunlimited.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Simon Mikuda <simon.mikuda@streamunlimited.com>
Subject: [PATCH BlueZ 2/2] core/advertising: Fix crash when client is added after unregistration
Date:   Tue, 12 Nov 2019 14:56:35 +0100
Message-Id: <1573566995-8482-2-git-send-email-simon.mikuda@streamunlimited.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573566995-8482-1-git-send-email-simon.mikuda@streamunlimited.com>
References: <1573566995-8482-1-git-send-email-simon.mikuda@streamunlimited.com>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

After "register_advertisement()" callback "client_proxy_added()" was yet
called but it was actually called after: "unregister_advertisement()" which
caused segmentation fault because client was removed twice.

Signed-off-by: Simon Mikuda <simon.mikuda@streamunlimited.com>
---
 src/advertising.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/advertising.c b/src/advertising.c
index f53c14c..45ff19f 100644
--- a/src/advertising.c
+++ b/src/advertising.c
@@ -190,6 +190,8 @@ static void client_remove(void *data)
 	struct btd_adv_client *client = data;
 	struct mgmt_cp_remove_advertising cp;
 
+	g_dbus_client_set_proxy_handlers(client->client, NULL, NULL, NULL,
+									client);
 	g_dbus_client_set_disconnect_watch(client->client, NULL, NULL);
 
 	cp.instance = client->instance;
-- 
2.7.4

