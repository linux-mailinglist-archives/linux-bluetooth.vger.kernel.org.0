Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08C2025DA0
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 May 2019 07:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728420AbfEVFds (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 May 2019 01:33:48 -0400
Received: from mga05.intel.com ([192.55.52.43]:63614 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725801AbfEVFds (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 May 2019 01:33:48 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 May 2019 22:33:47 -0700
X-ExtLoop1: 1
Received: from ingas-nuc1.sea.intel.com ([10.254.190.110])
  by orsmga007.jf.intel.com with ESMTP; 21 May 2019 22:33:47 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/2] mesh: Clean up D-Bus message references
Date:   Tue, 21 May 2019 22:33:37 -0700
Message-Id: <20190522053339.6289-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This set of patches cleans up the usage of l_dbus_message_ref() and
l_dbus_message_unref() in the mesh daemon

Inga Stotland (2):
  mesh: Unreference pending D-Bus messages
  mesh: Remove unnecessary message ref/unref in agent.c

 mesh/agent.c | 16 ----------------
 mesh/mesh.c  |  8 +++++---
 2 files changed, 5 insertions(+), 19 deletions(-)

-- 
2.21.0

