Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1C423E094
	for <lists+linux-bluetooth@lfdr.de>; Thu,  6 Aug 2020 20:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgHFSf5 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 6 Aug 2020 14:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729234AbgHFSfN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 6 Aug 2020 14:35:13 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0670EC06179F
        for <linux-bluetooth@vger.kernel.org>; Thu,  6 Aug 2020 11:17:16 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id u185so25562269pfu.1
        for <linux-bluetooth@vger.kernel.org>; Thu, 06 Aug 2020 11:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=v4tqhlgmt81cyWp6+Y/SY9rGMdsYRprJ694OWSXWLMo=;
        b=N1wD0R3AOnK+Q8wxwi6DORvnLVCVh6x4akbZdRH3ntsI8qF+pzu97Mn2I2dhvK8r5G
         EwaRJwU39vn+lWySty/ey+AHPTfcVgTpmDxuaD6nFZ4cNBfOXWLwEE0Cx4ZK/AIGc8+S
         BNAV9WWVO1W7LO0ZBgPJ5kl8HyYiyFu5y0Sa312XdbdMLkdSBj9OP0mAF+yVReKKp1Xh
         K7TBORSoO/JMHwSHNj1or/lkTZ5MhUXDdPmGDv7+1gjygTwnA8gI2UC6AotNjpk3vc+T
         GPWFVVgXsLqrdm7c0qtBxKfPw+BiysVSCtrG7lkIdvoZCEuG2GPZgWEubQsgUtnz7lyN
         RZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v4tqhlgmt81cyWp6+Y/SY9rGMdsYRprJ694OWSXWLMo=;
        b=Zp3lAAuxKYpNod7n7x0WTJkp8xARbEQpbLCpVUg6Z0fLiWh6pmacP9hS0FB72n+NCb
         V1CJ+MRgztlNSPWPqY5Bx4BBhi3OlSnDNGBIwd+zY7YjxpoAfvTpjmPOoQxiRABO7UkX
         rrcHB6MbcSVvRQGBA3/eGgTd3u/1ObqMi8R//b+rRLg3PipFZsoR7XGBbXoTzVKhX9RN
         vAHBbTaC/2nhp5f6vZj9bTiqvc8d11bpBqsgd/USMldufZASfUmtVVricnJEFDtdsdDs
         W3D475evhP59uwUCvT2c/PYKqWc37hFIq01PsMisT70VM1xgXPBX9nJ6yyS3tWcYU5xt
         B9cg==
X-Gm-Message-State: AOAM532xM71mQiPsZufaJlsRdNuJJ3xREeSlQEcpe34w36GKnCy6uUsv
        1jdGqnge+4BEDOgG6ufuMTCHa18a
X-Google-Smtp-Source: ABdhPJxhZQK4/QjC5TvcUKEuVGKnFNar2XCWpt2GDQ1UXfltcdLJMZ3F+f409ESGhSomqUs6mMtKoA==
X-Received: by 2002:a62:fc08:: with SMTP id e8mr9044462pfh.208.1596737836164;
        Thu, 06 Aug 2020 11:17:16 -0700 (PDT)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id o16sm10341078pfu.188.2020.08.06.11.17.15
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 11:17:15 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 3/4] Bluetooth: Disable High Speed by default
Date:   Thu,  6 Aug 2020 11:17:13 -0700
Message-Id: <20200806181714.3216076-3-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200806181714.3216076-1-luiz.dentz@gmail.com>
References: <20200806181714.3216076-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Bluetooth High Speed requires hardware support which is very uncommon
nowadays since HS has not pickup interest by the industry.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 net/bluetooth/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/bluetooth/Kconfig b/net/bluetooth/Kconfig
index e2497d764e97..64e669acd42f 100644
--- a/net/bluetooth/Kconfig
+++ b/net/bluetooth/Kconfig
@@ -64,7 +64,6 @@ source "net/bluetooth/hidp/Kconfig"
 config BT_HS
 	bool "Bluetooth High Speed (HS) features"
 	depends on BT_BREDR
-	default y
 	help
 	  Bluetooth High Speed includes support for off-loading
 	  Bluetooth connections via 802.11 (wifi) physical layer
-- 
2.26.2

