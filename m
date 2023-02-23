Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0476A0E82
	for <lists+linux-bluetooth@lfdr.de>; Thu, 23 Feb 2023 18:17:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjBWRRk (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 23 Feb 2023 12:17:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjBWRRi (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 23 Feb 2023 12:17:38 -0500
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF773CE39
        for <linux-bluetooth@vger.kernel.org>; Thu, 23 Feb 2023 09:17:37 -0800 (PST)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 750F3240635
        for <linux-bluetooth@vger.kernel.org>; Thu, 23 Feb 2023 18:17:36 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4PN08H5Yvjz9rxL;
        Thu, 23 Feb 2023 18:17:35 +0100 (CET)
From:   Pauli Virtanen <pav@iki.fi>
To:     linux-bluetooth@vger.kernel.org
Cc:     Pauli Virtanen <pav@iki.fi>
Subject: [RESEND PATCH BlueZ] shared/bap: fix crash unregistering media endpoint while streaming
Date:   Thu, 23 Feb 2023 17:17:34 +0000
Message-Id: <52b90e261de4afaabcec561122c0880b3bc7b608.1677172391.git.pav@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NEUTRAL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The following ASAN crash is observed when media endpoint is unregistered
(stopping sound server) while streaming from remote BAP client:

ERROR: AddressSanitizer: heap-use-after-free on address 0x60b0000474d8
READ of size 8 at 0x60b0000474d8 thread T0
    #0 0x7a27c6 in stream_set_state src/shared/bap.c:1227
    #1 0x7aff61 in remove_streams src/shared/bap.c:2483
    #2 0x71d2d0 in queue_foreach src/shared/queue.c:207
    #3 0x7b0152 in bt_bap_remove_pac src/shared/bap.c:2501
    #4 0x463cda in media_endpoint_destroy profiles/audio/media.c:179
    ...
0x60b0000474d8 is located 8 bytes inside of 112-byte region
freed by thread T0 here:
    #0 0x7f93b12b9388 in __interceptor_free.part.0 (/lib64/libasan.so.8+0xb9388)
    #1 0x7a0504 in bap_stream_free src/shared/bap.c:972
    #2 0x7a0800 in bap_stream_detach src/shared/bap.c:989
    #3 0x7a26d1 in bap_stream_state_changed src/shared/bap.c:1208
    #4 0x7a2ab4 in stream_set_state src/shared/bap.c:1252
    #5 0x7ab18a in stream_release src/shared/bap.c:1985
    #6 0x7c6919 in bt_bap_stream_release src/shared/bap.c:4572
    #7 0x7aff50 in remove_streams src/shared/bap.c:2482
    ...
previously allocated by thread T0 here:
    #0 0x7f93b12ba6af in __interceptor_malloc (/lib64/libasan.so.8+0xba6af)
    #1 0x71e9ae in util_malloc src/shared/util.c:43
    #2 0x79c2f5 in bap_stream_new src/shared/bap.c:766
    #3 0x7a4863 in ep_config src/shared/bap.c:1446
    #4 0x7a4f22 in ascs_config src/shared/bap.c:1481
    ...

When stream->client is false, bt_bap_stream_release already sets the
stream to idle and frees it.

Fix the crash by not setting the state to idle for the second time,
in this case.
---

Notes:
    Resend, in case this was missed.
    
    Crash seen when testing BlueZ at commit 67395a3b357d.
    Also occurs on current BlueZ master branch.

 src/shared/bap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/shared/bap.c b/src/shared/bap.c
index f16ba1832..5601accde 100644
--- a/src/shared/bap.c
+++ b/src/shared/bap.c
@@ -2480,8 +2480,11 @@ static void remove_streams(void *data, void *user_data)
 
 	stream = queue_remove_if(bap->streams, match_stream_lpac, pac);
 	if (stream) {
+		bool client = stream->client;
+
 		bt_bap_stream_release(stream, NULL, NULL);
-		stream_set_state(stream, BT_BAP_STREAM_STATE_IDLE);
+		if (client)
+			stream_set_state(stream, BT_BAP_STREAM_STATE_IDLE);
 	}
 }
 
-- 
2.39.2

