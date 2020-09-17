Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2E526E768
	for <lists+linux-bluetooth@lfdr.de>; Thu, 17 Sep 2020 23:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgIQV0z (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 17 Sep 2020 17:26:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726093AbgIQV0y (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 17 Sep 2020 17:26:54 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9480C06174A
        for <linux-bluetooth@vger.kernel.org>; Thu, 17 Sep 2020 14:26:54 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id f2so2125095pgd.3
        for <linux-bluetooth@vger.kernel.org>; Thu, 17 Sep 2020 14:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u+E1bUX0uVxPcQEsE71u1Ro0+1uBNDa00K7AzDVg6ww=;
        b=Ji12d2I+xIP9TkuKMxzY7lLdez/m917yxrVd+LOosDiPypATXUteVq2nu47hU6p96r
         z1Ev92MYfhGl5y9VZScViBFV0o3AgOSKVleifHo794bUupBP3Wt0/6AMGmMrT6N0r4wf
         ZT0JwVBzzQnmVLw9sQA7B8wGKX0rQHeLpu8z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u+E1bUX0uVxPcQEsE71u1Ro0+1uBNDa00K7AzDVg6ww=;
        b=GPu2TUClsO1IZ02MFEPm/aNCokERrcCFcAqiSXsZ/BEbRrfBNX27rlThHLjxfBpYkd
         37WGyV5yFWstLduLS6PqRNLHrLLh/D9652XHeBHKliYy9QsMqgGcL5b287vm34/4FAUY
         2gzyaYDix8cfEexJOZtx/s+tgUO2JQhD5IfL/PzcSNl1iikYtUadGeMteDSzeWXZIdpL
         U5igGryCRGgntxQaEyNxx7aCa5tUsLkQX3UkaP0fIEyoz1AMxWd+ct4j2IZhDMJt7e2C
         PaV4eQsgK0mDPBKr6Sr4FuWXKns/vY/VOmOZQkDD8BJhQcDp8ksrF1I1hxZEMrwaBdbc
         C5MQ==
X-Gm-Message-State: AOAM532jgMIselg6ueuEmfaY8WGbBgm29kjnrURttwQ+CuYDWuaB4akd
        Bx+7RXkOD7OqhxBjspizbFFkngw4271HJg==
X-Google-Smtp-Source: ABdhPJzYHT3fD29H0wEN9tNmxNBB7H7dyI88AQoN3ZBT0bxosOdGO8gcjWBfdL7uLDIWUVGN/i3HLg==
X-Received: by 2002:a63:4b63:: with SMTP id k35mr25002876pgl.235.1600378013897;
        Thu, 17 Sep 2020 14:26:53 -0700 (PDT)
Received: from mcchou0.mtv.corp.google.com ([2620:15c:202:201:de4a:3eff:fe75:1314])
        by smtp.gmail.com with ESMTPSA id y3sm645308pfb.18.2020.09.17.14.26.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2020 14:26:53 -0700 (PDT)
From:   Miao-chen Chou <mcchou@chromium.org>
To:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>
Cc:     Manish Mandlik <mmandlik@chromium.org>,
        Alain Michaud <alainm@chromium.org>,
        chromeos-bluetooth-upstreaming@chromium.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Howard Chung <howardchung@google.com>,
        Miao-chen Chou <mcchou@chromium.org>
Subject: [BlueZ PATCH v4 5/8] adapter: Clear all Adv monitors upon bring-up
Date:   Thu, 17 Sep 2020 14:25:37 -0700
Message-Id: <20200917142456.BlueZ.v4.5.Id6bfe7838831ae01fddc8605689dd77b51673960@changeid>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917142456.BlueZ.v4.1.I2830b9c1212a64b062201ed9f2b71294f50ad22d@changeid>
References: <20200917142456.BlueZ.v4.1.I2830b9c1212a64b062201ed9f2b71294f50ad22d@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This clears all Adv monitors upon daemon bring-up by issuing
MGMT_OP_REMOVE_ADV_MONITOR command with monitor_handle 0.

The following test was performed:
- Add an Adv Monitor using btmgmt, restart bluetoothd and observe the
monitor got removed.

Reviewed-by: Alain Michaud <alainm@chromium.org>
Reviewed-by: Manish Mandlik <mmandlik@chromium.org>
Reviewed-by: Howard Chung <howardchung@google.com>
---

(no changes since v1)

 src/adapter.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/src/adapter.c b/src/adapter.c
index d33ce7124..191467048 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -9513,6 +9513,43 @@ failed:
 	btd_adapter_unref(adapter);
 }
 
+static void reset_adv_monitors_complete(uint8_t status, uint16_t length,
+					const void *param, void *user_data)
+{
+	struct mgmt_rp_remove_adv_monitor *rp = param;
+
+	if (status != MGMT_STATUS_SUCCESS) {
+		error("Failed to reset Adv Monitors: %s (0x%02x)",
+			mgmt_errstr(status), status);
+		return;
+	}
+
+	if (length < sizeof(*rp)) {
+		error("Wrong size of remove Adv Monitor response for reset "
+			"all Adv Monitors");
+		return;
+	}
+
+	DBG("Removed all Adv Monitors");
+}
+
+static void reset_adv_monitors(uint16_t index)
+{
+	struct mgmt_cp_remove_adv_monitor cp;
+
+	DBG("sending remove Adv Monitor command with handle 0");
+
+	/* Handle 0 indicates to remove all */
+	cp.monitor_handle = 0;
+	if (mgmt_send(mgmt_master, MGMT_OP_REMOVE_ADV_MONITOR, index,
+			sizeof(cp), &cp, reset_adv_monitors_complete, NULL,
+			NULL) > 0) {
+		return;
+	}
+
+	error("Failed to reset Adv Monitors");
+}
+
 static void index_added(uint16_t index, uint16_t length, const void *param,
 							void *user_data)
 {
@@ -9527,6 +9564,8 @@ static void index_added(uint16_t index, uint16_t length, const void *param,
 		return;
 	}
 
+	reset_adv_monitors(index);
+
 	adapter = btd_adapter_new(index);
 	if (!adapter) {
 		btd_error(index,
-- 
2.26.2

