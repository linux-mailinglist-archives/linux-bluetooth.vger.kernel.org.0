Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8A97B5D03
	for <lists+linux-bluetooth@lfdr.de>; Tue,  3 Oct 2023 00:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjJBWJ4 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 2 Oct 2023 18:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjJBWJz (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 2 Oct 2023 18:09:55 -0400
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6638BBF
        for <linux-bluetooth@vger.kernel.org>; Mon,  2 Oct 2023 15:09:53 -0700 (PDT)
Received: from github.com (hubbernetes-node-5d72ccb.ac4-iad.github.net [10.52.134.16])
        by smtp.github.com (Postfix) with ESMTPA id A4C40700022
        for <linux-bluetooth@vger.kernel.org>; Mon,  2 Oct 2023 15:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1696284592;
        bh=bBWcRGzuP/M3o1J0y0WE7ohs1rKaM1/cOGnuxYKHqQQ=;
        h=Date:From:To:Subject:From;
        b=PzATjqmIuSTPMMfGqtxeIv0GspsA2iY06n2VKjXKPgVFtSqD9QmniTazNwHBwlN29
         WlBqNpYvs+6HGEr6Ys7U7nTj/tpcj+/jQN4hsK1clQyxhjY7BS4r5IU8U5u9LadYny
         AwK6kZm1IHfoZ2WyeCrEz4BDcvVVMJRxJKnGpNrQ=
Date:   Mon, 02 Oct 2023 15:09:52 -0700
From:   silviubarbulescu <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/ae9bf5-7a79ff@github.com>
Subject: [bluez/bluez] 7a79ff: shared/bap:Update stream enable/disable flow
 bcast...
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
  Commit: 7a79ff88fd9576cd9935a8c0bab4906b7c38ea03
      https://github.com/bluez/bluez/commit/7a79ff88fd9576cd9935a8c0bab4906b7c38ea03
  Author: Silviu Florian Barbulescu <silviu.barbulescu@nxp.com>
  Date:   2023-10-02 (Mon, 02 Oct 2023)

  Changed paths:
    M src/shared/bap.c

  Log Message:
  -----------
  shared/bap:Update stream enable/disable flow bcast src

Update stream enable/disable flow for BAP broadcast source


