Return-Path: <linux-bluetooth+bounces-1970-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4557858DAB
	for <lists+linux-bluetooth@lfdr.de>; Sat, 17 Feb 2024 08:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A03A12830E1
	for <lists+linux-bluetooth@lfdr.de>; Sat, 17 Feb 2024 07:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3DD51D529;
	Sat, 17 Feb 2024 07:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="PuMWz8ZT"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1981CD28
	for <linux-bluetooth@vger.kernel.org>; Sat, 17 Feb 2024 07:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708155124; cv=none; b=DgC2dxWA2XJReO8boDEz4voFzdbdmDKmoMzL8SwfcoMtxcQiJKgK1/HiDlwgYipbj/8GnOSF0zdpq4Qh3/Xhtb6d8MWAEkKjimJWSozFZp7ofUEbQjoYU4Z/UL65SbK8qS+j8CxsB/oCohSmG2v2+A0WHxDGxjWmIw7vTn2VfnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708155124; c=relaxed/simple;
	bh=3wE0OY454mubqM9kqU3kHG80CJKYun5q3sKzkDVg2vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KIBjBsryqjtx4ejs6RKV8KG/ctcZEeHv5HeiBlf73d/bTA7j1A+Vq6kn4TGVW173JC4UvSI7oNtit5L6OGmpmmv+hzkOZFgWYmroni5Nlb75jxjEeIatm1cALZAFhE/uovVKh2c0DDgn36o2/W0+VPxsjTRGSE3doV6jFE5K04E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=PuMWz8ZT; arc=none smtp.client-ip=80.12.242.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id bF9rr7RBlRhCJbF9tr0LVY; Sat, 17 Feb 2024 08:30:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1708155049;
	bh=5vKyutSF5vbJeBYhO1altd+rC0SgjetnS/HWHgINoOs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PuMWz8ZTELKEI8vMRbQe6sW8sB9UIkS8KOjwo8ppSOudEaxa0Lgmi5UFIpWeQIVYT
	 Hg8au41CCBRXki8wWZso2guY1wUC/4Mpf9rpSHiDTqjE6ojSzFGiVYeurLICDSeOfK
	 E1V27m6vMF9Y8tKWjykO3djjzhW9CCLiZv23uFgbmH15+Wp+kmzYATvvcH1vDXlGt0
	 RP2krzxKEzp5Q+T8aY0w85zPLl6bRvtFMKobcgCoPOdU7R8lTydn4Dbr63omIqg8yb
	 b/ySRMCSRFaOeD5yl6/hYQuMj6ITg227LEOy9bZmYLlFwrQTnHW288nsF53SWkgXvd
	 J1wZeKzEafSaA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 17 Feb 2024 08:30:49 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-bluetooth@vger.kernel.org
Subject: [PATCH 2/2] Bluetooth: btbcm: Use devm_kstrdup()
Date: Sat, 17 Feb 2024 08:30:42 +0100
Message-ID: <272fb12e9392c0bc6fead23931f98ea45bf6fc69.1708154999.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <79b9c9d9f86b4c573f0d3f2dac0a6fc9e6024058.1708154999.git.christophe.jaillet@wanadoo.fr>
References: <79b9c9d9f86b4c573f0d3f2dac0a6fc9e6024058.1708154999.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_kstrdup() instead of hand-writing it.
It is less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/bluetooth/btbcm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
index 01d2343b4978..f9a7c790d7e2 100644
--- a/drivers/bluetooth/btbcm.c
+++ b/drivers/bluetooth/btbcm.c
@@ -544,7 +544,6 @@ static const char *btbcm_get_board_name(struct device *dev)
 	struct device_node *root;
 	char *board_type;
 	const char *tmp;
-	int len;
 
 	root = of_find_node_by_path("/");
 	if (!root)
@@ -554,9 +553,7 @@ static const char *btbcm_get_board_name(struct device *dev)
 		return NULL;
 
 	/* get rid of any '/' in the compatible string */
-	len = strlen(tmp) + 1;
-	board_type = devm_kzalloc(dev, len, GFP_KERNEL);
-	strscpy(board_type, tmp, len);
+	board_type = devm_kstrdup(dev, tmp, GFP_KERNEL);
 	strreplace(board_type, '/', '-');
 	of_node_put(root);
 
-- 
2.43.2


