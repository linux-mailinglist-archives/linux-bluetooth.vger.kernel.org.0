Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21FA55B6551
	for <lists+linux-bluetooth@lfdr.de>; Tue, 13 Sep 2022 04:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiIMCC4 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 12 Sep 2022 22:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiIMCCy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 12 Sep 2022 22:02:54 -0400
Received: from smtp.github.com (out-17.smtp.github.com [192.30.252.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C7125298
        for <linux-bluetooth@vger.kernel.org>; Mon, 12 Sep 2022 19:02:53 -0700 (PDT)
Received: from github.com (hubbernetes-node-077a267.va3-iad.github.net [10.48.206.69])
        by smtp.github.com (Postfix) with ESMTPA id 2B8FA5C00CE
        for <linux-bluetooth@vger.kernel.org>; Mon, 12 Sep 2022 19:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1663034573;
        bh=igqXnAV/28GgqfpPAPqU0X4vw3+2ZZ83uKHywsbrydk=;
        h=Date:From:To:Subject:From;
        b=wMRUfdClIP/iEhZ+EgATIqWhqOUNwk5p/bwKpEfO6aDScZozTcz0J1nU0yvDlicTj
         kOdAQZmepXG7mHGkP8PXnhfWf3rCvfsT7DluVPvuoI05Rjj0lncoOP/iRUMc6D2vre
         UGHGu7u+ofFML6JqwW57kYtJdRGeIse+vCUeh80w=
Date:   Mon, 12 Sep 2022 19:02:53 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/9d8fd3-877b88@github.com>
Subject: [bluez/bluez] 877b88: shared/bap: Fix attempting to disable stream
 when ...
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
  Commit: 877b88c5f2e92dd8a6a2f98ee4a25c4c30ddd887
      https://github.com/bluez/bluez/commit/877b88c5f2e92dd8a6a2f98ee4a25c4c30ddd887
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-09-12 (Mon, 12 Sep 2022)

  Changed paths:
    M src/shared/bap.c

  Log Message:
  -----------
  shared/bap: Fix attempting to disable stream when it is idle

If the stream is already in idle state do not attempt to disable it
again.


