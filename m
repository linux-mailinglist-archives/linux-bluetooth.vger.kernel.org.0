Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6DF41D05F
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 May 2019 22:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfENUPf (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 14 May 2019 16:15:35 -0400
Received: from mga18.intel.com ([134.134.136.126]:13149 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726036AbfENUPe (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 14 May 2019 16:15:34 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 May 2019 13:15:34 -0700
X-ExtLoop1: 1
Received: from bgix-dell-lap.sea.intel.com ([10.251.7.218])
  by fmsmga007.fm.intel.com with ESMTP; 14 May 2019 13:15:33 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com,
        michal.lowas-rzechonek@silvair.com
Subject: [PATCH BlueZ 0/3] mesh: add Keyring to CreateNetwork
Date:   Tue, 14 May 2019 13:15:22 -0700
Message-Id: <20190514201525.16067-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.14.5
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Patch-set also fixes some file creation permissions and adds CreateNetwork
test.

Brian Gix (3):
  mesh: Add "create" command to test app
  mesh: Fix file open error checking and permissions
  mesh: Save generated Net and Dev keys in KeyRing

 mesh/keyring.c |  8 +++++---
 mesh/node.c    | 20 ++++++++++++++++----
 mesh/storage.c |  2 +-
 test/test-mesh | 46 ++++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 66 insertions(+), 10 deletions(-)

-- 
2.14.5

