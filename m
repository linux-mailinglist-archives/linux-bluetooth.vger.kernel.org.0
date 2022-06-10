Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3BD2545D69
	for <lists+linux-bluetooth@lfdr.de>; Fri, 10 Jun 2022 09:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346867AbiFJH3J (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 10 Jun 2022 03:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346863AbiFJH3I (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 10 Jun 2022 03:29:08 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 434CA42A1B
        for <linux-bluetooth@vger.kernel.org>; Fri, 10 Jun 2022 00:29:01 -0700 (PDT)
Received: from localhost.localdomain (67.227.121.78.rev.sfr.net [78.121.227.67])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: fdanis)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 2BD0A660175E
        for <linux-bluetooth@vger.kernel.org>; Fri, 10 Jun 2022 08:28:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1654846139;
        bh=lUDdo13AJdQb6HwrkoMC0vaiDxdYp4yMgjFoTHkfYIM=;
        h=From:To:Subject:Date:From;
        b=Sxhu0RezzK54X4NehWoWJroofth4s02Qf1ZRCE4pAo5CNJ5SUzhbS9Qi1X0doGRNu
         zVIud3+TfgpCxAa2m14dZ4VooxG3Bg3aeuofMjWn7wBW2QxAxpIFlvx0IShFlYD/wN
         vCGkDdKS2nhqwrJHUFMNxlk6X69n9FLv+CFzNnBBqiarO+iN1y8oaeUI4ndcWm6GDO
         TLtCZDSDRWz+266b/x/qTyoEQtA0CZ8tOPb4jmL5abRwZZ6gevcLWUYPK88Q/tIdON
         CvAMXBnfpJNG8mO5yGlAsytL9sFuCsJM4ckeo0NuaKUHmWIMoxicAnc4ke67LsDeCQ
         GyYikZTcWadrw==
From:   =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= 
        <frederic.danis@collabora.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v2 0/3] test-runner: Add support for audio daemons
Date:   Fri, 10 Jun 2022 09:28:47 +0200
Message-Id: <20220610072850.16593-1-frederic.danis@collabora.com>
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

Since v1:
- Fix checkpatch errors

-- 
2.25.1

