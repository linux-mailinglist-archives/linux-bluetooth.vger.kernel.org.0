Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE43FE883
	for <lists+linux-bluetooth@lfdr.de>; Sat, 16 Nov 2019 00:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbfKOXRL (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 15 Nov 2019 18:17:11 -0500
Received: from mga12.intel.com ([192.55.52.136]:62382 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727021AbfKOXRL (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 15 Nov 2019 18:17:11 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Nov 2019 15:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,310,1569308400"; 
   d="scan'208";a="288694593"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.252.205.168])
  by orsmga001.jf.intel.com with ESMTP; 15 Nov 2019 15:17:10 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com, aurelien@aurel32.net
Subject: [PATCH BlueZ v2 0/2] mesh: Fix inOOB and outOOB issues
Date:   Fri, 15 Nov 2019 15:17:03 -0800
Message-Id: <20191115231705.5596-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patchset includes modification to both the Daemon and the
mesh-cfgclient.  All of the inOOB and outOOB scenarios have been tested,
and are working according to the Bluetooth Profile specification, for
the Provisioner "Initiator" role.

Brian Gix (1):
  mesh: Fix inOOB and outOOB agent handling on prov initiate

Inga Stotland (1):
  tools/mesh-cfgclient: Add full support inOOB and outOOB

 mesh/agent.c           |  12 +--
 mesh/prov-initiator.c  |  69 +++++++++++++---
 tools/mesh-cfgclient.c | 178 ++++++++++++++++++++++++++++++++++-------
 tools/mesh-gatt/prov.c |   9 ++-
 tools/mesh/agent.c     |  21 +++--
 tools/mesh/agent.h     |   4 +-
 6 files changed, 233 insertions(+), 60 deletions(-)

-- 
2.21.0

