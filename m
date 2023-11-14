Return-Path: <linux-bluetooth+bounces-72-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DC27EAAB8
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 Nov 2023 08:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 546B31C20844
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 Nov 2023 07:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCFBF9E1;
	Tue, 14 Nov 2023 07:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="iPgDBBrf"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDBF11732
	for <linux-bluetooth@vger.kernel.org>; Tue, 14 Nov 2023 07:05:15 +0000 (UTC)
X-Greylist: delayed 310 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 13 Nov 2023 23:05:13 PST
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE2513D;
	Mon, 13 Nov 2023 23:05:13 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 6CD7542623;
	Tue, 14 Nov 2023 07:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1699945511; bh=80m1kJxaIPINrUcVygyqLzCx1957gvMScN5A9MDipys=;
	h=From:Date:Subject:To:Cc;
	b=iPgDBBrfcNrIJJg8uajAf8QQaoufmxztBlh+2ccuXAdt55utwfM7r4TcCjjXyIxoo
	 2CCSEspJLP7UV8lQ3e6ceBHalOUtQ4mGq6LWqaKYDsD9/Fw42wA5YGepmhMu0g3DIH
	 qGWY+P+wwlbGsNl7vxqRX8PGlbarBaxVZYxId81x22jrBq5pipJH7TfY7uYdO36jNR
	 wP8M/H/aWpDkYgVK6+n+mTRxF1uTTcytVx3Lmd8cwwiOBT6pqsfB/lD4PNIxxFPLRp
	 qMulXNK488PtGR91wYwK21O9eH3UqEKoA0BqS5QoJb6IAHefXXLGc/8mwzVYKYUdfb
	 UHBfM9xEU3HMw==
From: Hector Martin <marcan@marcan.st>
Date: Tue, 14 Nov 2023 16:05:04 +0900
Subject: [PATCH] Bluetooth: hci_bcm4377: Fix msgid release
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231114-bluetooth-msgid-fix-v1-1-1d15394bf342@marcan.st>
X-B4-Tracking: v=1; b=H4sIAB8cU2UC/x2M0QpAMBRAf0X32S2bIX5FHozLbmHaRmr5d8vjO
 XVOBE+OyUOXRXB0s2d7JBB5BpMZj5WQ58QgC1kKIRTq7aJgbTC4+5VnXPhB2TZ1q6khVWlI5ek
 o6f/aD+/7AZ7rsRRlAAAA
To: Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Aditya Garg <gargaditya08@live.com>, 
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185; i=marcan@marcan.st;
 h=from:subject:message-id; bh=80m1kJxaIPINrUcVygyqLzCx1957gvMScN5A9MDipys=;
 b=owGbwMvMwCUm+yP4NEe/cRLjabUkhtRgGeU93tEGHw3nLDjvFzHlw+pwv1Pcufc5r8+Q3/768
 /tdfG8PdJSyMIhxMciKKbI0nug91e05/Zy6asp0mDmsTCBDGLg4BWAi7EqMDLOlrN7ckHKZEK2i
 +jXquETo4qUr5Bycdbn9eq43n46e+47hf3ywobuqWN6u5ZEH8i9PZz84b/Va6Sl+fi48q2Iv3LW
 +xwQA
X-Developer-Key: i=marcan@marcan.st; a=openpgp;
 fpr=FC18F00317968B7BE86201CBE22A629A4C515DD5

We are releasing a single msgid, so the order argument to
bitmap_release_region must be zero.

In practice this was probably harmlessly masked to 0 anyway, which is
why it worked, but it trips ubsan.

Fixes: 8a06127602de ("Bluetooth: hci_bcm4377: Add new driver for BCM4377 PCIe boards")
Reported-by: Aditya Garg <gargaditya08@live.com>
Cc: stable@vger.kernel.org
Signed-off-by: Hector Martin <marcan@marcan.st>
---
 drivers/bluetooth/hci_bcm4377.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 19ad0e788646..5e9f79235cde 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -715,7 +715,7 @@ static void bcm4377_handle_ack(struct bcm4377_data *bcm4377,
 		ring->events[msgid] = NULL;
 	}
 
-	bitmap_release_region(ring->msgids, msgid, ring->n_entries);
+	bitmap_release_region(ring->msgids, msgid, 0);
 
 unlock:
 	spin_unlock_irqrestore(&ring->lock, flags);

---
base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
change-id: 20231114-bluetooth-msgid-fix-29769be7e45b

Best regards,
-- 
Hector Martin <marcan@marcan.st>


