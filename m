Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3BD77A27C7
	for <lists+linux-bluetooth@lfdr.de>; Fri, 15 Sep 2023 22:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237058AbjIOUL5 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 15 Sep 2023 16:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237463AbjIOULY (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 15 Sep 2023 16:11:24 -0400
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB2C2700
        for <linux-bluetooth@vger.kernel.org>; Fri, 15 Sep 2023 13:11:12 -0700 (PDT)
Received: from github.com (hubbernetes-node-af2f4e6.ash1-iad.github.net [10.56.208.39])
        by smtp.github.com (Postfix) with ESMTPA id 00DC2101019
        for <linux-bluetooth@vger.kernel.org>; Fri, 15 Sep 2023 13:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1694808672;
        bh=IkKe5aQxbvHhhSDRxN+Nsqbvolid7CR7/TVzE+BuOf0=;
        h=Date:From:To:Subject:From;
        b=ZAtEkDL9Lxsb3RRyjuQEFomvNzCOWCfR4wIJEMfYLHFTI1JjARSmmJWHJWasW5/3N
         FOMKL6fA4hRw83Ja04fSuTYgrkVfwsEC2fat0yBWJFdIhDDrDjpgCUUOiYKOSYc/ZT
         gaE1gjsxjI4FUNtBLhSp9Mixhury0oOCT9Le1KPI=
Date:   Fri, 15 Sep 2023 13:11:11 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/f83836-7b9d2f@github.com>
Subject: [bluez/bluez] d46f91: l2cap-tester: Add tests for closing socket
 before ...
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
  Commit: d46f91c5be579ed131fd08e096b7c7187ef4c388
      https://github.com/bluez/bluez/commit/d46f91c5be579ed131fd08e096b7c7187ef4c388
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-09-14 (Thu, 14 Sep 2023)

  Changed paths:
    M tools/l2cap-tester.c

  Log Message:
  -----------
  l2cap-tester: Add tests for closing socket before connection completes

This adds the following tests which attempts to close/shutdown the
socket before the connection completes:

L2CAP BR/EDR Client - Close
L2CAP LE Client - Close
L2CAP Ext-Flowctl Client - Close


  Commit: 7b9d2f3c763408bfe733c3bf70979a12938a448d
      https://github.com/bluez/bluez/commit/7b9d2f3c763408bfe733c3bf70979a12938a448d
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-09-14 (Thu, 14 Sep 2023)

  Changed paths:
    M tools/l2cap-tester.c

  Log Message:
  -----------
  l2cap-tester: Add tests for connection timeout

This adds the following tests which attempts to use SO_SNDTIMEO so the
socket times out before the connection completes:

L2CAP BR/EDR Client - Timeout
L2CAP LE Client - Timeout
L2CAP Ext-Flowctl Client - Timeout


Compare: https://github.com/bluez/bluez/compare/f838361bf0a3...7b9d2f3c7634
