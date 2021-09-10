Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64AA14067AB
	for <lists+linux-bluetooth@lfdr.de>; Fri, 10 Sep 2021 09:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbhIJHbR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 10 Sep 2021 03:31:17 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:58657 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbhIJHbQ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 10 Sep 2021 03:31:16 -0400
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
        by mail.holtmann.org (Postfix) with ESMTPSA id EAB79CED3D;
        Fri, 10 Sep 2021 09:30:03 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v8] Bluetooth: btusb: Add support using different nvm for
 variant WCN6855 controller
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1630641758-22281-1-git-send-email-zijuhu@codeaurora.org>
Date:   Fri, 10 Sep 2021 09:30:03 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        open list <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        c-hbandi@codeaurora.org, Hemantg <hemantg@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rocky Liao <rjliao@codeaurora.org>, tjiang@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <1A6C7105-5BA3-44C4-9F94-BB71FBDBE8F5@holtmann.org>
References: <1630641758-22281-1-git-send-email-zijuhu@codeaurora.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Zijun,

> the RF perfermance of wcn6855 soc chip from different foundries will be
> difference, so we should use different nvm to configure them.
> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
> ---
> drivers/bluetooth/btusb.c | 50 +++++++++++++++++++++++++++++++++++------------
> 1 file changed, 37 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 928cbfa4c42d..0f5d2222d624 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3161,6 +3161,9 @@ static int btusb_set_bdaddr_wcn6855(struct hci_dev *hdev,
> #define QCA_DFU_TIMEOUT		3000
> #define QCA_FLAG_MULTI_NVM      0x80
> 
> +#define WCN6855_2_0_RAM_VERSION_GF 0x400c1200
> +#define WCN6855_2_1_RAM_VERSION_GF 0x400c1211
> +
> struct qca_version {
> 	__le32	rom_version;
> 	__le32	patch_version;
> @@ -3192,6 +3195,7 @@ static const struct qca_device_info qca_devices_table[] = {
> 	{ 0x00000302, 28, 4, 16 }, /* Rome 3.2 */
> 	{ 0x00130100, 40, 4, 16 }, /* WCN6855 1.0 */
> 	{ 0x00130200, 40, 4, 16 }, /* WCN6855 2.0 */
> +	{ 0x00130201, 40, 4, 16 }, /* WCN6855 2.1 */
> };
> 
> static int btusb_qca_send_vendor_req(struct usb_device *udev, u8 request,
> @@ -3346,6 +3350,31 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
> 	return err;
> }
> 
> +static void btusb_generate_qca_nvm_name(char *fwname,
> +					size_t max_size,
> +					struct qca_version *ver,
> +					char *variant)
> +{
> +	char *sep = (strlen(variant) == 0) ? "" : "_";
> +	u16 board_id = le16_to_cpu(ver->board_id);
> +	u32 rom_version = le32_to_cpu(ver->rom_version);
> +
> +	if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
> +		/* if boardid equal 0, use default nvm without suffix */
> +		if (board_id == 0x0) {
> +			snprintf(fwname, max_size, "qca/nvm_usb_%08x%s%s.bin",
> +				rom_version, sep, variant);
> +		} else {
> +			snprintf(fwname, max_size, "qca/nvm_usb_%08x%s%s_%04x.bin",
> +				rom_version, sep, variant, board_id);
> +		}
> +	} else {
> +		snprintf(fwname, max_size, "qca/nvm_usb_%08x.bin",
> +			rom_version);
> +	}
> +
> +}
> +
> static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
> 				    struct qca_version *ver,
> 				    const struct qca_device_info *info)
> @@ -3354,19 +3383,14 @@ static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
> 	char fwname[64];
> 	int err;
> 
> -	if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
> -		/* if boardid equal 0, use default nvm without surfix */
> -		if (le16_to_cpu(ver->board_id) == 0x0) {
> -			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
> -				 le32_to_cpu(ver->rom_version));
> -		} else {
> -			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x_%04x.bin",
> -				le32_to_cpu(ver->rom_version),
> -				le16_to_cpu(ver->board_id));
> -		}
> -	} else {
> -		snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
> -			 le32_to_cpu(ver->rom_version));
> +	switch (ver->ram_version) {
> +	case WCN6855_2_0_RAM_VERSION_GF:
> +	case WCN6855_2_1_RAM_VERSION_GF:
> +			btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver, "gf");
> +		break;
> +	default:
> +			btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver, "");
> +		break;

I mentioned this multiple times now, the indentation is wrong here.

Regards

Marcel

