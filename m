Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 758186C21C3
	for <lists+linux-bluetooth@lfdr.de>; Mon, 20 Mar 2023 20:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjCTTmz (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 20 Mar 2023 15:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbjCTTma (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 20 Mar 2023 15:42:30 -0400
Received: from out-19.smtp.github.com (out-19.smtp.github.com [192.30.252.202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4AE113EC
        for <linux-bluetooth@vger.kernel.org>; Mon, 20 Mar 2023 12:37:43 -0700 (PDT)
Received: from github.com (hubbernetes-node-bd0fe8f.va3-iad.github.net [10.48.109.80])
        by smtp.github.com (Postfix) with ESMTPA id 976F6E0546
        for <linux-bluetooth@vger.kernel.org>; Mon, 20 Mar 2023 12:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1679341060;
        bh=wF6TCquJ+JGIoFWBx7e3nnQ3rtaNes5C797mzGgWY6E=;
        h=Date:From:To:Subject:From;
        b=j+QdSYl0bEZANE0vHKu2T2KFSwTcCO97Zwg7aPeFkCqdHCHULl57Ye4TJI60kBZU8
         jS9nTkNW6oKlhe6FRkM5UY04C3mG8BALAD6L/A3js3cRwFLd0xiPBp9itjPawubhEm
         q6LotgfTt0p/amDX6DqH2kWVoP5H1CTSgd8XnXp4=
Date:   Mon, 20 Mar 2023 12:37:40 -0700
From:   inga-s <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/551a0c-4a3f46@github.com>
Subject: [bluez/bluez] 4a3f46: mesh: On exit free timer for filtering
 duplicates
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
  Commit: 4a3f465a55c9e2159d363a5419f3a5dbb965036d
      https://github.com/bluez/bluez/commit/4a3f465a55c9e2159d363a5419f3a5dbb965036d
  Author: Inga Stotland <inga.stotland@gmail.com>
  Date:   2023-03-20 (Mon, 20 Mar 2023)

  Changed paths:
    M mesh/mesh-io-mgmt.c

  Log Message:
  -----------
  mesh: On exit free timer for filtering duplicates

This frees resources associated with duplicate filter timer
when destroying management IO.


