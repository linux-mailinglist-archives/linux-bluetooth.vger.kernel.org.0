Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E381445CC78
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Nov 2021 19:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233572AbhKXSx7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 24 Nov 2021 13:53:59 -0500
Received: from mga11.intel.com ([192.55.52.93]:37466 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229704AbhKXSx7 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 24 Nov 2021 13:53:59 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="232842413"
X-IronPort-AV: E=Sophos;i="5.87,261,1631602800"; 
   d="scan'208";a="232842413"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 10:50:49 -0800
X-IronPort-AV: E=Sophos;i="5.87,261,1631602800"; 
   d="scan'208";a="741298141"
Received: from sdpoduri-mobl1.amr.corp.intel.com (HELO bgi1-mobl2.amr.corp.intel.com) ([10.212.157.122])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 10:50:48 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     marcel@holtmann.org, paskripkin@gmail.com, brian.gix@gmail.com,
        Brian Gix <brian.gix@intel.com>
Subject: [PATCH] Bluetooth: refactor malicious adv data check
Date:   Wed, 24 Nov 2021 10:50:27 -0800
Message-Id: <20211124185027.395186-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Check for out-of-bound read was being performed at the end of while
num_reports loop, and would fill journal with false positives. Added
check to beginning of loop processing so that it doesn't get checked
after ptr has been advanced.

Signed-off-by: Brian Gix <brian.gix@intel.com>
---
 net/bluetooth/hci_event.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index efc5458b1345..7017805fb698 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -5920,6 +5920,11 @@ static void hci_le_adv_report_evt(struct hci_dev *hdev, struct sk_buff *skb)
 		struct hci_ev_le_advertising_info *ev = ptr;
 		s8 rssi;
 
+		if (ptr > (void *) skb_tail_pointer(skb) - sizeof(*ev)) {
+			bt_dev_err(hdev, "Malicious advertising data.");
+			break;
+		}
+
 		if (ev->length <= HCI_MAX_AD_LENGTH &&
 		    ev->data + ev->length <= skb_tail_pointer(skb)) {
 			rssi = ev->data[ev->length];
@@ -5931,11 +5936,6 @@ static void hci_le_adv_report_evt(struct hci_dev *hdev, struct sk_buff *skb)
 		}
 
 		ptr += sizeof(*ev) + ev->length + 1;
-
-		if (ptr > (void *) skb_tail_pointer(skb) - sizeof(*ev)) {
-			bt_dev_err(hdev, "Malicious advertising data. Stopping processing");
-			break;
-		}
 	}
 
 	hci_dev_unlock(hdev);
-- 
2.31.1

