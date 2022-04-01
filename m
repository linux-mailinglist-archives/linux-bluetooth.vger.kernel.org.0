Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 394554EECFF
	for <lists+linux-bluetooth@lfdr.de>; Fri,  1 Apr 2022 14:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345805AbiDAMSp (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 1 Apr 2022 08:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344205AbiDAMSn (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 1 Apr 2022 08:18:43 -0400
Received: from mxout02.lancloud.ru (mxout02.lancloud.ru [45.84.86.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF7F27796F
        for <linux-bluetooth@vger.kernel.org>; Fri,  1 Apr 2022 05:16:53 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru C8D512307CD8
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Ildar Kamaletdinov <i.kamaletdinov@omp.ru>
To:     <linux-bluetooth@vger.kernel.org>
CC:     Ildar Kamaletdinov <i.kamaletdinov@omp.ru>
Subject: [PATCH BlueZ 5/6] device: Limit width of fields in sscanf
Date:   Fri, 1 Apr 2022 15:16:46 +0300
Message-ID: <20220401121647.3985682-6-i.kamaletdinov@omp.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401121647.3985682-1-i.kamaletdinov@omp.ru>
References: <20220401121647.3985682-1-i.kamaletdinov@omp.ru>
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

In src/device.c few sscanf does not limit width of uuid field. This
could lead to static overflow and stack corruption.

Found by Linux Verification Center (linuxtesting.org) with the SVACE
static analysis tool.
---
 src/device.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/src/device.c b/src/device.c
index 381faf91c..8dc12d026 100644
--- a/src/device.c
+++ b/src/device.c
@@ -3790,8 +3790,8 @@ static int load_desc(char *handle, char *value,
 		return -EIO;
 
 	/* Check if there is any value stored, otherwise it is just the UUID */
-	if (sscanf(value, "%04hx:%s", &val, uuid_str) != 2) {
-		if (sscanf(value, "%s", uuid_str) != 1)
+	if (sscanf(value, "%04hx:%36s", &val, uuid_str) != 2) {
+		if (sscanf(value, "%36s", uuid_str) != 1)
 			return -EIO;
 		val = 0;
 	}
@@ -3840,9 +3840,9 @@ static int load_chrc(char *handle, char *value,
 		return -EIO;
 
 	/* Check if there is any value stored */
-	if (sscanf(value, GATT_CHARAC_UUID_STR ":%04hx:%02hx:%32s:%s",
+	if (sscanf(value, GATT_CHARAC_UUID_STR ":%04hx:%02hx:%32s:%36s",
 			&value_handle, &properties, val_str, uuid_str) != 4) {
-		if (sscanf(value, GATT_CHARAC_UUID_STR ":%04hx:%02hx:%s",
+		if (sscanf(value, GATT_CHARAC_UUID_STR ":%04hx:%02hx:%36s",
 				&value_handle, &properties, uuid_str) != 3)
 			return -EIO;
 		val_len = 0;
@@ -3884,8 +3884,8 @@ static int load_incl(struct gatt_db *db, char *handle, char *value,
 	if (sscanf(handle, "%04hx", &start) != 1)
 		return -EIO;
 
-	if (sscanf(value, GATT_INCLUDE_UUID_STR ":%04hx:%04hx:%s", &start, &end,
-								uuid_str) != 3)
+	if (sscanf(value, GATT_INCLUDE_UUID_STR ":%04hx:%04hx:%36s", &start,
+							&end, uuid_str) != 3)
 		return -EIO;
 
 	/* Log debug message. */
@@ -3918,7 +3918,7 @@ static int load_service(struct gatt_db *db, char *handle, char *value)
 	if (sscanf(handle, "%04hx", &start) != 1)
 		return -EIO;
 
-	if (sscanf(value, "%[^:]:%04hx:%s", type, &end, uuid_str) != 3)
+	if (sscanf(value, "%[^:]:%04hx:%36s", type, &end, uuid_str) != 3)
 		return -EIO;
 
 	if (g_str_equal(type, GATT_PRIM_SVC_UUID_STR))
-- 
2.35.1

