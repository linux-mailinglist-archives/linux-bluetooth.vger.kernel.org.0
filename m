Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEFB589F6F
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Aug 2022 18:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234628AbiHDQcD (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 4 Aug 2022 12:32:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233341AbiHDQcB (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 4 Aug 2022 12:32:01 -0400
Received: from smtp.github.com (out-25.smtp.github.com [192.30.252.208])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E61E13DD4
        for <linux-bluetooth@vger.kernel.org>; Thu,  4 Aug 2022 09:32:00 -0700 (PDT)
Received: from github.com (hubbernetes-node-8a30038.ash1-iad.github.net [10.56.225.26])
        by smtp.github.com (Postfix) with ESMTPA id 92F09840AB9
        for <linux-bluetooth@vger.kernel.org>; Thu,  4 Aug 2022 09:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1659630719;
        bh=+lwnlM22vR7IIIUmxrN6yFm7nrVR92PlPErEJnIpU7U=;
        h=Date:From:To:Subject:From;
        b=0wkN/rJYwkkepWpASc3yOe7ODpGVhLKJjE9AuHVkAN41NLlLCg3CNZtAwGWoqjl3G
         S37N+jh35oFNwFri3Zu18s0DQmcdWTqR3tHZLSaaK4GBkelW0QFfQxvoc6qgq1gKUm
         EcFWuVx8ZUaHLxS3e1CFhWiiycnmFCDRc5cTGVvY=
Date:   Thu, 04 Aug 2022 09:31:59 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/a65ddf-d9497e@github.com>
Subject: [bluez/bluez] d9497e: iso-tester: Test BT_DEFER_SETUP works with
 getsockopt
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: d9497e0001c050a7e3ef0fd87fb03bce7b331879
      https://github.com/bluez/bluez/commit/d9497e0001c050a7e3ef0fd87fb03bce7b331879
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-08-04 (Thu, 04 Aug 2022)

  Changed paths:
    M tools/iso-tester.c

  Log Message:
  -----------
  iso-tester: Test BT_DEFER_SETUP works with getsockopt

This attempts to test BT_DEFER_SETUP is properly set when the test has
defer flag set.


