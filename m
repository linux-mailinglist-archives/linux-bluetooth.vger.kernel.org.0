Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F47F844C2
	for <lists+linux-bluetooth@lfdr.de>; Wed,  7 Aug 2019 08:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbfHGGrv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 7 Aug 2019 02:47:51 -0400
Received: from mga06.intel.com ([134.134.136.31]:3495 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727105AbfHGGrv (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 7 Aug 2019 02:47:51 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Aug 2019 23:47:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,356,1559545200"; 
   d="scan'208";a="182194355"
Received: from ingas-nuc1.sea.intel.com ([10.254.176.241])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Aug 2019 23:47:50 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, luiz.dentz@gmail.com,
        Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/2] ELL-based bt_shell implementation
Date:   Tue,  6 Aug 2019 23:47:45 -0700
Message-Id: <20190807064747.6725-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch set addresses the need of using bt-shell functionality
when running with ell mainloop.
Specifically, need this for implementation of mesh profisioning tool:
mesh daemon is implemented using ell library and is driven by
ell main loop.

Inga Stotland (2):
  shared/shell: Add ell based shell implementation
  shared/shell: Add "clear-history" API

 Makefile.am            |   13 +-
 src/shared/shell-ell.c | 1325 ++++++++++++++++++++++++++++++++++++++++
 src/shared/shell.c     |    7 +-
 src/shared/shell.h     |    1 +
 4 files changed, 1342 insertions(+), 4 deletions(-)
 create mode 100644 src/shared/shell-ell.c

-- 
2.21.0

