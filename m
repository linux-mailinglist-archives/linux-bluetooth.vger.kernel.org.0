Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 181BC1E556
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 May 2019 00:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbfENWyK (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 14 May 2019 18:54:10 -0400
Received: from mga03.intel.com ([134.134.136.65]:22776 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726148AbfENWyJ (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 14 May 2019 18:54:09 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 May 2019 15:54:09 -0700
X-ExtLoop1: 1
Received: from ingas-nuc1.sea.intel.com ([10.252.138.236])
  by orsmga003.jf.intel.com with ESMTP; 14 May 2019 15:54:09 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/2] Start implementing mesh Management interface
Date:   Tue, 14 May 2019 15:54:05 -0700
Message-Id: <20190514225407.29594-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch set ads a sketleton for org.bluez.mesh.Management1 interface.
Also, adds check for the existence of the provisioning agent for an
attaching node: this information will be further used to validate
number of method calls on Management interface

Inga Stotland (2):
  mesh: Add check for org.bluez.mesh.Provisioner1 interface
  mesh: Add skeleton for org.bluez.mesh.Management1 interface

 Makefile.mesh  |   1 +
 mesh/dbus.c    |  12 ++-
 mesh/error.h   |   1 +
 mesh/manager.c | 266 +++++++++++++++++++++++++++++++++++++++++++++++++
 mesh/manager.h |  20 ++++
 mesh/mesh.h    |   4 +-
 mesh/node.c    |   5 +-
 7 files changed, 303 insertions(+), 6 deletions(-)
 create mode 100644 mesh/manager.c
 create mode 100644 mesh/manager.h

-- 
2.21.0

