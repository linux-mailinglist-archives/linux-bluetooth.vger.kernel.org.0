Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 771FF5FA6E0
	for <lists+linux-bluetooth@lfdr.de>; Mon, 10 Oct 2022 23:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiJJVTF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 10 Oct 2022 17:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiJJVTE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 10 Oct 2022 17:19:04 -0400
Received: from smtp.github.com (out-21.smtp.github.com [192.30.252.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18877961F
        for <linux-bluetooth@vger.kernel.org>; Mon, 10 Oct 2022 14:19:02 -0700 (PDT)
Received: from github.com (hubbernetes-node-5478a13.ac4-iad.github.net [10.52.207.50])
        by smtp.github.com (Postfix) with ESMTPA id 377A5520F94
        for <linux-bluetooth@vger.kernel.org>; Mon, 10 Oct 2022 14:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1665436742;
        bh=de1p0LFQbMnJWqXJqPoX1+eXrum7h/VECC3xEWyLnKE=;
        h=Date:From:To:Subject:From;
        b=mx8zmnDJiqEYJBbsTeQ9eiBLbDwZTbl5h0F2NkROCkdOruJsq550Ds4D+4/cze/v2
         380QFJsaI9llWMOm83TFPleZBu1ht7gGWepE28D7jBvzrnuscWIe5h85pDHpaB3GJW
         S6ZWor7aABYf575ardBZk2It0NChuLykb3ZDr5fU=
Date:   Mon, 10 Oct 2022 14:19:02 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/3da439-906585@github.com>
Subject: [bluez/bluez] c94cdb: btdev: Add support for setting bdaddr
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
  Commit: c94cdbc6d73ffd818d862975895d48dd01361234
      https://github.com/bluez/bluez/commit/c94cdbc6d73ffd818d862975895d48dd01361234
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-10-10 (Mon, 10 Oct 2022)

  Changed paths:
    M emulator/btdev.c
    M emulator/btdev.h

  Log Message:
  -----------
  btdev: Add support for setting bdaddr

This adds btdev_set_bdaddr so it is possible to set an arbritrary
address.


  Commit: c2bf15137410c92f346ff8031bdfaa756fb8b16e
      https://github.com/bluez/bluez/commit/c2bf15137410c92f346ff8031bdfaa756fb8b16e
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-10-10 (Mon, 10 Oct 2022)

  Changed paths:
    M emulator/vhci.c
    M emulator/vhci.h

  Log Message:
  -----------
  vhci: Add function to interact with force_static_address

This adds functions that can be used to set debugfs
force_static_address.


  Commit: 9065853fe5c70db2b9ca42fd40b027746e85f56d
      https://github.com/bluez/bluez/commit/9065853fe5c70db2b9ca42fd40b027746e85f56d
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-10-10 (Mon, 10 Oct 2022)

  Changed paths:
    M tools/mgmt-tester.c

  Log Message:
  -----------
  mgmt-tester: Fix Set Static Address tests

Set Static Address tests needs to power after setting the address since
the programming of the address using the HCI command only happens during
power on procedure.


Compare: https://github.com/bluez/bluez/compare/3da439ae3c76...9065853fe5c7
