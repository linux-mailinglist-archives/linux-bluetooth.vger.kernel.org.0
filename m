Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 388FB102EA2
	for <lists+linux-bluetooth@lfdr.de>; Tue, 19 Nov 2019 22:52:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbfKSVwh (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 19 Nov 2019 16:52:37 -0500
Received: from mga02.intel.com ([134.134.136.20]:30450 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727007AbfKSVwh (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 19 Nov 2019 16:52:37 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Nov 2019 13:52:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,219,1571727600"; 
   d="scan'208";a="357238373"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.254.179.224])
  by orsmga004.jf.intel.com with ESMTP; 19 Nov 2019 13:52:36 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com, aurelien@aurel32.net
Subject: [PATCH BlueZ v3 0/2] mesh: Fix inOOB and outOOB issues
Date:   Tue, 19 Nov 2019 13:52:25 -0800
Message-Id: <20191119215227.27730-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Version 3 of this patch-set addresses problem found by Aurelien
regarding the action string passed to the external agent collecting
alpha-numeric strings on "out-alpha" prompts.

This fix therefore now differentiates alphanumeric collection due to
"in-alpha" (acceptor role) from "out-alpha" (initiator role).

Brian Gix (1):
  mesh: Fix inOOB and outOOB agent handling on prov initiate

Inga Stotland (1):
  tools/mesh-cfgclient: Add full support inOOB and outOOB

 mesh/agent.c           |  28 ++++---
 mesh/agent.h           |   4 +-
 mesh/prov-acceptor.c   |   2 +-
 mesh/prov-initiator.c  |  71 +++++++++++++---
 tools/mesh-cfgclient.c | 178 ++++++++++++++++++++++++++++++++++-------
 tools/mesh-gatt/prov.c |   9 ++-
 tools/mesh/agent.c     |  21 +++--
 tools/mesh/agent.h     |   4 +-
 8 files changed, 249 insertions(+), 68 deletions(-)

-- 
2.21.0

