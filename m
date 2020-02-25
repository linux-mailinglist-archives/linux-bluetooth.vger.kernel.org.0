Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90D0816B6E3
	for <lists+linux-bluetooth@lfdr.de>; Tue, 25 Feb 2020 01:51:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728516AbgBYAvo (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 24 Feb 2020 19:51:44 -0500
Received: from mga14.intel.com ([192.55.52.115]:60206 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727976AbgBYAvn (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 24 Feb 2020 19:51:43 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 16:51:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,482,1574150400"; 
   d="scan'208";a="436095365"
Received: from ingas-nuc1.sea.intel.com ([10.251.142.189])
  by fmsmga005.fm.intel.com with ESMTP; 24 Feb 2020 16:51:42 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/5 v2] Support for virtual labels
Date:   Mon, 24 Feb 2020 16:51:35 -0800
Message-Id: <20200225005141.9700-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

v2: Fixed a  backwards compatibility issue reported by Brian;
    Fixed Python test to correctly display updated configuration


*****************************
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


Inga Stotland (5):
  tools/mesh-cfgclient: Add support for virtual labels
  tools/mesh-cfgclient: Save and restore group addresses
  mesh: Simplify model virtual pub/sub logic
  mesh: Clean up handling config model publication message
  test/test-mesh: Fix output of UpdateModelConfig method

 Makefile.tools       |   3 +-
 mesh/cfgmod-server.c | 131 ++++++++--------------
 mesh/model.c         | 258 +++++++++++++++++--------------------------
 mesh/model.h         |   9 +-
 test/test-mesh       |  11 +-
 tools/mesh/cfgcli.c  | 202 ++++++++++++++++++++++++++++++---
 tools/mesh/cfgcli.h  |   5 +
 tools/mesh/mesh-db.c | 128 +++++++++++++++++++++
 tools/mesh/mesh-db.h |   4 +
 9 files changed, 480 insertions(+), 271 deletions(-)

-- 
2.21.1

