Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0719357F727
	for <lists+linux-bluetooth@lfdr.de>; Sun, 24 Jul 2022 23:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbiGXVSJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 24 Jul 2022 17:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbiGXVSI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 24 Jul 2022 17:18:08 -0400
Received: from smtp.github.com (out-17.smtp.github.com [192.30.252.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D4310FCE
        for <linux-bluetooth@vger.kernel.org>; Sun, 24 Jul 2022 14:18:08 -0700 (PDT)
Received: from github.com (hubbernetes-node-7dc6fac.va3-iad.github.net [10.48.125.31])
        by smtp.github.com (Postfix) with ESMTPA id AAAC05C0537
        for <linux-bluetooth@vger.kernel.org>; Sun, 24 Jul 2022 14:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1658697487;
        bh=H8QlTip7bLTks43l4+oHc4UrTXsnMNVZMd1ZOk1yTQM=;
        h=Date:From:To:Subject:From;
        b=P+Grl1jQoxxlRPsmpEgEOrH/yoDVyIi+88v5VCoLFnvfFg1LwOuerY/xlgn4X3Ms+
         n3LYOqCEhJy+jju7/Ool77LJrCqBwpnYq5vLMPhwlEateiS9Y21DRVRbwr3hhk9qnX
         Fl+0Ocnvc6HclU4v6mQ1B9X3I4yZYeHMd9p2o9U4=
Date:   Sun, 24 Jul 2022 14:18:07 -0700
From:   BluezTestBot <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/tags/5.65/000000-9ca140@github.com>
Subject: [bluez/bluez]
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_50,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,TVD_SPACE_RATIO autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/tags/5.65
  Home:   https://github.com/bluez/bluez
