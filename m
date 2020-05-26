Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3E019DD2D
	for <lists+linux-bluetooth@lfdr.de>; Fri,  3 Apr 2020 19:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbgDCRvp (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 3 Apr 2020 13:51:45 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:49743 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727167AbgDCRvo (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 3 Apr 2020 13:51:44 -0400
Received: from localhost.localdomain (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 5CCF1CED02
        for <linux-bluetooth@vger.kernel.org>; Fri,  3 Apr 2020 20:01:17 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v8 1/2] Bluetooth: add support to notify using SCO air mode
Date:   Fri,  3 Apr 2020 19:51:38 +0200
Message-Id: <20200403175139.749601-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Sathish Narsimman <nsathish41@gmail.com>

notifying using HCI_NOTIFY_CONN_ADD for SCO connection is generic in
case of mSBC audio. To differntiate SCO air mode introducing
HCI_NOTIFY_ENABLE_SCO_CVSD and HCI_NOTIFY_ENABLE_SCO_TRANSP.

Signed-off-by: Sathish Narsimman <sathish.narasimman@intel.com>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 include/net/bluetooth/hci.h |  3 +++
 net/bluetooth/hci_conn.c    | 25 +++++++++++++++++++++----
 net/bluetooth/hci_event.c   | 23 ++++++++++++++++++++++-
 3 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 5f60e135aeb6..9ff2f7a9e131 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -53,6 +53,9 @@
 #define HCI_NOTIFY_CONN_ADD		1
 #define HCI_NOTIFY_CONN_DEL		2
 #define HCI_NOTIFY_VOICE_SETTING	3
+#define HCI_NOTIFY_ENABLE_SCO_CVSD	4
+#define HCI_NOTIFY_ENABLE_SCO_TRANSP	5
+#define HCI_NOTIFY_DISABLE_SCO		6
 
 /* HCI bus types */
 #define HCI_VIRTUAL	0
diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index e245bc155cc2..07c34c55fc50 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -122,8 +122,18 @@ static void hci_conn_cleanup(struct hci_conn *conn)
 
 	hci_conn_hash_del(hdev, conn);
 
-	if (hdev->notify)
-		hdev->notify(hdev, HCI_NOTIFY_CONN_DEL);
+	if (conn->type == SCO_LINK || conn->type == ESCO_LINK) {
+		switch (conn->setting & SCO_AIRMODE_MASK) {
+		case SCO_AIRMODE_CVSD:
+		case SCO_AIRMODE_TRANSP:
+			if (hdev->notify)
+				hdev->notify(hdev, HCI_NOTIFY_DISABLE_SCO);
+			break;
+		}
+	} else {
+		if (hdev->notify)
+			hdev->notify(hdev, HCI_NOTIFY_CONN_DEL);
+	}
 
 	hci_conn_del_sysfs(conn);
 
@@ -577,8 +587,15 @@ struct hci_conn *hci_conn_add(struct hci_dev *hdev, int type, bdaddr_t *dst,
 	hci_dev_hold(hdev);
 
 	hci_conn_hash_add(hdev, conn);
-	if (hdev->notify)
-		hdev->notify(hdev, HCI_NOTIFY_CONN_ADD);
+
+	/* The SCO and eSCO connections will only be notified when their
+	 * setup has been completed. This is different to ACL links which
+	 * can be notified right away.
+	 */
+	if (conn->type != SCO_LINK && conn->type != ESCO_LINK) {
+		if (hdev->notify)
+			hdev->notify(hdev, HCI_NOTIFY_CONN_ADD);
+	}
 
 	hci_conn_init_sysfs(conn);
 
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index ddf77304aa8e..af396cb69602 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -2607,8 +2607,16 @@ static void hci_conn_complete_evt(struct hci_dev *hdev, struct sk_buff *skb)
 	if (ev->status) {
 		hci_connect_cfm(conn, ev->status);
 		hci_conn_del(conn);
-	} else if (ev->link_type != ACL_LINK)
+	} else if (ev->link_type == SCO_LINK) {
+		switch (conn->setting & SCO_AIRMODE_MASK) {
+		case SCO_AIRMODE_CVSD:
+			if (hdev->notify)
+				hdev->notify(hdev, HCI_NOTIFY_ENABLE_SCO_CVSD);
+			break;
+		}
+
 		hci_connect_cfm(conn, ev->status);
+	}
 
 unlock:
 	hci_dev_unlock(hdev);
@@ -4307,6 +4315,19 @@ static void hci_sync_conn_complete_evt(struct hci_dev *hdev,
 		break;
 	}
 
+	bt_dev_dbg(hdev, "SCO connected with air mode: %02x", ev->air_mode);
+
+	switch (conn->setting & SCO_AIRMODE_MASK) {
+	case SCO_AIRMODE_CVSD:
+		if (hdev->notify)
+			hdev->notify(hdev, HCI_NOTIFY_ENABLE_SCO_CVSD);
+		break;
+	case SCO_AIRMODE_TRANSP:
+		if (hdev->notify)
+			hdev->notify(hdev, HCI_NOTIFY_ENABLE_SCO_TRANSP);
+		break;
+	}
+
 	hci_connect_cfm(conn, ev->status);
 	if (ev->status)
 		hci_conn_del(conn);
-- 
2.25.1

