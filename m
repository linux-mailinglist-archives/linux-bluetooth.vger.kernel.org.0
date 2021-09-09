Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCB62404EB0
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 Sep 2021 14:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241013AbhIIMNW (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 Sep 2021 08:13:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:51600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243710AbhIIMLH (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 Sep 2021 08:11:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1227261261;
        Thu,  9 Sep 2021 11:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631188110;
        bh=ymiqixhOCumKs5uM6isFH/CCCvwn8+QubiAbBNur0xA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=grK32336blOfCI2jn+fCR6MWTf3Xbz0zfCdNr40C4jL4nAb2TzpCX72skcmIIAU1+
         atvJZ308pST0qMCE+ANFjLgIsd6iWE5cCg7A8JfMAOMEJ10NxeOdUn91XFfebH9F4X
         bxzhaKtNMxWew1hSspOLo+dj4hykL40VzSS094hB5p3SPmCdCGLaNarExxPy4pg+Lj
         lxGQuMvLZGMEHyG+DV2auVN72KdqUrdZZ2UhPvopObuV+x5P/8OQf4/Lz4M5lbx9/t
         xntWCyRdPOEwen+chCHEoZemc87b7HZCx24C8qtiN7TH5JG+g1U2F+mVvvMUsvYdQv
         1dp1BmnQDqs1Q==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 089/219] Bluetooth: Fix not generating RPA when required
Date:   Thu,  9 Sep 2021 07:44:25 -0400
Message-Id: <20210909114635.143983-89-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114635.143983-1-sashal@kernel.org>
References: <20210909114635.143983-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

[ Upstream commit c45074d68a9b1e893d86520af71fab37693c3d7e ]

Code was checking if random_addr and hdev->rpa match without first
checking if the RPA has not been set (BDADDR_ANY), furthermore it was
clearing HCI_RPA_EXPIRED before the command completes and the RPA is
actually programmed which in case of failure would leave the expired
RPA still set.

Since advertising instance have a similar problem the clearing of
HCI_RPA_EXPIRED has been moved to hci_event.c after checking the random
address is in fact the hdev->rap and then proceed to set the expire
timeout.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/net/bluetooth/hci_core.h |  4 ++
 net/bluetooth/hci_event.c        | 32 +++++++++----
 net/bluetooth/hci_request.c      | 81 ++++++++++++++------------------
 3 files changed, 61 insertions(+), 56 deletions(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 34a92d5ed12b..22a60291f203 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -1411,6 +1411,10 @@ void hci_conn_del_sysfs(struct hci_conn *conn);
 				!hci_dev_test_flag(dev, HCI_AUTO_OFF))
 #define bredr_sc_enabled(dev)  (lmp_sc_capable(dev) && \
 				hci_dev_test_flag(dev, HCI_SC_ENABLED))
+#define rpa_valid(dev)         (bacmp(&dev->rpa, BDADDR_ANY) && \
+				!hci_dev_test_flag(dev, HCI_RPA_EXPIRED))
+#define adv_rpa_valid(adv)     (bacmp(&adv->random_addr, BDADDR_ANY) && \
+				!adv->rpa_expired)
 
 #define scan_1m(dev) (((dev)->le_tx_def_phys & HCI_LE_SET_PHY_1M) || \
 		      ((dev)->le_rx_def_phys & HCI_LE_SET_PHY_1M))
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index c5de24372971..c30682c90fc5 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -40,6 +40,8 @@
 #define ZERO_KEY "\x00\x00\x00\x00\x00\x00\x00\x00" \
 		 "\x00\x00\x00\x00\x00\x00\x00\x00"
 
+#define secs_to_jiffies(_secs) msecs_to_jiffies((_secs) * 1000)
+
 /* Handle HCI Event packets */
 
 static void hci_cc_inquiry_cancel(struct hci_dev *hdev, struct sk_buff *skb,
@@ -1171,6 +1173,12 @@ static void hci_cc_le_set_random_addr(struct hci_dev *hdev, struct sk_buff *skb)
 
 	bacpy(&hdev->random_addr, sent);
 
+	if (!bacmp(&hdev->rpa, sent)) {
+		hci_dev_clear_flag(hdev, HCI_RPA_EXPIRED);
+		queue_delayed_work(hdev->workqueue, &hdev->rpa_expired,
+				   secs_to_jiffies(hdev->rpa_timeout));
+	}
+
 	hci_dev_unlock(hdev);
 }
 
