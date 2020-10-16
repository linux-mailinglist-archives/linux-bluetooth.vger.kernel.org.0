Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E777B290B25
	for <lists+linux-bluetooth@lfdr.de>; Fri, 16 Oct 2020 20:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391267AbgJPSKB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 16 Oct 2020 14:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391261AbgJPSKB (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 16 Oct 2020 14:10:01 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D29C061755
        for <linux-bluetooth@vger.kernel.org>; Fri, 16 Oct 2020 11:10:01 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id h6so1917111pgk.4
        for <linux-bluetooth@vger.kernel.org>; Fri, 16 Oct 2020 11:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rdSQv0WqI8XOqcIsRkumiryUop8LX5S6l8HxLs9v6HM=;
        b=ev2fOiAmh9e1NZJYFiWPBTOi4biDzAA6H2pvnk3ppD8kZKseJpOYA+2e5j6xlojEtx
         xXHHbbpELTj/6U9+9fYRvssFOtmZKfAS3y9mNX+vLwY9LNh8WnUG+Nw8IhvlMzAUtgi5
         NVHV2+ivK1U/sD48tODaUFInIVHTKF0iUdNjTbPsN35x2oqSJ6VRuer10/R1wlQbScHY
         CFmWdcH3hepI0l1h69PO3BxIc7z8en9yQUBLFqxZJRKieBWTsytlQ58BKCi2qfc1uKsd
         S57eX/9oVJKjxJ96JBHf+Io+0RauX+ZkReGhBLPC7tMss6klO/OGelX2uwIitQ1ur7Z3
         mTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rdSQv0WqI8XOqcIsRkumiryUop8LX5S6l8HxLs9v6HM=;
        b=sFtWyR8niQ+AqZVF7jfOCwJAEpdFyDgr1KLnxzehKprwhSYWxgGSiwu2ex/ZH2k0+u
         YIoSBUqdWj6/CX4au95LYgo3OuidPhPBjZMil4JgyIfYW92BgKBVnI/4o9AHfdqf3jh2
         0eCWesU8nuBnXyaZn+PTZdqLhRUhlNV4BGVA9MPSVPlMih2I/n/ciGe5o0C5Ut7GZC/x
         199xdKSXvXLZnqbcW5I/NWbJNwANOJlWgHoryUFLC8bpJvqGEMl648hb4gho+mvLyYXo
         Zk2hjZiWHWUhutibU58lj0zMppwDNsiP5xGQLC7sEsW1sqivVQDmsde4WXu/49ylOMWX
         zlYA==
X-Gm-Message-State: AOAM531gPKfpvcJl5w3wn/Oj3UUcd2w8jgt4GXUIlrB21MHiDwP1iG7A
        jLmSAJ87VwygAcQ89gECaqLNPKnNpen6PA==
X-Google-Smtp-Source: ABdhPJx12W7eywYlykXYDbQu0b6g4VSaRTp5vDCsgxPrR9gHb7GAAKbXh65jaSneYnP+3hFbIDIQLg==
X-Received: by 2002:a62:ddd4:0:b029:155:af54:3000 with SMTP id w203-20020a62ddd40000b0290155af543000mr4920164pff.64.1602871800566;
        Fri, 16 Oct 2020 11:10:00 -0700 (PDT)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id y14sm3538573pfe.107.2020.10.16.11.09.59
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:09:59 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 2/2] Bluetooth: A2MP: Fix not setting request ID
Date:   Fri, 16 Oct 2020 11:09:56 -0700
Message-Id: <20201016180956.707681-2-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201016180956.707681-1-luiz.dentz@gmail.com>
References: <20201016180956.707681-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This fixes not resetting of the request ID when sending
A2MP_GETAMPASSOC_RSP.

Fixes: Bluetooth: A2MP: Fix not initializing all members
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 net/bluetooth/a2mp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/a2mp.c b/net/bluetooth/a2mp.c
index da7fd7c8c2dc..7a1e0b785f45 100644
--- a/net/bluetooth/a2mp.c
+++ b/net/bluetooth/a2mp.c
@@ -381,10 +381,11 @@ static int a2mp_getampassoc_req(struct amp_mgr *mgr, struct sk_buff *skb,
 	hdev = hci_dev_get(req->id);
 	if (!hdev || hdev->amp_type == AMP_TYPE_BREDR || tmp) {
 		struct a2mp_amp_assoc_rsp rsp;
-		rsp.id = req->id;
 
 		memset(&rsp, 0, sizeof(rsp));
 
+		rsp.id = req->id;
+
 		if (tmp) {
 			rsp.status = A2MP_STATUS_COLLISION_OCCURED;
 			amp_mgr_put(tmp);
-- 
2.26.2

