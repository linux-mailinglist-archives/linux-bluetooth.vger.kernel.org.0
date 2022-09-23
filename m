Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49FE75E7A25
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Sep 2022 14:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbiIWMG2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 23 Sep 2022 08:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbiIWMEQ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 23 Sep 2022 08:04:16 -0400
Received: from voyager.loytec.com (voyager.loytec.com [88.198.4.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E75DE98
        for <linux-bluetooth@vger.kernel.org>; Fri, 23 Sep 2022 04:59:30 -0700 (PDT)
Received: from 212-17-98-152.static.upcbusiness.at ([212.17.98.152] helo=lexx.office.loytec.com)
        by voyager.loytec.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <isak.westin@loytec.com>)
        id 1obguo-0000Lx-3v
        for linux-bluetooth@vger.kernel.org; Fri, 23 Sep 2022 13:32:18 +0200
Received: from loytec-dev-vm.delta.corp ([10.101.25.21])
        by lexx.office.loytec.com (8.15.2/8.15.2/Some OS 1.2.3-4.5) with ESMTP id 28NBWF7g3687927;
        Fri, 23 Sep 2022 13:32:15 +0200
From:   Isak Westin <isak.westin@loytec.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Isak Westin <isak.westin@loytec.com>
Subject: [PATCH BlueZ 0/2] Mesh: Fixes to comply with mesh profile
Date:   Fri, 23 Sep 2022 13:31:47 +0200
Message-Id: <20220923113149.14209-1-isak.westin@loytec.com>
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

Here are two more pathes to fix compliance with the mesh profile and to
pass following PTS tests:
- MESH/NODE/CFG/SL/*
- MESH/NODE/CFG/AKL/*

Happy for any feedback.

Best regards,
Isak

Isak Westin (2):
  mesh: Clear addr field if virt sub failed
  mesh: Reply error if appkey added for wrong netkey

 mesh/appkey.c        | 4 +++-
 mesh/cfgmod-server.c | 4 ++++
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.20.1





