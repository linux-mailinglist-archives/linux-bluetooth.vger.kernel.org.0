Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38CFD5BA244
	for <lists+linux-bluetooth@lfdr.de>; Thu, 15 Sep 2022 23:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiIOVSd (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 15 Sep 2022 17:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiIOVSb (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 15 Sep 2022 17:18:31 -0400
Received: from smtp.github.com (out-25.smtp.github.com [192.30.252.208])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A19303C6
        for <linux-bluetooth@vger.kernel.org>; Thu, 15 Sep 2022 14:18:30 -0700 (PDT)
Received: from github.com (hubbernetes-node-12e74ca.ash1-iad.github.net [10.56.208.71])
        by smtp.github.com (Postfix) with ESMTPA id 504F48404F9
        for <linux-bluetooth@vger.kernel.org>; Thu, 15 Sep 2022 14:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1663276710;
        bh=t+GfONaa26b/IRuW98chqerpIPNWAw7IKZrTjukjCw8=;
        h=Date:From:To:Subject:From;
        b=FT2YCTxG/zfVE7lnZFb9Oez/dKb8fAoe65cKtc7mi2X3K3CmD61xRnDEKjKDcQ6fq
         CMmdwrTzH4yZuk6g9q5shzcg1b8ufxC/mzaA8mdWOaEJT/qicCGX5hWEdKqzfkcbhq
         U9Go4sTCl3pZXIwyULqqtlhPRBbX3MIMx2PBqD+Y=
Date:   Thu, 15 Sep 2022 14:18:30 -0700
From:   Sathish Narasimman <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/877b88-af1bfb@github.com>
Subject: [bluez/bluez] b632ec: rfcomm-tester: Add test to close socket while
 conn...
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
  Commit: b632ec3f3240aef4b68360085f330b6e50c9ec3b
      https://github.com/bluez/bluez/commit/b632ec3f3240aef4b68360085f330b6e50c9ec3b
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-09-13 (Tue, 13 Sep 2022)

  Changed paths:
    M tools/rfcomm-tester.c

  Log Message:
  -----------
  rfcomm-tester: Add test to close socket while connecting

This adds Basic RFCOMM Socket Client - Close test which attempt to close
socket while connecting.


  Commit: af1bfbb470c04a4d09ed999ac4975642b61ccd36
      https://github.com/bluez/bluez/commit/af1bfbb470c04a4d09ed999ac4975642b61ccd36
  Author: Sathish Narasimman <sathish.narasimman@intel.com>
  Date:   2022-09-15 (Thu, 15 Sep 2022)

  Changed paths:
    M lib/uuid.h

  Log Message:
  -----------
  lib/uuid: Add VCS UUIDs

This adds Volume Control Service UUIDs which will be used by
Volume Control Profile.


Compare: https://github.com/bluez/bluez/compare/877b88c5f2e9...af1bfbb470c0
