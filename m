Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBAF166A77D
	for <lists+linux-bluetooth@lfdr.de>; Sat, 14 Jan 2023 01:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbjANA2v (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 13 Jan 2023 19:28:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbjANA2u (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 13 Jan 2023 19:28:50 -0500
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7CF84F9D
        for <linux-bluetooth@vger.kernel.org>; Fri, 13 Jan 2023 16:28:48 -0800 (PST)
Received: from github.com (hubbernetes-node-965dff6.ash1-iad.github.net [10.56.211.73])
        by smtp.github.com (Postfix) with ESMTPA id ACF20900103
        for <linux-bluetooth@vger.kernel.org>; Fri, 13 Jan 2023 16:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1673656127;
        bh=utt853o7sUDn9gE7wlnwPEAqekrjuDHZ45eyF5Z7uGI=;
        h=Date:From:To:Subject:From;
        b=n0w6m5Cu1qjqmeMq+nBkizOKQ/MVXTrxMAH63kssakEnFRa6KgpD0xDJ2ype1nsVY
         esm1Swr/HyhlPiJyFXzpLc+4ZYK2DIWiEsxuic8aWvf0gqLP9nzVyBM1DT7gyFxlpA
         jgsZVpSlgalntLRHwN+OW2nkm0TE3bvY1Yz/Zxqg=
Date:   Fri, 13 Jan 2023 16:28:47 -0800
From:   Abhay <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/fd893f-a1736d@github.com>
Subject: [bluez/bluez] a1736d: shared/bap: Fixing Company ID and Vendor ID
 endianess
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: a1736d8990ff56bba453ff81a25156316bdd118f
      https://github.com/bluez/bluez/commit/a1736d8990ff56bba453ff81a25156316bdd118f
  Author: Abhay Maheta <abhay.maheshbhai.maheta@intel.com>
  Date:   2023-01-13 (Fri, 13 Jan 2023)

  Changed paths:
    M src/shared/bap.c

  Log Message:
  -----------
  shared/bap: Fixing Company ID and Vendor ID endianess

This fixes Company ID and Vendor Codec ID which are supposed to be
little endian.


