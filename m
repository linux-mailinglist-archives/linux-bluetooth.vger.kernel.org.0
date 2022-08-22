Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0895259B7B3
	for <lists+linux-bluetooth@lfdr.de>; Mon, 22 Aug 2022 04:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbiHVCdL (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 21 Aug 2022 22:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232072AbiHVCdI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 21 Aug 2022 22:33:08 -0400
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D5223156
        for <linux-bluetooth@vger.kernel.org>; Sun, 21 Aug 2022 19:33:06 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rjp.ie; s=key1;
        t=1661135584;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=U9QwhyOc9y/8tJVF9wA4cQnW03q5qtqDDiW1VE/V6yc=;
        b=MENcWjtHctpk2Zt2cFReD8KygjYsh54IgaPUJfpOZaRTUZoJlSIi9UcO4zhn5IrAfqoP2M
        DVUBViAGDBuIvlE5tFtKgbBY1lBcTb2U+D1wAH5tN7C8RHqKYefRqQpf3Q1mXWVd9jpJW3
        j/5iqLUTS5FZEJusTQlXKnrqnW/aP8U=
From:   Ronan Pigott <ronan@rjp.ie>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ] zsh: drop no more arguments message
Date:   Sun, 21 Aug 2022 19:32:43 -0700
Message-Id: <20220822023242.18162-1-ronan@rjp.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: rjp.ie
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This usage of the _message as a completion function is invalid, and
will result in an error if invoked by _arguments when the user has a
format style set for completion messages.

We can just drop this message, since it is not necessary.
---
 completion/zsh/_bluetoothctl | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/completion/zsh/_bluetoothctl b/completion/zsh/_bluetoothctl
index bf35e503e..610ca2b8d 100644
--- a/completion/zsh/_bluetoothctl
+++ b/completion/zsh/_bluetoothctl
@@ -68,8 +68,7 @@ _bluetoothctl() {
 		'(info)'{-m,--monitor}'[Enable monitor output]' \
 		+ 'command' \
 		'(info):command:->command' \
-		'(info):: :->argument' \
-		': :_message "no more arguments"'
+		'(info):: :->argument'
 
 	if [[ $state == "command" ]]; then
 		_describe -t commands 'command' all_commands
-- 
2.37.2

