Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8168C166CC3
	for <lists+linux-bluetooth@lfdr.de>; Fri, 21 Feb 2020 03:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729429AbgBUCSM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 20 Feb 2020 21:18:12 -0500
Received: from mga04.intel.com ([192.55.52.120]:20563 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728992AbgBUCSM (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 20 Feb 2020 21:18:12 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Feb 2020 18:18:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,466,1574150400"; 
   d="scan'208";a="230313302"
Received: from ingas-nuc1.sea.intel.com ([10.254.187.96])
  by fmsmga008.fm.intel.com with ESMTP; 20 Feb 2020 18:18:12 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/4] mesh: Support for virtual labels
Date:   Thu, 20 Feb 2020 18:18:07 -0800
Message-Id: <20200221021811.30408-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch set adds a capability to mesh-cfgclient to generate
and store virtual labels and use them in configuring remote
node's publications and subscriptions.
Regular group addresses are preeserved as well. This is done
dynamically: as a new group address is detected in either
subscription or publication configuration commands.

This new capability of mesh-cfgclient allowed for improved
testing of virtual pub/sub implementation in bluetooth-meshd
daemon. As a result, some deficiencies and legacy entaglements
were exposed, and consequently resolved and cleaned up.

Inga Stotland (4):
  tools/mesh-cfgclient: Add support for virtual labels
  tools/mesh-cfgclient: Save and restore group addresses
  mesh: Simplify model virtual pub/sub logic
  mesh: Clean up handling config model publication message

 Makefile.tools       |   3 +-
 mesh/cfgmod-server.c | 131 ++++++++--------------
 mesh/model.c         | 258 +++++++++++++++++--------------------------
 mesh/model.h         |   9 +-
 tools/mesh/cfgcli.c  | 206 +++++++++++++++++++++++++++++++---
 tools/mesh/cfgcli.h  |   6 +
 tools/mesh/mesh-db.c | 123 +++++++++++++++++++++
 tools/mesh/mesh-db.h |   3 +
 8 files changed, 471 insertions(+), 268 deletions(-)

-- 
2.21.1

