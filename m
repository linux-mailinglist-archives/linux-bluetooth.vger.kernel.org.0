Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97ED2395737
	for <lists+linux-bluetooth@lfdr.de>; Mon, 31 May 2021 10:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbhEaImW (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 31 May 2021 04:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbhEaIl3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 31 May 2021 04:41:29 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8193C06138D
        for <linux-bluetooth@vger.kernel.org>; Mon, 31 May 2021 01:39:21 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id 30-20020a630a1e0000b029021a63d9d4cdso6862348pgk.11
        for <linux-bluetooth@vger.kernel.org>; Mon, 31 May 2021 01:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=I47+8sZS5vFBjHugHifrCfYmHlFzUUVVfCUyGAkwPdU=;
        b=p2cQ1ZY8aFv8lBcLXEa/sa0GEa88j9usNJvSu6fbrDsA/XbST8NnFnoCjogN+nH9+/
         VGw3zK7714U3CjLjRWwfTNnqHVynokyNaX1HTsBZLH3JY+h/4oUo0t75pryGetDe3MQj
         qgeZmQHQhBAUPznmxc9knsF5vHygwpaXiJzzQXewVtagpXA1OnMoJx0ld+yNRXjg/gs4
         o9Tsvem9mlGtoB0oHUSmEeOJIXM6pfBTwBs8YSEpvxRpijGuAUa8ob15NlDfHPdLNTz2
         8njbolvE5qAh/Ft0U7ijfoZVl9fQpD9TC2j57JM29s3NYk5YjkbZJVU7L7sjoAjoACtK
         VS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=I47+8sZS5vFBjHugHifrCfYmHlFzUUVVfCUyGAkwPdU=;
        b=QQ75O0x455pAQnYuK0bA9ZyyI7PXAO9GrWIItPxP/q/COXi2AYtBVcyzZ7u4L02M5f
         ziAPoeCWO4q/eYHXNZmRZZX2WNWqjFf2lvlbep8Q8hJFFvPvaPFtaUSbppl8IIniaMJS
         wZmnfIxiGg3fUOqcWxy3C7X7ZCm/BC0al6k4vuhUfV/FeKzeEpZ9iLwf3JNbCASm26ps
         20L//huPgeWhtC/N8PlB2LQFGvhK4hWmyP5WfjcmLNwKR/hDJamJrgSLltVUmPRs3QOT
         Mms3dNqE8RCz7ZHm79GaetQVsnNW5FO2XAvpK0LfBRkjs8WoWpy4a1ZBRD9SCOPPhBjM
         PNCQ==
X-Gm-Message-State: AOAM531LYtZPBtMTRCgdI+1TV7hbP4oPljKxDFkgK8oL8xG4n7UH7UPo
        xEDKKB7pBmPV/ccfs0Fg7b4mlAo9FQH4PGhJkIlg1SgY/QSIevqWu9LgAoH77Z/yMsSvc/r5iDO
        MHW+fKCFTE8vkZ/Euayc4xuDO7v7R0P5lLX8fC2hld37Wx+ih9dmRv7Q65BpVA7ltLu2Mz81jZY
        sN
X-Google-Smtp-Source: ABdhPJx5zw4Stx/SlMRqjDW+UtziKUSYEIKr5Q9tgSSeyEBn+PbUpTQ+i9iCyr9e5z3vx3fj10EIb6IXczh3
X-Received: from apusaka-p920.tpe.corp.google.com ([2401:fa00:1:b:a6d1:a727:b17d:154e])
 (user=apusaka job=sendgmr) by 2002:a17:902:8695:b029:fd:6105:c936 with SMTP
 id g21-20020a1709028695b02900fd6105c936mr19673956plo.25.1622450361211; Mon,
 31 May 2021 01:39:21 -0700 (PDT)
Date:   Mon, 31 May 2021 16:37:28 +0800
In-Reply-To: <20210531083726.1949001-1-apusaka@google.com>
Message-Id: <20210531163500.v2.8.I361d8bede7e78ecb42a83a42994f191b13e60279@changeid>
Mime-Version: 1.0
References: <20210531083726.1949001-1-apusaka@google.com>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
Subject: [PATCH v2 8/8] Bluetooth: use inclusive language in comments
From:   Archie Pusaka <apusaka@google.com>
To:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>
Cc:     CrosBT Upstreaming <chromeos-bluetooth-upstreaming@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>,
        Miao-chen Chou <mcchou@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "=?UTF-8?q?Ole=20Bj=C3=B8rn=20Midtb=C3=B8?=" <omidtbo@cisco.com>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Archie Pusaka <apusaka@chromium.org>

This patch replaces some non-inclusive terms based on the appropriate
language mapping table compiled by the Bluetooth SIG:
https://specificationrefs.bluetooth.com/language-mapping/Appropriate_Language_Mapping_Table.pdf

Specifically, these terms are replaced:
slave       -> peripheral
blacklisted -> blocked

Signed-off-by: Archie Pusaka <apusaka@chromium.org>
Reviewed-by: Miao-chen Chou <mcchou@chromium.org>

---

Changes in v2:
* Add details in commit message

 net/bluetooth/hci_event.c | 6 +++---
 net/bluetooth/hidp/core.c | 2 +-
 net/bluetooth/mgmt.c      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 760e8e14e0f2..df5e17019e00 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -5404,7 +5404,7 @@ static struct hci_conn *check_pending_le_conn(struct hci_dev *hdev,
 		case HCI_AUTO_CONN_DIRECT:
 			/* Only devices advertising with ADV_DIRECT_IND are
 			 * triggering a connection attempt. This is allowing
-			 * incoming connections from slave devices.
+			 * incoming connections from peripheral devices.
 			 */
 			if (adv_type != LE_ADV_DIRECT_IND)
 				return NULL;
@@ -5412,8 +5412,8 @@ static struct hci_conn *check_pending_le_conn(struct hci_dev *hdev,
 		case HCI_AUTO_CONN_ALWAYS:
 			/* Devices advertising with ADV_IND or ADV_DIRECT_IND
 			 * are triggering a connection attempt. This means
-			 * that incoming connections from slave device are
-			 * accepted and also outgoing connections to slave
+			 * that incoming connections from peripheral device are
+			 * accepted and also outgoing connections to peripheral
 			 * devices are established when found.
 			 */
 			break;
diff --git a/net/bluetooth/hidp/core.c b/net/bluetooth/hidp/core.c
index 0db48c812662..96fedef14723 100644
--- a/net/bluetooth/hidp/core.c
+++ b/net/bluetooth/hidp/core.c
@@ -794,7 +794,7 @@ static int hidp_setup_hid(struct hidp_session *session,
 	hid->dev.parent = &session->conn->hcon->dev;
 	hid->ll_driver = &hidp_hid_driver;
 
-	/* True if device is blacklisted in drivers/hid/hid-quirks.c */
+	/* True if device is blocked in drivers/hid/hid-quirks.c */
 	if (hid_ignore(hid)) {
 		hid_destroy_device(session->hid);
 		session->hid = NULL;
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index f0e4ebed72b8..35e3563f2a4e 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -2959,7 +2959,7 @@ static int pair_device(struct sock *sk, struct hci_dev *hdev, void *data,
 		/* When pairing a new device, it is expected to remember
 		 * this device for future connections. Adding the connection
 		 * parameter information ahead of time allows tracking
-		 * of the slave preferred values and will speed up any
+		 * of the peripheral preferred values and will speed up any
 		 * further connection establishment.
 		 *
 		 * If connection parameters already exist, then they
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog

