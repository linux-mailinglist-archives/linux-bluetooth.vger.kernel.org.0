Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E00E265F4C
	for <lists+linux-bluetooth@lfdr.de>; Fri, 11 Sep 2020 14:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbgIKMML (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 11 Sep 2020 08:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbgIKMKp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 11 Sep 2020 08:10:45 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC67C061786
        for <linux-bluetooth@vger.kernel.org>; Fri, 11 Sep 2020 05:09:50 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id 78so5960289pgf.5
        for <linux-bluetooth@vger.kernel.org>; Fri, 11 Sep 2020 05:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=Mx6dIe1hDH83C2Uvj8bO8v9+XJULtPHkuvI4kGsXlTU=;
        b=tQLDZxIy/tzQaswMkrU95LGQMuZ8szJIH57vivJhYO4bEJny3gbd8LssjMK/+pzPS2
         7REI1TMPjV/l9RKFISmXEdRwxVAEYiVTwsVVVXStN9bJ/49owkdwCGtRzn6n/av3jWxJ
         GFU4V9zYqV2QMNFO0XngR8/AqxMMRlrE/biuz9XkXFu+2kjBz3dRWDz5ZdOA5x4EfcJt
         2cDdCFbO6gthGCsxkgGhCBRLyGwVAKOFWsdqLhqfe3AMzluzJ/2tctKpmhDWL9W6Xawz
         +YLBTRqTQAm0O+N5WZNVcngaUjhsoLjaqGZpT7COYU++xnPS8IyjldI4A7BqTedY2zBB
         wBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Mx6dIe1hDH83C2Uvj8bO8v9+XJULtPHkuvI4kGsXlTU=;
        b=TfTBYIP4fMQFLBXrAanpmNh9GEPIq9cErceBOt8K6VYhg2SBz9na51Q1ASDevFhTwq
         jbYLFNOkbuLmcdHwfYT8CwQlTlw74gW1Dt9r2HXAcj9LD1sEjm+SgQ7P4CO8//mWKFX/
         uofCE0ykbbldh3RI46Q6qWaJyQM7oCgfCAjDjBuClCt3yIkxD7xmT9YfeDNda0fMPIdt
         s3IQ5ZMbdtnoEKSIvtH7xRBuSpIDgC1cEV4gTmEvvfdFSy35/0fxMDYT1s/7P3EOHmu5
         +2nosRbniJShjOWNy8vE1auxkncZU++VI5nPzoIxB+bzzNxh/BhkRsGpKf8wDlikyKHt
         1LyQ==
X-Gm-Message-State: AOAM532U2UfhYmpcNkrBx8+5qDXqYSuPzHrhR0/8C1w5OuXfxaqeBueq
        1hdm/YjUqy9zRp+UcqbNBbSR0kWWjv4SCIpIUVdzJ1lPVGS6WB3UFptaMIn1tRqEU91VWUF2YrY
        b3e4CFXjva4Es2QoLVdczqLqfFfRQdeeaBTixjFdPGUYCsXpKTaJuyB237J7C1FbGdOMOFZSqHy
        AnrQtKyRYS844=
X-Google-Smtp-Source: ABdhPJwsSBErXN5V6v8ghPcAuA7OgBD2dFzYFXgL1KyIUqAr0nAGiIn8UTis2ctbLNZAcEk+J3Hq2Mpa4avT6TqPTg==
X-Received: from howardchung-p920.tpe.corp.google.com ([2401:fa00:1:10:f693:9fff:fef4:4e45])
 (user=howardchung job=sendgmr) by 2002:a62:7a05:: with SMTP id
 v5mr1932342pfc.18.1599826190013; Fri, 11 Sep 2020 05:09:50 -0700 (PDT)
Date:   Fri, 11 Sep 2020 20:09:29 +0800
In-Reply-To: <20200911200839.BlueZ.v3.1.I8e067a74d324751fc788f53e0c14f60923683d01@changeid>
Message-Id: <20200911200839.BlueZ.v3.4.Ieffbe3452565ace2af46a63501c767c8798fd88c@changeid>
Mime-Version: 1.0
References: <20200911200839.BlueZ.v3.1.I8e067a74d324751fc788f53e0c14f60923683d01@changeid>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
Subject: [BlueZ PATCH v3 4/4] PRE-UPSTREAM: core: Add AdvertisementMonitor to bluetooth.conf
From:   Howard Chung <howardchung@google.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     mmandlik@chromium.org, mcchou@chromium.org,
        luiz.von.dentz@intel.com, alainm@chromium.org,
        Howard Chung <howardchung@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

AdvertisementMonitor must be included in bluetooth.conf in order to
be able to call Release

Reviewed-by: Miao-chen Chou <mcchou@chromium.org>
Reviewed-by: Manish Mandlik <mmandlik@chromium.org>
---

(no changes since v1)

 src/bluetooth.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/bluetooth.conf b/src/bluetooth.conf
index 8a1e25801..b6c614908 100644
--- a/src/bluetooth.conf
+++ b/src/bluetooth.conf
@@ -10,6 +10,7 @@
   <policy user="root">
     <allow own="org.bluez"/>
     <allow send_destination="org.bluez"/>
+    <allow send_interface="org.bluez.AdvertisementMonitor1"/>
     <allow send_interface="org.bluez.Agent1"/>
     <allow send_interface="org.bluez.MediaEndpoint1"/>
     <allow send_interface="org.bluez.MediaPlayer1"/>
-- 
2.28.0.618.gf4bc123cb7-goog

