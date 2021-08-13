Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0DB13EB565
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Aug 2021 14:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240317AbhHMMXb (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 13 Aug 2021 08:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240520AbhHMMXb (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 13 Aug 2021 08:23:31 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BAD8C061756
        for <linux-bluetooth@vger.kernel.org>; Fri, 13 Aug 2021 05:23:04 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id i32-20020a25b2200000b02904ed415d9d84so9032334ybj.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 13 Aug 2021 05:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ZohIqjo/ruImR4KElZm/VS54ev6XvVTMH0+hw4pfbuU=;
        b=aKT/akV9fbTTI7utKk5Gct85tix21jqtWeNWFlscGWEw7tgdEzDsJ27sarxnUH4BxO
         s4HIq3kmARHwGN1LfYarkbzN5bbUQxgmkdytLczIWTlHS5Lel9sXXdUa2XGZNnAXystl
         1Vf6gwPNyBHb9HF9qt3/7A4hcI0sQAb0yg8h3lTqQ3gy8WacPDAiKnuKzVHOVujGzNCH
         NcyVwUB5YYjf6a/o67tVaZNS4x0DTBhnFYbla5iQdj6mhaq0TTO/dSrzS99wGPFl32Nf
         rtjEoPpcuxU74S6qwvdpyjKMG7U4l9ujjvUC/2Zy+fiegX1dsFgzASdZ0Jc4FFjsEgwG
         p7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ZohIqjo/ruImR4KElZm/VS54ev6XvVTMH0+hw4pfbuU=;
        b=kJFxhQJq7PxyBgXP8dc6tvFx6EXJY6ZRQRjim6jdYI0TG4rJTYGE8AM9wbkjQEPeUi
         Wx1qaZNeS4giuoDDxDnusrq5eiq8VC4OxyGuCO+/ANmLgWtkmyroNbzeRvaSPkS4Qj05
         gABZpqXEkzYwEnDiDIzfT+Nwn+CGUzso//6uov54FNcW65lVEo7kVVY2afzHyMMBpxgJ
         Z7NWeZ9BUK9nM+yBmGNQMr5PyhXp2RcFWJfhwUap3U6R3os6illF/5cYZPYYYLAzGZLe
         p71AjcSq9xdJ2+QX87OKtFlupjUqrQekh55cFFsvLS6XQnAmhh8OYcOmb2owxQxs2aXj
         OGGQ==
X-Gm-Message-State: AOAM531syT1p9jkiyDxN7F0PFJWMB6G/hEvb3K0fuoiSpHbtsqT5K2Rl
        pXJ14OixoCHtVRPOAd1YixvKBKKkwK8W9v56A68cgDqAMR+/D83dvAPGkoQtr8nXrV/nB/h+bfh
        jXWwD26qmIQ4kHHqsQ0rtVSDDyN0SEHOmQ1vPzfBhYNfS34z2kZHNAfQnqqQVoTKLUO3qDLij/C
        hd
X-Google-Smtp-Source: ABdhPJyt2774jlNDYx58SEoBF0k2pdHAalYYn3Y3CsCmICbsl/rRwBmm8so4TGC4ZB3qZkE/bs8JrJGzpG25
X-Received: from apusaka-p920.tpe.corp.google.com ([2401:fa00:1:10:b68c:ff41:db76:21e9])
 (user=apusaka job=sendgmr) by 2002:a25:25ce:: with SMTP id
 l197mr2700186ybl.255.1628857383806; Fri, 13 Aug 2021 05:23:03 -0700 (PDT)
Date:   Fri, 13 Aug 2021 20:18:42 +0800
In-Reply-To: <20210813121848.3686029-1-apusaka@google.com>
Message-Id: <20210813201256.Bluez.57.I864344f9ee91b9c051ae4212c9f5a236bdd49632@changeid>
Mime-Version: 1.0
References: <20210813121848.3686029-1-apusaka@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [Bluez PATCH 57/62] unit/mesh: Inclusive language changes
From:   Archie Pusaka <apusaka@google.com>
To:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     CrosBT Upstreaming <chromeos-bluetooth-upstreaming@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Archie Pusaka <apusaka@chromium.org>

"flooding" is preferred, as reflected in
https://specificationrefs.bluetooth.com/language-mapping/Appropriate_Language_Mapping_Table.pdf
---

 unit/test-mesh-crypto.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/unit/test-mesh-crypto.c b/unit/test-mesh-crypto.c
index 12709dace0..f9b7d81da7 100644
--- a/unit/test-mesh-crypto.c
+++ b/unit/test-mesh-crypto.c
@@ -111,7 +111,7 @@ static const struct mesh_crypto_test s8_1_2 = {
 };
 
 static const struct mesh_crypto_test s8_1_3 = {
-	.name		= "8.1.3 k2 function (master)",
+	.name		= "8.1.3 k2 function (flooding)",
 	.net_key	= "f7a2a44f8e8a8029064f173ddc1e2b00",
 	.p		= "00",
 	.nid		= "7f",
@@ -159,7 +159,7 @@ static const struct mesh_crypto_test s8_2_1 = {
 };
 
 static const struct mesh_crypto_test s8_2_2 = {
-	.name		= "8.2.2 Encryption and privacy keys (Master)",
+	.name		= "8.2.2 Encryption and privacy keys (flooding)",
 	.net_key	= "7dd7364cd842ad18c17c2b820c84c3d6",
 	.p		= "00",
 	.nid		= "68",
-- 
2.33.0.rc1.237.g0d66db33f3-goog

