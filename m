Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0E4A2E10C6
	for <lists+linux-bluetooth@lfdr.de>; Wed, 23 Dec 2020 01:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgLWA1a (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 22 Dec 2020 19:27:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgLWA1a (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 22 Dec 2020 19:27:30 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5162FC0613D3
        for <linux-bluetooth@vger.kernel.org>; Tue, 22 Dec 2020 16:26:50 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id 11so9382824pfu.4
        for <linux-bluetooth@vger.kernel.org>; Tue, 22 Dec 2020 16:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WhaJfM0GPYUTenVkreTx0tBcGxFFAiF25O5tAuWQsQU=;
        b=SdmY1tJPlN/ofE50370H3+X/nFeKxw62qKNyktex4cPIjQ/5QM1y7EfxK+WTINlRG/
         LwM1n8ZSqPSYo2cq0g9yozXbQuWDecWFkRcQWAL2TfsrqLIgz0gluUkUVkoVNFO0GmoM
         vQZzIE/PRkjB0nCpqonNvpsBAVhe+EtHgic5VFjlL2OCTdrIgZi9+r/br0ht5OjCszlt
         dmeh2ckr4xBGGFEvW+inx5IUCHAbYJVGxuN52wqWVWquEM6EBniRsjVv88N5dSKqX+me
         SYP3yYsVdqhhbKeH39On/W8moM9ovDmluHM0wZBLGdZZnzo73OyzJGJSjG0GVKXvOiOI
         cIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WhaJfM0GPYUTenVkreTx0tBcGxFFAiF25O5tAuWQsQU=;
        b=XjUUEtn/NMuaK86Hu3LkGeyfEfrBwmy2SpFO0TAkaCQJEKHpW5J68pElDeSq1lzTYT
         uaJ/srkzYLnXyj/X1SuxonUxYEb5CFDT6PjQ6hWXiizMwnruKmpaLOX9jraqI+dZI/wc
         zzKqW8psxUZUDBSGXDQaFUVWylyTwuKm0ihVR7mFm84a+FU5pwI+GcmY1HlO/39Akz8N
         b2qutXCAbDUt6BW3+KELJYG2i8VejI/PI1Q/yalWCPdAwAj8nRYnp0Ff8CMiuQXahBxD
         Y0k2kC8LGPLkKPudnWl5gRuH0ktmxSLfNadE0nJx3ith9byS8sfuUAmX7z9h2/LOu2hx
         Ue2g==
X-Gm-Message-State: AOAM532BHYd+l3XQz/HRzY8VRvkWsWXlLvLdjDMgm9XsNft82s2tNcfT
        l3PuUTZ4/kMuFfR7EvXeebUj/JNsF2E=
X-Google-Smtp-Source: ABdhPJyJbN2AlCMCvtEkV+yMithIu5RZYt40pjxhscJUOR6SFf7NWva0itv0SKi3ypANGrOwoGesHg==
X-Received: by 2002:a63:dc44:: with SMTP id f4mr22067642pgj.281.1608683209758;
        Tue, 22 Dec 2020 16:26:49 -0800 (PST)
Received: from localhost.localdomain (c-73-164-224-32.hsd1.or.comcast.net. [73.164.224.32])
        by smtp.gmail.com with ESMTPSA id 8sm5505566pfz.93.2020.12.22.16.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 16:26:48 -0800 (PST)
From:   Tedd Ho-Jeong An <hj.tedd.an@gmail.com>
X-Google-Original-From: Tedd Ho-Jeong An <tedd.an@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     danielwinkler@google.com, tedd.an@intel.com
Subject: [PATCH 1/3] tools/mgmt-tester: Update sample data for adv features
Date:   Tue, 22 Dec 2020 16:26:31 -0800
Message-Id: <20201223002633.187612-1-tedd.an@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch updates the expected sample data for advertising feature to
include the changes for tx power.
---
 tools/mgmt-tester.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/mgmt-tester.c b/tools/mgmt-tester.c
index bef506134..d9d7b3430 100644
--- a/tools/mgmt-tester.c
+++ b/tools/mgmt-tester.c
@@ -4162,7 +4162,7 @@ static const struct generic_data read_adv_features_invalid_index_test = {
 };
 
 static const uint8_t read_adv_features_rsp_1[] =  {
-	0x7f, 0x00, 0x00, 0x00,	/* supported flags */
+	0x7f, 0xf0, 0x00, 0x00,	/* supported flags */
 	0x1f,			/* max_adv_data_len */
 	0x1f,			/* max_scan_rsp_len */
 	0x05,			/* max_instances */
@@ -4177,7 +4177,7 @@ static const struct generic_data read_adv_features_success_1 = {
 };
 
 static const uint8_t read_adv_features_rsp_2[] =  {
-	0x7f, 0x00, 0x00, 0x00,	/* supported flags */
+	0x7f, 0xf0, 0x00, 0x00,	/* supported flags */
 	0x1f,			/* max_adv_data_len */
 	0x1f,			/* max_scan_rsp_len */
 	0x05,			/* max_instances */
@@ -7137,7 +7137,7 @@ static const struct generic_data set_appearance_success = {
 };
 
 static const uint8_t read_adv_features_rsp_3[] =  {
-	0xff, 0x0f, 0x00, 0x00,	/* supported flags */
+	0xff, 0xff, 0x00, 0x00,	/* supported flags */
 	0x1f,			/* max_adv_data_len */
 	0x1f,			/* max_scan_rsp_len */
 	0x01,			/* max_instances */
-- 
2.25.1

