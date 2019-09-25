Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5358EBDBD9
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Sep 2019 12:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbfIYKIw (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 25 Sep 2019 06:08:52 -0400
Received: from mga01.intel.com ([192.55.52.88]:41853 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726276AbfIYKIw (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 25 Sep 2019 06:08:52 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Sep 2019 03:08:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,547,1559545200"; 
   d="scan'208";a="189628735"
Received: from unknown (HELO ubuntu-16-04.iind.intel.com) ([10.224.186.155])
  by fmsmga007.fm.intel.com with ESMTP; 25 Sep 2019 03:08:50 -0700
From:   Amit K Bag <amit.k.bag@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
        Amit K Bag <amit.k.bag@intel.com>
Subject: [PATCH] Bluetooth: btusb: print FW version after FW download
Date:   Wed, 25 Sep 2019 15:33:46 +0530
Message-Id: <1569405826-4555-1-git-send-email-amit.k.bag@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

After FW download there is no print to confirm the current
FW version. Add print to check FW version incase of FW download.

Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
---
 drivers/bluetooth/btusb.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index a9c35ebb30f8..f6c033b5042c 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2432,6 +2432,14 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
 	 */
 	btintel_set_event_mask(hdev, false);
 
+	/* Read the Intel version information after loading the FW  */
+	err = btintel_read_version(hdev, &ver);
+	if (err)
+		return err;
+
+	btintel_version_info(hdev, &ver);
+	bt_dev_info(hdev, "Setup complete");
+
 	return 0;
 }
 
-- 
2.7.4

