Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95D5019B8EA
	for <lists+linux-bluetooth@lfdr.de>; Thu,  2 Apr 2020 01:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733044AbgDAX1h (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 1 Apr 2020 19:27:37 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:55076 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732503AbgDAX1g (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 1 Apr 2020 19:27:36 -0400
Received: by mail-pj1-f65.google.com with SMTP id np9so750550pjb.4
        for <linux-bluetooth@vger.kernel.org>; Wed, 01 Apr 2020 16:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rBCqZp8nDX0UUv/mWX3KcAj4GEG7Dnx/zXVYed48d9g=;
        b=V6vI2haK7o08b+BEXqPvbuLXkKasF4zxusCGaRlR8nKhHxrhr/Pnf38Kg5LMh5Eseg
         bHwL3HM9RdoMW1wfmHVl7v+Mwv0wNZ4Izcdd9oDhayuLk+UcR+lMfnv+VZgnMOjlGeus
         Gks/GdcSFRBcbG3rUG3UStwfnsAmu7M5oPUStXkyHBpQpw+kP5yVd3IMs0qS6ivbVumH
         3GSofXjivdP2ty/7e/wPTzqHUuEmm+N41u6+QZrOcxxv5T36VcpcspB5FDrL2425lcbK
         6cazFErBlHPHRpMBcDJFPxtm+ib067/xd+b7+hB8WV99nttXRoBok6wPk1ee+8UmaAY9
         sNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rBCqZp8nDX0UUv/mWX3KcAj4GEG7Dnx/zXVYed48d9g=;
        b=r8S9rkBFakmxEMmkPsNJgzek47HcfDRysw4Lr7XF1ZdZw1j/65pcxZCpicXyoh6feH
         cyWV/ffPsm+7j06Heu3b2+cmHGNE0xdyTPyGzrgKNrNWyYksOsUa2wPbLtzl9jqN+/Ae
         Z6RqsD/8W2TBfaqPncAAp8MawjAZpjjiNp7xhTcfslbqjA541XjXjs3rFH/LLBnsF97A
         6YmBHalIvvwUGd/6pTl9ui8UYqZMSeNZab9GfYT7/mvTyKAIbaoJKHHAQdlGdgwxXM8x
         3RaBcnBGjNqEa5DlUyTOfNxxy1s+iHLPuUxzYvB+OXDgyiaOmHJ62ctDcqr2S3T1KS8e
         hOEA==
X-Gm-Message-State: AGi0Pua1SKfunECIGlx0fS5wilVmlfWbodzzvB9WgrfDs7fvYCqGT4E/
        u4EDhHciFhoKvMo/YLpYxrZpLkVZR2w=
X-Google-Smtp-Source: APiQypIyAUPrSsB8Q4bZrVTl+LXabv75ULW47vPXpAONh5juSfy2PxQnuih8ZsPjDnvZuZqwMlY6IQ==
X-Received: by 2002:a17:90a:c08c:: with SMTP id o12mr509846pjs.27.1585783655086;
        Wed, 01 Apr 2020 16:27:35 -0700 (PDT)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id 185sm2348593pfz.119.2020.04.01.16.27.34
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 16:27:34 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ] gatt: Fix Acquire* reply handling
Date:   Wed,  1 Apr 2020 16:27:33 -0700
Message-Id: <20200401232733.10686-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Originally these operation did not set any owner_queue which caused
them to crash if the attribute is freed before the respose, to fix that
the reply will now check if owner_queue was reset to NULL which means
the attribute is no longer available but the owner_queue was never set
in the first place so this ensures they are now setup properly.
---
 src/gatt-database.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/src/gatt-database.c b/src/gatt-database.c
index 11d886c56..483c84341 100644
--- a/src/gatt-database.c
+++ b/src/gatt-database.c
@@ -2485,8 +2485,8 @@ static struct pending_op *acquire_write(struct external_chrc *chrc,
 {
 	struct pending_op *op;
 
-	op = pending_write_new(device, NULL, attrib, id, value, len, 0,
-						link_type, false, false);
+	op = pending_write_new(device, chrc->pending_writes, attrib, id, value,
+				len, 0, link_type, false, false);
 
 	if (g_dbus_proxy_method_call(chrc->proxy, "AcquireWrite",
 					acquire_write_setup,
@@ -2618,6 +2618,7 @@ static uint8_t ccc_write_cb(struct pending_op *op, void *user_data)
 	if (g_dbus_proxy_get_property(chrc->proxy, "NotifyAcquired", &iter)) {
 		op->data.iov_base = (void *) chrc;
 		op->data.iov_len = sizeof(chrc);
+		op->owner_queue = chrc->pending_writes;
 		if (g_dbus_proxy_method_call(chrc->proxy, "AcquireNotify",
 						acquire_notify_setup,
 						acquire_notify_reply,
-- 
2.21.1

