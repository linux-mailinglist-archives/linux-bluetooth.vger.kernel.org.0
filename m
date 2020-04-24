Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB81D1B825C
	for <lists+linux-bluetooth@lfdr.de>; Sat, 25 Apr 2020 01:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgDXXKt (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 24 Apr 2020 19:10:49 -0400
Received: from mga06.intel.com ([134.134.136.31]:53475 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbgDXXKs (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 24 Apr 2020 19:10:48 -0400
IronPort-SDR: y+TBCLh8YpoWyply/a0pdZ9xkv/J709ViH8abDxSp/hgI+4lzq3t0u/F4R4zuhArDdMBgd5UaS
 5B/9sMWZqAEA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2020 16:10:48 -0700
IronPort-SDR: 5iDSxUQBU9rpIrvXQjKpDZj6w2XSHw827/D2M1v9kf6GHyR0Qwgqnlh2Bi6tpGJqsdhf2yeNZd
 VFWdPFAuZt6Q==
X-IronPort-AV: E=Sophos;i="5.73,313,1583222400"; 
   d="scan'208";a="274776829"
Received: from han1-mobl3.jf.intel.com ([10.54.74.15])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2020 16:10:48 -0700
From:   Tedd Ho-Jeong An <tedd.an@linux.intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Tedd Ho-Jeong An <tedd.an@linux.intel.com>
Subject: [PATCH] Test patch: build fail
Date:   Fri, 24 Apr 2020 16:10:42 -0700
Message-Id: <20200424231042.127237-1-tedd.an@linux.intel.com>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

DO NOT MERGE
---
 tools/btpclient.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/btpclient.c b/tools/btpclient.c
index f9c693056..04c83f6ae 100644
--- a/tools/btpclient.c
+++ b/tools/btpclient.c
@@ -3215,7 +3215,7 @@ int main(int argc, char *argv[])
 
 	l_free(socket_path);
 
-	l_main_exit();
+	l_main_exit()
 
 	return EXIT_SUCCESS;
 }
-- 
2.25.3

