Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3CD11585C
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 Dec 2019 21:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbfLFU5v (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 6 Dec 2019 15:57:51 -0500
Received: from mga04.intel.com ([192.55.52.120]:41333 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbfLFU5v (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 6 Dec 2019 15:57:51 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Dec 2019 12:57:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,286,1571727600"; 
   d="scan'208";a="219502251"
Received: from ingas-nuc1.sea.intel.com ([10.255.83.133])
  by fmsmga001.fm.intel.com with ESMTP; 06 Dec 2019 12:57:50 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/3] mesh: clean up
Date:   Fri,  6 Dec 2019 12:57:46 -0800
Message-Id: <20191206205749.12918-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This set of patches claens up some cruft in node.c and some in net.c
The dtaaflow is a bit more deterministic now.

Inga Stotland (3):
  mesh: Delete unused function
  mesh: Clean up node.c
  mesh: Initialize net modes based on node configuration

 mesh/mesh-defs.h |   2 +
 mesh/model.c     |  17 +-
 mesh/model.h     |   4 +-
 mesh/net.c       |  15 +-
 mesh/node.c      | 503 ++++++++++++++++++-----------------------------
 mesh/node.h      |   1 -
 6 files changed, 200 insertions(+), 342 deletions(-)

-- 
2.21.0

