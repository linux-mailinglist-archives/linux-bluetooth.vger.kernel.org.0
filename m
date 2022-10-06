Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEED75F6A2D
	for <lists+linux-bluetooth@lfdr.de>; Thu,  6 Oct 2022 17:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbiJFPAI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 6 Oct 2022 11:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiJFO77 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 6 Oct 2022 10:59:59 -0400
Received: from voyager.loytec.com (voyager.loytec.com [88.198.4.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C72711C40F
        for <linux-bluetooth@vger.kernel.org>; Thu,  6 Oct 2022 07:59:54 -0700 (PDT)
Received: from 212-17-98-152.static.upcbusiness.at ([212.17.98.152] helo=lexx.office.loytec.com)
        by voyager.loytec.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <isak.westin@loytec.com>)
        id 1ogSLo-0006re-2Y
        for linux-bluetooth@vger.kernel.org; Thu, 06 Oct 2022 16:59:52 +0200
Received: from loytec-dev-vm.delta.corp ([10.101.25.21])
        by lexx.office.loytec.com (8.15.2/8.15.2/Some OS 1.2.3-4.5) with ESMTP id 296ExnRI4163430;
        Thu, 6 Oct 2022 16:59:49 +0200
From:   Isak Westin <isak.westin@loytec.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Isak Westin <isak.westin@loytec.com>
Subject: [PATCH BlueZ 6/6] mesh: Fix msg cache ring buffer
Date:   Thu,  6 Oct 2022 16:59:27 +0200
Message-Id: <20221006145927.32731-7-isak.westin@loytec.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221006145927.32731-1-isak.westin@loytec.com>
References: <20221006145927.32731-1-isak.westin@loytec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 212.17.98.152
X-SA-Exim-Mail-From: isak.westin@loytec.com
X-SA-Exim-Scanned: No (on voyager.loytec.com); SAEximRunCond expanded to false
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The message cache should be a strict ring buffer, suppressed message
should not move to the front of the queue.
---
 mesh/net.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mesh/net.c b/mesh/net.c
index e95ae5114..8be45e61a 100644
--- a/mesh/net.c
+++ b/mesh/net.c
@@ -1028,12 +1028,11 @@ static bool msg_in_cache(struct mesh_net *net, uint16_t src, uint32_t seq,
 		.mic = mic,
 	};
 
-	msg = l_queue_remove_if(net->msg_cache, match_cache, &tst);
+	msg = l_queue_find(net->msg_cache, match_cache, &tst);
 
 	if (msg) {
 		l_debug("Supressing duplicate %4.4x + %6.6x + %8.8x",
 							src, seq, mic);
-		l_queue_push_head(net->msg_cache, msg);
 		return true;
 	}
 
-- 
2.20.1





