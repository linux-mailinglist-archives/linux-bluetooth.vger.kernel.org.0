Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0B15E90E4
	for <lists+linux-bluetooth@lfdr.de>; Tue, 29 Oct 2019 21:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727699AbfJ2Uk5 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 29 Oct 2019 16:40:57 -0400
Received: from mga01.intel.com ([192.55.52.88]:15193 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725840AbfJ2Uk5 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 29 Oct 2019 16:40:57 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Oct 2019 13:40:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,245,1569308400"; 
   d="scan'208";a="401277155"
Received: from ingas-nuc1.sea.intel.com ([10.255.229.102])
  by fmsmga006.fm.intel.com with ESMTP; 29 Oct 2019 13:40:56 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 01/10] tools/mesh: Remove extra dependencies from agent.c
Date:   Tue, 29 Oct 2019 13:40:45 -0700
Message-Id: <20191029204054.30599-2-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191029204054.30599-1-inga.stotland@intel.com>
References: <20191029204054.30599-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This removes dependency on glib and mesh/util.c.
Also, fixes few style glitches.
---
 tools/mesh/agent.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/tools/mesh/agent.c b/tools/mesh/agent.c
index 08e498541..0ec76f3b7 100644
--- a/tools/mesh/agent.c
+++ b/tools/mesh/agent.c
@@ -30,12 +30,9 @@
 #include <stdbool.h>
 #include <inttypes.h>
 
-#include <glib.h>
-
 #include <lib/bluetooth.h>
 
 #include "src/shared/shell.h"
-#include "tools/mesh/util.h"
 #include "tools/mesh/agent.h"
 
 struct input_request {
@@ -63,6 +60,22 @@ static void reset_input_request(void)
 	pending_request.user_data = NULL;
 }
 
+static bool str2hex(const char *str, uint16_t in_len, uint8_t *out,
+							uint16_t out_len)
+{
+	uint16_t i;
+
+	if (in_len < out_len * 2)
+		return false;
+
+	for (i = 0; i < out_len; i++) {
+		if (sscanf(&str[i * 2], "%02hhx", &out[i]) != 1)
+			return false;
+	}
+
+	return true;
+}
+
 static void response_hexadecimal(const char *input, void *user_data)
 {
 	uint8_t buf[MAX_HEXADECIMAL_OOB_LEN];
@@ -111,8 +124,8 @@ static bool request_hexadecimal(uint16_t len)
 		return false;
 
 	bt_shell_printf("Request hexadecimal key (hex %d octets)\n", len);
-	bt_shell_prompt_input("mesh", "Enter key (hex number):", response_hexadecimal,
-								NULL);
+	bt_shell_prompt_input("mesh", "Enter key (hex number):",
+						response_hexadecimal, NULL);
 
 	return true;
 }
@@ -130,7 +143,8 @@ static uint32_t power_ten(uint8_t power)
 static bool request_decimal(uint16_t len)
 {
 	bt_shell_printf("Request decimal key (0 - %d)\n", power_ten(len) - 1);
-	bt_shell_prompt_input("mesh", "Enter Numeric key:", response_decimal, NULL);
+	bt_shell_prompt_input("mesh-agent", "Enter Numeric key:",
+							response_decimal, NULL);
 
 	return true;
 }
@@ -141,8 +155,8 @@ static bool request_ascii(uint16_t len)
 		return false;
 
 	bt_shell_printf("Request ASCII key (max characters %d)\n", len);
-	bt_shell_prompt_input("mesh", "Enter key (ascii string):", response_ascii,
-									NULL);
+	bt_shell_prompt_input("mesh", "Enter key (ascii string):",
+							response_ascii, NULL);
 
 	return true;
 }
@@ -153,7 +167,7 @@ bool agent_input_request(oob_type_t type, uint16_t max_len, agent_input_cb cb,
 	bool result;
 
 	if (pending_request.type != NONE)
-		return FALSE;
+		return false;
 
 	switch (type) {
 	case HEXADECIMAL:
-- 
2.21.0

