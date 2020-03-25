Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92CF31932FF
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Mar 2020 22:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbgCYVs6 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 25 Mar 2020 17:48:58 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37698 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgCYVs6 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 25 Mar 2020 17:48:58 -0400
Received: by mail-lf1-f66.google.com with SMTP id j11so3132748lfg.4
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 Mar 2020 14:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NqHX8k3jVj9xKuZQc9AfTqUESPhumnhkS7G8CYE3kl8=;
        b=17swdHje8i7+T26j+h4Ti5g0a0gb3ulbMa6IAsOG7tJI5+PvNJ0SPYf2anVjzfkwsj
         gCZ2KE4Qm6YUfW6vT7zjrJ08QO4cJhuYho46D6p8YjrlLqsboLknzYoqZtGeNEf/v30e
         Gl74rM7lwrngS/VnjFGYxMxgGLdFbEM2QtnlpuxkiFia0TKv1Vk9/TsYCQdk3SlGQxEW
         4tWNc8EJ8n2Wkswblwvbfk4kBXczFNg+SHypWpvBeE9sxlTlcEQjn/uN1511XacqFp+2
         dQDyQO9rTnunHiRa+vmGnqC5Od2RQBkyZULVdFTmD0UDeVfG1qjdSY6pOJFNqEqtFXv7
         WP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NqHX8k3jVj9xKuZQc9AfTqUESPhumnhkS7G8CYE3kl8=;
        b=KRRK7iPndY0E9bmVos04lp7EzHeThG3cw6/Q6iKTCBtvfhO+Wb+Rv4xsVKOKI5k0de
         uvWeWYUuoDweqZ3/yoM1wfE7vkD1eN2FdqMb8D9TM8Zf5tbWI4jJlbZ8eyDxu9IAxoi7
         j1Le+YPca2oLi2YUZoQSVA9ZdEhm6FqHHjY5Gq6fv7Wv9CKAsnuAPEZtyPusaw9tCleV
         HhEdK1cN05tzUbv3gTInu66+ITQDNastEZHB48aBtAyPzBmJQhFEwbn8e9grr5E3Gi+A
         fDUoy0DpO+4AnZmfPxJB8NQ5aBrDM5F68XDP+zMYN5MjNhQGCs6fmlFOGQFqwvmbszR1
         z9jg==
X-Gm-Message-State: ANhLgQ2chuxJ0GCc1nKK0niRXlsBEJxTwzI+gBX/2ueA/pOS/byPhFag
        oAC48OZfdUSwVCxGztolXnyKyHVTL/0=
X-Google-Smtp-Source: ADFU+vu3E96Djqjo3VIt8IeGJodiWZeBUmxL1kbLyHWUDSX5oBhIB4FaJyiyHyxV9bDjQNJTwoZyDw==
X-Received: by 2002:a05:6512:1085:: with SMTP id j5mr3578719lfg.183.1585172934261;
        Wed, 25 Mar 2020 14:48:54 -0700 (PDT)
Received: from kynes.internet.domowy (apn-37-7-76-34.dynamic.gprs.plus.pl. [37.7.76.34])
        by smtp.gmail.com with ESMTPSA id r2sm123097lfn.92.2020.03.25.14.48.53
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 14:48:53 -0700 (PDT)
From:   =?UTF-8?q?Micha=C5=82=20Lowas-Rzechonek?= 
        <michal.lowas-rzechonek@silvair.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ] mesh: Fix model publication status after set
Date:   Wed, 25 Mar 2020 22:48:47 +0100
Message-Id: <20200325214847.67394-1-michal.lowas-rzechonek@silvair.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch fixes usage of send_pub_status() when handling publication
set message - mod_id was swapped with pub_addr, resulting in malformed
message being sent back to the Config Client.
---
 mesh/cfgmod-server.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mesh/cfgmod-server.c b/mesh/cfgmod-server.c
index c5c756a33..856eb6b27 100644
--- a/mesh/cfgmod-server.c
+++ b/mesh/cfgmod-server.c
@@ -185,8 +185,8 @@ static void config_pub_set(struct mesh_node *node, uint16_t net_idx,
 	}
 
 	if (!unreliable)
-		send_pub_status(node, net_idx, src, dst, status, ele_addr, ota,
-			mod_id, idx, cred_flag, ttl, period, retransmit);
+		send_pub_status(node, net_idx, src, dst, status, ele_addr,
+			mod_id, ota, idx, cred_flag, ttl, period, retransmit);
 }
 
 static void send_sub_status(struct mesh_node *node, uint16_t net_idx,
-- 
2.25.0

