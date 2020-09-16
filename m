Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DAB226CECB
	for <lists+linux-bluetooth@lfdr.de>; Thu, 17 Sep 2020 00:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgIPWfM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 16 Sep 2020 18:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgIPWfK (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 16 Sep 2020 18:35:10 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9BBBC06174A
        for <linux-bluetooth@vger.kernel.org>; Wed, 16 Sep 2020 15:35:05 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id w7so4854413pfi.4
        for <linux-bluetooth@vger.kernel.org>; Wed, 16 Sep 2020 15:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z4BsBm4/JaybyWDiNEa/bs5RXulRrirwodkdVtO+qdI=;
        b=XqxtSK1rf9GqTXNLezWlbuk12soFDktvIyV8otXHyvVqzOmtklfCcTA0lcncgqylZx
         kx9lGP3OtWm9TLVlNKgXTSg7qdkwebNzUKqb2Fu4pnthQTCOY7TBf+qQwrP33xNYuHV/
         Sf1q19C+RtZo4LkvBVkixXws22lUEizKi7pjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z4BsBm4/JaybyWDiNEa/bs5RXulRrirwodkdVtO+qdI=;
        b=IGYxOyIHVWZtOP6icu2YLvdUJdogQR0DpbUI/V/kxi6DGjy6Vcdlp5/tutxfpI1F8W
         WOO+taxR+8H3oJL23z4ggZy5mbrpU0P103fguzTP+WS5o84YNjA/fBuBHMD7TAt6tYv3
         JZHxgGYwx/TfckUxPblc4tjxS2mirWqeay4eLiu7XZXopNpLR+deOB4XMYSDhievzS4f
         SOQbp5DRFx5pblibXV8IapZxjWA4tF++rw25bh19t0viKyMz8nrivcoGg2223GyZ6B0Z
         dHGtA1H/vZL7MeKvSKPvQ+F+enBv4sgurRpw2vhmQYttequXTV8FNnYoja2DWgz/hJy1
         dSUw==
X-Gm-Message-State: AOAM532ch1TkBkX7iCBGlTFRY41iDKG1qeJvdu2czy7Df7/0KO+3aHHq
        OR8fRbneZrE9Uu7c211rARq+xx9wUTtC0Q==
X-Google-Smtp-Source: ABdhPJzpNUtm/OPWyWRWcP/DdaN79qAcO2K4cLzAmN0w+AXcEAhfTQCjClZXn0HXumcqq46fdcRhyQ==
X-Received: by 2002:a62:1850:0:b029:142:2501:35e8 with SMTP id 77-20020a6218500000b0290142250135e8mr7991711pfy.72.1600295704821;
        Wed, 16 Sep 2020 15:35:04 -0700 (PDT)
Received: from sonnysasaka-chrome.mtv.corp.google.com ([2620:15c:202:201:4a0f:cfff:fe66:e60c])
        by smtp.gmail.com with ESMTPSA id e27sm17945805pfj.62.2020.09.16.15.35.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 15:35:03 -0700 (PDT)
From:   Sonny Sasaka <sonnysasaka@chromium.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Miao-chen Chou <mcchou@chromium.org>,
        Yoni Shavit <yshavit@chromium.org>,
        Alain Michaud <alainm@chromium.org>
Subject: [PATCH BlueZ v2] sixaxis: Fix crash caused by return of udev_device_get_property_value
Date:   Wed, 16 Sep 2020 15:34:53 -0700
Message-Id: <20200916223453.22537-1-sonnysasaka@chromium.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Miao-chen Chou <mcchou@chromium.org>

This adds a NULL check before calling sscanf().

Reviewed-by: Yoni Shavit <yshavit@chromium.org>
Reviewed-by: Alain Michaud <alainm@chromium.org>

---
 plugins/sixaxis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/plugins/sixaxis.c b/plugins/sixaxis.c
index 939fed759..996f85dd6 100644
--- a/plugins/sixaxis.c
+++ b/plugins/sixaxis.c
@@ -411,7 +411,7 @@ get_pairing_type_for_device(struct udev_device *udevice, uint16_t *bus,
 
 	hid_id = udev_device_get_property_value(hid_parent, "HID_ID");
 
-	if (sscanf(hid_id, "%hx:%hx:%hx", bus, &vid, &pid) != 3)
+	if (!hid_id || sscanf(hid_id, "%hx:%hx:%hx", bus, &vid, &pid) != 3)
 		return NULL;
 
 	cp = get_pairing(vid, pid);
-- 
2.26.2

