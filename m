Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79BD01621B3
	for <lists+linux-bluetooth@lfdr.de>; Tue, 18 Feb 2020 08:52:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgBRHwK (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 18 Feb 2020 02:52:10 -0500
Received: from mga04.intel.com ([192.55.52.120]:35670 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgBRHwK (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 18 Feb 2020 02:52:10 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Feb 2020 23:52:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,455,1574150400"; 
   d="scan'208";a="224063695"
Received: from ingas-nuc1.sea.intel.com ([10.252.201.157])
  by orsmga007.jf.intel.com with ESMTP; 17 Feb 2020 23:52:09 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] test/test-mesh: Fix output of MessageReceived method
Date:   Mon, 17 Feb 2020 23:52:08 -0800
Message-Id: <20200218075208.17135-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This fixes formatted output of recieved message parameters.
---
 test/test-mesh | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/test/test-mesh b/test/test-mesh
index 5777fcebc..929e28fd3 100755
--- a/test/test-mesh
+++ b/test/test-mesh
@@ -559,8 +559,15 @@ class Element(dbus.service.Object):
 	@dbus.service.method(MESH_ELEMENT_IFACE,
 					in_signature="qqvay", out_signature="")
 	def MessageReceived(self, source, key, destination, data):
-		print('Message Received on Element %d, src=%04x, dst=%s' %
-						self.index, source, destination)
+		print(('Message Received on Element %02x') % self.index, end='')
+		print(', src=', format(source, '04x'), end='')
+
+		if isinstance(destination, int):
+			print(', dst=%04x' % destination)
+		elif isinstance(destination, dbus.Array):
+			dst_str = array_to_string(destination)
+			print(', dst=' + dst_str)
+
 		for model in self.models:
 			model.process_message(source, key, data)
 
-- 
2.21.1

