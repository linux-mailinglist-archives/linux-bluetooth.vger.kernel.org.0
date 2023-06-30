Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3057443B5
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jun 2023 23:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232365AbjF3VBb (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 30 Jun 2023 17:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231718AbjF3VBa (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 30 Jun 2023 17:01:30 -0400
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB7C93C2A
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jun 2023 14:01:29 -0700 (PDT)
Received: from github.com (hubbernetes-node-00f8bab.va3-iad.github.net [10.48.139.38])
        by smtp.github.com (Postfix) with ESMTPA id 4D5B14110B
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jun 2023 14:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1688158888;
        bh=iJxD3HsKWoeF0J2mGXzup1sos9UIGCTeeINsuGn2H7A=;
        h=Date:From:To:Subject:From;
        b=Fvzn0M7BLKwfTnG22+RDlQ2maud/bEfc0ovsqO6lA0LuTDzsYJPMBFAnm9XeKzE6B
         XUUq9R9D/3XJL2TSZKy1CYb1KiEyEzH3IQCAjgaj2E8WwJK06TrcKvcmA4ClUIjabq
         ip0w73SoJZz1K5zTxD4lpQ9jqgaiVOeKEJRPApXg=
Date:   Fri, 30 Jun 2023 14:01:28 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/d4b9d8-19319b@github.com>
Subject: [bluez/bluez] 19319b: transport: Fix crash on Transport.Acquire
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 19319bd3e22ed7945f118bc5faf62a6380070e4a
      https://github.com/bluez/bluez/commit/19319bd3e22ed7945f118bc5faf62a6380070e4a
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-06-30 (Fri, 30 Jun 2023)

  Changed paths:
    M profiles/audio/transport.c

  Log Message:
  -----------
  transport: Fix crash on Transport.Acquire

This fixes crash introduced by 3030883 which caused requests not be
initialized properly for A2DP.

Fixes: https://github.com/bluez/bluez/issues/542


