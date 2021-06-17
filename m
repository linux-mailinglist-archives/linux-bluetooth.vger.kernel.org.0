Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4053AB139
	for <lists+linux-bluetooth@lfdr.de>; Thu, 17 Jun 2021 12:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbhFQKV6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 17 Jun 2021 06:21:58 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:57307 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbhFQKV6 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 17 Jun 2021 06:21:58 -0400
Received: from smtpclient.apple (p4fefc9d6.dip0.t-ipconnect.de [79.239.201.214])
        by mail.holtmann.org (Postfix) with ESMTPSA id 809B4CED2B;
        Thu, 17 Jun 2021 12:27:51 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v9 07/10] Bluetooth: btintel: define callback to set data
 path
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <DM8PR11MB5573C680C3BD9F7954B5C9B6F50E9@DM8PR11MB5573.namprd11.prod.outlook.com>
Date:   Thu, 17 Jun 2021 12:19:49 +0200
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <7834860D-E868-4398-8938-CDB79D7996EA@holtmann.org>
References: <20210608122455.19583-1-kiran.k@intel.com>
 <20210608122455.19583-7-kiran.k@intel.com>
 <4C624839-10D3-4114-9037-4FB9E93E1EB6@holtmann.org>
 <DM8PR11MB5573451838727540A14200D4F50F9@DM8PR11MB5573.namprd11.prod.outlook.com>
 <4D9B420C-BD66-4E74-81EB-F0090D575115@holtmann.org>
 <DM8PR11MB5573C680C3BD9F7954B5C9B6F50E9@DM8PR11MB5573.namprd11.prod.outlook.com>
To:     "K, Kiran" <kiran.k@intel.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

