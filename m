Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C39C682439
	for <lists+linux-bluetooth@lfdr.de>; Tue, 31 Jan 2023 06:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbjAaFxM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 31 Jan 2023 00:53:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjAaFxK (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 31 Jan 2023 00:53:10 -0500
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 447D12F79A
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Jan 2023 21:53:07 -0800 (PST)
From:   Sam James <sam@gentoo.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Sam James <sam@gentoo.org>
Subject: [PATCH] shared: define MAX_INPUT for musl
Date:   Tue, 31 Jan 2023 05:52:58 +0000
Message-Id: <20230131055258.3311810-1-sam@gentoo.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

musl systems don't have MAX_INPUT. Just define it to _POSIX_MAX_INPUT which
musl does have if it's not already defined.

Note that on glibc, the values match anyway (as of glibc-2.36), and indeed
POSIX_MAX_INPUT has the same value on musl too.

Bug: https://bugs.gentoo.org/888467
Signed-off-by: Sam James <sam@gentoo.org>
---
 src/shared/util.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/src/shared/util.c b/src/shared/util.c
index 2f0ae0e86..b466fb001 100644
--- a/src/shared/util.c
+++ b/src/shared/util.c
@@ -28,6 +28,11 @@
 #include <sys/random.h>
 #endif
 
+/* define MAX_INPUT for musl */
+#ifndef MAX_INPUT
+#define MAX_INPUT _POSIX_MAX_INPUT
+#endif
+
 #include "src/shared/util.h"
 
 void *util_malloc(size_t size)
-- 
2.39.1

