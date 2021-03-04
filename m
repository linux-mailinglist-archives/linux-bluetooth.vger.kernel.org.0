Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 175DC32D3AA
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Mar 2021 13:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237581AbhCDMxI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 4 Mar 2021 07:53:08 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:56987 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237757AbhCDMxA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 4 Mar 2021 07:53:00 -0500
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id AD54B3BAE18
        for <linux-bluetooth@vger.kernel.org>; Thu,  4 Mar 2021 12:50:03 +0000 (UTC)
X-Originating-IP: 78.199.60.242
Received: from classic.redhat.com (unknown [78.199.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6D1F6FF80C
        for <linux-bluetooth@vger.kernel.org>; Thu,  4 Mar 2021 12:48:52 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 3/3] tools/mesh-cfglient: Work-around compilation failure
Date:   Thu,  4 Mar 2021 13:48:51 +0100
Message-Id: <20210304124851.219154-3-hadess@hadess.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210304124851.219154-1-hadess@hadess.net>
References: <20210304124851.219154-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

tools/mesh-cfgclient.c: In function ‘disp_numeric_call’:
tools/mesh-cfgclient.c:543:10: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
  543 |          n);
      |          ^
---
 tools/mesh-cfgclient.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/mesh-cfgclient.c b/tools/mesh-cfgclient.c
index 1eeed2a1a..ab5026e9b 100644
--- a/tools/mesh-cfgclient.c
+++ b/tools/mesh-cfgclient.c
@@ -530,8 +530,11 @@ static struct l_dbus_message *disp_numeric_call(struct l_dbus *dbus,
 	if (action_index < 0)
 		return l_dbus_message_new_error(msg, dbus_err_support, NULL);
 
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
 	str = l_strdup_printf(display_numeric_table[action_index].description,
 									n);
+#pragma GCC diagnostic pop
 	bt_shell_printf(COLOR_YELLOW "%s\n" COLOR_OFF, str);
 	l_free(str);
 
-- 
2.29.2

