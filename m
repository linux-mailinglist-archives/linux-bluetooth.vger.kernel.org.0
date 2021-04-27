Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0D936CB64
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Apr 2021 20:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236394AbhD0TAS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 27 Apr 2021 15:00:18 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:55911 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235974AbhD0TAS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 27 Apr 2021 15:00:18 -0400
Received: from smtpclient.apple (p4fefc624.dip0.t-ipconnect.de [79.239.198.36])
        by mail.holtmann.org (Postfix) with ESMTPSA id 458BFCED05;
        Tue, 27 Apr 2021 21:07:22 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [PATCH v2 01/10] Bluetooth: HCI: Use skb_pull to parse BR/EDR
 events
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CABBYNZ+ONgc-AfrSUfgvWQ1h=ue3+gM0HfYA0gDAwX61EtH=bQ@mail.gmail.com>
Date:   Tue, 27 Apr 2021 20:59:33 +0200
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <7B4EDE89-53D3-4F4C-A6BC-1842ED4352CD@holtmann.org>
References: <20210419171257.3865181-1-luiz.dentz@gmail.com>
 <20210419171257.3865181-2-luiz.dentz@gmail.com>
 <25D86C94-89CE-44CC-BB9C-724486444C12@holtmann.org>
 <CABBYNZJSRN2AbLqOVEWJ1oJivn0nR59zZad5AG1LCYpghd6CmA@mail.gmail.com>
 <BB97D0B0-1006-47E0-BA9E-876A6833D5E0@holtmann.org>
 <CABBYNZKmsOGqtezqDzzEh=ti1Am-mGQcbGCrekEcr8JPx=TW0w@mail.gmail.com>
 <79A4150F-9DD2-4370-993F-495248D8D377@holtmann.org>
 <CABBYNZ+ONgc-AfrSUfgvWQ1h=ue3+gM0HfYA0gDAwX61EtH=bQ@mail.gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

