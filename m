Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54F731D5D98
	for <lists+linux-bluetooth@lfdr.de>; Sat, 16 May 2020 03:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgEPB1v (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 15 May 2020 21:27:51 -0400
Received: from mga14.intel.com ([192.55.52.115]:12009 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726223AbgEPB1v (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 15 May 2020 21:27:51 -0400
IronPort-SDR: tJV9AEzSqMRII4ONnFM3Y8YB72EnBIXYgk6tgscUxPyShgqTVzvBqAv/RGq/o70qmnvRdbq0n7
 8XfRW/FxP3CQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2020 18:27:50 -0700
IronPort-SDR: j+WVl5cenW2Ncn3d9e4/t+cOxgzz0O2a7b/ACYjbiJg5E2qdiW/Sz9lJ+dZOroHrc7QKx1ssA9
 C/6KKUbQtJDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,397,1583222400"; 
   d="scan'208";a="307568631"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.252.132.104])
  by FMSMGA003.fm.intel.com with ESMTP; 15 May 2020 18:27:50 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com
Subject: [PATCH BlueZ v2 0/2] mesh: Valgrind Clean-up
Date:   Fri, 15 May 2020 18:27:40 -0700
Message-Id: <20200516012742.573151-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

These two patches address all known outstanding valgrind issues with the
mesh daemon.  The first patch (1/2) fixes actual memory leaks that will
compound over time. The second patch (2/2) fixes less critical warnings
that some memory wasn't entirely freed before exiting.

v2: Fixed checkpatch errors

Brian Gix (2):
  mesh: Fix valgrind memory leaks
  mesh: Fix valgrind memory leak warnings

 mesh/agent.c            |  1 +
 mesh/mesh-config-json.c | 16 ++++++++--------
 mesh/mesh.c             |  9 ++++++++-
 mesh/net-keys.c         |  6 ++++++
 mesh/net-keys.h         |  1 +
 mesh/net.c              | 12 +++++++++++-
 mesh/net.h              |  3 ++-
 mesh/node.c             |  1 +
 8 files changed, 38 insertions(+), 11 deletions(-)

-- 
2.25.4

