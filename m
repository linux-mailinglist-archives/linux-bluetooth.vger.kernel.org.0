Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C91456572
	for <lists+linux-bluetooth@lfdr.de>; Thu, 18 Nov 2021 23:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbhKRWMh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 18 Nov 2021 17:12:37 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:33685 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232210AbhKRWMg (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 18 Nov 2021 17:12:36 -0500
Received: from smtpclient.apple (p4fefc15c.dip0.t-ipconnect.de [79.239.193.92])
        by mail.holtmann.org (Postfix) with ESMTPSA id 23917CED15;
        Thu, 18 Nov 2021 23:09:35 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH v2 1/2] Bluetooth: Introduce HCI_CONN_FLAG_DEVICE_PRIVACY
 device flag
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CABBYNZ+VaBM+FM9GAAAd5Kb4LJnfPs6LrZaU-KpVOwK7kPawpQ@mail.gmail.com>
Date:   Thu, 18 Nov 2021 23:09:34 +0100
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <8829C9B2-1D7D-4371-ACA3-E36D2FE8803F@holtmann.org>
References: <20211105222739.461398-1-luiz.dentz@gmail.com>
 <411F0489-163E-4809-B20F-282311A5BC36@holtmann.org>
 <CABBYNZKZBrTnOoo9yGyYP7i8N9EzcmPpy_-FPngouZOzu+gUJA@mail.gmail.com>
 <B47FBB15-3593-43AB-BA21-E08B34DE3C1F@holtmann.org>
 <CABBYNZ+VaBM+FM9GAAAd5Kb4LJnfPs6LrZaU-KpVOwK7kPawpQ@mail.gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

>>>>> This introduces HCI_CONN_FLAG_DEVICE_PRIVACY which can be used by
>>>>> userspace to indicate to the controller to use Device Privacy Mode to a
>>>>> specific device.
>>>>> 
>>>>> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
>>>>> ---
>>>>> v2: Fix marking Device Privacy Flag even when adapter is not capable of
>>>>> handling Set Privacy Mode.
>>>>> 
>>>>> include/net/bluetooth/hci_core.h |  4 ++++
>>>>> net/bluetooth/mgmt.c             | 24 ++++++++++++++++++++----
>>>>> 2 files changed, 24 insertions(+), 4 deletions(-)
>>>>> 
>>>>> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
>>>>> index b5f061882c10..07d2d099dc2a 100644
>>>>> --- a/include/net/bluetooth/hci_core.h
>>>>> +++ b/include/net/bluetooth/hci_core.h
>>>>> @@ -160,6 +160,7 @@ struct bdaddr_list_with_flags {
>>>>> 
>>>>> enum hci_conn_flags {
>>>>>     HCI_CONN_FLAG_REMOTE_WAKEUP,
>>>>> +     HCI_CONN_FLAG_DEVICE_PRIVACY,
>>>>>     HCI_CONN_FLAG_MAX
>>>>> };
>>>>> 
>>>>> @@ -1468,6 +1469,9 @@ void hci_conn_del_sysfs(struct hci_conn *conn);
>>>>> #define use_ll_privacy(dev) (ll_privacy_capable(dev) && \
>>>>>                          hci_dev_test_flag(dev, HCI_ENABLE_LL_PRIVACY))
>>>>> 
>>>>> +#define privacy_mode_capable(dev) (use_ll_privacy(dev) && \
>>>>> +                                (hdev->commands[39] & 0x04))
>>>>> +
>>>>> /* Use enhanced synchronous connection if command is supported */
>>>>> #define enhanced_sco_capable(dev) ((dev)->commands[29] & 0x08)
>>>>> 
>>>>> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
>>>>> index 06384d761928..8a8376d32be3 100644
>>>>> --- a/net/bluetooth/mgmt.c
>>>>> +++ b/net/bluetooth/mgmt.c
>>>>> @@ -4350,7 +4350,16 @@ static int set_exp_feature(struct sock *sk, struct hci_dev *hdev,
>>>>>                            MGMT_STATUS_NOT_SUPPORTED);
>>>>> }
>>>>> 
>>>>> -#define SUPPORTED_DEVICE_FLAGS() ((1U << HCI_CONN_FLAG_MAX) - 1)
>>>>> +static u32 supported_device_flags(struct hci_dev *hdev)
>>>>> +{
>>>>> +     u32 flags = BIT(HCI_CONN_FLAG_MAX) - 1;
>>>>> +
>>>>> +     /* Check if Privacy Mode can be set */
>>>>> +     if (!privacy_mode_capable(hdev))
>>>>> +             flags &= ~BIT(HCI_CONN_FLAG_DEVICE_PRIVACY);
>>>>> +
>>>>> +     return flags;
>>>>> +}
>>>> 
>>>> I am lost on what we are doing, I know that SUPPORTED_DEVICE_FLAGS was introduced by 4c54bf2b093bb from Abhishek, but I fail to reason now why it is correct.
>>> 
>>> But we don't set the HCI_CONN_FLAG_DEVICE_PRIVACY is hdev is not
>>> capable of setting it, anyway the general idea of the supported_flags
>>> is to indicate to userspace what flags the kernel is capable of
>>> settings, so yeah I would expected it to be capable of setting every
>>> flag except for those the controller don't have proper support for.
>>> Maybe you got confused by the logic of first enabling everything and
>>> then toggle back the bits that are not supported by the hdev.
>> 
>> and I think that is wrong. We should only set the bits that the hardware and/or kernel supports. I have no idea on how I missed this in the review back then. I am trying to figure it out, but I am failing to follow this logic.
> 
> There is only 1 flag currently though, HCI_CONN_FLAG_REMOTE_WAKEUP, so
> I wonder if that really requires a check? Or perhaps you want to
> change the way we supported_device_flags works to:
> 
> index fe52b7eefb56..3ad09ce6eaeb 100644
> --- a/net/bluetooth/mgmt.c
> +++ b/net/bluetooth/mgmt.c
> @@ -4351,11 +4351,15 @@ static int set_exp_feature(struct sock *sk,
> struct hci_dev *hdev,
> 
> static u32 supported_device_flags(struct hci_dev *hdev)
> {
> -       u32 flags = BIT(HCI_CONN_FLAG_MAX) - 1;
> +       u32 flags = 0;
> +
> +       /* Check if adapter can wakeup the system */
> +       if (hdev->wakeup && hdev->wakeup(hdev))
> +               flags |= HCI_CONN_FLAG_REMOTE_WAKEUP;
> 
>        /* Check if Privacy Mode can be set */
> -       if (!privacy_mode_capable(hdev))
> -               flags &= ~BIT(HCI_CONN_FLAG_DEVICE_PRIVACY);
> +       if (privacy_mode_capable(hdev))
> +               flags |= HCI_CONN_FLAG_DEVICE_PRIVACY;
> 
>        return flags;
> }

yes, that is how I would expected it to be.

Regards

Marcel

