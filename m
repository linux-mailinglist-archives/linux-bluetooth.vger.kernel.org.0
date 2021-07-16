Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39FCB3CBCC6
	for <lists+linux-bluetooth@lfdr.de>; Fri, 16 Jul 2021 21:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbhGPTmh (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 16 Jul 2021 15:42:37 -0400
Received: from mga05.intel.com ([192.55.52.43]:58160 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233094AbhGPTme (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 16 Jul 2021 15:42:34 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="296425609"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; 
   d="scan'208";a="296425609"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2021 12:39:37 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; 
   d="scan'208";a="431316674"
Received: from landruma-mobl.amr.corp.intel.com (HELO bgi1-mobl2.amr.corp.intel.com) ([10.212.217.108])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2021 12:39:37 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org, hj.tedd.an@gmail.com,
        brian.gix@intel.com
Subject: [PATCH BlueZ v2 3/3] tool/mgmt-tester: Add fail_tolerant exception
Date:   Fri, 16 Jul 2021 12:39:32 -0700
Message-Id: <20210716193932.2939264-3-brian.gix@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210716193932.2939264-1-brian.gix@intel.com>
References: <20210716193932.2939264-1-brian.gix@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Race conditions with the cmd-sync changes can cause fail status codes to
be different than originally expected. New test parameter fail_tolerant
allows a trivial fail-code mismatches to "Pass" while also warning that
the status wasn't exactly as expected.
---
 tools/mgmt-tester.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/mgmt-tester.c b/tools/mgmt-tester.c
index bd581874e..e369d7488 100644
--- a/tools/mgmt-tester.c
+++ b/tools/mgmt-tester.c
@@ -302,6 +302,7 @@ struct generic_data {
 	bool expect_sc_key;
 	bool force_power_off;
 	bool addr_type_avail;
+	bool fail_tolerant;
 	uint8_t addr_type;
 	bool set_adv;
 	const uint8_t *adv_data;
@@ -4063,6 +4064,7 @@ static const struct generic_data get_conn_info_power_off_test = {
 	.force_power_off = true,
 	.expect_status = MGMT_STATUS_NOT_POWERED,
 	.expect_func = get_conn_info_expect_param_power_off_func,
+	.fail_tolerant = true,
 };
 
 static const uint8_t load_conn_param_nval_1[16] = { 0x12, 0x11 };
@@ -7038,8 +7040,13 @@ static void command_generic_callback(uint8_t status, uint16_t length,
 			test->send_opcode, mgmt_errstr(status), status);
 
 	if (status != test->expect_status) {
-		tester_test_abort();
-		return;
+		if (!test->fail_tolerant || !!status != !!test->expect_status) {
+			tester_test_abort();
+			return;
+		}
+
+		tester_warn("Unexpected status got %d expected %d",
+						status, test->expect_status);
 	}
 
 	if (!test->expect_ignore_param) {
-- 
2.31.1

