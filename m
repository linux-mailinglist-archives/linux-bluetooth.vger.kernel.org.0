Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57DF217B66
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Jul 2020 00:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729348AbgGGWwe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Jul 2020 18:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728299AbgGGWwe (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Jul 2020 18:52:34 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB9DCC08C5E1
        for <linux-bluetooth@vger.kernel.org>; Tue,  7 Jul 2020 15:52:33 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id w2so19890638pgg.10
        for <linux-bluetooth@vger.kernel.org>; Tue, 07 Jul 2020 15:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tg/83hrbdiKC/nqtULfMVzExwdn+D48CNwXlyo8fmO4=;
        b=BUW2C+eLfsuR3+MVx1e1OCy+7uFgx75RJLG1jW550N43OasNBoRqPU9cB8UXYlfNDu
         pcU1SBWMsnh822z3jayvN0pIM00XnDdb8FMJBRAAJGgSeedETZntzbCQ8EbrVjJqGFUR
         g8Z/FkPIapa/KAtXuPv/Xx9z25M1nW9ELxH1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tg/83hrbdiKC/nqtULfMVzExwdn+D48CNwXlyo8fmO4=;
        b=UyWIw5pphU1WyzNb9J4kGysGwcT277WYBgx0xWWon7S3PX0J8XYR6AF6w/A5kfXCPz
         3UvQuJuicEueR1Td22ymXoKojLO6M5klbQRQrWAEv5Bdg533hKY7q5+Wn1f0cVsrQwvQ
         P/m6pwYb3IgPcowBodvKtYvflVw/6AD3j0FbEtf7/NJQCiMSM2iEF1jvmdzO0gkfRd+6
         /Ar3CiamWo4X8MSQoxr+Mn6K49xbUSIzRLsqlKh3zo277RaGQfGNqf6SvLnujUlTh0V4
         iLsNzGdGpHcwPhy4vMbT3xBDHFYyb2jWgYtIi5EAw0yylLmSFJTjMyurOBoN7HT1FjGU
         VL8g==
X-Gm-Message-State: AOAM531RokutxP9YfWmmPA89Ex/HrEkhCai3EbPLvLbPcjBF5hQGkCPg
        DXWBXOj2b/MZw3Mjf8CI/F6wlVpz6SI=
X-Google-Smtp-Source: ABdhPJwu9V/dqmxBw5pNmoYQaZrQMps5/47kI7zjjDffv70FpI2X7Gle+8miopcdNJQjUzX2lnINDg==
X-Received: by 2002:a62:7bc9:: with SMTP id w192mr49102384pfc.255.1594162353028;
        Tue, 07 Jul 2020 15:52:33 -0700 (PDT)
Received: from mcchou0.mtv.corp.google.com ([2620:15c:202:201:de4a:3eff:fe75:1314])
        by smtp.gmail.com with ESMTPSA id 73sm23737551pfy.24.2020.07.07.15.52.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jul 2020 15:52:32 -0700 (PDT)
From:   Miao-chen Chou <mcchou@chromium.org>
To:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>
Cc:     Alain Michaud <alainm@chromium.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Miao-chen Chou <mcchou@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH] Bluetooth: Use whitelist for scan policy when suspending
Date:   Tue,  7 Jul 2020 15:52:28 -0700
Message-Id: <20200707155207.1.Id31098b8dbbcf90468fcd7fb07ad0e872b11c36b@changeid>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Even with one advertisement monitor in place, the scan policy should use
the whitelist while the system is going to suspend to prevent waking by
random advertisement.

The following test was performed.
- With a paired device, register one advertisement monitor, suspend
the system and verify that the host was not awaken by random
advertisements.

Signed-off-by: Miao-chen Chou <mcchou@chromium.org>
Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

---

 net/bluetooth/hci_request.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index 6168a3440eff9..e161aabd7bf36 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -799,9 +799,10 @@ static u8 update_white_list(struct hci_request *req)
 
 	/* Once the controller offloading of advertisement monitor is in place,
 	 * the if condition should include the support of MSFT extension
-	 * support.
+	 * support. If suspend is ongoing, whitelist should be the default to
+	 * prevent waking by random advertisements.
 	 */
-	if (!idr_is_empty(&hdev->adv_monitors_idr))
+	if (!idr_is_empty(&hdev->adv_monitors_idr) && !hdev->suspended)
 		return 0x00;
 
 	/* Select filter policy to use white list */
-- 
2.26.2

