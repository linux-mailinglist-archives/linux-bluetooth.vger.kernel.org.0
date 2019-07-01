Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A471314FB
	for <lists+linux-bluetooth@lfdr.de>; Fri, 31 May 2019 20:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbfEaSyv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 31 May 2019 14:54:51 -0400
Received: from mga17.intel.com ([192.55.52.151]:38242 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726640AbfEaSyv (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 31 May 2019 14:54:51 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 May 2019 11:54:51 -0700
X-ExtLoop1: 1
Received: from ingas-nuc1.sea.intel.com ([10.252.132.160])
  by fmsmga005.fm.intel.com with ESMTP; 31 May 2019 11:54:50 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/2 v2] Add support for systemd mesh service
Date:   Fri, 31 May 2019 11:54:47 -0700
Message-Id: <20190531185449.9133-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

With whitespace fix

This patch set adds files necessary to run bluetooth-mesh as
systemd service. Also removes explicit call to daemon()

Inga Stotland (2):
  build: Add support for systemd bluetooth-mesh service
  mesh: Do not daemonize, run in foreground or as service

 Makefile.am                    |  2 +-
 Makefile.mesh                  | 14 ++++++++++++--
 mesh/bluetooth-mesh.service.in | 12 ++++++++++++
 mesh/main.c                    | 15 +++++----------
 mesh/org.bluez.mesh.service    |  5 +++++
 5 files changed, 35 insertions(+), 13 deletions(-)
 create mode 100644 mesh/bluetooth-mesh.service.in
 create mode 100644 mesh/org.bluez.mesh.service

-- 
2.21.0

