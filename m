Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91D3F369D9B
	for <lists+linux-bluetooth@lfdr.de>; Sat, 24 Apr 2021 01:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235898AbhDWXyh (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 23 Apr 2021 19:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbhDWXyd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 23 Apr 2021 19:54:33 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CF5C06174A
        for <linux-bluetooth@vger.kernel.org>; Fri, 23 Apr 2021 16:53:54 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id u7so24173499plr.6
        for <linux-bluetooth@vger.kernel.org>; Fri, 23 Apr 2021 16:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DNxBqQihUr4AWl+3gRnN9OOrd0lID4v1rj5eVBQKml8=;
        b=RaOTqk5iUSxjv5s1BWj/bCZryehbe4kxFBCqRijvunyC45a3MGCRyMcINYD3GUg++I
         zFEcU2zlibA/A4WyhU0KBOSpQwcJGtWWHuroafrCaUR470CmLW3ogf5tNTEuSQuM7H/A
         csjetWFEtcukeY/8ucSHpfqjoFagz9Efs4xO51JKH/BUxJkIhSL0ZhQHxWzHc+wYU1AA
         hu9Lc+rjx9EG0X9W17YhaI2gqpHXE9Tq4PWNiglvNyb6fLhlpsBHnF+25zOnCWwZ8BfM
         SBppElV1gfkPZRzWhcIdshA+avvBXwTZJ4xY488aVbOTFvDc3VQqRjKyWlcv6K++UnmF
         0F3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DNxBqQihUr4AWl+3gRnN9OOrd0lID4v1rj5eVBQKml8=;
        b=JJagrAtxmZ2OJbVhgBiTO5tKKCPpVHUxD+iNZUPjayuAy73h/udqHElEVSE0nO7kuh
         2uxqTmvus3utZIfz+YQ+YR4FCs7le7NYxPg2ZeY2AY9PHouh24wiIucAfybj/82i4tuC
         qizmSw5c9KqsiLnaNGssycfAd5yZi6ClrsLGZ2ZKzyiCXbiK0XNBgOxVaKLN55eQvkss
         Vv12/tGvm5NsTr82iqqbdHI0f/iH5LEMyEE+Iqre5a3zokvJ+xNkhfImjEUdE3qN4LOh
         H0bc/EiR90NmtAHfBhVeNe6nsxEzFJeB/WB29l3ZtohZKygNZZ+1X3RExByTJAAfWXRP
         N7bg==
X-Gm-Message-State: AOAM531bxirCQh3eiUxPvurF2iGRiwftGFczNMJpkTqg83GK/lUd8bQv
        R0tkDiKKtw5HaFSFE+vLiviSWszwL3o=
X-Google-Smtp-Source: ABdhPJzwAhnaSjtXCrhvA2eJFn3c0bL6WFFMNfd+b/aUXMZWvb3Pd2VJLgm4MxNOoDDLESBpDU4tOA==
X-Received: by 2002:a17:90b:33c6:: with SMTP id lk6mr7271213pjb.37.1619222034317;
        Fri, 23 Apr 2021 16:53:54 -0700 (PDT)
Received: from han1-XPS-13-9350.hsd1.or.comcast.net ([2601:1c0:6a01:d830:3e1c:a9e3:7268:3bbf])
        by smtp.gmail.com with ESMTPSA id v64sm5792318pfc.117.2021.04.23.16.53.53
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 16:53:53 -0700 (PDT)
From:   Tedd Ho-Jeong An <hj.tedd.an@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [BlueZ PATCH 2/3] tools/tester-runner: enable enhanced credit flow control mode
Date:   Fri, 23 Apr 2021 16:53:51 -0700
Message-Id: <20210423235352.33965-2-hj.tedd.an@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210423235352.33965-1-hj.tedd.an@gmail.com>
References: <20210423235352.33965-1-hj.tedd.an@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Tedd Ho-Jeong An <tedd.an@intel.com>

This patch enables enhanced credit flow control mode for l2cap.
---
 tools/test-runner.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/test-runner.c b/tools/test-runner.c
index a17ec594a..96de7034e 100644
--- a/tools/test-runner.c
+++ b/tools/test-runner.c
@@ -247,6 +247,7 @@ static void start_qemu(void)
 				"rootfstype=9p "
 				"rootflags=trans=virtio,version=9p2000.L "
 				"acpi=off pci=noacpi noapic quiet ro init=%s "
+				"bluetooth.enable_ecred=1"
 				"TESTHOME=%s TESTDBUS=%u TESTMONITOR=%u "
 				"TESTDEVS=%d TESTAUTO=%u TESTARGS=\'%s\'",
 				initcmd, cwd, start_dbus, start_monitor,
-- 
2.25.1

