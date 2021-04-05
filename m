Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03E1B3542B6
	for <lists+linux-bluetooth@lfdr.de>; Mon,  5 Apr 2021 16:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241315AbhDEOWO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 5 Apr 2021 10:22:14 -0400
Received: from mga11.intel.com ([192.55.52.93]:38358 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237153AbhDEOWN (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 5 Apr 2021 10:22:13 -0400
IronPort-SDR: rquCAivEJ/yAli8DOyvLTnR2fXzwENod8cuKAO//rQwx/M71RVlFlr7Fvx98kmMcNIKbgSDO6j
 jZyoCR34KTaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="189637708"
X-IronPort-AV: E=Sophos;i="5.81,306,1610438400"; 
   d="scan'208";a="189637708"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2021 07:22:07 -0700
IronPort-SDR: 50MggmoG8EKxbZ7H4kH5jmAefahQMxNPbatpOiwP9kuQC6TIncPVKmK28dmIBuekeft/sa2J18
 54V0gjAARyHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,306,1610438400"; 
   d="scan'208";a="612164467"
Received: from nsathish-latitude-7480.iind.intel.com ([10.224.186.105])
  by fmsmga005.fm.intel.com with ESMTP; 05 Apr 2021 07:22:05 -0700
From:   Sathish Narasimman <sathish.narasimman@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     chethan.tumkur.narayan@intel.com, ravishankar.srivatsa@intel.com,
        Sathish Narasimman <sathish.narasimman@intel.com>
Subject: [PATCH 2/2] Bluetooth: LL privacy allow RPA
Date:   Mon,  5 Apr 2021 20:00:41 +0530
Message-Id: <20210405143041.16168-1-sathish.narasimman@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

allow RPA to add bd address to whitelist

Signed-off-by: Sathish Narasimman <sathish.narasimman@intel.com>
---
 net/bluetooth/hci_request.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index 0d78122342d5..560b74d421a8 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -847,6 +847,10 @@ static u8 update_white_list(struct hci_request *req)
 	 */
 	bool allow_rpa = hdev->suspended;
 
+	if (use_ll_privacy(hdev) &&
+	    hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
+		allow_rpa = true;
+
 	/* Go through the current white list programmed into the
 	 * controller one by one and check if that address is still
 	 * in the list of pending connections or list of devices to
-- 
2.17.1

