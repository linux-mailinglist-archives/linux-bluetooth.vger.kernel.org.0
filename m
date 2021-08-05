Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC2D3E0B3F
	for <lists+linux-bluetooth@lfdr.de>; Thu,  5 Aug 2021 02:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236282AbhHEAcs (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 4 Aug 2021 20:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236280AbhHEAcp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 4 Aug 2021 20:32:45 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13003C061799
        for <linux-bluetooth@vger.kernel.org>; Wed,  4 Aug 2021 17:32:31 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id ca5so5501302pjb.5
        for <linux-bluetooth@vger.kernel.org>; Wed, 04 Aug 2021 17:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9i8YeW1rZkiLW/FtILgg4miLaGXjykggBPYFrvdsfiE=;
        b=S4u1fIHKn1Yh/RfQVv+RU7rAcD1on1nRN2LsU1ctWbd11r2KMVozMWJSJ0bzl81gW/
         MgxWqjuZKgIblwgMYHZzyaO/pk1/afDI0UYZEwneuRmjUkMhO0hzaFohiPww+mli3fGq
         xtOXJf0fJBfV2zCl2WYo/Cb4jpHCewkCRPLCEJRllr+72EvpVE0eAiCJgJgzqNOy5W2X
         9+tfHMxVXoEbxc1LD17mFFyM6VwYuf/2JkOfXbljDusBi0leJXZQkFGRpkRrnD6HQpsh
         /4lu+l3qzYUn9yM7ZSHWGFdklDyJ+/aM+ca6WvJn65Occbc9ZqWn2x/UD1V95Yf3Q5Ii
         420g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9i8YeW1rZkiLW/FtILgg4miLaGXjykggBPYFrvdsfiE=;
        b=c3rsYlwsTGH5ziR1+0J6BNfJUrLMTwnC7ELqyTr/2l6erH7NBYMhTg+vGHnzvGBqXb
         EcqQ/tlfVWv/OA17SRtvJs1/t+gyX3fpZMGxX+YPyPzI3q72ZTrXZ4wd3mGWu3xIbHBv
         RNDVFgEAy8GQ2zh6jP0mW1sRY9TbOQahSzVJTr0iyfzNM1hr9SNcWnmJNjRE9m+xw3wM
         RN7WoRrbNx0Ap5bvlkV9CJA6tkB6acCx6mN110GNwj+VTtZkrXKc2zD1rFYheRv3sD0V
         S+hGkhVgwwmy9W2+rGX2016UXqCceudDFxby1UDaDt2frTfGR1uMVhc9AyBC6xSapdsd
         E0ZA==
X-Gm-Message-State: AOAM530R0n9EM1yhvHWxgSmqETKz++TC/J2OtFTpUXB7TtADB7yYkBrC
        0siNwx+PfHIao35I9xdQKlqvBC67HhM=
X-Google-Smtp-Source: ABdhPJzDi0BPR1Xr9Pv9CaAKqISBShNJSv9rpjrVpqT9W4YBiUPlP+C/+dYvW2Js1ypmdvOOEFkrIg==
X-Received: by 2002:a65:6a4d:: with SMTP id o13mr1647174pgu.361.1628123550053;
        Wed, 04 Aug 2021 17:32:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c0:6a01:d830:e0b8:5332:84:7056])
        by smtp.gmail.com with ESMTPSA id q4sm4761787pgv.16.2021.08.04.17.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 17:32:29 -0700 (PDT)
From:   Tedd Ho-Jeong An <hj.tedd.an@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Tedd Ho-Jeong An <tedd.an@intel.com>
Subject: [PATCH v7 08/12] Bluetooth: btintel: Refactoring setup routine for bootloader devices
Date:   Wed,  4 Aug 2021 17:32:15 -0700
Message-Id: <20210805003219.23221-9-hj.tedd.an@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805003219.23221-1-hj.tedd.an@gmail.com>
References: <20210805003219.23221-1-hj.tedd.an@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Tedd Ho-Jeong An <tedd.an@intel.com>

This patch refactors the setup routines for legacy and TLV based
bootloader devices to the combined setup, and move the related functions
from btusb to btintel.

Signed-off-by: Tedd Ho-Jeong An <tedd.an@intel.com>
---
 drivers/bluetooth/btintel.c | 725 ++++++++++++++++++++++++++++++-----
 drivers/bluetooth/btintel.h |  25 +-
 drivers/bluetooth/btusb.c   | 737 +-----------------------------------
 3 files changed, 661 insertions(+), 826 deletions(-)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index 9e9fd2222294..8593b27b7c4a 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -631,90 +631,7 @@ int btintel_read_version_tlv(struct hci_dev *hdev, struct intel_version_tlv *ver
 		return -EIO;
 	}
 
-	/* Consume Command Complete Status field */
-	skb_pull(skb, 1);
-
-	/* Event parameters contatin multiple TLVs. Read each of them
-	 * and only keep the required data. Also, it use existing legacy
-	 * version field like hw_platform, hw_variant, and fw_variant
-	 * to keep the existing setup flow
-	 */
-	while (skb->len) {
-		struct intel_tlv *tlv;
-
-		tlv = (struct intel_tlv *)skb->data;
-		switch (tlv->type) {
-		case INTEL_TLV_CNVI_TOP:
-			version->cnvi_top = get_unaligned_le32(tlv->val);
-			break;
-		case INTEL_TLV_CNVR_TOP:
-			version->cnvr_top = get_unaligned_le32(tlv->val);
-			break;
-		case INTEL_TLV_CNVI_BT:
-			version->cnvi_bt = get_unaligned_le32(tlv->val);
-			break;
-		case INTEL_TLV_CNVR_BT:
-			version->cnvr_bt = get_unaligned_le32(tlv->val);
-			break;
-		case INTEL_TLV_DEV_REV_ID:
-			version->dev_rev_id = get_unaligned_le16(tlv->val);
-			break;
-		case INTEL_TLV_IMAGE_TYPE:
-			version->img_type = tlv->val[0];
-			break;
-		case INTEL_TLV_TIME_STAMP:
-			/* If image type is Operational firmware (0x03), then
-			 * running FW Calendar Week and Year information can
-			 * be extracted from Timestamp information
-			 */
-			version->min_fw_build_cw = tlv->val[0];
-			version->min_fw_build_yy = tlv->val[1];
-			version->timestamp = get_unaligned_le16(tlv->val);
-			break;
-		case INTEL_TLV_BUILD_TYPE:
-			version->build_type = tlv->val[0];
-			break;
-		case INTEL_TLV_BUILD_NUM:
-			/* If image type is Operational firmware (0x03), then
-			 * running FW build number can be extracted from the
-			 * Build information
-			 */
-			version->min_fw_build_nn = tlv->val[0];
-			version->build_num = get_unaligned_le32(tlv->val);
-			break;
-		case INTEL_TLV_SECURE_BOOT:
-			version->secure_boot = tlv->val[0];
-			break;
-		case INTEL_TLV_OTP_LOCK:
-			version->otp_lock = tlv->val[0];
-			break;
-		case INTEL_TLV_API_LOCK:
-			version->api_lock = tlv->val[0];
-			break;
-		case INTEL_TLV_DEBUG_LOCK:
-			version->debug_lock = tlv->val[0];
-			break;
-		case INTEL_TLV_MIN_FW:
-			version->min_fw_build_nn = tlv->val[0];
-			version->min_fw_build_cw = tlv->val[1];
-			version->min_fw_build_yy = tlv->val[2];
-			break;
-		case INTEL_TLV_LIMITED_CCE:
-			version->limited_cce = tlv->val[0];
-			break;
-		case INTEL_TLV_SBE_TYPE:
-			version->sbe_type = tlv->val[0];
-			break;
-		case INTEL_TLV_OTP_BDADDR:
-			memcpy(&version->otp_bd_addr, tlv->val, tlv->len);
-			break;
-		default:
-			/* Ignore rest of information */
-			break;
-		}
-		/* consume the current tlv and move to next*/
-		skb_pull(skb, tlv->len + sizeof(*tlv));
-	}
+	btintel_parse_version_tlv(hdev, version, skb);
 
 	kfree_skb(skb);
 	return 0;
@@ -1192,10 +1109,10 @@ int btintel_download_firmware(struct hci_dev *hdev,
 }
 EXPORT_SYMBOL_GPL(btintel_download_firmware);
 
