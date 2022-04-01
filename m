Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8714EE956
	for <lists+linux-bluetooth@lfdr.de>; Fri,  1 Apr 2022 09:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344013AbiDAHyl (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 1 Apr 2022 03:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244056AbiDAHyj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 1 Apr 2022 03:54:39 -0400
Received: from mxout02.lancloud.ru (mxout02.lancloud.ru [45.84.86.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF45126240F
        for <linux-bluetooth@vger.kernel.org>; Fri,  1 Apr 2022 00:52:50 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 97C1F22C6A20
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Ildar Kamaletdinov <i.kamaletdinov@omp.ru>
To:     <linux-bluetooth@vger.kernel.org>
CC:     Ildar Kamaletdinov <i.kamaletdinov@omp.ru>
Subject: [PATCH BlueZ 4/7] tools: Prevent infinity loops in bluemoon.c
Date:   Fri, 1 Apr 2022 10:46:37 +0300
Message-ID: <20220401074640.3956695-5-i.kamaletdinov@omp.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401074640.3956695-1-i.kamaletdinov@omp.ru>
References: <20220401074640.3956695-1-i.kamaletdinov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1910.lancloud.ru (fd00:f066::80)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

In case FW size is too big we can face with infinity while() loops.
According to C99 standart SIZE_MAX could be as small as 65535.

So to prevent overflow of 'firmware_offset' we must limit maximum FW
size that could be processed by bluemoon.

Found by Linux Verification Center (linuxtesting.org) with the SVACE
static analysis tool.
---
 tools/bluemoon.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/bluemoon.c b/tools/bluemoon.c
index f50107a2a..729da36f6 100644
--- a/tools/bluemoon.c
+++ b/tools/bluemoon.c
@@ -492,6 +492,13 @@ static void request_firmware(const char *path)
 		return;
 	}
 
+	if (st.st_size > (SIZE_MAX - 4)) {
+		fprintf(stderr, "Firmware size is too big\n");
+		close(fd);
+		shutdown_device();
+		return;
+	}
+
 	firmware_data = malloc(st.st_size);
 	if (!firmware_data) {
 		fprintf(stderr, "Failed to allocate firmware buffer\n");
@@ -874,6 +881,12 @@ static void analyze_firmware(const char *path)
 		return;
 	}
 
+	if (st.st_size > (SIZE_MAX - 3)) {
+		fprintf(stderr, "Firmware size is too big\n");
+		close(fd);
+		return;
+	}
+
 	firmware_data = malloc(st.st_size);
 	if (!firmware_data) {
 		fprintf(stderr, "Failed to allocate firmware buffer\n");
-- 
2.34.0

