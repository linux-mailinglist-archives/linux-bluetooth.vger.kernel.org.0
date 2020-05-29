Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 052EB1E8202
	for <lists+linux-bluetooth@lfdr.de>; Fri, 29 May 2020 17:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgE2Pji (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 29 May 2020 11:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbgE2Pji (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 29 May 2020 11:39:38 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14490C03E969
        for <linux-bluetooth@vger.kernel.org>; Fri, 29 May 2020 08:39:38 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id a68so1733172vsd.8
        for <linux-bluetooth@vger.kernel.org>; Fri, 29 May 2020 08:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F2ZqteO5Fl457QXeO6VJQuX//SkTDU319wEQJIAHCbg=;
        b=S1MxHWQz8z5UywgSr+lZEtNog26SLKx72uEnIjRWgBPzD5pmIqZGRjTyiBrZy8LUSd
         Hzl4SNJk8JvxrSvXiZ0Y/ihuO3eOFjYOgxtB4AGy5jXpMzH//6l/vqxJCG9YuIPSvcKi
         /cXkLrp3WqdTPIx+IJmvOr11Onho3SPsjZSoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F2ZqteO5Fl457QXeO6VJQuX//SkTDU319wEQJIAHCbg=;
        b=AwIea9pOX9fXsZkU4XMRZtgDUekHUswlyACkYNHJ6/fixeDjiFwE5xm4ETstA46fVV
         hiExgjHucCYXXCkZAfXQnfeTCKF/hYm/rCIgfRAgP3d/fVw4I23M3Pgg22sdtUgMW7p3
         Y5ZgGvzW+g8SRT1HZKNmEKrHFTKp03911krGSOWAZSYyogErPsQuAEB5cyqZFybeOQpE
         lV3j2IodZoVgdJx7rCKbVPey8wKpt4nsxjXSpvf8UsIE6N0zyGvwkVMbccHzNkBx0zNB
         ZigUbc8jKLG+wWwMg0LVkpWN7I/cq1okK7tId/fz7uZ6CZFL4fvJU9p1vw2ohysG5jBE
         b+6w==
X-Gm-Message-State: AOAM531iFYm11J3FV5T74ALeA6MdzIwgAdfWZ8BKlCeVyr2XlAG0kxyH
        fkr+YhcCfeKYGYPMUeR3/N6ptLGhdXQ=
X-Google-Smtp-Source: ABdhPJxAi3Z3IKipMbtQ7u7AT7YxSzLA6WLAq+ptZYdMLujqJc8gqZhS59VX1UShfRgn72JnKXuR5Q==
X-Received: by 2002:a67:407:: with SMTP id 7mr6129672vse.95.1590766777026;
        Fri, 29 May 2020 08:39:37 -0700 (PDT)
Received: from alain.c.googlers.com.com (252.177.243.35.bc.googleusercontent.com. [35.243.177.252])
        by smtp.gmail.com with ESMTPSA id o2sm1309494vkl.27.2020.05.29.08.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 08:39:36 -0700 (PDT)
From:   Alain Michaud <alainm@chromium.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Alain Michaud <alainm@chromium.org>
Subject: [BlueZ PATCH v3 4/4] fixing const decoration warnins on options.
Date:   Fri, 29 May 2020 15:38:17 +0000
Message-Id: <20200529153814.213125-5-alainm@chromium.org>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
In-Reply-To: <20200529153814.213125-1-alainm@chromium.org>
References: <20200529153814.213125-1-alainm@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This changes fixes const decoration warnins on options.

---

Changes in v3: None
Changes in v2: None

 src/main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/src/main.c b/src/main.c
index ca27f313d..cea50a3d2 100644
--- a/src/main.c
+++ b/src/main.c
@@ -80,7 +80,7 @@ static enum {
 	MPS_MULTIPLE,
 } mps = MPS_OFF;
 
-static const char *supported_options[] = {
+static const char * const supported_options[] = {
 	"Name",
 	"Class",
 	"DiscoverableTimeout",
@@ -129,7 +129,7 @@ static const char * const controller_options[] = {
 	NULL
 };
 
-static const char *policy_options[] = {
+static const char * const policy_options[] = {
 	"ReconnectUUIDs",
 	"ReconnectAttempts",
 	"ReconnectIntervals",
@@ -137,7 +137,7 @@ static const char *policy_options[] = {
 	NULL
 };
 
-static const char *gatt_options[] = {
+static const char * const gatt_options[] = {
 	"Cache",
 	"KeySize",
 	"ExchangeMTU",
@@ -146,8 +146,8 @@ static const char *gatt_options[] = {
 };
 
 static const struct group_table {
-	const char *name;
-	const char **options;
+	const char * const name;
+	const char * const * const options;
 } valid_groups[] = {
 	{ "General",	supported_options },
 	{ "Controller", controller_options },
@@ -243,7 +243,7 @@ static enum jw_repairing_t parse_jw_repairing(const char *jw_repairing)
 
 
 static void check_options(GKeyFile *config, const char *group,
-						const char **options)
+					const char * const * const options)
 {
 	char **keys;
 	int i;
-- 
2.27.0.rc0.183.gde8f92d652-goog

