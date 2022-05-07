Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F27B51E8F7
	for <lists+linux-bluetooth@lfdr.de>; Sat,  7 May 2022 19:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386665AbiEGRjG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 7 May 2022 13:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347443AbiEGRjE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 7 May 2022 13:39:04 -0400
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39FF722B32
        for <linux-bluetooth@vger.kernel.org>; Sat,  7 May 2022 10:35:17 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru C5FB120A4941
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Ildar Kamaletdinov <i.kamaletdinov@omp.ru>
To:     <linux-bluetooth@vger.kernel.org>
CC:     Ildar Kamaletdinov <i.kamaletdinov@omp.ru>
Subject: [PATCH BlueZ 3/4] tools: Fix handle leak in rfcomm
Date:   Sat, 7 May 2022 20:35:04 +0300
Message-ID: <20220507173505.31249-4-i.kamaletdinov@omp.ru>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220507173505.31249-1-i.kamaletdinov@omp.ru>
References: <20220507173505.31249-1-i.kamaletdinov@omp.ru>
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

Some branches of execution can make handle (socket) leakage.

Found by Linux Verification Center (linuxtesting.org) with the SVACE
static analysis tool.
---
 tools/rfcomm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/rfcomm.c b/tools/rfcomm.c
index cd520aa44..e013ff588 100644
--- a/tools/rfcomm.c
+++ b/tools/rfcomm.c
@@ -298,6 +298,7 @@ static void cmd_connect(int ctl, int dev, bdaddr_t *bdaddr, int argc, char **arg
 
 		if (setsockopt(sk, SOL_SOCKET, SO_LINGER, &l, sizeof(l)) < 0) {
 			perror("Can't set linger option");
+			close(sk);
 			return;
 		}
 	}
@@ -466,6 +467,7 @@ static void cmd_listen(int ctl, int dev, bdaddr_t *bdaddr, int argc, char **argv
 	if (getsockname(nsk, (struct sockaddr *)&laddr, &alen) < 0) {
 		perror("Can't get RFCOMM socket name");
 		close(nsk);
+		close(sk);
 		return;
 	}
 
@@ -475,6 +477,7 @@ static void cmd_listen(int ctl, int dev, bdaddr_t *bdaddr, int argc, char **argv
 		if (setsockopt(nsk, SOL_SOCKET, SO_LINGER, &l, sizeof(l)) < 0) {
 			perror("Can't set linger option");
 			close(nsk);
+			close(sk);
 			return;
 		}
 	}
@@ -490,6 +493,7 @@ static void cmd_listen(int ctl, int dev, bdaddr_t *bdaddr, int argc, char **argv
 	dev = ioctl(nsk, RFCOMMCREATEDEV, &req);
 	if (dev < 0) {
 		perror("Can't create RFCOMM TTY");
+		close(nsk);
 		close(sk);
 		return;
 	}
-- 
2.35.3

