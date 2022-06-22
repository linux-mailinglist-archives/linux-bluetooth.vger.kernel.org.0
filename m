Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2AE45542E6
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 Jun 2022 08:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349994AbiFVGYz (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 Jun 2022 02:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349790AbiFVGYy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 Jun 2022 02:24:54 -0400
Received: from smtp.github.com (out-25.smtp.github.com [192.30.252.208])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8174F34661
        for <linux-bluetooth@vger.kernel.org>; Tue, 21 Jun 2022 23:24:53 -0700 (PDT)
Received: from github.com (hubbernetes-node-2cc84f4.ash1-iad.github.net [10.56.202.20])
        by smtp.github.com (Postfix) with ESMTPA id D205984047E
        for <linux-bluetooth@vger.kernel.org>; Tue, 21 Jun 2022 23:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1655879092;
        bh=lWDW9Ml0WWfyVj2Q6vkqQFny4xZzTD9LJY5xfzgZFls=;
        h=Date:From:To:Subject:From;
        b=wMPR8hXCIz4qcoi2lHFaeT2/tTq9IkZPrV6QP+VZOZ1jHwwqMulZrMQVx7YZvF4qM
         xavDs2b6isvymKYjRvA5SkAbDVCTLVlR/tEvknkckAbJWww/CN11dWxQOt8eNRkd8Q
         GOPzXU40IJN9QpbCGdTSBVn6R0QJMVLYHRt9liCI=
Date:   Tue, 21 Jun 2022 23:24:52 -0700
From:   Tedd Ho-Jeong An <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/71560e-b8b327@github.com>
Subject: [bluez/bluez] b8b327: tools/mgmt-tester: Add test case for scan
 response...
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
  Commit: b8b3277ba387fb245e68faa880a73967ac70c3cf
      https://github.com/bluez/bluez/commit/b8b3277ba387fb245e68faa880a73967ac70c3cf
  Author: Tedd Ho-Jeong An <tedd.an@intel.com>
  Date:   2022-06-21 (Tue, 21 Jun 2022)

  Changed paths:
    M tools/mgmt-tester.c

  Log Message:
  -----------
  tools/mgmt-tester: Add test case for scan response data is not updating

This patch adds a test case to test if the scan response data is updated
when the following scenarios are performed.

1. Add Extended Advertising Parameters Command
2. Add Extended Advertising Data Command w/ Scan Resp Data
3. Remove Advertising Command
4. Add Extended Advertising Parameters Command
5. Add Extended Advertising Data Command w/ Scan Resp Data
6. Host should set Scan Resp Data


