Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35C8D50EC67
	for <lists+linux-bluetooth@lfdr.de>; Tue, 26 Apr 2022 01:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232484AbiDYXHd (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 25 Apr 2022 19:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231320AbiDYXHc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 25 Apr 2022 19:07:32 -0400
Received: from smtp.github.com (out-26.smtp.github.com [192.30.252.209])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9359710842D
        for <linux-bluetooth@vger.kernel.org>; Mon, 25 Apr 2022 16:04:27 -0700 (PDT)
Received: from github.com (hubbernetes-node-f85c808.ash1-iad.github.net [10.56.226.45])
        by smtp.github.com (Postfix) with ESMTPA id B02045E0FBF
        for <linux-bluetooth@vger.kernel.org>; Mon, 25 Apr 2022 16:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1650927866;
        bh=iMbE1MBQ/JHB8HcvQms6Vx7z3ErC9QRETqyIKPnTZhA=;
        h=Date:From:To:Subject:From;
        b=w2RFoLdccgJ9GS//+EoO2roIQnY7VA4XqL8KSqmhGX8ObARj5bAWL6xUAQmEmEJsG
         qp/t0XLO9sI+WvqjPJNqhOEWY1veX74nKJ5krC8vBvJkyXE4Nq2HJhrv9XRyBJUoMe
         vdZ0CxSX71zofzMBbiebMGHQAVUSAj0/JML+87kQ=
Date:   Mon, 25 Apr 2022 16:04:26 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/3e2ad5-dd5b66@github.com>
Subject: [bluez/bluez] dd5b66: client/player: Add transport.volume command
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: dd5b66695c2bd22a5ced321d0702011213b5d7c6
      https://github.com/bluez/bluez/commit/dd5b66695c2bd22a5ced321d0702011213b5d7c6
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-04-22 (Fri, 22 Apr 2022)

  Changed paths:
    M client/player.c

  Log Message:
  -----------
  client/player: Add transport.volume command

This adds transport.volume command:

Get/Set transport volume
Usage:
	 volume <transport> [value]


