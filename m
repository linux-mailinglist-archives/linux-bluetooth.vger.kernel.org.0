Return-Path: <linux-bluetooth+bounces-14552-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E79E2B2031A
	for <lists+linux-bluetooth@lfdr.de>; Mon, 11 Aug 2025 11:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40DFE7A7B9B
	for <lists+linux-bluetooth@lfdr.de>; Mon, 11 Aug 2025 09:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1F32DEA74;
	Mon, 11 Aug 2025 09:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VnZCRHoD"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BE12DD61E
	for <linux-bluetooth@vger.kernel.org>; Mon, 11 Aug 2025 09:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754903973; cv=none; b=QVsyeTyVuIqN6s7mvdancnvNltEjPuOLW/MScqUKe5HB++9QY8U6t08P330sqM/5Vy9pcbHSzd0J4//wkEtMknUcO5rENco9adnhkzU7aV9kttrN9CaiW6zlvvsbTWs62RixcMS6NqOHeXhOytTFSS04jLPzuI5KKmT+TAqrIxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754903973; c=relaxed/simple;
	bh=73ziJaTxTVfovg9zVWG0x3eTPSki4Bj74FK6rC2S2Ts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QBXCRsLOdD/F5Q6Xi6ygJo2Z7CokQ0v3uGf7nPtd12n2QEMf3xS6xtIfefjtVeCRnIp7sFyiQUvkZv2t+qcIx0DBEEYGeMq1glCUs0rCMtL/XqgJJXo+8zX70pccLuODxNdL1voHqUgMFMgC47O1v6C84JkAdeyIRfukeaQ7EQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VnZCRHoD; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754903968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NWPkSNsf50dMbQ5lIG9OwqZT1TDdouubduzQnRW9OKI=;
	b=VnZCRHoDdBDbeaNHxoAARW8uKwodVznLxUSTfqR7ZiecC9+z4LO/TGFDTr+e0XrlgS49q1
	/Txnxb8P7jn3b+w+iI4X696GXsHgHxIz82G1r0o85/srtv+gFJoRL1COtDlLB+21UBGLJ/
	nPVg35FoluhNxJ/ZOT2ZuGQMrYnxYdE=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: btintel_pcie: Use strscpy() instead of strscpy_pad()
Date: Mon, 11 Aug 2025 11:19:06 +0200
Message-ID: <20250811091906.4640-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

kzalloc() already zero-initializes the destination buffer 'data', making
strscpy() sufficient for safely copying 'name'. The additional
NUL-padding performed by strscpy_pad() is unnecessary.

Add a new local variable to store the length of 'name' and reuse it
instead of recalculating the same length.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/bluetooth/btintel_pcie.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
index 6e7bbbd35279..aad03f8a3e13 100644
--- a/drivers/bluetooth/btintel_pcie.c
+++ b/drivers/bluetooth/btintel_pcie.c
@@ -2236,6 +2236,7 @@ btintel_pcie_get_recovery(struct pci_dev *pdev, struct device *dev)
 {
 	struct btintel_pcie_dev_recovery *tmp, *data = NULL;
 	const char *name = pci_name(pdev);
+	const size_t name_len = strlen(name) + 1;
 	struct hci_dev *hdev = to_hci_dev(dev);
 
 	spin_lock(&btintel_pcie_recovery_lock);
@@ -2252,11 +2253,11 @@ btintel_pcie_get_recovery(struct pci_dev *pdev, struct device *dev)
 		return data;
 	}
 
-	data = kzalloc(struct_size(data, name, strlen(name) + 1), GFP_ATOMIC);
+	data = kzalloc(struct_size(data, name, name_len), GFP_ATOMIC);
 	if (!data)
 		return NULL;
 
-	strscpy_pad(data->name, name, strlen(name) + 1);
+	strscpy(data->name, name, name_len);
 	spin_lock(&btintel_pcie_recovery_lock);
 	list_add_tail(&data->list, &btintel_pcie_recovery_list);
 	spin_unlock(&btintel_pcie_recovery_lock);
-- 
2.50.1


