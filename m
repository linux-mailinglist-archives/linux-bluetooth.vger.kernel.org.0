Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE9B773EC5B
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jun 2023 23:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbjFZVB1 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 26 Jun 2023 17:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjFZVBZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 26 Jun 2023 17:01:25 -0400
Received: from out-25.smtp.github.com (out-25.smtp.github.com [192.30.252.208])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8CF12A
        for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jun 2023 14:01:24 -0700 (PDT)
Received: from github.com (hubbernetes-node-897afa9.ash1-iad.github.net [10.56.225.71])
        by smtp.github.com (Postfix) with ESMTPA id 074703410FB
        for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jun 2023 14:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1687813284;
        bh=FTVfW0kBnqA1Tk7uIH3dTsk8jttho1caRX2d5kDSrPU=;
        h=Date:From:To:Subject:From;
        b=aGQMR19DA74Z4aqVIo5unjVuof1H6kWdmJFk1yKqAlEGOg2AcJVzlrmmrP/WmuakL
         pj2o7NtU1ZDsLRtSl5TUEFLPEWTC2tBjDN95EgPRngnEeksEinym4jj3rfBBW7uGXF
         mGVgTIwhnxC/tPwW2DOncQbxPqE/t6YdiCNvU+GA=
Date:   Mon, 26 Jun 2023 14:01:24 -0700
From:   iulia-tanasescu <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/97a07d-b00bc6@github.com>
Subject: [bluez/bluez] 3f018d: btdev: Fix CIS Established Event parameters
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 3f018d52d4ac07bd54e5e6dfd6c3b55c70ff1db2
      https://github.com/bluez/bluez/commit/3f018d52d4ac07bd54e5e6dfd6c3b55c70ff1db2
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-06-23 (Fri, 23 Jun 2023)

  Changed paths:
    M emulator/btdev.c

  Log Message:
  -----------
  btdev: Fix CIS Established Event parameters

ISO Interval and Transport Latency were inverted.


  Commit: 1d6456a2537d810d56ee808e6cbd0fa2da07fe0c
      https://github.com/bluez/bluez/commit/1d6456a2537d810d56ee808e6cbd0fa2da07fe0c
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-06-23 (Fri, 23 Jun 2023)

  Changed paths:
    M tools/iso-tester.c

  Log Message:
  -----------
  iso-tester: Fix checks of latency and interval

Due to rounding of latency, BAP uses msec while HCI uses slots of
1.25 ms, values may not return an exact match which is fine since the
BAP QoS suggests they are the maximum latency/interval so values bellow
that shall be considered a match.


  Commit: b00bc612fab842def22d042bad8919213bcb9b1a
      https://github.com/bluez/bluez/commit/b00bc612fab842def22d042bad8919213bcb9b1a
  Author: Iulia Tanasescu <iulia.tanasescu@nxp.com>
  Date:   2023-06-26 (Mon, 26 Jun 2023)

  Changed paths:
    M tools/isotest.c

  Log Message:
  -----------
  isotest: Add check after accepting connection

This checks for the POLLERR event on a newly accepted connection,
to determine if the connection was successful or not.


Compare: https://github.com/bluez/bluez/compare/97a07d8485a3...b00bc612fab8
