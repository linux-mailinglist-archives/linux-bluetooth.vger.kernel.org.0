Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFE17531D53
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 May 2022 23:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbiEWVEz (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 23 May 2022 17:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbiEWVEy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 23 May 2022 17:04:54 -0400
Received: from smtp.github.com (out-22.smtp.github.com [192.30.252.205])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D9274DD0
        for <linux-bluetooth@vger.kernel.org>; Mon, 23 May 2022 14:04:51 -0700 (PDT)
Received: from github.com (hubbernetes-node-aac8d94.ac4-iad.github.net [10.52.205.36])
        by smtp.github.com (Postfix) with ESMTPA id 012107205E3
        for <linux-bluetooth@vger.kernel.org>; Mon, 23 May 2022 14:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1653339891;
        bh=B78KIdLHQUJ8LcM8TSO1ac69ZT38dBxLUzBMVQ0UhaU=;
        h=Date:From:To:Subject:From;
        b=Xnv5xW5GmI4mtvQpaUCau5kiJQZ66oGfQ2JznYzC1F5ijUePkEMuod3qzUXHDeOgg
         Q41uArxVpIYywX7TznRdKTQ2hvMBW1NTH4vfcXtfb4brgGs2cJcQi3Sm+QZ97SuqRO
         CiUMbId5hkBjPLlZ0h6A51AWm5TOBZ1JSbssqOdc=
Date:   Mon, 23 May 2022 14:04:50 -0700
From:   inga-s <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/bbdd18-79fe52@github.com>
Subject: [bluez/bluez] 79fe52: client: Fix setting of advertisement interval
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
  Commit: 79fe529d64855e1e482d3c265d89b7bbe7c99ab9
      https://github.com/bluez/bluez/commit/79fe529d64855e1e482d3c265d89b7bbe7c99ab9
  Author: Inga Stotland <inga.stotland@intel.com>
  Date:   2022-05-23 (Mon, 23 May 2022)

  Changed paths:
    M client/main.c

  Log Message:
  -----------
  client: Fix setting of advertisement interval

This fixes incorrect argument read when using "interval" command
in "advertisement" submenu


