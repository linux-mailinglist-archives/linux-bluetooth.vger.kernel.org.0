Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46CF3713B4E
	for <lists+linux-bluetooth@lfdr.de>; Sun, 28 May 2023 19:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbjE1Rje (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 28 May 2023 13:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjE1Rjd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 28 May 2023 13:39:33 -0400
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE52D9
        for <linux-bluetooth@vger.kernel.org>; Sun, 28 May 2023 10:39:21 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id B3AE9240101
        for <linux-bluetooth@vger.kernel.org>; Sun, 28 May 2023 19:39:19 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4QTm9z1wKwz6txs;
        Sun, 28 May 2023 19:39:19 +0200 (CEST)
From:   Pauli Virtanen <pav@iki.fi>
To:     linux-bluetooth@vger.kernel.org
Cc:     Pauli Virtanen <pav@iki.fi>
Subject: [PATCH BlueZ 4/4] test-runner: enable no_hash_pointers=1
Date:   Sun, 28 May 2023 17:39:16 +0000
Message-Id: <4275efc32fd4e63ffb25ee53fde2d24d5a60e6d7.1685283364.git.pav@iki.fi>
In-Reply-To: <502997002ac9d4a76593aa4ba8237b7fb803c701.1685283364.git.pav@iki.fi>
References: <502997002ac9d4a76593aa4ba8237b7fb803c701.1685283364.git.pav@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NEUTRAL,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Set no_hash_pointers=1 to avoid printk printing "___ptrval___" for %p.
This happens with test-runner since the kernel is not running long
enough to gather entropy and so refuses to print addresses, and makes
debugging harder.  As test-runner is only used for testing and
debugging, pointer hashing is not needed.
---
 tools/test-runner.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/test-runner.c b/tools/test-runner.c
index 8b18f848a..d74bb1087 100644
--- a/tools/test-runner.c
+++ b/tools/test-runner.c
@@ -247,7 +247,7 @@ static void start_qemu(void)
 
 	snprintf(cmdline, sizeof(cmdline),
 				"console=ttyS0,115200n8 earlyprintk=serial "
-				"rootfstype=9p "
+				"no_hash_pointers=1 rootfstype=9p "
 				"rootflags=trans=virtio,version=9p2000.u "
 				"acpi=off pci=noacpi noapic quiet ro init=%s "
 				"TESTHOME=%s TESTDBUS=%u TESTDAEMON=%u "
-- 
2.40.1

