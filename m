Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCEB3849F
	for <lists+linux-bluetooth@lfdr.de>; Fri,  7 Jun 2019 08:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727249AbfFGGyT (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 7 Jun 2019 02:54:19 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:51863 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbfFGGyT (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 7 Jun 2019 02:54:19 -0400
X-Originating-IP: 83.155.44.161
Received: from localhost.localdomain (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1DE3BC0011
        for <linux-bluetooth@vger.kernel.org>; Fri,  7 Jun 2019 06:54:12 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 1/2] sixaxis: Fix another problem with already setup devices
Date:   Fri,  7 Jun 2019 08:54:10 +0200
Message-Id: <20190607065411.28502-1-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

If the device went through any kind of pairing once, it might have been
set as trusted. Make sure to set the device as untrusted before starting
the cable pairing authorization so that we don't exit early from
process_auth_queue() (which considers trusted devices to be paired).
---
 plugins/sixaxis.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/plugins/sixaxis.c b/plugins/sixaxis.c
index fed68d2d8..12638829b 100644
--- a/plugins/sixaxis.c
+++ b/plugins/sixaxis.c
@@ -365,6 +365,7 @@ static bool setup_device(int fd, const char *sysfs_path,
 
 	btd_device_device_set_name(device, cp->name);
 	btd_device_set_pnpid(device, cp->source, cp->vid, cp->pid, cp->version);
+	btd_device_set_trusted(device, false);
 	btd_device_set_temporary(device, true);
 
 	closure = g_new0(struct authentication_closure, 1);
-- 
2.21.0

