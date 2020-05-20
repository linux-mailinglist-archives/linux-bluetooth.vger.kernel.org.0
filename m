Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA3B71DC08C
	for <lists+linux-bluetooth@lfdr.de>; Wed, 20 May 2020 22:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgETUul (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 20 May 2020 16:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727018AbgETUul (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 20 May 2020 16:50:41 -0400
X-Greylist: delayed 309 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 20 May 2020 13:50:41 PDT
Received: from sadachbia.lurk.space (sadachbia.lurk.space [IPv6:2a03:4000:6:d293::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E76C061A0E
        for <linux-bluetooth@vger.kernel.org>; Wed, 20 May 2020 13:50:41 -0700 (PDT)
From:   Alvar Penning <post@0x21.biz>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=0x21.biz; s=mail;
        t=1590007531; bh=VHf2TM/HNVKvbgNgpMaHa8jJqNgwXMI57T4nzMA4GJo=;
        h=From:To:Cc:Subject:Date;
        b=D1jPBHChc6Masp2IzIVKQgpNs7cgdR+AKyFfUEqFhpmaKzOXjzQvnw8TyKFVaWp5z
         t2DmZZrLq9mMw79yKBzi7k8WSi0BroBX5574Z8zf0tWjAU0Jvf55GMKWM81buU13UG
         2mmKnlyIbsuAEvOJnD8+WqTDzhawiWxB/gWhAqlo=
To:     linux-bluetooth@vger.kernel.org
Cc:     Alvar Penning <post@0x21.biz>
Subject: [PATCH BlueZ] test/example-advertisement: Fix include_tx_power
Date:   Wed, 20 May 2020 22:44:44 +0200
Message-Id: <20200520204444.28994-1-post@0x21.biz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Adding the Tx Power Level is no longer done via IncludeTxPower, but via
the tx-power value in the Includes array. The previous code did not
throw an error, but neither led to the insertion of the value. As a
result of this change, include_tx_power now adds the Tx Power Level
again.
---
 test/example-advertisement | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/test/example-advertisement b/test/example-advertisement
index f116893b6..96e410683 100755
--- a/test/example-advertisement
+++ b/test/example-advertisement
@@ -57,7 +57,7 @@ class Advertisement(dbus.service.Object):
         self.solicit_uuids = None
         self.service_data = None
         self.local_name = None
-        self.include_tx_power = None
+        self.include_tx_power = False
         self.data = None
         dbus.service.Object.__init__(self, bus, self.path)
 
@@ -78,8 +78,8 @@ class Advertisement(dbus.service.Object):
                                                         signature='sv')
         if self.local_name is not None:
             properties['LocalName'] = dbus.String(self.local_name)
-        if self.include_tx_power is not None:
-            properties['IncludeTxPower'] = dbus.Boolean(self.include_tx_power)
+        if self.include_tx_power:
+            properties['Includes'] = dbus.Array(["tx-power"], signature='s')
 
         if self.data is not None:
             properties['Data'] = dbus.Dictionary(
-- 
2.25.4

