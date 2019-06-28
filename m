Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41D635A756
	for <lists+linux-bluetooth@lfdr.de>; Sat, 29 Jun 2019 01:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbfF1XBo (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 28 Jun 2019 19:01:44 -0400
Received: from mga06.intel.com ([134.134.136.31]:53752 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726672AbfF1XBo (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 28 Jun 2019 19:01:44 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Jun 2019 16:01:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,429,1557212400"; 
   d="scan'208";a="314271642"
Received: from ingas-nuc1.sea.intel.com ([10.252.196.161])
  by orsmga004.jf.intel.com with ESMTP; 28 Jun 2019 16:01:43 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/4 v3] Model publication fixes
Date:   Fri, 28 Jun 2019 16:01:38 -0700
Message-Id: <20190628230142.16367-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

+ A workaround for (bogus) compiler warning, plus commit text fixes
+ Michal's comment: variable naming

This set of patches cleans up miscellaneous code redundancies in model.c
and contains fixes in the following areas:
- virtual address housekeeping
- checks for model publication removal, i.e., when config pub message has
  "unassigned" value for publication address 
- return values discrepancies (few cases where an integer error code is
  to be returned, but boolean false was returned instead)

Inga Stotland (4):
  mesh: Clean up model.c and cfg-server.c
  mesh: Fix virtual address processing
  mesh: Fix and clean up model publication code
  test: test-mesh - Correctly stop periodic publication

 mesh/cfgmod-server.c |  47 +++---
 mesh/model.c         | 366 ++++++++++++++++++-------------------------
 mesh/model.h         |  38 ++---
 test/test-mesh       |   8 +-
 4 files changed, 190 insertions(+), 269 deletions(-)

-- 
2.21.0

