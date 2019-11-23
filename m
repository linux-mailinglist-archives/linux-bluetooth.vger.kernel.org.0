Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42939107DFB
	for <lists+linux-bluetooth@lfdr.de>; Sat, 23 Nov 2019 11:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbfKWKBR (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 23 Nov 2019 05:01:17 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:45450 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbfKWKBR (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 23 Nov 2019 05:01:17 -0500
Received: from localhost.localdomain (p4FF9F0D1.dip0.t-ipconnect.de [79.249.240.209])
        by mail.holtmann.org (Postfix) with ESMTPSA id 61364CECC4
        for <linux-bluetooth@vger.kernel.org>; Sat, 23 Nov 2019 11:10:23 +0100 (CET)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: net: bluetooth: update broadcom-bluetooth
Date:   Sat, 23 Nov 2019 11:01:10 +0100
Message-Id: <20191123100111.219190-3-marcel@holtmann.org>
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
index f16b99571af1..065f2e117eca 100644
--- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
@@ -30,6 +30,12 @@ Optional properties:
    - "lpo": external low power 32.768 kHz clock
  - vbat-supply: phandle to regulator supply for VBAT
  - vddio-supply: phandle to regulator supply for VDDIO
+ - brcm,bt-pcm-int-params: configure PCM parameters via a 5-byte array
+    - sco-routing: PCM, Transport, Codec, I2S
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

