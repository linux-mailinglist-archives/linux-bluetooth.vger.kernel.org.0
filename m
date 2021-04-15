Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4855C36014E
	for <lists+linux-bluetooth@lfdr.de>; Thu, 15 Apr 2021 07:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhDOFES (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 15 Apr 2021 01:04:18 -0400
Received: from mga03.intel.com ([134.134.136.65]:61646 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229973AbhDOFEQ (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 15 Apr 2021 01:04:16 -0400
IronPort-SDR: kVmcZU/a/0l/S5njz6exa9cLZDH7yDqLeioodso+Eux9FM2T0JYM9zbhIuaPKLmJ3RGyISaWz0
 RgsdomYe1jYA==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="194811737"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="194811737"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 22:03:54 -0700
IronPort-SDR: Zflic4OeiGAukdM/Jk3dnTLRQkad64ieUkIFENKFDwzGQTp5n9VD6FW2SHR4VAssxhi+7RvE47
 mSMFljLSfOqg==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="421570739"
Received: from kkomiris-mobl.amr.corp.intel.com (HELO istotlan-desk.intel.com) ([10.251.25.8])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 22:03:54 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] shared/timeout-ell: Fix timeout_add() implementation
Date:   Wed, 14 Apr 2021 22:03:47 -0700
Message-Id: <20210415050347.253831-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Since timeout_add() expects the timeout in milliseconds, the correct
ELL primitive to call is l_timeout_create_ms()
---
 src/shared/timeout-ell.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/shared/timeout-ell.c b/src/shared/timeout-ell.c
index 6416d8590..026286926 100644
--- a/src/shared/timeout-ell.c
+++ b/src/shared/timeout-ell.c
@@ -68,7 +68,7 @@ unsigned int timeout_add(unsigned int timeout, timeout_func_t func,
 	data->timeout = timeout;
 
 	while (id == 0 && tries < 3) {
-		to = l_timeout_create(timeout, timeout_callback,
+		to = l_timeout_create_ms(timeout, timeout_callback,
 							data, timeout_destroy);
 		if (!to)
 			break;
-- 
2.26.3

