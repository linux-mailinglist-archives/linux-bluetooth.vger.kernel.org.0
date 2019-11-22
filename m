Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 432BC107504
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 Nov 2019 16:38:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfKVPiT (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 22 Nov 2019 10:38:19 -0500
Received: from mga09.intel.com ([134.134.136.24]:40588 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726046AbfKVPiT (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 22 Nov 2019 10:38:19 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Nov 2019 07:38:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,230,1571727600"; 
   d="scan'208";a="216381274"
Received: from ingas-nuc1.sea.intel.com ([10.251.140.44])
  by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2019 07:38:18 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] tools/mesh-cfgclient: Fix signatures in agent methods
Date:   Fri, 22 Nov 2019 07:38:16 -0800
Message-Id: <20191122153816.8430-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This removes an extra return parameter from PromptNumeric and PromptStatic
method signatures. Also, style fixes.
---
 tools/mesh-cfgclient.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/mesh-cfgclient.c b/tools/mesh-cfgclient.c
index 1c617a37b..784c07fdf 100644
--- a/tools/mesh-cfgclient.c
+++ b/tools/mesh-cfgclient.c
@@ -478,6 +478,7 @@ static struct l_dbus_message *disp_string_call(struct l_dbus *dbus,
 						struct l_dbus_message *msg,
 						void *user_data)
 {
+	const char *prompt = "Enter AlphaNumeric code on remote device:";
 	char *str;
 
 	if (!l_dbus_message_get_arguments(msg, "s", &str)) {
@@ -485,7 +486,7 @@ static struct l_dbus_message *disp_string_call(struct l_dbus *dbus,
 		return l_dbus_message_new_error(msg, dbus_err_fail, NULL);
 	}
 
-	bt_shell_printf(COLOR_YELLOW "Enter AlphaNumeric code on remote device: %s\n" COLOR_OFF, str);
+	bt_shell_printf(COLOR_YELLOW "%s %s\n" COLOR_OFF, prompt, str);
 
 	return l_dbus_message_new_method_return(msg);
 }
@@ -542,13 +543,13 @@ static void setup_agent_iface(struct l_dbus_interface *iface)
 								NULL);
 	/* TODO: Other properties */
 	l_dbus_interface_method(iface, "DisplayString", 0, disp_string_call,
-						"", "s", "value");
+							"", "s", "value");
 	l_dbus_interface_method(iface, "DisplayNumeric", 0, disp_numeric_call,
 						"", "su", "type", "number");
 	l_dbus_interface_method(iface, "PromptNumeric", 0, prompt_numeric_call,
-						"u", "s", "type");
+							"", "s", "type");
 	l_dbus_interface_method(iface, "PromptStatic", 0, prompt_static_call,
-						"ay", "s", "type");
+							"", "s", "type");
 }
 
 static bool register_agent(void)
-- 
2.21.0

