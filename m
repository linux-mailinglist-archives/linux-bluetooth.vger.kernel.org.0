Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5A6A57A04
	for <lists+linux-bluetooth@lfdr.de>; Thu, 27 Jun 2019 05:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfF0DdZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 26 Jun 2019 23:33:25 -0400
Received: from mga12.intel.com ([192.55.52.136]:10350 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726447AbfF0DdZ (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 26 Jun 2019 23:33:25 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jun 2019 20:33:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,422,1557212400"; 
   d="scan'208";a="164586086"
Received: from ingas-nuc1.sea.intel.com ([10.255.82.90])
  by orsmga003.jf.intel.com with ESMTP; 26 Jun 2019 20:33:23 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/4] Model publication fixes
Date:   Wed, 26 Jun 2019 20:33:16 -0700
Message-Id: <20190627033320.8898-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This set of patches cleans up miscellaneous code redundancies in model.c,
fixes virtual address labels housekeeping, fixes checks for model
publication removal (i.e., for unassigned address in the config message),
fixes return values (few cases where an integer error code is to be
returned, but boolean "false" was returned instead)


Inga Stotland (4):
  mesh: Clean up model.c and cfg-server.c
  mesh: Fix virtual address processing
  mesh: Fix and clean up model publicaation code
  test: test-mesh - Correctly stop periodic publication

 mesh/cfgmod-server.c |  47 +++---
 mesh/model.c         | 360 ++++++++++++++++++-------------------------
 mesh/model.h         |  38 ++---
 test/test-mesh       |   8 +-
 4 files changed, 187 insertions(+), 266 deletions(-)

-- 
2.21.0

