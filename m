Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F10A1B8259
	for <lists+linux-bluetooth@lfdr.de>; Sat, 25 Apr 2020 01:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgDXXKe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 24 Apr 2020 19:10:34 -0400
Received: from mga03.intel.com ([134.134.136.65]:34900 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbgDXXKd (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 24 Apr 2020 19:10:33 -0400
IronPort-SDR: bElIDXd/vq1Pgj6ZJm9vBm/z8WDMYRTP0S3xzfticAJ4d8/pPsNknZdlgg60B60E0Fal5y8oY+
 atH4n9h62zJQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2020 16:10:33 -0700
IronPort-SDR: IV4lLhoPiYVCrXgfAtbmtjYHZ3bUHNY1npTm8hcUMWLGSHLxZAhpGt9svZ/7OvIxaB0tKSzLHx
 teONCnNPiISA==
X-IronPort-AV: E=Sophos;i="5.73,313,1583222400"; 
   d="scan'208";a="458087387"
Received: from han1-mobl3.jf.intel.com ([10.54.74.15])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2020 16:10:33 -0700
From:   Tedd Ho-Jeong An <tedd.an@linux.intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Tedd Ho-Jeong An <tedd.an@linux.intel.com>
Subject: [PATCH 2/3] Test patch #2: CODE_INDENT, LEADING_SPACE
Date:   Fri, 24 Apr 2020 16:10:25 -0700
Message-Id: <20200424231026.127164-2-tedd.an@linux.intel.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200424231026.127164-1-tedd.an@linux.intel.com>
References: <20200424231026.127164-1-tedd.an@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

DO NOT MERGE

Test patch #2
---
 tools/btpclient.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/btpclient.c b/tools/btpclient.c
index aa8a2bae4..7248acc2a 100644
--- a/tools/btpclient.c
+++ b/tools/btpclient.c
@@ -62,7 +62,7 @@ struct btp_adapter {
 	uint32_t supported_settings;
 	uint32_t current_settings;
 	uint32_t default_settings;
-	struct l_queue *devices;
+        struct l_queue *devices;
 };
 
 struct btp_device {
-- 
2.25.3

