Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71FD94EEC1A
	for <lists+linux-bluetooth@lfdr.de>; Fri,  1 Apr 2022 13:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345375AbiDALQL (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 1 Apr 2022 07:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345366AbiDALQK (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 1 Apr 2022 07:16:10 -0400
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F9012E14B
        for <linux-bluetooth@vger.kernel.org>; Fri,  1 Apr 2022 04:14:16 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 6BB1A20CBB8A
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Ildar Kamaletdinov <i.kamaletdinov@omp.ru>
To:     <linux-bluetooth@vger.kernel.org>
CC:     Ildar Kamaletdinov <i.kamaletdinov@omp.ru>
Subject: [PATCH BlueZ 5/7] tools: Limit width of fields in sscanf
Date:   Fri, 1 Apr 2022 14:14:06 +0300
Message-ID: <20220401111408.3961844-6-i.kamaletdinov@omp.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401111408.3961844-1-i.kamaletdinov@omp.ru>
References: <20220401111408.3961844-1-i.kamaletdinov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1910.lancloud.ru (fd00:f066::80)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

In tools/btmgmt.c and tools/hex2hcd.c few sscanf does not limit width
of fields. This could lead to static overflow and stack corruption.

Found by Linux Verification Center (linuxtesting.org) with the SVACE
static analysis tool.
---
 tools/btmgmt.c  | 2 +-
 tools/hex2hcd.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/btmgmt.c b/tools/btmgmt.c
index 42ef9acef..8f63f12ba 100644
--- a/tools/btmgmt.c
+++ b/tools/btmgmt.c
@@ -5164,7 +5164,7 @@ static bool str2pattern(struct mgmt_adv_pattern *pattern, const char *str)
 	char pattern_str[62] = { 0 };
 	char tmp;
 
-	if (sscanf(str, "%2hhx%n:%2hhx%n:%s", &pattern->ad_type, &type_len,
+	if (sscanf(str, "%2hhx%n:%2hhx%n:%61s", &pattern->ad_type, &type_len,
 			&pattern->offset, &offset_end_pos, pattern_str) != 3)
 		return false;
 
diff --git a/tools/hex2hcd.c b/tools/hex2hcd.c
index 674d62744..e6dca5a81 100644
--- a/tools/hex2hcd.c
+++ b/tools/hex2hcd.c
@@ -248,7 +248,7 @@ static void ver_parse_file(const char *pathname)
 
 	memset(ver, 0, sizeof(*ver));
 
-	if (sscanf(pathname, "%[A-Z0-9]_%3c.%3c.%3c.%4c.%4c.hex",
+	if (sscanf(pathname, "%19[A-Z0-9]_%3c.%3c.%3c.%4c.%4c.hex",
 					ver->name, ver->major, ver->minor,
 					ver->build, dummy1, dummy2) != 6) {
 		printf("\t/* failed to parse %s */\n", pathname);
-- 
2.35.1