-int btintel_download_firmware_newgen(struct hci_dev *hdev,
-				     struct intel_version_tlv *ver,
-				     const struct firmware *fw, u32 *boot_param,
-				     u8 hw_variant, u8 sbe_type)
+static int btintel_download_fw_tlv(struct hci_dev *hdev,
+				   struct intel_version_tlv *ver,
+				   const struct firmware *fw, u32 *boot_param,
+				   u8 hw_variant, u8 sbe_type)
 {
 	int err;
 	u32 css_header_ver;
@@ -1292,7 +1209,6 @@ int btintel_download_firmware_newgen(struct hci_dev *hdev,
 	}
 	return 0;
 }
-EXPORT_SYMBOL_GPL(btintel_download_firmware_newgen);
 
 void btintel_reset_to_bootloader(struct hci_dev *hdev)
 {
@@ -1683,6 +1599,579 @@ static int btintel_legacy_rom_setup(struct hci_dev *hdev,
 	return 0;
 }
 
+static int btintel_download_wait(struct hci_dev *hdev, ktime_t calltime, int msec)
+{
+	ktime_t delta, rettime;
+	unsigned long long duration;
+	int err;
+
+	btintel_set_flag(hdev, INTEL_FIRMWARE_LOADED);
+
+	bt_dev_info(hdev, "Waiting for firmware download to complete");
+
+	err = btintel_wait_on_flag_timeout(hdev, INTEL_DOWNLOADING,
+					   TASK_INTERRUPTIBLE,
+					   msecs_to_jiffies(msec));
+	if (err == -EINTR) {
+		bt_dev_err(hdev, "Firmware loading interrupted");
+		return err;
+	}
+
+	if (err) {
+		bt_dev_err(hdev, "Firmware loading timeout");
+		return -ETIMEDOUT;
+	}
+
+	if (btintel_test_flag(hdev, INTEL_FIRMWARE_FAILED)) {
+		bt_dev_err(hdev, "Firmware loading failed");
+		return -ENOEXEC;
+	}
+
+	rettime = ktime_get();
+	delta = ktime_sub(rettime, calltime);
+	duration = (unsigned long long)ktime_to_ns(delta) >> 10;
+
+	bt_dev_info(hdev, "Firmware loaded in %llu usecs", duration);
+
+	return 0;
+}
+
+static int btintel_boot_wait(struct hci_dev *hdev, ktime_t calltime, int msec)
+{
+	ktime_t delta, rettime;
+	unsigned long long duration;
+	int err;
+
+	bt_dev_info(hdev, "Waiting for device to boot");
+
+	err = btintel_wait_on_flag_timeout(hdev, INTEL_BOOTING,
+					   TASK_INTERRUPTIBLE,
+					   msecs_to_jiffies(msec));
+	if (err == -EINTR) {
+		bt_dev_err(hdev, "Device boot interrupted");
+		return -EINTR;
+	}
+
+	if (err) {
+		bt_dev_err(hdev, "Device boot timeout");
+		return -ETIMEDOUT;
+	}
+
+	rettime = ktime_get();
+	delta = ktime_sub(rettime, calltime);
+	duration = (unsigned long long) ktime_to_ns(delta) >> 10;
+
+	bt_dev_info(hdev, "Device booted in %llu usecs", duration);
+
+	return 0;
+}
+
+static int btintel_boot(struct hci_dev *hdev, u32 boot_addr)
+{
+	ktime_t calltime;
+	int err;
+
+	calltime = ktime_get();
+
+	btintel_set_flag(hdev, INTEL_BOOTING);
+
+	err = btintel_send_intel_reset(hdev, boot_addr);
+	if (err) {
+		bt_dev_err(hdev, "Intel Soft Reset failed (%d)", err);
+		btintel_reset_to_bootloader(hdev);
+		return err;
+	}
+
+	/* The bootloader will not indicate when the device is ready. This
+	 * is done by the operational firmware sending bootup notification.
+	 *
+	 * Booting into operational firmware should not take longer than
+	 * 1 second. However if that happens, then just fail the setup
+	 * since something went wrong.
+	 */
+	err = btintel_boot_wait(hdev, calltime, 1000);
+	if (err == -ETIMEDOUT)
+		btintel_reset_to_bootloader(hdev);
+
+	return err;
+}
+
+static int btintel_get_fw_name(struct intel_version *ver,
+					     struct intel_boot_params *params,
+					     char *fw_name, size_t len,
+					     const char *suffix)
+{
+	switch (ver->hw_variant) {
+	case 0x0b:	/* SfP */
+	case 0x0c:	/* WsP */
+		snprintf(fw_name, len, "intel/ibt-%u-%u.%s",
+			le16_to_cpu(ver->hw_variant),
+			le16_to_cpu(params->dev_revid),
+			suffix);
+		break;
+	case 0x11:	/* JfP */
+	case 0x12:	/* ThP */
+	case 0x13:	/* HrP */
+	case 0x14:	/* CcP */
+		snprintf(fw_name, len, "intel/ibt-%u-%u-%u.%s",
+			le16_to_cpu(ver->hw_variant),
+			le16_to_cpu(ver->hw_revision),
+			le16_to_cpu(ver->fw_revision),
+			suffix);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int btintel_download_fw(struct hci_dev *hdev,
+					 struct intel_version *ver,
+					 struct intel_boot_params *params,
+					 u32 *boot_param)
+{
+	const struct firmware *fw;
+	char fwname[64];
+	int err;
+	ktime_t calltime;
+
+	if (!ver || !params)
+		return -EINVAL;
+
+	/* The firmware variant determines if the device is in bootloader
+	 * mode or is running operational firmware. The value 0x06 identifies
+	 * the bootloader and the value 0x23 identifies the operational
+	 * firmware.
+	 *
+	 * When the operational firmware is already present, then only
+	 * the check for valid Bluetooth device address is needed. This
+	 * determines if the device will be added as configured or
+	 * unconfigured controller.
+	 *
+	 * It is not possible to use the Secure Boot Parameters in this
+	 * case since that command is only available in bootloader mode.
+	 */
+	if (ver->fw_variant == 0x23) {
+		btintel_clear_flag(hdev, INTEL_BOOTLOADER);
+		btintel_check_bdaddr(hdev);
+
+		/* SfP and WsP don't seem to update the firmware version on file
+		 * so version checking is currently possible.
+		 */
+		switch (ver->hw_variant) {
+		case 0x0b:	/* SfP */
+		case 0x0c:	/* WsP */
+			return 0;
+		}
+
+		/* Proceed to download to check if the version matches */
+		goto download;
+	}
+
+	/* Read the secure boot parameters to identify the operating
+	 * details of the bootloader.
+	 */
+	err = btintel_read_boot_params(hdev, params);
+	if (err)
+		return err;
+
+	/* It is required that every single firmware fragment is acknowledged
+	 * with a command complete event. If the boot parameters indicate
+	 * that this bootloader does not send them, then abort the setup.
+	 */
+	if (params->limited_cce != 0x00) {
+		bt_dev_err(hdev, "Unsupported Intel firmware loading method (%u)",
+			   params->limited_cce);
+		return -EINVAL;
+	}
+
+	/* If the OTP has no valid Bluetooth device address, then there will
+	 * also be no valid address for the operational firmware.
+	 */
+	if (!bacmp(&params->otp_bdaddr, BDADDR_ANY)) {
+		bt_dev_info(hdev, "No device address configured");
+		set_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks);
+	}
+
+download:
+	/* With this Intel bootloader only the hardware variant and device
+	 * revision information are used to select the right firmware for SfP
+	 * and WsP.
+	 *
+	 * The firmware filename is ibt-<hw_variant>-<dev_revid>.sfi.
+	 *
+	 * Currently the supported hardware variants are:
+	 *   11 (0x0b) for iBT3.0 (LnP/SfP)
+	 *   12 (0x0c) for iBT3.5 (WsP)
+	 *
+	 * For ThP/JfP and for future SKU's, the FW name varies based on HW
+	 * variant, HW revision and FW revision, as these are dependent on CNVi
+	 * and RF Combination.
+	 *
+	 *   17 (0x11) for iBT3.5 (JfP)
+	 *   18 (0x12) for iBT3.5 (ThP)
+	 *
+	 * The firmware file name for these will be
+	 * ibt-<hw_variant>-<hw_revision>-<fw_revision>.sfi.
+	 *
+	 */
+	err = btintel_get_fw_name(ver, params, fwname, sizeof(fwname), "sfi");
+	if (err < 0) {
+		if (!btintel_test_flag(hdev, INTEL_BOOTLOADER)) {
+			/* Firmware has already been loaded */
+			btintel_set_flag(hdev, INTEL_FIRMWARE_LOADED);
+			return 0;
+		}
+
+		bt_dev_err(hdev, "Unsupported Intel firmware naming");
+		return -EINVAL;
+	}
+
+	err = firmware_request_nowarn(&fw, fwname, &hdev->dev);
+	if (err < 0) {
+		if (!btintel_test_flag(hdev, INTEL_BOOTLOADER)) {
+			/* Firmware has already been loaded */
+			btintel_set_flag(hdev, INTEL_FIRMWARE_LOADED);
+			return 0;
+		}
+
+		bt_dev_err(hdev, "Failed to load Intel firmware file %s (%d)",
+			   fwname, err);
+		return err;
+	}
+
+	bt_dev_info(hdev, "Found device firmware: %s", fwname);
+
+	if (fw->size < 644) {
+		bt_dev_err(hdev, "Invalid size of firmware file (%zu)",
+			   fw->size);
+		err = -EBADF;
+		goto done;
+	}
+
+	calltime = ktime_get();
+
+	btintel_set_flag(hdev, INTEL_DOWNLOADING);
+
+	/* Start firmware downloading and get boot parameter */
+	err = btintel_download_firmware(hdev, ver, fw, boot_param);
+	if (err < 0) {
+		if (err == -EALREADY) {
+			/* Firmware has already been loaded */
+			btintel_set_flag(hdev, INTEL_FIRMWARE_LOADED);
+			err = 0;
+			goto done;
+		}
+
+		/* When FW download fails, send Intel Reset to retry
+		 * FW download.
+		 */
+		btintel_reset_to_bootloader(hdev);
+		goto done;
+	}
+
+	/* Before switching the device into operational mode and with that
+	 * booting the loaded firmware, wait for the bootloader notification
+	 * that all fragments have been successfully received.
+	 *
+	 * When the event processing receives the notification, then the
+	 * INTEL_DOWNLOADING flag will be cleared.
+	 *
+	 * The firmware loading should not take longer than 5 seconds
+	 * and thus just timeout if that happens and fail the setup
+	 * of this device.
+	 */
+	err = btintel_download_wait(hdev, calltime, 5000);
+	if (err == -ETIMEDOUT)
+		btintel_reset_to_bootloader(hdev);
+
+done:
+	release_firmware(fw);
+	return err;
+}
+
+static int btintel_bootloader_setup(struct hci_dev *hdev,
+				    struct intel_version *ver)
+{
+	struct intel_version new_ver;
+	struct intel_boot_params params;
+	u32 boot_param;
+	char ddcname[64];
+	int err;
+	struct intel_debug_features features;
+
+	BT_DBG("%s", hdev->name);
+
+	/* Set the default boot parameter to 0x0 and it is updated to
+	 * SKU specific boot parameter after reading Intel_Write_Boot_Params
+	 * command while downloading the firmware.
+	 */
+	boot_param = 0x00000000;
+
+	btintel_set_flag(hdev, INTEL_BOOTLOADER);
+
+	err = btintel_download_fw(hdev, ver, &params, &boot_param);
+	if (err)
+		return err;
+
+	/* controller is already having an operational firmware */
+	if (ver->fw_variant == 0x23)
+		goto finish;
+
+	err = btintel_boot(hdev, boot_param);
+	if (err)
+		return err;
+
+	btintel_clear_flag(hdev, INTEL_BOOTLOADER);
+
+	err = btintel_get_fw_name(ver, &params, ddcname,
+						sizeof(ddcname), "ddc");
+
+	if (err < 0) {
+		bt_dev_err(hdev, "Unsupported Intel firmware naming");
+	} else {
+		/* Once the device is running in operational mode, it needs to
+		 * apply the device configuration (DDC) parameters.
+		 *
+		 * The device can work without DDC parameters, so even if it
+		 * fails to load the file, no need to fail the setup.
+		 */
+		btintel_load_ddc_config(hdev, ddcname);
+	}
+
+	/* Read the Intel supported features and if new exception formats
+	 * supported, need to load the additional DDC config to enable.
+	 */
+	err = btintel_read_debug_features(hdev, &features);
+	if (!err) {
+		/* Set DDC mask for available debug features */
+		btintel_set_debug_features(hdev, &features);
+	}
+
+	/* Read the Intel version information after loading the FW  */
+	err = btintel_read_version(hdev, &new_ver);
+	if (err)
+		return err;
+
+	btintel_version_info(hdev, &new_ver);
+
+finish:
+	/* All Intel controllers that support the Microsoft vendor
+	 * extension are using 0xFC1E for VsMsftOpCode.
+	 */
+	switch (ver->hw_variant) {
+	case 0x11:	/* JfP */
+	case 0x12:	/* ThP */
+	case 0x13:	/* HrP */
+	case 0x14:	/* CcP */
+		hci_set_msft_opcode(hdev, 0xFC1E);
+		break;
+	}
+
+	/* Set the event mask for Intel specific vendor events. This enables
+	 * a few extra events that are useful during general operation. It
+	 * does not enable any debugging related events.
+	 *
+	 * The device will function correctly without these events enabled
+	 * and thus no need to fail the setup.
+	 */
+	btintel_set_event_mask(hdev, false);
+
+	return 0;
+}
+
+static void btintel_get_fw_name_tlv(const struct intel_version_tlv *ver,
+				    char *fw_name, size_t len,
+				    const char *suffix)
+{
+	/* The firmware file name for new generation controllers will be
+	 * ibt-<cnvi_top type+cnvi_top step>-<cnvr_top type+cnvr_top step>
+	 */
+	snprintf(fw_name, len, "intel/ibt-%04x-%04x.%s",
+		 INTEL_CNVX_TOP_PACK_SWAB(INTEL_CNVX_TOP_TYPE(ver->cnvi_top),
+					  INTEL_CNVX_TOP_STEP(ver->cnvi_top)),
+		 INTEL_CNVX_TOP_PACK_SWAB(INTEL_CNVX_TOP_TYPE(ver->cnvr_top),
+					  INTEL_CNVX_TOP_STEP(ver->cnvr_top)),
+		 suffix);
+}
+
+static int btintel_prepare_fw_download_tlv(struct hci_dev *hdev,
+					   struct intel_version_tlv *ver,
+					   u32 *boot_param)
+{
+	const struct firmware *fw;
+	char fwname[64];
+	int err;
+	ktime_t calltime;
+
+	if (!ver || !boot_param)
+		return -EINVAL;
+
+	/* The firmware variant determines if the device is in bootloader
+	 * mode or is running operational firmware. The value 0x03 identifies
+	 * the bootloader and the value 0x23 identifies the operational
+	 * firmware.
+	 *
+	 * When the operational firmware is already present, then only
+	 * the check for valid Bluetooth device address is needed. This
+	 * determines if the device will be added as configured or
+	 * unconfigured controller.
+	 *
+	 * It is not possible to use the Secure Boot Parameters in this
+	 * case since that command is only available in bootloader mode.
+	 */
+	if (ver->img_type == 0x03) {
+		btintel_clear_flag(hdev, INTEL_BOOTLOADER);
+		btintel_check_bdaddr(hdev);
+	}
+
+	/* If the OTP has no valid Bluetooth device address, then there will
+	 * also be no valid address for the operational firmware.
+	 */
+	if (!bacmp(&ver->otp_bd_addr, BDADDR_ANY)) {
+		bt_dev_info(hdev, "No device address configured");
+		set_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks);
+	}
+
+	btintel_get_fw_name_tlv(ver, fwname, sizeof(fwname), "sfi");
+	err = firmware_request_nowarn(&fw, fwname, &hdev->dev);
+	if (err < 0) {
+		if (!btintel_test_flag(hdev, INTEL_BOOTLOADER)) {
+			/* Firmware has already been loaded */
+			btintel_set_flag(hdev, INTEL_FIRMWARE_LOADED);
+			return 0;
+		}
+
+		bt_dev_err(hdev, "Failed to load Intel firmware file %s (%d)",
+			   fwname, err);
+
+		return err;
+	}
+
+	bt_dev_info(hdev, "Found device firmware: %s", fwname);
+
+	if (fw->size < 644) {
+		bt_dev_err(hdev, "Invalid size of firmware file (%zu)",
+			   fw->size);
+		err = -EBADF;
+		goto done;
+	}
+
+	calltime = ktime_get();
+
+	btintel_set_flag(hdev, INTEL_DOWNLOADING);
+
+	/* Start firmware downloading and get boot parameter */
+	err = btintel_download_fw_tlv(hdev, ver, fw, boot_param,
+					       INTEL_HW_VARIANT(ver->cnvi_bt),
+					       ver->sbe_type);
+	if (err < 0) {
+		if (err == -EALREADY) {
+			/* Firmware has already been loaded */
+			btintel_set_flag(hdev, INTEL_FIRMWARE_LOADED);
+			err = 0;
+			goto done;
+		}
+
+		/* When FW download fails, send Intel Reset to retry
+		 * FW download.
+		 */
+		btintel_reset_to_bootloader(hdev);
+		goto done;
+	}
+
+	/* Before switching the device into operational mode and with that
+	 * booting the loaded firmware, wait for the bootloader notification
+	 * that all fragments have been successfully received.
+	 *
+	 * When the event processing receives the notification, then the
+	 * BTUSB_DOWNLOADING flag will be cleared.
+	 *
+	 * The firmware loading should not take longer than 5 seconds
+	 * and thus just timeout if that happens and fail the setup
+	 * of this device.
+	 */
+	err = btintel_download_wait(hdev, calltime, 5000);
+	if (err == -ETIMEDOUT)
+		btintel_reset_to_bootloader(hdev);
+
+done:
+	release_firmware(fw);
+	return err;
+}
+
+static int btintel_bootloader_setup_tlv(struct hci_dev *hdev,
+					struct intel_version_tlv *ver)
+{
+	u32 boot_param;
+	char ddcname[64];
+	int err;
+	struct intel_debug_features features;
+	struct intel_version_tlv new_ver;
+
+	bt_dev_dbg(hdev, "");
+
+	/* Set the default boot parameter to 0x0 and it is updated to
+	 * SKU specific boot parameter after reading Intel_Write_Boot_Params
+	 * command while downloading the firmware.
+	 */
+	boot_param = 0x00000000;
+
+	btintel_set_flag(hdev, INTEL_BOOTLOADER);
+
+	err = btintel_prepare_fw_download_tlv(hdev, ver, &boot_param);
+	if (err)
+		return err;
+
+	/* check if controller is already having an operational firmware */
+	if (ver->img_type == 0x03)
+		goto finish;
+
+	err = btintel_boot(hdev, boot_param);
+	if (err)
+		return err;
+
+	btintel_clear_flag(hdev, INTEL_BOOTLOADER);
+
+	btintel_get_fw_name_tlv(ver, ddcname, sizeof(ddcname), "ddc");
+	/* Once the device is running in operational mode, it needs to
+	 * apply the device configuration (DDC) parameters.
+	 *
+	 * The device can work without DDC parameters, so even if it
+	 * fails to load the file, no need to fail the setup.
+	 */
+	btintel_load_ddc_config(hdev, ddcname);
+
+	/* Read the Intel supported features and if new exception formats
+	 * supported, need to load the additional DDC config to enable.
+	 */
+	err = btintel_read_debug_features(hdev, &features);
+	if (!err) {
+		/* Set DDC mask for available debug features */
+		btintel_set_debug_features(hdev, &features);
+	}
+
+	/* Read the Intel version information after loading the FW  */
+	err = btintel_read_version_tlv(hdev, &new_ver);
+	if (err)
+		return err;
+
+	btintel_version_info_tlv(hdev, &new_ver);
+
+finish:
+	/* Set the event mask for Intel specific vendor events. This enables
+	 * a few extra events that are useful during general operation. It
+	 * does not enable any debugging related events.
+	 *
+	 * The device will function correctly without these events enabled
+	 * and thus no need to fail the setup.
+	 */
+	btintel_set_event_mask(hdev, false);
+
+	return 0;
+}
+
 static int btintel_setup_combined(struct hci_dev *hdev)
 {
 	const u8 param[1] = { 0xFF };
@@ -1770,7 +2259,7 @@ static int btintel_setup_combined(struct hci_dev *hdev)
 		case 0x12:      /* ThP */
 		case 0x13:      /* HrP */
 		case 0x14:      /* CcP */
-			/* TODO: call setup routine for bootloader product */
+			err = btintel_bootloader_setup(hdev, &ver);
 			break;
 		default:
 			bt_dev_err(hdev, "Unsupported Intel hw variant (%u)",
@@ -1795,11 +2284,27 @@ static int btintel_setup_combined(struct hci_dev *hdev)
 		goto exit_error;
 	}
 
-	/* Display version information of TLV type */
-	btintel_version_info_tlv(hdev, &ver_tlv);
-
-	/* TODO: Need to filter the device for new generation */
-	/* TODO: call setup routine for tlv based bootloader product */
+	/* Check for supported iBT hardware variants of this firmware
+	 * loading method.
+	 *
+	 * This check has been put in place to ensure correct forward
+	 * compatibility options when newer hardware variants come
+	 * along.
+	 */
+	switch (INTEL_HW_VARIANT(ver_tlv.cnvi_bt)) {
+	case 0x17:
+	case 0x18:
+	case 0x19:
+		/* Display version information of TLV type */
+		btintel_version_info_tlv(hdev, &ver_tlv);
+
+		err = btintel_bootloader_setup_tlv(hdev, &ver_tlv);
+		break;
+	default:
+		bt_dev_err(hdev, "Unsupported Intel hw variant (%u)",
+			   INTEL_HW_VARIANT(ver_tlv.cnvi_bt));
+		return -EINVAL;
+	}
 
 exit_error:
 	kfree_skb(skb);
@@ -1846,6 +2351,7 @@ int btintel_configure_setup(struct hci_dev *hdev)
 	hdev->manufacturer = 2;
 	hdev->setup = btintel_setup_combined;
 	hdev->shutdown = btintel_shutdown_combined;
+	hdev->hw_error = btintel_hw_error;
 	hdev->set_diag = btintel_set_diag_combined;
 	hdev->set_bdaddr = btintel_set_bdaddr;
 
@@ -1853,6 +2359,35 @@ int btintel_configure_setup(struct hci_dev *hdev)
 }
 EXPORT_SYMBOL_GPL(btintel_configure_setup);
 
+void btintel_bootup(struct hci_dev *hdev, const void *ptr, unsigned int len)
+{
+	const struct intel_bootup *evt = ptr;
+
+	if (len != sizeof(*evt))
+		return;
+
+	if (btintel_test_and_clear_flag(hdev, INTEL_BOOTING))
+		btintel_wake_up_flag(hdev, INTEL_BOOTING);
+}
+EXPORT_SYMBOL_GPL(btintel_bootup);
+
+void btintel_secure_send_result(struct hci_dev *hdev,
+				const void *ptr, unsigned int len)
+{
+	const struct intel_secure_send_result *evt = ptr;
+
+	if (len != sizeof(*evt))
+		return;
+
+	if (evt->result)
+		btintel_set_flag(hdev, INTEL_FIRMWARE_FAILED);
+
+	if (btintel_test_and_clear_flag(hdev, INTEL_DOWNLOADING) &&
+	    btintel_test_flag(hdev, INTEL_FIRMWARE_LOADED))
+		btintel_wake_up_flag(hdev, INTEL_DOWNLOADING);
+}
+EXPORT_SYMBOL_GPL(btintel_secure_send_result);
+
 MODULE_AUTHOR("Marcel Holtmann <marcel@holtmann.org>");
 MODULE_DESCRIPTION("Bluetooth support for Intel devices ver " VERSION);
 MODULE_VERSION(VERSION);
diff --git a/drivers/bluetooth/btintel.h b/drivers/bluetooth/btintel.h
index 17cb62ac33f6..5a8a696eecf2 100644
--- a/drivers/bluetooth/btintel.h
+++ b/drivers/bluetooth/btintel.h
@@ -207,17 +207,15 @@ int btintel_read_boot_params(struct hci_dev *hdev,
 			     struct intel_boot_params *params);
 int btintel_download_firmware(struct hci_dev *dev, struct intel_version *ver,
 			      const struct firmware *fw, u32 *boot_param);
-int btintel_download_firmware_newgen(struct hci_dev *hdev,
-				     struct intel_version_tlv *ver,
-				     const struct firmware *fw,
-				     u32 *boot_param, u8 hw_variant,
-				     u8 sbe_type);
 void btintel_reset_to_bootloader(struct hci_dev *hdev);
 int btintel_read_debug_features(struct hci_dev *hdev,
 				struct intel_debug_features *features);
 int btintel_set_debug_features(struct hci_dev *hdev,
 			       const struct intel_debug_features *features);
 int btintel_configure_setup(struct hci_dev *hdev);
+void btintel_bootup(struct hci_dev *hdev, const void *ptr, unsigned int len);
+void btintel_secure_send_result(struct hci_dev *hdev,
+				const void *ptr, unsigned int len);
 #else
 
 static inline int btintel_check_bdaddr(struct hci_dev *hdev)
@@ -321,14 +319,6 @@ static inline int btintel_download_firmware(struct hci_dev *dev,
 	return -EOPNOTSUPP;
 }
 
-static inline int btintel_download_firmware_newgen(struct hci_dev *hdev,
-						   const struct firmware *fw,
-						   u32 *boot_param,
-						   u8 hw_variant, u8 sbe_type)
-{
-	return -EOPNOTSUPP;
-}
-
 static inline void btintel_reset_to_bootloader(struct hci_dev *hdev)
 {
 }
@@ -350,4 +340,13 @@ static inline int btintel_configure_setup(struct hci_dev *hdev)
 	return -ENODEV;
 }
 
