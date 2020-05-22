Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28E021DDC32
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 May 2020 02:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgEVAfD (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 21 May 2020 20:35:03 -0400
Received: from mga14.intel.com ([192.55.52.115]:55682 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726785AbgEVAfD (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 21 May 2020 20:35:03 -0400
IronPort-SDR: 31rZvSn1NDFM3cpN/W7ip/y4Ztf073B9ipE+fzsomk8CGJi7FsAlD4BIyczAgZL6cPOX0oN5fT
 YxCY/WVFqxzw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2020 17:35:02 -0700
IronPort-SDR: VZ7SwImXXYFwK2FYGJM9ak5dDAjSbY+v73TOFz82ovK3clHsfMvoS2PPcEWZZPORzDlfPKaJS1
 twNWTJJJsMiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,419,1583222400"; 
   d="scan'208";a="300961647"
Received: from nsalivat-mobl.amr.corp.intel.com (HELO ingas-nuc1.sea.intel.com) ([10.254.98.52])
  by orsmga008.jf.intel.com with ESMTP; 21 May 2020 17:35:02 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 00/10] Mesh code clean up
Date:   Thu, 21 May 2020 17:34:51 -0700
Message-Id: <20200522003501.106165-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patchset is contains a number of memory leak fixes and
some stylistic changes that hopefully result in more compact
and readable code.

Inga Stotland (10):
  mesh: Remove unused structure member
  mesh: Free allocated agent in mesh_remove_agent()
  mesh: Remove agent when freeing node's dynamic resources
  mesh: Add finalization of a newly created node
  mesh: Remove unused function prototypes from node.h
  mesh: Create a queue of pending requests in mesh_init()
  mesh: Clean up Import() method call
  mesh: Clean up Attach() method call
  mesh: Fix memory leak in Create, Import & Attach methods
  mesh: Clean up Join() method

 mesh/agent.c |  10 ++--
 mesh/mesh.c  | 136 ++++++++++++++++++---------------------------------
 mesh/node.c  |  57 ++++++++++++---------
 mesh/node.h  |   7 ++-
 4 files changed, 88 insertions(+), 122 deletions(-)

-- 
2.26.2

