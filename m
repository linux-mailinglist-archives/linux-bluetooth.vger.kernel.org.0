Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2C91364F3
	for <lists+linux-bluetooth@lfdr.de>; Fri, 10 Jan 2020 02:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730622AbgAJBlr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 Jan 2020 20:41:47 -0500
Received: from mga01.intel.com ([192.55.52.88]:58409 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730596AbgAJBlr (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 Jan 2020 20:41:47 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Jan 2020 17:41:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,414,1571727600"; 
   d="scan'208";a="236689153"
Received: from ingas-nuc1.sea.intel.com ([10.254.104.252])
  by orsmga002.jf.intel.com with ESMTP; 09 Jan 2020 17:41:46 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/2] Fix AppKey deletion
Date:   Thu,  9 Jan 2020 17:41:43 -0800
Message-Id: <20200110014145.1785-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch set contains fixes for:
 - deleting individual app key deletion as a result receiving
 Config AppKey Delete message. The fix removes a dulpicate attempt
 to write to config storage and some function call simplifications

- deleting a number of appkeys as a result of receiving
Config NetKey Delete message. When deleting multiple entries from a
queue, do not use queue iteration mechanism as the deletion of
multiple entries may result in seg fault. Instead, find and delete
bound keys one by one until none are found.
 

Inga Stotland (2):
  mesh: Fix logic in AppKey deletion
  mesh: Fix wholesale deletion of appkeys bound to a netkey

 mesh/appkey.c | 32 ++++++++++++++++++++++++--------
 mesh/node.c   | 29 ++---------------------------
 mesh/node.h   |  4 ++--
 3 files changed, 28 insertions(+), 37 deletions(-)

-- 
2.21.1

