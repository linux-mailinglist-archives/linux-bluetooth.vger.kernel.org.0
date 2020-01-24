Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16307149225
	for <lists+linux-bluetooth@lfdr.de>; Sat, 25 Jan 2020 00:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729368AbgAXXwt (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 24 Jan 2020 18:52:49 -0500
Received: from mga11.intel.com ([192.55.52.93]:53121 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729147AbgAXXwt (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 24 Jan 2020 18:52:49 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Jan 2020 15:52:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,359,1574150400"; 
   d="scan'208";a="230511853"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.251.17.203])
  by orsmga006.jf.intel.com with ESMTP; 24 Jan 2020 15:52:48 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com
Subject: [PATCH BlueZ 0/5] mesh: Add NVM storage of Replay Protection List
Date:   Fri, 24 Jan 2020 15:52:37 -0800
Message-Id: <20200124235242.21720-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

An oversight led to losing our Replay Protection List with every
re-boot. This patch-set makes a number of Replay Protect List
modifications that culminate in adding rpl.c/h, which stores the latest
iv_index/sequence values for each node that handles an incoming packet.

The first 4 patches, does some maintenance required to handle RPL
according the the Mesh Specification.

Brian Gix (5):
  mesh: Relocate tree deletion to util.c/h
  mesh: Move Replay Protection to mesh/net.c
  mesh: Remove unneeded Sequence Number increment
  mesh: Apply Replay Protection to all incoming packets
  mesh: Add NVM storage of Replay Protection

 Makefile.mesh           |   1 +
 mesh/appkey.c           | 102 ---------------
 mesh/appkey.h           |   3 -
 mesh/mesh-config-json.c |  20 +--
 mesh/model.c            |  16 ++-
 mesh/net.c              | 112 +++++++++++++++--
 mesh/net.h              |   3 +
 mesh/rpl.c              | 271 ++++++++++++++++++++++++++++++++++++++++
 mesh/rpl.h              |  30 +++++
 mesh/util.c             |  25 ++++
 mesh/util.h             |   1 +
 11 files changed, 441 insertions(+), 143 deletions(-)
 create mode 100644 mesh/rpl.c
 create mode 100644 mesh/rpl.h

-- 
2.21.1

