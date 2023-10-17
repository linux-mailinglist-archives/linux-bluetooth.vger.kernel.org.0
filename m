Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23E1E7CC901
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Oct 2023 18:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234971AbjJQQlV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 17 Oct 2023 12:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233260AbjJQQlU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 17 Oct 2023 12:41:20 -0400
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E8994
        for <linux-bluetooth@vger.kernel.org>; Tue, 17 Oct 2023 09:41:18 -0700 (PDT)
Received: from github.com (hubbernetes-node-0eda8af.ac4-iad.github.net [10.52.206.117])
        by smtp.github.com (Postfix) with ESMTPA id 3CEB37010AA
        for <linux-bluetooth@vger.kernel.org>; Tue, 17 Oct 2023 09:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1697560878;
        bh=wvgfxjxyAQeclXsYSHP4zMVrhPBGG9v++MKG2HkUCow=;
        h=Date:From:To:Subject:From;
        b=CYzkAKpFhwWUL1iaDS1k1vuYBr20D+Bok0GZBdwnUnBs8q6y+lspqInrASJEXGZl8
         VjXOOvT/PS/HYPkYgBypUot95AgCr+q6thZV3qmmSND+WPJCYLcPLfK5hVGS3XdKXB
         COi44rkoYe1bicq0iKVnAFTnXOSNiW93Zo4tWKqk=
Date:   Tue, 17 Oct 2023 09:41:18 -0700
From:   inga-s <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/66c41d-0c757e@github.com>
Subject: [bluez/bluez] 0c757e: mesh: Fix check for active scan when using
 generic IO
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 0c757e8eeef69ff2b1eefa59e590f171c9fe1c88
      https://github.com/bluez/bluez/commit/0c757e8eeef69ff2b1eefa59e590f171c9fe1c88
  Author: Inga Stotland <inga.stotland@gmail.com>
  Date:   2023-10-16 (Mon, 16 Oct 2023)

  Changed paths:
    M mesh/mesh-io-generic.c

  Log Message:
  -----------
  mesh: Fix check for active scan when using generic IO

This modifies the check for an active scan in generic IO:
the bug has been introduced during earlier code refactoring.

Fixes: https://github.com/bluez/bluez/issues/625


