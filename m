Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B25B110643
	for <lists+linux-bluetooth@lfdr.de>; Tue,  3 Dec 2019 22:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbfLCVEV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 3 Dec 2019 16:04:21 -0500
Received: from mga18.intel.com ([134.134.136.126]:1961 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727520AbfLCVEU (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 3 Dec 2019 16:04:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Dec 2019 13:04:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,274,1571727600"; 
   d="scan'208";a="208575153"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.254.44.42])
  by fmsmga008.fm.intel.com with ESMTP; 03 Dec 2019 13:04:19 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com,
        prathyusha.n@samsung.com
Subject: [PATCH BlueZ v2 0/3] mesh: Fix various valgrind identified problems
Date:   Tue,  3 Dec 2019 13:04:07 -0800
Message-Id: <20191203210410.25548-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patchset addresses a few valgrind identified errors, including some
instances where memory was used after freeing.  All three patches relate
to the memory allocated for Provisioning purposes.

This includes the patch from Prathyusha that fixes close indication.

Brian Gix (2):
  mesh: Rearrange PB-ACK for possible session close
  mesh: Fix memory leak in Join() API call

Prathyusha N (1):
  mesh: Fix to send close indication on timeout

 mesh/mesh.c          |  7 +++++--
 mesh/net.c           |  1 -
 mesh/pb-adv.c        | 10 ++++------
 mesh/prov-acceptor.c |  1 +
 4 files changed, 10 insertions(+), 9 deletions(-)

-- 
2.21.0

