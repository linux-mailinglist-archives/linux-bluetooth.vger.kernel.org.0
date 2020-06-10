Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11EB81F59BD
	for <lists+linux-bluetooth@lfdr.de>; Wed, 10 Jun 2020 19:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729337AbgFJRLY (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 10 Jun 2020 13:11:24 -0400
Received: from mga07.intel.com ([134.134.136.100]:8721 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728251AbgFJRLY (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 10 Jun 2020 13:11:24 -0400
IronPort-SDR: v5chk+g8PYqAQscdMNFAb1Z0cuPN4ZSdm5aCx7wgA3/8/hKy2s+Q1jVznyelKt5EkRn0OEImjp
 3wIN0DboR6Qg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2020 10:11:23 -0700
IronPort-SDR: HVO0zgmboEPC1aR2qnGr9j6MAeB5H/QhZQf81t9PGwz6BtnstjWfGu6HH3UG2V5e3stf9HOJlX
 8LhvKOricv2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,496,1583222400"; 
   d="scan'208";a="259340075"
Received: from unknown (HELO ingas-nuc1.sea.intel.com) ([10.254.72.48])
  by fmsmga007.fm.intel.com with ESMTP; 10 Jun 2020 10:11:22 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ v3 0/5] Put safeguards around Leave & Attach calls
Date:   Wed, 10 Jun 2020 10:11:16 -0700
Message-Id: <20200610171121.46910-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This set of patches addresses the situation when an application
calls Leave() or Attach() methods on a node that has another incomplete
method call on Network interface associated with it.

The simple solution is to return error in response to Leave() method
if an application still owes the daemon either a reply to GetManagedObjects
request in case of Attach() or a reply to JoinComplete() in case of
Join(), Create() or Import()

Similarly, a "Busy" error is returned in response to Attach() method
if an application still owes the daemon a reply to JoinComplete()
in case of pending Join(), Create() or Import()

Inga Stotland (5):
  mesh: Delete unused function
  mesh: Make "Busy" and "InProgress" to be distinct errors
  mesh: Add destroy callback to dbus_send_with_timeout()
  mesh: Add timeout to GetManagedObjects call
  mesh: Add "node is busy" check for Leave() & Attach()

 doc/mesh-api.txt |  5 +++-
 mesh/dbus.c      | 10 +++++++-
 mesh/dbus.h      |  1 +
 mesh/error.h     |  1 +
 mesh/manager.c   | 11 ++++-----
 mesh/mesh.c      | 22 +++++++++++------
 mesh/node.c      | 63 +++++++++++++++++++++++++++++-------------------
 mesh/node.h      |  2 +-
 test/test-mesh   |  2 --
 9 files changed, 74 insertions(+), 43 deletions(-)

-- 
2.26.2

