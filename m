Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98B7B189E2
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 May 2019 14:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfEIMhx (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 May 2019 08:37:53 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:39881 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbfEIMhv (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 May 2019 08:37:51 -0400
Received: from classic.redhat.com (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 2C1CB10001A;
        Thu,  9 May 2019 12:37:49 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Cc:     Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 5/8] obex: Work-around compilation failure
Date:   Thu,  9 May 2019 14:37:43 +0200
Message-Id: <20190509123746.8396-5-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190509123746.8396-1-hadess@hadess.net>
References: <20190509123746.8396-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

obexd/plugins/bluetooth.c: In function 'register_profile':
obexd/plugins/bluetooth.c:310:7: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
       profile->driver->port);
       ^~~~~~~
obexd/plugins/bluetooth.c:314:7: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
       profile->driver->name);
       ^~~~~~~
---
 obexd/plugins/bluetooth.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/obexd/plugins/bluetooth.c b/obexd/plugins/bluetooth.c
index ba1e0a99a..57c112661 100644
--- a/obexd/plugins/bluetooth.c
+++ b/obexd/plugins/bluetooth.c
@@ -271,6 +271,9 @@ static int register_profile(struct bluetooth_profile *profile)
 					&opt);
 	g_dbus_dict_append_entry(&opt, "AutoConnect", DBUS_TYPE_BOOLEAN,
 								&auto_connect);
+
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
 	if (profile->driver->record) {
 		if (profile->driver->port != 0)
 			xml = g_markup_printf_escaped(profile->driver->record,
@@ -281,6 +284,7 @@ static int register_profile(struct bluetooth_profile *profile)
 			xml = g_markup_printf_escaped(profile->driver->record,
 						profile->driver->channel,
 						profile->driver->name);
+#pragma GCC diagnostic pop
 		g_dbus_dict_append_entry(&opt, "ServiceRecord",
 						DBUS_TYPE_STRING, &xml);
 		g_free(xml);
-- 
2.21.0

