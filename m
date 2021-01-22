Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC0A2FF94A
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 Jan 2021 01:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbhAVAO6 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 21 Jan 2021 19:14:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbhAVAOo (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 21 Jan 2021 19:14:44 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCA5C061756
        for <linux-bluetooth@vger.kernel.org>; Thu, 21 Jan 2021 16:14:04 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id u11so2213372plg.13
        for <linux-bluetooth@vger.kernel.org>; Thu, 21 Jan 2021 16:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aTK20JXNui2K+RAm+4b/YyNZYouO/7e0ncNZ2MlMaX0=;
        b=RBDedLT8uNz/UeL20Jf8KcnnI47Zhi1rdjNtGPPFDUT/eXxRnwH8oVlZPwgE8Yh5Re
         KZkOIhNzDD+8bM1K6OELfy0wg0UmJRugJbECS9NZTBqU5ALNgJjqs1tPft7mht3CmfaF
         lSEhZvuqy/dOY9jY93/CiOs0KUUyCNVGoMwJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aTK20JXNui2K+RAm+4b/YyNZYouO/7e0ncNZ2MlMaX0=;
        b=rEiILZUfrKUBmOtCkgPLFEZZSYozqybjcL4WgGz5NfiC1BGrjUNBznvY2tlZkUsbs3
         oU5XF5SZTvQpMFBCTfWYVTdvTWviAdzHAEpTiM8TAAaEzD1Nn52ZDMMPdQXQLLpl14kX
         /4sqlX9NQsLULMyo49+3y4NjNEhsa6dB4kQHCm6NWHz+7vskdcCQzTeaRPr6exdlLoS7
         jeqbC9KhmzymaraMTR1XVo9N4/S5oLshhNVAAuhChxsyJN8UAmbsi7JWa2q1AyOrjFkW
         MYJyKkTspyQrjeXF93Pdlma+4ISF7FoEGddePw7fR/JXGXrskHcIuTyLM7eEqdgoL4Ih
         eaCA==
X-Gm-Message-State: AOAM5322FRNRy36PJMGMNnH7ZNQYYuVx8Ou7PjHOOj78xzrbqsCdT4SW
        WYzURc/30+P0jHlwCa0mm0Ylg2Z8/dqaGQ==
X-Google-Smtp-Source: ABdhPJyrn2Gg7o+kJfDmq8HanyNHQAECgM0PHSXzo22x7WXqs97Z5yR/LAiewLDWBQdk42PX1++fFA==
X-Received: by 2002:a17:902:9a86:b029:dc:104:1902 with SMTP id w6-20020a1709029a86b02900dc01041902mr2344622plp.50.1611274444044;
        Thu, 21 Jan 2021 16:14:04 -0800 (PST)
Received: from sonnysasaka-chrome.mtv.corp.google.com ([2620:15c:202:201:4a0f:cfff:fe66:e60c])
        by smtp.gmail.com with ESMTPSA id b13sm6941900pfi.162.2021.01.21.16.14.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Jan 2021 16:14:03 -0800 (PST)
From:   Sonny Sasaka <sonnysasaka@chromium.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Sonny Sasaka <sonnysasaka@chromium.org>
Subject: [PATCH BlueZ v2 2/2] input/hog: Do not create UHID if report map is broken
Date:   Thu, 21 Jan 2021 16:13:26 -0800
Message-Id: <20210122001326.14263-2-sonnysasaka@chromium.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122001326.14263-1-sonnysasaka@chromium.org>
References: <20210122001326.14263-1-sonnysasaka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The report map in the cache could be dirty, for example when reading a
report map from peer was cancelled, we should be able to detect it and
not try to create UHID. Instead we will read it again from the peer.

---
 profiles/input/hog-lib.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/profiles/input/hog-lib.c b/profiles/input/hog-lib.c
index 089f42826..d6a3bda4d 100644
--- a/profiles/input/hog-lib.c
+++ b/profiles/input/hog-lib.c
@@ -946,7 +946,7 @@ static void uhid_create(struct bt_hog *hog, uint8_t *report_map,
 	struct uhid_event ev;
 	ssize_t vlen = report_map_len;
 	char itemstr[20]; /* 5x3 (data) + 4 (continuation) + 1 (null) */
-	int i, err;
+	int i, err, collection_depth = 0;
 	GError *gerr = NULL;
 
 	DBG("Report MAP:");
@@ -960,6 +960,14 @@ static void uhid_create(struct bt_hog *hog, uint8_t *report_map,
 			if (!long_item && (value[i] & 0xfc) == 0x84)
 				hog->has_report_id = TRUE;
 
+			// Start Collection
+			if (value[i] == 0xa1)
+				collection_depth++;
+
+			// End Collection
+			if (value[i] == 0xc0)
+				collection_depth--;
+
 			DBG("\t%s", item2string(itemstr, &value[i], ilen));
 
 			i += ilen;
@@ -968,10 +976,15 @@ static void uhid_create(struct bt_hog *hog, uint8_t *report_map,
 
 			/* Just print remaining items at once and break */
 			DBG("\t%s", item2string(itemstr, &value[i], vlen - i));
-			break;
+			return;
 		}
 	}
 
+	if (collection_depth != 0) {
+		error("Report Map error: unbalanced collection");
+		return;
+	}
+
 	/* create uHID device */
 	memset(&ev, 0, sizeof(ev));
 	ev.type = UHID_CREATE;
@@ -1365,7 +1378,9 @@ static void foreach_hog_chrc(struct gatt_db_attribute *attr, void *user_data)
 			 * UHID to optimize reconnection.
 			 */
 			uhid_create(hog, report_map.value, report_map.length);
-		} else {
+		}
+
+		if (!hog->uhid_created) {
 			read_char(hog, hog->attrib, value_handle,
 						report_map_read_cb, hog);
 		}
-- 
2.29.2

