Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 102584EE955
	for <lists+linux-bluetooth@lfdr.de>; Fri,  1 Apr 2022 09:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344014AbiDAHyl (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 1 Apr 2022 03:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245562AbiDAHyj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 1 Apr 2022 03:54:39 -0400
Received: from mxout02.lancloud.ru (mxout02.lancloud.ru [45.84.86.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF2CF26240E
        for <linux-bluetooth@vger.kernel.org>; Fri,  1 Apr 2022 00:52:50 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru B479622C62A9
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Ildar Kamaletdinov <i.kamaletdinov@omp.ru>
To:     <linux-bluetooth@vger.kernel.org>
CC:     Ildar Kamaletdinov <i.kamaletdinov@omp.ru>
Subject: [PATCH BlueZ 1/7] monitor: Fix out-of-bound read in print_le_states
Date:   Fri, 1 Apr 2022 10:46:34 +0300
Message-ID: <20220401074640.3956695-2-i.kamaletdinov@omp.ru>
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

Accessing le_states_desc_table array with value 15 can cause
out-of-bound read because current size of array is 14.

Currently this cannot lead to any problems becase we do no have such
state in le_states_comb_table but this could be changed in future and
raise described problem.

Found by Linux Verification Center (linuxtesting.org) with the SVACE
static analysis tool.
---
 monitor/packet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/packet.c b/monitor/packet.c
index b7431b57d..c61d6bd4b 100644
--- a/monitor/packet.c
+++ b/monitor/packet.c
@@ -2833,7 +2833,7 @@ static void print_le_states(const uint8_t *states_array)
 		if (!(states & val))
 			continue;
 
-		for (n = 0; n < 16; n++) {
+		for (n = 0; n < ARRAY_SIZE(le_states_desc_table); n++) {
 			if (le_states_comb_table[i].states & (1 << n))
 				str[num++] = le_states_desc_table[n].str;
 		}
-- 
2.34.0

