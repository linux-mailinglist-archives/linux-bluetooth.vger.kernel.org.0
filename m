Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB6CB64E52C
	for <lists+linux-bluetooth@lfdr.de>; Fri, 16 Dec 2022 01:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbiLPA2q (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 15 Dec 2022 19:28:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiLPA2p (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 15 Dec 2022 19:28:45 -0500
Received: from out-23.smtp.github.com (out-23.smtp.github.com [192.30.252.206])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 458DA1AF2F
        for <linux-bluetooth@vger.kernel.org>; Thu, 15 Dec 2022 16:28:45 -0800 (PST)
Received: from github.com (hubbernetes-node-9bbc16a.ac4-iad.github.net [10.52.211.84])
        by smtp.github.com (Postfix) with ESMTPA id A166360045A
        for <linux-bluetooth@vger.kernel.org>; Thu, 15 Dec 2022 16:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1671150524;
        bh=x0Ze5ZaXjz2ZPcy4mh/a8lad+XzJVXqfRYlcev2AuWg=;
        h=Date:From:To:Subject:From;
        b=JbZAHCG9lFrP4bDLDmFc7q1QAQeoM89y+vy6auc3fKzMlLHJPKw5Vl8J2pbes1cUF
         LOlRD8mhU015ROG2+KPg1FxricKFz7VhMR83Uo3nN1woFjnaXY1gkpQRs3KWVZOBZu
         ukemF8JXcBrQBA5yQr/0vHtN1BROgn+Ibe4suY58=
Date:   Thu, 15 Dec 2022 16:28:44 -0800
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/3d6e4b-1270af@github.com>
Subject: [bluez/bluez] 89b207: client/player: Make transport.send non-blocking
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 89b2072b4fe32c5ad1ceaad9fb1e58b1d1e03bc6
      https://github.com/bluez/bluez/commit/89b2072b4fe32c5ad1ceaad9fb1e58b1d1e03bc6
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-12-14 (Wed, 14 Dec 2022)

  Changed paths:
    M client/player.c

  Log Message:
  -----------
  client/player: Make transport.send non-blocking

This makes transport.send command non-blocking by using timerfd
callback to initiate the transfers.


  Commit: 7b8c87ccc2480deafa8483e125eae742d289116f
      https://github.com/bluez/bluez/commit/7b8c87ccc2480deafa8483e125eae742d289116f
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-12-14 (Wed, 14 Dec 2022)

  Changed paths:
    M src/shared/shell.c
    M src/shared/shell.h

  Log Message:
  -----------
  shared/shell: Add bt_shell_echo

This adds bt_shell_echo which can be used to print messages on the echo
area.


  Commit: e51d6c5f2e5105669812667c49a053d0f38af6b5
      https://github.com/bluez/bluez/commit/e51d6c5f2e5105669812667c49a053d0f38af6b5
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-12-15 (Thu, 15 Dec 2022)

  Changed paths:
    M client/player.c
    M src/shared/shell.c

  Log Message:
  -----------
  client/player: Use bt_shell_echo to print transfer progress

This uses bt_shell_echo to print transfer progress.


  Commit: 318b1a19cb74db768797876ee36f3f9f78fcb5bf
      https://github.com/bluez/bluez/commit/318b1a19cb74db768797876ee36f3f9f78fcb5bf
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-12-15 (Thu, 15 Dec 2022)

  Changed paths:
    M client/player.c

  Log Message:
  -----------
  client/player: Print transport progress

This uses bt_shell_echo to print out the transfer progress on the echo
area.


  Commit: 1270afa5aa1cfa19927c3bce1b8f84dbe9f35a2f
      https://github.com/bluez/bluez/commit/1270afa5aa1cfa19927c3bce1b8f84dbe9f35a2f
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-12-15 (Thu, 15 Dec 2022)

  Changed paths:
    M client/player.c

  Log Message:
  -----------
  client/player: Fix transport.send/receice tab completion

Commands transport.send/receive were not settings any completion
callback so this makes sure it uses transport_generator to generate the
list of transport that could be used to send.


Compare: https://github.com/bluez/bluez/compare/3d6e4bf14abf...1270afa5aa1c