>>>>>>> This uses skb_pull to check the BR/EDR events received have the minimum
>>>>>>> required length.
>>>>>>> 
>>>>>>> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
>>>>>>> ---
>>>>>>> include/net/bluetooth/hci.h |   4 +
>>>>>>> net/bluetooth/hci_event.c   | 272 +++++++++++++++++++++++++++++-------
>>>>>>> 2 files changed, 229 insertions(+), 47 deletions(-)
>>>>>>> 
>>>>>>> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
>>>>>>> index ea4ae551c426..f1f505355e81 100644
>>>>>>> --- a/include/net/bluetooth/hci.h
>>>>>>> +++ b/include/net/bluetooth/hci.h
>>>>>>> @@ -1894,6 +1894,10 @@ struct hci_cp_le_reject_cis {
>>>>>>> } __packed;
>>>>>>> 
>>>>>>> /* ---- HCI Events ---- */
>>>>>>> +struct hci_ev_status {
>>>>>>> +     __u8    status;
>>>>>>> +} __packed;
>>>>>>> +
>>>>>>> #define HCI_EV_INQUIRY_COMPLETE               0x01
>>>>>>> 
>>>>>>> #define HCI_EV_INQUIRY_RESULT         0x02
>>>>>>> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
>>>>>>> index 5e99968939ce..077541fcba41 100644
>>>>>>> --- a/net/bluetooth/hci_event.c
>>>>>>> +++ b/net/bluetooth/hci_event.c
>>>>>>> @@ -42,6 +42,30 @@
>>>>>>> 
>>>>>>> /* Handle HCI Event packets */
>>>>>>> 
>>>>>>> +static void *hci_skb_pull(struct sk_buff *skb, size_t len)
>>>>>>> +{
>>>>>>> +     void *data = skb->data;
>>>>>>> +
>>>>>>> +     if (skb->len < len)
>>>>>>> +             return NULL;
>>>>>>> +
>>>>>>> +     skb_pull(skb, len);
>>>>>>> +
>>>>>>> +     return data;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void *hci_ev_skb_pull(struct hci_dev *hdev, struct sk_buff *skb,
>>>>>>> +                          u8 ev, size_t len)
>>>>>>> +{
>>>>>>> +     void *data;
>>>>>>> +
>>>>>>> +     data = hci_skb_pull(skb, len);
>>>>>>> +     if (!data)
>>>>>>> +             bt_dev_err(hdev, "Malformed Event: 0x%2.2x", ev);
>>>>>>> +
>>>>>>> +     return data;
>>>>>>> +}
>>>>>>> +
>>>>>> 
>>>>>> so if you do it in one function, this will look like this:
>>>>>> 
>>>>>>      static void *hci_ev_skb_pull(..)
>>>>>>      {
>>>>>>              void *data = skb->data;
>>>>>> 
>>>>>>              if (skb->len < len) {
>>>>>>                      bt_dev_err(hdev, “Malformed ..”);
>>>>>>                      return NULL;
>>>>>>              }
>>>>>> 
>>>>>>              skb_pull(skb, len);
>>>>>>              return data;
>>>>>>      }
>>>>>> 
>>>>>>      static void *hci_cc_skb_pull(..)
>>>>>>      {
>>>>>>              void *data = skb->data;
>>>>>> 
>>>>>>              if (skb->len < len) {
>>>>>>                      bt_dev_err(..);
>>>>>>                      return NULL;
>>>>>>              }
>>>>>> 
>>>>>>              skb_pull(..);
>>>>>>              return data;
>>>>>>      }
>>>>>> 
>>>>>> I realize that you want to optimize the code with hci_skb_pull, but I don’t see how that makes it simpler or cleaner. In the end you just have spaghetti code and don’t win anything in size reduction or complexity.
>>>>> 
>>>>> Right, I can either do that or perhaps bite the bullet and convert the
>>>>> whole hci_event.c to use a function table:
>>>>> 
>>>>> #define HCI_EVENT(_op, _len, _func)...
>>>>> 
>>>>> struct hci_event {
>>>>> __u8    op;
>>>>> __u16  len;
>>>>> func...
>>>>> } ev_table[] = {
>>>>> HCI_EVENT(...),
>>>>> }
>>>>> 
>>>>> But that would pack a lot more changes since we would need to convert
>>>>> the whole switch to a for loop or alternatively if we don't want do a
>>>>> lookup we could omit the op and access the table by index if we want
>>>>> to trade speed over code size, with that we can have just one call to
>>>>> the likes of hci_ev_skb_pull.
>>>> 
>>>> looping through a table is not ideal. There are too many events that you can receive and if we end up looping for every LE advertising report it would be rather silly. And of course a static table is possible since event numbers are assigned in order, but it also means some sort of overhead since we don’t parse each event.
>>>> 
>>>> In addition to that dilemma, you have the problem that not all events are fixed size. So you end up indicating that similar to how we do it in btmon which will increase the table size again. Maybe that is actually ok since two giant switch statements also take time and code size.
>>>> 
>>>> So our currently max event code is 0x57 for Authenticated Payload Timeout and the max LE event code is 0x3e for BIG Info Advertising Report. Meaning table one would have 87 entries and table would have two 63 entries. If we do min_len,max_len as uint8 then we have 2 octets and a function pointer. Maybe that is not too bad since that is all static const data.
>>> 
>>> Yep, even if we have to have NOP for those event we don't handle I
>>> don't think it is such a big deal and accessing by index should be
>>> comparable in terms of speed to a switch statement, that said we may
>>> still need to do some checks on the callbacks for those events that
>>> have variable size I was only intending to do minimal size checks but
>>> perhaps you are saying it might be better to have a bool/flag saying
>>> that the event has variable size which matters when we are checking
>>> the length to either use == or <.
>> 
>> I actually meant min_len + max_len.
>> 
>> So you have for example
>> 
>>        HCI_EVENT(..) that sets min_len = x, max_len = x.
>>        HCI_EVENT_VAR(..) that sets min_len = x and max_len = 253.
>> 
>> No need for extra flags then.
> 
> Ah got it, is there really a max_len for variable size though? Or you
> mean to say that should be limited to event buffer size? That Im
> afraid we only discover at runtime, anyway usually for variable size
> we should be using flex_array_size but that requires accessing the
> received skb so we can't really tell at build time and it will be
> likely left for the callback to figure out it has received enough data
> or not.

using max_len will make it flexible enough since in HCI event the max len is 253 as far as I recall. Or it was 255, but I don’t remember from the top of my head.

It also really doesn’t matter since if you need to change something, you just change the #define HCI_EVENT_VAR and that is it. I prefer to not make it more complicated than needed. The flex_array_size is nice, but I don’t know how much use that is in a static const structure array.

Regards

Marcel

