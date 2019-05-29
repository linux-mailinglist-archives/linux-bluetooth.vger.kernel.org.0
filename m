Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 248DA2D37E
	for <lists+linux-bluetooth@lfdr.de>; Wed, 29 May 2019 03:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbfE2Bwx (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 28 May 2019 21:52:53 -0400
Received: from mga04.intel.com ([192.55.52.120]:44549 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725816AbfE2Bwx (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 28 May 2019 21:52:53 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 May 2019 18:52:52 -0700
X-ExtLoop1: 1
Received: from ingas-nuc1.sea.intel.com ([10.255.231.189])
  by orsmga007.jf.intel.com with ESMTP; 28 May 2019 18:52:51 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/2] Add support for systemd mesh service
Date:   Tue, 28 May 2019 18:52:49 -0700
Message-Id: <20190529015251.15805-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch set adds files necessary to run bluetooth-mesh as
systemd service. Also removes explicit call to daemon().


Inga Stotland (2):
  build: Add support for systemd bluetooth-mesh service
  mesh: Do not daemonize, run in foreground or as service

 Makefile.am                    |  2 +-
 Makefile.mesh                  | 14 ++++++++++++--
 mesh/bluetooth-mesh.service.in | 13 +++++++++++++
 mesh/main.c                    | 15 +++++----------
 mesh/org.bluez.mesh.service    |  5 +++++
 5 files changed, 36 insertions(+), 13 deletions(-)
 create mode 100644 mesh/bluetooth-mesh.service.in
 create mode 100644 mesh/org.bluez.mesh.service

-- 
2.21.0

