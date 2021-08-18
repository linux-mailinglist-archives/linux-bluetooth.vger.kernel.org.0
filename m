Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99C6A3EFA65
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Aug 2021 07:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237887AbhHRF4H (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 18 Aug 2021 01:56:07 -0400
Received: from mga02.intel.com ([134.134.136.20]:1998 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237788AbhHRF4D (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 18 Aug 2021 01:56:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="203455435"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="203455435"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2021 22:55:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="641211690"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by orsmga005.jf.intel.com with ESMTP; 17 Aug 2021 22:55:27 -0700
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, Kiran K <kiran.k@intel.com>
Subject: [PATCH v3 2/2] shared/util: Decode BlueZ offload codec UUID
Date:   Wed, 18 Aug 2021 11:29:48 +0530
Message-Id: <20210818055948.22616-2-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818055948.22616-1-kiran.k@intel.com>
References: <20210818055948.22616-1-kiran.k@intel.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This adds BlueZ offload codec UUID to uuid128_table so it is
decoded by the likes of btmon.
---
 src/shared/util.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/shared/util.c b/src/shared/util.c
index 854b48d38f09..2447564566ce 100644
--- a/src/shared/util.c
+++ b/src/shared/util.c
@@ -1027,6 +1027,7 @@ static const struct {
 		"BlueZ Experimental LL privacy" },
 	{ "330859bc-7506-492d-9370-9a6f0614037f",
 		"BlueZ Experimental Bluetooth Quality Report" },
+	{ "a6695ace-ee7f-4fb9-881a-5fac66c629af", "BlueZ Offload Codecs"},
 	{ }
 };
 
-- 
2.17.1

