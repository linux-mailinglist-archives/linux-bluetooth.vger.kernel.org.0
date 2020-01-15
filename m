Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9941013BD2B
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 Jan 2020 11:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729783AbgAOKMx (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 Jan 2020 05:12:53 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33917 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729669AbgAOKMs (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 Jan 2020 05:12:48 -0500
Received: by mail-wr1-f66.google.com with SMTP id t2so15154824wrr.1
        for <linux-bluetooth@vger.kernel.org>; Wed, 15 Jan 2020 02:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sWr8uUgy0kJm8TRLNh5rzw5SEs7vJsYQ4hnJ+xxpROg=;
        b=qqcbG/Sd6WJ3LNZG2kmclwGUoxBoOEF0z/MomYT4pQReb57EpB4Dbl30Ab7okqMubO
         AiwiUpEnyhTGdfshU5lcI+DL200srdqVPOahHrP4Y0+2I8Sfn8V60scW7K+n6KPSJmwH
         8wI2/HjmOrwsUEg8Z0sJkcBwR9uemDnL7OzM1wQmWEk2WMYzhkrro4t9EVQqFG/akrzK
         TQHSMtCYghj4hnCTusSUcmz8HXaoHB0Snn525QjAflPqa3hwkL6hUlxKyPQtf19PBQvb
         WocJTyRpxqSxL5fp2pZNjEBBnfwk7M2McTMtokj1CtNxVIV4WElHHpbuUvE+m1q1kyhD
         OCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sWr8uUgy0kJm8TRLNh5rzw5SEs7vJsYQ4hnJ+xxpROg=;
        b=dcRDye8dAplDndPUzT59nkLOlWXmG5qlciBOQ2l0jF1hqLuLLIFmiJHGHod4oOrxtn
         IZV6rJLHYfuzSqYp2kukrw1ujQjefJSRuREqETZuT1VWWz4jjBNVWD8lJiaQgO2upWMO
         V76WOEdI7Eq7cNyPvA/7Usb8Qf+1bHwbLcvAhzVJwk7H5W3F5RteZJ/9p/UCxspqoqkW
         Ys1Gfhx8jMMfYJ8Po2KiG5IfSkLqpWq4GsyC23mwbG+a55CKhNI9LraZP+0/acBYRUSV
         DUCSACCqCBXTFDIildxxel9XHXH9Poesnzqw7JclGF9tRvfZYwg/adS8rmESBzvDVgXR
         aKhA==
X-Gm-Message-State: APjAAAVmuHNKaKFaXPx5bJyjl0EMpMbdERGPK1XOrEoDz8qlCuXKdQw9
        7nQRfn9CVzU6PjMMOywOb1Qaww==
X-Google-Smtp-Source: APXvYqwk3es76GbViI9iwqiA7Mv42Dn1BSufK8TEk6AOSW8YcdbS4i2kI/hho+ZO1d26iMUx3ckMBg==
X-Received: by 2002:adf:f7c4:: with SMTP id a4mr29610894wrq.332.1579083166487;
        Wed, 15 Jan 2020 02:12:46 -0800 (PST)
Received: from glaroque-ThinkPad-T480.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id g7sm23828223wrq.21.2020.01.15.02.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 02:12:45 -0800 (PST)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org
Cc:     johan@kernel.org, nsaenzjulienne@suse.de,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
Subject: [PATCH v7 1/2] dt-bindings: net: bluetooth: add interrupts properties
Date:   Wed, 15 Jan 2020 11:12:42 +0100
Message-Id: <20200115101243.17094-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115101243.17094-1-glaroque@baylibre.com>
References: <20200115101243.17094-1-glaroque@baylibre.com>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

add interrupts and interrupt-names as optional properties
to support host-wakeup by interrupt properties instead of
host-wakeup-gpios.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 .../devicetree/bindings/net/broadcom-bluetooth.txt         | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
index c44a30dbe43d..dd258674633c 100644
--- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
@@ -23,7 +23,9 @@ Optional properties:
  - max-speed: see Documentation/devicetree/bindings/serial/slave-device.txt
  - shutdown-gpios: GPIO specifier, used to enable the BT module
  - device-wakeup-gpios: GPIO specifier, used to wakeup the controller
- - host-wakeup-gpios: GPIO specifier, used to wakeup the host processor
+ - host-wakeup-gpios: GPIO specifier, used to wakeup the host processor.
+                      deprecated, replaced by interrupts and
+                      "host-wakeup" interrupt-names
  - clocks: 1 or 2 clocks as defined in clock-names below, in that order
  - clock-names: names for clock inputs, matching the clocks given
    - "extclk": deprecated, replaced by "txco"
@@ -37,7 +39,8 @@ Optional properties:
     - pcm-frame-type: short, long
     - pcm-sync-mode: slave, master
     - pcm-clock-mode: slave, master
-
+ - interrupts: must be one, used to wakeup the host processor
+ - interrupt-names: must be "host-wakeup"
 
 Example:
 
-- 
2.17.1

