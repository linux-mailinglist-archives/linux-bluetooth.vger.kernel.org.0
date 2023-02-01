Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1DBC67BDD2
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Jan 2023 22:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236120AbjAYVMm (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 25 Jan 2023 16:12:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236301AbjAYVMc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 25 Jan 2023 16:12:32 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C61435C0D4
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 Jan 2023 13:12:18 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id k15-20020a5b0a0f000000b007eba3f8e3baso20865013ybq.4
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 Jan 2023 13:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mjUP68ZzzFyh8hG9RPeRlc5xrTMio/O97kr7jaJq5/0=;
        b=bZKAmtw+epp2hdpRq2aYZvzRqfJc+Q6/JLBQqH5S+RddlZ7/gEumJ8QBuUtH4JWCly
         j7q66n+q3gB/gV8f/YYIHMDdCMOwWhy+uzwQtvA/D61T0UT1V0/8briK5e8ZSyVk9mAq
         59XvAqGaezM4lbTaFzWrDGZIMwNbymCD559QZxaOngdKp1+Ve6S35nnMjPrWPEuM8mkv
         ipDr0Yg39ysUTCH6HQ/gFQfaGx9E+Nsl3gUQYX1hdhyHPC14SwlYYLynR6SU91texQ0c
         skYI1gNfNvokuscJm7PhDqmEn8trMNm6HJi7YaGhBxfK3BDztlX1jjguaQxvsshZ/wsm
         CxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mjUP68ZzzFyh8hG9RPeRlc5xrTMio/O97kr7jaJq5/0=;
        b=3l9fX+Kn6GR9Xhbp79IR5BRRLpS4KJnMjyJ+4GiQH0Hj/uM10FCDxQNrT6N+Af43Rh
         7mQST6ISxUbD0J/WrE8P+a28CqCcLi6EgNIxu9cquGoa0p2XZsKoqp2nlHbdZwTtgpW0
         wWGnU4udq3Qu26sV+BVfnvLMh90ZSd/IcPwxgr5Bw/mt0dxsr/+vqLstVp5YIHAeoEMG
         6Xl5v37qU20Htl47i6D+h+34ZaTl23XcINfn/ODri6vQAH27CRXqBvWmJV3VwBvjoaaS
         bOFGG7PfAIh9vWEUukJvpJB/3W+ULdGodVw9HfIgSuWc9JozELRDeBwoy3DY+4gcERjk
         XlUQ==
X-Gm-Message-State: AO0yUKXRVbgkmIXr/U36bbya/Ns5m8HNVFdz7e0Ewc6dt6R+TCCQwZnS
        s1lSebji7CeF10WtIjVjxuyixPau1ZJaPqR6MsloxVLetAyAMonkzF48Bq1J5qg2GijFqLMfbaG
        g7ZFCgl3ZFrZbxTiZQ9HayB6Qj81cmkOk+C3+078YRIgjfDnOFNXo/Cpoq83cYXEFQroaOAaj0x
        7Y
X-Google-Smtp-Source: AK7set/jBOwnX0/QoX7ixwv9e2pNPa64RC5YCboTV73zgRZKUW3KNBAU33alOxNSlCaoaeo/b2tuD9s294fU
X-Received: from jiangzp-glinux-dev.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4c52])
 (user=jiangzp job=sendgmr) by 2002:a0d:d6c7:0:b0:506:3481:ced0 with SMTP id
 y190-20020a0dd6c7000000b005063481ced0mr1197728ywd.396.1674681137911; Wed, 25
 Jan 2023 13:12:17 -0800 (PST)
Date:   Wed, 25 Jan 2023 13:12:10 -0800
In-Reply-To: <20230125211210.552679-1-jiangzp@google.com>
Mime-Version: 1.0
References: <20230125211210.552679-1-jiangzp@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230125131159.kernel.v1.1.Id80089feef7af8846cc6f8182eddc5d7a0ac4ea7@changeid>
Subject: [kernel PATCH v1 1/1] Bluetooth: Don't send HCI commands to remove
 adv if adapter is off
From:   Zhengping Jiang <jiangzp@google.com>
To:     linux-bluetooth@vger.kernel.org, marcel@holtmann.org,
        luiz.dentz@gmail.com
Cc:     chromeos-bluetooth-upstreaming@chromium.org,
        Archie Pusaka <apusaka@chromium.org>,
        Zhengping Jiang <jiangzp@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Archie Pusaka <apusaka@chromium.org>