@@ -1201,24 +1209,30 @@ static void hci_cc_le_set_adv_set_random_addr(struct hci_dev *hdev,
 {
 	__u8 status = *((__u8 *) skb->data);
 	struct hci_cp_le_set_adv_set_rand_addr *cp;
-	struct adv_info *adv_instance;
+	struct adv_info *adv;
 
 	if (status)
 		return;
 
 	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_ADV_SET_RAND_ADDR);
-	if (!cp)
+	/* Update only in case the adv instance since handle 0x00 shall be using
+	 * HCI_OP_LE_SET_RANDOM_ADDR since that allows both extended and
+	 * non-extended adverting.
+	 */
+	if (!cp || !cp->handle)
 		return;
 
 	hci_dev_lock(hdev);
 
-	if (!cp->handle) {
-		/* Store in hdev for instance 0 (Set adv and Directed advs) */
-		bacpy(&hdev->random_addr, &cp->bdaddr);
-	} else {
-		adv_instance = hci_find_adv_instance(hdev, cp->handle);
-		if (adv_instance)
-			bacpy(&adv_instance->random_addr, &cp->bdaddr);
+	adv = hci_find_adv_instance(hdev, cp->handle);
+	if (adv) {
+		bacpy(&adv->random_addr, &cp->bdaddr);
+		if (!bacmp(&hdev->rpa, &cp->bdaddr)) {
+			adv->rpa_expired = false;
+			queue_delayed_work(hdev->workqueue,
+					   &adv->rpa_expired_cb,
+					   secs_to_jiffies(hdev->rpa_timeout));
+		}
 	}
 
 	hci_dev_unlock(hdev);
diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index b069f640394d..477519ab63b8 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -2053,8 +2053,6 @@ int hci_get_random_address(struct hci_dev *hdev, bool require_privacy,
 	 * current RPA has expired then generate a new one.
 	 */
 	if (use_rpa) {
-		int to;
-
 		/* If Controller supports LL Privacy use own address type is
 		 * 0x03
 		 */
@@ -2065,14 +2063,10 @@ int hci_get_random_address(struct hci_dev *hdev, bool require_privacy,
 			*own_addr_type = ADDR_LE_DEV_RANDOM;
 
 		if (adv_instance) {
-			if (!adv_instance->rpa_expired &&
-			    !bacmp(&adv_instance->random_addr, &hdev->rpa))
+			if (adv_rpa_valid(adv_instance))
 				return 0;
-
-			adv_instance->rpa_expired = false;
 		} else {
-			if (!hci_dev_test_and_clear_flag(hdev, HCI_RPA_EXPIRED) &&
-			    !bacmp(&hdev->random_addr, &hdev->rpa))
+			if (rpa_valid(hdev))
 				return 0;
 		}
 
@@ -2084,14 +2078,6 @@ int hci_get_random_address(struct hci_dev *hdev, bool require_privacy,
 
 		bacpy(rand_addr, &hdev->rpa);
 
-		to = msecs_to_jiffies(hdev->rpa_timeout * 1000);
-		if (adv_instance)
-			queue_delayed_work(hdev->workqueue,
-					   &adv_instance->rpa_expired_cb, to);
-		else
-			queue_delayed_work(hdev->workqueue,
-					   &hdev->rpa_expired, to);
-
 		return 0;
 	}
 
@@ -2134,6 +2120,30 @@ void __hci_req_clear_ext_adv_sets(struct hci_request *req)
 	hci_req_add(req, HCI_OP_LE_CLEAR_ADV_SETS, 0, NULL);
 }
 
+static void set_random_addr(struct hci_request *req, bdaddr_t *rpa)
+{
+	struct hci_dev *hdev = req->hdev;
+
+	/* If we're advertising or initiating an LE connection we can't
+	 * go ahead and change the random address at this time. This is
+	 * because the eventual initiator address used for the
+	 * subsequently created connection will be undefined (some
+	 * controllers use the new address and others the one we had
+	 * when the operation started).
+	 *
+	 * In this kind of scenario skip the update and let the random
+	 * address be updated at the next cycle.
+	 */
+	if (hci_dev_test_flag(hdev, HCI_LE_ADV) ||
+	    hci_lookup_le_connect(hdev)) {
+		bt_dev_dbg(hdev, "Deferring random address update");
+		hci_dev_set_flag(hdev, HCI_RPA_EXPIRED);
+		return;
+	}
+
+	hci_req_add(req, HCI_OP_LE_SET_RANDOM_ADDR, 6, rpa);
+}
+
 int __hci_req_setup_ext_adv_instance(struct hci_request *req, u8 instance)
 {
 	struct hci_cp_le_set_ext_adv_params cp;
@@ -2236,6 +2246,13 @@ int __hci_req_setup_ext_adv_instance(struct hci_request *req, u8 instance)
 		} else {
 			if (!bacmp(&random_addr, &hdev->random_addr))
 				return 0;
+			/* Instance 0x00 doesn't have an adv_info, instead it
+			 * uses hdev->random_addr to track its address so
+			 * whenever it needs to be updated this also set the
+			 * random address since hdev->random_addr is shared with
+			 * scan state machine.
+			 */
+			set_random_addr(req, &random_addr);
 		}
 
 		memset(&cp, 0, sizeof(cp));
@@ -2493,30 +2510,6 @@ void hci_req_clear_adv_instance(struct hci_dev *hdev, struct sock *sk,
 						false);
 }
 
-static void set_random_addr(struct hci_request *req, bdaddr_t *rpa)
-{
-	struct hci_dev *hdev = req->hdev;
-
-	/* If we're advertising or initiating an LE connection we can't
-	 * go ahead and change the random address at this time. This is
-	 * because the eventual initiator address used for the
-	 * subsequently created connection will be undefined (some
-	 * controllers use the new address and others the one we had
-	 * when the operation started).
-	 *
-	 * In this kind of scenario skip the update and let the random
-	 * address be updated at the next cycle.
-	 */
-	if (hci_dev_test_flag(hdev, HCI_LE_ADV) ||
-	    hci_lookup_le_connect(hdev)) {
-		bt_dev_dbg(hdev, "Deferring random address update");
-		hci_dev_set_flag(hdev, HCI_RPA_EXPIRED);
-		return;
-	}
-
-	hci_req_add(req, HCI_OP_LE_SET_RANDOM_ADDR, 6, rpa);
-}
-
 int hci_update_random_address(struct hci_request *req, bool require_privacy,
 			      bool use_rpa, u8 *own_addr_type)
 {
@@ -2528,8 +2521,6 @@ int hci_update_random_address(struct hci_request *req, bool require_privacy,
 	 * the current RPA in use, then generate a new one.
 	 */
 	if (use_rpa) {
-		int to;
-
 		/* If Controller supports LL Privacy use own address type is
 		 * 0x03
 		 */
@@ -2539,8 +2530,7 @@ int hci_update_random_address(struct hci_request *req, bool require_privacy,
 		else
 			*own_addr_type = ADDR_LE_DEV_RANDOM;
 
-		if (!hci_dev_test_and_clear_flag(hdev, HCI_RPA_EXPIRED) &&
-		    !bacmp(&hdev->random_addr, &hdev->rpa))
+		if (rpa_valid(hdev))
 			return 0;
 
 		err = smp_generate_rpa(hdev, hdev->irk, &hdev->rpa);
@@ -2551,9 +2541,6 @@ int hci_update_random_address(struct hci_request *req, bool require_privacy,
 
 		set_random_addr(req, &hdev->rpa);
 
-		to = msecs_to_jiffies(hdev->rpa_timeout * 1000);
-		queue_delayed_work(hdev->workqueue, &hdev->rpa_expired, to);
-
 		return 0;
 	}
 
-- 
2.30.2

