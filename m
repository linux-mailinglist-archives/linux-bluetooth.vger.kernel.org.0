Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8939723E112
	for <lists+linux-bluetooth@lfdr.de>; Thu,  6 Aug 2020 20:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729979AbgHFSkK (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 6 Aug 2020 14:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729981AbgHFSkI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 6 Aug 2020 14:40:08 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEEAFC0617A0
        for <linux-bluetooth@vger.kernel.org>; Thu,  6 Aug 2020 11:17:17 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id mt12so7282848pjb.4
        for <linux-bluetooth@vger.kernel.org>; Thu, 06 Aug 2020 11:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QrCSGaZo3W622aXcnbTdNOpWK+XU36Ue7MMISwHaE48=;
        b=OPwELL54m6rtl08l7IuN5lrL+6LgIu2mHgTOEQ4EIHVwQqa6sHGHonzyMenwmqw9vm
         KEGmy/EaFgX6TCFJqHHr56AAFPx3BZ8gL3Sw9i+DKLe83nBf78d4v86slQUEHxYvyHGB
         d98VwaS+wbrpG5ICQ3jBP314AmPrmuE0EPlolPcr8gEbDBZD6UM0hVnqS91yjVmsxpTD
         wV5WFmNgiw7LofDE2HGZ9KV5mrSK+J0luEwhyEWZYl9AE+1WsldZ1OnDIj93mx9R0wYc
         J6n9Mmy5h2uighwZB8/2npjSm+Bp/vf2epv/SS7rQ88c7GGvWudaqZptnOCLedpwu7nP
         jiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QrCSGaZo3W622aXcnbTdNOpWK+XU36Ue7MMISwHaE48=;
        b=ka2h0T8I/Xvx8cmCmEV9YVAxHEOIWZ9VliotrM0pDmwtAiDWPEwrPEraDP4/ROYGwV
         HaE8nHOBYBypOrWAd/A14wlLprgC6DBuOZ7Vm0bdEhJgzpUF4n5PJg3coX5a0K9L2YhE
         cnDOHhT2HxGtmpWepGrnqR6xX+7Z8y1aazEvOtHuvwigOLOjicCtlaoO+nLq1iaxEdto
         0L/nUHxJE6cI8hva1Og7mVXQn9mHW3Cusvg6EfOnKSAFsTAB4KZJaJ/iaXIqNyRBtcLZ
         4+nmeGrs4goYRjhqSivKstPIzHO4v3E3LEbWsRJdyl/NTQQ5kDLa91pNHGsVFwU8CpbY
         ming==
X-Gm-Message-State: AOAM532okFW73ZDbd3KmaJYYvlC2f05Xaj02mToX9WzWJLDjyKvVSh63
        SnPnZSqmb85eU1ydYX/C0douDCqD
X-Google-Smtp-Source: ABdhPJxAvHDYOWeibSFHSpMpOG+Juf4MXbo63ZW3bbqWWr40VCY5GaduLbm/v4E3viMH7YoF1HRYqA==
X-Received: by 2002:a17:902:7605:: with SMTP id k5mr9226566pll.122.1596737837096;
        Thu, 06 Aug 2020 11:17:17 -0700 (PDT)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id o16sm10341078pfu.188.2020.08.06.11.17.16
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 11:17:16 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 4/4] Bluetooth: MGMT: Fix not checking if BT_HS is enabled
Date:   Thu,  6 Aug 2020 11:17:14 -0700
Message-Id: <20200806181714.3216076-4-luiz.dentz@gmail.com>
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

This checks if BT_HS is enabled relecting it on MGMT_SETTING_HS instead
of always reporting it as supported.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 net/bluetooth/mgmt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 5bbe71002fb9..5758ccb524ef 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -782,7 +782,8 @@ static u32 get_supported_settings(struct hci_dev *hdev)
 
 		if (lmp_ssp_capable(hdev)) {
 			settings |= MGMT_SETTING_SSP;
-			settings |= MGMT_SETTING_HS;
+			if (IS_ENABLED(CONFIG_BT_HS))
+				settings |= MGMT_SETTING_HS;
 		}
 
 		if (lmp_sc_capable(hdev))
@@ -1815,6 +1816,10 @@ static int set_hs(struct sock *sk, struct hci_dev *hdev, void *data, u16 len)
 
 	bt_dev_dbg(hdev, "sock %p", sk);
 
+	if (!IS_ENABLED(CONFIG_BT_HS))
+		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_HS,
+				       MGMT_STATUS_NOT_SUPPORTED);
+
 	status = mgmt_bredr_support(hdev);
 	if (status)
 		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_HS, status);
-- 
2.26.2

