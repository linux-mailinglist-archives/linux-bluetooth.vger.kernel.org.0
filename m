Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAA6A21E36C
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 Jul 2020 01:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgGMXFa (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 13 Jul 2020 19:05:30 -0400
Received: from mga06.intel.com ([134.134.136.31]:39333 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726352AbgGMXFa (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 13 Jul 2020 19:05:30 -0400
IronPort-SDR: 62StNtStyf++ANDxVtnwWrAAV52EPDMHGqC/bBDWvh/rMEDESreFNEeaCXvR+hrNa0AE4uhTRL
 RtQgVQhMYPSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="210285807"
X-IronPort-AV: E=Sophos;i="5.75,349,1589266800"; 
   d="scan'208";a="210285807"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2020 16:05:29 -0700
IronPort-SDR: 3VsUlibAzn2f3pvQ3VSnU/R7Rj+oUZgMHMgwZMLtTALiDpT4fQnyKmjoW970fzGlpAh1kjzlkX
 o3gUhmXBxjQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,349,1589266800"; 
   d="scan'208";a="459465770"
Received: from unknown (HELO ingas-nuc1.intel.com) ([10.254.112.118])
  by orsmga005.jf.intel.com with ESMTP; 13 Jul 2020 16:05:29 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/3] Code re-org and clean up
Date:   Mon, 13 Jul 2020 16:05:25 -0700
Message-Id: <20200713230528.107948-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch set is part of the on-going  clean up effort that targets some
of more convoluted areas of meshd source code.
The patchset provides better functional separation, smaller function
granularity and better memory handling.

Inga Stotland (3):
  mesh: Use static array to hold config server response
  mesh: Add size checks for every opcode in config server
  mesh: move model functionality out of node.c to model.c

 mesh/cfgmod-server.c    |  99 ++++++-----
 mesh/cfgmod.h           |   4 +-
 mesh/mesh-config-json.c |   5 +-
 mesh/model.c            | 359 +++++++++++++++++++++++++++++++++-------
 mesh/model.h            |  32 ++--
 mesh/node.c             | 286 ++++----------------------------
 6 files changed, 403 insertions(+), 382 deletions(-)

-- 
2.26.2

