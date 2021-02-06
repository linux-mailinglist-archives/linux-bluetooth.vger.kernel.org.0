Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B878E311BAD
	for <lists+linux-bluetooth@lfdr.de>; Sat,  6 Feb 2021 06:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbhBFFvS (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 6 Feb 2021 00:51:18 -0500
Received: from mga01.intel.com ([192.55.52.88]:48288 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229534AbhBFFvQ (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 6 Feb 2021 00:51:16 -0500
IronPort-SDR: arzUSKeHCQPaM44BCPvlwpmiVPA4xX8R6MIuKCnlWCUpdOHeQPZji6Hvx2296Gu2Y0Jw2cpLB8
 gNUjnBo2Pbvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="200540944"
X-IronPort-AV: E=Sophos;i="5.81,157,1610438400"; 
   d="scan'208";a="200540944"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 21:50:31 -0800
IronPort-SDR: Ggp1Z5drIP8B/gn+huZ4REQXm3ALoDZTg2PlWBxX0JtuOSjn6yQS1+Fg25OfwTwlOaMUCrKNwy
 BGehrPFZFdGA==
X-IronPort-AV: E=Sophos;i="5.81,157,1610438400"; 
   d="scan'208";a="397733206"
Received: from yxiong5-mobl2.amr.corp.intel.com (HELO istotlan-desk.intel.com) ([10.212.99.79])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 21:50:30 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, luiz.dentz@gmail.com,
        Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ v3 0/3] Framework for non-interactive mesh test
Date:   Fri,  5 Feb 2021 21:50:20 -0800
Message-Id: <20210206055023.401381-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

v3: Fixed copyright style in mesh-io-unit.h

**********
v2: Fixed errors reported by bluez-bot.
    Regarding the warnings for the "__attribute__((packed))":
    keeping this style to be consistent with the rest of BLueZ codebase 
    
**********
This patch set introduces a framework for non-interactive testing of
mesh daemon functionality and consists of the three components:

1. A version of src/shared/tester that uses ELL primitives:
   everything mesh-related uses ELL.

2. New type of mesh IO used only for testing.

3. The mesh-cfgtest tool that excercises a number of mesh D-Bus
   API calls. Currently, the tool covers limited number of initial
   test cases. The extended coverage will be provided after this
   patch set is accepted.


Brian Gix (1):
  mesh: Add unit test IO

Inga Stotland (2):
  shared/tester: Create ell-based version of tester code
  tools/mesh-cfgtest: Non-iteractive test for mesh daemon

 Makefile.am             |    8 +-
 Makefile.mesh           |    2 +
 Makefile.tools          |    6 +
 mesh/main.c             |   51 +-
 mesh/mesh-io-unit.c     |  533 ++++++++++++++++
 mesh/mesh-io-unit.h     |   11 +
 mesh/mesh-io.c          |    9 +-
 mesh/mesh-io.h          |    3 +-
 src/shared/tester-ell.c |  887 ++++++++++++++++++++++++++
 tools/mesh-cfgtest.c    | 1319 +++++++++++++++++++++++++++++++++++++++
 10 files changed, 2808 insertions(+), 21 deletions(-)
 create mode 100644 mesh/mesh-io-unit.c
 create mode 100644 mesh/mesh-io-unit.h
 create mode 100644 src/shared/tester-ell.c
 create mode 100644 tools/mesh-cfgtest.c

-- 
2.26.2

