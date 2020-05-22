Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6B01DF0D8
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 May 2020 22:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731055AbgEVU56 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 22 May 2020 16:57:58 -0400
Received: from mga02.intel.com ([134.134.136.20]:25387 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731025AbgEVU56 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 22 May 2020 16:57:58 -0400
IronPort-SDR: bIRhbVU7k7glkTYhNzCChbPrf66dQZYQ4dJPXSuz5IwSsaSPdv8707LedIz961wDqLzRaIOpA9
 44GLB6adHXPw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2020 13:57:58 -0700
IronPort-SDR: PUZEuxOKI5dtKXHYA5umZSXSoHWyJZd3vakW5ESvxNNho9zNcILOWakoJybhbXp/dtpWYa6/4s
 US++bpfnd2iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,423,1583222400"; 
   d="scan'208";a="254369940"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.254.68.94])
  by fmsmga007.fm.intel.com with ESMTP; 22 May 2020 13:57:57 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com
Subject: [PATCH BlueZ 0/3] mesh: Static Analysis clean-up
Date:   Fri, 22 May 2020 13:57:53 -0700
Message-Id: <20200522205756.230907-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patchset fixes 3 static analysis identified issues in the
mesh daemon.

Brian Gix (3):
  mesh: Fix using uninitialized bytes
  mesh: Fix leaked mesh_net allocation
  mesh: Fix leaked message reference

 mesh/crypto.c  | 1 +
 mesh/manager.c | 3 ++-
 mesh/node.c    | 4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.25.4

