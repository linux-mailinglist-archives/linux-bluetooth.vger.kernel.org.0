Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D83AD184E5E
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Mar 2020 19:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgCMSIj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 13 Mar 2020 14:08:39 -0400
Received: from mga06.intel.com ([134.134.136.31]:26967 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726480AbgCMSIi (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 13 Mar 2020 14:08:38 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Mar 2020 11:08:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,549,1574150400"; 
   d="scan'208";a="266811405"
Received: from ingas-nuc1.sea.intel.com ([10.251.23.252])
  by fmsmga004.fm.intel.com with ESMTP; 13 Mar 2020 11:08:37 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/2] Remote node reset implementation
Date:   Fri, 13 Mar 2020 11:08:34 -0700
Message-Id: <20200313180836.23227-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This set of patches provides complete implementation of sending
and processing of Config Node Reset and Config Node Reset Status
messages

Inga Stotland (2):
  tools/mesh-cfgclient: Implement node-reset command
  mesh: Fix processing of Config Node Reset message

 mesh/cfgmod-server.c   | 14 ++++----
 tools/mesh-cfgclient.c | 77 ++++++++++++++++--------------------------
 tools/mesh/cfgcli.c    | 60 ++++++++++++++++++++++++++++----
 tools/mesh/cfgcli.h    |  4 ++-
 tools/mesh/mesh-db.c   | 39 +++++++++++++++++++++
 tools/mesh/remote.c    | 20 +++++++++++
 tools/mesh/remote.h    |  1 +
 7 files changed, 154 insertions(+), 61 deletions(-)

-- 
2.21.1

