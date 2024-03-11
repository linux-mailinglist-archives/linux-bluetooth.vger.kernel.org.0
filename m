Return-Path: <linux-bluetooth+bounces-2441-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE61878A32
	for <lists+linux-bluetooth@lfdr.de>; Mon, 11 Mar 2024 22:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D024AB20B92
	for <lists+linux-bluetooth@lfdr.de>; Mon, 11 Mar 2024 21:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FBD057300;
	Mon, 11 Mar 2024 21:50:08 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E1A56B7F
	for <linux-bluetooth@vger.kernel.org>; Mon, 11 Mar 2024 21:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710193807; cv=none; b=jhDiitejsiXfrqz++rTQ10HbIoa3B6ybs0NkEUhMX2pHxLw413AB9x/Zi/iEgT+3XBpYODsOqTayaqUZqke8xtER4kFgrnTrKptjyEEjuClUfybIRl9bhTsF/tuLejFebfPRBwS1UkO91TssG2jl+xz5nWeycKihyIACch5s98w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710193807; c=relaxed/simple;
	bh=8CWy7yQAZ/4JZBIif/DTp7WMMVIFt0WevEHTptyTTUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AnDZPFYe8HiZ3QZIzlGsLZwoPoaGBtuIZph2gaE2+76+++ntbS8PkuwbjXD9xQzC1ctw7fbsv85kbFzBoxXoRk3XNaobejg4pAFTDsBs5SGfjTDXtYQC3SzKFZEf95U3TfeuYuF9YX0Npqi2uAgfkpwsVdU+GPH7OYRwSuzm10g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjnWz-0003DY-QC; Mon, 11 Mar 2024 22:50:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjnWz-005nDn-DH; Mon, 11 Mar 2024 22:50:01 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjnWz-004IoY-14;
	Mon, 11 Mar 2024 22:50:01 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 2/3] Bluetooth: hci_bcm: Convert to platform remove callback returning void
Date: Mon, 11 Mar 2024 22:49:53 +0100
Message-ID:  <75fe619ff30d0d974492c70f3bab032ddafb4d95.1710193561.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710193561.git.u.kleine-koenig@pengutronix.de>
References: <cover.1710193561.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1842; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=8CWy7yQAZ/4JZBIif/DTp7WMMVIFt0WevEHTptyTTUo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl73yDMKcGelQOjbLd5icGuBKpbWQx7NCStpHgK KC3pDBMaQ2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZe98gwAKCRCPgPtYfRL+ TkeJB/wLcvWgOvdij+Jymv56cZyfvdE57pvUN2lPoPZdD07GalOliXiAcoV5hqEDls9zPlKHryA 6lmT5xwgN+xwEuEGjcfRXGPJyR8ihRRLG3Izs46ISzQ/qxTmRuvgl9xphdEjasAv0b18h85wH85 MIjok/lAS9LxbY/M2JgoYm92QIgOchDs4FGpZLiF2Z6M12YiNsG1gDf0ie2kyHPSP1ZvUXihOR2 6Oe3HibuQpcANjyJRaM/Qi0PpJOdHnRNfy3wI/6l1iBLX2Vu0IstE0dCVCFsuRSKMOuh+Uc8Fqo tS9q+EALtqf+ho2JWK3HL6quFW1+CyGe9k5qQTmMPqlZCVJz
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-bluetooth@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/bluetooth/hci_bcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 874d23089b39..3a227f73c063 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -1293,7 +1293,7 @@ static int bcm_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int bcm_remove(struct platform_device *pdev)
+static void bcm_remove(struct platform_device *pdev)
 {
 	struct bcm_device *dev = platform_get_drvdata(pdev);
 
@@ -1302,8 +1302,6 @@ static int bcm_remove(struct platform_device *pdev)
 	mutex_unlock(&bcm_device_lock);
 
 	dev_info(&pdev->dev, "%s device unregistered.\n", dev->name);
-
-	return 0;
 }
 
 static const struct hci_uart_proto bcm_proto = {
@@ -1509,7 +1507,7 @@ static const struct dev_pm_ops bcm_pm_ops = {
 
 static struct platform_driver bcm_driver = {
 	.probe = bcm_probe,
-	.remove = bcm_remove,
+	.remove_new = bcm_remove,
 	.driver = {
 		.name = "hci_bcm",
 		.acpi_match_table = ACPI_PTR(bcm_acpi_match),
-- 
2.43.0


