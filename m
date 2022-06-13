Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4901154A06B
	for <lists+linux-bluetooth@lfdr.de>; Mon, 13 Jun 2022 22:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347912AbiFMUzm (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 13 Jun 2022 16:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352270AbiFMUyT (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 13 Jun 2022 16:54:19 -0400
Received: from smtp.github.com (out-25.smtp.github.com [192.30.252.208])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 067612A953
        for <linux-bluetooth@vger.kernel.org>; Mon, 13 Jun 2022 13:22:35 -0700 (PDT)
Received: from github.com (hubbernetes-node-305353e.ash1-iad.github.net [10.56.224.52])
        by smtp.github.com (Postfix) with ESMTPA id 47F22840759
        for <linux-bluetooth@vger.kernel.org>; Mon, 13 Jun 2022 13:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1655151755;
        bh=I+0XoPpis3xYq5hGbJs+X+GePmJU7n7/XVeS+eTF6iI=;
        h=Date:From:To:Subject:From;
        b=R5hokgNTsYSnQtm8XGHweHXgJZ2MXUYMYhkEc4hPBpEKVr9KzBFVZjdYCIdU09qrI
         vJuRIdgN+/n/3JqRnu1VKhMOjg2BvM8Qg+nYs6tm9FbdHfr0iM2jW+narPEKAq7TEX
         gOwR2XPSxO+4XFYQGMu6cqiO9d3ZpTFNswLU79WE=
Date:   Mon, 13 Jun 2022 13:22:35 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/c6d3bc-12d6fd@github.com>
Subject: [bluez/bluez] 12d6fd: mgmt-tester: Fix regression with tests failing
 to ...
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
  Commit: 12d6fd9b9ddc8a7e98bdba744fabb96fefb08e3c
      https://github.com/bluez/bluez/commit/12d6fd9b9ddc8a7e98bdba744fabb96fefb08e3c
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-06-13 (Mon, 13 Jun 2022)

  Changed paths:
    M tools/mgmt-tester.c

  Log Message:
  -----------
  mgmt-tester: Fix regression with tests failing to setup

This fixes the regression introduced by
ab31e2f7e828df3d971cba6f12859edc69f149d5 which causes tests using
add_advertising_mgmt_cmd_arr:

Add Advertising - Success (Name+data+appear) Timed out
Add Ext Advertising - Success (Name+data+appear) Timed out


