Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85A291FA47
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 May 2019 21:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfEOTAc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 May 2019 15:00:32 -0400
Received: from mga18.intel.com ([134.134.136.126]:27572 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726387AbfEOTAc (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 May 2019 15:00:32 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 May 2019 12:00:30 -0700
X-ExtLoop1: 1
Received: from ingas-nuc1.sea.intel.com ([10.254.97.211])
  by FMSMGA003.fm.intel.com with ESMTP; 15 May 2019 12:00:29 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/2] mesh source code housekeeping
Date:   Wed, 15 May 2019 12:00:17 -0700
Message-Id: <20190515190019.19710-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch set updates copyright dates on the files that have been modified
in 2019 and cleans up the includelists in source files.

Inga Stotland (2):
  mesh: Update copyright dates
  mesh: Remove unnecessary includes from .c files

 mesh/agent.c           |  3 +--
 mesh/appkey.c          |  4 +---
 mesh/appkey.h          |  2 +-
 mesh/cfgmod-server.c   |  7 +------
 mesh/crypto.c          |  4 +---
 mesh/dbus.c            | 10 ----------
 mesh/error.h           |  2 +-
 mesh/friend.c          |  8 +-------
 mesh/keyring.c         |  7 +------
 mesh/main.c            |  7 -------
 mesh/mesh-db.c         |  3 +--
 mesh/mesh-db.h         |  2 +-
 mesh/mesh-defs.h       |  2 +-
 mesh/mesh-io-generic.c |  6 +-----
 mesh/mesh-io.c         |  2 --
 mesh/mesh.c            |  5 ++---
 mesh/model.c           |  2 +-
 mesh/net-keys.c        |  3 +--
 mesh/net-keys.h        |  2 +-
 mesh/net.c             | 11 ++---------
 mesh/net.h             |  2 +-
 mesh/node.c            |  6 ++----
 mesh/node.h            |  2 +-
 mesh/pb-adv.c          | 18 +-----------------
 mesh/prov-acceptor.c   | 18 ++----------------
 mesh/prov-initiator.c  | 18 ++----------------
 mesh/storage.c         | 13 +++----------
 mesh/storage.h         |  2 +-
 mesh/util.c            |  6 +-----
 29 files changed, 33 insertions(+), 144 deletions(-)

-- 
2.21.0

