Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06DE55EFF31
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Sep 2022 23:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbiI2VTq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 29 Sep 2022 17:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiI2VTo (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 29 Sep 2022 17:19:44 -0400
Received: from out-23.smtp.github.com (out-23.smtp.github.com [192.30.252.206])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842C9BCB5
        for <linux-bluetooth@vger.kernel.org>; Thu, 29 Sep 2022 14:19:41 -0700 (PDT)
Received: from github.com (hubbernetes-node-d18a413.ac4-iad.github.net [10.52.202.88])
        by smtp.github.com (Postfix) with ESMTPA id EFB58600B00
        for <linux-bluetooth@vger.kernel.org>; Thu, 29 Sep 2022 14:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1664486381;
        bh=z+pBQM/oMk3vRmLg5TFDhiD6tjs/auDKkMoNru5NpuI=;
        h=Date:From:To:Subject:From;
        b=XDwmkcYlU/n1TAqcVhnOBz5tlS6JB4aCazmk+Uf+bNzl6d5dPQ2OepyUC268/upDK
         kMikrMVpC8eGMvhoDEn5Lww7a9MYbcybkUA2jG2q1jkffQbNVRHII0N9eM/cfNgMz5
         Mjh4GuqtjnSWir5UNwJtEmYRaKppqSti4TfZVOyk=
Date:   Thu, 29 Sep 2022 14:19:40 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/3b47cf-25a31f@github.com>
Subject: [bluez/bluez] 25a31f: client/player: Fix attempting to acquire
 already a...
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 25a31f5a930e0bd724cc55b0595b082a732ccd79
      https://github.com/bluez/bluez/commit/25a31f5a930e0bd724cc55b0595b082a732ccd79
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-09-29 (Thu, 29 Sep 2022)

  Changed paths:
    M client/player.c

  Log Message:
  -----------
  client/player: Fix attempting to acquire already acquired transport

If the transport has links check if the link is acquiring before
attempting to call Acquire otherwise it may cause an error to be
printed.