Mark the advertisement as disabled when powering off the adapter
without removing the advertisement, so they can be correctly
re-enabled when adapter is powered on again.

When adapter is off and user requested to remove advertisement,
a HCI command will be issued. This causes the command to timeout
and trigger GPIO reset.

Therefore, immediately remove the advertisement without sending
any HCI commands.

Note that the above scenario only happens with extended advertisement
(i.e. not using software rotation), because on the SW rotation
scenario, we just wait until the rotation timer runs out before
sending the HCI command. Since the timer is inactive when adapter is
off, no HCI commands are sent.

Signed-off-by: Archie Pusaka <apusaka@chromium.org>
Signed-off-by: Zhengping Jiang <jiangzp@google.com>

---

Changes in v1:
- Mark the advertisement as disabled instead of clearing it.
- Remove the advertisement without sending HCI command if the adapter is off.

 net/bluetooth/hci_sync.c | 57 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 117eedb6f709..08da68a30acc 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -1591,6 +1591,16 @@ int hci_remove_ext_adv_instance_sync(struct hci_dev *hdev, u8 instance,
 	if (!ext_adv_capable(hdev))
 		return 0;
 
+	/* When adapter is off, remove adv without sending HCI commands */
+	if (!hdev_is_powered(hdev)) {
+		hci_dev_lock(hdev);
+		err = hci_remove_adv_instance(hdev, instance);
+		if (!err)
+			mgmt_advertising_removed(sk, hdev, instance);
+		hci_dev_unlock(hdev);
+		return err;
+	}
+
 	err = hci_disable_ext_adv_instance_sync(hdev, instance);
 	if (err)
 		return err;
@@ -1772,6 +1782,23 @@ int hci_schedule_adv_instance_sync(struct hci_dev *hdev, u8 instance,
 	return hci_start_adv_sync(hdev, instance);
 }
 
+static void hci_clear_ext_adv_ins_during_power_off(struct hci_dev *hdev,
+						   struct sock *sk)
+{
+	struct adv_info *adv, *n;
+	int err;
+
+	hci_dev_lock(hdev);
+	list_for_each_entry_safe(adv, n, &hdev->adv_instances, list) {
+		u8 instance = adv->instance;
+
+		err = hci_remove_adv_instance(hdev, instance);
+		if (!err)
+			mgmt_advertising_removed(sk, hdev, instance);
+	}
+	hci_dev_unlock(hdev);
+}
+
 static int hci_clear_adv_sets_sync(struct hci_dev *hdev, struct sock *sk)
 {
 	int err;
@@ -1779,6 +1806,12 @@ static int hci_clear_adv_sets_sync(struct hci_dev *hdev, struct sock *sk)
 	if (!ext_adv_capable(hdev))
 		return 0;
 
+	/* When adapter is off, remove adv without sending HCI commands */
+	if (!hdev_is_powered(hdev)) {
+		hci_clear_ext_adv_ins_during_power_off(hdev, sk);
+		return 0;
+	}
+
 	/* Disable instance 0x00 to disable all instances */
 	err = hci_disable_ext_adv_instance_sync(hdev, 0x00);
 	if (err)
@@ -5177,9 +5210,27 @@ static int hci_disconnect_all_sync(struct hci_dev *hdev, u8 reason)
 	return 0;
 }
 
+static void hci_disable_ext_advertising_temporarily(struct hci_dev *hdev)
+{
+	struct adv_info *adv, *n;
+
+	if (!ext_adv_capable(hdev))
+		return;
+
+	hci_dev_lock(hdev);
+
+	list_for_each_entry_safe(adv, n, &hdev->adv_instances, list)
+		adv->enabled = false;
+
+	hci_dev_clear_flag(hdev, HCI_LE_ADV);
+
+	hci_dev_unlock(hdev);
+}
+
 /* This function perform power off HCI command sequence as follows:
  *
- * Clear Advertising
+ * Disable Advertising Instances. Do not clear adv instances so advertising
+ * can be re-enabled on power on.
  * Stop Discovery
  * Disconnect all connections
  * hci_dev_close_sync
@@ -5199,9 +5250,7 @@ static int hci_power_off_sync(struct hci_dev *hdev)
 			return err;
 	}
 
-	err = hci_clear_adv_sync(hdev, NULL, false);
-	if (err)
-		return err;
+	hci_disable_ext_advertising_temporarily(hdev);
 
 	err = hci_stop_discovery_sync(hdev);
 	if (err)
-- 
2.39.1.456.gfc5497dd1b-goog

