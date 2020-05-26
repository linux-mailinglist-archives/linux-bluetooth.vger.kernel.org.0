Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5B21986E7
	for <lists+linux-bluetooth@lfdr.de>; Tue, 31 Mar 2020 00:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730815AbgC3WCi (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Mar 2020 18:02:38 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:54803 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730794AbgC3WCi (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Mar 2020 18:02:38 -0400
Received: from localhost.localdomain (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 12B25CECA3
        for <linux-bluetooth@vger.kernel.org>; Tue, 31 Mar 2020 00:12:10 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 1/3] Bluetooth: Move debugfs configuration above the selftests
Date:   Tue, 31 Mar 2020 00:02:30 +0200
Message-Id: <20200330220232.397218-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This is just a cosmetic clean to move the selftests configuration option
to the bottom of the list of options.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 net/bluetooth/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/net/bluetooth/Kconfig b/net/bluetooth/Kconfig
index 165148c7c4ce..77703216a2e3 100644
--- a/net/bluetooth/Kconfig
+++ b/net/bluetooth/Kconfig
@@ -93,6 +93,14 @@ config BT_LEDS
 	  This option selects a few LED triggers for different
 	  Bluetooth events.
 
+config BT_DEBUGFS
+	bool "Export Bluetooth internals in debugfs"
+	depends on BT && DEBUG_FS
+	default y
+	help
+	  Provide extensive information about internal Bluetooth states
+	  in debugfs.
+
 config BT_SELFTEST
 	bool "Bluetooth self testing support"
 	depends on BT && DEBUG_KERNEL
@@ -120,12 +128,4 @@ config BT_SELFTEST_SMP
 	  Run test cases for SMP cryptographic functionality, including both
 	  legacy SMP as well as the Secure Connections features.
 
-config BT_DEBUGFS
-	bool "Export Bluetooth internals in debugfs"
-	depends on BT && DEBUG_FS
-	default y
-	help
-	  Provide extensive information about internal Bluetooth states
-	  in debugfs.
-
 source "drivers/bluetooth/Kconfig"
-- 
2.25.1

