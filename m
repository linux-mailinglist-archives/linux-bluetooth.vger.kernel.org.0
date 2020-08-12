Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA623243037
	for <lists+linux-bluetooth@lfdr.de>; Wed, 12 Aug 2020 22:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgHLUtk (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 12 Aug 2020 16:49:40 -0400
Received: from mga18.intel.com ([134.134.136.126]:41644 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726282AbgHLUtk (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 12 Aug 2020 16:49:40 -0400
IronPort-SDR: HNuIpzlUtEa25JT9khlacIX5t3P67npAtFRizqW+eniKW/KDHcbHXWcbXx2CBJDdw80FGg+8Ln
 AL5OYfuM5WQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9711"; a="141695141"
X-IronPort-AV: E=Sophos;i="5.76,305,1592895600"; 
   d="scan'208";a="141695141"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2020 13:49:40 -0700
IronPort-SDR: iW19ueYDiZLNg7Max9fMuQFCCJ2zYgzNvte/+Y9RE8ecToYnw7DkHMxu5qBq3Zdr9f0G5NVJCZ
 ajrsRpqd+BWQ==
X-IronPort-AV: E=Sophos;i="5.76,305,1592895600"; 
   d="scan'208";a="276669179"
Received: from kwang8-mobl1.amr.corp.intel.com (HELO han1-mobl3.jf.intel.com) ([10.254.80.72])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2020 13:49:39 -0700
From:   tedd.an@linux.intel.com
To:     linux-bluetooth@vger.kernel.org
Cc:     Tedd Ho-Jeong An <tedd.an@intel.com>
Subject: [V2 1/3] btp: Update connect event structure
Date:   Wed, 12 Aug 2020 13:49:30 -0700
Message-Id: <20200812204932.25627-1-tedd.an@linux.intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Tedd Ho-Jeong An <tedd.an@intel.com>

This patch updates the connect event struct to align withe the btp spec.

 Opcode 0x82 - Device Connected event
    Controller Index:   <controller id>
    Event parameters:   Address_Type (1 octet)
                        Address (6 octets)
                        Connection Interval (2 octets)
                        Connection Latency (2 octets)
                        Supervision Timeout (2 octets)
---
 src/shared/btp.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/shared/btp.h b/src/shared/btp.h
index f0ac3a1ee..cc71a71df 100644
--- a/src/shared/btp.h
+++ b/src/shared/btp.h
@@ -259,6 +259,9 @@ struct btp_device_found_ev {
 struct btp_gap_device_connected_ev {
 	uint8_t address_type;
 	bdaddr_t address;
+	uint16_t connection_interval;
+	uint16_t connection_latency;
+	uint16_t supervision_timeout;
 } __packed;
 
 #define BTP_EV_GAP_DEVICE_DISCONNECTED		0x83
-- 
2.25.4

