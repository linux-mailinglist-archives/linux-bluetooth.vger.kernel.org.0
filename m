Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1434EED01
	for <lists+linux-bluetooth@lfdr.de>; Fri,  1 Apr 2022 14:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345808AbiDAMSq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 1 Apr 2022 08:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345804AbiDAMSp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 1 Apr 2022 08:18:45 -0400
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A716448324
        for <linux-bluetooth@vger.kernel.org>; Fri,  1 Apr 2022 05:16:55 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 0294820D30AF
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Ildar Kamaletdinov <i.kamaletdinov@omp.ru>
To:     <linux-bluetooth@vger.kernel.org>
CC:     Ildar Kamaletdinov <i.kamaletdinov@omp.ru>
Subject: [PATCH BlueZ 6/6] gatt: Fix double free and freed memory dereference
Date:   Fri, 1 Apr 2022 15:16:47 +0300
Message-ID: <20220401121647.3985682-7-i.kamaletdinov@omp.ru>
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

If device is no longer exists or not paired when notifications send it
is possible to get double free and dereference of already freed memory.

To avoid this we need to recheck the state of device after sending
notification.

Found by Linux Verification Center (linuxtesting.org) with the SVACE
static analysis tool.
---
 src/gatt-database.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/src/gatt-database.c b/src/gatt-database.c
index d6c94058c..d32f616a9 100644
--- a/src/gatt-database.c
+++ b/src/gatt-database.c
@@ -3877,6 +3877,10 @@ void btd_gatt_database_server_connected(struct btd_gatt_database *database,
 
 	send_notification_to_device(state, state->pending);
 
+	state = find_device_state(database, &bdaddr, bdaddr_type);
+	if (!state || !state->pending)
+		return;
+
 	free(state->pending->value);
 	free(state->pending);
 	state->pending = NULL;
-- 
2.35.1

