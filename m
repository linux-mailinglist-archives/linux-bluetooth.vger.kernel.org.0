Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9579927FA16
	for <lists+linux-bluetooth@lfdr.de>; Thu,  1 Oct 2020 09:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730756AbgJAHVa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 1 Oct 2020 03:21:30 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:35709 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgJAHVa (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 1 Oct 2020 03:21:30 -0400
Received: from marcel-macbook.fritz.box (p4fefc7f4.dip0.t-ipconnect.de [79.239.199.244])
        by mail.holtmann.org (Postfix) with ESMTPSA id 07042CECD2;
        Thu,  1 Oct 2020 09:28:27 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH v3] Bluetooth: btintel: Add *setup* function for new
 generation Intel controllers
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1601295508-7384-1-git-send-email-kiran.k@intel.com>
Date:   Thu, 1 Oct 2020 09:21:26 +0200
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Sathish Narasimman <sathish.narasimman@intel.com>,
        Chethan T N <chethan.tumkur.narayan@intel.com>,
        "Srivatsa, Ravishankar" <ravishankar.srivatsa@intel.com>,
        Kiran K <kiran.k@intel.com>, Amit K Bag <amit.k.bag@intel.com>,
        Raghuram Hegde <raghuram.hegde@intel.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <954138C2-AFB3-40F3-9748-96B10AE725FF@holtmann.org>
References: <1601295508-7384-1-git-send-email-kiran.k@intel.com>
To:     Kiran K <kiraank@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

> 1) add a helper function to download firmware
> 
> 2) add a helper function to construct firmware / ddc file name
> 
> 3) add a flag to identify new geneeration Intel controllers
> 
> 4) define *setup* and hook it up for new genertion Intel controllers
> 
> 5) map Typhoon Peak controller (PID:0x0032) to new generation controller
> 
> Signed-off-by: Kiran K <kiran.k@intel.com>
> Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
> Signed-off-by: Raghuram Hegde <raghuram.hegde@intel.com>
> Reviewed-by: Sathish Narasimman <Sathish.Narasimman@intel.com>
> Reviewed-by: Chethan T N <chethan.tumkur.narayan@intel.com>
> Reviewed-by: Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
> ---
> Changes in v3:
> * combine the two patches in v2 series to one to avoid compiler warnings
>   reported by kernel bot (lkp)
> 
> Changed in v2:
> * fix typo in commit message
> 
> drivers/bluetooth/btintel.h |   6 +
> drivers/bluetooth/btusb.c   | 328 +++++++++++++++++++++++++++++++++++++++++++-
> 2 files changed, 331 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bluetooth/btintel.h b/drivers/bluetooth/btintel.h
> index 09346ae..f5c26dc 100644
> --- a/drivers/bluetooth/btintel.h
> +++ b/drivers/bluetooth/btintel.h
> @@ -132,6 +132,12 @@ struct intel_debug_features {
> 	__u8    page1[16];
> } __packed;
> 
> +#define INTEL_HW_PLATFORM(cnvx_bt)      ((u8)(((cnvx_bt) & 0x0000ff00)  >> 8))
> +#define INTEL_HW_VARIANT(cnvx_bt)       ((u8)(((cnvx_bt) & 0x003f0000)   >> 16))

please remove unneeded spaces.

> +#define INTEL_CNVX_TOP_TYPE(cnvx_top)   ((cnvx_top) & 0x00000fff)
> +#define INTEL_CNVX_TOP_STEP(cnvx_top)   (((cnvx_top) & 0x0f000000) >> 24)
> +#define INTEL_CNVX_TOP_PACK_SWAB(t, s)  __swab16(((__u16)(((t) << 4) | (s))))
> +
> #if IS_ENABLED(CONFIG_BT_INTEL)
> 
> int btintel_check_bdaddr(struct hci_dev *hdev);
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 9f294b9..dbce701 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -59,6 +59,7 @@ static struct usb_driver btusb_driver;
> #define BTUSB_MEDIATEK		0x200000
> #define BTUSB_WIDEBAND_SPEECH	0x400000
> #define BTUSB_VALID_LE_STATES   0x800000
> +#define BTUSB_INTEL_NEWGEN	0x1000000

