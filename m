Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50D5739CDA3
	for <lists+linux-bluetooth@lfdr.de>; Sun,  6 Jun 2021 08:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbhFFGjQ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 6 Jun 2021 02:39:16 -0400
Received: from mga18.intel.com ([134.134.136.126]:34607 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229478AbhFFGjP (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 6 Jun 2021 02:39:15 -0400
IronPort-SDR: XHWnlECz7gLSqvodn32MsDJDJoevaEQuVB0pPZyK1faw2P/4WmHlFiYxqBhdgT+yY+VUEbjR7k
 ZGa0XhOYh+2Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10006"; a="191815308"
X-IronPort-AV: E=Sophos;i="5.83,252,1616482800"; 
   d="scan'208";a="191815308"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2021 23:37:26 -0700
IronPort-SDR: LRBpJBdZZMsr/B7/VG1FDRG1/c2RceUIPolvsr0pyheUogh0tJs2ADBpDBGRqTcoiWFO9asNto
 CyFRKxS1lRNg==
X-IronPort-AV: E=Sophos;i="5.83,252,1616482800"; 
   d="scan'208";a="481160874"
Received: from skambhat-mobl.amr.corp.intel.com (HELO istotlan-desk.intel.com) ([10.209.68.161])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2021 23:37:26 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     luiz.dentz@gmail.com, tedd.an@intel.com,
        Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 00/11] Convert tester tools to use ELL
Date:   Sat,  5 Jun 2021 23:37:08 -0700
Message-Id: <20210606063719.339794-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch set contains non-interactive tester tools modified
to use ELL primitives in order to remove dependencies on GLib.

Two new files emulator/hciemu-ell.c and src/shared/bttester.c are
created as an intermediate step before removing their GLib-based counterparts
subject to the vetting/approval of this patch set.

Inga Stotland (11):
  shared/bttester: tester framework wrapper to use ELL
  emulator/hciemu: Create ELL based version of hciemu
  tools/gap-tester: Convert to use ELL library
  tools/sco-tester: Convert to use ELL library
  tools/userchan-tester: Convert to use ELL library
  tools/smp-tester: Convert to use ELL library
  tools/bnep-tester: Convert to use ELL library
  tools/l2cap-tester: Convert to use ELL library
  tools/mgmt-tester: Convert to use ELL library
  tools/rfcomm-tester: Convert to use ELL library
  tools/hci-tester: Convert to use ELL library

 Makefile.am             |   4 +-
 Makefile.tools          |  36 +-
 emulator/hciemu-ell.c   | 641 +++++++++++++++++++++++++++++++++
 src/shared/bttester.c   | 279 +++++++++++++++
 src/shared/bttester.h   |  32 ++
 tools/bnep-tester.c     | 115 +++---
 tools/gap-tester.c      | 107 +++---
 tools/hci-tester.c      | 289 ++++++++-------
 tools/l2cap-tester.c    | 680 ++++++++++++++++++-----------------
 tools/mgmt-tester.c     | 772 ++++++++++++++++++++--------------------
 tools/rfcomm-tester.c   | 290 +++++++--------
 tools/sco-tester.c      | 231 ++++++------
 tools/smp-tester.c      | 210 ++++++-----
 tools/userchan-tester.c | 151 ++++----
 14 files changed, 2391 insertions(+), 1446 deletions(-)
 create mode 100644 emulator/hciemu-ell.c
 create mode 100644 src/shared/bttester.c
 create mode 100644 src/shared/bttester.h

-- 
2.26.3

