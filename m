Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0AC7B9953
	for <lists+linux-bluetooth@lfdr.de>; Thu,  5 Oct 2023 02:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233943AbjJEArc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 4 Oct 2023 20:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233179AbjJEArb (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 4 Oct 2023 20:47:31 -0400
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B924AD
        for <linux-bluetooth@vger.kernel.org>; Wed,  4 Oct 2023 17:47:28 -0700 (PDT)
Received: from github.com (hubbernetes-node-2202043.ac4-iad.github.net [10.52.125.49])
        by smtp.github.com (Postfix) with ESMTPA id CED47700C76
        for <linux-bluetooth@vger.kernel.org>; Wed,  4 Oct 2023 17:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1696466847;
        bh=dxbVGzIIUBqi8H1Cu7foWYHCFDLnuIM4dia8Lp8Ud6A=;
        h=Date:From:To:Subject:From;
        b=bEWR32QPa5IFJ+ladfK4hRRFSRSdF9GYL03Q1QOdx6sVX2mrhK6YDM99s+ljHp4Fr
         NZWdQPfXg79sAjYbRN+ahUey0JzfLH6zNtaguUBIQSaEf5DTmT00EDYcozzuFd6xLE
         6kh8YUHiLclJcb14vT6YEGEOk0QxnwdWGx/5LI4A=
Date:   Wed, 04 Oct 2023 17:47:27 -0700
From:   kirankrishnappa-intel <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/f25371-90af80@github.com>
Subject: [bluez/bluez] ad91f3: main: Fix reading of CSIS.Rank config field
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
  Commit: ad91f362898c41a1532a9ea78f0fe5e078dc37a6
      https://github.com/bluez/bluez/commit/ad91f362898c41a1532a9ea78f0fe5e078dc37a6
  Author: Kiran K <kiran.k@intel.com>
  Date:   2023-10-04 (Wed, 04 Oct 2023)

  Changed paths:
    M src/main.c

  Log Message:
  -----------
  main: Fix reading of CSIS.Rank config field

csis.rank was incorrectly read the value of csis.size


  Commit: 90af8029ba8e346dc8009b39426157e57d5d7b5e
      https://github.com/bluez/bluez/commit/90af8029ba8e346dc8009b39426157e57d5d7b5e
  Author: Kiran K <kiran.k@intel.com>
  Date:   2023-10-04 (Wed, 04 Oct 2023)

  Changed paths:
    M src/shared/csip.c

  Log Message:
  -----------
  shared/csip: Fix return of Rank attribute

Return Rank attribute as per the configured value.


Compare: https://github.com/bluez/bluez/compare/f253711c0e46...90af8029ba8e
