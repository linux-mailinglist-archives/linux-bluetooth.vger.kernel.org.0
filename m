Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D27461C0B39
	for <lists+linux-bluetooth@lfdr.de>; Fri,  1 May 2020 02:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727808AbgEAAXH (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 30 Apr 2020 20:23:07 -0400
Received: from mga05.intel.com ([192.55.52.43]:54958 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726545AbgEAAXH (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 30 Apr 2020 20:23:07 -0400
IronPort-SDR: fK58KAFjlEUKVkpa38AnTJX3LnAMtU9nr6RwbhBPiKNYpykvdqqN+sDFmsysOnlqchN3uDXgXC
 90adCkZnCmYQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2020 17:23:06 -0700
IronPort-SDR: Q76k8PP4yh76YVufOu/ksDNG7nvrL++GJ618f1HfQkciS/xXk2od0Ts+Id0U40CmptyJhs5Ch9
 6+GIIdIPiANw==
X-IronPort-AV: E=Sophos;i="5.73,337,1583222400"; 
   d="scan'208";a="261959950"
Received: from han1-xps-13-9350.jf.intel.com ([10.54.74.32])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2020 17:23:06 -0700
Message-ID: <35e52a8c25411e799a5ffece3e51c290c7dfb967.camel@linux.intel.com>
Subject: [PATCH] Bluetooth: Fix advertising handle is set to 0
From:   Tedd Ho-Jeong An <tedd.an@linux.intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Thu, 30 Apr 2020 17:22:21 -0700
Organization: Intel Corporation
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Tedd Ho-Jeong An <tedd.an@intel.com>

This patch fix the advertising handle is set to 0 regardless of actual
instance value. The affected commands are LE Set Advertising Set Random
Address, LE Set Extended Advertising Data, and LE Set Extended Scan
Response Data commands.

Signed-off-by: Tedd Ho-Jeong An <tedd.an@intel.com>

---
 net/bluetooth/hci_request.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index 9ea40106ef17..3f470f0e432c 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -1447,7 +1447,7 @@ void __hci_req_update_scan_rsp_data(struct hci_request
*req, u8 instance)
 		memcpy(hdev->scan_rsp_data, cp.data, sizeof(cp.data));
 		hdev->scan_rsp_data_len = len;
 
-		cp.handle = 0;
+		cp.handle = instance;
 		cp.length = len;
 		cp.operation = LE_SET_ADV_DATA_OP_COMPLETE;
 		cp.frag_pref = LE_SET_ADV_DATA_NO_FRAG;
@@ -1591,7 +1591,7 @@ void __hci_req_update_adv_data(struct hci_request *req, u8
instance)
 		hdev->adv_data_len = len;
 
 		cp.length = len;
-		cp.handle = 0;
+		cp.handle = instance;
 		cp.operation = LE_SET_ADV_DATA_OP_COMPLETE;
 		cp.frag_pref = LE_SET_ADV_DATA_NO_FRAG;
 
@@ -1876,7 +1876,7 @@ int __hci_req_setup_ext_adv_instance(struct hci_request
*req, u8 instance)
 
 		memset(&cp, 0, sizeof(cp));
 
-		cp.handle = 0;
+		cp.handle = instance;
 		bacpy(&cp.bdaddr, &random_addr);
 
 		hci_req_add(req,
-- 
2.17.1


