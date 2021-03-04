Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69BEA32D3A8
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Mar 2021 13:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237417AbhCDMxG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 4 Mar 2021 07:53:06 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:34451 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237621AbhCDMwu (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 4 Mar 2021 07:52:50 -0500
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 4390B3BAE17
        for <linux-bluetooth@vger.kernel.org>; Thu,  4 Mar 2021 12:50:03 +0000 (UTC)
X-Originating-IP: 78.199.60.242
Received: from classic.redhat.com (unknown [78.199.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 242DCFF809
        for <linux-bluetooth@vger.kernel.org>; Thu,  4 Mar 2021 12:48:51 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 2/3] obex: Work-around compilation failure
Date:   Thu,  4 Mar 2021 13:48:50 +0100
Message-Id: <20210304124851.219154-2-hadess@hadess.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210304124851.219154-1-hadess@hadess.net>
References: <20210304124851.219154-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index d232d3fd5..66f432d66 100644
--- a/obexd/plugins/bluetooth.c
+++ b/obexd/plugins/bluetooth.c
@@ -258,6 +258,9 @@ static int register_profile(struct bluetooth_profile *profile)
 					&opt);
 	g_dbus_dict_append_entry(&opt, "AutoConnect", DBUS_TYPE_BOOLEAN,
 								&auto_connect);
+
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
 	if (profile->driver->record) {
 		if (profile->driver->port != 0)
 			xml = g_markup_printf_escaped(profile->driver->record,
@@ -268,6 +271,7 @@ static int register_profile(struct bluetooth_profile *profile)
 			xml = g_markup_printf_escaped(profile->driver->record,
 						profile->driver->channel,
 						profile->driver->name);
+#pragma GCC diagnostic pop
 		g_dbus_dict_append_entry(&opt, "ServiceRecord",
 						DBUS_TYPE_STRING, &xml);
 		g_free(xml);
-- 
2.29.2

