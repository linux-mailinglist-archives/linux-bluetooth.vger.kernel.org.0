Return-Path: <linux-bluetooth+bounces-217-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3F07F9522
	for <lists+linux-bluetooth@lfdr.de>; Sun, 26 Nov 2023 20:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D907B1C2086A
	for <lists+linux-bluetooth@lfdr.de>; Sun, 26 Nov 2023 19:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABBB12E53;
	Sun, 26 Nov 2023 19:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F12102
	for <linux-bluetooth@vger.kernel.org>; Sun, 26 Nov 2023 11:47:03 -0800 (PST)
Received: from p200301077700a9001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:107:7700:a900:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1r7KeT-006khU-JE; Sun, 26 Nov 2023 20:18:45 +0100
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1r7KeT-000Slq-15;
	Sun, 26 Nov 2023 20:18:45 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com,
	johan@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	andreas@kemnade.info,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tomi.valkeinen@ideasonboard.com,
	Tony Lindgren <tony@atomide.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@gmail.com>,
	robh@kernel.org
Subject: [RFC PATCH 3/3] drivers: misc: ti-st: begin to deorbit
Date: Sun, 26 Nov 2023 20:18:40 +0100
Message-Id: <20231126191840.110564-4-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231126191840.110564-1-andreas@kemnade.info>
References: <20231126191840.110564-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TI-ST driver seems not to be used anymore. For bluetooth needs
there is hci_ll.c which has device tree support and can work without
this one. Also firmware download support is there, so it is also not needed
here. GPS can also reuse parts of the framework in hci_ll

Contrary from this driver, device tree support has been removed.

So start deorbiting it by marking it as broken.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/misc/ti-st/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/ti-st/Kconfig b/drivers/misc/ti-st/Kconfig
index 1503a6496f632..6bf9cc845745c 100644
--- a/drivers/misc/ti-st/Kconfig
+++ b/drivers/misc/ti-st/Kconfig
@@ -7,7 +7,7 @@ menu "Texas Instruments shared transport line discipline"
 config TI_ST
 	tristate "Shared transport core driver"
 	depends on NET && TTY
-	depends on GPIOLIB || COMPILE_TEST
+	depends on GPIOLIB || COMPILE_TEST || BROKEN
 	select FW_LOADER
 	help
 	  This enables the shared transport core driver for TI
-- 
2.39.2


