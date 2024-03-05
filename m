Return-Path: <linux-bluetooth+bounces-2313-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D03872179
	for <lists+linux-bluetooth@lfdr.de>; Tue,  5 Mar 2024 15:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73EC4287FDD
	for <lists+linux-bluetooth@lfdr.de>; Tue,  5 Mar 2024 14:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A34F86630;
	Tue,  5 Mar 2024 14:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZj48FQN"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E30741A87
	for <linux-bluetooth@vger.kernel.org>; Tue,  5 Mar 2024 14:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709649094; cv=none; b=uMQYmHOygI/l3d7tc0Wxskl9xqxNBZzuN3Ks26vWBjHnhZZFp9l53YMd2XgVz76vla5epBnsvP6KuyZjaoaLIwM38r2H5rNOFFBtIT3k5d5EHWxJ70dPCC6vpqMWHgvZDZDdMiL9rX77F3PZ570MEwCv0Cbz4Uvpqv7slEkM2ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709649094; c=relaxed/simple;
	bh=miyJhHd1sPCo2jA2ZjM5M68yRoK0b5nH6A/pg74Pk4k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rRt7awsXMGCo0JAgiZS5bkJE+Ta5qEoFCtLsvjnTlJYjogOI9DUR4+MepVWZLnB9dzmsAGHWqEIMKpPxpEOhRj+IUFr1+VzZlhYsapzvJs361uOY/vxRKjlsnrv47NzSvQuixw5b2eq+Th9/u4UbSi2lA/466pZzT3wMGIF6JxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dZj48FQN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709649092; x=1741185092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=miyJhHd1sPCo2jA2ZjM5M68yRoK0b5nH6A/pg74Pk4k=;
  b=dZj48FQNSC17yaIFwHHqwFpj5ECSHZsSbal0EzkCe7Kzmf21+vn6QY8n
   heVoUv9yFwMsM1nb8ASI9JBAi0PR+ExxC8u5VUmXLPDOJoHL8BMu38OZX
   uTNVi2rlzBQqLdJMQyuP2iJsNTY0C+0CocGcQC5J4jD3EJveCl7f/TgYT
   yqKb+DJXOIWLm9LJiyveAfGDQWXGg3OijHMoXCeU56bIasXvT/IZajbKc
   j7L+2/3lgqt7NCCxT46y8TgzsSQ7iX6EQfD1u+1Ep8ryTGEgSu4hq4aMb
   jJQXFeyM3YeeGr8U9SuLxXsq2PU5mQoJM0G9AFPuNxvOHm7szAkiXMD+1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21727608"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="21727608"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 06:31:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9555678"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2024 06:31:19 -0800
From: Kiran K <kiran.k@intel.com>
To: linux-bluetooth@vger.kernel.org
Cc: ravishankar.srivatsa@intel.com,
	chethan.tumkur.narayan@intel.com,
	Kiran K <kiran.k@intel.com>
Subject: [PATCH v3 2/2] Bluetooth: btintel: Add support for downloading intermediate loader
Date: Tue,  5 Mar 2024 20:14:59 +0530
Message-Id: <20240305144459.119564-2-kiran.k@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305144459.119564-1-kiran.k@intel.com>
References: <20240305144459.119564-1-kiran.k@intel.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some variants of Intel controllers like BlazarI supports downloading of
Intermediate bootloader (IML) image. IML gives flexibility to fix issues as its
not possible to fix issue in Primary bootloader once flashed to ROM. This patch
adds the support to download IML before downloading operational firmware image.

dmesg logs:
[13.399003] Bluetooth: Core ver 2.22
[13.399006] Bluetooth: Starting self testing
[13.401194] Bluetooth: ECDH test passed in 2135 usecs
[13.421175] Bluetooth: SMP test passed in 597 usecs
[13.421184] Bluetooth: Finished self testing
[13.422919] Bluetooth: HCI device and connection manager initialized
[13.422923] Bluetooth: HCI socket layer initialized
[13.422925] Bluetooth: L2CAP socket layer initialized
[13.422930] Bluetooth: SCO socket layer initialized
[13.458065] Bluetooth: hci0: Device revision is 0
[13.458071] Bluetooth: hci0: Secure boot is disabled
[13.458072] Bluetooth: hci0: OTP lock is disabled
[13.458072] Bluetooth: hci0: API lock is enabled
[13.458073] Bluetooth: hci0: Debug lock is disabled
[13.458073] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[13.458075] Bluetooth: hci0: Bootloader timestamp 2022.46 buildtype 1 build 26590
[13.458324] Bluetooth: hci0: DSM reset method type: 0x00
[13.460678] Bluetooth: hci0: Found device firmware: intel/ibt-0090-0291-iml.sfi
[13.460684] Bluetooth: hci0: Boot Address: 0x30099000
[13.460685] Bluetooth: hci0: Firmware Version: 227-11.24
[13.562554] Bluetooth: hci0: Waiting for firmware download to complete
[13.563023] Bluetooth: hci0: Firmware loaded in 99941 usecs
[13.563057] Bluetooth: hci0: Waiting for device to boot
[13.565029] Bluetooth: hci0: Malformed MSFT vendor event: 0x02
[13.565148] Bluetooth: hci0: Device booted in 2064 usecs
[13.567065] Bluetooth: hci0: No device address configured
[13.569010] Bluetooth: hci0: Found device firmware: intel/ibt-0090-0291.sfi
[13.569061] Bluetooth: hci0: Boot Address: 0x10000800
[13.569062] Bluetooth: hci0: Firmware Version: 227-11.24
[13.788891] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[13.788897] Bluetooth: BNEP filters: protocol multicast
[13.788902] Bluetooth: BNEP socket layer initialized
[15.435905] Bluetooth: hci0: Waiting for firmware download to complete
[15.436016] Bluetooth: hci0: Firmware loaded in 1823233 usecs
[15.436258] Bluetooth: hci0: Waiting for device to boot
[15.471140] Bluetooth: hci0: Device booted in 34277 usecs
[15.471201] Bluetooth: hci0: Malformed MSFT vendor event: 0x02
[15.471487] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-0090-0291.ddc
[15.474353] Bluetooth: hci0: Applying Intel DDC parameters completed
[15.474486] Bluetooth: hci0: Found Intel DDC parameters: intel/bdaddress.cfg
[15.475299] Bluetooth: hci0: Applying Intel DDC parameters completed
[15.479381] Bluetooth: hci0: Firmware timestamp 2024.10 buildtype 3 build 58595
[15.479385] Bluetooth: hci0: Firmware SHA1: 0xb4f3cc46
[15.483243] Bluetooth: hci0: Fseq status: Success (0x00)
[15.483246] Bluetooth: hci0: Fseq executed: 00.00.00.00
[15.483247] Bluetooth: hci0: Fseq BT Top: 00.00.00.00
[15.578712] Bluetooth: MGMT ver 1.22
[15.822682] Bluetooth: RFCOMM TTY layer initialized
[15.822690] Bluetooth: RFCOMM socket layer initialized
[15.822695] Bluetooth: RFCOMM ver 1.11

