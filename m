Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5A354EA41
	for <lists+linux-bluetooth@lfdr.de>; Thu, 16 Jun 2022 21:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378429AbiFPTiH (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 16 Jun 2022 15:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378431AbiFPTiF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 16 Jun 2022 15:38:05 -0400
Received: from out-23.smtp.github.com (out-23.smtp.github.com [192.30.252.206])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578B637017
        for <linux-bluetooth@vger.kernel.org>; Thu, 16 Jun 2022 12:38:04 -0700 (PDT)
Received: from github.com (hubbernetes-node-200a744.ac4-iad.github.net [10.52.223.22])
        by smtp.github.com (Postfix) with ESMTPA id BC933600618
        for <linux-bluetooth@vger.kernel.org>; Thu, 16 Jun 2022 12:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1655408283;
        bh=+dFEc8lE3l9qeZZq05b2P8qS4K9RloKKdFmHSWtQlMs=;
        h=Date:From:To:Subject:From;
        b=jbMKsDn48Xxw0MxYC1L+iUxeZO5dOF+f2ytfRp8lp0dfUkgbXowgwExQuvp971kw4
         uaNEWVbashBZyITMxcTV/KyxC+8ngFKeDDKLLqPIY0FpjEkkZjYof3BObPLSqZQ//E
         6n5UVxKOs9Fii+jtHqY8JF2mjXwZl9ngEt7Xt4Ag=
Date:   Thu, 16 Jun 2022 12:38:03 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/5cc085-afc8c8@github.com>
Subject: [bluez/bluez] a5382b: main.conf: Split Kernel Experimental UUIDs from
 Ex...
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
  Commit: a5382ba2f09c45ca2bf5ef59ec2b415eae4f26cc
      https://github.com/bluez/bluez/commit/a5382ba2f09c45ca2bf5ef59ec2b415eae4f26cc
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-06-14 (Tue, 14 Jun 2022)

  Changed paths:
    M src/adapter.c
    M src/btd.h
    M src/main.c
    M src/main.conf

  Log Message:
  -----------
  main.conf: Split Kernel Experimental UUIDs from Experimental

This splits kernel experimental UUIDs from D-Bus Experimental interface
so they can be controlled indenpendetly.


  Commit: afc8c8f56fa2376137cd093bb5a8c63dc408d94f
      https://github.com/bluez/bluez/commit/afc8c8f56fa2376137cd093bb5a8c63dc408d94f
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-06-14 (Tue, 14 Jun 2022)

  Changed paths:
    M src/bluetoothd.rst.in

  Log Message:
  -----------
  bluetoothd.rst: Document -K/--kernel option

This documents -K/--kernel experimental features options.


Compare: https://github.com/bluez/bluez/compare/5cc08527c0aa...afc8c8f56fa2
