Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24EFB4EE0CC
	for <lists+linux-bluetooth@lfdr.de>; Thu, 31 Mar 2022 20:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234598AbiCaSnb (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 31 Mar 2022 14:43:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235506AbiCaSna (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 31 Mar 2022 14:43:30 -0400
Received: from smtp.github.com (out-26.smtp.github.com [192.30.252.209])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6E9216F99
        for <linux-bluetooth@vger.kernel.org>; Thu, 31 Mar 2022 11:41:42 -0700 (PDT)
Received: from github.com (hubbernetes-node-53af7ab.ash1-iad.github.net [10.56.202.55])
        by smtp.github.com (Postfix) with ESMTPA id 91F7C5E102B
        for <linux-bluetooth@vger.kernel.org>; Thu, 31 Mar 2022 11:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1648752101;
        bh=luBhiEZu7KFCmE91JuElCh2btUFbiH+m7Zmd/m6WFqA=;
        h=Date:From:To:Subject:From;
        b=JgLFYHTvPPSUeO2xkvnntA6nsxHenkA9PCHMoDUMeCR2R2+vJuMXxHabr6dQAf0Ie
         rbwva1NCVfKcXjjsP3nYdl+4/ekCJI4I88f10IidyG5IAcKXT2HMNI0MgQB2L6ZxP0
         EKI5fFoAdvc2FesjGe8qvQfwsvg8nIc40buVJLC0=
Date:   Thu, 31 Mar 2022 11:41:41 -0700
From:   inga-s <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/4a06a3-ff35b1@github.com>
Subject: [bluez/bluez] ff35b1: mesh: use explicit uint32_t when bit shifting
 left
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
  Commit: ff35b1d2e97e68f67cc556f85005636b65a190cb
      https://github.com/bluez/bluez/commit/ff35b1d2e97e68f67cc556f85005636b65a190cb
  Author: Inga Stotland <inga.stotland@intel.com>
  Date:   2022-03-31 (Thu, 31 Mar 2022)

  Changed paths:
    M mesh/crypto.c
    M mesh/net.c
    M mesh/net.h

  Log Message:
  -----------
  mesh: use explicit uint32_t when bit shifting left

This addresses a situation when a boolean type is represented by
an integer and performing a left shift on a boolean causes
an integer overflow.

This fixes the following runtime error:
"left shift of 1 by 31 places cannot be represented in type 'int'"


