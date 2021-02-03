Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBD8B30DB90
	for <lists+linux-bluetooth@lfdr.de>; Wed,  3 Feb 2021 14:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232216AbhBCNnN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 3 Feb 2021 08:43:13 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:54203 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbhBCNmn (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 3 Feb 2021 08:42:43 -0500
Received: from marcel-macbook.holtmann.net (p4fefcdd8.dip0.t-ipconnect.de [79.239.205.216])
        by mail.holtmann.org (Postfix) with ESMTPSA id ADFB1CECFD;
        Wed,  3 Feb 2021 14:49:22 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [RFC v2] Bluetooth: btintel: Check firmware version before
 download
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210201232402.906223-1-luiz.dentz@gmail.com>
Date:   Wed, 3 Feb 2021 14:41:55 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <78D5B277-B0AC-41A8-BCB5-C96D3EB44331@holtmann.org>
References: <20210201232402.906223-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This checking the firmware build number, week and years matches and then
> skip the download process.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> drivers/bluetooth/btintel.c   | 88 +++++++++++++++++++++++++++--------
> drivers/bluetooth/btintel.h   |  5 +-
> drivers/bluetooth/btusb.c     | 22 +++++----
> drivers/bluetooth/hci_intel.c |  2 +-
> 4 files changed, 84 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
> index 88ce5f0ffc4b..bf7b910966c8 100644
> --- a/drivers/bluetooth/btintel.c
> +++ b/drivers/bluetooth/btintel.c
> @@ -24,6 +24,14 @@
> #define ECDSA_OFFSET		644
> #define ECDSA_HEADER_LEN	320
> 
> +#define CMD_WRITE_BOOT_PARAMS	0xfc0e
> +struct cmd_write_boot_params {
> +	u32 boot_addr;
> +	u8  fw_build_num;
> +	u8  fw_build_ww;
> +	u8  fw_build_yy;
> +} _packed;
> +
> int btintel_check_bdaddr(struct hci_dev *hdev)
> {
> 	struct hci_rp_read_bd_addr *bda;
> @@ -841,7 +849,7 @@ static int btintel_sfi_ecdsa_header_secure_send(struct hci_dev *hdev,
> 
> static int btintel_download_firmware_payload(struct hci_dev *hdev,
> 					     const struct firmware *fw,
> -					     u32 *boot_param, size_t offset)
> +					     size_t offset)
> {
> 	int err;
> 	const u8 *fw_ptr;
> @@ -854,20 +862,6 @@ static int btintel_download_firmware_payload(struct hci_dev *hdev,
> 	while (fw_ptr - fw->data < fw->size) {
> 		struct hci_command_hdr *cmd = (void *)(fw_ptr + frag_len);
> 
> -		/* Each SKU has a different reset parameter to use in the
> -		 * HCI_Intel_Reset command and it is embedded in the firmware
> -		 * data. So, instead of using static value per SKU, check
> -		 * the firmware data and save it for later use.
> -		 */
> -		if (le16_to_cpu(cmd->opcode) == 0xfc0e) {
> -			/* The boot parameter is the first 32-bit value
> -			 * and rest of 3 octets are reserved.
> -			 */
> -			*boot_param = get_unaligned_le32(fw_ptr + sizeof(*cmd));
> -
> -			bt_dev_dbg(hdev, "boot_param=0x%x", *boot_param);
> -		}
> -
> 		frag_len += sizeof(*cmd) + cmd->plen;
> 
> 		/* The parameter length of the secure send command requires
> @@ -896,28 +890,84 @@ static int btintel_download_firmware_payload(struct hci_dev *hdev,
> 	return err;
> }
> 
> +static bool btintel_firmware_version(struct hci_dev *hdev,
> +				     u8 num, u8 ww, u8 yy,
> +				     const struct firmware *fw,
> +				     u32 *boot_addr)
> +{
> +	const u8 *fw_ptr;
> +	u32 frag_len;
> +
> +	fw_ptr = fw->data;
> +	frag_len = 0;
> +
> +	while (fw_ptr - fw->data < fw->size) {
> +		struct hci_command_hdr *cmd = (void *)(fw_ptr + frag_len);
> +
> +		/* Each SKU has a different reset parameter to use in the
> +		 * HCI_Intel_Reset command and it is embedded in the firmware
> +		 * data. So, instead of using static value per SKU, check
> +		 * the firmware data and save it for later use.
> +		 */
> +		if (le16_to_cpu(cmd->opcode) == CMD_WRITE_BOOT_PARAMS) {
> +			struct cmd_write_boot_params *params;
> +
> +			params = (void *)(fw_ptr + sizeof(*cmd));
> +
> +			bt_dev_dbg(hdev, "Boot Address: 0x%x\n"
> +				   "Firmware Version: %u-%u.%u",
> +				   le32_to_cpu(params->boot_addr),
> +				   params->fw_build_num, params->fw_build_ww,
> +				   params->fw_build_yy);

use two bt_dev_dbg here please.

> +
> +			if (num == params->fw_build_num &&
> +			    ww == params->fw_build_ww &&
> +			    yy == params->fw_build_yy)
> +				return true;
> +			else

The else part is not really needed here.

> +				return false;
> +		}

Maybe this is better
			/* comment goes here, true when x and false when y */
			return (num == params_foo &&
				ww = params_bar &&
				yy = params_foobar);

> +
> +		frag_len += sizeof(*cmd) + cmd->plen;
> +	}
> +
> +	return false;
> +}
> +
> int btintel_download_firmware(struct hci_dev *hdev,
> +			      struct intel_version *ver,
> 			      const struct firmware *fw,
> 			      u32 *boot_param)
> {
> 	int err;
> 
> +	/* Skip download if firmware has the same version */
> +	if (btintel_firmware_version(hdev, ver->fw_build_num, ver->fw_build_ww,
> +				     ver->fw_build_yy, fw, boot_param))
> +		return -EALREADY;
> +
> 	err = btintel_sfi_rsa_header_secure_send(hdev, fw);
> 	if (err)
> 		return err;
> 
> -	return btintel_download_firmware_payload(hdev, fw, boot_param,
> -						 RSA_HEADER_LEN);
> +	return btintel_download_firmware_payload(hdev, fw, RSA_HEADER_LEN);
> }
> EXPORT_SYMBOL_GPL(btintel_download_firmware);
> 
> int btintel_download_firmware_newgen(struct hci_dev *hdev,
> +				     struct intel_version_tlv *ver,
> 				     const struct firmware *fw, u32 *boot_param,
> 				     u8 hw_variant, u8 sbe_type)
> {
> 	int err;
> 	u32 css_header_ver;
> 
> +	/* Skip download if firmware has the same version */
> +	if (btintel_firmware_version(hdev, ver->min_fw_build_nn,
> +				     ver->min_fw_build_cw, ver->min_fw_build_yy,
> +				     fw, boot_param))
> +		return -EALREADY;
> +
> 	/* iBT hardware variants 0x0b, 0x0c, 0x11, 0x12, 0x13, 0x14 support
> 	 * only RSA secure boot engine. Hence, the corresponding sfi file will
> 	 * have RSA header of 644 bytes followed by Command Buffer.
> @@ -947,7 +997,7 @@ int btintel_download_firmware_newgen(struct hci_dev *hdev,
> 		if (err)
> 			return err;
> 
> -		err = btintel_download_firmware_payload(hdev, fw, boot_param, RSA_HEADER_LEN);
> +		err = btintel_download_firmware_payload(hdev, fw, RSA_HEADER_LEN);
> 		if (err)
> 			return err;
> 	} else if (hw_variant >= 0x17) {
> @@ -968,7 +1018,6 @@ int btintel_download_firmware_newgen(struct hci_dev *hdev,
> 				return err;
> 
> 			err = btintel_download_firmware_payload(hdev, fw,
> -								boot_param,
> 								RSA_HEADER_LEN + ECDSA_HEADER_LEN);
> 			if (err)
> 				return err;
> @@ -978,7 +1027,6 @@ int btintel_download_firmware_newgen(struct hci_dev *hdev,
> 				return err;
> 
> 			err = btintel_download_firmware_payload(hdev, fw,
> -								boot_param,
> 								RSA_HEADER_LEN + ECDSA_HEADER_LEN);
> 			if (err)
> 				return err;
> diff --git a/drivers/bluetooth/btintel.h b/drivers/bluetooth/btintel.h
> index 6511b091caf5..51f1f2c883b4 100644
> --- a/drivers/bluetooth/btintel.h
> +++ b/drivers/bluetooth/btintel.h
> @@ -163,9 +163,10 @@ struct regmap *btintel_regmap_init(struct hci_dev *hdev, u16 opcode_read,
> int btintel_send_intel_reset(struct hci_dev *hdev, u32 boot_param);
> int btintel_read_boot_params(struct hci_dev *hdev,
> 			     struct intel_boot_params *params);
> -int btintel_download_firmware(struct hci_dev *dev, const struct firmware *fw,
> -			      u32 *boot_param);
> +int btintel_download_firmware(struct hci_dev *dev, struct intel_version *ver,
> +			      const struct firmware *fw, u32 *boot_param);
> int btintel_download_firmware_newgen(struct hci_dev *hdev,
> +				     struct intel_version_tlv *ver,
> 				     const struct firmware *fw,
> 				     u32 *boot_param, u8 hw_variant,
> 				     u8 sbe_type);
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 4266c057746e..a06e86f52da3 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -2612,14 +2612,15 @@ static int btusb_intel_download_firmware_newgen(struct hci_dev *hdev,
> 	set_bit(BTUSB_DOWNLOADING, &data->flags);
> 
> 	/* Start firmware downloading and get boot parameter */
> -	err = btintel_download_firmware_newgen(hdev, fw, boot_param,
> +	err = btintel_download_firmware_newgen(hdev, ver, fw, boot_param,
> 					       INTEL_HW_VARIANT(ver->cnvi_bt),
> 					       ver->sbe_type);
> 	if (err < 0) {
> -		/* When FW download fails, send Intel Reset to retry
> -		 * FW download.
> -		 */
> -		btintel_reset_to_bootloader(hdev);
> +		if (err != -EALREADY)
> +			/* When FW download fails, send Intel Reset to retry
> +			 * FW download.
> +			 */
> +			btintel_reset_to_bootloader(hdev);

Need another comment about the EALREADY case and here { } around it for readability.

> 		goto done;
> 	}
> 	set_bit(BTUSB_FIRMWARE_LOADED, &data->flags);
> @@ -2806,12 +2807,13 @@ static int btusb_intel_download_firmware(struct hci_dev *hdev,
> 	set_bit(BTUSB_DOWNLOADING, &data->flags);
> 
> 	/* Start firmware downloading and get boot parameter */
> -	err = btintel_download_firmware(hdev, fw, boot_param);
> +	err = btintel_download_firmware(hdev, ver, fw, boot_param);
> 	if (err < 0) {
> -		/* When FW download fails, send Intel Reset to retry
> -		 * FW download.
> -		 */
> -		btintel_reset_to_bootloader(hdev);
> +		if (err != -EALREADY)
> +			/* When FW download fails, send Intel Reset to retry
> +			 * FW download.
> +			 */
> +			btintel_reset_to_bootloader(hdev);

See comment above.

> 		goto done;
> 	}
> 	set_bit(BTUSB_FIRMWARE_LOADED, &data->flags);
> diff --git a/drivers/bluetooth/hci_intel.c b/drivers/bluetooth/hci_intel.c
> index b20a40fab83e..050fae33dab8 100644
> --- a/drivers/bluetooth/hci_intel.c
> +++ b/drivers/bluetooth/hci_intel.c
> @@ -735,7 +735,7 @@ static int intel_setup(struct hci_uart *hu)
> 	set_bit(STATE_DOWNLOADING, &intel->flags);
> 
> 	/* Start firmware downloading and get boot parameter */
> -	err = btintel_download_firmware(hdev, fw, &boot_param);
> +	err = btintel_download_firmware(hdev, &ver, fw, &boot_param);
> 	if (err < 0)
> 		goto done;

Regards

Marcel

