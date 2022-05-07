Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 236C251E8C6
	for <lists+linux-bluetooth@lfdr.de>; Sat,  7 May 2022 19:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243622AbiEGRLQ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 7 May 2022 13:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355155AbiEGRLC (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 7 May 2022 13:11:02 -0400
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 761243BA78
        for <linux-bluetooth@vger.kernel.org>; Sat,  7 May 2022 10:07:12 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru AAD40209D3CE
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Ildar Kamaletdinov <i.kamaletdinov@omp.ru>
To:     <linux-bluetooth@vger.kernel.org>
CC:     Ildar Kamaletdinov <i.kamaletdinov@omp.ru>
Subject: [PATCH BlueZ 4/4] device: Fix uninitialized value usage
Date:   Sat, 7 May 2022 20:07:03 +0300
Message-ID: <20220507170703.29902-5-i.kamaletdinov@omp.ru>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220507170703.29902-1-i.kamaletdinov@omp.ru>
References: <20220507170703.29902-1-i.kamaletdinov@omp.ru>
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

Definitely `dbus_bool_t b;` must be initialized before comparing it
with current value.

Found by Linux Verification Center (linuxtesting.org) with the SVACE
static analysis tool.
---
 src/device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/src/device.c b/src/device.c
index 6da5c380b..7114e1b3e 100644
--- a/src/device.c
+++ b/src/device.c
@@ -1568,6 +1568,8 @@ static void dev_property_set_wake_allowed(const GDBusPropertyTable *property,
 		return;
 	}
 
+	dbus_message_iter_get_basic(value, &b);
+
 	/* Emit busy or success depending on current value. */
 	if (b == device->pending_wake_allowed) {
 		if (device->wake_allowed == device->pending_wake_allowed)
@@ -1580,7 +1582,6 @@ static void dev_property_set_wake_allowed(const GDBusPropertyTable *property,
 		return;
 	}
 
-	dbus_message_iter_get_basic(value, &b);
 	device_set_wake_override(device, b);
 	device_set_wake_allowed(device, b, id);
 }
-- 
2.35.3

