Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8F264B4D0
	for <lists+linux-bluetooth@lfdr.de>; Wed, 19 Jun 2019 11:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731329AbfFSJTF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 19 Jun 2019 05:19:05 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:35794 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731293AbfFSJTF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 19 Jun 2019 05:19:05 -0400
Received: by mail-lj1-f176.google.com with SMTP id x25so2542425ljh.2
        for <linux-bluetooth@vger.kernel.org>; Wed, 19 Jun 2019 02:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+4LlaA6a665awvFm4yjOmxEhD6nyINS588QTgyS/gTg=;
        b=xXGdGTlPjEp1Fxl8JlyMgUkVI5p27/Cuh7HZ8N6EAvdxTtaJZ4b3hvjdkXXtRWrk3b
         OEqsDJHAjPSa+eLgF2eXgAUz33jbMaW00d2i1DI9bO+icPnksowtnGjaJcy1fUuU5rbI
         7JK+umi/NZr5z8a+AcmtYElyLKCb1LML1n8U593Uiceqh3Xjqh+IYMksU6tOUdiasY9I
         Me4mhX/ce6bpiQA5UUn0CIYwAlyr3nbagFHvu1fCUEGulzxg8lvVTy8ualWu74R03aDg
         xn4jLo/kGZlfGk8fNYT8vukkvhpFTpeSvU4vKy7wwc+Y8bYHvlChaRGGzkX6cyqyYRp0
         DttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+4LlaA6a665awvFm4yjOmxEhD6nyINS588QTgyS/gTg=;
        b=NXQtVyOZbWZ1QI8l1iODO2/ylpi2ll6QdJy1EwKMgo9rdQ5YVRWw9tetb+27sZQo1o
         ZenCkeNiV6qwUSIqYdkU9u+OTlx5qv3U1uf26If1jJzXS6xDe4eMf5s1sdaEwB2zHWj5
         hUJG7W6CKuRgEjwjPVWu+Etzn2M3lSrijKIhq8ypOx3JmNWjdyqrHuFdwWHAHHwakn6U
         BX/pHgilsg5OO+ZaRXuiUoTK10KY9jjPUM3oWJoR2zQPAWkk0GEdEwAy7uTxz3N85duj
         4zyeT2kSRWnODt8cZsH1n9k1oArTITusZ0YejmHi687uwzGTzS36C1egmjxKXjHBCOVg
         Hn6w==
X-Gm-Message-State: APjAAAW3yntcbOpuycM3aeuIaGFWpMqDi+6s9GtB/3e9PptGmYxAG6M7
        nBs7m3FirgHN5/TqvXYr+5uA75r6YNHoLg==
X-Google-Smtp-Source: APXvYqyrBqKVBmWQbpSaHEU55KUcBkPvLpLj3wLrPgZtXk8jOD6Mj9ygPVf7+6VxKsJK0NJkI5qRnA==
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr38273766ljs.54.1560935942640;
        Wed, 19 Jun 2019 02:19:02 -0700 (PDT)
Received: from localhost.localdomain ([217.153.94.18])
        by smtp.gmail.com with ESMTPSA id h3sm3010878lja.93.2019.06.19.02.19.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 02:19:02 -0700 (PDT)
From:   Jakub Witowski <jakub.witowski@silvair.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Inga Stotland <inga.stotland@intel.com>,
        Brian Gix <brian.gix@intel.com>
Subject: [PATCH v3] mesh: Remove error code from Leave() in mesh-api.txt
Date:   Wed, 19 Jun 2019 11:18:56 +0200
Message-Id: <20190619091856.10557-1-jakub.witowski@silvair.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This removes NotFound error from mesh-api.txt from Leave() function.
---
 doc/mesh-api.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/doc/mesh-api.txt b/doc/mesh-api.txt
index 2a800468b..c82732d2c 100644
--- a/doc/mesh-api.txt
+++ b/doc/mesh-api.txt
@@ -112,8 +112,6 @@ Methods:
 		identified by the 64-bit token parameter. The token parameter
 		has been obtained as a result of successful Join() method call.
 
-		PossibleErrors:
-			org.bluez.mesh.Error.NotFound
 
 	uint64 token CreateNetwork(object app_root, array{byte}[16] uuid)
 
-- 
2.20.1

