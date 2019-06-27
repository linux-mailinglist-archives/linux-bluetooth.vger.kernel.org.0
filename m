Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E503058E26
	for <lists+linux-bluetooth@lfdr.de>; Fri, 28 Jun 2019 00:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbfF0Wsu (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 27 Jun 2019 18:48:50 -0400
Received: from mga17.intel.com ([192.55.52.151]:6157 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726633AbfF0Wsu (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 27 Jun 2019 18:48:50 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Jun 2019 15:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,425,1557212400"; 
   d="scan'208";a="183556400"
Received: from ingas-nuc1.sea.intel.com ([10.252.196.161])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2019 15:48:50 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, michal.lowas-rzechonek@silvair.com,
        Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 4/4 v2] test: test-mesh - Correctly stop periodic publication
Date:   Thu, 27 Jun 2019 15:48:45 -0700
Message-Id: <20190627224845.20762-5-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627224845.20762-1-inga.stotland@intel.com>
References: <20190627224845.20762-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This changes the order of checks for an updated publication period:
check for zero address first, and if this is the case, stop sending
the periodic model publications.
---
 test/test-mesh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/test/test-mesh b/test/test-mesh
index c075a642b..4d515e186 100755
--- a/test/test-mesh
+++ b/test/test-mesh
@@ -606,15 +606,15 @@ class OnOffServer(Model):
 
 	def set_publication(self, period):
 
-		# We do not handle ms in this example
-		if period < 1000:
-			return
-
 		self.pub_period = period
 		if period == 0:
 			self.timer.cancel()
 			return
 
+		# We do not handle ms in this example
+		if period < 1000:
+			return
+
 		self.timer.start(period/1000, self.publish)
 
 	def publish(self):
-- 
2.21.0

