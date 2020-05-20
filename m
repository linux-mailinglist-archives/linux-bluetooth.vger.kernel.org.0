Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAD801DB92E
	for <lists+linux-bluetooth@lfdr.de>; Wed, 20 May 2020 18:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgETQUK (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 20 May 2020 12:20:10 -0400
Received: from mga06.intel.com ([134.134.136.31]:55518 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726737AbgETQUJ (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 20 May 2020 12:20:09 -0400
IronPort-SDR: FlE4dSmMz+cM8RQ8GEe/nULJc4D/0Y0toGbZsSrydhhWAIQUCB9lbIF+GhhArtj1wRnoaOre6H
 Nm9CRMggBMkA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2020 09:20:09 -0700
IronPort-SDR: hqvBZ+DoVYSLdd6aiynhfi98Pj8KMisF5LMDILIrFdbCud/qslcbAIQGdS/hHPEGLlIJFXdpU4
 8EG0uNCkh0RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; 
   d="scan'208";a="466582009"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.254.66.90])
  by fmsmga006.fm.intel.com with ESMTP; 20 May 2020 09:20:08 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com,
        michal.lowas-rzechonek@silvair.com
Subject: [PATCH BlueZ v2 0/1] mesh: firx double-free
Date:   Wed, 20 May 2020 09:20:04 -0700
Message-Id: <20200520162005.838134-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

v1: corrected the double-free

v2: Sets a single free point for node->cfg data, and reduce the scope
and rename mesh_config_destroy() to mesh_release_nvm(). This is cleaner
because all node dynamic resources are discarded elsewhere, and should
not be combined with releasing of NVM.


Brian Gix (1):
  mesh: Fix double-free

 mesh/mesh-config-json.c | 2 +-
 mesh/mesh-config.h      | 2 +-
 mesh/node.c             | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.25.4

