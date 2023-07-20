Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8218D75B923
	for <lists+linux-bluetooth@lfdr.de>; Thu, 20 Jul 2023 23:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjGTVBV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 20 Jul 2023 17:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjGTVBU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 20 Jul 2023 17:01:20 -0400
Received: from out-25.smtp.github.com (out-25.smtp.github.com [192.30.252.208])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88FA519A6
        for <linux-bluetooth@vger.kernel.org>; Thu, 20 Jul 2023 14:01:19 -0700 (PDT)
Received: from github.com (hubbernetes-node-70ae9a2.ash1-iad.github.net [10.56.200.58])
        by smtp.github.com (Postfix) with ESMTPA id AC23A340D18
        for <linux-bluetooth@vger.kernel.org>; Thu, 20 Jul 2023 14:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1689886878;
        bh=xKv0UFNJiVDwLNKL73Ya3UCku5KCnrOuo8A2YWecVZI=;
        h=Date:From:To:Subject:From;
        b=WGFfO1dWy0MZxfg3fVDW2MCC3sdAb1guuVQjAI79gpK8AWMNvJVyMsOVCStd52MSS
         Abr4/8wP3z/GSb3qpsVhzBHDKD0IseK1PGvUggGpVR5+zzKRFRFL2kQ9yz0R0JVZ38
         JgGEUMIIxBt2NUfvTwPjI/KX7I1jVWtjMZsTMqnw=
Date:   Thu, 20 Jul 2023 14:01:18 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/b9e93e-82d3d8@github.com>
Subject: [bluez/bluez] 9ccebf: btmgmt: Add man page
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 9ccebfa7f91cb2aeb0c451592a7c4634569578f1
      https://github.com/bluez/bluez/commit/9ccebfa7f91cb2aeb0c451592a7c4634569578f1
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-07-20 (Thu, 20 Jul 2023)

  Changed paths:
    M Makefile.tools
    A tools/btmgmt.rst

  Log Message:
  -----------
  btmgmt: Add man page

This adds btmgmt.rst which is then converted to btmgmt.1 using rst2man.


  Commit: f0bfd76280250f53ecceaaa955d268c0e830145b
      https://github.com/bluez/bluez/commit/f0bfd76280250f53ecceaaa955d268c0e830145b
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-07-20 (Thu, 20 Jul 2023)

  Changed paths:
    M Makefile.tools
    A client/bluetoothctl-mgmt.rst

  Log Message:
  -----------
  client: Add bluetoothctl-mgmt.1 man page

This adds bluetoothctl-mgmt.rst which is then converted to
bluetooth-mgmt.1 using rst2man.


  Commit: 82d3d803d4c54946378f706f8b6b0c0ff9d4e821
      https://github.com/bluez/bluez/commit/82d3d803d4c54946378f706f8b6b0c0ff9d4e821
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-07-20 (Thu, 20 Jul 2023)

  Changed paths:
    M Makefile.tools
    A client/bluetoothctl-monitor.rst

  Log Message:
  -----------
  client: Add bluetoothctl-monitor.1 man page

This adds bluetoothctl-monitor.rst which is then converted to
bluetoothctl-mgmt.1 using rst2man.


Compare: https://github.com/bluez/bluez/compare/b9e93e01161c...82d3d803d4c5
