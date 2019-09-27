Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C77AEBFD5F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Sep 2019 04:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728855AbfI0C5G (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 26 Sep 2019 22:57:06 -0400
Received: from mga11.intel.com ([192.55.52.93]:21594 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727631AbfI0C5G (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 26 Sep 2019 22:57:06 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Sep 2019 19:57:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,553,1559545200"; 
   d="scan'208";a="389828647"
Received: from unknown (HELO ubuntu-16-04.iind.intel.com) ([10.224.186.155])
  by fmsmga005.fm.intel.com with ESMTP; 26 Sep 2019 19:57:04 -0700
From:   Amit K Bag <amit.k.bag@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
        Amit K Bag <amit.k.bag@intel.com>,
        Yoni Shavit <yshavit@chromium.org>
Subject: [PATCH v2] Bluetooth: btusb: print FW version after FW download
Date:   Fri, 27 Sep 2019 08:21:54 +0530
Message-Id: <1569552714-16091-2-git-send-email-amit.k.bag@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569552714-16091-1-git-send-email-amit.k.bag@intel.com>
References: <1569552714-16091-1-git-send-email-amit.k.bag@intel.com>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

After FW download there is no print to confirm the current
FW version. Add print to check FW version incase of FW download.

Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
Signed-off-by: Yoni Shavit <yshavit@chromium.org>
Signed-off-by: Chethan Tumkur Narayan <chethan.tumkur.narayan@intel.com>
---
 drivers/bluetooth/btusb.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index a9c35ebb30f8..270e892c7c8f 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2432,6 +2432,13 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
 	 */
 	btintel_set_event_mask(hdev, false);
 
+	/* Read the Intel version information after loading the FW  */
+	err = btintel_read_version(hdev, &ver);
+	if (err)
+		return err;
+
+	btintel_version_info(hdev, &ver);
+
 	return 0;
 }
 
-- 
2.7.4

