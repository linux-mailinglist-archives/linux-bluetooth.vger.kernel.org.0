Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B36B8109981
	for <lists+linux-bluetooth@lfdr.de>; Tue, 26 Nov 2019 08:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727169AbfKZHRj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 26 Nov 2019 02:17:39 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:47142 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbfKZHRi (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 26 Nov 2019 02:17:38 -0500
Received: from localhost.localdomain (p4FF9F0D1.dip0.t-ipconnect.de [79.249.240.209])
        by mail.holtmann.org (Postfix) with ESMTPSA id ABC1CCECF8
        for <linux-bluetooth@vger.kernel.org>; Tue, 26 Nov 2019 08:26:45 +0100 (CET)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: net: bluetooth: update broadcom-bluetooth
Date:   Tue, 26 Nov 2019 08:17:31 +0100
Message-Id: <20191126071732.67337-3-marcel@holtmann.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Add documentation for brcm,bt-pcm-int-params vendor specific
configuration of the SCO PCM settings.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 .../devicetree/bindings/net/broadcom-bluetooth.txt         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
index f16b99571af1..b02a53275c98 100644
--- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
@@ -30,6 +30,12 @@ Optional properties:
    - "lpo": external low power 32.768 kHz clock
  - vbat-supply: phandle to regulator supply for VBAT
  - vddio-supply: phandle to regulator supply for VDDIO
+ - brcm,bt-pcm-int-params: configure PCM parameters via a 5-byte array
+    - sco-routing: 0 = PCM, 1 = Transport, 2 = Codec, 3 = I2S
+    - pcm-interface-rate: 128KBps, 256KBps, 512KBps, 1024KBps, 2048KBps
+    - pcm-frame-type: short, long
+    - pcm-sync-mode: slave, master
+    - pcm-clock-mode: slave, master
 
 
 Example:
@@ -41,5 +47,6 @@ Example:
        bluetooth {
                compatible = "brcm,bcm43438-bt";
                max-speed = <921600>;
+               brcm,bt-pcm-int-params = [1 2 0 1 1];
        };
 };
-- 
2.23.0

