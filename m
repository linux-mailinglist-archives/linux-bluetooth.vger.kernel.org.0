Return-Path: <linux-bluetooth+bounces-12885-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64914AD3C1E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Jun 2025 17:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17A10189F673
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Jun 2025 15:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DB9238171;
	Tue, 10 Jun 2025 15:01:32 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C0413212A
	for <linux-bluetooth@vger.kernel.org>; Tue, 10 Jun 2025 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749567692; cv=none; b=qoMbojZpCe2nQd1N0m5N4F5xsZq9JPN9JPbhq0i0n5j2/wqQtQIywEvwRhhST1cPHmXxgqRHToX3oTWCJ+TY4nPHYrfo5RLdLaxEFLF1Z/Lplr0pn3i/CZTowj9Mq/gTc089hghNpmVeRIyfBBAYrwhn9yuhKMZ2pzKG6WGyBak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749567692; c=relaxed/simple;
	bh=n6e+VYDNydkwtQ/guPsd8aWgo3q6wLVFpItCoZYaJro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ObmU7D2Xl0JjepdZt1/vgEVdPxcQ7iYkMLD/W720llGyVbwTMfRV1Ulp8vjrt+ovQGjV+PBRliiuOH5eyGCISRyIikGrLnJj1z8LL06F4kcUsoMSvQblsiYZka7OZ2Mwcp5kG3twrhays8mVeX5HgzvHOxV05s/z/DLwzWXTcXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.36] (g36.guest.molgen.mpg.de [141.14.220.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 2C04A61E64862;
	Tue, 10 Jun 2025 17:01:08 +0200 (CEST)
Message-ID: <6b48977c-5b3a-4977-b1b0-a04f416a1511@molgen.mpg.de>
Date: Tue, 10 Jun 2025 17:01:07 +0200
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] Bluetooth: btintel_pcie: Support Function level
 reset
To: Kiran K <kiran.k@intel.com>
Cc: ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
 chandrashekar.devegowda@intel.com, aluvala.sai.teja@intel.com,
 linux-bluetooth@vger.kernel.org
References: <20250610140038.696091-1-kiran.k@intel.com>
 <20250610140038.696091-2-kiran.k@intel.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250610140038.696091-2-kiran.k@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Chandrashekar, dear Kiran,


Thank you for the improved version. Sorry, but I still have a few minor 
comments.

Am 10.06.25 um 16:00 schrieb Kiran K:
> From: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
> 
> The driver supports Function Level Reset (FLR) to recover the controller
> upon hardware exceptions or hci command timeouts. FLR is triggered only
> when no prior reset has occurred within the retry window, with a maximum
> of one FLR allowed within this window.

Why only one FLR?

> This patch is tested by,
> echo 1 >  /sys/class/bluetooth/hciX/reset
> 
> Signed-off-by: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
> Signed-off-by: Kiran K <kiran.k@intel.com>
> ---
> changes in v3:
> - Fix typos, indentation issues
> - Update commit message to include test command
> - Keep the flr max retry to 1
> 
>   drivers/bluetooth/btintel_pcie.c | 226 ++++++++++++++++++++++++++++++-
>   drivers/bluetooth/btintel_pcie.h |   4 +-
>   2 files changed, 227 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
> index e1c688dd2d45..87e4b3546c7a 100644
> --- a/drivers/bluetooth/btintel_pcie.c
> +++ b/drivers/bluetooth/btintel_pcie.c
> @@ -41,6 +41,13 @@ static const struct pci_device_id btintel_pcie_table[] = {
>   };
>   MODULE_DEVICE_TABLE(pci, btintel_pcie_table);
>   
> +struct btintel_pcie_dev_restart_data {
> +	struct list_head list;
> +	u8 restart_count;
> +	time64_t last_error;
> +	char name[];
> +};
> +
>   /* Intel PCIe uses 4 bytes of HCI type instead of 1 byte BT SIG HCI type */
>   #define BTINTEL_PCIE_HCI_TYPE_LEN	4
>   #define BTINTEL_PCIE_HCI_CMD_PKT	0x00000001
> @@ -62,6 +69,9 @@ MODULE_DEVICE_TABLE(pci, btintel_pcie_table);
>   #define BTINTEL_PCIE_TRIGGER_REASON_USER_TRIGGER	0x17A2
>   #define BTINTEL_PCIE_TRIGGER_REASON_FW_ASSERT		0x1E61
>   
> +#define BTINTEL_PCIE_RESET_WINDOW_SECS		5
> +#define BTINTEL_PCIE_FLR_MAX_RETRY	1
> +
>   /* Alive interrupt context */
>   enum {
>   	BTINTEL_PCIE_ROM,
> @@ -99,6 +109,14 @@ struct btintel_pcie_dbgc_ctxt {
>   	struct btintel_pcie_dbgc_ctxt_buf bufs[BTINTEL_PCIE_DBGC_BUFFER_COUNT];
>   };
>   
> +struct btintel_pcie_removal {
> +	struct pci_dev *pdev;
> +	struct work_struct work;
> +};
> +
> +static LIST_HEAD(btintel_pcie_restart_data_list);
> +static DEFINE_SPINLOCK(btintel_pcie_restart_data_lock);
> +
>   /* This function initializes the memory for DBGC buffers and formats the
>    * DBGC fragment which consists header info and DBGC buffer's LSB, MSB and
>    * size as the payload
> @@ -1932,6 +1950,9 @@ static int btintel_pcie_send_frame(struct hci_dev *hdev,
>   	u32 type;
>   	u32 old_ctxt;
>   
> +	if (test_bit(BTINTEL_PCIE_CORE_HALTED, &data->flags))
> +		return -ENODEV;
> +
>   	/* Due to the fw limitation, the type header of the packet should be
>   	 * 4 bytes unlike 1 byte for UART. In UART, the firmware can read
>   	 * the first byte to get the packet type and redirect the rest of data
> @@ -2192,9 +2213,196 @@ static int btintel_pcie_setup(struct hci_dev *hdev)
>   		}
>   		btintel_pcie_start_rx(data);
>   	}
> +
> +	if (!err)
> +		set_bit(BTINTEL_PCIE_SETUP_DONE, &data->flags);
>   	return err;
>   }
>   
> +static struct btintel_pcie_dev_restart_data *btintel_pcie_get_restart_data(struct pci_dev *pdev,
> +									   struct device *dev)
> +{
> +	struct btintel_pcie_dev_restart_data *tmp, *data = NULL;
> +	const char *name = pci_name(pdev);
> +	struct hci_dev *hdev = to_hci_dev(dev);
> +
> +	spin_lock(&btintel_pcie_restart_data_lock);
> +	list_for_each_entry(tmp, &btintel_pcie_restart_data_list, list) {
> +		if (strcmp(tmp->name, name))
> +			continue;
> +		data = tmp;
> +		break;
> +	}
> +	spin_unlock(&btintel_pcie_restart_data_lock);
> +
> +	if (data) {
> +		bt_dev_dbg(hdev, "Found restart data for BDF: %s", data->name);
> +		return data;
> +	}
> +
> +	data = kzalloc(struct_size(data, name, strlen(name) + 1), GFP_ATOMIC);
> +	if (!data)
> +		return NULL;
> +
> +	strscpy_pad(data->name, name, strlen(name) + 1);
> +	spin_lock(&btintel_pcie_restart_data_lock);
> +	list_add_tail(&data->list, &btintel_pcie_restart_data_list);
> +	spin_unlock(&btintel_pcie_restart_data_lock);
> +
> +	return data;
> +}
> +
> +static void btintel_pcie_free_restart_list(void)
> +{
> +	struct btintel_pcie_dev_restart_data *tmp;
> +
> +	while ((tmp = list_first_entry_or_null(&btintel_pcie_restart_data_list,
> +					       typeof(*tmp), list))) {
> +		list_del(&tmp->list);
> +		kfree(tmp);
> +	}
> +}
> +
> +static void btintel_pcie_inc_restart_count(struct pci_dev *pdev,
> +					   struct device *dev)
> +{
> +	struct btintel_pcie_dev_restart_data *data;
> +	struct hci_dev *hdev = to_hci_dev(dev);
> +	time64_t retry_window;
> +
> +	data = btintel_pcie_get_restart_data(pdev, dev);
> +	if (!data)
> +		return;
> +
> +	retry_window = ktime_get_boottime_seconds() - data->last_error;
> +	if (data->restart_count == 0) {
> +		data->last_error = ktime_get_boottime_seconds();
> +		data->restart_count++;
> +		bt_dev_dbg(hdev, "First iteration initialise. last_error: %lld seconds restart_count: %d",
> +			   data->last_error, data->restart_count);
> +	} else if (retry_window < BTINTEL_PCIE_RESET_WINDOW_SECS &&
> +		   data->restart_count <= BTINTEL_PCIE_FLR_MAX_RETRY) {
> +		data->restart_count++;
> +		bt_dev_dbg(hdev, "Flr triggered within the max retry time so increment the restart_count: %d",

Spell it FLR?

> +			   data->restart_count);
> +	} else if (retry_window > BTINTEL_PCIE_RESET_WINDOW_SECS) {
> +		data->last_error = 0;
> +		data->restart_count = 0;
> +		bt_dev_dbg(hdev, "Flr triggered out of the retry window, so reset counters");

Ditto.

> +	}
> +}
> +
> +static int btintel_pcie_setup_hdev(struct btintel_pcie_data *data);
> +
> +static void btintel_pcie_removal_work(struct work_struct *wk)
> +{
> +	struct btintel_pcie_removal *removal =
> +		container_of(wk, struct btintel_pcie_removal, work);
> +	struct pci_dev *pdev = removal->pdev;
> +	struct btintel_pcie_data *data;
> +	int err;
> +
> +	pci_lock_rescan_remove();
> +
> +	if (!pdev->bus)
> +		goto error;
> +
> +	data = pci_get_drvdata(pdev);
> +
> +	btintel_pcie_disable_interrupts(data);
> +	btintel_pcie_synchronize_irqs(data);
> +
> +	flush_work(&data->rx_work);
> +	flush_work(&data->hdev->dump.dump_rx);
> +
> +	bt_dev_dbg(data->hdev, "Release bluetooth interface");
> +	btintel_pcie_release_hdev(data);
> +
> +	err = pci_reset_function(pdev);
> +	if (err) {
> +		BT_ERR("Failed resetting the pcie device (%d)", err);
> +		goto error;
> +	}
> +
> +	btintel_pcie_enable_interrupts(data);
> +	btintel_pcie_config_msix(data);
> +
> +	err = btintel_pcie_enable_bt(data);
> +	if (err) {
> +		BT_ERR("Failed to enable bluetooth hardware after reset (%d)",
> +		       err);
> +		goto error;
> +	}
> +
> +	btintel_pcie_reset_ia(data);
> +	btintel_pcie_start_rx(data);
> +	data->flags = 0;
> +
> +	err = btintel_pcie_setup_hdev(data);
> +	if (err) {
> +		BT_ERR("Failed registering hdev (%d)", err);
> +		goto error;
> +	}
> +error:
> +	pci_dev_put(pdev);
> +	pci_unlock_rescan_remove();
> +	kfree(removal);
> +}
> +
> +static void btintel_pcie_reset(struct hci_dev *hdev)
> +{
> +	struct btintel_pcie_removal *removal;
> +	struct btintel_pcie_data *data;
> +
> +	data = hci_get_drvdata(hdev);
> +
> +	if (!test_bit(BTINTEL_PCIE_SETUP_DONE, &data->flags))
> +		return;
> +
> +	if (test_and_set_bit(BTINTEL_PCIE_RECOVERY_IN_PROGRESS, &data->flags))
> +		return;
> +
> +	removal = kzalloc(sizeof(*removal), GFP_ATOMIC);
> +	if (!removal)
> +		return;
> +
> +	removal->pdev = data->pdev;
> +	INIT_WORK(&removal->work, btintel_pcie_removal_work);
> +	pci_dev_get(removal->pdev);
> +	schedule_work(&removal->work);
> +}
> +
> +static void btintel_pcie_hw_error(struct hci_dev *hdev, u8 code)
> +{
> +	struct  btintel_pcie_dev_restart_data *data;

Exactly one space after struct?

> +	struct btintel_pcie_data *dev_data = hci_get_drvdata(hdev);
> +	struct pci_dev *pdev = dev_data->pdev;
> +	time64_t retry_window;
> +
> +	if (code == 0x13) {
> +		bt_dev_err(hdev, "Encountered top exception");
> +		return;
> +	}
> +
> +	data = btintel_pcie_get_restart_data(pdev, &hdev->dev);
> +	if (!data)
> +		return;
> +
> +	retry_window = ktime_get_boottime_seconds() - data->last_error;
> +
> +	if (retry_window < BTINTEL_PCIE_RESET_WINDOW_SECS &&
> +	    data->restart_count >= BTINTEL_PCIE_FLR_MAX_RETRY) {
> +		bt_dev_err(hdev, "Exhausted maximum: %d recovery attempts: %d",
> +			   BTINTEL_PCIE_FLR_MAX_RETRY, data->restart_count);
> +		bt_dev_dbg(hdev, "Boot time: %lld seconds first_flr at: %lld seconds restart_count: %d",
> +			   ktime_get_boottime_seconds(), data->last_error,
> +			   data->restart_count);
> +		return;
> +	}
> +	btintel_pcie_inc_restart_count(pdev, &hdev->dev);
> +	btintel_pcie_reset(hdev);
> +}
> +
>   static int btintel_pcie_setup_hdev(struct btintel_pcie_data *data)
>   {
>   	int err;
> @@ -2216,9 +2424,10 @@ static int btintel_pcie_setup_hdev(struct btintel_pcie_data *data)
>   	hdev->send = btintel_pcie_send_frame;
>   	hdev->setup = btintel_pcie_setup;
>   	hdev->shutdown = btintel_shutdown_combined;
> -	hdev->hw_error = btintel_hw_error;
> +	hdev->hw_error = btintel_pcie_hw_error;
>   	hdev->set_diag = btintel_set_diag;
>   	hdev->set_bdaddr = btintel_set_bdaddr;
> +	hdev->reset = btintel_pcie_reset;
>   
>   	err = hci_register_dev(hdev);
>   	if (err < 0) {
> @@ -2366,7 +2575,20 @@ static struct pci_driver btintel_pcie_driver = {
>   	.driver.coredump = btintel_pcie_coredump
>   #endif
>   };
> -module_pci_driver(btintel_pcie_driver);
> +
> +static int __init btintel_pcie_init(void)
> +{
> +	return pci_register_driver(&btintel_pcie_driver);
> +}
> +
> +static void __exit btintel_pcie_exit(void)
> +{
> +	pci_unregister_driver(&btintel_pcie_driver);
> +	btintel_pcie_free_restart_list();
> +}
> +
> +module_init(btintel_pcie_init);
> +module_exit(btintel_pcie_exit);
>   
>   MODULE_AUTHOR("Tedd Ho-Jeong An <tedd.an@intel.com>");
>   MODULE_DESCRIPTION("Intel Bluetooth PCIe transport driver ver " VERSION);
> diff --git a/drivers/bluetooth/btintel_pcie.h b/drivers/bluetooth/btintel_pcie.h
> index 7dad4523236c..0fa876c5b954 100644
> --- a/drivers/bluetooth/btintel_pcie.h
> +++ b/drivers/bluetooth/btintel_pcie.h
> @@ -117,7 +117,9 @@ enum {
>   enum {
>   	BTINTEL_PCIE_CORE_HALTED,
>   	BTINTEL_PCIE_HWEXP_INPROGRESS,
> -	BTINTEL_PCIE_COREDUMP_INPROGRESS
> +	BTINTEL_PCIE_COREDUMP_INPROGRESS,
> +	BTINTEL_PCIE_RECOVERY_IN_PROGRESS,
> +	BTINTEL_PCIE_SETUP_DONE
>   };
>   
>   enum btintel_pcie_tlv_type {


Kind regards,

Paul

