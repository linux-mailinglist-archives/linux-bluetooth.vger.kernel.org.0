Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4145960F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 28 Jun 2019 10:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfF1I1l (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 28 Jun 2019 04:27:41 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42285 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbfF1I1l (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 28 Jun 2019 04:27:41 -0400
Received: by mail-lj1-f194.google.com with SMTP id t28so5102302lje.9
        for <linux-bluetooth@vger.kernel.org>; Fri, 28 Jun 2019 01:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=taGITA357wIMKN3VMOqDRaULLXphypJbE/xMWkRW44c=;
        b=Pusb56gWmuI1f2APtY+2k0i1IEsir+e8J9mUqojudUCjHqeA3KbHAoeZmitZ3i5sxB
         wvAq7sBq5V48EUd/EVuwrRAd+EQVOtAyvHdVjmcXsEvDnKhwKKY2CL0JJNlNhY4IOQMQ
         e6s1wqxw3NiTOyqUrdpLxluwRIcr4CERWTBGQV8Rh3BpXMEPapl78xxbpVROyhDp3PnK
         s62GDNiaRT/usINm9jFC3ui3KMVVUkDcimE86esGUy8I7NyYFYT6fEenjTc/jqVmh8il
         FNy5mt0EBEfYI7alaOvuKZxuo+W1CDKP7paNfsp1mLCrVMVQtvCW2uvDgSYLlDamJjcE
         oQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=taGITA357wIMKN3VMOqDRaULLXphypJbE/xMWkRW44c=;
        b=s8DJqA35Izd7PCNb5dFiQAUY1+WSdUwL9fTo/g2zS7fefVsuoZKuZnYa3bafPHoUd8
         6duyoMMd0/pLMvqi6urEPJ6kI9KEVwQn2tue68VJATPUIp6CvfhxwTA7xZATl3qeCNtz
         fNY9lS2eJ/BNrxxDaTtJ/W13ZfCIw7t/apUnzcps247Mh7n+z07IA1kFtgE5HQYYcvUu
         Q9nibkMXd8pnnkg633NPpPk0RN1bTWcY4rjzbb2qluiVpCWoLVnA/9tq7IJgkVSxWW7a
         gMJpxuRYVDGejmPgm2h01CuUJQAxGgMru4MwXkU3bTtsAywbgW9lnuaEfAffaoA6um4A
         P0Qg==
X-Gm-Message-State: APjAAAUokzdlhCv91OFW+5WREPR+R4/pcY++t0zi7mVr+YgI8VodN1i0
        m9dMRc/z6fOsSDcRah5HI87BBYj2FNA=
X-Google-Smtp-Source: APXvYqz3hefqtJQSvA5zeePpxqRRhT32xTUZHA9TYhlDnxe+xjOj/QaQG8wXs7/tmR3WWcAktN2xuw==
X-Received: by 2002:a2e:551d:: with SMTP id j29mr5484516ljb.213.1561710459215;
        Fri, 28 Jun 2019 01:27:39 -0700 (PDT)
Received: from mlowasrzechonek2133.silvair.lan ([217.153.94.18])
        by smtp.gmail.com with ESMTPSA id g4sm408098lfb.31.2019.06.28.01.27.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 01:27:38 -0700 (PDT)
From:   =?UTF-8?q?Micha=C5=82=20Lowas-Rzechonek?= 
        <michal.lowas-rzechonek@silvair.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 1/2] mesh: Fix D-Bus node path
Date:   Fri, 28 Jun 2019 10:27:33 +0200
Message-Id: <20190628082734.18809-1-michal.lowas-rzechonek@silvair.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

According to doc/mesh-api.txt, node object should be located at
/org/bluez/mesh/node.
---
 mesh/node.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mesh/node.c b/mesh/node.c
index c2feaee52..45383b7d5 100644
--- a/mesh/node.c
+++ b/mesh/node.c
@@ -47,7 +47,6 @@
 #define MIN_COMP_SIZE 14
 
 #define MESH_NODE_PATH_PREFIX "/node"
-#define MESH_ELEMENT_PATH_PREFIX "/ele"
 
 /* Default values for a new locally created node */
 #define DEFAULT_NEW_UNICAST 0x0001
@@ -1021,7 +1020,8 @@ static bool register_node_object(struct mesh_node *node)
 	if (!hex2str(node->uuid, sizeof(node->uuid), uuid, sizeof(uuid)))
 		return false;
 
-	node->path = l_strdup_printf(MESH_NODE_PATH_PREFIX "%s", uuid);
+	node->path = l_strdup_printf(BLUEZ_MESH_PATH MESH_NODE_PATH_PREFIX
+								"%s", uuid);
 
 	if (!l_dbus_object_add_interface(dbus_get_bus(), node->path,
 					MESH_NODE_INTERFACE, node))
-- 
2.19.1

