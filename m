Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE1FC101BA5
	for <lists+linux-bluetooth@lfdr.de>; Tue, 19 Nov 2019 09:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbfKSIQF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 19 Nov 2019 03:16:05 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:48384 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbfKSIQF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 19 Nov 2019 03:16:05 -0500
Received: from marcel-macbook.holtmann.net (p4FF9F0D1.dip0.t-ipconnect.de [79.249.240.209])
        by mail.holtmann.org (Postfix) with ESMTPSA id F1362CECEF;
        Tue, 19 Nov 2019 09:25:09 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH v2] bluetooth: bcm: Use HCI_QUIRK_USE_BDADDR_PROPERTY
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <e813a126-f0fc-afe8-ad4c-5296f0a2dc06@gmail.com>
Date:   Tue, 19 Nov 2019 09:16:03 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org, Ondrej Jirman <megous@megous.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Content-Transfer-Encoding: 8BIT
Message-Id: <F632534C-C9CC-4F4F-AA58-F4FC053D4226@holtmann.org>
References: <20191119060221.3297340-1-a.heider@gmail.com>
 <4DB6C9B7-8454-449C-90B4-4A1B3AD82495@holtmann.org>
 <e813a126-f0fc-afe8-ad4c-5296f0a2dc06@gmail.com>
To:     Andre Heider <a.heider@gmail.com>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Andre,

>>> Some devices ship with the controller default address, like the
>>> Orange Pi 3 (BCM4345C5).
>>> 
>>> Allow the bootloader to set a valid address through the device tree.
>>> 
>>> Signed-off-by: Andre Heider <a.heider@gmail.com>
>>> ---
>>> drivers/bluetooth/btbcm.c | 1 +
>>> 1 file changed, 1 insertion(+)
>>> 
>>> diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
>>> index 2d2e6d862068..9d16162d01ea 100644
>>> --- a/drivers/bluetooth/btbcm.c
>>> +++ b/drivers/bluetooth/btbcm.c
>>> @@ -439,6 +439,7 @@ int btbcm_finalize(struct hci_dev *hdev)
>>> 	btbcm_check_bdaddr(hdev);
>>> 
>>> 	set_bit(HCI_QUIRK_STRICT_DUPLICATE_FILTER, &hdev->quirks);
>>> +	set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
>>> 
>>> 	return 0;
>>> }
>> have you actually tested this? I might be mistaken, but the code that I read in hci_dev_do_open() would drop this into unconfigured state since HCI_QURIK_INVALID_BDADDR is still set.
> 
> I thought so, but double-checking something obviously failed...
> 
> What would be an acceptable solution to this HCI_QUIRK_USE_BDADDR_PROPERTY|HCI_QUIRK_INVALID_BDADDR situation?
> 
> Getting rid of the quirk in the driver in e.g. set_bdaddr() doesn't sound right.
> 
> How about:
> 
> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index 04bc79359a17..7bc384be89f8 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -1470,7 +1470,8 @@ static int hci_dev_do_open(struct hci_dev *hdev)
>         * start up as unconfigured.
>         */
>        if (test_bit(HCI_QUIRK_EXTERNAL_CONFIG, &hdev->quirks) ||
> -           test_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks))
> +           (test_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks) &&
> +            !test_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks)))
>            hci_dev_set_flag(hdev, HCI_UNCONFIGURED);
> 
>        /* For an unconfigured controller it is required to
> 
> That works for me (double-checked this time ;)

I am not sure yet. I mean we define what HCI_QUIRK_USE_BDADDR_PROPERTY actually means. Right now it means this:

1) Run though ->setup
2) If no public BD_ADDR is set, then try to read from DT
3) If found, try to set, if set fails, abort dev_up

Now there is also another problem that no public BD_ADDR means BDADDR_ANY right now. Which means, for Broadcom chips that is never the case. So HCI_QUIRK_USE_BDADDR_PROPERTY doesn’t even work since their invalid addresses are not BDDADDR_ANY.

The first change needs to be something along these lines:

                if (test_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks)) {
-                       if (!bacmp(&hdev->public_addr, BDADDR_ANY))
+                       if (!bacmp(&hdev->public_addr, BDADDR_ANY) ||
+                           test_bit(HCI_QUIRK_INVALID_BDADDR, &hdev->quirks))
                                hci_dev_get_bd_addr_from_property(hdev);

But that is not fully correct either. We also have to consider HCI_QUIRK_NON_PERSISTENT_SETUP.

So this is not an easy fix since we need to spell out the semantics of the interactions of these 3 quirks first.

Regards

Marcel

