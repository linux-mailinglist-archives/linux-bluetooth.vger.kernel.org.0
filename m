Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D814607FB8
	for <lists+linux-bluetooth@lfdr.de>; Fri, 21 Oct 2022 22:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbiJUUXm (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 21 Oct 2022 16:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbiJUUXk (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 21 Oct 2022 16:23:40 -0400
Received: from smtp.github.com (out-17.smtp.github.com [192.30.252.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D8E828DC3A
        for <linux-bluetooth@vger.kernel.org>; Fri, 21 Oct 2022 13:23:29 -0700 (PDT)
Received: from github.com (hubbernetes-node-a32da6c.va3-iad.github.net [10.48.209.49])
        by smtp.github.com (Postfix) with ESMTPA id E29235C044C
        for <linux-bluetooth@vger.kernel.org>; Fri, 21 Oct 2022 13:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1666383808;
        bh=YnY+yRMequv/c5f/zzJdCZ0JrSTx3jN4NIbPlSsGyz0=;
        h=Date:From:To:Subject:From;
        b=ezuQIMNOWZnjAHegMATXZKUle9ubd8ABFYegr1lQ/kudrjwfD22qM0NHpwysYrLao
         +IICG76q69Yl+HlAKA6RJYi70cw5kJ+1vM+l7Po9tjwDlgVMGeZN9/6PATRYgheyhv
         UfYiG9uJrkk/3xSVKaW9EIZAN+3EU/nnXa2oWNLE=
Date:   Fri, 21 Oct 2022 13:23:28 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/3153b0-c88367@github.com>
Subject: [bluez/bluez] c88367: client: Fix advertise.data command
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: c8836711ad0725fc780dd999784ea169a344734b
      https://github.com/bluez/bluez/commit/c8836711ad0725fc780dd999784ea169a344734b
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-10-20 (Thu, 20 Oct 2022)

  Changed paths:
    M client/advertising.c

  Log Message:
  -----------
  client: Fix advertise.data command

advertise.data when no parameter is given shall print what is set on
ad.data not the ad.manufacturer which is a different field set by
advertise.manufacturer.


