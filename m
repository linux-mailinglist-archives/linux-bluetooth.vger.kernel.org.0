Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7176F7BAFAE
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 Oct 2023 02:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjJFArL (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 5 Oct 2023 20:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjJFArK (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 5 Oct 2023 20:47:10 -0400
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 560AFD6
        for <linux-bluetooth@vger.kernel.org>; Thu,  5 Oct 2023 17:47:09 -0700 (PDT)
Received: from github.com (hubbernetes-node-2f2e3bf.ac4-iad.github.net [10.52.206.86])
        by smtp.github.com (Postfix) with ESMTPA id 930DD700FAE
        for <linux-bluetooth@vger.kernel.org>; Thu,  5 Oct 2023 17:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1696553228;
        bh=VkvwWi++wP1VtazRoA1SlAkdKfZaAz+J+URcbe2EmIk=;
        h=Date:From:To:Subject:From;
        b=S4UbXx+yF3Jso7MpJPSD0rpg6eO+viUcMJXzhOMEb3tweKUqTO82xDxcr9LV4r07u
         rR3oZBVjZ9/qwVKQ9QsxTkw1KDza2IejkKrYFWA+D+l9DV2jGA/gg0WLzuMKFGkiIt
         o0QM2kiFISLdhmc5h3yqCOeqeSy+ZyxMC79l4AnA=
Date:   Thu, 05 Oct 2023 17:47:08 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/0a7496-d4a0d2@github.com>
Subject: [bluez/bluez] d4a0d2: build: Fix missing file unit/test-micp.c
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
  Commit: d4a0d223eaa5d220263be1f3ad0cd396869f6245
      https://github.com/bluez/bluez/commit/d4a0d223eaa5d220263be1f3ad0cd396869f6245
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-10-05 (Thu, 05 Oct 2023)

  Changed paths:
    A unit/test-micp.c

  Log Message:
  -----------
  build: Fix missing file unit/test-micp.c

This fixes the following build error:

make[1]: *** No rule to make target 'unit/test-micp.c', needed
by 'unit/test-micp.o'.


