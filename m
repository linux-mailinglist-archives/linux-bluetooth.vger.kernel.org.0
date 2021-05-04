Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E113A372863
	for <lists+linux-bluetooth@lfdr.de>; Tue,  4 May 2021 12:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbhEDKBm (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 4 May 2021 06:01:42 -0400
Received: from mga18.intel.com ([134.134.136.126]:12059 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230086AbhEDKBZ (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 4 May 2021 06:01:25 -0400
IronPort-SDR: yatosVXEwteQCw6C2TP83zsnWOJHS+Hr1/iG7Q3W8pKCPclH2X5kNdJKq2kuqcQf9DXPJrwukp
 UcmsveWgCNog==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="185413021"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; 
   d="scan'208";a="185413021"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2021 02:59:44 -0700
IronPort-SDR: hI5UAwaod2LEFcYfYIZ3ZKpqR3Le8ux0akP0+yksNaa+1NWxrAffyh/9J8QzQadDQEQCpUSASz
 lTlzIMCgFHdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; 
   d="scan'208";a="621473788"
Received: from nsathish-latitude-7480.iind.intel.com ([10.224.186.105])
  by fmsmga005.fm.intel.com with ESMTP; 04 May 2021 02:59:42 -0700
From:   Sathish Narasimman <sathish.narasimman@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     chethan.tumkur.narayan@intel.com, ravishankar.srivatsa@intel.com,
        Sathish Narasimman <sathish.narasimman@intel.com>
Subject: [Bluez PATCH v1] btmgmt: Fix enable adding irk when turining privacy on.
Date:   Tue,  4 May 2021 15:38:35 +0530
Message-Id: <20210504100835.29468-1-sathish.narasimman@intel.com>
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

