Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9B4573F18
	for <lists+linux-bluetooth@lfdr.de>; Wed, 13 Jul 2022 23:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbiGMVmF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 13 Jul 2022 17:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbiGMVmE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 13 Jul 2022 17:42:04 -0400
Received: from smtp.github.com (out-21.smtp.github.com [192.30.252.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E802495E
        for <linux-bluetooth@vger.kernel.org>; Wed, 13 Jul 2022 14:42:02 -0700 (PDT)
Received: from github.com (hubbernetes-node-dba4b96.ac4-iad.github.net [10.52.125.35])
        by smtp.github.com (Postfix) with ESMTPA id 2F6CA5204FF
        for <linux-bluetooth@vger.kernel.org>; Wed, 13 Jul 2022 14:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1657748522;
        bh=tLZvMmz/oYZ40s21TJFIVY9nTkVtT8O4k6cb98sEQEg=;
        h=Date:From:To:Subject:From;
        b=TZYQYLuYvfOoaUsr9vgF2s4ALidQEDpn3jvQwW/Z3ajxIGvfSjfKHAFq03QC/RAZW
         Td0yk2DoT3l0knVeMc9l4tgH7Nfrh3ce63IOwpD+ao4kOUVqEqnTN2UMzqaaMM3hOB
         Gs36wmdtjN2PMyx/sEehKGDE/ILSuSEuFhwCI9Lo=
Date:   Wed, 13 Jul 2022 14:42:02 -0700
From:   Andrew Drake <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/163de8-a69fa6@github.com>
Subject: [bluez/bluez] a69fa6: adapter: Fix advertising monitor on Linux
 5.12-5.17
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
  Commit: a69fa692b094347e3a1dbcd9198d426f671dec0c
      https://github.com/bluez/bluez/commit/a69fa692b094347e3a1dbcd9198d426f671dec0c
  Author: Andrew Drake <adrake@adrake.org>
  Date:   2022-07-13 (Wed, 13 Jul 2022)

  Changed paths:
    M src/adapter.c

  Log Message:
  -----------
  adapter: Fix advertising monitor on Linux 5.12-5.17

The existing code assumes that, if a device supports advertising monitor
offload, DEVICE_FOUND events can be ignored since the kernel will send
ADV_MONITOR_DEVICE_FOUND events instead. Unfortunately, these new events
were added in 5.18, but offload was added in 5.12. This patch adds a
check on the MGMT API version so we can process the older DEVICE_FOUND
events when the new events are not supported.

Fixes: https://github.com/bluez/bluez/issues/357


