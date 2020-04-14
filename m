Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765801A73EF
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 Apr 2020 08:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406175AbgDNG5p convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 14 Apr 2020 02:57:45 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:41155 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406131AbgDNG5o (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 14 Apr 2020 02:57:44 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 8062ECECDB;
        Tue, 14 Apr 2020 09:07:17 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 3/4] Bluetooth: Enable LE Enhanced Connection Complete
 event.
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CAOVXEJLTj0=SUyE2HtbR6iDSyiTvJCaj6+AVOAC=StOe_jz5bA@mail.gmail.com>
Date:   Tue, 14 Apr 2020 08:57:40 +0200
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <9573B8CA-FE0B-4A9C-9773-0B21A2FA8D2E@holtmann.org>
References: <cover.1586412226.git.marcel@holtmann.org>
 <6b6ecbf19559cb16793d7ef3e96c1181a32b4df5.1586412226.git.marcel@holtmann.org>
 <CAOVXEJLTj0=SUyE2HtbR6iDSyiTvJCaj6+AVOAC=StOe_jz5bA@mail.gmail.com>
To:     Sathish Narasimman <nsathish41@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sathish,

>> In case LL Privacy is supported by the controller, it is also a good
>> idea to use the LE Enhanced Connection Complete event for getting all
>> information about the new connection and its addresses.
>> 
>> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
>> ---
>> include/net/bluetooth/hci.h | 1 +
>> net/bluetooth/hci_core.c    | 8 ++++++++
>> 2 files changed, 9 insertions(+)
>> 
>> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
>> index ff42d05b3e72..1da8cec8e210 100644
>> --- a/include/net/bluetooth/hci.h
>> +++ b/include/net/bluetooth/hci.h
>> @@ -460,6 +460,7 @@ enum {
>> #define HCI_LE_SLAVE_FEATURES          0x08
>> #define HCI_LE_PING                    0x10
>> #define HCI_LE_DATA_LEN_EXT            0x20
>> +#define HCI_LE_LL_PRIVACY              0x40
>> #define HCI_LE_EXT_SCAN_POLICY         0x80
>> #define HCI_LE_PHY_2M                  0x01
>> #define HCI_LE_PHY_CODED               0x08
>> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
>> index 589c4085499c..0d726d59a492 100644
>> --- a/net/bluetooth/hci_core.c
>> +++ b/net/bluetooth/hci_core.c
>> @@ -638,6 +638,14 @@ static int hci_init3_req(struct hci_request *req, unsigned long opt)
>>                if (hdev->le_features[0] & HCI_LE_DATA_LEN_EXT)
>>                        events[0] |= 0x40;      /* LE Data Length Change */
>> 
>> +               /* If the controller supports LL Privacy feature, enable
>> +                * the corresponding event.
>> +                */
>> +               if (hdev->le_features[0] & HCI_LE_LL_PRIVACY)
>> +                       events[1] |= 0x02;      /* LE Enhanced Connection
>> +                                                * Complete
>> +                                                */
>> +
>>                /* If the controller supports Extended Scanner Filter
>>                 * Policies, enable the correspondig event.
>>                 */
>> --
>> 2.25.2
>> 
> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/tree/net/bluetooth/hci_core.c#n717
> 
> I see LE Enhanced Connection complete event is enabled here.

I see. However LE Enhanced Connection complete event has been added for LL Privacy and not for Extended Advertising. The current setting of the event needs to be removed. If you look at the difference on what the event is adding compared to the legacy one, you see it is only about RPAs.

Regards

Marcel

