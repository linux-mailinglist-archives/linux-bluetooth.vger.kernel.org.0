Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D93C61C1801
	for <lists+linux-bluetooth@lfdr.de>; Fri,  1 May 2020 16:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729103AbgEAOkp (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 1 May 2020 10:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728724AbgEAOkp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 1 May 2020 10:40:45 -0400
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC556C061A0C
        for <linux-bluetooth@vger.kernel.org>; Fri,  1 May 2020 07:40:44 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id g129so2724136vkh.9
        for <linux-bluetooth@vger.kernel.org>; Fri, 01 May 2020 07:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oPvOim4abxc9tGnVEeXShFyfbNgyjnLblwfKsUAt/Yo=;
        b=mOuaHTJj1GgAh9cbsPrsUIm230pjZ0+/T0qM1nEibgxDO8JUvHEvye7VHcn8J45yyT
         nd8PD8Y1Gxc/jRqo0egS4y/wLRmF3bk+EhhA6VR0yse92/f5/riPLBCQK2H1hMjkjCuR
         VnkGf+nw0qiz0i0WICrMF/bmkUGxMmAT9DO74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oPvOim4abxc9tGnVEeXShFyfbNgyjnLblwfKsUAt/Yo=;
        b=chkuiSbWPqf4ixhu75wYGj+w1uF31NaF7MnTHeWLZwXeXIVFXw9sfkjw0puieuigMa
         9yaW2Wh/6qI9axTmK0z165JFOu/+9zSqZ8E8S00Xhe3gtAjaapyK/AnQhLNwfuQumvGB
         T1tnkf/rv+75NpuVZNwLNM2yyX9OK3o52qDTHNCOB2kvOylOxCKxIgamBhdGMZph9ef5
         sA+aZKXrdVaIh1uscLULV3W5ivAyVtpX/nxN2pGz9FVABOFsdNX49hnsvmD31wPY9YOx
         MOI7/7Yxm6GcclgzDJcuT40xy25EkxxhuQ49UQxrGIxR+FiS3XAsiUPokIEaH/FL85pB
         sQMQ==
X-Gm-Message-State: AGi0PubH6gK3pN4z1/6uG74m20r14b2lYDD3az4wM3viqp1VQoFopAiG
        VDPR89mKL9+MLBVR4VYONUS3Ukivrys=
X-Google-Smtp-Source: APiQypK1Y4nCZhJYs1/tPxbMDLOSWgldEyGJX0x08UJGAd/GTcvAzt6uZojeAm5kMDrDL1kbOpTiCw==
X-Received: by 2002:a1f:dac5:: with SMTP id r188mr2961648vkg.5.1588344043593;
        Fri, 01 May 2020 07:40:43 -0700 (PDT)
Received: from alain.c.googlers.com.com (161.138.243.35.bc.googleusercontent.com. [35.243.138.161])
        by smtp.gmail.com with ESMTPSA id v3sm860654vka.45.2020.05.01.07.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 07:40:43 -0700 (PDT)
From:   Alain Michaud <alainm@chromium.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Alain Michaud <alainm@chromium.org>
Subject: [BlueZ PATCH v1] shared/gatt-client:Ignore orphaned characteristics
Date:   Fri,  1 May 2020 14:40:37 +0000
Message-Id: <20200501144037.1684-1-alainm@chromium.org>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The gatt discovery proceedure simplification to discover all
characteristics at once has exposed a device side issue where some
device implementation reports orphaned characteristics.  While this
technically shouldn't be allowed, some instances of this were observed
(namely on some Android phones).

The fix is to simply skip over orphaned characteristics and continue
with everything else that is valid.

This has been tested as part of the Android CTS tests against an
affected platform and was confirmed to have worked around the issue.
---

 src/shared/gatt-client.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/shared/gatt-client.c b/src/shared/gatt-client.c
index 963ad619f..d604c77a3 100644
--- a/src/shared/gatt-client.c
+++ b/src/shared/gatt-client.c
@@ -632,7 +632,10 @@ static bool discover_descs(struct discovery_op *op, bool *discovering)
 			util_debug(client->debug_callback, client->debug_data,
 				"Failed to insert characteristic at 0x%04x",
 				chrc_data->value_handle);
-			goto failed;
+
+			/* Skip over invalid characteristic */
+			free(chrc_data);
+			continue;
 		}
 
 		if (gatt_db_attribute_get_handle(attr) !=
-- 
2.26.2.526.g744177e7f7-goog

