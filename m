Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 469143DBA1C
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jul 2021 16:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239132AbhG3OKT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 30 Jul 2021 10:10:19 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:51169 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239107AbhG3OKT (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 30 Jul 2021 10:10:19 -0400
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
        by mail.holtmann.org (Postfix) with ESMTPSA id 5E752CED2F;
        Fri, 30 Jul 2021 16:10:13 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v11 03/10] Bluetooth: btintel: Read supported offload
 usecases
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210727084713.23038-3-kiran.k@intel.com>
Date:   Fri, 30 Jul 2021 16:10:12 +0200
Cc:     linux-bluetooth@vger.kernel.org, ravishankar.srivatsa@intel.com,
        chethan.tumkur.narayan@intel.com
Content-Transfer-Encoding: 8BIT
Message-Id: <3710CF06-1420-4C39-ADD1-FA39E4909FA9@holtmann.org>
References: <20210727084713.23038-1-kiran.k@intel.com>
 <20210727084713.23038-3-kiran.k@intel.com>
To:     Kiran K <kiran.k@intel.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

> Read offload usecases supported by controller.
> 
> Signed-off-by: Kiran K <kiran.k@intel.com>
> Reviewed-by: Chethan T N <chethan.tumkur.narayan@intel.com>
> Reviewed-by: Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
> ---
> * changes in v11:
>  - Remove Kconfig related changes
> * changes in v10:
>  - restructure patch to have  definition and call of callaback in the
>    same patch
> * changes in v9:
>  - define a separate patch for core changes
> 
> drivers/bluetooth/btintel.c | 30 ++++++++++++++++++++++++++++++
> drivers/bluetooth/btintel.h | 10 ++++++++++
> drivers/bluetooth/btusb.c   |  3 +++
> 3 files changed, 43 insertions(+)
> 
> diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
> index e44b6993cf91..a6b81914766e 100644
> --- a/drivers/bluetooth/btintel.c
> +++ b/drivers/bluetooth/btintel.c
> @@ -1272,6 +1272,36 @@ int btintel_set_debug_features(struct hci_dev *hdev,
> }
> EXPORT_SYMBOL_GPL(btintel_set_debug_features);
> 
> +int btintel_configure_offload_usecases(struct hci_dev *hdev)
> +{
> +	struct sk_buff *skb;
> +	int err = 0;
> +	struct intel_offload_usecases *usecases;
> +
> +	skb = __hci_cmd_sync(hdev, 0xfc86, 0, NULL, HCI_INIT_TIMEOUT);
> +	if (IS_ERR(skb)) {
> +		bt_dev_err(hdev, "Reading offload usecases failed (%ld)",
> +			   PTR_ERR(skb));
> +		return PTR_ERR(skb);
> +	}
> +
> +	if (skb->len < sizeof(*usecases)) {
> +		err = -EIO;
> +		goto error;
> +	}
> +
> +	usecases = (void *)skb->data;
> +
> +	if (usecases->status) {
> +		err = -bt_to_errno(skb->data[0]);
> +		goto error;
> +	}
> +error:
> +	kfree_skb(skb);
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(btintel_configure_offload_usecases);
> +
> MODULE_AUTHOR("Marcel Holtmann <marcel@holtmann.org>");
> MODULE_DESCRIPTION("Bluetooth support for Intel devices ver " VERSION);
> MODULE_VERSION(VERSION);
> diff --git a/drivers/bluetooth/btintel.h b/drivers/bluetooth/btintel.h
> index d184064a5e7c..45ca5c4ccf37 100644
> --- a/drivers/bluetooth/btintel.h
> +++ b/drivers/bluetooth/btintel.h
> @@ -132,6 +132,11 @@ struct intel_debug_features {
> 	__u8    page1[16];
> } __packed;
> 
> +struct intel_offload_usecases {
> +	__u8	status;
> +	__u8	preset[8];
> +} __packed;
> +
> #define INTEL_HW_PLATFORM(cnvx_bt)	((u8)(((cnvx_bt) & 0x0000ff00) >> 8))
> #define INTEL_HW_VARIANT(cnvx_bt)	((u8)(((cnvx_bt) & 0x003f0000) >> 16))
> #define INTEL_CNVX_TOP_TYPE(cnvx_top)	((cnvx_top) & 0x00000fff)
> @@ -175,6 +180,7 @@ int btintel_read_debug_features(struct hci_dev *hdev,
> 				struct intel_debug_features *features);
> int btintel_set_debug_features(struct hci_dev *hdev,
> 			       const struct intel_debug_features *features);
> +int btintel_configure_offload_usecases(struct hci_dev *hdev);

so usecases is not, it would be offload_use_cases. However btintel_configure_offload is just fine as a function name. With the work from Tedd, this would be removed anyway and all done internally via the hdev->setup().

Regards

Marcel

