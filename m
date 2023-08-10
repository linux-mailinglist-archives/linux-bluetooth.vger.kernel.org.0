Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E765776D3D
	for <lists+linux-bluetooth@lfdr.de>; Thu, 10 Aug 2023 02:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjHJA43 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 9 Aug 2023 20:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjHJA42 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 9 Aug 2023 20:56:28 -0400
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A417AF5
        for <linux-bluetooth@vger.kernel.org>; Wed,  9 Aug 2023 17:56:28 -0700 (PDT)
Received: from github.com (hubbernetes-node-36bba2f.va3-iad.github.net [10.48.133.18])
        by smtp.github.com (Postfix) with ESMTPA id 076658C0DC4
        for <linux-bluetooth@vger.kernel.org>; Wed,  9 Aug 2023 17:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1691628988;
        bh=+sgN5t7pHFEEWDwGi7SeK9OrVKQdIPRFBJxZLdy5/+M=;
        h=Date:From:To:Subject:From;
        b=J9Ov+Pt3/gmrNVm0rExeRSB1zw/mTHQ94+gdpAET6JfTP8wislBq2iEOacXbxKQeg
         7ZhJLT7M4R3T5DKR384vS5JKJL2mDmBWisWyVjoOHDoYHJyuZMHQgwF6bdeKVwTwrP
         x4g1tL8AI6efXD1Pvg1oGkzJIr/Xb8Y3ny5MVOFM=
Date:   Wed, 09 Aug 2023 17:56:28 -0700
From:   bp1001 <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/fc6f58-8bf3a4@github.com>
Subject: [bluez/bluez] ac04e5: device: Fix not probing drivers at startup
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
  Commit: ac04e5f38225d672a10ffd0a9162c3e466b6977b
      https://github.com/bluez/bluez/commit/ac04e5f38225d672a10ffd0a9162c3e466b6977b
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-08-09 (Wed, 09 Aug 2023)

  Changed paths:
    M src/device.c

  Log Message:
  -----------
  device: Fix not probing drivers at startup

Patch 67a26abe53bf ("profile: Add probe_on_discover flag") introduced a
regression which prevents drivers to be properly loaded at startup since
at that point they are not connected when code shall testing if
the devide is temporary instead.


  Commit: 8bf3a4a265bb199e21735639c57f1f652e5b8d45
      https://github.com/bluez/bluez/commit/8bf3a4a265bb199e21735639c57f1f652e5b8d45
  Author: Bart Philips <bartphilips1@gmail.com>
  Date:   2023-08-09 (Wed, 09 Aug 2023)

  Changed paths:
    M src/shared/gatt-server.c

  Log Message:
  -----------
  shared/gatt-server: Fix not allowing valid attribute writes

The length check shall not consider the command header, just its
payload.


Compare: https://github.com/bluez/bluez/compare/fc6f5856d177...8bf3a4a265bb
