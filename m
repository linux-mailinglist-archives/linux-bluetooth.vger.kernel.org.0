Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD74545B56
	for <lists+linux-bluetooth@lfdr.de>; Fri, 10 Jun 2022 06:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241354AbiFJEvU (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 10 Jun 2022 00:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243484AbiFJEvL (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 10 Jun 2022 00:51:11 -0400
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDFFB31714A
        for <linux-bluetooth@vger.kernel.org>; Thu,  9 Jun 2022 21:51:08 -0700 (PDT)
Received: from github.com (hubbernetes-node-e566669.va3-iad.github.net [10.48.205.77])
        by smtp.github.com (Postfix) with ESMTPA id 5A741E00CE
        for <linux-bluetooth@vger.kernel.org>; Thu,  9 Jun 2022 21:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1654836667;
        bh=e7zTZ5cewNdx3pCkfmvonasZmvs7BbUGH3zj4D0IgmM=;
        h=Date:From:To:Subject:From;
        b=LE9aG3gTWYgEK+qwOhtJnwVgX4DR/TnaPQF+oLsJEQuHlIk+EOIdtOnfvFTp3UJ9L
         eodLAwUgoHkRvZlN8itGUYXhOJKgPJJCeAUygapqcBoAQuWfc59ptSJSbBL6Kq2m0o
         M7yZduCYHcaCG97mkgjSf/LCsX4sdiwRWK63gLTQ=
Date:   Thu, 09 Jun 2022 21:51:07 -0700
From:   BluezTestBot <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/ab31e2-3c7413@github.com>
Subject: [bluez/bluez] 5ebc2b: device: Fix not deleting the folder after
 removing...
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
  Commit: 5ebc2b5a3e48dbe67a2d315979b096a1b4d1eb99
      https://github.com/bluez/bluez/commit/5ebc2b5a3e48dbe67a2d315979b096a1b4d1eb99
  Author: Tedd Ho-Jeong An <tedd.an@intel.com>
  Date:   2022-06-09 (Thu, 09 Jun 2022)

  Changed paths:
    M src/device.c

  Log Message:
  -----------
  device: Fix not deleting the folder after removing the device

This patch fixes the issue not deleting the device folder when the
device is removed.


  Commit: 3c7413f49c030722c9499af9b6db3d4cbac772ba
      https://github.com/bluez/bluez/commit/3c7413f49c030722c9499af9b6db3d4cbac772ba
  Author: Michael Brudevold <michael.brudevold@veranexsolutions.com>
  Date:   2022-06-09 (Thu, 09 Jun 2022)

  Changed paths:
    M doc/coding-style.txt

  Log Message:
  -----------
  doc/coding-style: Update URL to kernel coding style


Compare: https://github.com/bluez/bluez/compare/ab31e2f7e828...3c7413f49c03
