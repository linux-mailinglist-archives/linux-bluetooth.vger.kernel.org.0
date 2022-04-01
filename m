Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A85A04EE957
	for <lists+linux-bluetooth@lfdr.de>; Fri,  1 Apr 2022 09:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344017AbiDAHyl (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 1 Apr 2022 03:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232841AbiDAHyj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 1 Apr 2022 03:54:39 -0400
X-Greylist: delayed 359 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 01 Apr 2022 00:52:50 PDT
Received: from mxout02.lancloud.ru (mxout02.lancloud.ru [45.84.86.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E8A26240A
        for <linux-bluetooth@vger.kernel.org>; Fri,  1 Apr 2022 00:52:50 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 68134222570D
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Ildar Kamaletdinov <i.kamaletdinov@omp.ru>
To:     <linux-bluetooth@vger.kernel.org>
CC:     Ildar Kamaletdinov <i.kamaletdinov@omp.ru>
Subject: [PATCH BlueZ 0/7] Fix bugs found by SVACE static analisys tool
Date:   Fri, 1 Apr 2022 10:46:33 +0300
Message-ID: <20220401074640.3956695-1-i.kamaletdinov@omp.ru>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
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

Ildar Kamaletdinov (7):
  monitor: Fix out-of-bound read in print_le_states
  tools: Fix buffer overflow in hciattach_tialt.c
  tools: Fix signed interger overflow in btsnoop.c
  tools: Prevent infinity loops in bluemoon.c
  tools: Limit width of fields in sscanf
  device: Limit width of fields in sscanf
  gatt: Fix double free and freed memory dereference

 monitor/packet.c        |  2 +-
 src/device.c            | 12 ++++++------
 src/gatt-database.c     |  4 ++++
 tools/bluemoon.c        | 13 +++++++++++++
 tools/btmgmt.c          |  2 +-
 tools/btsnoop.c         |  2 +-
 tools/hciattach_tialt.c |  3 ++-
 tools/hex2hcd.c         |  2 +-
 8 files changed, 29 insertions(+), 11 deletions(-)

-- 
2.34.0

