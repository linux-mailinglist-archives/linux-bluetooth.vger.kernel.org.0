Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96C507E0801
	for <lists+linux-bluetooth@lfdr.de>; Fri,  3 Nov 2023 19:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233816AbjKCSWG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 3 Nov 2023 14:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233756AbjKCSWF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 3 Nov 2023 14:22:05 -0400
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D180CF
        for <linux-bluetooth@vger.kernel.org>; Fri,  3 Nov 2023 11:22:02 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4SMTbq2vsdz9t1c;
        Fri,  3 Nov 2023 19:21:59 +0100 (CET)
From:   =?UTF-8?q?Jonas=20Dre=C3=9Fler?= <verdre@v0yd.nl>
To:     linux-bluetooth@vger.kernel.org
Cc:     zbrown@gnome.org, =?UTF-8?q?Jonas=20Dre=C3=9Fler?= <verdre@v0yd.nl>
Subject: [PATCH BlueZ 2/4] lib/sdp: Don't assume uint8_t has size 1
Date:   Fri,  3 Nov 2023 19:21:48 +0100
Message-ID: <20231103182150.60088-3-verdre@v0yd.nl>
In-Reply-To: <20231103182150.60088-1-verdre@v0yd.nl>
References: <20231103182150.60088-1-verdre@v0yd.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Assuming the size of of uint8_t is bad practice, we use
sizeof(uint8_t) everywhere else and the use of sizeof makes it clear
we're accounting for the descriptor here rather than just randomly
subtracting 1, so change that.

Co-developed-by: Zander Brown <zbrown@gnome.org>
---
 lib/sdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sdp.c b/lib/sdp.c
index 1565259a3..006ab057a 100644
--- a/lib/sdp.c
+++ b/lib/sdp.c
@@ -1505,7 +1505,7 @@ static void *sdp_data_value(sdp_data_t *data, uint32_t *len)
 	case SDP_TEXT_STR32:
 		val = data->val.str;
 		if (len)
-			*len = data->unitSize - 1;
+			*len = data->unitSize - sizeof(uint8_t);
 		break;
 	case SDP_ALT8:
 	case SDP_ALT16:
-- 
2.41.0

