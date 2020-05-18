Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 976EA1D89A7
	for <lists+linux-bluetooth@lfdr.de>; Mon, 18 May 2020 22:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgERU4n (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 18 May 2020 16:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbgERU4m (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 18 May 2020 16:56:42 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF6FC061A0C
        for <linux-bluetooth@vger.kernel.org>; Mon, 18 May 2020 13:56:42 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id b12so4708793plz.13
        for <linux-bluetooth@vger.kernel.org>; Mon, 18 May 2020 13:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Crvasl2cLFymo7AJ0sHBn/fDUJwOc+UocOMVTyWbCD0=;
        b=k7/6kGSr1oMr0vkveaS/ONB3o8MPx3LP01nOpaiGAfh/K8VDgJZmh4EUWXjjNMxW9D
         OC24PMXGsDYAcrdCoAxWUg58XeyV7ALAXKyN4nejWfdCNoI11oHyJFvqw7j6i+q7V3Ry
         WDP345HqJ3GViyhbpI/riuWpCf+lKMhmGFJwcf1dK2cICrbs/HdWGzwa7iroEoosmJhP
         hi0FnJ//0lXSQ6z2U4TE0thB1LPVTaNGDdJ53KMLMVmkQSh+cSBAkOq3cnlzQT9LSYfU
         wM8DRIK55obbO/y0/JLx1uHHsLB4trMvWSzcO9MLWz0+o63NIeefWhpc6gTc51SFVFuC
         oZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Crvasl2cLFymo7AJ0sHBn/fDUJwOc+UocOMVTyWbCD0=;
        b=f6zFYwG6lTSKG9p58z16cRNnxTVuDHUTyMyrz8rC1DuvjvXHNnl3SJidNc6nBkTkN/
         VqTrqY7Vq5OJRiPbjWardlER6BftIuUGsSCnWOVQh6d6fZ2B0DJDWhbNh7GpNa0uQePP
         UmiEGiQYZZzV8SrOoh2uP8AOPTkJrtIXeKej6sQDwn+WN41wrVH7VJdVOca8/osB/YCI
         HyZB7b/wnfgODSE6zVp/UKQkk+wRbDEFlgh6fwlM3Dj3axaKw8t+JJDOk/Ylqt9zDBNO
         FLyGJ5PKVo8Apsc9k6o6xR5bRn7nxRZlRzPgA22BWDJmgeG77UE0PA6v9D2NmxixWk6w
         4+5w==
X-Gm-Message-State: AOAM5338w6ekJ+OKjh5qUInp/9ViQwg6L6t5Oh7UTfmOPLHb3vA3P8tM
        4d+GXWZpXaTqCfatDKeKVfwCbgVF
X-Google-Smtp-Source: ABdhPJwAu1u9yiD0I7nDM37/YUbHUN6Jmjk75o7p8zHFVHhT4eSByAhdYyK99xjb+kbAi5tOQf/C3w==
X-Received: by 2002:a17:902:9a43:: with SMTP id x3mr18057657plv.332.1589835401575;
        Mon, 18 May 2020 13:56:41 -0700 (PDT)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id q18sm8519808pgn.34.2020.05.18.13.56.40
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 13:56:40 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ 4/4] doc/settings-storage: Update documentation of Endpoints
Date:   Mon, 18 May 2020 13:56:36 -0700
Message-Id: <20200518205636.139184-4-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200518205636.139184-1-luiz.dentz@gmail.com>
References: <20200518205636.139184-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Add documentation of DelayReporting storage as that has been added to
the cache.
---
 doc/settings-storage.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/doc/settings-storage.txt b/doc/settings-storage.txt
index 5f6d25141..6e67ddc9c 100644
--- a/doc/settings-storage.txt
+++ b/doc/settings-storage.txt
@@ -225,6 +225,8 @@ Sample Attributes section:
 	LastUsed:<xx>:<xx>	String	LastUsed has two fields which are the
 					local and remote seids as hexadecimal
 					encoded string.
+	DelayReporting:		Bool	DelayReporting indicates remote
+					support Delay Reporting feature.
 
 Info file format
 ================
-- 
2.25.3

