Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 525AA1356F1
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 Jan 2020 11:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbgAIKcc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 Jan 2020 05:32:32 -0500
Received: from mail-wr1-f47.google.com ([209.85.221.47]:37845 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728740AbgAIKcc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 Jan 2020 05:32:32 -0500
Received: by mail-wr1-f47.google.com with SMTP id w15so6833096wru.4
        for <linux-bluetooth@vger.kernel.org>; Thu, 09 Jan 2020 02:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PXb0JEeIh4SpZo6oGWT72Ql3+vCOGA98iBAGPzLxN4I=;
        b=WUoAS2hmJRITXHeKFuiFXSHCiSEPe3rYzyQ3f5mY4ue6VWR3Jec9rlzPUwgJcrxXjh
         +rPTN2AWKwvJpiimy+ZAmOXguETSpkLbXgs02YM7lkZ1OtSqfgOquYuJVNGjp/93FxAH
         RpaM7lR2ESgPsYZ0mdmdvGweyWkTP5XDorJRd3dRIMXkDo9EqhfGSPjCUyNBdf+7qhNb
         8w3Nd14RTbI3y9UYgq+5memDOQ3Lgk0eT2z2sOnrqh7ssWb+BjjjWEjefWFa/ExXUqMY
         539/EEfmi2vrjH+lXCwx5pxDn6MMo52b5iSzEMu5mQv8SXOrmoruHHLMH2qfLpys6Hys
         Daew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PXb0JEeIh4SpZo6oGWT72Ql3+vCOGA98iBAGPzLxN4I=;
        b=D/yu/DkX/OYxY1o3xZGZLbweXZETyLiQoCsk/w0zOOYggtBW+AIh601vgYTZ2bzaVZ
         FwdI0uLiMEZEsuTrt4FuDUaSW5lyteIZnyK/qRW6EO34UVgdk97W8nVx5MCB1fUeQyJW
         qvuR7ZebadzifIsl25oWe6aK+Q6rWqxD3gN/V1Qf1/Fcgw6ZSlcSGPAXKVtmEfM6e/8n
         85MAVu999kMMN1ckdZCHV2flgwUS9wfN4vJ2DjOLo8XRHhNiPv0gpEGMAfZZld9kbWjH
         QATdmCHJXpbrVZfLZx/2TJMukONDKMvd3J6WhrkiKTgoZev5E9P0x/caeN8N4jCxxbij
         rgMQ==
X-Gm-Message-State: APjAAAXYcZyXpSd/9Lz+lhu0yH001L9ikKlh5JU0HthHxL+ww4NL7vBw
        T1DdUEriTXRoCf/zSjGe3OPr2WrQgCg=
X-Google-Smtp-Source: APXvYqxJ+WNF6cGvocmF+t/cIIvOKeX7oiNTFSXnWNga1PZroltCsOYY6PaWVBiV+Qn9nHBPzSE98A==
X-Received: by 2002:a5d:5044:: with SMTP id h4mr9861232wrt.4.1578565949813;
        Thu, 09 Jan 2020 02:32:29 -0800 (PST)
Received: from mlowasrzechonek2133.silvair.lan ([217.153.94.18])
        by smtp.gmail.com with ESMTPSA id d8sm7720607wre.13.2020.01.09.02.32.27
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 02:32:28 -0800 (PST)
From:   =?UTF-8?q?Micha=C5=82=20Lowas-Rzechonek?= 
        <michal.lowas-rzechonek@silvair.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ] mesh: Allow apps to receive DevKey messages from external nodes
Date:   Thu,  9 Jan 2020 11:32:22 +0100
Message-Id: <20200109103222.31139-1-michal.lowas-rzechonek@silvair.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

After introducing "remote" flag for DevKeyMessageReceived in
c8cd5b04ccd865deeb90b70ea649c0b6cc0385e6, we can now allow applications
to received DevKey messages from external addresses as well as from
local ones.

This enables applications to properly implement models using DevKey
security, by accepting only requests with "remote" flag set to false.
---
 mesh/model.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mesh/model.c b/mesh/model.c
index acdd94f7b..6d7674ee5 100644
--- a/mesh/model.c
+++ b/mesh/model.c
@@ -1066,8 +1066,7 @@ bool mesh_model_rx(struct mesh_node *node, bool szmict, uint32_t seq0,
 						forward.app_idx, forward.size,
 						forward.data);
 			else if (decrypt_idx == APP_IDX_DEV_REMOTE ||
-				(decrypt_idx == APP_IDX_DEV_LOCAL &&
-				 mesh_net_is_local_address(net, src, 1)))
+				 decrypt_idx == APP_IDX_DEV_LOCAL)
 				send_dev_key_msg_rcvd(node, i, src, decrypt_idx,
 						0, forward.size, forward.data);
 		}
-- 
2.19.1

