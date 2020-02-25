Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E22716B6E8
	for <lists+linux-bluetooth@lfdr.de>; Tue, 25 Feb 2020 01:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728615AbgBYAvr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 24 Feb 2020 19:51:47 -0500
Received: from mga14.intel.com ([192.55.52.115]:60211 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728608AbgBYAvr (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 24 Feb 2020 19:51:47 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 16:51:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,482,1574150400"; 
   d="scan'208";a="436095390"
Received: from ingas-nuc1.sea.intel.com ([10.251.142.189])
  by fmsmga005.fm.intel.com with ESMTP; 24 Feb 2020 16:51:46 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 5/5] test/test-mesh: Fix output of UpdateModelConfig method
Date:   Mon, 24 Feb 2020 16:51:40 -0800
Message-Id: <20200225005141.9700-6-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200225005141.9700-1-inga.stotland@intel.com>
References: <20200225005141.9700-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This correctly unpacks configuration dictionary received
in the UpdateModelConfig() method
---
 test/test-mesh | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/test/test-mesh b/test/test-mesh
index 929e28fd3..6a5ddbd17 100755
--- a/test/test-mesh
+++ b/test/test-mesh
@@ -554,7 +554,7 @@ class Element(dbus.service.Object):
 	def set_model_config(self, configs):
 		for config in configs:
 			mod_id = config[0]
-			self.UpdateModelConfiguration(mod_id, config[1])
+			self.update_model_config(mod_id, config[1])
 
 	@dbus.service.method(MESH_ELEMENT_IFACE,
 					in_signature="qqvay", out_signature="")
@@ -575,6 +575,11 @@ class Element(dbus.service.Object):
 					in_signature="qa{sv}", out_signature="")
 
 	def UpdateModelConfiguration(self, model_id, config):
+		cfg = unwrap(config)
+		print(cfg)
+		self.update_model_config(model_id, cfg)
+
+	def update_model_config(self, model_id, config):
 		print(('Update Model Config '), end='')
 		print(format(model_id, '04x'))
 		for model in self.models:
@@ -644,11 +649,11 @@ class Model():
 	def print_subscriptions(self, subscriptions):
 		for sub in subscriptions:
 			if isinstance(sub, int):
-				print('%04x' % sub, end=' ')
+				print('%04x,' % sub, end=' ')
 
 			if isinstance(sub, list):
 				label = uuid.UUID(bytes=b''.join(sub))
-				print(label, end=' ')
+				print(label, ',', end=' ')
 
 ########################
 # On Off Server Model
-- 
2.21.1

