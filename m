Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B257F1EF139
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Jun 2020 08:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgFEGKU (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 5 Jun 2020 02:10:20 -0400
Received: from mga05.intel.com ([192.55.52.43]:34047 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726134AbgFEGKU (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 5 Jun 2020 02:10:20 -0400
IronPort-SDR: G5G1nqZ8za7bA59BtqX+A1LloDzi5E5TChuxYxP9tAcSNjYYZQ+tJ504aH/hpd9dYgmwj90gVg
 ec/v+hEebJEA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 23:10:19 -0700
IronPort-SDR: 0My1/piLiFuu92wfirrGWdNGlqUAZRPWoXkWhigbeIBlKsiTtoo0hLfavcRPvfO8VQFbgOLuwn
 uzvfb8MmSD5Q==
X-IronPort-AV: E=Sophos;i="5.73,475,1583222400"; 
   d="scan'208";a="257942456"
Received: from mdhakni-mobl.amr.corp.intel.com (HELO han1-mobl3.jf.intel.com) ([10.254.69.252])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 23:10:19 -0700
From:   Tedd Ho-Jeong An <tedd.an@linux.intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Tedd Ho-Jeong An <tedd.an@intel.com>
Subject: [PATCH V2 1/2] btp: Update connect event structure
Date:   Thu,  4 Jun 2020 23:10:02 -0700
Message-Id: <20200605061003.14634-1-tedd.an@linux.intel.com>
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

  This event indicates that a device was connected.
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

