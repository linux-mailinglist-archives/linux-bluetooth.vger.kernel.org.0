Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C36855533F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 Jun 2022 20:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233117AbiFVS06 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 Jun 2022 14:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbiFVS05 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 Jun 2022 14:26:57 -0400
Received: from smtp.github.com (out-18.smtp.github.com [192.30.252.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E51B4403C7
        for <linux-bluetooth@vger.kernel.org>; Wed, 22 Jun 2022 11:26:56 -0700 (PDT)
Received: from github.com (hubbernetes-node-6dadf14.va3-iad.github.net [10.48.206.61])
        by smtp.github.com (Postfix) with ESMTPA id 45A4D340489
        for <linux-bluetooth@vger.kernel.org>; Wed, 22 Jun 2022 11:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1655922416;
        bh=l9d7gy04fn7iCZI9zb3OZ2bnPkI4htlkqb9EVDFskfQ=;
        h=Date:From:To:Subject:From;
        b=Y04iHs5jbA/HlD7Sr6Lfd4Qj2n8atLq3hU6OUtAle4+rO1Y6Ea1NjdFy/Y1aMzrmy
         PKFc7/nz6SowwGKFY3c2KF7UwxK5rx/cXPxgSeNsKMitLudlT23F/CRcixZuVJuTp1
         uyf8ew5FeKQ75L/x4Nv1GN7i9YZEh+E6Sz377N/s=
Date:   Wed, 22 Jun 2022 11:26:56 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/b8b327-7f92f7@github.com>
Subject: [bluez/bluez] e4fd2d: client/player: Enable acquiring multiple
 transports
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
  Commit: e4fd2dc5aa959ba430ee0038e4d135e1a7530ad4
      https://github.com/bluez/bluez/commit/e4fd2dc5aa959ba430ee0038e4d135e1a7530ad4
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-06-22 (Wed, 22 Jun 2022)

  Changed paths:
    M client/player.c

  Log Message:
  -----------
  client/player: Enable acquiring multiple transports

This enables acquiring multiple transports simultaneously.


  Commit: 33c96ca658fd7a0d358dd714decf465ff17ee043
      https://github.com/bluez/bluez/commit/33c96ca658fd7a0d358dd714decf465ff17ee043
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-06-22 (Wed, 22 Jun 2022)

  Changed paths:
    M client/player.c

  Log Message:
  -----------
  client/player: Fixes errors found by scan-build

This fixes the following errors:

client/player.c:1406:44: warning: Dereference of null pointer
[core.NullDereference]
        reply = endpoint_select_config_reply(msg, p->data.iov_base,
                                                  ^~~~~~~~~~~~~~~~
client/player.c:1866:2: warning: 3rd function call argument is an
uninitialized value [core.CallAndMessage]
        iov_append(&cfg->caps, data, len);
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


  Commit: 7f92f75e88b66ba73db5a676c35c704e213dcd70
      https://github.com/bluez/bluez/commit/7f92f75e88b66ba73db5a676c35c704e213dcd70
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-06-22 (Wed, 22 Jun 2022)

  Changed paths:
    M client/advertising.c

  Log Message:
  -----------
  client/advertising: Fixes errors found by scan-build

This fixes the following errors:

client/advertising.c:129:4: warning: Value stored to 'n' is never read
[deadcode.DeadStores]
                        n = sizeof(str) - 1;
                        ^   ~~~~~~~~~~~~~~~
client/advertising.c:1012:25: warning: Dereference of null pointer
(loaded from variable 'min') [core.NullDereference]
        if (ad.min_interval != *min) {
                               ^~~~


Compare: https://github.com/bluez/bluez/compare/b8b3277ba387...7f92f75e88b6
