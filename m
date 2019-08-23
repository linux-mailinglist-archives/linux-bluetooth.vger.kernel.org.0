Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74ABD9AD48
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Aug 2019 12:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405252AbfHWKcR (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 23 Aug 2019 06:32:17 -0400
Received: from vps.xff.cz ([195.181.215.36]:52632 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390545AbfHWKbs (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 23 Aug 2019 06:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1566556306; bh=m2aKtRbkPTkJVuTP8zfANK/QWGiSc2Jdal4+JCozxGg=;
        h=From:To:Cc:Subject:Date:References:From;
        b=L06V5E+mkypAmZdneB6hYyjjUgHu1laLiD9Wh+yKZ0GS6HqU85zz3VnR2U5Yqh8Cs
         wQLUPAQ/M5iElTZD+whjM+wQATeeHAFO7fXvdYhIHPm6F8VcsCcB0Upvp7zNkXFcqX
         fDbww4+L2ojZKXMHD7vkME/9BukKozBvzSOCNKMk=
From:   megous@megous.com
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, Ondrej Jirman <megous@megous.com>
Subject: [RESEND PATCH 1/5] dt-bindings: net: Add compatible for BCM4345C5 bluetooth device
Date:   Fri, 23 Aug 2019 12:31:35 +0200
Message-Id: <20190823103139.17687-2-megous@megous.com>
In-Reply-To: <20190823103139.17687-1-megous@megous.com>
References: <20190823103139.17687-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

This is present in the AP6526 WiFi/Bluetooth 5.0 module.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 Documentation/devicetree/bindings/net/broadcom-bluetooth.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
index c26f4e11037c..4fa00e2eafcf 100644
--- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
@@ -13,6 +13,7 @@ Required properties:
    * "brcm,bcm20702a1"
    * "brcm,bcm4330-bt"
    * "brcm,bcm43438-bt"
+   * "brcm,bcm4345c5"
 
 Optional properties:
 
-- 
2.23.0

