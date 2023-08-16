Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6E6877D72B
	for <lists+linux-bluetooth@lfdr.de>; Wed, 16 Aug 2023 02:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240860AbjHPAo3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 15 Aug 2023 20:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240873AbjHPAoI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 15 Aug 2023 20:44:08 -0400
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38CBF1BFB
        for <linux-bluetooth@vger.kernel.org>; Tue, 15 Aug 2023 17:44:07 -0700 (PDT)
Received: from github.com (hubbernetes-node-4800431.ash1-iad.github.net [10.56.151.36])
        by smtp.github.com (Postfix) with ESMTPA id 7DEF9100811
        for <linux-bluetooth@vger.kernel.org>; Tue, 15 Aug 2023 17:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1692146646;
        bh=nYfE5gjmVkUHhD/15RQPQQ+Tgnvj0mHFgGIfYXbrN5Y=;
        h=Date:From:To:Subject:From;
        b=foj/3k8ntOaf8En/NIuBEufyD+i0j7IqWT7PSC4FmymWYKOIXbLh32ogXybkWKfjl
         TThrKcPYBUsSUgJCOs7F9sqV0fEPUimPoWn9XQMOLwkpHElOfiKVpObfbPA83/z9GU
         BLIq2aqEWc65z8FFEvxQw5a5h6POoLk5cKucbBUU=
Date:   Tue, 15 Aug 2023 17:44:06 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/d68bfb-f4aea3@github.com>
Subject: [bluez/bluez] 583d57: iso-tester: Add suspend tests
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 583d579178d440a850db06d9825bb9ac5eca8943
      https://github.com/bluez/bluez/commit/583d579178d440a850db06d9825bb9ac5eca8943
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-08-15 (Tue, 15 Aug 2023)

  Changed paths:
    M tools/iso-tester.c

  Log Message:
  -----------
  iso-tester: Add suspend tests

This adds the following test which attempt to trigger suspend code path
while ISO sockets are connecting or have been connected:

ISO Connect Suspend - Success
ISO Connected Suspend - Success
ISO Connect2 Suspend - Success
ISO Connected2 Suspend - Success


  Commit: f4aea37ee6cf6b6cb3f91e4d4c9f09611acfd610
      https://github.com/bluez/bluez/commit/f4aea37ee6cf6b6cb3f91e4d4c9f09611acfd610
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-08-15 (Tue, 15 Aug 2023)

  Changed paths:
    M Makefile.am

  Log Message:
  -----------
  build: Fix make distcheck

This fixes the following errors:

make[2]: *** No rule to make target 'doc/test-runner.txt',
needed by 'distdir-am'.  Stop.
make[1]: *** [Makefile:11708: distdir] Error 2
make: *** [Makefile:11784: dist] Error 2


Compare: https://github.com/bluez/bluez/compare/d68bfb6564ea...f4aea37ee6cf
