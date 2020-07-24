Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5000C22C61B
	for <lists+linux-bluetooth@lfdr.de>; Fri, 24 Jul 2020 15:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbgGXNPA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 24 Jul 2020 09:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727045AbgGXNO5 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 24 Jul 2020 09:14:57 -0400
X-Greylist: delayed 311 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 24 Jul 2020 06:14:57 PDT
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93809C0619D3
        for <linux-bluetooth@vger.kernel.org>; Fri, 24 Jul 2020 06:14:57 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B152518195B;
        Fri, 24 Jul 2020 15:09:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.so; s=dkim;
        t=1595596181; h=from:subject:date:message-id:to:cc:mime-version:
         content-transfer-encoding; bh=oUDJqp4U9kelY2xZptaoZ5P+NEJJM4T0cxyXAqFjZ14=;
        b=H+Nxlk98oJjxZZVHIF+mLH2gaSfLDB6KWx8jID58Y7X6Er2g6TY3Aisi9XWBABM2RSi0j/
        1qJZiRnzZEYlEdj7cuLwB/uoxCbRBi+W4cn0LY8RT2B/L+2sIBu2dsenLsj75WmIAeZQ45
        g6o9r8+m2Zm2q8qM7gruf+MiVDnEmVY=
From:   Michael Nosthoff <committed@heine.so>
To:     linux-bluetooth@vger.kernel.org
Cc:     Michael Nosthoff <committed@heine.so>
Subject: [PATCH BlueZ] main: add missing comma after AlwaysPairable
Date:   Fri, 24 Jul 2020 15:09:03 +0200
Message-Id: <20200724130903.110903-1-committed@heine.so>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Commit 1880b2990866598 added a new key to supported_options but didn't
add a comma. This leads to the following error message on startup if the
key 'PairableTimeout' is present:

Unknown key PairableTimeout for group General in /etc/bluetooth/main.conf

This probably also leads to ignoring the setting.

Fixes: 1880b2990866598 ("core: Add AlwaysPairable to main.conf")
---
 src/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/main.c b/src/main.c
index ec7a9fbd7..2c083de67 100644
--- a/src/main.c
+++ b/src/main.c
@@ -79,7 +79,7 @@ static const char *supported_options[] = {
 	"Name",
 	"Class",
 	"DiscoverableTimeout",
-	"AlwaysPairable"
+	"AlwaysPairable",
 	"PairableTimeout",
 	"DeviceID",
 	"ReverseServiceDiscovery",
-- 
2.25.1

