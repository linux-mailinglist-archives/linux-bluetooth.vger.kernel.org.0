Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 078F06DB450
	for <lists+linux-bluetooth@lfdr.de>; Fri,  7 Apr 2023 21:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbjDGTha (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 7 Apr 2023 15:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbjDGTh3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 7 Apr 2023 15:37:29 -0400
Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7346BBBB7
        for <linux-bluetooth@vger.kernel.org>; Fri,  7 Apr 2023 12:37:23 -0700 (PDT)
Received: from github.com (hubbernetes-node-47c2ae5.ac4-iad.github.net [10.52.138.43])
        by smtp.github.com (Postfix) with ESMTPA id 9CD98600379
        for <linux-bluetooth@vger.kernel.org>; Fri,  7 Apr 2023 12:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1680896242;
        bh=XxaVR690naKqCkcfrol2gvs5xOJYo4FdlOVA3H/yc1w=;
        h=Date:From:To:Subject:From;
        b=kwnDUTOxsHFWvUVAId9Us/jMhIVzEjEqOW7VPFhK31WPVLN7Z0eZRx4numyIK0AOs
         lGiA6BTtHo0oEvv20dgOU764z1us/NbdTgpfo1R8v0G7Jzj6SeRliuFxsSBlAMBIIU
         /paOX1VBB8auXxkTETLbgYuPpwwR2YUfVYSfdF1I=
Date:   Fri, 07 Apr 2023 12:37:22 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/070c78-e122a0@github.com>
Subject: [bluez/bluez] e122a0: mgmt-tester: Fix Get/Set PHY tests
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: e122a07088966efb1fadc72fcf8378a1e77549b4
      https://github.com/bluez/bluez/commit/e122a07088966efb1fadc72fcf8378a1e77549b4
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-04-07 (Fri, 07 Apr 2023)

  Changed paths:
    M tools/mgmt-tester.c

  Log Message:
  -----------
  mgmt-tester: Fix Get/Set PHY tests

This fixes the following tests now that all supported PHYs are enabled
by default:

Start Discovery LE - (Ext Scan Param)   Failed
Get PHY Success                         Failed
Set PHY 1m 2m coded Succcess            Timed out


