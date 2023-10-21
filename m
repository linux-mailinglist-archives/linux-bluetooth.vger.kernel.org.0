Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA967D1A3A
	for <lists+linux-bluetooth@lfdr.de>; Sat, 21 Oct 2023 03:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjJUBJg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 20 Oct 2023 21:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjJUBJf (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 20 Oct 2023 21:09:35 -0400
Received: from out-25.smtp.github.com (out-25.smtp.github.com [192.30.252.208])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 738F19F
        for <linux-bluetooth@vger.kernel.org>; Fri, 20 Oct 2023 18:09:33 -0700 (PDT)
Received: from github.com (hubbernetes-node-15a5d0f.ash1-iad.github.net [10.56.14.13])
        by smtp.github.com (Postfix) with ESMTPA id B90E8341191
        for <linux-bluetooth@vger.kernel.org>; Fri, 20 Oct 2023 18:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1697850572;
        bh=1oD5ZpfzjoMCCBRGVHp9zIUZgLayJCaBanMYw0Wd1DM=;
        h=Date:From:To:Subject:From;
        b=aFsijClb3jsrIWd0rDPtL0rrrQNo4Ibfj0nRCGQRck2CCW5T9JruONxnp9xeQ9/J3
         Len5SfAp3u7Lj5YnxBPsRDXWsStx+IlFzAR3pPjjwKC6Il0mrF9D/kKC0DwLm65WT/
         aIGnDv/0iyY+Y9nTazMZQOmLXbtCARxPDhSKEHhs=
Date:   Fri, 20 Oct 2023 18:09:32 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/f02e0c-e126cf@github.com>
Subject: [bluez/bluez] 5fd6d8: shared/bap: Remove Locations, Support Context
 and ...
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
  Commit: 5fd6d8cf905b790b30ff672c450b7e5c34238eda
      https://github.com/bluez/bluez/commit/5fd6d8cf905b790b30ff672c450b7e5c34238eda
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-10-20 (Fri, 20 Oct 2023)

  Changed paths:
    M src/shared/bap.c

  Log Message:
  -----------
  shared/bap: Remove Locations, Support Context and Context defines

These values shall come from the upper stack.


  Commit: e126cf204907bb98f8b60d23bcb3dfa46064b9a3
      https://github.com/bluez/bluez/commit/e126cf204907bb98f8b60d23bcb3dfa46064b9a3
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-10-20 (Fri, 20 Oct 2023)

  Changed paths:
    M client/player.c

  Log Message:
  -----------
  client: Add support for setting Locations, SupportedContext and Context

This adds proper defaults for Locations, SupportedContext and Context
properties since bluetoothd no longer automatically set proper
defaults.


Compare: https://github.com/bluez/bluez/compare/f02e0c8664a6...e126cf204907
