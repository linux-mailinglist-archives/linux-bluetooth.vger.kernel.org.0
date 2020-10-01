Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2E06280ADE
	for <lists+linux-bluetooth@lfdr.de>; Fri,  2 Oct 2020 01:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387436AbgJAXES (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 1 Oct 2020 19:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733233AbgJAXEM (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 1 Oct 2020 19:04:12 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF868C0613D0
        for <linux-bluetooth@vger.kernel.org>; Thu,  1 Oct 2020 16:04:10 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id u35so523247ybd.13
        for <linux-bluetooth@vger.kernel.org>; Thu, 01 Oct 2020 16:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=hvILWQxB3TwRcPBpncrYp0H71P0VFsr065oJCLdsVjA=;
        b=I7eNU7YL/FdU036qIcfEENrPxS2eiy4mD8lDH5mI4rfIR0M/wAzXW6SGv4ZQ1xFV0L
         vykuRLIy5CyT9zmr/zi/jiDHvxrolJRjSOpyq+X5dL4yCXglRV0nUbfnJhFaCvVm0YPK
         F1GPuVcGZEzikirjrHVGWnWVRLGcyav2yJl0M5bsSmtywJf8CUC5rxtnYjLxy1zo8hzN
         krIkyZamxOVkZviq+JGiluUBO4FMNvirlMbQLM8/AKf/8/unJkgcj9ehE7S6GkU/3t+z
         pmK4k8Z8LEwyEj98WeIQBbN57aZYTSrqR5LUek0LBNAX/j76gK+Xaz2PneSnsO9+c4Qr
         X28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=hvILWQxB3TwRcPBpncrYp0H71P0VFsr065oJCLdsVjA=;
        b=PsjVKMz1bze+nvzh1/77c1c5xjvsUQrmx0Lnj6KNGT4fueJtNVpbQiNeD2RuBLZwAD
         s5CKjbzFeExYF21tmi+U3Os8/UhqUVDOl4Nus5Sze8gqKEcNp0KSKPJw1mLf1fMrJi6E
         WU9osqdi94vhOaHWQYTMJ6FvY/RUMLmfVkTwtWmD/brZIlODdp4NpQvNlO9yrRZH7oaq
         8Eh0FLhjJBHhMr8ze63+3wecLr2dQlK9denG1gCcMZhZQIDqSAhQP5GhN3llfYtUo2dK
         krSKh65CN/k4SDWhZBWziNqy95VszphbYXm1lMdPWfpky2UMoBBipv/3NZheyAIxCtBM
         9zlg==
X-Gm-Message-State: AOAM532gV4eZADFT2AcEgQpcI7K2Xq/b7JSBetrHfm/RNCqN2ldTU5zK
        aN3Wy/zYpnAno60+wsUsv1AnrLwHueK2cYm0IIse
X-Google-Smtp-Source: ABdhPJwGyLhPvbj95Q6LhW6QICHshVpACO0Zm/35uidkeHKzFyyJDa7eMpYWuBJBdtYQ8HT3qUXD4QE486VSbPhZWxRT
Sender: "danielwinkler via sendgmr" 
        <danielwinkler@danielwinkler-linux.mtv.corp.google.com>
X-Received: from danielwinkler-linux.mtv.corp.google.com ([2620:15c:202:201:f693:9fff:fef4:4e59])
 (user=danielwinkler job=sendgmr) by 2002:a25:6887:: with SMTP id
 d129mr14417906ybc.434.1601593449952; Thu, 01 Oct 2020 16:04:09 -0700 (PDT)
Date:   Thu,  1 Oct 2020 16:03:59 -0700
In-Reply-To: <20201001230403.2445035-1-danielwinkler@google.com>
Message-Id: <20201001160305.v4.1.I5f4fa6a76fe81f977f78f06b7e68ff1c76c6bddf@changeid>
Mime-Version: 1.0
References: <20201001230403.2445035-1-danielwinkler@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v4 1/5] Bluetooth: Add helper to set adv data
From:   Daniel Winkler <danielwinkler@google.com>
To:     marcel@holtmann.org
Cc:     linux-bluetooth@vger.kernel.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        Daniel Winkler <danielwinkler@google.com>,
        Sonny Sasaka <sonnysasaka@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

We wish to handle advertising data separately from advertising
parameters in our new MGMT requests. This change adds a helper that
allows the advertising data and scan response to be updated for an
existing advertising instance.

Reviewed-by: Sonny Sasaka <sonnysasaka@chromium.org>
Signed-off-by: Daniel Winkler <danielwinkler@google.com>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 include/net/bluetooth/hci_core.h |  3 +++
 net/bluetooth/hci_core.c         | 31 +++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 9873e1c8cd163b..300b3572d479e1 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -1291,6 +1291,9 @@ int hci_add_adv_instance(struct hci_dev *hdev, u8 instance, u32 flags,
 			 u16 adv_data_len, u8 *adv_data,
 			 u16 scan_rsp_len, u8 *scan_rsp_data,
 			 u16 timeout, u16 duration);
+int hci_set_adv_instance_data(struct hci_dev *hdev, u8 instance,
+			 u16 adv_data_len, u8 *adv_data,
+			 u16 scan_rsp_len, u8 *scan_rsp_data);
 int hci_remove_adv_instance(struct hci_dev *hdev, u8 instance);
 void hci_adv_instances_set_rpa_expired(struct hci_dev *hdev, bool rpa_expired);
 
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 8a2645a8330137..3f73f147826409 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3005,6 +3005,37 @@ int hci_add_adv_instance(struct hci_dev *hdev, u8 instance, u32 flags,
 	return 0;
 }
 
+/* This function requires the caller holds hdev->lock */
+int hci_set_adv_instance_data(struct hci_dev *hdev, u8 instance,
+			      u16 adv_data_len, u8 *adv_data,
+			      u16 scan_rsp_len, u8 *scan_rsp_data)
+{
+	struct adv_info *adv_instance;
+
+	adv_instance = hci_find_adv_instance(hdev, instance);
+
+	/* If advertisement doesn't exist, we can't modify its data */
+	if (!adv_instance)
+		return -ENOENT;
+
+	if (adv_data_len) {
+		memset(adv_instance->adv_data, 0,
+		       sizeof(adv_instance->adv_data));
+		memcpy(adv_instance->adv_data, adv_data, adv_data_len);
+		adv_instance->adv_data_len = adv_data_len;
+	}
+
+	if (scan_rsp_len) {
+		memset(adv_instance->scan_rsp_data, 0,
+		       sizeof(adv_instance->scan_rsp_data));
+		memcpy(adv_instance->scan_rsp_data,
+		       scan_rsp_data, scan_rsp_len);
+		adv_instance->scan_rsp_len = scan_rsp_len;
+	}
+
+	return 0;
+}
+
 /* This function requires the caller holds hdev->lock */
 void hci_adv_monitors_clear(struct hci_dev *hdev)
 {
-- 
2.28.0.709.gb0816b6eb0-goog

