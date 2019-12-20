Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 615DB12831A
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Dec 2019 21:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727510AbfLTUNs (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 20 Dec 2019 15:13:48 -0500
Received: from mga03.intel.com ([134.134.136.65]:24741 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727394AbfLTUNs (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 20 Dec 2019 15:13:48 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Dec 2019 12:13:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,337,1571727600"; 
   d="scan'208";a="228707534"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.255.86.196])
  by orsmga002.jf.intel.com with ESMTP; 20 Dec 2019 12:13:47 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com
Subject: [PATCH BlueZ 0/2] mesh: Fix some SNB details
Date:   Fri, 20 Dec 2019 12:13:38 -0800
Message-Id: <20191220201340.8039-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This fixes two minor flaws with Secure Net Beacons:

1. When a local node's SNB changes, all local nodes should be made aware
of the change a the same time we start sending out that beacon.

2. The second that a remote beacon is "seen" needs to be recorded so
that the SecondsSinceLastHeard property can be correctly updated.

Brian Gix (2):
  mesh: Deliver newly composed SNBs to local nodes
  mesh: Recognize SNBs in SecondsSinceLastHeard property

 mesh/net-keys.c | 19 ++++++++++++++++---
 mesh/net-keys.h |  1 +
 mesh/net.c      | 28 ++++++++++++++++++++++++++++
 mesh/net.h      |  1 +
 4 files changed, 46 insertions(+), 3 deletions(-)

-- 
2.21.0