Signed-off-by: Kiran K <kiran.k@intel.com>
---
 drivers/bluetooth/btintel.c | 38 ++++++++++++++++++++++++++++++++++++-
 drivers/bluetooth/btintel.h |  3 +++
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index ed98bb867cff..00e98606cf02 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -521,6 +521,9 @@ static int btintel_version_info_tlv(struct hci_dev *hdev,
 			    version->min_fw_build_nn, version->min_fw_build_cw,
 			    2000 + version->min_fw_build_yy);
 		break;
+	case IMG_IML:
+		variant = "Intermediate loader";
+		break;
 	case IMG_OP:
 		variant = "Firmware";
 		break;
@@ -2194,10 +2197,26 @@ static void btintel_get_fw_name_tlv(const struct intel_version_tlv *ver,
 				    char *fw_name, size_t len,
 				    const char *suffix)
 {
+	const char *format;
 	/* The firmware file name for new generation controllers will be
 	 * ibt-<cnvi_top type+cnvi_top step>-<cnvr_top type+cnvr_top step>
 	 */
-	snprintf(fw_name, len, "intel/ibt-%04x-%04x.%s",
+	switch (ver->cnvi_top & 0xfff) {
+	/* Only Blazar  product supports downloading of intermediate loader
+	 * image
+	 */
+	case CNVI_BLAZARI:
+		if (ver->img_type == IMG_BOOTLOADER)
+			format = "intel/ibt-%04x-%04x-iml.%s";
+		else
+			format = "intel/ibt-%04x-%04x.%s";
+		break;
+	default:
+			format = "intel/ibt-%04x-%04x.%s";
+		break;
+	}
+
+	snprintf(fw_name, len, format,
 		 INTEL_CNVX_TOP_PACK_SWAB(INTEL_CNVX_TOP_TYPE(ver->cnvi_top),
 					  INTEL_CNVX_TOP_STEP(ver->cnvi_top)),
 		 INTEL_CNVX_TOP_PACK_SWAB(INTEL_CNVX_TOP_TYPE(ver->cnvr_top),
@@ -2607,6 +2626,23 @@ static int btintel_bootloader_setup_tlv(struct hci_dev *hdev,
 	if (err)
 		return err;
 
+	err = btintel_read_version_tlv(hdev, ver);
+	if (err)
+		return err;
+
+	/* If image type returned is IMG_IML, then controller supports
+	 * intermediae loader image
+	 */
+	if (ver->img_type == IMG_IML) {
+		err = btintel_prepare_fw_download_tlv(hdev, ver, &boot_param);
+		if (err)
+			return err;
+
+		err = btintel_boot(hdev, boot_param);
+		if (err)
+			return err;
+	}
+
 	btintel_clear_flag(hdev, INTEL_BOOTLOADER);
 
 	btintel_get_fw_name_tlv(ver, ddcname, sizeof(ddcname), "ddc");
diff --git a/drivers/bluetooth/btintel.h b/drivers/bluetooth/btintel.h
index 52b2f1986f85..ae15b2253b6d 100644
--- a/drivers/bluetooth/btintel.h
+++ b/drivers/bluetooth/btintel.h
@@ -51,7 +51,10 @@ struct intel_tlv {
 	u8 val[];
 } __packed;
 
+#define CNVI_BLAZARI		0x900
+
 #define IMG_BOOTLOADER		0x01	/* Bootloader image */
+#define IMG_IML			0x02	/* Intermediate image */
 #define IMG_OP			0x03	/* Operational image */
 
 struct intel_version_tlv {
-- 
2.34.1


