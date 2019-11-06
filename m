Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A96DCF0B0F
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 Nov 2019 01:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387510AbfKFAaT (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 5 Nov 2019 19:30:19 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43947 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730638AbfKFAaN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 5 Nov 2019 19:30:13 -0500
Received: by mail-pg1-f194.google.com with SMTP id l24so15843018pgh.10
        for <linux-bluetooth@vger.kernel.org>; Tue, 05 Nov 2019 16:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wC1fV3XmJiisvf6Wmub25EKlo5Tq9rK55tShjUn1JT0=;
        b=jfzwzkArakv+2H4BiI7PnShrmXYvKyjGhz5dkAGMEfFJ0oHIdHV+dH9FeVwkQZ/N3e
         IjSijEYi3wNSpL6nPpXlTgw3sUkN5qGSgM14CN6r6afhxVqPjhZE+ztJb7XGJSXpzzHE
         YLxvo2fiKlwZHtPwoxvq6eiNnYKj2pOSN6OrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wC1fV3XmJiisvf6Wmub25EKlo5Tq9rK55tShjUn1JT0=;
        b=BPYb73OGGXrwPpYB0+JEDZvKSkNEJWDwCLUKmOp1ArihIULEEocIxr+dPqXjMpyACB
         3gmOYs9GRzz0xJeEXSAu0RSymdGaIbOLJNrv6qAZfHUAiZHNZ6yLG1IBSvARm1AYs1BU
         vwcHkVGy4iek1QJIH4G9vyDf/zfNBDhgEX/besyywfdAsDTeW55vSaPA0LECfG5n+ZwS
         qLMcQVdwtEtzxQztGUx8MieAq9psMiAwNY5je++B1Qp7BOEFcsupVWzOngyGkPXOSmC0
         O8NHIYwRFiwSdvnLEObpSD8rkRZB7NGfyC+DgsuIbwkQt2GsZPPOul9nzwGXSHFyZ4gN
         +oWA==
X-Gm-Message-State: APjAAAVR6emMqleE8mPqYcVAW8ksyjc/lahgkGCy3uMYFWbCgVCzSrUw
        7ysRgQ74wnlFbyutisgG4yzBOA==
X-Google-Smtp-Source: APXvYqx47hh5YbDuUa3YWMzpsYd8LTO0GxdEdRVR/2Z/sRZoF/LYzFRNgsN5YHICZtVdUUY1kfyW0w==
X-Received: by 2002:a17:90a:989:: with SMTP id 9mr13112pjo.35.1573000210856;
        Tue, 05 Nov 2019 16:30:10 -0800 (PST)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id k9sm21032835pfk.72.2019.11.05.16.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 16:30:10 -0800 (PST)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        devicetree@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Ondrej Jirman <megous@megous.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 4/4] dt-bindings: net: bluetooth: update broadcom-bluetooth
Date:   Tue,  5 Nov 2019 16:29:23 -0800
Message-Id: <20191106002923.109344-5-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191106002923.109344-1-abhishekpandit@chromium.org>
References: <20191106002923.109344-1-abhishekpandit@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Add documentation for pcm-parameters.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

---

 Documentation/devicetree/bindings/net/broadcom-bluetooth.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
index c749dc297624..ae60277b5569 100644
--- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
@@ -29,6 +29,9 @@ Optional properties:
    - "lpo": external low power 32.768 kHz clock
  - vbat-supply: phandle to regulator supply for VBAT
  - vddio-supply: phandle to regulator supply for VDDIO
+ - pcm-parameters: When set, will configure PCM parameters on the device. The
+   contents should be a 10-byte array corresponding to the pcm params (see
+   btbcm.h for more information).
 
 
 Example:
@@ -40,5 +43,6 @@ Example:
        bluetooth {
                compatible = "brcm,bcm43438-bt";
                max-speed = <921600>;
+               pcm-parameters = [1 2 0 1 1 0 0 0 0 0];
        };
 };
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

