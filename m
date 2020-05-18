Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5DFF1D8AE3
	for <lists+linux-bluetooth@lfdr.de>; Tue, 19 May 2020 00:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728568AbgERW3N (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 18 May 2020 18:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727900AbgERW3N (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 18 May 2020 18:29:13 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9733AC061A0C
        for <linux-bluetooth@vger.kernel.org>; Mon, 18 May 2020 15:29:13 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id 5so491987pjd.0
        for <linux-bluetooth@vger.kernel.org>; Mon, 18 May 2020 15:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zy3uJZB5XsJzztjORyRIanJypmSXB+lz2legdKKnj/A=;
        b=cxQMM18waIIS9+gLnDqVR1XJ386RIdQGTngJAj6cV4oQurY86O3iN1Ryk2LCZ/OCfN
         Xty+BN/EXtDjyJgoui3QfRBO3zygI0cb+CWCgHrfGsA+BMevPwgE3/qKOC7qDc+W0QY0
         d2B5a58HTSg9o2RkLDque7eahdCJvbKLErSNwCWnDinbHodU23dNHMop+PBCvatnTK7T
         6+z+PU9SKte2E24F4CMEATRsSxvN6AG9U6PGEgJQx1yQoLZHqlg/42wkdtnRP71OohxQ
         MUhO9nN2JPs2D9gD0mvwzEMLlhaAAoiVcVgYnbgNW4cuvZNcXW9I18T179qz1QXGtPAe
         wczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zy3uJZB5XsJzztjORyRIanJypmSXB+lz2legdKKnj/A=;
        b=gZzkoaMB0PBhqHQ9h4vJ9CtaOqV3SINbpArrWjgeB4vpFB6ZzeoFyDKxoRJlvMmuj7
         /5euX8axTJYqThSzRv6OIMVXjGGjTrwDwfWRSZUceBD3nllMbUooUp16ZA1UKiU3t9cU
         5qJfJmbkIMfcNOzLI9ohNgwMLUsK6Zm3tdjwQurd6qizkKV+M5gDCkWUd2eafrO2P+OJ
         PUkNapywt2WPPIkwoNGLkL0ubK/RACPMcHPRVRCry7ryhCtUtZb+ghDxE+DsaOkj7IuC
         0aa5xd6UbyI9vuFdzNOCyTAN3QXrHRNCgviyTRdkDiw5EA++3HL/Qpuubsh74loJL8g2
         J6Vw==
X-Gm-Message-State: AOAM530g8UV17CuijtqFBSZm1uXGL8bWLCdbf81thmU5+w0Ul+kxLhTW
        I8dNgpeyGK4/iDoUA7V2xkFqoSU4
X-Google-Smtp-Source: ABdhPJwE2FtBVlP+a/kgeFq4VvMvmUdt0osJX7vBCOdED/P2y4pO6UDtWBxQ7gB3hsrmLxeDqIReMA==
X-Received: by 2002:a17:90a:8509:: with SMTP id l9mr1625022pjn.113.1589840952813;
        Mon, 18 May 2020 15:29:12 -0700 (PDT)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id 5sm8291733pgl.4.2020.05.18.15.29.11
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 15:29:11 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 2/4] doc/media-api: Add documentation for DelayReporting
Date:   Mon, 18 May 2020 15:29:06 -0700
Message-Id: <20200518222908.146911-3-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200518222908.146911-1-luiz.dentz@gmail.com>
References: <20200518222908.146911-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

The code was expecting the endpoint to expose
MediaEndpoint.DelayReporting property in order to expose
MediaTransport.Delay property.
---
 doc/media-api.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/doc/media-api.txt b/doc/media-api.txt
index 07f7ac3e0..dabc69936 100644
--- a/doc/media-api.txt
+++ b/doc/media-api.txt
@@ -580,6 +580,10 @@ Properties	string UUID [readonly, optional]:
 
 			Device object which the endpoint is belongs to.
 
+		bool DelayReporting [readonly, optional]:
+
+			Indicates if endpoint supports Delay Reporting.
+
 MediaTransport1 hierarchy
 =========================
 
-- 
2.25.3

