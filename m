Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1D046D529D
	for <lists+linux-bluetooth@lfdr.de>; Mon,  3 Apr 2023 22:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233451AbjDCUiJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 3 Apr 2023 16:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233449AbjDCUiF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 3 Apr 2023 16:38:05 -0400
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BDB630FC
        for <linux-bluetooth@vger.kernel.org>; Mon,  3 Apr 2023 13:38:00 -0700 (PDT)
Received: from github.com (hubbernetes-node-24efbcc.va3-iad.github.net [10.48.219.59])
        by smtp.github.com (Postfix) with ESMTPA id 17876E0E6A
        for <linux-bluetooth@vger.kernel.org>; Mon,  3 Apr 2023 13:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1680554280;
        bh=DXIqD8phv5eRObd2AUCg5ujHwdb+iuG3Huh7RZpp9nM=;
        h=Date:From:To:Subject:From;
        b=KfDjVlCWu3BVtnKyMRQ8efENqYi0dUZjvXK2Uc+hyOt4Lm6QBRxt+/iORFPAzRxRU
         k9klYHmYqN6qH1XvO89eiiA69TN9a+mgUn8AhTBMBK2eC3zPXmnQQg8MuEsuFiYnlB
         54BI7ztGtw39hdLBtmbaz0b9jMnSD/sjDGh9CY24=
Date:   Mon, 03 Apr 2023 13:38:00 -0700
From:   inga-s <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/de8e7c-cffd58@github.com>
Subject: [bluez/bluez] cffd58: mesh: Tighten IO and fix out-of-bounds array
 access
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: cffd5832a52cab71679e0bc6ee02a8f7816f1950
      https://github.com/bluez/bluez/commit/cffd5832a52cab71679e0bc6ee02a8f7816f1950
  Author: Inga Stotland <inga.stotland@gmail.com>
  Date:   2023-04-03 (Mon, 03 Apr 2023)

  Changed paths:
    M mesh/mesh-io-api.h
    M mesh/mesh-io-generic.c
    M mesh/mesh-io-mgmt.c
    M mesh/mesh-io-unit.c
    M mesh/mesh-io.c
    M mesh/mesh-io.h

  Log Message:
  -----------
  mesh: Tighten IO and fix out-of-bounds array access

This fixes the out-of-bounds array access in mesh-io-mgmt.c caught
by address sanitizer. Similar fixes were applied earlier to
generic and unit IOs. With this patch, the common code is factored
into a centralized location.


