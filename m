Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0C645E812B
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Sep 2022 19:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231805AbiIWRyv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 23 Sep 2022 13:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbiIWRyu (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 23 Sep 2022 13:54:50 -0400
Received: from out-23.smtp.github.com (out-23.smtp.github.com [192.30.252.206])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFE89326C6
        for <linux-bluetooth@vger.kernel.org>; Fri, 23 Sep 2022 10:54:47 -0700 (PDT)
Received: from github.com (hubbernetes-node-d332492.ac4-iad.github.net [10.52.200.35])
        by smtp.github.com (Postfix) with ESMTPA id F21D0600804
        for <linux-bluetooth@vger.kernel.org>; Fri, 23 Sep 2022 10:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1663955686;
        bh=SWrB7BrXds6+VHKD7ko98b269XurvrKELmK34LcHPiY=;
        h=Date:From:To:Subject:From;
        b=tByjsNAq+EQhbpthIZGZZVTJezBfv+WlKrPJP6VtIMGZNMIWwfTU0u6ZkLair+xBc
         D2qUNGR+Sg4ZWmIOVObP7sgoOKcW4Ke/tQfp2LkwQW7NBzwtih5rF6USkPN2rg384S
         VZUzAI8Mfn70P4E0EkN+Q7KlMB5CoPFj2ADqIb5Q=
Date:   Fri, 23 Sep 2022 10:54:46 -0700
From:   iwestin <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/721d5a-95d9dc@github.com>
Subject: [bluez/bluez] 32d866: mesh: Clear addr field if virt sub failed
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
  Commit: 32d866b4df928aa1d7785da7f83d089f64d42797
      https://github.com/bluez/bluez/commit/32d866b4df928aa1d7785da7f83d089f64d42797
  Author: Isak Westin <isak.westin@loytec.com>
  Date:   2022-09-23 (Fri, 23 Sep 2022)

  Changed paths:
    M mesh/cfgmod-server.c

  Log Message:
  -----------
  mesh: Clear addr field if virt sub failed

If processing failed for a Config Model Subscription Virtual Address
Add/Delete/Overwrite message, the address field in the status reply
should be set to zero. See MshPRFv1.0.1 section 4.4.1.2.8.


  Commit: 95d9dc6764fc3859af9528c222eef95e843a9cbc
      https://github.com/bluez/bluez/commit/95d9dc6764fc3859af9528c222eef95e843a9cbc
  Author: Isak Westin <isak.westin@loytec.com>
  Date:   2022-09-23 (Fri, 23 Sep 2022)

  Changed paths:
    M mesh/appkey.c

  Log Message:
  -----------
  mesh: Reply error if appkey added for wrong netkey

If a known appkey is added for a different netkey, the status reply
should be Invalid NetKey.


Compare: https://github.com/bluez/bluez/compare/721d5a8ae86d...95d9dc6764fc
