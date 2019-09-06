Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF90ABDA1
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 Sep 2019 18:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388021AbfIFQYo (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 6 Sep 2019 12:24:44 -0400
Received: from mga04.intel.com ([192.55.52.120]:24832 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387834AbfIFQYo (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 6 Sep 2019 12:24:44 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Sep 2019 09:24:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,473,1559545200"; 
   d="scan'208";a="334937317"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.254.24.188])
  by orsmga004.jf.intel.com with ESMTP; 06 Sep 2019 09:24:42 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com
Subject: [PATCH BlueZ v4 0/2] mesh: Streamline Key Refresh finalization
Date:   Fri,  6 Sep 2019 09:24:32 -0700
Message-Id: <20190906162434.7434-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

All App key refresh finalization will happen when the bound Net Key is
finalized.

Version 4: Allow a redundent call to set phase 3 (after transition to
phase 0 complete) by returning successfully, but doing nothing.


Brian Gix (2):
  doc: Remove uneeded dbus API for App Key Refresh
  mesh: Automate AppKey update on KR phase 2-->3-->0

 doc/mesh-api.txt | 19 ----------------
 mesh/keyring.c   | 58 ++++++++++++++++++++++++++++++++++++++++++++++++
 mesh/keyring.h   |  1 +
 mesh/manager.c   | 53 +++++++++++++++++--------------------------
 4 files changed, 79 insertions(+), 52 deletions(-)

-- 
2.21.0

