Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFBD7193810
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Mar 2020 06:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgCZFpb (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 26 Mar 2020 01:45:31 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39686 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgCZFpZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 26 Mar 2020 01:45:25 -0400
Received: by mail-pf1-f196.google.com with SMTP id d25so2230471pfn.6
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 Mar 2020 22:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gj5gA3T2046detFgpaRzX1gpdaCMHsoqR5CDuNT7U/U=;
        b=i+w8pe4isMbYIcvhm9pHUk6A7TMoqqnVLGnLaPq17Fd/yK4bwHvXfykBbX5oFBKkFB
         qZ/ihFxifMLWvRJIUef3SE9A/fRZ+5KPjxg2G8zOpWIZyo9whRLOJXygR+rYyayuywci
         Rfp1mEm7rNzmffmZFT9W/TOmy3eo1qpPvurbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gj5gA3T2046detFgpaRzX1gpdaCMHsoqR5CDuNT7U/U=;
        b=GCr8lbnfJ05UNamV1jgri6s+2T9TRtW0NmTUTFcHQhvO9k5WVV+aXZCl/Z1fFlu1pD
         xVKE9bxkyFOn3SdlLGLAQzjPsX4afXM6FpyOifGSLLtgRC+F5xIU9+nVIMs/bK9iXang
         HTQoHiJ56tPaCI90C2oI4XYVFmdrgcVZ7/7scIbrbZxr2dWLkEEeRJToSfey6jgzY4e+
         wJXd8RE5D85NftKcWAYMIbehItX1FUsUGbIdQEZC/IJa2OPQYxS2pw7/lK+/g6FEWolZ
         OaHBFMx+HE2y4KHR3ZeGK89/WBXFBU1PWbtoPq3/Opo+4epWdwlSjhpRBVYJ9e5RMRr7
         D28g==
X-Gm-Message-State: ANhLgQ3fPjoTqqm29+rraAX0B0M4Spc7MLgIawCsR3ua37Hivu76ZxaY
        00gLj/Uz4C/FxOFurXkLp8MMaQ==
X-Google-Smtp-Source: ADFU+vtQ7QDI/m9me2BsixnCCLZBImKuzbFcg9Epi89olgvg/Y5NE+Rg1Qs2S2J7lAj4lQCVnmzDPg==
X-Received: by 2002:a65:5a4f:: with SMTP id z15mr6873211pgs.103.1585201523086;
        Wed, 25 Mar 2020 22:45:23 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id d1sm727302pfc.3.2020.03.25.22.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 22:45:22 -0700 (PDT)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     marcel@holtmann.org
Cc:     linux-bluetooth@vger.kernel.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v2 1/1] Bluetooth: Update add_device with wakeable actions
Date:   Wed, 25 Mar 2020 22:45:17 -0700
Message-Id: <20200325224500.v2.1.I196e4af9cde6c6e6aa7102906722cb9df8c80a7b@changeid>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
In-Reply-To: <20200326054517.71462-1-abhishekpandit@chromium.org>
References: <20200326054517.71462-1-abhishekpandit@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Add new actions to add_device to allow it to set or unset a device as
wakeable. When the set wakeable and unset wakeable actions are used, the
autoconnect property is not updated and the device is not added to the
whitelist (if BR/EDR).

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Changes in v2:
* Added missing goto unlock

 net/bluetooth/mgmt.c | 57 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 10 deletions(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 6552003a170e..8643089e758f 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -5775,6 +5775,7 @@ static int add_device(struct sock *sk, struct hci_dev *hdev,
 		      void *data, u16 len)
 {
 	struct mgmt_cp_add_device *cp = data;
+	struct hci_conn_params *params;
 	u8 auto_conn, addr_type;
 	int err;
 
@@ -5786,7 +5787,7 @@ static int add_device(struct sock *sk, struct hci_dev *hdev,
 					 MGMT_STATUS_INVALID_PARAMS,
 					 &cp->addr, sizeof(cp->addr));
 
-	if (cp->action != 0x00 && cp->action != 0x01 && cp->action != 0x02)
+	if (cp->action > 0x04)
 		return mgmt_cmd_complete(sk, hdev->id, MGMT_OP_ADD_DEVICE,
 					 MGMT_STATUS_INVALID_PARAMS,
 					 &cp->addr, sizeof(cp->addr));
@@ -5794,8 +5795,35 @@ static int add_device(struct sock *sk, struct hci_dev *hdev,
 	hci_dev_lock(hdev);
 
 	if (cp->addr.type == BDADDR_BREDR) {
-		/* Only incoming connections action is supported for now */
-		if (cp->action != 0x01) {
+		switch (cp->action) {
+		case 0x3:
+			/* Set wakeable */
+			err = hci_bdaddr_list_add(&hdev->wakeable,
+						  &cp->addr.bdaddr,
+						  cp->addr.type);
+			if (err && err != -EEXIST)
+				goto unlock;
+			break;
+		case 0x4:
+			/* Remove wakeable */
+			err = hci_bdaddr_list_del(&hdev->wakeable,
+						  &cp->addr.bdaddr,
+						  cp->addr.type);
+			if (err)
+				goto unlock;
+
+			break;
+		case 0x1:
+			/* Allow incoming connection */
+			err = hci_bdaddr_list_add(&hdev->whitelist,
+						  &cp->addr.bdaddr,
+						  cp->addr.type);
+			if (err && err != -EEXIST)
+				goto unlock;
+
+			hci_req_update_scan(hdev);
+			break;
+		default:
 			err = mgmt_cmd_complete(sk, hdev->id,
 						MGMT_OP_ADD_DEVICE,
 						MGMT_STATUS_INVALID_PARAMS,
@@ -5803,13 +5831,6 @@ static int add_device(struct sock *sk, struct hci_dev *hdev,
 			goto unlock;
 		}
 
-		err = hci_bdaddr_list_add(&hdev->whitelist, &cp->addr.bdaddr,
-					  cp->addr.type);
-		if (err)
-			goto unlock;
-
-		hci_req_update_scan(hdev);
-
 		goto added;
 	}
 
@@ -5834,6 +5855,22 @@ static int add_device(struct sock *sk, struct hci_dev *hdev,
 		goto unlock;
 	}
 
+	/* Only allow wakeable property to be set/unset on existing device */
+	if (cp->action == 0x03 || cp->action == 0x04) {
+		params = hci_conn_params_lookup(hdev, &cp->addr.bdaddr,
+						addr_type);
+		if (!params) {
+			err = mgmt_cmd_complete(sk, hdev->id,
+						MGMT_OP_ADD_DEVICE,
+						MGMT_STATUS_FAILED, &cp->addr,
+						sizeof(cp->addr));
+			goto unlock;
+		}
+
+		params->wakeable = cp->action == 0x03;
+		goto added;
+	}
+
 	/* If the connection parameters don't exist for this device,
 	 * they will be created and configured with defaults.
 	 */
-- 
2.25.1.696.g5e7596f4ac-goog