>>>>> Adds callback function which is called to set the data path for HFP
>>>>> offload case before opening SCO connection
>>>>> 
>>>>> Signed-off-by: Kiran K <kiran.k@intel.com>
>>>>> Reviewed-by: Chethan T N <chethan.tumkur.narayan@intel.com>
>>>>> Reviewed-by: Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
>>>>> ---
>>>>> drivers/bluetooth/btintel.c | 50
>>>> +++++++++++++++++++++++++++++++++++++
>>>>> drivers/bluetooth/btintel.h |  8 ++++++
>>>>> drivers/bluetooth/btusb.c   |  4 ++-
>>>>> include/net/bluetooth/hci.h |  8 ++++++
>>>>> 4 files changed, 69 insertions(+), 1 deletion(-)
>>>>> 
>>>>> diff --git a/drivers/bluetooth/btintel.c
>>>>> b/drivers/bluetooth/btintel.c index 95c6a1bef35e..3eba5c587ef6
>>>>> 100644
>>>>> --- a/drivers/bluetooth/btintel.c
>>>>> +++ b/drivers/bluetooth/btintel.c
>>>>> @@ -1308,6 +1308,56 @@ int btintel_read_offload_usecases(struct
>>>>> hci_dev *hdev, } EXPORT_SYMBOL_GPL(btintel_read_offload_usecases);
>>>>> 
>>>>> +int btintel_set_data_path(struct hci_dev *hdev, __u8 type,
>>>>> +			  struct bt_codec *codec)
>>>>> +{
>>>>> +	__u8 preset;
>>>>> +	struct hci_op_configure_data_path *cmd;
>>>>> +	__u8 buffer[255];
>>>>> +	struct sk_buff *skb;
>>>>> +
>>>>> +	if (type != SCO_LINK && type != ESCO_LINK)
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	switch (codec->id) {
>>>>> +	case 0x02:
>>>>> +		preset = 0x00;
>>>>> +	break;
>>>>> +	case 0x05:
>>>>> +		preset = 0x01;
>>>>> +	break;
>>>>> +	default:
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	cmd = (void *)buffer;
>>>>> +	cmd->data_path_id = 0x01;
>>>>> +	cmd->len = 1;
>>>>> +	cmd->data[0] = preset;
>>>>> +
>>>>> +	cmd->direction = 0x00;
>>>>> +	skb = __hci_cmd_sync(hdev, HCI_CONFIGURE_DATA_PATH,
>>>> sizeof(*cmd) + 1,
>>>>> +			     cmd, HCI_INIT_TIMEOUT);
>>>>> +	if (IS_ERR(skb)) {
>>>>> +		bt_dev_err(hdev, "configure input data path failed (%ld)",
>>>>> +			   PTR_ERR(skb));
>>>>> +		return PTR_ERR(skb);
>>>>> +	}
>>>>> +	kfree_skb(skb);
>>>>> +
>>>>> +	cmd->direction = 0x01;
>>>>> +	skb = __hci_cmd_sync(hdev, HCI_CONFIGURE_DATA_PATH,
>>>> sizeof(*cmd) + 1,
>>>>> +			     cmd, HCI_INIT_TIMEOUT);
>>>>> +	if (IS_ERR(skb)) {
>>>>> +		bt_dev_err(hdev, "configure output data path failed (%ld)",
>>>>> +			   PTR_ERR(skb));
>>>>> +		return PTR_ERR(skb);
>>>>> +	}
>>>>> +	kfree_skb(skb);
>>>>> +	return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(btintel_set_data_path);
>>>>> +
>>>>> MODULE_AUTHOR("Marcel Holtmann <marcel@holtmann.org>");
>>>>> MODULE_DESCRIPTION("Bluetooth support for Intel devices ver "
>>>>> VERSION); MODULE_VERSION(VERSION); diff --git
>>>>> a/drivers/bluetooth/btintel.h b/drivers/bluetooth/btintel.h index
>>>>> 9bcc489680db..9806970c9871 100644
>>>>> --- a/drivers/bluetooth/btintel.h
>>>>> +++ b/drivers/bluetooth/btintel.h
>>>>> @@ -183,6 +183,8 @@ int btintel_set_debug_features(struct hci_dev
>>>>> *hdev, int btintel_read_offload_usecases(struct hci_dev *hdev,
>>>>> 				  struct intel_offload_usecases *usecases); int
>>>>> btintel_get_data_path(struct hci_dev *hdev);
>>>>> +int btintel_set_data_path(struct hci_dev *hdev, __u8 type,
>>>>> +			  struct bt_codec *codec);
>>>>> #else
>>>>> 
>>>>> static inline int btintel_check_bdaddr(struct hci_dev *hdev) @@
>>>>> -325,4
>>>>> +327,10 @@ static int btintel_get_data_path(struct hci_dev *hdev) {
>>>>> 	return -EOPNOTSUPP;
>>>>> }
>>>>> +
>>>>> +static int btintel_set_data_path(struct hci_dev *hdev, __u8 type,
>>>>> +				 struct bt_codec *codec)
>>>>> +{
>>>>> +	return -EOPNOTSUPP;
>>>>> +}
>>>>> #endif
>>>>> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
>>>>> index 1e51beec5776..afafa44752a1 100644
>>>>> --- a/drivers/bluetooth/btusb.c
>>>>> +++ b/drivers/bluetooth/btusb.c
>>>>> @@ -3012,8 +3012,10 @@ static int btusb_setup_intel_newgen(struct
>>>> hci_dev *hdev)
>>>>> 	err = btintel_read_offload_usecases(hdev, &usecases);
>>>>> 	if (!err) {
>>>>> 		/* set get_data_path callback if offload is supported */
>>>>> -		if (usecases.preset[0] & 0x03)
>>>>> +		if (usecases.preset[0] & 0x03) {
>>>>> 			hdev->get_data_path = btintel_get_data_path;
>>>>> +			hdev->set_data_path = btintel_set_data_path;
>>>>> +		}
>>>>> 	}
>>>> 
>>>>> 	/* Read the Intel version information after loading the FW  */ diff
>>>>> --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
>>>>> index 31a5ac8918fc..42963188dcea 100644
>>>>> --- a/include/net/bluetooth/hci.h
>>>>> +++ b/include/net/bluetooth/hci.h
>>>>> @@ -1250,6 +1250,14 @@ struct hci_rp_read_local_oob_ext_data {
>>>>> 	__u8     rand256[16];
>>>>> } __packed;
>>>>> 
>>>>> +#define HCI_CONFIGURE_DATA_PATH	0x0c83
>>>>> +struct hci_op_configure_data_path {
>>>>> +	__u8	direction;
>>>>> +	__u8	data_path_id;
>>>>> +	__u8	len;
>>>>> +	__u8	data[];
>>>>> +} __packed;
>>>>> +
>>>> 
>>>> if this is a standard HCI command, why is this done as hdev-
>>> set_data_path?
>>>> This makes no sense too me.
>>> Intel uses  HCI_CONFIGURE_DATA_PATH to command to set the preset ID
>> (NBS, WBS, ...). Here len and data[] are vendor specific. I should have
>> prefixed these fields with vnd_. I will address this in next patchset.
>> 
>> if the command is defined by the Bluetooth SIG, it is handle in the core.
>> However if it needs vendor specific input that we need a callback for just that
>> data.
> 
> The current design uses HCI_CONFIGURE_DATA_PATH inside  set_data_path callback and its not used at core.  I have leveraged SIG command here  to minimize defining  of new vendor command as vnd_data[] gives flexibility to pass in non-standard values. Other vendors may not have same command/flow to configure data path. 
> 
> If we are not supposed to use Bluetooth SIG command at driver level, then I need to come up with a new vendor specific command.  Please help with your input.

I don’t understand this argumentation. The Bluetooth standard defined HCI_Configure_Data_Path with Vendor_Specific_Config for exactly this reason. So just use it especially if our controllers already support it.

Now I am starting to wonder if this design is making things complicated for no reason. Isn’t it enough to have a hdev->get_data_path_config callback that allows to retrieve such data from the driver.

Frankly, the only thing you need from a driver is that it tells you the values of data_path_id and the vendor_config so that you can feed it back into the controller. Or am I missing anything here?

Let me be clear, if there is a SIG defined command, we implement support for in the core and not the driver. I do not want that other vendors have to define everything over and over again. That is what a standard is for. Only the vendor specific portions are handed off to the driver or userspace to provide.

Regards

Marcel

