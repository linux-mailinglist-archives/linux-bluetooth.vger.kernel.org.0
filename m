Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43939549D5A
	for <lists+linux-bluetooth@lfdr.de>; Mon, 13 Jun 2022 21:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244651AbiFMTUA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 13 Jun 2022 15:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351275AbiFMTTc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 13 Jun 2022 15:19:32 -0400
Received: from out-19.smtp.github.com (out-19.smtp.github.com [192.30.252.202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B189633352
        for <linux-bluetooth@vger.kernel.org>; Mon, 13 Jun 2022 10:23:54 -0700 (PDT)
Received: from github.com (hubbernetes-node-8161a6a.va3-iad.github.net [10.48.125.36])
        by smtp.github.com (Postfix) with ESMTPA id F0342E0BA6
        for <linux-bluetooth@vger.kernel.org>; Mon, 13 Jun 2022 10:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1655141034;
        bh=JNoFgI2QF0qLWuUsMb8uD+jvUnd3+HQKx3o/o+CJoEU=;
        h=Date:From:To:Subject:From;
        b=EHJZaulh+ram0wEPNNoiRELQVNxlQ5/2MSm3HfOWEK0YlQoSf4kdJqlF9NKgJtx2x
         uXvnEx45FltrunCW2/rZNovnboJZJApOVv0ZWUrd8xkMPVTTT9xQv9zPQ4eIIbNUXM
         0hg3A+hztbjibSu2zLQp6pzpfW/ctmczZ9WVzNiU=
Date:   Mon, 13 Jun 2022 10:23:53 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/60f18a-25dd56@github.com>
Subject: [bluez/bluez] 25dd56: monitor: Stop spamming logs when GATT db cannot
 be...
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
  Commit: 25dd5613d549010952550df4f6bd435e2bd5d101
      https://github.com/bluez/bluez/commit/25dd5613d549010952550df4f6bd435e2bd5d101
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-06-13 (Mon, 13 Jun 2022)

  Changed paths:
    M monitor/att.c
    M monitor/packet.c
    M monitor/packet.h

  Log Message:
  -----------
  monitor: Stop spamming logs when GATT db cannot be loaded

This stops calling hci_devba everytime the GATT db needs to be loaded
since that causes a raw socket to be open to read back the address
pointed by the index, instead this is done only once at assign_handle
and store in packet_conn_data.


