Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89CEBC2018
	for <lists+linux-bluetooth@lfdr.de>; Mon, 30 Sep 2019 13:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfI3Lqb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Sep 2019 07:46:31 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:47581 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbfI3Lqb (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Sep 2019 07:46:31 -0400
Received: from marcel-macpro.fritz.box (p4FEFC197.dip0.t-ipconnect.de [79.239.193.151])
        by mail.holtmann.org (Postfix) with ESMTPSA id 5B33ACED26;
        Mon, 30 Sep 2019 13:55:24 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] Bluetooth: btusb: Trigger Intel FW download error
 recovery
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <EFE6F46E14A5F445949D76A8CAC224005844E059@PGSMSX105.gar.corp.intel.com>
Date:   Mon, 30 Sep 2019 13:46:29 +0200
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "Srivatsa, Ravishankar" <ravishankar.srivatsa@intel.com>,
        "Tumkur Narayan, Chethan" <chethan.tumkur.narayan@intel.com>,
        "Hegde, Raghuram" <raghuram.hegde@intel.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <C492CC56-8901-44EE-8A84-8DDBCA1655E6@holtmann.org>
References: <1569480202-10560-1-git-send-email-amit.k.bag@intel.com>
 <BE2BC36F-DD17-4773-B38B-AE4129EB3437@holtmann.org>
 <EFE6F46E14A5F445949D76A8CAC224005844D981@PGSMSX105.gar.corp.intel.com>
 <F15D9D95-0A5F-43E9-AA56-D7FFE0E5EAB9@holtmann.org>
 <EFE6F46E14A5F445949D76A8CAC224005844E059@PGSMSX105.gar.corp.intel.com>
To:     "Bag, Amit K" <amit.k.bag@intel.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Amit,

