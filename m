Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1931CB022
	for <lists+linux-bluetooth@lfdr.de>; Fri,  8 May 2020 15:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728672AbgEHNX5 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 8 May 2020 09:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728090AbgEHNX5 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 8 May 2020 09:23:57 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1CF2C05BD43
        for <linux-bluetooth@vger.kernel.org>; Fri,  8 May 2020 06:23:56 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id o14so587811ljp.4
        for <linux-bluetooth@vger.kernel.org>; Fri, 08 May 2020 06:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codecoup-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ExgZuUhz7T60wd3pGOGL+GxxpEzQFqOPw8WWmcepTHE=;
        b=QID3NF9dVs9ia6/oCeXzsCJ2Pj03TdpUMBz3yG1fWTpHNlPUEa7UOLrEXYtIwiZNuY
         aPDAKOjGIrzhEjNByMCgCgZXSdvXYR7ptGrB8YVGdPCGY7psBlC4WvNTShUSFPKGujbV
         C7J428ZH9PCqMTjpseD+BYz8NUSKWoaFStuXaPi5tjDka4ztpMSHHTQOS+3pFBvQv+8u
         aL4v9qalizPwFuCgRPoHetgm+FFg3ZcC2h1ZmxjY1koDun6MQEkublFV8+2/S0WZ0B5r
         42IS+LMwfI5clic9z+SjpHQF+V/2v+OB1V6GGa52KfhGARmooemdF346TuqcpKRrG7YY
         lUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ExgZuUhz7T60wd3pGOGL+GxxpEzQFqOPw8WWmcepTHE=;
        b=khgYRQVX0jZNyrvE7reAFEX88u0TvppN9K3t6QJz7Jvptk2lgO+1m2ug8Up2PDN5pR
         YScjCDr/IdP0IF3V458epxU99ObCIM43f14WuJoWL/b2AKxhrj4vrqLTdUvho96u+ukG
         QFGxPBPANtjQANlTLEhUv3zc6I4f8LNtaU12BA5f6bGnQL7+GcUmjud7bUJtPJ5JjDhR
         i1tQrEeDseYxPXgxDvFOx/j0rBgP4BZYXL34MrE0ryuCfPifX7Qxdsszj2ZkLySKCt+b
         AxNl9bGDxoSDCaceLKpf00f7TRPvbscQV3cXWpMKxMnSs2PG4WZlUIRm1V2ZtpErFq8U
         LqJg==
X-Gm-Message-State: AOAM530RbnIigyNxXj0O/I+quN5wokbSKzJQ/I/SrSRZD4f0+HEpg7NT
        i3fRuTUmT9Dbv8/wU/44FvxSO8dIewNhyg==
X-Google-Smtp-Source: ABdhPJx9J6PG9MkhJXXkgOu5tUonbkXwv+ciZt3/kufWZD/AKOL5zrH3WR+oQahrSrjwmwS5AjpdXQ==
X-Received: by 2002:a2e:571a:: with SMTP id l26mr1692164ljb.12.1588944234808;
        Fri, 08 May 2020 06:23:54 -0700 (PDT)
Received: from rymek.int.codecoup.pl ([95.143.243.62])
        by smtp.gmail.com with ESMTPSA id l18sm1185497ljg.98.2020.05.08.06.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 06:23:53 -0700 (PDT)
From:   =?UTF-8?q?=C5=81ukasz=20Rymanowski?= 
        <lukasz.rymanowski@codecoup.pl>
To:     linux-bluetooth@vger.kernel.org
Cc:     =?UTF-8?q?=C5=81ukasz=20Rymanowski?= 
        <lukasz.rymanowski@codecoup.pl>
Subject: [PATCH BlueZ] tools/btgatt-client: Add option to set BT_SECURITY_FIPS
Date:   Fri,  8 May 2020 15:23:49 +0200
Message-Id: <20200508132349.6495-1-lukasz.rymanowski@codecoup.pl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Need for GAP/SEC/SEM/BI-10-C
---
 tools/btgatt-client.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/btgatt-client.c b/tools/btgatt-client.c
index 82a9e3fe0..bc762dba1 100644
--- a/tools/btgatt-client.c
+++ b/tools/btgatt-client.c
@@ -1492,8 +1492,8 @@ static void usage(void)
 		"\t-d, --dest <addr>\t\tSpecify the destination address\n"
 		"\t-t, --type [random|public] \tSpecify the LE address type\n"
 		"\t-m, --mtu <mtu> \t\tThe ATT MTU to use\n"
-		"\t-s, --security-level <sec> \tSet security level (low|"
-								"medium|high)\n"
+		"\t-s, --security-level <sec> \tSet security level (low|medium|"
+								"high|fips)\n"
 		"\t-v, --verbose\t\t\tEnable extra logging\n"
 		"\t-h, --help\t\t\tDisplay help\n");
 }
@@ -1537,6 +1537,8 @@ int main(int argc, char *argv[])
 				sec = BT_SECURITY_MEDIUM;
 			else if (strcmp(optarg, "high") == 0)
 				sec = BT_SECURITY_HIGH;
+			else if (strcmp(optarg, "fips") == 0)
+				sec = BT_SECURITY_FIPS;
 			else {
 				fprintf(stderr, "Invalid security level\n");
 				return EXIT_FAILURE;
-- 
2.20.1

