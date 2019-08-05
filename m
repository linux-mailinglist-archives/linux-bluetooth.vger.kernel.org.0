Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42B7D813B4
	for <lists+linux-bluetooth@lfdr.de>; Mon,  5 Aug 2019 09:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbfHEHzH (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 5 Aug 2019 03:55:07 -0400
Received: from mail-lf1-f52.google.com ([209.85.167.52]:36628 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726394AbfHEHzH (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 5 Aug 2019 03:55:07 -0400
Received: by mail-lf1-f52.google.com with SMTP id j17so3133806lfp.3
        for <linux-bluetooth@vger.kernel.org>; Mon, 05 Aug 2019 00:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5JUiXgTGpVbO60qhcPzO7yJeZwIi/gvrMNbL7/8cKQY=;
        b=exLFjaut0V+HBOaETOrm9fo52lXdqoMQ3QIrghun7GcttKV+lMXwiE4Sxd8+T2hKP7
         T5j8f/aIYesZp47b+B118f7hyzjVdEZWpWTbwwe9h4CgpQejV5+/pQpnI31NVlmgP6bw
         /W4yM9iEt663wc6bFStLNaJklsgME4SXEPlhADZzwfy/XATduX0VTKgbrzk5EgER8zjS
         0HQET+btxkHpM0tDjpPettErhcieB7vPLv+e7yVM5qPGHfzkvaPQhDyd8d0L+zAyt2iL
         tZNaBzQzYIMF8J6BLJspkAnB+zR11SjsHA7SNNyc54aAABLK6fjhtVh9WfaldA0jRFhw
         bAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5JUiXgTGpVbO60qhcPzO7yJeZwIi/gvrMNbL7/8cKQY=;
        b=FWjrbbYkoC/eamsiCaPTuEnuQfna1d3z7g/Cytvnq7yOSJlK0XvUwF+KLbIsySH615
         qbqXU5Y2/PWRItggfcKqEB+4zEmd1s7TjAQV6xBsJFDL9QbbWQQ7q/hERp2JlbaASU3E
         USX4mNyIezPuo/jo6v1O7VlqxYPPdniePW4vLpFeqfIqIfixlorseehepqWzBTE/z9k1
         5husm0izEDDmr6/H6YNfuuDQJCl5ndlrqijvbJuuAnGGHRewp4cJZaRQ2LrOatdM3m5l
         1hgQcONAUylD/Kchqd/sTBDobGo4ubs9AjNBvW5AF/QZxKZ/Wuw+U/MK3yKpabIr/oQP
         VVpA==
X-Gm-Message-State: APjAAAWf3wM58eAmRKwMzYgvk6A9YtuNbJAZ4qCm/AqHpV4XItO9OiDj
        uqw/4xxYAFdpTTfkOoXeEopHdidzm8I=
X-Google-Smtp-Source: APXvYqyH3cYhSbNUEu7OTRXJxpl11HiE7NhbtVeE96kxebaH2AzQ9OsyoJ3jKfyRL/KEvGLWO/gxWw==
X-Received: by 2002:a19:4c57:: with SMTP id z84mr2602656lfa.87.1564991704826;
        Mon, 05 Aug 2019 00:55:04 -0700 (PDT)
Received: from mlowasrzechonek2133.silvair.lan ([217.153.94.18])
        by smtp.gmail.com with ESMTPSA id q17sm1661313lfb.26.2019.08.05.00.55.03
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 00:55:03 -0700 (PDT)
From:   =?UTF-8?q?Micha=C5=82=20Lowas-Rzechonek?= 
        <michal.lowas-rzechonek@silvair.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ] mesh: Fix storing network retransmission in config
Date:   Mon,  5 Aug 2019 09:54:58 +0200
Message-Id: <20190805075458.15694-1-michal.lowas-rzechonek@silvair.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

---
 mesh/mesh-config-json.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mesh/mesh-config-json.c b/mesh/mesh-config-json.c
index 177aaac7b..d49f5226a 100644
--- a/mesh/mesh-config-json.c
+++ b/mesh/mesh-config-json.c
@@ -1553,7 +1553,7 @@ bool mesh_config_write_net_transmit(struct mesh_config *cfg, uint8_t cnt,
 	jnode = cfg->jnode;
 
 	jretransmit = json_object_new_object();
-	if (jretransmit)
+	if (!jretransmit)
 		return false;
 
 	if (!write_int(jretransmit, "count", cnt))
-- 
2.19.1

