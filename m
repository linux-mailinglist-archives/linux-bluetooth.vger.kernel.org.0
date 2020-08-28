Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD0122561D3
	for <lists+linux-bluetooth@lfdr.de>; Fri, 28 Aug 2020 22:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgH1UE3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 28 Aug 2020 16:04:29 -0400
Received: from mga17.intel.com ([192.55.52.151]:35423 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726010AbgH1UE3 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 28 Aug 2020 16:04:29 -0400
IronPort-SDR: o96spnWxakMunJnb6NAYjU0igzs9zEGMiJLSssenC/NcRDQee6V88VVr7siE8p5ZSopxbg+PZI
 Cwyq/clsCmwA==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="136799282"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; 
   d="scan'208";a="136799282"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2020 13:04:28 -0700
IronPort-SDR: wvD/nc5q60eRlDX2d5eHPM31A58M6cuLGTqW4leTrEU+jXeZhVtF+bGtD4fywy8eGY/B3B7XiW
 nkGJulcGT37A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; 
   d="scan'208";a="300345419"
Received: from rbuaba-mobl2.amr.corp.intel.com (HELO ingas-nuc1.intel.com) ([10.254.83.122])
  by orsmga006.jf.intel.com with ESMTP; 28 Aug 2020 13:04:28 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/2] Mesh replay protection clean up 
Date:   Fri, 28 Aug 2020 13:04:25 -0700
Message-Id: <20200828200427.18753-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch set moves RPL initialization to the node init sequence
instead of checking for every incoming message whether RPL has
been initialized.

Also, use consistent size check for RPL directory/file paths.


Inga Stotland (2):
  mesh: Initialize RPL when creating or loading a node
  mesh: Move RPL check from model to net layer

 mesh/model.c |  18 ++---
 mesh/model.h |   6 +-
 mesh/net.c   | 198 +++++++++++++++++++++++++++------------------------
 mesh/net.h   |   5 +-
 mesh/node.c  |  11 +--
 mesh/rpl.c   |  29 +++++---
 mesh/rpl.h   |   3 +-
 7 files changed, 143 insertions(+), 127 deletions(-)

-- 
2.26.2

