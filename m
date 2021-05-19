Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8EFD38963F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 19 May 2021 21:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbhESTLA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 19 May 2021 15:11:00 -0400
Received: from mga06.intel.com ([134.134.136.31]:6662 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231894AbhESTK7 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 19 May 2021 15:10:59 -0400
IronPort-SDR: HZXNcI+9BIs7aJiXDD9E9Lz1I1ntzOIFr2AyF/6UCB6dFWrRZdue8DBT7M22/Zmu/ybq1A7/up
 OmXnqcKbBXgA==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="262284396"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="262284396"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2021 12:09:36 -0700
IronPort-SDR: 3vtDnjzCoGUnvDVdcTq27JJJIpzLe5/6cEXOiM4bkbhrbZtPJLvCq+Uc1mOaUxPZY0XicWWvbY
 PSiqnjaKO+eQ==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="439855254"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.212.229.7])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2021 12:09:36 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com
Subject: [PATCH BlueZ v3 0/6] OOB Authentication improvements
Date:   Wed, 19 May 2021 12:09:19 -0700
Message-Id: <20210519190925.1723012-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch set fixes some minor bugs, and adds explicit support for all
currently supported Provisioning authentication methods.

v2: Added prov-acceptor queuing, and fixed whitespace issues

v3: Fixed spelling errors and added patch to address memory leak

Brian Gix (6):
  mesh: Fix delivery of PB-ACK to acceptors
  mesh: Normalize endian of public/private ECC keys
  tools/mesh: Add all supported OOB methods to cfgclient
  test/mesh: Add support for testing more OOB auth
  mesh: Add single threading to prov-acp ob messaging
  mesh: Fix race condition memory leak

 mesh/mesh-io-generic.c |  2 +
 mesh/pb-adv.c          |  1 -
 mesh/prov-acceptor.c   | 96 +++++++++++++++++++++++++++---------------
 mesh/prov-initiator.c  |  3 ++
 mesh/provision.h       |  1 +
 test/agent.py          | 23 ++++++++++
 tools/mesh-cfgclient.c | 32 +++++++++++---
 7 files changed, 118 insertions(+), 40 deletions(-)

-- 
2.25.4

