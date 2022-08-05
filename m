Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92FAC58B2B8
	for <lists+linux-bluetooth@lfdr.de>; Sat,  6 Aug 2022 01:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241449AbiHEXUL (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 5 Aug 2022 19:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238141AbiHEXUK (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 5 Aug 2022 19:20:10 -0400
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31FBF11C0E
        for <linux-bluetooth@vger.kernel.org>; Fri,  5 Aug 2022 16:20:07 -0700 (PDT)
Received: from github.com (hubbernetes-node-817739a.va3-iad.github.net [10.48.204.29])
        by smtp.github.com (Postfix) with ESMTPA id 5A416E0408
        for <linux-bluetooth@vger.kernel.org>; Fri,  5 Aug 2022 16:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1659741607;
        bh=1k9Rivtg8LXh+OVy1BqeEZVRF4bgVyk0383aSqUr9sI=;
        h=Date:From:To:Subject:From;
        b=H05RF+jO5RBSQptWPFUebA5kqCyBScAKDwu1guwY5Etrq8cjv+ZfWIZ57XTuCmgiW
         un7IRkSFVx1YPzcoVe84yiIncvFuNgOo6164XNkpolyB8atKgtw1bbhojGsTaV9XII
         kPaJzmnyLDGHR8lZA2syQ1XEKq7Gn8cxbUXvQAYs=
Date:   Fri, 05 Aug 2022 16:20:07 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/e7fc74-06f646@github.com>
Subject: [bluez/bluez] 2dfe29: shared/tester: Add tester_setup_io
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
  Commit: 2dfe29197435ebeae5337bed6d965cdf2edc3f89
      https://github.com/bluez/bluez/commit/2dfe29197435ebeae5337bed6d965cdf2edc3f89
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-08-05 (Fri, 05 Aug 2022)

  Changed paths:
    M src/shared/tester.c
    M src/shared/tester.h

  Log Message:
  -----------
  shared/tester: Add tester_setup_io

This adds tester_setup_io which can be used to add a PDU list in the
form of iovec.


  Commit: f07b88abfb89dbd951d65b782076383768bbc8be
      https://github.com/bluez/bluez/commit/f07b88abfb89dbd951d65b782076383768bbc8be
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-08-05 (Fri, 05 Aug 2022)

  Changed paths:
    M Makefile.am
    A unit/test-tester.c

  Log Message:
  -----------
  test-tester: This add tests for tester

This adds tests for the tester itself:

> unit/test-tester

Test Summary
------------
/tester/basic                           Passed       0.000 seconds
/tester/setup_io                        Passed       0.000 seconds
/tester/io_send                         Passed       0.000 seconds
Total: 3, Passed: 3 (100.0%), Failed: 0, Not Run: 0
Overall execution time: 0.000355 seconds


  Commit: bbbd0512c92d5b9a629a41b6e1afaef94f63a8b4
      https://github.com/bluez/bluez/commit/bbbd0512c92d5b9a629a41b6e1afaef94f63a8b4
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-08-05 (Fri, 05 Aug 2022)

  Changed paths:
    M emulator/bthost.c
    M emulator/bthost.h
    M tools/iso-tester.c

  Log Message:
  -----------
  bthost: Add qos support to bthost_set_cig_params

This enables setting QoS other then the mandatory 16_2_1.


  Commit: 06f6460cd121ec8dd7dbeffd1dcd2339c25169d1
      https://github.com/bluez/bluez/commit/06f6460cd121ec8dd7dbeffd1dcd2339c25169d1
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-08-05 (Fri, 05 Aug 2022)

  Changed paths:
    M tools/iso-tester.c

  Log Message:
  -----------
  iso-tester: Add ISO 48_2_1 Defer Receive - Success

This adds a test to check if different QoS are properly handled when
acting as peripheral.


Compare: https://github.com/bluez/bluez/compare/e7fc74a5dd1b...06f6460cd121