+static inline void btintel_bootup(struct hci_dev *hdev,
+				  const void *ptr, unsigned int len)
+{
+}
+
+static inline void btintel_secure_send_result(struct hci_dev *hdev,
+				const void *ptr, unsigned int len)
+{
+}
 #endif
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 3ed552d80b66..26863d8c1337 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -48,7 +48,6 @@ static struct usb_driver btusb_driver;
 #define BTUSB_BCM_PATCHRAM	0x400
 #define BTUSB_MARVELL		0x800
 #define BTUSB_SWAVE		0x1000
-#define BTUSB_INTEL_NEW		0x2000
 #define BTUSB_AMP		0x4000
 #define BTUSB_QCA_ROME		0x8000
 #define BTUSB_BCM_APPLE		0x10000
@@ -60,7 +59,6 @@ static struct usb_driver btusb_driver;
 #define BTUSB_WIDEBAND_SPEECH	0x400000
 #define BTUSB_VALID_LE_STATES   0x800000
 #define BTUSB_QCA_WCN6855	0x1000000
-#define BTUSB_INTEL_NEWGEN	0x2000000
 #define BTUSB_INTEL_BROKEN_INITIAL_NCMD 0x4000000
 
 static const struct usb_device_id btusb_table[] = {
@@ -360,27 +358,27 @@ static const struct usb_device_id blacklist_table[] = {
 	{ USB_DEVICE(0x1286, 0x204e), .driver_info = BTUSB_MARVELL },
 
 	/* Intel Bluetooth devices */
-	{ USB_DEVICE(0x8087, 0x0025), .driver_info = BTUSB_INTEL_NEW |
+	{ USB_DEVICE(0x8087, 0x0025), .driver_info = BTUSB_INTEL_COMBINED |
 						     BTUSB_WIDEBAND_SPEECH |
 						     BTUSB_VALID_LE_STATES },
-	{ USB_DEVICE(0x8087, 0x0026), .driver_info = BTUSB_INTEL_NEW |
+	{ USB_DEVICE(0x8087, 0x0026), .driver_info = BTUSB_INTEL_COMBINED |
 						     BTUSB_WIDEBAND_SPEECH },
-	{ USB_DEVICE(0x8087, 0x0029), .driver_info = BTUSB_INTEL_NEW |
+	{ USB_DEVICE(0x8087, 0x0029), .driver_info = BTUSB_INTEL_COMBINED |
 						     BTUSB_WIDEBAND_SPEECH },
-	{ USB_DEVICE(0x8087, 0x0032), .driver_info = BTUSB_INTEL_NEWGEN |
+	{ USB_DEVICE(0x8087, 0x0032), .driver_info = BTUSB_INTEL_COMBINED |
 						     BTUSB_WIDEBAND_SPEECH},
-	{ USB_DEVICE(0x8087, 0x0033), .driver_info = BTUSB_INTEL_NEWGEN |
+	{ USB_DEVICE(0x8087, 0x0033), .driver_info = BTUSB_INTEL_COMBINED |
 						     BTUSB_WIDEBAND_SPEECH |
 						     BTUSB_VALID_LE_STATES },
 	{ USB_DEVICE(0x8087, 0x07da), .driver_info = BTUSB_CSR },
 	{ USB_DEVICE(0x8087, 0x07dc), .driver_info = BTUSB_INTEL_COMBINED |
 						     BTUSB_INTEL_BROKEN_INITIAL_NCMD },
 	{ USB_DEVICE(0x8087, 0x0a2a), .driver_info = BTUSB_INTEL_COMBINED },
-	{ USB_DEVICE(0x8087, 0x0a2b), .driver_info = BTUSB_INTEL_NEW |
+	{ USB_DEVICE(0x8087, 0x0a2b), .driver_info = BTUSB_INTEL_COMBINED |
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x8087, 0x0aa7), .driver_info = BTUSB_INTEL_COMBINED |
 						     BTUSB_WIDEBAND_SPEECH },
-	{ USB_DEVICE(0x8087, 0x0aaa), .driver_info = BTUSB_INTEL_NEW |
+	{ USB_DEVICE(0x8087, 0x0aaa), .driver_info = BTUSB_INTEL_COMBINED |
 						     BTUSB_WIDEBAND_SPEECH |
 						     BTUSB_VALID_LE_STATES },
 
@@ -1999,49 +1997,21 @@ static int inject_cmd_complete(struct hci_dev *hdev, __u16 opcode)
 static int btusb_recv_bulk_intel(struct btusb_data *data, void *buffer,
 				 int count)
 {
+	struct hci_dev *hdev = data->hdev;
+
 	/* When the device is in bootloader mode, then it can send
 	 * events via the bulk endpoint. These events are treated the
 	 * same way as the ones received from the interrupt endpoint.
 	 */
-	if (test_bit(BTUSB_BOOTLOADER, &data->flags))
+	if (btintel_test_flag(hdev, INTEL_BOOTLOADER))
 		return btusb_recv_intr(data, buffer, count);
 
 	return btusb_recv_bulk(data, buffer, count);
 }
 
-static void btusb_intel_bootup(struct btusb_data *data, const void *ptr,
-			       unsigned int len)
-{
-	const struct intel_bootup *evt = ptr;
-
-	if (len != sizeof(*evt))
-		return;
-
-	if (test_and_clear_bit(BTUSB_BOOTING, &data->flags))
-		wake_up_bit(&data->flags, BTUSB_BOOTING);
-}
-
-static void btusb_intel_secure_send_result(struct btusb_data *data,
-					   const void *ptr, unsigned int len)
-{
-	const struct intel_secure_send_result *evt = ptr;
-
-	if (len != sizeof(*evt))
-		return;
-
-	if (evt->result)
-		set_bit(BTUSB_FIRMWARE_FAILED, &data->flags);
-
-	if (test_and_clear_bit(BTUSB_DOWNLOADING, &data->flags) &&
-	    test_bit(BTUSB_FIRMWARE_LOADED, &data->flags))
-		wake_up_bit(&data->flags, BTUSB_DOWNLOADING);
-}
-
 static int btusb_recv_event_intel(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct btusb_data *data = hci_get_drvdata(hdev);
-
-	if (test_bit(BTUSB_BOOTLOADER, &data->flags)) {
+	if (btintel_test_flag(hdev, INTEL_BOOTLOADER)) {
 		struct hci_event_hdr *hdr = (void *)skb->data;
 
 		if (skb->len > HCI_EVENT_HDR_SIZE && hdr->evt == 0xff &&
@@ -2055,7 +2025,7 @@ static int btusb_recv_event_intel(struct hci_dev *hdev, struct sk_buff *skb)
 				 * the device sends a vendor specific event
 				 * indicating that the bootup completed.
 				 */
-				btusb_intel_bootup(data, ptr, len);
+				btintel_bootup(hdev, ptr, len);
 				break;
 			case 0x06:
 				/* When the firmware loading completes the
@@ -2063,7 +2033,7 @@ static int btusb_recv_event_intel(struct hci_dev *hdev, struct sk_buff *skb)
 				 * indicating the result of the firmware
 				 * loading.
 				 */
-				btusb_intel_secure_send_result(data, ptr, len);
+				btintel_secure_send_result(hdev, ptr, len);
 				break;
 			}
 		}
@@ -2074,14 +2044,13 @@ static int btusb_recv_event_intel(struct hci_dev *hdev, struct sk_buff *skb)
 
 static int btusb_send_frame_intel(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	struct btusb_data *data = hci_get_drvdata(hdev);
 	struct urb *urb;
 
 	BT_DBG("%s", hdev->name);
 
 	switch (hci_skb_pkt_type(skb)) {
 	case HCI_COMMAND_PKT:
-		if (test_bit(BTUSB_BOOTLOADER, &data->flags)) {
+		if (btintel_test_flag(hdev, INTEL_BOOTLOADER)) {
 			struct hci_command_hdr *cmd = (void *)skb->data;
 			__u16 opcode = le16_to_cpu(cmd->opcode);
 
@@ -2133,641 +2102,6 @@ static int btusb_send_frame_intel(struct hci_dev *hdev, struct sk_buff *skb)
 	return -EILSEQ;
 }
 
-static int btusb_setup_intel_new_get_fw_name(struct intel_version *ver,
-					     struct intel_boot_params *params,
-					     char *fw_name, size_t len,
-					     const char *suffix)
-{
-	switch (ver->hw_variant) {
-	case 0x0b:	/* SfP */
-	case 0x0c:	/* WsP */
-		snprintf(fw_name, len, "intel/ibt-%u-%u.%s",
-			le16_to_cpu(ver->hw_variant),
-			le16_to_cpu(params->dev_revid),
-			suffix);
-		break;
-	case 0x11:	/* JfP */
-	case 0x12:	/* ThP */
-	case 0x13:	/* HrP */
-	case 0x14:	/* CcP */
-		snprintf(fw_name, len, "intel/ibt-%u-%u-%u.%s",
-			le16_to_cpu(ver->hw_variant),
-			le16_to_cpu(ver->hw_revision),
-			le16_to_cpu(ver->fw_revision),
-			suffix);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static void btusb_setup_intel_newgen_get_fw_name(const struct intel_version_tlv *ver_tlv,
-						 char *fw_name, size_t len,
-						 const char *suffix)
-{
-	/* The firmware file name for new generation controllers will be
-	 * ibt-<cnvi_top type+cnvi_top step>-<cnvr_top type+cnvr_top step>
-	 */
-	snprintf(fw_name, len, "intel/ibt-%04x-%04x.%s",
-		 INTEL_CNVX_TOP_PACK_SWAB(INTEL_CNVX_TOP_TYPE(ver_tlv->cnvi_top),
-					  INTEL_CNVX_TOP_STEP(ver_tlv->cnvi_top)),
-		 INTEL_CNVX_TOP_PACK_SWAB(INTEL_CNVX_TOP_TYPE(ver_tlv->cnvr_top),
-					  INTEL_CNVX_TOP_STEP(ver_tlv->cnvr_top)),
-		 suffix);
-}
-
-static int btusb_download_wait(struct hci_dev *hdev, ktime_t calltime, int msec)
-{
-	struct btusb_data *data = hci_get_drvdata(hdev);
-	ktime_t delta, rettime;
-	unsigned long long duration;
-	int err;
-
-	set_bit(BTUSB_FIRMWARE_LOADED, &data->flags);
-
-	bt_dev_info(hdev, "Waiting for firmware download to complete");
-
-	err = wait_on_bit_timeout(&data->flags, BTUSB_DOWNLOADING,
-				  TASK_INTERRUPTIBLE,
-				  msecs_to_jiffies(msec));
-	if (err == -EINTR) {
-		bt_dev_err(hdev, "Firmware loading interrupted");
-		return err;
-	}
-
-	if (err) {
-		bt_dev_err(hdev, "Firmware loading timeout");
-		return -ETIMEDOUT;
-	}
-
-	if (test_bit(BTUSB_FIRMWARE_FAILED, &data->flags)) {
-		bt_dev_err(hdev, "Firmware loading failed");
-		return -ENOEXEC;
-	}
-
-	rettime = ktime_get();
-	delta = ktime_sub(rettime, calltime);
-	duration = (unsigned long long)ktime_to_ns(delta) >> 10;
-
-	bt_dev_info(hdev, "Firmware loaded in %llu usecs", duration);
-
-	return 0;
-}
-
-static int btusb_intel_download_firmware_newgen(struct hci_dev *hdev,
-						struct intel_version_tlv *ver,
-						u32 *boot_param)
-{
-	const struct firmware *fw;
-	char fwname[64];
-	int err;
-	struct btusb_data *data = hci_get_drvdata(hdev);
-	ktime_t calltime;
-
-	if (!ver || !boot_param)
-		return -EINVAL;
-
-	/* The firmware variant determines if the device is in bootloader
-	 * mode or is running operational firmware. The value 0x03 identifies
-	 * the bootloader and the value 0x23 identifies the operational
-	 * firmware.
-	 *
-	 * When the operational firmware is already present, then only
-	 * the check for valid Bluetooth device address is needed. This
-	 * determines if the device will be added as configured or
-	 * unconfigured controller.
-	 *
-	 * It is not possible to use the Secure Boot Parameters in this
-	 * case since that command is only available in bootloader mode.
-	 */
-	if (ver->img_type == 0x03) {
-		clear_bit(BTUSB_BOOTLOADER, &data->flags);
-		btintel_check_bdaddr(hdev);
-	}
-
-	/* If the OTP has no valid Bluetooth device address, then there will
-	 * also be no valid address for the operational firmware.
-	 */
-	if (!bacmp(&ver->otp_bd_addr, BDADDR_ANY)) {
-		bt_dev_info(hdev, "No device address configured");
-		set_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks);
-	}
-
-	btusb_setup_intel_newgen_get_fw_name(ver, fwname, sizeof(fwname), "sfi");
-	err = firmware_request_nowarn(&fw, fwname, &hdev->dev);
-	if (err < 0) {
-		if (!test_bit(BTUSB_BOOTLOADER, &data->flags)) {
-			/* Firmware has already been loaded */
-			set_bit(BTUSB_FIRMWARE_LOADED, &data->flags);
-			return 0;
-		}
-
-		bt_dev_err(hdev, "Failed to load Intel firmware file %s (%d)",
-			   fwname, err);
-
-		return err;
-	}
-
-	bt_dev_info(hdev, "Found device firmware: %s", fwname);
-
-	if (fw->size < 644) {
-		bt_dev_err(hdev, "Invalid size of firmware file (%zu)",
-			   fw->size);
-		err = -EBADF;
-		goto done;
-	}
-
-	calltime = ktime_get();
-
-	set_bit(BTUSB_DOWNLOADING, &data->flags);
-
-	/* Start firmware downloading and get boot parameter */
-	err = btintel_download_firmware_newgen(hdev, ver, fw, boot_param,
-					       INTEL_HW_VARIANT(ver->cnvi_bt),
-					       ver->sbe_type);
-	if (err < 0) {
-		if (err == -EALREADY) {
-			/* Firmware has already been loaded */
-			set_bit(BTUSB_FIRMWARE_LOADED, &data->flags);
-			err = 0;
-			goto done;
-		}
-
-		/* When FW download fails, send Intel Reset to retry
-		 * FW download.
-		 */
-		btintel_reset_to_bootloader(hdev);
-		goto done;
-	}
-
-	/* Before switching the device into operational mode and with that
-	 * booting the loaded firmware, wait for the bootloader notification
-	 * that all fragments have been successfully received.
-	 *
-	 * When the event processing receives the notification, then the
-	 * BTUSB_DOWNLOADING flag will be cleared.
-	 *
-	 * The firmware loading should not take longer than 5 seconds
-	 * and thus just timeout if that happens and fail the setup
-	 * of this device.
-	 */
-	err = btusb_download_wait(hdev, calltime, 5000);
-	if (err == -ETIMEDOUT)
-		btintel_reset_to_bootloader(hdev);
-
-done:
-	release_firmware(fw);
-	return err;
-}
-
-static int btusb_intel_download_firmware(struct hci_dev *hdev,
-					 struct intel_version *ver,
-					 struct intel_boot_params *params,
-					 u32 *boot_param)
-{
-	const struct firmware *fw;
-	char fwname[64];
-	int err;
-	struct btusb_data *data = hci_get_drvdata(hdev);
-	ktime_t calltime;
-
-	if (!ver || !params)
-		return -EINVAL;
-
-	/* The firmware variant determines if the device is in bootloader
-	 * mode or is running operational firmware. The value 0x06 identifies
-	 * the bootloader and the value 0x23 identifies the operational
-	 * firmware.
-	 *
-	 * When the operational firmware is already present, then only
-	 * the check for valid Bluetooth device address is needed. This
-	 * determines if the device will be added as configured or
-	 * unconfigured controller.
-	 *
-	 * It is not possible to use the Secure Boot Parameters in this
-	 * case since that command is only available in bootloader mode.
-	 */
-	if (ver->fw_variant == 0x23) {
-		clear_bit(BTUSB_BOOTLOADER, &data->flags);
-		btintel_check_bdaddr(hdev);
-
-		/* SfP and WsP don't seem to update the firmware version on file
-		 * so version checking is currently possible.
-		 */
-		switch (ver->hw_variant) {
-		case 0x0b:	/* SfP */
-		case 0x0c:	/* WsP */
-			return 0;
-		}
-
-		/* Proceed to download to check if the version matches */
-		goto download;
-	}
-
-	/* Read the secure boot parameters to identify the operating
-	 * details of the bootloader.
-	 */
-	err = btintel_read_boot_params(hdev, params);
-	if (err)
-		return err;
-
-	/* It is required that every single firmware fragment is acknowledged
-	 * with a command complete event. If the boot parameters indicate
-	 * that this bootloader does not send them, then abort the setup.
-	 */
-	if (params->limited_cce != 0x00) {
-		bt_dev_err(hdev, "Unsupported Intel firmware loading method (%u)",
-			   params->limited_cce);
-		return -EINVAL;
-	}
-
-	/* If the OTP has no valid Bluetooth device address, then there will
-	 * also be no valid address for the operational firmware.
-	 */
-	if (!bacmp(&params->otp_bdaddr, BDADDR_ANY)) {
-		bt_dev_info(hdev, "No device address configured");
-		set_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks);
-	}
-
-download:
-	/* With this Intel bootloader only the hardware variant and device
-	 * revision information are used to select the right firmware for SfP
-	 * and WsP.
-	 *
-	 * The firmware filename is ibt-<hw_variant>-<dev_revid>.sfi.
-	 *
-	 * Currently the supported hardware variants are:
-	 *   11 (0x0b) for iBT3.0 (LnP/SfP)
-	 *   12 (0x0c) for iBT3.5 (WsP)
-	 *
-	 * For ThP/JfP and for future SKU's, the FW name varies based on HW
-	 * variant, HW revision and FW revision, as these are dependent on CNVi
-	 * and RF Combination.
-	 *
-	 *   17 (0x11) for iBT3.5 (JfP)
-	 *   18 (0x12) for iBT3.5 (ThP)
-	 *
-	 * The firmware file name for these will be
-	 * ibt-<hw_variant>-<hw_revision>-<fw_revision>.sfi.
-	 *
-	 */
-	err = btusb_setup_intel_new_get_fw_name(ver, params, fwname,
-						sizeof(fwname), "sfi");
-	if (err < 0) {
-		if (!test_bit(BTUSB_BOOTLOADER, &data->flags)) {
-			/* Firmware has already been loaded */
-			set_bit(BTUSB_FIRMWARE_LOADED, &data->flags);
-			return 0;
-		}
-
-		bt_dev_err(hdev, "Unsupported Intel firmware naming");
-		return -EINVAL;
-	}
-
-	err = firmware_request_nowarn(&fw, fwname, &hdev->dev);
-	if (err < 0) {
-		if (!test_bit(BTUSB_BOOTLOADER, &data->flags)) {
-			/* Firmware has already been loaded */
-			set_bit(BTUSB_FIRMWARE_LOADED, &data->flags);
-			return 0;
-		}
-
-		bt_dev_err(hdev, "Failed to load Intel firmware file %s (%d)",
-			   fwname, err);
-		return err;
-	}
-
-	bt_dev_info(hdev, "Found device firmware: %s", fwname);
-
-	if (fw->size < 644) {
-		bt_dev_err(hdev, "Invalid size of firmware file (%zu)",
-			   fw->size);
-		err = -EBADF;
-		goto done;
-	}
-
-	calltime = ktime_get();
-
-	set_bit(BTUSB_DOWNLOADING, &data->flags);
-
-	/* Start firmware downloading and get boot parameter */
-	err = btintel_download_firmware(hdev, ver, fw, boot_param);
-	if (err < 0) {
-		if (err == -EALREADY) {
-			/* Firmware has already been loaded */
-			set_bit(BTUSB_FIRMWARE_LOADED, &data->flags);
-			err = 0;
-			goto done;
-		}
-
-		/* When FW download fails, send Intel Reset to retry
-		 * FW download.
-		 */
-		btintel_reset_to_bootloader(hdev);
-		goto done;
-	}
-
-	/* Before switching the device into operational mode and with that
-	 * booting the loaded firmware, wait for the bootloader notification
-	 * that all fragments have been successfully received.
-	 *
-	 * When the event processing receives the notification, then the
-	 * BTUSB_DOWNLOADING flag will be cleared.
-	 *
-	 * The firmware loading should not take longer than 5 seconds
-	 * and thus just timeout if that happens and fail the setup
-	 * of this device.
-	 */
-	err = btusb_download_wait(hdev, calltime, 5000);
-	if (err == -ETIMEDOUT)
-		btintel_reset_to_bootloader(hdev);
-
-done:
-	release_firmware(fw);
-	return err;
-}
-
-static int btusb_boot_wait(struct hci_dev *hdev, ktime_t calltime, int msec)
-{
-	struct btusb_data *data = hci_get_drvdata(hdev);
-	ktime_t delta, rettime;
-	unsigned long long duration;
-	int err;
-
-	bt_dev_info(hdev, "Waiting for device to boot");
-
-	err = wait_on_bit_timeout(&data->flags, BTUSB_BOOTING,
-				  TASK_INTERRUPTIBLE,
-				  msecs_to_jiffies(msec));
-	if (err == -EINTR) {
-		bt_dev_err(hdev, "Device boot interrupted");
-		return -EINTR;
-	}
-
-	if (err) {
-		bt_dev_err(hdev, "Device boot timeout");
-		return -ETIMEDOUT;
-	}
-
-	rettime = ktime_get();
-	delta = ktime_sub(rettime, calltime);
-	duration = (unsigned long long) ktime_to_ns(delta) >> 10;
-
-	bt_dev_info(hdev, "Device booted in %llu usecs", duration);
-
-	return 0;
-}
-
-static int btusb_intel_boot(struct hci_dev *hdev, u32 boot_addr)
-{
-	struct btusb_data *data = hci_get_drvdata(hdev);
-	ktime_t calltime;
-	int err;
-
-	calltime = ktime_get();
-
-	set_bit(BTUSB_BOOTING, &data->flags);
-
-	err = btintel_send_intel_reset(hdev, boot_addr);
-	if (err) {
-		bt_dev_err(hdev, "Intel Soft Reset failed (%d)", err);
-		btintel_reset_to_bootloader(hdev);
-		return err;
-	}
-
-	/* The bootloader will not indicate when the device is ready. This
-	 * is done by the operational firmware sending bootup notification.
-	 *
-	 * Booting into operational firmware should not take longer than
-	 * 1 second. However if that happens, then just fail the setup
-	 * since something went wrong.
-	 */
-	err = btusb_boot_wait(hdev, calltime, 1000);
-	if (err == -ETIMEDOUT)
-		btintel_reset_to_bootloader(hdev);
-
-	return err;
-}
-
-static int btusb_setup_intel_new(struct hci_dev *hdev)
-{
-	struct btusb_data *data = hci_get_drvdata(hdev);
-	struct intel_version ver;
-	struct intel_boot_params params;
-	u32 boot_param;
-	char ddcname[64];
-	int err;
-	struct intel_debug_features features;
-
-	BT_DBG("%s", hdev->name);
-
-	/* Set the default boot parameter to 0x0 and it is updated to
-	 * SKU specific boot parameter after reading Intel_Write_Boot_Params
-	 * command while downloading the firmware.
-	 */
-	boot_param = 0x00000000;
-
-	/* Read the Intel version information to determine if the device
-	 * is in bootloader mode or if it already has operational firmware
-	 * loaded.
-	 */
-	err = btintel_read_version(hdev, &ver);
-	if (err) {
-		bt_dev_err(hdev, "Intel Read version failed (%d)", err);
-		btintel_reset_to_bootloader(hdev);
-		return err;
-	}
-
-	err = btintel_version_info(hdev, &ver);
-	if (err)
-		return err;
-
-	err = btusb_intel_download_firmware(hdev, &ver, &params, &boot_param);
-	if (err)
-		return err;
-
-	/* controller is already having an operational firmware */
-	if (ver.fw_variant == 0x23)
-		goto finish;
-
-	err = btusb_intel_boot(hdev, boot_param);
-	if (err)
-		return err;
-
-	clear_bit(BTUSB_BOOTLOADER, &data->flags);
-
-	err = btusb_setup_intel_new_get_fw_name(&ver, &params, ddcname,
-						sizeof(ddcname), "ddc");
-
-	if (err < 0) {
-		bt_dev_err(hdev, "Unsupported Intel firmware naming");
-	} else {
-		/* Once the device is running in operational mode, it needs to
-		 * apply the device configuration (DDC) parameters.
-		 *
-		 * The device can work without DDC parameters, so even if it
-		 * fails to load the file, no need to fail the setup.
-		 */
-		btintel_load_ddc_config(hdev, ddcname);
-	}
-
-	/* Read the Intel supported features and if new exception formats
-	 * supported, need to load the additional DDC config to enable.
-	 */
-	err = btintel_read_debug_features(hdev, &features);
-	if (!err) {
-		/* Set DDC mask for available debug features */
-		btintel_set_debug_features(hdev, &features);
-	}
-
-	/* Read the Intel version information after loading the FW  */
-	err = btintel_read_version(hdev, &ver);
-	if (err)
-		return err;
-
-	btintel_version_info(hdev, &ver);
-
-finish:
-	/* All Intel controllers that support the Microsoft vendor
-	 * extension are using 0xFC1E for VsMsftOpCode.
-	 */
-	switch (ver.hw_variant) {
-	case 0x11:	/* JfP */
-	case 0x12:	/* ThP */
-	case 0x13:	/* HrP */
-	case 0x14:	/* CcP */
-		hci_set_msft_opcode(hdev, 0xFC1E);
-		break;
-	}
-
-	/* Set the event mask for Intel specific vendor events. This enables
-	 * a few extra events that are useful during general operation. It
-	 * does not enable any debugging related events.
-	 *
-	 * The device will function correctly without these events enabled
-	 * and thus no need to fail the setup.
-	 */
-	btintel_set_event_mask(hdev, false);
-
-	return 0;
-}
-
-static int btusb_setup_intel_newgen(struct hci_dev *hdev)
-{
-	struct btusb_data *data = hci_get_drvdata(hdev);
-	u32 boot_param;
-	char ddcname[64];
-	int err;
-	struct intel_debug_features features;
-	struct intel_version_tlv version;
-
-	bt_dev_dbg(hdev, "");
-
-	/* Set the default boot parameter to 0x0 and it is updated to
-	 * SKU specific boot parameter after reading Intel_Write_Boot_Params
-	 * command while downloading the firmware.
-	 */
-	boot_param = 0x00000000;
-
-	/* Read the Intel version information to determine if the device
-	 * is in bootloader mode or if it already has operational firmware
-	 * loaded.
-	 */
-	err = btintel_read_version_tlv(hdev, &version);
-	if (err) {
-		bt_dev_err(hdev, "Intel Read version failed (%d)", err);
-		btintel_reset_to_bootloader(hdev);
-		return err;
-	}
-
-	err = btintel_version_info_tlv(hdev, &version);
-	if (err)
-		return err;
-
-	err = btusb_intel_download_firmware_newgen(hdev, &version, &boot_param);
-	if (err)
-		return err;
-
-	/* check if controller is already having an operational firmware */
-	if (version.img_type == 0x03)
-		goto finish;
-
-	err = btusb_intel_boot(hdev, boot_param);
-	if (err)
-		return err;
-
-	clear_bit(BTUSB_BOOTLOADER, &data->flags);
-
-	btusb_setup_intel_newgen_get_fw_name(&version, ddcname, sizeof(ddcname),
-					     "ddc");
-	/* Once the device is running in operational mode, it needs to
-	 * apply the device configuration (DDC) parameters.
-	 *
-	 * The device can work without DDC parameters, so even if it
-	 * fails to load the file, no need to fail the setup.
-	 */
-	btintel_load_ddc_config(hdev, ddcname);
-
-	/* Read the Intel supported features and if new exception formats
-	 * supported, need to load the additional DDC config to enable.
-	 */
-	err = btintel_read_debug_features(hdev, &features);
-	if (!err) {
-		/* Set DDC mask for available debug features */
-		btintel_set_debug_features(hdev, &features);
-	}
-
-	/* Read the Intel version information after loading the FW  */
-	err = btintel_read_version_tlv(hdev, &version);
-	if (err)
-		return err;
-
-	btintel_version_info_tlv(hdev, &version);
-
-finish:
-	/* All Intel new genration controllers support the Microsoft vendor
-	 * extension are using 0xFC1E for VsMsftOpCode.
-	 */
-	switch (INTEL_HW_VARIANT(version.cnvi_bt)) {
-	case 0x17:
-	case 0x18:
-	case 0x19:
-		hci_set_msft_opcode(hdev, 0xFC1E);
-		break;
-	}
-
-	/* Set the event mask for Intel specific vendor events. This enables
-	 * a few extra events that are useful during general operation. It
-	 * does not enable any debugging related events.
-	 *
-	 * The device will function correctly without these events enabled
-	 * and thus no need to fail the setup.
-	 */
-	btintel_set_event_mask(hdev, false);
-
-	return 0;
-}
-
-static int btusb_shutdown_intel_new(struct hci_dev *hdev)
-{
-	struct sk_buff *skb;
-
-	/* Send HCI Reset to the controller to stop any BT activity which
-	 * were triggered. This will help to save power and maintain the
-	 * sync b/w Host and controller
-	 */
-	skb = __hci_cmd_sync(hdev, HCI_OP_RESET, 0, NULL, HCI_INIT_TIMEOUT);
-	if (IS_ERR(skb)) {
-		bt_dev_err(hdev, "HCI reset during shutdown failed");
-		return PTR_ERR(skb);
-	}
-	kfree_skb(skb);
-
-	return 0;
-}
-
 /* UHW CR mapping */
 #define MTK_BT_MISC		0x70002510
 #define MTK_BT_SUBSYS_RST	0x70002610
@@ -4389,18 +3723,16 @@ static int btusb_probe(struct usb_interface *intf,
 
 	priv_size = 0;
 
+	data->recv_event = hci_recv_frame;
+	data->recv_bulk = btusb_recv_bulk;
+
 	if (id->driver_info & BTUSB_INTEL_COMBINED) {
 		/* Allocate extra space for Intel device */
 		priv_size += sizeof(struct btintel_data);
-	}
 
-	if (id->driver_info & BTUSB_INTEL_NEW) {
+		/* Override the rx handlers */
 		data->recv_event = btusb_recv_event_intel;
 		data->recv_bulk = btusb_recv_bulk_intel;
-		set_bit(BTUSB_BOOTLOADER, &data->flags);
-	} else {
-		data->recv_event = hci_recv_frame;
-		data->recv_bulk = btusb_recv_bulk;
 	}
 
 	data->recv_acl = hci_recv_frame;
@@ -4486,6 +3818,7 @@ static int btusb_probe(struct usb_interface *intf,
 			goto out_free_dev;
 
 		/* Transport specific configuration */
+		hdev->send = btusb_send_frame_intel;
 		hdev->cmd_timeout = btusb_intel_cmd_timeout;
 
 		set_bit(HCI_QUIRK_STRICT_DUPLICATE_FILTER, &hdev->quirks);
@@ -4496,38 +3829,6 @@ static int btusb_probe(struct usb_interface *intf,
 			btintel_set_flag(hdev, INTEL_BROKEN_INITIAL_NCMD);
 	}
 
-	if (id->driver_info & BTUSB_INTEL_NEW) {
-		hdev->manufacturer = 2;
-		hdev->send = btusb_send_frame_intel;
-		hdev->setup = btusb_setup_intel_new;
-		hdev->shutdown = btusb_shutdown_intel_new;
-		hdev->hw_error = btintel_hw_error;
-		hdev->set_diag = btintel_set_diag;
-		hdev->set_bdaddr = btintel_set_bdaddr;
-		hdev->cmd_timeout = btusb_intel_cmd_timeout;
-		set_bit(HCI_QUIRK_STRICT_DUPLICATE_FILTER, &hdev->quirks);
-		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
-		set_bit(HCI_QUIRK_NON_PERSISTENT_DIAG, &hdev->quirks);
-	}
-
-	if (id->driver_info & BTUSB_INTEL_NEWGEN) {
-		hdev->manufacturer = 2;
-		hdev->send = btusb_send_frame_intel;
-		hdev->setup = btusb_setup_intel_newgen;
-		hdev->shutdown = btusb_shutdown_intel_new;
-		hdev->hw_error = btintel_hw_error;
-		hdev->set_diag = btintel_set_diag;
-		hdev->set_bdaddr = btintel_set_bdaddr;
-		hdev->cmd_timeout = btusb_intel_cmd_timeout;
-		set_bit(HCI_QUIRK_STRICT_DUPLICATE_FILTER, &hdev->quirks);
-		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
-		set_bit(HCI_QUIRK_NON_PERSISTENT_DIAG, &hdev->quirks);
-
-		data->recv_event = btusb_recv_event_intel;
-		data->recv_bulk = btusb_recv_bulk_intel;
-		set_bit(BTUSB_BOOTLOADER, &data->flags);
-	}
-
 	if (id->driver_info & BTUSB_MARVELL)
 		hdev->set_bdaddr = btusb_set_bdaddr_marvell;
 
-- 
2.25.1