>>>>> Sometimes during FW data download stage, in case of an error is 
>>>>> encountered the controller device could not be recovered. To recover 
>>>>> from such failures send Intel hard Reset to re-trigger FW download 
>>>>> in following error scenarios:
>>>>> 
>>>>> 1. Intel Read version command error
>>>>> 2. Firmware download timeout
>>>>> 3. Failure in Intel Soft Reset for switching to operational FW 4. 
>>>>> Boot timeout for switching to operaional FW
>>>>> 
>>>>> Signed-off-by: Raghuram Hegde <raghuram.hegde@intel.com>
>>>>> Signed-off-by: Chethan T N <chethan.tumkur.narayan@intel.com>
>>>>> Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
>>>>> ---
>>>>> drivers/bluetooth/btintel.c | 39
>>>>> +++++++++++++++++++++++++++++++++++++++
>>>>> drivers/bluetooth/btintel.h |  6 ++++++
>>>>> drivers/bluetooth/btusb.c   | 20 ++++++++++++++++----
>>>>> 3 files changed, 61 insertions(+), 4 deletions(-)
>>>>> 
>>>>> diff --git a/drivers/bluetooth/btintel.c 
>>>>> b/drivers/bluetooth/btintel.c index bb99c8653aab..fdec9c53b48d 
>>>>> 100644
>>>>> --- a/drivers/bluetooth/btintel.c
>>>>> +++ b/drivers/bluetooth/btintel.c
>>>>> @@ -709,6 +709,45 @@ int btintel_download_firmware(struct hci_dev 
>>>>> *hdev, const struct firmware *fw, } 
>>>>> EXPORT_SYMBOL_GPL(btintel_download_firmware);
>>>>> 
>>>>> +void btintel_retry_fw_download(struct hci_dev *hdev) {
>>>>> +	/* Send Intel Reset command. This will result in
>>>>> +	 * re-enumeration of BT controller.
>>>>> +	 *
>>>>> +	 * Intel Reset parameter description:
>>>>> +	 * reset_param[0] => reset_type : 0x01 (Hard reset),
>>>>> +					  0x00 (Soft reset)
>>>>> +	 * reset_param[1] => patch_enable : 0x01 (Enable),
>>>>> +	 *				    0x00 (Do not enable)
>>>>> +	 * reset_param[2] => ddc_reload : 0x01 (Reload),
>>>>> +	 *				  0x00 (Do not reload)
>>>>> +	 * reset_param[3] => boot_option: 0x00 (Current image),
>>>>> +					  0x01 (Specified boot address)
>>>>> +	 * reset_param[4] to reset_param[7] => Boot address
>>>>> +	 *
>>>>> +	 */
>>>>> +	static const u8 reset_param[] = { 0x01, 0x01, 0x01, 0x00,
>>>>> +					0x00, 0x00, 0x00, 0x00 };
>>> 
>>> pplease use intel_reset structure and add the comments when assigning the fields.
>>> 
>>>>> +	struct sk_buff *skb;
>>>>> +
>>>>> +	skb = __hci_cmd_sync(hdev, 0xfc01, sizeof(reset_param),
>>>>> +				reset_param, HCI_INIT_TIMEOUT);
>>> 
>>> pplease align the second line according to the coding style.
>>> 
>>>>> +	if (IS_ERR(skb)) {
>>>>> +		bt_dev_err(hdev, "FW download error recovery failed (%ld)",
>>>>> +				PTR_ERR(skb));
>>> 
>>> SSame as above.
>>> 
>>>>> +		return;
>>>>> +	}
>>>>> +	bt_dev_info(hdev, "Intel reset sent to retry FW download");
>>>>> +	kfree_skb(skb);
>>> 
>>> EExtra empty line here.
>>> 
>>>>> +	/* Current Intel BT controllers(ThP/JfP) hold the USB reset
>>>>> +	 * lines for 2ms when it receives Intel Reset in bootloader mode.
>>>>> +	 * Whereas, the upcoming Intel BT controllers will hold USB reset
>>>>> +	 * for 150ms. To keep the delay generic, 150ms is chosen here.
>>>>> +	 */
>>>>> +	msleep(150);
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(btintel_retry_fw_download);
>>>>> +
>>> 
>>> II do not like the name here. Using btintel_reset_to_bootloader would be better. Since the function itself is not going to do the firmware retry. It will just drop you back into boot loader.
>>> 
>>> HHowever the more important question is what happens if you send this command. Is the device re-enumerating on USB? Or after the 150ms we just have to redo the firmware download.
>>> 
>>>>> MODULE_AUTHOR("Marcel Holtmann <marcel@holtmann.org>"); 
>>>>> MODULE_DESCRIPTION("Bluetooth support for Intel devices ver "
>>>>> VERSION); MODULE_VERSION(VERSION); diff --git 
>>>>> a/drivers/bluetooth/btintel.h b/drivers/bluetooth/btintel.h index
>>>>> 3d846190f2bf..d04d3c7cb513 100644
>>>>> --- a/drivers/bluetooth/btintel.h
>>>>> +++ b/drivers/bluetooth/btintel.h
>>>>> @@ -87,6 +87,7 @@ int btintel_read_boot_params(struct hci_dev *hdev,
>>>>> 			     struct intel_boot_params *params); int 
>>>>> btintel_download_firmware(struct hci_dev *dev, const struct firmware *fw,
>>>>> 			      u32 *boot_param);
>>>>> +void btintel_retry_fw_download(struct hci_dev *hdev);
>>>>> #else
>>>>> 
>>>>> static inline int btintel_check_bdaddr(struct hci_dev *hdev) @@ 
>>>>> -181,4
>>>>> +182,9 @@ static inline int btintel_download_firmware(struct hci_dev
>>>>> *dev, {
>>>>> 	return -EOPNOTSUPP;
>>>>> }
>>>>> +
>>>>> +static inline void btintel_retry_fw_download(struct hci_dev *hdev) {
>>>>> +	return -EOPNOTSUPP;
>>>>> +}
>>>>> #endif
>>>>> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c 
>>>>> index a9c35ebb30f8..7a763bd856ba 100644
>>>>> --- a/drivers/bluetooth/btusb.c
>>>>> +++ b/drivers/bluetooth/btusb.c
>>>>> @@ -1846,8 +1846,11 @@ static int btusb_setup_intel(struct hci_dev *hdev)
>>>>> 	 * firmware variant, revision and build number.
>>>>> 	 */
>>>>> 	err = btintel_read_version(hdev, &ver);
>>>>> -	if (err)
>>>>> +	if (err) {
>>>>> +		bt_dev_err(hdev, "Intel Read version failed (%d)", err);
>>>>> +		btintel_retry_fw_download(hdev);
>>>>> 		return err;
>>>>> +	}
>>>>> 
>>>>> 	bt_dev_info(hdev, "read Intel version: %02x%02x%02x%02x%02x%02x%02x%02x%02x",
>>>>> 		    ver.hw_platform, ver.hw_variant, ver.hw_revision, @@ -2326,9
>>>>> +2329,13 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
>>>>> 
>>>>> 	/* Start firmware downloading and get boot parameter */
>>>>> 	err = btintel_download_firmware(hdev, fw, &boot_param);
>>>>> -	if (err < 0)
>>>>> +	if (err < 0) {
>>>>> +		/* When FW download fails, send Intel Reset to retry
>>>>> +		 * FW download.
>>>>> +		 */
>>>>> +		btintel_retry_fw_download(hdev);
>>>>> 		goto done;
>>>> 
>>>> Is this actually going to work? If you jump to done, then you end up sending intel soft reset and then waiting for the device to boot. If you are lucky it times out, if not, then you end up loading DCC now.
>>>> 
>>>> If the device re-enumerates on USB, then we need an extra jump point to just release the firmware memory and then just exit hdev->setup. If are suppose to just retry, then we need to actually start over.
>>>> 
>>>> So have you actually tested this by randomly failing each step in the firmware download process.
>>>> 
>>> We send hard reset which will re-emumerates BT USB device and  initialize usb driver. 
>>> We have tested all the scenario and its working fine.
>> 
>> that is fine. However when this happens we should try to exit without sending any further commands. So we will need a separate exit path then.
> 
> This happens during firmware download when controller is in bootloader mode. When there is error during firmware download BT driver will not send any further command and since driver is not initialized bluez stack also will not send any commands at all. Only way to recover from this error is to power cycle the machine. Instead of complete power cycle we introduce this recovery mechanism by sending hard reset command which will only power cycle the BT chip not the complete machine.

are you sure that every goto done is not doing any further commands? When I looked at the code last week I came to a different conclusion.

Regards

Marcel

