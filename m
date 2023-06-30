Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1FD7444E1
	for <lists+linux-bluetooth@lfdr.de>; Sat,  1 Jul 2023 00:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232285AbjF3WdE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 30 Jun 2023 18:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232549AbjF3WdD (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 30 Jun 2023 18:33:03 -0400
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E4D3C22
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jun 2023 15:33:02 -0700 (PDT)
Received: from github.com (hubbernetes-node-9fe6a79.ac4-iad.github.net [10.52.145.30])
        by smtp.github.com (Postfix) with ESMTPA id 7D62370106E
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jun 2023 15:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1688164381;
        bh=GFuIxfDiqoFNJI1kusZNwXn9GuVxOt/27v+axmNWZl4=;
        h=Date:From:To:Subject:From;
        b=leDH50EhTi5eiWOp79IPscrQn0lqlys5VoKhF7e5l7xuFzfKG50QkaML3K7mCx6B6
         k/aMGhPM3R9ipCqj8JzTQp+wed2Ena0WaBiA+EqA5U5UIs0ZzVBf6YvcS+T2+WBYH0
         mJzGNHcpyDPjMxnZlvRcMWPdrDsGMW+85FoSnnkM=
Date:   Fri, 30 Jun 2023 15:33:01 -0700
From:   BluezTestBot <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/tags/5.68/000000-c1a441@github.com>
Subject: [bluez/bluez]
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_20,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        TVD_SPACE_RATIO,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/tags/5.68
  Home:   https://github.com/bluez/bluez
