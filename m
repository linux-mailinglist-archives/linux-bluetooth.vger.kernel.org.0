Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD572160D7
	for <lists+linux-bluetooth@lfdr.de>; Mon,  6 Jul 2020 23:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgGFVHc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 6 Jul 2020 17:07:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgGFVHb (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 6 Jul 2020 17:07:31 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22591C061755
        for <linux-bluetooth@vger.kernel.org>; Mon,  6 Jul 2020 14:07:31 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d194so15582942pga.13
        for <linux-bluetooth@vger.kernel.org>; Mon, 06 Jul 2020 14:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4duSpApL0OEcflw6oiG/5wMmEL4Cmw3V+9yHdG3N38U=;
        b=XmsAhP4DdWtK3W4olE1WbLyYpUKk11eaUe0dO82ItIsxpJc6PQBXfSrrS6MZtwHs8m
         f0CY9K+RlEEq+1dfZGK+JICWadd3cjgom7vPkIL5LYEdsgG4By9E0RAo/m1PIPDhCJyy
         Ykw5aSq0eA4CKCg5oSsRLxOMF9uQuVVOxb48M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4duSpApL0OEcflw6oiG/5wMmEL4Cmw3V+9yHdG3N38U=;
        b=tRaEccZblF2AMK2j0HUyW7fa3PHTexyNjoFwoR9ZbgRSMr6erYqKX0ttgjvDRJhpii
         bBWPn3vDPw0xJTLnaT2MD+ikprBiUtc681iIFKvaRV8C85bmKTdv4+/0ICeapLCAjH8G
         ph/xdr+bNR1BlcRK3Hdi9Mn3NdYv2h6eFQexEd7LCnCUcgUWYP6/87IIcou12900vWyS
         X0iG0CNK3gud4MQzAz023Wq7Z1K/MiyK0VhwtGEabqSBKbROXaGLyv4lubSGzcwYb0KP
         Ec74v04o6o2g8nN3Q1zJykq+ApQtLEpVRp+crinAQEfubfTH3Im8daQmL8OVMVb5oHfW
         R6qw==
X-Gm-Message-State: AOAM531kBYWjmpSuo2LWB7oWENoXqbg7zcvdQQ4ICueJps7UsnAJ/+EU
        KYJ5WQWE+lD+Opf7P67LSj64aA==
X-Google-Smtp-Source: ABdhPJwgdoH9pz5Y5wcjCE9hjkYwspxTSbpI/kAOsnuiwZnTwDYlG7ymZuFB6AffdVodou00H5Pizw==
X-Received: by 2002:a05:6a00:1511:: with SMTP id q17mr46701197pfu.16.1594069650636;
        Mon, 06 Jul 2020 14:07:30 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:7220:84ff:fe09:2b94])
        by smtp.gmail.com with ESMTPSA id j8sm21088609pfd.145.2020.07.06.14.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 14:07:30 -0700 (PDT)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     linux-pm@vger.kernel.org
Cc:     linux-bluetooth@vger.kernel.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        rafael.j.wysocki@intel.com, swboyd@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v2 1/1] power: Emit changed uevent on wakeup_sysfs_add/remove
Date:   Mon,  6 Jul 2020 14:07:17 -0700
Message-Id: <20200706140715.v2.1.I51f5a0be89595b73c4dc17e6cf4cc6f26dc7f2fc@changeid>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200706210717.1210639-1-abhishekpandit@chromium.org>
References: <20200706210717.1210639-1-abhishekpandit@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Udev rules that depend on the power/wakeup attribute don't get triggered
correctly if device_set_wakeup_capable is called after the device is
created. This can happen for several reasons (driver sets wakeup after
device is created, wakeup is changed on parent device, etc) and it seems
reasonable to emit a changed event when adding or removing attributes on
the device.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Changes in v2:
- Add newline at end of bt_dev_err

 drivers/base/power/sysfs.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/base/power/sysfs.c b/drivers/base/power/sysfs.c
index 24d25cf8ab1487..d57e8e7f175ebf 100644
--- a/drivers/base/power/sysfs.c
+++ b/drivers/base/power/sysfs.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* sysfs entries for device PM */
 #include <linux/device.h>
+#include <linux/kobject.h>
 #include <linux/string.h>
 #include <linux/export.h>
 #include <linux/pm_qos.h>
@@ -739,12 +740,30 @@ int dpm_sysfs_change_owner(struct device *dev, kuid_t kuid, kgid_t kgid)
 
 int wakeup_sysfs_add(struct device *dev)
 {
-	return sysfs_merge_group(&dev->kobj, &pm_wakeup_attr_group);
+	int ret = sysfs_merge_group(&dev->kobj, &pm_wakeup_attr_group);
+
+	if (!ret) {
+		int tmp = kobject_uevent(&dev->kobj, KOBJ_CHANGE);
+
+		if (tmp)
+			dev_err(dev,
+				"Error in uevent for wakeup_sysfs_add: %d\n",
+				tmp);
+	}
+
+	return ret;
 }
 
 void wakeup_sysfs_remove(struct device *dev)
 {
+	int tmp;
+
 	sysfs_unmerge_group(&dev->kobj, &pm_wakeup_attr_group);
+
+	tmp = kobject_uevent(&dev->kobj, KOBJ_CHANGE);
+	if (tmp)
+		dev_err(dev, "Error in uevent for wakeup_sysfs_remove: %d\n",
+			tmp);
 }
 
 int pm_qos_sysfs_add_resume_latency(struct device *dev)
-- 
2.27.0.212.ge8ba1cc988-goog

