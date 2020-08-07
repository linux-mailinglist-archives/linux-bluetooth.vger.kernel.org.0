Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6D9723E571
	for <lists+linux-bluetooth@lfdr.de>; Fri,  7 Aug 2020 03:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgHGBRS (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 6 Aug 2020 21:17:18 -0400
Received: from mga03.intel.com ([134.134.136.65]:31449 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726011AbgHGBRR (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 6 Aug 2020 21:17:17 -0400
IronPort-SDR: 4Xl6Mxuh/9QT3TRdO+c5WNtylrHhH8AVqnr0KZeSgEfsSd9DChMEMGOCC3QyM3GDkiXwfpll4Z
 QM8vN25BGiTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="152936389"
X-IronPort-AV: E=Sophos;i="5.75,443,1589266800"; 
   d="scan'208";a="152936389"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2020 18:17:17 -0700
IronPort-SDR: DP1DyI2ODBaJ+3qBH9KLl0Cvg0eBTyQdicr0t2i0bxs70uFDYmOM1VDdulHeNSUIDMXIzwtGcS
 jD8SlysRmWDw==
X-IronPort-AV: E=Sophos;i="5.75,443,1589266800"; 
   d="scan'208";a="493876844"
Received: from apazhamp-mobl.amr.corp.intel.com (HELO han1-mobl3.jf.intel.com) ([10.254.82.188])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2020 18:17:16 -0700
From:   tedd.an@linux.intel.com
To:     linux-bluetooth@vger.kernel.org
Cc:     Tedd Ho-Jeong An <tedd.an@intel.com>
Subject: [PATCH 1/3] btp: Update connect event structure
Date:   Thu,  6 Aug 2020 18:17:01 -0700
Message-Id: <20200807011703.22087-1-tedd.an@linux.intel.com>
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

