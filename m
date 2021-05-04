Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7178F37284F
	for <lists+linux-bluetooth@lfdr.de>; Tue,  4 May 2021 11:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbhEDJvh (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 4 May 2021 05:51:37 -0400
Received: from mga14.intel.com ([192.55.52.115]:14685 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230089AbhEDJvg (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 4 May 2021 05:51:36 -0400
IronPort-SDR: xRROuAbED/l+0FOZQydciOXSAkljZyh4lkTD/BiSW1OLNimVBTMaVd6CY7kWjO4SlPphsthxSj
 +uf43PQWTtAw==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="197557524"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; 
   d="scan'208";a="197557524"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2021 02:50:42 -0700
IronPort-SDR: rL4skt6U0SxG52HJP1MC+uW90TOX3BYKo33KE0Yvwm3k5r2oI1J3o32I/7AihWna700I0vrHAv
 A9/gO8FWFJjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; 
   d="scan'208";a="463088572"
Received: from nsathish-latitude-7480.iind.intel.com ([10.224.186.105])
  by fmsmga002.fm.intel.com with ESMTP; 04 May 2021 02:50:40 -0700
From:   Sathish Narasimman <sathish.narasimman@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     chethan.tumkur.narayan@intel.com, ravishankar.srivatsa@intel.com,
        Sathish Narasimman <sathish.narasimman@intel.com>
Subject: [PATCH] btmgmt: Fix enable adding irk when turining privacy on.
Date:   Tue,  4 May 2021 15:29:27 +0530
Message-Id: <20210504095927.29393-1-sathish.narasimman@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Unable to add the IRK in btmgmt when need to be updated. The option is
enabled now.

Signed-off-by: Sathish Narasimman <sathish.narasimman@intel.com>
---
 tools/btmgmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/btmgmt.c b/tools/btmgmt.c
index 02fec1dca184..bf3b460d0f04 100644
--- a/tools/btmgmt.c
+++ b/tools/btmgmt.c
@@ -5277,7 +5277,7 @@ static const struct bt_shell_menu main_menu = {
 	cmd_advertising,		"Toggle LE advertising",	},
 	{ "bredr",		"<on/off>",
 		cmd_bredr,		"Toggle BR/EDR support",	},
-	{ "privacy",		"<on/off>",
+	{ "privacy",		"<on/off> [irk]",
 		cmd_privacy,		"Toggle privacy support"	},
 	{ "class",		"<major> <minor>",
 		cmd_class,		"Set device major/minor class"	},
-- 
2.17.1

