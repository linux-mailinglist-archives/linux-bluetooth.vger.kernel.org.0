Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D16A5EA8B6
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Sep 2022 16:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbiIZOlV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 26 Sep 2022 10:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235044AbiIZOk4 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 26 Sep 2022 10:40:56 -0400
Received: from voyager.loytec.com (voyager.loytec.com [88.198.4.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0478AF1846
        for <linux-bluetooth@vger.kernel.org>; Mon, 26 Sep 2022 06:01:42 -0700 (PDT)
Received: from 212-17-98-152.static.upcbusiness.at ([212.17.98.152] helo=lexx.office.loytec.com)
        by voyager.loytec.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <isak.westin@loytec.com>)
        id 1ocnjw-00046g-2o
        for linux-bluetooth@vger.kernel.org; Mon, 26 Sep 2022 15:01:40 +0200
Received: from loytec-dev-vm.delta.corp ([10.101.25.21])
        by lexx.office.loytec.com (8.15.2/8.15.2/Some OS 1.2.3-4.5) with ESMTP id 28QD1bCU1107873;
        Mon, 26 Sep 2022 15:01:37 +0200
From:   Isak Westin <isak.westin@loytec.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Isak Westin <isak.westin@loytec.com>
Subject: [PATCH BlueZ 0/4] Mesh: Fix heartbeat publication/subscription
Date:   Mon, 26 Sep 2022 15:01:06 +0200
Message-Id: <20220926130110.2146-1-isak.westin@loytec.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 212.17.98.152
X-SA-Exim-Mail-From: isak.westin@loytec.com
X-SA-Exim-Scanned: No (on voyager.loytec.com); SAEximRunCond expanded to false
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

These patches include some fixes to the heartbeat publication and subscription procedures.
Found during following PTS tests:
- MESH/NODE/CFG/HBS/*
- MESH/NODE/CFG/HBP/*

Best regards,
Isak

Isak Westin (4):
  mesh: Correct u32 to u8 log transformation
  mesh: Reply to HB pub set with same fields
  mesh: Correct HB sub state updates
  mesh: Clear HB sub status field if disabled

 mesh/cfgmod-server.c | 48 ++++++++++++++++++++++++++++++++++++--------
 mesh/net.c           | 20 ++++--------------
 2 files changed, 44 insertions(+), 24 deletions(-)

-- 
2.20.1





