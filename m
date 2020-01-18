Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 535531415CA
	for <lists+linux-bluetooth@lfdr.de>; Sat, 18 Jan 2020 05:22:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgAREWf (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 17 Jan 2020 23:22:35 -0500
Received: from mga11.intel.com ([192.55.52.93]:11361 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726566AbgAREWf (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 17 Jan 2020 23:22:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jan 2020 20:22:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,332,1574150400"; 
   d="scan'208";a="220926437"
Received: from ingas-nuc1.sea.intel.com ([10.251.138.89])
  by fmsmga008.fm.intel.com with ESMTP; 17 Jan 2020 20:22:34 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/4] Add functionality to mesh-cfgclient tool
Date:   Fri, 17 Jan 2020 20:22:29 -0800
Message-Id: <20200118042233.15338-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This set of patches adds more functionality to mesh configuratioon tool
as well as a bit of code tightening.


Inga Stotland (4):
  tools/mesh: Refactor code for generating model ID
  tools/mesh: Add length checks for rxed messages
  tools/mesh: Add support for Vendor Model App Get/List
  tools/mesh: Implement model group subscription commands

 tools/mesh/cfgcli.c | 233 ++++++++++++++++++++++++++++++--------------
 1 file changed, 159 insertions(+), 74 deletions(-)

-- 
2.21.1

