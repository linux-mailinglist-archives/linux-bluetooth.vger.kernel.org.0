Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4C4184026
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Mar 2020 06:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgCMFEG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 13 Mar 2020 01:04:06 -0400
Received: from mga06.intel.com ([134.134.136.31]:41642 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgCMFEG (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 13 Mar 2020 01:04:06 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 22:04:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,547,1574150400"; 
   d="scan'208";a="278088218"
Received: from unknown (HELO intel-Lenovo-Legion-Y540-15IRH-PG0.iind.intel.com) ([10.224.186.95])
  by fmsmga002.fm.intel.com with ESMTP; 12 Mar 2020 22:04:02 -0700
From:   Amit K Bag <amit.k.bag@intel.com>
To:     linux-firmware@kernel.org
Cc:     linux-bluetooth@vger.kernel.org, ravishankar.srivatsa@intel.com,
        chethan.tumkur.narayan@intel.com,
        Sukumar Ghorai <sukumar.ghorai@intel.com>,
        Amit K Bag <amit.k.bag@intel.com>
Subject: [PATCH v2] Bluetooth: print fw build version in power-on boot
Date:   Fri, 13 Mar 2020 10:34:31 +0530
Message-Id: <20200313050431.30321-1-amit.k.bag@intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Sukumar Ghorai <sukumar.ghorai@intel.com>

To determine the build version of Bluetooth firmware to ensure reported
issue related to a particular release. This is very helpful for every fw
downloaded to BT controller and issue reported from field test.

Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
Signed-off-by: Sukumar Ghorai <sukumar.ghorai@intel.com>
---
 drivers/bluetooth/btusb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index f5924f3e8b8d..86bac76da852 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -1930,7 +1930,12 @@ static int btusb_setup_intel(struct hci_dev *hdev)
 	if (err)
 		return err;
 
-	bt_dev_info(hdev, "Intel firmware patch completed and activated");
+       /* Need build number for downloaded fw patches in every power-on boot */
+       err = btintel_read_version(hdev, &ver);
+       if (err)
+               return err;
+       bt_dev_info(hdev, "Intel Bluetooth fw patch 0x%02x completed and activated",
+               hdev->name, ver.fw_patch_num);
 
 	goto complete;
 
-- 
2.17.1

