Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 764353195C4
	for <lists+linux-bluetooth@lfdr.de>; Thu, 11 Feb 2021 23:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhBKWXI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 11 Feb 2021 17:23:08 -0500
Received: from mga07.intel.com ([134.134.136.100]:1736 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230097AbhBKWWg (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 11 Feb 2021 17:22:36 -0500
IronPort-SDR: xRad+BLhv2bEV0BxSgNeIqIwDgobb31tqcChP9tQMwXBBndoBKw0RtSeoPq7jeExV9J+q6KQ8j
 RZVsomMQqWyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="246392967"
X-IronPort-AV: E=Sophos;i="5.81,171,1610438400"; 
   d="scan'208";a="246392967"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2021 14:21:55 -0800
IronPort-SDR: 2va7SIprbnYuJCyYSDY9v6NuXRUqbR0HfcL6NW6Kb160vfg9UsUE92xXZ4K88hjAYWfY8LKG19
 XO4hEMg5FkrQ==
X-IronPort-AV: E=Sophos;i="5.81,171,1610438400"; 
   d="scan'208";a="381070034"
Received: from binman-mobl4.amr.corp.intel.com (HELO istotlan-desk.intel.com) ([10.251.152.23])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2021 14:21:53 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/4] Use compliant UUID for mesh
Date:   Thu, 11 Feb 2021 14:21:39 -0800
Message-Id: <20210211222143.39986-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Mesh profile spec states that the values use for Device UUIDs
folow format and generation procedures outlined in RFC 4122.
This patch set addresses this requirement.

Inga Stotland (4):
  doc/mesh-api: Add notion of Device UUID compliance
  mesh: Add validation of Device UUID value
  test/test-mesh: Generate correct value for Device UUID
  tools/mesh-cfg-client:

 Makefile.am            |  6 ++++--
 doc/mesh-api.txt       |  9 ++++++---
 mesh/mesh.c            | 18 +++++++++---------
 test/test-mesh         |  5 +++++
 tools/mesh-cfgclient.c |  6 +++---
 tools/mesh/mesh-db.c   |  2 +-
 6 files changed, 28 insertions(+), 18 deletions(-)

-- 
2.26.2

