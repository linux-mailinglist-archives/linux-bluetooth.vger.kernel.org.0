Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E45FD7E0800
	for <lists+linux-bluetooth@lfdr.de>; Fri,  3 Nov 2023 19:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233651AbjKCSWF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 3 Nov 2023 14:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbjKCSWE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 3 Nov 2023 14:22:04 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29845DB
        for <linux-bluetooth@vger.kernel.org>; Fri,  3 Nov 2023 11:22:01 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4SMTbm6dgbz9sdP;
        Fri,  3 Nov 2023 19:21:56 +0100 (CET)
From:   =?UTF-8?q?Jonas=20Dre=C3=9Fler?= <verdre@v0yd.nl>
To:     linux-bluetooth@vger.kernel.org
Cc:     zbrown@gnome.org, =?UTF-8?q?Jonas=20Dre=C3=9Fler?= <verdre@v0yd.nl>
Subject: [PATCH BlueZ 1/4] lib/sdp: Allocate strings in sdp_data_t with NULL termination
Date:   Fri,  3 Nov 2023 19:21:47 +0100
Message-ID: <20231103182150.60088-2-verdre@v0yd.nl>
In-Reply-To: <20231103182150.60088-1-verdre@v0yd.nl>
References: <20231103182150.60088-1-verdre@v0yd.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4SMTbm6dgbz9sdP
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

In extract_str() we create sdp_data_t with strings and allocate
sdp_data_t->val.str an extra 0-byte as NULL termination. In
sdp_data_alloc_with_length() we're missing this, and strlen() in
sdp_get_string_attr() ends up overrunning the sdpdata->val.str buffer
looking for the NULL termination.

Allocate the extra 0-byte for sdp_data_t->val.str to ensure this
overrun can't happen.

Co-developed-by: Zander Brown <zbrown@gnome.org>
---
 lib/sdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sdp.c b/lib/sdp.c
index 844ae0d25..1565259a3 100644
--- a/lib/sdp.c
+++ b/lib/sdp.c
@@ -420,7 +420,7 @@ sdp_data_t *sdp_data_alloc_with_length(uint8_t dtd, const void *value,
 
 		d->unitSize += length;
 		if (length <= USHRT_MAX) {
-			d->val.str = malloc(length);
+			d->val.str = bt_malloc0(length + 1);
 			if (!d->val.str) {
 				free(d);
 				return NULL;
-- 
2.41.0

