Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA7B193800
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Mar 2020 06:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727661AbgCZFmN (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 26 Mar 2020 01:42:13 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34234 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgCZFmH (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 26 Mar 2020 01:42:07 -0400
Received: by mail-pg1-f193.google.com with SMTP id d37so1823710pgl.1
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 Mar 2020 22:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GAtp02xkzcXTpQVd6eNZ6e9QAobCmX4PQ/bu6ncX+V8=;
        b=Gav9O9ydwdK++YUnd3IMS6cNflMzwIphGTaGQJBtPJx+iXD2x0HBVJYtMggTQZlnZQ
         Ed4lwh6OvbtumiMpLwpLntyFkFWb5GcSirNrgYv+WvnzvT2M7wrqEPqo4DP/ASZGd0/Q
         ix5lqjduBOwfPM7cxgUisfwdbx9i2xAAmPklA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GAtp02xkzcXTpQVd6eNZ6e9QAobCmX4PQ/bu6ncX+V8=;
        b=AyjzoWvgAaf7X2J6jV+gb9WvTVZnGe0eS3Kf8uKET98wE9eIbGfvoa7IvTIi0ZPW9a
         Dpv/S0MKl+2NLDRNIS2cwlaUM/xUo+UdcGSTwGDN1r9aOu1juKw54q5TMMM8PLxQ5p5/
         /EvG/vWfSfugTcQhkT1AV4tiVhZeULm9CEyjHjI14L688vjxDQ5YhhFXeD8kaiYCyiNo
         xdDLx20TTNev2bKgx35CIg5lthZFUM/AJE/Y3/ILokYfkzzl/mDakFjgOUr9LES62j5z
         dEp6d7S0elqXmuzZKntXbk59Rg643hjfk8TZ4DaJ1iQh0Qszi+mhyzplCIPjSX13Eiq6
         YQJQ==
X-Gm-Message-State: ANhLgQ0BWWS+ODVau6VPc8dJixXJ2ksQ78rjAn6Es/qJ+ziJjjzHWjre
        2+cqiVjrCrnwmnZN6QPIBLtdsg==
X-Google-Smtp-Source: ADFU+vsZgMeDCxKHPHjGYbZhk8LncJ1ytMqCvgZsIcf8XqiYbTF3nFfv9g0EuUyt27Crks0bIfsmHg==
X-Received: by 2002:a62:ce8a:: with SMTP id y132mr7013942pfg.163.1585201326283;
        Wed, 25 Mar 2020 22:42:06 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id b3sm710855pgs.69.2020.03.25.22.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 22:42:05 -0700 (PDT)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     marcel@holtmann.org
Cc:     linux-bluetooth@vger.kernel.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 1/1] Bluetooth: Update add_device with wakeable actions
Date:   Wed, 25 Mar 2020 22:39:17 -0700
Message-Id: <20200325223803.1.I196e4af9cde6c6e6aa7102906722cb9df8c80a7b@changeid>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
In-Reply-To: <20200326053917.65024-1-abhishekpandit@chromium.org>
References: <20200326053917.65024-1-abhishekpandit@chromium.org>
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

 net/bluetooth/mgmt.c | 56 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 10 deletions(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 6552003a170e..8688673542b3 100644
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
 
@@ -5834,6 +5855,21 @@ static int add_device(struct sock *sk, struct hci_dev *hdev,
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

