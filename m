Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A68B64F0A
	for <lists+linux-bluetooth@lfdr.de>; Thu, 11 Jul 2019 01:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbfGJXIK (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 10 Jul 2019 19:08:10 -0400
Received: from mga02.intel.com ([134.134.136.20]:65421 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726708AbfGJXIK (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 10 Jul 2019 19:08:10 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jul 2019 16:08:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,476,1557212400"; 
   d="scan'208";a="186250368"
Received: from bgix-dell-lap.sea.intel.com ([10.255.80.129])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2019 16:08:08 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, michal.lowas-rzechonek@silvair.com,
        brian.gix@intel.com
Subject: [PATCH BlueZ 0/8] mesh: Provisioner Initiator added
Date:   Wed, 10 Jul 2019 16:07:49 -0700
Message-Id: <20190710230757.8425-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.14.5
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The added functionality of this patch set allows any node with a keyring
provision a new node into the network. It does *not* implement a
user App that can store a Configuration Database, but it does provide
extensions to the python test script to test the primitives.

Brian Gix (8):
  doc: Cleanup API Provisioner1 interface
  mesh: Fix support for Provisioner Initiator
  mesh: Add special Beacon handler for Provisioning
  mesh: Expose mapping function for D-Bus errors
  mesh: Expose resources needed by Management1 interface
  mesh: Fix implementation of Provisioner Initiator
  mesh: Implement DBus Provisioning methods
  test: This extends the mesh tool to exercise Provisioning methods

 doc/mesh-api.txt       |  13 ++-
 mesh/manager.c         | 304 +++++++++++++++++++++++++++++++++++++++++++++++--
 mesh/mesh-io-generic.c |   2 +-
 mesh/mesh-io.c         |   6 +-
 mesh/mesh-io.h         |   7 +-
 mesh/mesh.c            |   8 +-
 mesh/mesh.h            |   1 +
 mesh/node.c            |  42 +++++--
 mesh/node.h            |   3 +
 mesh/pb-adv.c          |  54 ++++++---
 mesh/pb-adv.h          |   3 +-
 mesh/prov-acceptor.c   |   2 +-
 mesh/prov-initiator.c  | 253 ++++++++++++++++++++++++++++++----------
 mesh/provision.h       |  10 +-
 test/test-mesh         | 115 ++++++++++++++++++-
 15 files changed, 710 insertions(+), 113 deletions(-)

-- 
2.14.5

