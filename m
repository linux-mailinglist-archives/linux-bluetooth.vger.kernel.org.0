Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF8A1787131
	for <lists+linux-bluetooth@lfdr.de>; Thu, 24 Aug 2023 16:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239152AbjHXOKZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 24 Aug 2023 10:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241574AbjHXOKR (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 24 Aug 2023 10:10:17 -0400
Received: from out-25.smtp.github.com (out-25.smtp.github.com [192.30.252.208])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E9D1BF7
        for <linux-bluetooth@vger.kernel.org>; Thu, 24 Aug 2023 07:10:02 -0700 (PDT)
Received: from github.com (hubbernetes-node-cdbf358.ash1-iad.github.net [10.56.131.54])
        by smtp.github.com (Postfix) with ESMTPA id 4A95A340868
        for <linux-bluetooth@vger.kernel.org>; Thu, 24 Aug 2023 07:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1692886201;
        bh=ygXSNlh1VCbZCcuTcA9am4SzrY5ObW2SnXZapkobzo4=;
        h=Date:From:To:Subject:From;
        b=T/FVBWWtjdFljc3kABAZTwMnpwo4jqp1OFLK48TsObInOKNmE4UuawdiTwP+jjyGe
         y6yyVXt8/xDXEEo1gHr29NC8elo5KGuUa7OkDrtwnLwdXuSDG5zwrA+ZBKLCzHBjfn
         HRyfj7lHW6/8cHCBNZAsBr0Mdua2v8sImBDJrWnU=
Date:   Thu, 24 Aug 2023 07:10:01 -0700
From:   Marcel Holtmann <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/8b2f00-176d01@github.com>
Subject: [bluez/bluez] 176d01: build: Update library version
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 176d0154b7f8ce16051762bf53cefa2935b08996
      https://github.com/bluez/bluez/commit/176d0154b7f8ce16051762bf53cefa2935b08996
  Author: Marcel Holtmann <marcel@holtmann.org>
  Date:   2023-08-24 (Thu, 24 Aug 2023)

  Changed paths:
    M Makefile.am

  Log Message:
  -----------
  build: Update library version


