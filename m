Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0571A545498
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 Jun 2022 21:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239812AbiFITFB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 Jun 2022 15:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234277AbiFITFA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 Jun 2022 15:05:00 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D79FB53C55
        for <linux-bluetooth@vger.kernel.org>; Thu,  9 Jun 2022 12:04:59 -0700 (PDT)
Received: from localhost.localdomain (67.227.121.78.rev.sfr.net [78.121.227.67])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: fdanis)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 934426601719
        for <linux-bluetooth@vger.kernel.org>; Thu,  9 Jun 2022 20:04:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1654801498;
        bh=PRYEEvNEsG+ND5THHUG0uonGvYxqKcK3fNNG4Md/dGo=;
        h=From:To:Subject:Date:From;
        b=CYQu1nJMiItdvsa6mecSAFFpVMeKEDB5cmw0uKMvgCBzlH/dKQkI2HgmClDgE0c4B
         0XFQFoQpCR8O1vyMEHPv0ZVfxLVJhU4JUg6Glp1JUiLvkvXDJzHCJJG5I30ueoY0j4
         vXTKd7LGmaDdbXd58J6b8ffPXuH9MAmj36pjFx75MfEU6xbDLALOAN9huEvKIKfGJA
         tbKGd9zYC7egyL/DrIxZ8xlMlbX0SYdwobODfsdBF1u3YKnvZAF/3AJalfmT5g0H4y
         RqSOFTF0FC+T/GynSEVKDkntMQNTAD3SZhAWWx2t7TY4DTKDqwDHBFdrCdoq4FK/oQ
         7v7IgyvqPwwrA==
From:   =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= 
        <frederic.danis@collabora.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 0/3] test-runner: Add support for audio daemons
Date:   Thu,  9 Jun 2022 21:04:39 +0200
Message-Id: <20220609190442.74325-1-frederic.danis@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Those patches add DBus session and an audio card so it should be possible
to start an audio daemon like PipeWire in the VM.

Frédéric Danis (3):
  test-runner: Add DBus session support
  test-runner: Add audio card support
  test-runner: Add udevd and trigger events

 doc/test-runner.txt |   5 ++
 tools/test-runner.c | 197 +++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 189 insertions(+), 13 deletions(-)

-- 
2.25.1

