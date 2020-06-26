Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCF520A97E
	for <lists+linux-bluetooth@lfdr.de>; Fri, 26 Jun 2020 02:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgFZACW (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 25 Jun 2020 20:02:22 -0400
Received: from mga04.intel.com ([192.55.52.120]:11173 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726061AbgFZACW (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 25 Jun 2020 20:02:22 -0400
IronPort-SDR: yNfaRnewle2pHeZgCcgz+zBLxJbNuofr0/3acxKfc1wQ54TgozRA405CS8vA6KVXG1AkFP1jmK
 5gN7v+2SNEaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="142634088"
X-IronPort-AV: E=Sophos;i="5.75,281,1589266800"; 
   d="scan'208";a="142634088"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2020 17:02:21 -0700
IronPort-SDR: rcjBeEG7DTaAkCeG6gO232pKRI/6ahh/Yjjq7el6PJIRhHFEXecSjYIzjJIGg7rgGiQmQXPdlk
 XHrRUVVxphUQ==
X-IronPort-AV: E=Sophos;i="5.75,281,1589266800"; 
   d="scan'208";a="479822520"
Received: from han1-xps-13-9350.jf.intel.com ([10.54.74.33])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2020 17:02:20 -0700
Message-ID: <37bbc9912da0efcf5e7afd252eba90309f53c79a.camel@linux.intel.com>
Subject: [BlueZ PATCH V2] btp: Update connect event structure
From:   Tedd Ho-Jeong An <tedd.an@linux.intel.com>
To:     Linux Bluetooth Mailing List <linux-bluetooth@vger.kernel.org>
Date:   Thu, 25 Jun 2020 17:02:19 -0700
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
2.17.1


