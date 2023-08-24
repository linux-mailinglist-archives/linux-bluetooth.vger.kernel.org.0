Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D11A0787664
	for <lists+linux-bluetooth@lfdr.de>; Thu, 24 Aug 2023 19:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240088AbjHXRJu (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 24 Aug 2023 13:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237601AbjHXRJr (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 24 Aug 2023 13:09:47 -0400
Received: from out-25.smtp.github.com (out-25.smtp.github.com [192.30.252.208])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E021199D
        for <linux-bluetooth@vger.kernel.org>; Thu, 24 Aug 2023 10:09:44 -0700 (PDT)
Received: from github.com (hubbernetes-node-20fb906.ash1-iad.github.net [10.56.15.31])
        by smtp.github.com (Postfix) with ESMTPA id 972D93411C4
        for <linux-bluetooth@vger.kernel.org>; Thu, 24 Aug 2023 10:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1692896983;
        bh=mpNVsHg9mUe026Cx+0l1xjBpeU/QnwApptRmjmCPtKg=;
        h=Date:From:To:Subject:From;
        b=EwGFJohSrO/20Oizrp1KYOeDLkWtEh+mNOZwdrv1so1qBTjOqqSTEEYvWih7eF2fk
         IdspDlj3/aWHbD62ozb8qSKzxAvU0soZPI+t0D4xpqW5FtP+QiUtazNKVMnMi1d2sL
         hq/CQyYI4dXL6B+TCA8EhqbxBR3hQlia15n9Unrk=
Date:   Thu, 24 Aug 2023 10:09:43 -0700
From:   Marcel Holtmann <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/176d01-6a8f7c@github.com>
Subject: [bluez/bluez] c6741c: transport: Fix crash with broadcast properties
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: c6741c40816bacb9a5c2a5d8f2d3b1ae5c4a6f36
      https://github.com/bluez/bluez/commit/c6741c40816bacb9a5c2a5d8f2d3b1ae5c4a6f36
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-08-24 (Thu, 24 Aug 2023)

  Changed paths:
    M profiles/audio/transport.c

  Log Message:
  -----------
  transport: Fix crash with broadcast properties

When connecting a BAP unicast stream the followin crash can be observed:

Access not within mapped region at address 0x1D4C0000000A
  at 0x14F759: get_bcode (transport.c:1121)
  by 0x1E02E4: append_property.isra.0 (object.c:498)
  by 0x1E03B9: append_properties (object.c:527)
  by 0x1E2AAB: g_dbus_get_properties (object.c:1811)
  by 0x14B9B6: pac_config (media.c:1130)


  Commit: 55c07304ac92474ed287190eb08703fe7c56f0c1
      https://github.com/bluez/bluez/commit/55c07304ac92474ed287190eb08703fe7c56f0c1
  Author: Marcel Holtmann <marcel@holtmann.org>
  Date:   2023-08-24 (Thu, 24 Aug 2023)

  Changed paths:
    M .gitignore

  Log Message:
  -----------
  build: Add generated manual pages to .gitignore


  Commit: 6a8f7c55dfdfed8136ba8b417d0d8ee45181001a
      https://github.com/bluez/bluez/commit/6a8f7c55dfdfed8136ba8b417d0d8ee45181001a
  Author: Marcel Holtmann <marcel@holtmann.org>
  Date:   2023-08-24 (Thu, 24 Aug 2023)

  Changed paths:
    M ChangeLog
    M configure.ac

  Log Message:
  -----------
  Release 5.69


Compare: https://github.com/bluez/bluez/compare/176d0154b7f8...6a8f7c55dfdf
