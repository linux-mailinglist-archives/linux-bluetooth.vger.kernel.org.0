Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9A0397B1D
	for <lists+linux-bluetooth@lfdr.de>; Tue,  1 Jun 2021 22:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234761AbhFAUVJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 1 Jun 2021 16:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234714AbhFAUVI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 1 Jun 2021 16:21:08 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F8AC061574
        for <linux-bluetooth@vger.kernel.org>; Tue,  1 Jun 2021 13:19:26 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id e15so7516217plh.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 01 Jun 2021 13:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CdJNU0zP86fQfsZY8fo8y9YbQomtTm+qfzfDCYZeLvc=;
        b=DvpHPtiww7tPe0cxbRBJud6vxdvEiIEJPm3+O44VVGXzAIVsLo2gxCVsiK4hNDkEW4
         CAcgr8v8Tydeln8YK9+iL0KG2pGcLU0k+KW8cmk8O9zQMDUbtgl5rWc6wKdcVHm7MM9o
         gKTTUBopJh8vCeyK8RvxSXgNz1FefbtQiylzZ+QGdQwlNafIqitFvONbk7DEacS4vNK0
         faeHIWI7iu5EqvYZ3eGHyKNduJJVWy0VhfZd/rmKRu6zOZSvTi6elcmoS8AMBroiqAxo
         pc0NTTO/FFjRQhoVT0zS+zQS7HkbqcssZ/tjbFQP+/YiiAyFeBS8oP8pJS9AVzAj/wzd
         qyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CdJNU0zP86fQfsZY8fo8y9YbQomtTm+qfzfDCYZeLvc=;
        b=iJSsKQZD9KT13yl4lEtjxTdbvn6yIC0V49OuNlkui8aEl2wYYzHVU6WZgxrbpgXZqH
         0/vF0LaDUMLiX9R+Oq5KFvdC6ArIvl4MFZqGWdHIVIxPFKtkdDJJlnPHio7/SYy06IVw
         vY3Xa9fh4HdqdX5tihLSviSgaQWxstXYxL67v2UBjCXaUpZ0vZcRsqvYtviAocUl8hQT
         1YmhTUOCE2DShh4M4fczhymgQkrUEzgRIEORzMpd3yz9J2ksHhnFY2Whv6vpV/8OdZmP
         SSBJ8G7MD/hMh8nLXZcbHpT7G4qS7CQJCgHq7kBulQCVRJua9c1gkbDNeHTRNajd6o4x
         bmtw==
X-Gm-Message-State: AOAM533IUSB2XrzT67/4uQwJFBtEXF2rh+4Ikueg3YRYmzXpiE22KoTv
        +KV3VmVkmwakaWO3jxn/WoqTIPpD5r0=
X-Google-Smtp-Source: ABdhPJxK0Sqajq8yyptqQT6kaQpY/SgCBzK+o8DVdZW018+c3w7tYNGNte5LTGSEFxreeauhnIDrMQ==
X-Received: by 2002:a17:90b:3e89:: with SMTP id rj9mr14955311pjb.114.1622578765415;
        Tue, 01 Jun 2021 13:19:25 -0700 (PDT)
Received: from han1-mobl3.intel.com ([2601:1c0:6a01:d830::512a])
        by smtp.gmail.com with ESMTPSA id y129sm13399262pfy.123.2021.06.01.13.19.23
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 13:19:23 -0700 (PDT)
From:   Tedd Ho-Jeong An <hj.tedd.an@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [BlueZ PATCH 1/3] emulator/btdev: Enable LE Privacy feature
Date:   Tue,  1 Jun 2021 13:19:21 -0700
Message-Id: <20210601201923.899950-1-hj.tedd.an@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Tedd Ho-Jeong An <tedd.an@intel.com>

This patch enables LE Privacy to support LL Privacy feature.
---
 emulator/btdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/emulator/btdev.c b/emulator/btdev.c
index 692fabd71..13abad577 100644
--- a/emulator/btdev.c
+++ b/emulator/btdev.c
@@ -5415,6 +5415,7 @@ static void set_bredrle_features(struct btdev *btdev)
 		btdev->features[4] |= 0x80;	/* 3 slot EDR ACL packets */
 		btdev->features[5] |= 0x01;	/* 5 slot EDR ACL packets */
 
+		btdev->le_features[0] |= 0x40;	/* LE PRIVACY */
 		btdev->le_features[1] |= 0x01;	/* LE 2M PHY */
 		btdev->le_features[1] |= 0x08;	/* LE Coded PHY */
 		btdev->le_features[1] |= 0x10;  /* LE EXT ADV */
-- 
2.26.3

