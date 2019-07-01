Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8CA350D7
	for <lists+linux-bluetooth@lfdr.de>; Tue,  4 Jun 2019 22:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfFDU3F (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 4 Jun 2019 16:29:05 -0400
Received: from mga18.intel.com ([134.134.136.126]:10752 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbfFDU3F (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 4 Jun 2019 16:29:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jun 2019 13:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,550,1549958400"; 
   d="scan'208";a="181680735"
Received: from bgix-dell-lap.sea.intel.com ([10.254.84.39])
  by fmsmga002.fm.intel.com with ESMTP; 04 Jun 2019 13:29:04 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com,
        ludwig.nussel@suse.de, marcel@holtmann.org,
        johan.hedberg@gmail.com, luiz.dentz@gmail.com
Subject: [PATCH BlueZ v4 0/3] mesh - Service and Installation
Date:   Tue,  4 Jun 2019 13:28:49 -0700
Message-Id: <20190604202852.12656-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.14.5
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch set of changes from Inga and Ludwig are needed to install
the bluetooth-mesh daemon as a systemd service, with access to D-bus.

Ludwig's patch from April fixes a problem with installation locations
for *all* of BlueZ, and Inga's adds the bluetooth-mesh service.


Inga Stotland (2):
  build: Add support for systemd bluetooth-mesh service
  mesh: Do not daemonize, run in foreground or as service

Ludwig Nussel (1):
  install: Fix installations to pkglibexecdir

 Makefile.am                    |  4 ++--
 Makefile.mesh                  | 16 +++++++++++++---
 Makefile.obexd                 |  2 +-
 Makefile.tools                 |  2 +-
 mesh/bluetooth-mesh.service.in | 17 +++++++++++++++++
 mesh/main.c                    | 17 ++++++-----------
 mesh/org.bluez.mesh.service    |  5 +++++
 7 files changed, 45 insertions(+), 18 deletions(-)
 create mode 100644 mesh/bluetooth-mesh.service.in
 create mode 100644 mesh/org.bluez.mesh.service

-- 
2.14.5

