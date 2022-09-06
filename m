Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2365AF5B5
	for <lists+linux-bluetooth@lfdr.de>; Tue,  6 Sep 2022 22:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbiIFUUw (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 6 Sep 2022 16:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbiIFUUT (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 6 Sep 2022 16:20:19 -0400
Received: from smtp.github.com (out-22.smtp.github.com [192.30.252.205])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910593CBC1
        for <linux-bluetooth@vger.kernel.org>; Tue,  6 Sep 2022 13:19:11 -0700 (PDT)
Received: from github.com (hubbernetes-node-ab5c4a7.ac4-iad.github.net [10.52.222.38])
        by smtp.github.com (Postfix) with ESMTPA id C0AD7720D0F
        for <linux-bluetooth@vger.kernel.org>; Tue,  6 Sep 2022 13:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1662495550;
        bh=tjENKaGmKZj/b2alKFTyfZHxJrwPzFDSySQadmunXZA=;
        h=Date:From:To:Subject:From;
        b=nN1LsKwEDrHn3wrLm7S5EGwDP5dCpzJfnVNW7cIPgCmhExc+hYILwes/illfCa8ax
         AIVv/Rgm75CqtA+HU+8uZW07AJgMis4NgwrImhINVZGaQNsax4lIR54YJLQncO8vwk
         pB6EH+XG2l4iav4tS3yUr+2+/uR+HnI+LFs8y9oc=
Date:   Tue, 06 Sep 2022 13:19:10 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/c96629-4c8a6b@github.com>
Subject: [bluez/bluez] 3d3b1c: rfcomm-tester: Use latest Bluetooth version
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
  Commit: 3d3b1ceab9cbd7c03ba2496ec2d2e0cb951b1db2
      https://github.com/bluez/bluez/commit/3d3b1ceab9cbd7c03ba2496ec2d2e0cb951b1db2
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-09-02 (Fri, 02 Sep 2022)

  Changed paths:
    M tools/rfcomm-tester.c

  Log Message:
  -----------
  rfcomm-tester: Use latest Bluetooth version

This makes rfcomm-tester use the latest Bluetooth supported by the
emulator which is useful the detect regression related to ACL data
transfer.


  Commit: 4c8a6ba5ec7fb82e77710c69f14f774aa4c348a9
      https://github.com/bluez/bluez/commit/4c8a6ba5ec7fb82e77710c69f14f774aa4c348a9
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-09-06 (Tue, 06 Sep 2022)

  Changed paths:
    M src/shared/bap.c

  Log Message:
  -----------
  shared/bap: Fix not unregistering disconnect callback

bt_bap_detach shall always unregister the disconnect callback otherwise
the session pointer may still be accessible.


Compare: https://github.com/bluez/bluez/compare/c96629bedbae...4c8a6ba5ec7f
