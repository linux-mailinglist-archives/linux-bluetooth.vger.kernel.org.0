Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7732558E22
	for <lists+linux-bluetooth@lfdr.de>; Fri, 28 Jun 2019 00:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbfF0Wsr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 27 Jun 2019 18:48:47 -0400
Received: from mga17.intel.com ([192.55.52.151]:6157 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbfF0Wsr (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 27 Jun 2019 18:48:47 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Jun 2019 15:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,425,1557212400"; 
   d="scan'208";a="183556388"
Received: from ingas-nuc1.sea.intel.com ([10.252.196.161])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2019 15:48:46 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, michal.lowas-rzechonek@silvair.com,
        Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/4 v2] Model publication fixes
Date:   Thu, 27 Jun 2019 15:48:41 -0700
Message-Id: <20190627224845.20762-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

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
  mesh: Fix and clean up model publicaation code
  test: test-mesh - Correctly stop periodic publication

 mesh/cfgmod-server.c |  47 +++---
 mesh/model.c         | 364 ++++++++++++++++++-------------------------
 mesh/model.h         |  38 ++---
 test/test-mesh       |   8 +-
 4 files changed, 189 insertions(+), 268 deletions(-)

-- 
2.21.0

