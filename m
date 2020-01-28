Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF9714C25E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 28 Jan 2020 22:53:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgA1VxW (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 28 Jan 2020 16:53:22 -0500
Received: from mga09.intel.com ([134.134.136.24]:27725 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726211AbgA1VxW (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 28 Jan 2020 16:53:22 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Jan 2020 13:53:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,375,1574150400"; 
   d="scan'208";a="246856232"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.255.84.27])
  by orsmga002.jf.intel.com with ESMTP; 28 Jan 2020 13:53:21 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com,
        rafal.gajda@silvair.com
Subject: [PATCH BlueZ v3 0/5] mesh: Add NVM storage of Replay Protection List
Date:   Tue, 28 Jan 2020 13:53:05 -0800
Message-Id: <20200128215310.8205-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Version 3: Fix problem found by Rafał relating to the handling of
sequence numbers of messages being handled internally (loop-backs),
which were being rejected by the Replay Protection List (please see
patch 3/5).

Version 2: Fix path construction code when first reading RPL from NVM


An oversight led to losing our Replay Protection List with every
re-boot. This patch-set makes a number of Replay Protect List
modifications that culminate in adding rpl.c/h, which stores the latest
iv_index/sequence values for each node that handles an incoming packet.

The first 4 patches, does some maintenance required to handle RPL
according the the Mesh Specification.


Brian Gix (5):
  mesh: Relocate tree deletion to util.c/h
  mesh: Move Replay Protection to mesh/net.c
  mesh: Clean-up unneeded Sequence Number increments
  mesh: Apply Replay Protection to all incoming packets
  mesh: Add NVM storage of Replay Protection

 Makefile.mesh           |   1 +
 mesh/appkey.c           | 102 ---------------
 mesh/appkey.h           |   3 -
 mesh/mesh-config-json.c |  20 +--
 mesh/model.c            |  16 +--
 mesh/net.c              | 128 ++++++++++++++++---
 mesh/net.h              |   3 +
 mesh/rpl.c              | 277 ++++++++++++++++++++++++++++++++++++++++
 mesh/rpl.h              |  30 +++++
 mesh/util.c             |  25 ++++
 mesh/util.h             |   1 +
 11 files changed, 456 insertions(+), 150 deletions(-)
 create mode 100644 mesh/rpl.c
 create mode 100644 mesh/rpl.h

-- 
2.21.1

