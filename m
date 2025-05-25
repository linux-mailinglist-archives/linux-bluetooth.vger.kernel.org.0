Return-Path: <linux-bluetooth+bounces-12560-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB1FAC33B8
	for <lists+linux-bluetooth@lfdr.de>; Sun, 25 May 2025 11:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 211FF17741F
	for <lists+linux-bluetooth@lfdr.de>; Sun, 25 May 2025 09:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211A41E833C;
	Sun, 25 May 2025 09:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUzNK/mw"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C790B1DF254
	for <linux-bluetooth@vger.kernel.org>; Sun, 25 May 2025 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748167192; cv=none; b=iqX8B2jquTAaSW0WGvl4y0oVd/wU8AoCCSbDcqfDgBgZ2ARg+2V/+EnCVtF/PlcWg75T91NEWeBR/9c2iw9L7+GqarPr4TMwaEiBv8xLTNSe+JgVzYQq0bneEFFq0NjkqKyCyKYUdto1p5EZy1LaPpizJTjPxLQ2fET++9+LTE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748167192; c=relaxed/simple;
	bh=PSQidJNwXQriNZoeOTsl6Co5Jua7X5IJK196crLjgdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EZzhk7gK2ldVZjIqdeH0SZ+CTNTrK42puEy12aMDyCw/Ut4wlwREvEm2MdPnPEuHtmCRtVR1rSySKvtv8nLRl4YzOAwbEKDoAhWn2xBp16dXxtm6FAWrkgl14hd3OX2HqqcSmTveuitJS7oOaq/BSMt2oO5m+q2L2UVC4dN2j2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUzNK/mw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748167191; x=1779703191;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PSQidJNwXQriNZoeOTsl6Co5Jua7X5IJK196crLjgdU=;
  b=WUzNK/mwoHxlRh2+N4ZLka6D/m4tMx4A52HDqAzKH7M+VhIdhTcWUi8C
   luKE5hkULvMH5ulbB1Zvjgrk/LzJdJ/PED9khP0TB3ArQ2WmScKAa0rUv
   bqXevtpUhZDNJVyxF9LshLO5zlec7286pKJ9xj0rcHaMRo0wi67de8Qa4
   QhJt9/OX+cRKekkf77Wt3lRj4AWKSDzxzWPADSNU+JhyErmp2g6+HiA2L
   Kn9oreAztuCp6w6Wd/1JVhmlaTWyIbEPqImLfUavYBFq1rSGzTfE4u3wA
   x9cGzDvifb1CAMEZ8B36ICshgxzhPqfll6MNv8gE2jhV4g0bWmJZJZlrm
   A==;
X-CSE-ConnectionGUID: ldsGJGidSG2DtUXRxoYyxg==
X-CSE-MsgGUID: aRy9k0wSTUejBLG4Oj6SlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="53953696"
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="53953696"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 02:59:50 -0700
X-CSE-ConnectionGUID: 3hZe+BRsRAKp4lFE4j+cNA==
X-CSE-MsgGUID: thn6lFH2Tv6EtWgj0pd7Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="165098971"
Received: from unknown (HELO intel-Lenovo-Legion-Y540-15IRH-PG0.iind.intel.com) ([10.224.186.95])
  by fmviesa002.fm.intel.com with ESMTP; 25 May 2025 02:59:48 -0700
From: Kiran K <kiran.k@intel.com>
To: linux-bluetooth@vger.kernel.org
Cc: ravishankar.srivatsa@intel.com,
	chethan.tumkur.narayan@intel.com,
	chandrashekar.devegowda@intel.com,
	vijay.satija@intel.com,
	Kiran K <kiran.k@intel.com>
Subject: [PATCH v2 1/2] Bluetooth: btintel_pcie: Fix potential race condition in firmware download
Date: Sun, 25 May 2025 15:46:18 +0530
Message-ID: <20250525101619.530255-1-kiran.k@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During firmware download, if an error occurs, interrupts must be
disabled, synchronized, and re-enabled before retrying the download.
This change ensures proper interrupt handling to prevent race
conditions.

Signed-off-by: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
Signed-off-by: Kiran K <kiran.k@intel.com>
---
 drivers/bluetooth/btintel_pcie.c | 33 ++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
index 50fe17f1e1d1..74a957784525 100644
--- a/drivers/bluetooth/btintel_pcie.c
+++ b/drivers/bluetooth/btintel_pcie.c
@@ -2028,6 +2028,28 @@ static void btintel_pcie_release_hdev(struct btintel_pcie_data *data)
 	data->hdev = NULL;
 }
 
+static void btintel_pcie_disable_interrupts(struct btintel_pcie_data *data)
+{
+	spin_lock(&data->irq_lock);
+	btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_MSIX_FH_INT_MASK, data->fh_init_mask);
+	btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_MSIX_HW_INT_MASK, data->hw_init_mask);
+	spin_unlock(&data->irq_lock);
+}
+
+static void btintel_pcie_enable_interrupts(struct btintel_pcie_data *data)
+{
+	spin_lock(&data->irq_lock);
+	btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_MSIX_FH_INT_MASK, ~data->fh_init_mask);
+	btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_MSIX_HW_INT_MASK, ~data->hw_init_mask);
+	spin_unlock(&data->irq_lock);
+}
+
+static void btintel_pcie_synchronize_irqs(struct btintel_pcie_data *data)
+{
+	for (int i = 0; i < data->alloc_vecs; i++)
+		synchronize_irq(data->msix_entries[i].vector);
+}
+
 static int btintel_pcie_setup_internal(struct hci_dev *hdev)
 {
 	struct btintel_pcie_data *data = hci_get_drvdata(hdev);
@@ -2147,6 +2169,8 @@ static int btintel_pcie_setup(struct hci_dev *hdev)
 		bt_dev_err(hdev, "Firmware download retry count: %d",
 			   fw_dl_retry);
 		btintel_pcie_dump_debug_registers(hdev);
+		btintel_pcie_disable_interrupts(data);
+		btintel_pcie_synchronize_irqs(data);
 		err = btintel_pcie_reset_bt(data);
 		if (err) {
 			bt_dev_err(hdev, "Failed to do shr reset: %d", err);
@@ -2154,6 +2178,7 @@ static int btintel_pcie_setup(struct hci_dev *hdev)
 		}
 		usleep_range(10000, 12000);
 		btintel_pcie_reset_ia(data);
+		btintel_pcie_enable_interrupts(data);
 		btintel_pcie_config_msix(data);
 		err = btintel_pcie_enable_bt(data);
 		if (err) {
@@ -2286,6 +2311,12 @@ static void btintel_pcie_remove(struct pci_dev *pdev)
 
 	data = pci_get_drvdata(pdev);
 
+	btintel_pcie_disable_interrupts(data);
+
+	btintel_pcie_synchronize_irqs(data);
+
+	flush_workqueue(data->workqueue);
+
 	btintel_pcie_reset_bt(data);
 	for (int i = 0; i < data->alloc_vecs; i++) {
 		struct msix_entry *msix_entry;
@@ -2298,8 +2329,6 @@ static void btintel_pcie_remove(struct pci_dev *pdev)
 
 	btintel_pcie_release_hdev(data);
 
-	flush_work(&data->rx_work);
-
 	destroy_workqueue(data->workqueue);
 
 	btintel_pcie_free(data);
-- 
2.43.0


