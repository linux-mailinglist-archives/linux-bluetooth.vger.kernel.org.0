Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 393FC4EEB4B
	for <lists+linux-bluetooth@lfdr.de>; Fri,  1 Apr 2022 12:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343662AbiDAKaA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 1 Apr 2022 06:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343558AbiDAK34 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 1 Apr 2022 06:29:56 -0400
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C025526E56F
        for <linux-bluetooth@vger.kernel.org>; Fri,  1 Apr 2022 03:28:05 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru CAD2220C8D4E
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Ildar Kamaletdinov <i.kamaletdinov@omp.ru>
To:     <linux-bluetooth@vger.kernel.org>
CC:     Ildar Kamaletdinov <i.kamaletdinov@omp.ru>
Subject: [PATCH BlueZ 0/7] v2 Fix bugs found by SVACE static analisys tool
Date:   Fri, 1 Apr 2022 13:27:50 +0300
Message-ID: <20220401102757.3960551-1-i.kamaletdinov@omp.ru>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1910.lancloud.ru (fd00:f066::80)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch set includes few fixes that was found by Linux Verification Center
(linuxtesting.org) with the SVACE static analysis tool.

I have manually filtered out non-relevant and false positive problems and only
procedeed with bugs that currently lead to some errors/vulnerabilities or may
lead to them in some specific conditions.

Changelog:
v2 some minor style fixes after CI check.
v1 initial version.

Ildar Kamaletdinov (7):
  monitor: Fix out-of-bound read in print_le_states
  tools: Fix buffer overflow in hciattach_tialt.c
  tools: Fix signed integer overflow in btsnoop.c
  tools: Prevent infinity loops in bluemoon.c
  tools: Limit width of fields in sscanf
  device: Limit width of fields in sscanf
  gatt: Fix double free and freed memory dereference

 monitor/packet.c        |  5 +++--
 src/device.c            | 14 +++++++-------
 src/gatt-database.c     |  4 ++++
 tools/bluemoon.c        | 13 +++++++++++++
 tools/btmgmt.c          |  2 +-
 tools/btsnoop.c         |  2 +-
 tools/hciattach_tialt.c |  3 ++-
 tools/hex2hcd.c         |  2 +-
 8 files changed, 32 insertions(+), 13 deletions(-)

-- 
2.35.1