Can you please rebase since we assigned another value in the meantime.

> 
> static const struct usb_device_id btusb_table[] = {
> 	/* Generic Bluetooth USB device */
> @@ -360,7 +361,7 @@ static const struct usb_device_id blacklist_table[] = {
> 						     BTUSB_WIDEBAND_SPEECH },
> 	{ USB_DEVICE(0x8087, 0x0029), .driver_info = BTUSB_INTEL_NEW |
> 						     BTUSB_WIDEBAND_SPEECH },
> -	{ USB_DEVICE(0x8087, 0x0032), .driver_info = BTUSB_INTEL_NEW |
> +	{ USB_DEVICE(0x8087, 0x0032), .driver_info = BTUSB_INTEL_NEWGEN |
> 						     BTUSB_WIDEBAND_SPEECH},
> 	{ USB_DEVICE(0x8087, 0x07da), .driver_info = BTUSB_CSR },
> 	{ USB_DEVICE(0x8087, 0x07dc), .driver_info = BTUSB_INTEL },
> @@ -2354,6 +2355,189 @@ static bool btusb_setup_intel_new_get_fw_name(struct intel_version *ver,
> 	return true;
> }
> 
> +static bool btusb_setup_intel_newgen_get_fw_name(const struct intel_version_tlv *ver_tlv,
> +						 char *fw_name, size_t len,
> +						 const char *suffix)
> +{
> +	/*
> +	 * The firmware file name for new generation controllers will be
> +	 * ibt-<cnvi_top type+cnvi_top step>-<cnvr_top type+cnvr_top step>
> +	 */

Please follow correct coding style.

> +	snprintf(fw_name, len, "intel/ibt-%04x-%04x.%s",
> +		 INTEL_CNVX_TOP_PACK_SWAB(INTEL_CNVX_TOP_TYPE(ver_tlv->cnvi_top),
> +					  INTEL_CNVX_TOP_STEP(ver_tlv->cnvi_top)),
> +		 INTEL_CNVX_TOP_PACK_SWAB(INTEL_CNVX_TOP_TYPE(ver_tlv->cnvr_top),
> +					  INTEL_CNVX_TOP_STEP(ver_tlv->cnvr_top)),
> +		 suffix);
> +	return true;
> +}

This return value has no point if it is not used.

> +
> +static int btusb_intel_download_firmware_newgen(struct hci_dev *hdev,
> +						struct intel_version_tlv *ver,
> +						u32 *boot_param)
> +{
> +	const struct firmware *fw;
> +	char fwname[64];
> +	int err;
> +	struct btusb_data *data = hci_get_drvdata(hdev);
> +
> +	if (!ver || !boot_param)
> +		return -EINVAL;
> +
> +	/* The hardware platform number has a fixed value of 0x37 and
> +	 * for now only accept this single value.
> +	 */
> +	if (INTEL_HW_PLATFORM(ver->cnvi_bt) != 0x37) {
> +		bt_dev_err(hdev, "Unsupported Intel hardware platform (0x%2x)",
> +			   INTEL_HW_PLATFORM(ver->cnvi_bt));
> +		return -EINVAL;
> +	}
> +
> +	/* The firmware variant determines if the device is in bootloader
> +	 * mode or is running operational firmware. The value 0x03 identifies
> +	 * the bootloader and the value 0x23 identifies the operational
> +	 * firmware.
> +	 *
> +	 * When the operational firmware is already present, then only
> +	 * the check for valid Bluetooth device address is needed. This
> +	 * determines if the device will be added as configured or
> +	 * unconfigured controller.
> +	 *
> +	 * It is not possible to use the Secure Boot Parameters in this
> +	 * case since that command is only available in bootloader mode.
> +	 */
> +	if (ver->img_type == 0x03) {
> +		clear_bit(BTUSB_BOOTLOADER, &data->flags);
> +		btintel_check_bdaddr(hdev);
> +		return 0;
> +	}
> +
> +	/* Check for supported iBT hardware variants of this firmware
> +	 * loading method.
> +	 *
> +	 * This check has been put in place to ensure correct forward
> +	 * compatibility options when newer hardware variants come along.
> +	 */
> +	switch (INTEL_HW_VARIANT(ver->cnvi_bt)) {
> +	case 0x17:	/* TyP */
> +	case 0x18:	/* Slr */
> +	case 0x19:	/* Slr-F */
> +		break;
> +	default:
> +		bt_dev_err(hdev, "Unsupported Intel hardware variant (0x%x)",
> +			   INTEL_HW_VARIANT(ver->cnvi_bt));
> +		return -EINVAL;
> +	}
> +
> +	/* If the device is not in bootloader mode, then the only possible
> +	 * choice is to return an error and abort the device initialization.
> +	 */
> +	if (ver->img_type != 0x01) {
> +		bt_dev_err(hdev, "Unsupported Intel firmware variant (0x%x)",
> +			   ver->img_type);
> +		return -ENODEV;
> +	}
> +
> +	/* It is required that every single firmware fragment is acknowledged
> +	 * with a command complete event. If the boot parameters indicate
> +	 * that this bootloader does not send them, then abort the setup.
> +	 */
> +	if (ver->limited_cce != 0x00) {
> +		bt_dev_err(hdev, "Unsupported Intel firmware loading method (0x%x)",
> +			   ver->limited_cce);
> +		return -EINVAL;
> +	}
> +
> +	/* Secure boot engine type should be either 1 (ECDSA) or 0 (RSA) */
> +	if (ver->sbe_type > 0x01) {
> +		bt_dev_err(hdev, "Unsupported Intel secure boot engine type (0x%x)",
> +			   ver->sbe_type);
> +		return -EINVAL;
> +	}
> +
> +	/* If the OTP has no valid Bluetooth device address, then there will
> +	 * also be no valid address for the operational firmware.
> +	 */
> +	if (!bacmp(&ver->otp_bd_addr, BDADDR_ANY)) {
> +		bt_dev_info(hdev, "No device address configured");
> +		set_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks);
> +	}
> +
> +	err = btusb_setup_intel_newgen_get_fw_name(ver, fwname, sizeof(fwname),
> +						   "sfi");

We don’t assign bool values to int variables.

> +	if (!err) {
> +		bt_dev_err(hdev, "Unsupported Intel firmware naming");
> +		return -EINVAL;
> +	}
> +
> +	err = request_firmware(&fw, fwname, &hdev->dev);
> +	if (err < 0) {
> +		bt_dev_err(hdev, "Failed to load Intel firmware file (%d)", err);
> +		return err;
> +	}
> +
> +	bt_dev_info(hdev, "Found device firmware: %s", fwname);
> +
> +	if (fw->size < 644) {
> +		bt_dev_err(hdev, "Invalid size of firmware file (%zu)",
> +			   fw->size);
> +		err = -EBADF;
> +		goto done;
> +	}
> +
> +	set_bit(BTUSB_DOWNLOADING, &data->flags);
> +
> +	/* Start firmware downloading and get boot parameter */
> +	err = btintel_download_firmware_newgen(hdev, fw, boot_param,
> +					       INTEL_HW_VARIANT(ver->cnvi_bt),
> +					       ver->sbe_type);
> +	if (err < 0) {
> +		/* When FW download fails, send Intel Reset to retry
> +		 * FW download.
> +		 */
> +		btintel_reset_to_bootloader(hdev);
> +		goto done;
> +	}
> +	set_bit(BTUSB_FIRMWARE_LOADED, &data->flags);
> +
> +	bt_dev_info(hdev, "Waiting for firmware download to complete");
> +
> +	/* Before switching the device into operational mode and with that
> +	 * booting the loaded firmware, wait for the bootloader notification
> +	 * that all fragments have been successfully received.
> +	 *
> +	 * When the event processing receives the notification, then the
> +	 * BTUSB_DOWNLOADING flag will be cleared.
> +	 *
> +	 * The firmware loading should not take longer than 5 seconds
> +	 * and thus just timeout if that happens and fail the setup
> +	 * of this device.
> +	 */
> +	err = wait_on_bit_timeout(&data->flags, BTUSB_DOWNLOADING,
> +				  TASK_INTERRUPTIBLE,
> +				  msecs_to_jiffies(5000));
> +	if (err == -EINTR) {
> +		bt_dev_err(hdev, "Firmware loading interrupted");
> +		goto done;
> +	}
> +
> +	if (err) {
> +		bt_dev_err(hdev, "Firmware loading timeout");
> +		err = -ETIMEDOUT;
> +		btintel_reset_to_bootloader(hdev);
> +		goto done;
> +	}
> +
> +	if (test_bit(BTUSB_FIRMWARE_FAILED, &data->flags)) {
> +		bt_dev_err(hdev, "Firmware loading failed");
> +		err = -ENOEXEC;
> +		goto done;
> +	}
> +
> +done:
> +	release_firmware(fw);
> +	return err;
> +}
> static int btusb_intel_download_firmware(struct hci_dev *hdev,
> 					 struct intel_version *ver,
> 					 struct intel_boot_params *params,
> @@ -2688,6 +2872,138 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
> 	return 0;
> }
> 
> +static int btusb_setup_intel_newgen(struct hci_dev *hdev)
> +{
> +	struct btusb_data *data = hci_get_drvdata(hdev);
> +	u32 boot_param;
> +	char ddcname[64];
> +	ktime_t calltime, delta, rettime;
> +	unsigned long long duration;
> +	int err;
> +	struct intel_debug_features features;
> +	struct intel_version_tlv version;
> +
> +	BT_DBG("%s", hdev->name);
> +
> +	/* Set the default boot parameter to 0x0 and it is updated to
> +	 * SKU specific boot parameter after reading Intel_Write_Boot_Params
> +	 * command while downloading the firmware.
> +	 */
> +	boot_param = 0x00000000;
> +
> +	calltime = ktime_get();
> +
> +	/* Read the Intel version information to determine if the device
> +	 * is in bootloader mode or if it already has operational firmware
> +	 * loaded.
> +	 */
> +	err = btintel_read_version_tlv(hdev, &version);
> +	if (err) {
> +		bt_dev_err(hdev, "Intel Read version failed (%d)", err);
> +		btintel_reset_to_bootloader(hdev);
> +		return err;
> +	}
> +
> +	btintel_version_info_tlv(hdev, &version);
> +
> +	err = btusb_intel_download_firmware_newgen(hdev, &version, &boot_param);
> +	if (err)
> +		return err;
> +
> +	/* check if controller is already having an operational firmware */
> +	if (version.img_type == 0x03)
> +		goto finish;
> +
> +	rettime = ktime_get();
> +	delta = ktime_sub(rettime, calltime);
> +	duration = (unsigned long long)ktime_to_ns(delta) >> 10;
> +
> +	bt_dev_info(hdev, "Firmware loaded in %llu usecs", duration);
> +
> +	calltime = ktime_get();
> +
> +	set_bit(BTUSB_BOOTING, &data->flags);
> +
> +	err = btintel_send_intel_reset(hdev, boot_param);
> +	if (err) {
> +		bt_dev_err(hdev, "Intel Soft Reset failed (%d)", err);
> +		btintel_reset_to_bootloader(hdev);
> +		return err;
> +	}
> +
> +	/* The bootloader will not indicate when the device is ready. This
> +	 * is done by the operational firmware sending bootup notification.
> +	 *
> +	 * Booting into operational firmware should not take longer than
> +	 * 1 second. However if that happens, then just fail the setup
> +	 * since something went wrong.
> +	 */
> +	bt_dev_info(hdev, "Waiting for device to boot");
> +
> +	err = wait_on_bit_timeout(&data->flags, BTUSB_BOOTING,
> +				  TASK_INTERRUPTIBLE,
> +				  msecs_to_jiffies(1000));
> +
> +	if (err == -EINTR) {
> +		bt_dev_err(hdev, "Device boot interrupted");
> +		return -EINTR;
> +	}
> +
> +	if (err) {
> +		bt_dev_err(hdev, "Device boot timeout");
> +		btintel_reset_to_bootloader(hdev);
> +		return -ETIMEDOUT;
> +	}
> +
> +	rettime = ktime_get();
> +	delta = ktime_sub(rettime, calltime);
> +	duration = (unsigned long long)ktime_to_ns(delta) >> 10;
> +
> +	bt_dev_info(hdev, "Device booted in %llu usecs", duration);
> +
> +	clear_bit(BTUSB_BOOTLOADER, &data->flags);
> +
> +	err = btusb_setup_intel_newgen_get_fw_name(&version, ddcname,
> +						   sizeof(ddcname), "ddc");
> +	if (!err) {
> +		bt_dev_err(hdev, "Unsupported Intel firmware naming");
> +	} else {
> +		/* Once the device is running in operational mode, it needs to
> +		 * apply the device configuration (DDC) parameters.
> +		 *
> +		 * The device can work without DDC parameters, so even if it
> +		 * fails to load the file, no need to fail the setup.
> +		 */
> +		btintel_load_ddc_config(hdev, ddcname);
> +	}
> +
> +	/* Read the Intel supported features and if new exception formats
> +	 * supported, need to load the additional DDC config to enable.
> +	 */
> +	btintel_read_debug_features(hdev, &features);
> +
> +	/* Set DDC mask for available debug features */
> +	btintel_set_debug_features(hdev, &features);
> +
> +	/* Read the Intel version information after loading the FW  */
> +	err = btintel_read_version_tlv(hdev, &version);
> +	if (err)
> +		return err;
> +
> +	btintel_version_info_tlv(hdev, &version);
> +
> +finish:
> +	/* Set the event mask for Intel specific vendor events. This enables
> +	 * a few extra events that are useful during general operation. It
> +	 * does not enable any debugging related events.
> +	 *
> +	 * The device will function correctly without these events enabled
> +	 * and thus no need to fail the setup.
> +	 */
> +	btintel_set_event_mask(hdev, false);
> +
> +	return 0;
> +}
> static int btusb_shutdown_intel(struct hci_dev *hdev)
> {
> 	struct sk_buff *skb;
> @@ -3936,7 +4252,8 @@ static int btusb_probe(struct usb_interface *intf,
> 	init_usb_anchor(&data->ctrl_anchor);
> 	spin_lock_init(&data->rxlock);
> 
> -	if (id->driver_info & BTUSB_INTEL_NEW) {
> +	if ((id->driver_info & BTUSB_INTEL_NEW) ||
> +	    (id->driver_info & BTUSB_INTEL_NEWGEN)) {
> 		data->recv_event = btusb_recv_event_intel;
> 		data->recv_bulk = btusb_recv_bulk_intel;
> 		set_bit(BTUSB_BOOTLOADER, &data->flags);
> @@ -4031,7 +4348,8 @@ static int btusb_probe(struct usb_interface *intf,
> 		set_bit(HCI_QUIRK_NON_PERSISTENT_DIAG, &hdev->quirks);
> 	}
> 
> -	if (id->driver_info & BTUSB_INTEL_NEW) {
> +	if ((id->driver_info & BTUSB_INTEL_NEW) ||
> +	    (id->driver_info & BTUSB_INTEL_NEWGEN)) {
> 		hdev->manufacturer = 2;
> 		hdev->send = btusb_send_frame_intel;
> 		hdev->setup = btusb_setup_intel_new;
> @@ -4045,6 +4363,10 @@ static int btusb_probe(struct usb_interface *intf,
> 		set_bit(HCI_QUIRK_NON_PERSISTENT_DIAG, &hdev->quirks);
> 	}
> 
> +	/* Overload only setup function for new generation Intel controllers */
> +	if (id->driver_info & BTUSB_INTEL_NEWGEN)
> +		hdev->setup = btusb_setup_intel_newgen;
> +

Please don’t do that. Have a separate statement for BTUSB_INTEL_NEWGEN.

Regards

Marcel

