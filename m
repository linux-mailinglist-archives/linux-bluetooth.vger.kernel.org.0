Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6801ADA66
	for <lists+linux-bluetooth@lfdr.de>; Fri, 17 Apr 2020 11:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726941AbgDQJte (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 17 Apr 2020 05:49:34 -0400
Received: from mga02.intel.com ([134.134.136.20]:42811 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726770AbgDQJte (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 17 Apr 2020 05:49:34 -0400
IronPort-SDR: xrdYT8lqpRJU/EXs2et9fP8r3lS1bHpAgQk/WgXXw4zVQthYs8ff8aQsJJz35nI0UOD24j9sRY
 YC87HkzZQ4Dw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2020 02:49:33 -0700
IronPort-SDR: vtAduAWaXsnZj9E/r8Y3yNNZsMdOdxCJLM+KXbARVpEXKn4/Y9K40dRJ/gvmFtnUGnDIA/MRoM
 BfbLH3HiY65g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; 
   d="scan'208";a="242961362"
Received: from unknown (HELO intel-Lenovo-Legion-Y540-15IRH-PG0.iind.intel.com) ([10.224.186.95])
  by orsmga007.jf.intel.com with ESMTP; 17 Apr 2020 02:49:31 -0700
From:   Amit K Bag <amit.k.bag@intel.com>
To:     linux-firmware@kernel.org
Cc:     linux-bluetooth@vger.kernel.org, ravishankar.srivatsa@intel.com,
        chethan.tumkur.narayan@intel.com,
        "Hegde, Raghuram" <raghuram.hegde@intel.com>,
        Amit K Bag <amit.k.bag@intel.com>
Subject: [PATCH 1/2] Bluetooth: btusb: Add support for Intel Bluetooth Device Typhoon Peak (8087:0032)
Date:   Fri, 17 Apr 2020 15:20:11 +0530
Message-Id: <20200417095012.8443-1-amit.k.bag@intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: "Hegde, Raghuram" <raghuram.hegde@intel.com>

Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 09913cadd1ca..7a71d851b6c9 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -340,6 +340,8 @@ static const struct usb_device_id blacklist_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x8087, 0x0029), .driver_info = BTUSB_INTEL_NEW |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x8087, 0x0032), .driver_info = BTUSB_INTEL_NEW |
+                                                     BTUSB_WIDEBAND_SPEECH},
 	{ USB_DEVICE(0x8087, 0x07da), .driver_info = BTUSB_CSR },
 	{ USB_DEVICE(0x8087, 0x07dc), .driver_info = BTUSB_INTEL },
 	{ USB_DEVICE(0x8087, 0x0a2a), .driver_info = BTUSB_INTEL },
-- 
2.17.1

