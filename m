Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2064C523FF1
	for <lists+linux-bluetooth@lfdr.de>; Thu, 12 May 2022 00:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243450AbiEKWFj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 11 May 2022 18:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbiEKWFj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 11 May 2022 18:05:39 -0400
Received: from smtp.github.com (out-21.smtp.github.com [192.30.252.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E0D11AD5A3
        for <linux-bluetooth@vger.kernel.org>; Wed, 11 May 2022 15:05:38 -0700 (PDT)
Received: from github.com (hubbernetes-node-e13e174.ac4-iad.github.net [10.52.125.39])
        by smtp.github.com (Postfix) with ESMTPA id 035475206C5
        for <linux-bluetooth@vger.kernel.org>; Wed, 11 May 2022 15:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1652306738;
        bh=rvNGZecrKotrAOw90ldNNdrz6PPIQB2OEl/5hHSAu5k=;
        h=Date:From:To:Subject:From;
        b=dR1kBDApPTmHCJa14HzC0T1HVbgt8swQdUX2KFzep+TkgQerBHXhWmrvKmH0CxjKu
         UazXSJuIxnZiRrTxcqKjFfjo6ONa5rwa9BI2QAlF7jTRBmQBa7Liyno6/feDm0EuCl
         KqBo6AadrInBsMTFMpxF6C+3A9n7KjK83C0rxNJs=
Date:   Wed, 11 May 2022 15:05:38 -0700
From:   BluezTestBot <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/42e9b8-4423d6@github.com>
Subject: [bluez/bluez] 4423d6: device: Fix pairing has failed due to the error
 of...
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
  Commit: 4423d63a9634e62cb41d1b1b53cf360edd927f98
      https://github.com/bluez/bluez/commit/4423d63a9634e62cb41d1b1b53cf360edd927f98
  Author: wangyouwan <wangyouwan@uniontech.com>
  Date:   2022-05-11 (Wed, 11 May 2022)

  Changed paths:
    M src/device.c

  Log Message:
  -----------
  device: Fix pairing has failed due to the error of Already Paired (0x13)

After connect the Bluetooth mouse, open two Bluetoothctl at the same time,
when remove the mouse, quickly go to power off,
try to paired the mouse again when I was power on,
found that the error 0x13 was always reported.
try to connect directly,can connect successfully.
but use the info command to query the information of the mouse
and find that the pairing status of the mouse is No.
so I try to delete the paired information in the kernel
through the "* cancel_pairing()" interface.


