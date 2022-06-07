Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 139CA5344AE
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 May 2022 22:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242983AbiEYUHV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 25 May 2022 16:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345032AbiEYUHS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 25 May 2022 16:07:18 -0400
Received: from smtp.github.com (out-17.smtp.github.com [192.30.252.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB3A86B7E0
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 May 2022 13:07:11 -0700 (PDT)
Received: from github.com (hubbernetes-node-225289b.va3-iad.github.net [10.48.125.47])
        by smtp.github.com (Postfix) with ESMTPA id 011C05C0D13
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 May 2022 13:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1653509231;
        bh=mmWWs0eEk7OfZnuvSZcAaGySefUgd3Z5OhBZa9La0kY=;
        h=Date:From:To:Subject:From;
        b=vqxbwrSyML+CzljkM3v4Iq1oy1B7BDsazZWzzXWd5bz/LyFWkk8QeiWLGgdpz4qDA
         kPEC2eQpvRvLNHP0EdDtTCd+YFc3OREvS08xNLL71x24I7O7o/zIbywkuyYirAsN0Q
         s9e/tfA5nj5VSwjfhCI5cUFzRQZ/ykls/pmqmMHs=
Date:   Wed, 25 May 2022 13:07:10 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/79fe52-1ffd74@github.com>
Subject: [bluez/bluez] 2894f1: monitor/att: Attempt to reload if database is
 empty
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 2894f1392fbe5e570039e9a753c7065cb8fcbf01
      https://github.com/bluez/bluez/commit/2894f1392fbe5e570039e9a753c7065cb8fcbf01
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-05-25 (Wed, 25 May 2022)

  Changed paths:
    M monitor/att.c

  Log Message:
  -----------
  monitor/att: Attempt to reload if database is empty

If database is empty attempt to reload since the daemon may have
updated its cache in the meantime.


  Commit: 1ffd74a6d4212a165763dc53e58a1b49b6fc5a98
      https://github.com/bluez/bluez/commit/1ffd74a6d4212a165763dc53e58a1b49b6fc5a98
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-05-25 (Wed, 25 May 2022)

  Changed paths:
    M monitor/att.c
    M monitor/l2cap.h

  Log Message:
  -----------
  monitor/att: Fix parsing of notifications

If there are multiple notifications in the same frame the callback may
alter it when using l2cap_frame_pull helpers, so instead this passes a
cloned frame with just the expected length so callbacks cannot alter
original frame.


Compare: https://github.com/bluez/bluez/compare/79fe529d6485...1ffd74a6d421
