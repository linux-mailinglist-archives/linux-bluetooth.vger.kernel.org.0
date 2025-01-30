Return-Path: <linux-bluetooth+bounces-10066-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 852CEA233D0
	for <lists+linux-bluetooth@lfdr.de>; Thu, 30 Jan 2025 19:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EBBF18858C6
	for <lists+linux-bluetooth@lfdr.de>; Thu, 30 Jan 2025 18:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA541F0E40;
	Thu, 30 Jan 2025 18:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="sETlovPp"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8894143888;
	Thu, 30 Jan 2025 18:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.18.73.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738262111; cv=none; b=Mk9A3oJh1m+MG1zgVAHJPJpfZ2eSKpuJeYvSTqJVi64vR7KB5v59X9z3+EItEV15Ep4tbTsoW47RCOMsnTx09435J+oXZ00IjOVWM0h9lfF5Ef63QoKeysVh3+UMyhV2R27qqn8Q02c1VC2KvfHG8kJFUDSyEp4pifmRy5a3Sxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738262111; c=relaxed/simple;
	bh=TwAAoJer/FPnpvBQxGFZ60k7H5CAyYtl65JkhxpM9DA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=MNFISf7acDTWJgE505sxzIIPMuRJ/c+sJFEjbeWNuy1rXaaxlUT/5XI6MUheP5T9fhow5ZMK88dRIDOtqh/zK4CUhueiBiG/7TcWGRIorFgfzVVEt+KQpEeswG6VB7MvaS1xqLbcAEag3tZ2cKEcVhk2zMiiswJjBN7IxCcmf70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=sETlovPp; arc=none smtp.client-ip=37.18.73.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8C324100008;
	Thu, 30 Jan 2025 21:34:44 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8C324100008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1738262084;
	bh=pDRf5BLR0/0IYmafaREu9IPC4OM9eMc7Mv+ojVZWcio=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type:From;
	b=sETlovPpIqS03YA2OgcvnYW9DVy09MRRVlzVny5ZEMlxaxwXDzCrD8l5FTHFFFRWf
	 /I8SCn0LyJ0yHI/humocKOHQ3xXVqgsRIXTP5ebkirkjMLDekq9XPET/5cmX9ICgOo
	 KN/1HxKq71k4Cj2fc7SWp1llpydpHRVWFgyBt6k55k6bj4JKnE5BwkR7ubmhRqtUQj
	 HCDRvvpY947Dlv78vQnb8Dkg7GlLNU4UJ6dkSlz2X/Gn1IgTspRzDFHRTpdjYf0QIY
	 vkNyOWCgmc3gyTlwNT1dL1g07HM8K3SJg/5GHkOmd4Q1+XkFqmbfDHYF2Kc59qe/IU
	 i5iEE4aA2nYMA==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 30 Jan 2025 21:34:44 +0300 (MSK)
Message-ID: <64dafad8-c4f1-d8bb-368a-239caa09a32c@salutedevices.com>
Date: Thu, 30 Jan 2025 21:34:43 +0300
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] Bluetooth: hci_uart: fix race during initialization
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
CC: Marcel Holtmann <marcel@holtmann.org>, <oxffffaa@gmail.com>,
	<linux-bluetooth@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>
References: <d159c57f-8490-4c26-79da-6ad3612c4a14@salutedevices.com>
 <CABBYNZLa9amkcQzqRyiCK7acKeXiPLkfX8thMonQhXN+5PnmmQ@mail.gmail.com>
 <e0b77a36-2d2b-735c-7a23-bbaab5adeba7@salutedevices.com>
 <a2a239f1-5697-cb09-5e4f-83c024fd5ea6@salutedevices.com>
Content-Language: en-US
In-Reply-To: <a2a239f1-5697-cb09-5e4f-83c024fd5ea6@salutedevices.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-exch-cas-a-m1.sberdevices.ru (172.24.201.216)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190694 [Jan 30 2025]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 50 0.3.50 df4aeb250ed63fd3baa80a493fa6caee5dd9e10f, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/01/30 12:39:00 #27158825
X-KSMG-AntiVirus-Status: Clean, skipped

Hi, sorry ping

Thanks

On 08.01.2025 15:39, Arseniy Krasnov wrote:
> 
> 
> On 19.12.2024 23:07, Arseniy Krasnov wrote:
>>
>>
>> On 19.12.2024 22:18, Luiz Augusto von Dentz wrote:
>>> Hi Arseniy,
>>>
>>> On Tue, Dec 17, 2024 at 3:12 AM Arseniy Krasnov
>>> <avkrasnov@salutedevices.com> wrote:
>>>>
>>>> 'hci_register_dev()' calls power up function, which is executed by
>>>> kworker - 'hci_power_on()'. This function does access to bluetooth chip
>>>> using callbacks from 'hci_ldisc.c', for example 'hci_uart_send_frame()'.
>>>> Now 'hci_uart_send_frame()' checks 'HCI_UART_PROTO_READY' bit set, and
>>>> if not - it fails. Problem is that 'HCI_UART_PROTO_READY' is set after
>>>> 'hci_register_dev()', and there is tiny chance that 'hci_power_on()' will
>>>> be executed before setting this bit. In that case HCI init logic fails.
>>>>
>>>> Patch moves setting of 'HCI_UART_PROTO_READY' before calling function
>>>> 'hci_uart_register_dev()'.
>>>>
>>>> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
>>>> ---
>>>>  Changelog v1->v2:
>>>>  * Move 'set_bit()' before 'hci_uart_register_dev()' instead of
>>>>    adding new bit 'HCI_UART_PROTO_INIT'.
>>>
>>> What drivers/controllers this was tested with? I want to make sure
>>> this doesn't cause regressions to other drivers if there are perhaps
>>> some drivers assuming HCI_UART_PROTO_READY was set in a certain order.
>>
>> Hi,
>>
>> I tested this on:
>>
>> CONFIG_BT=y
>> CONFIG_BT_HCIUART=y
>> CONFIG_BT_HCIUART_H4=y
> 
> Hi, sorry, but is this enough info about my test env ?
> 
> Thanks
> 
>>
>> Yes, my v1 patchset with extra INIT bit was targeted to keep
>> original behaviour - e.g. PROTO_READY bit usage still the same,
>> just adding extra bit to handle this specific case.
>>
>> Thanks
>>
>>>
>>>>  drivers/bluetooth/hci_ldisc.c | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/bluetooth/hci_ldisc.c b/drivers/bluetooth/hci_ldisc.c
>>>> index 30192bb083549..07b9aa09bbe2e 100644
>>>> --- a/drivers/bluetooth/hci_ldisc.c
>>>> +++ b/drivers/bluetooth/hci_ldisc.c
>>>> @@ -704,12 +704,13 @@ static int hci_uart_set_proto(struct hci_uart *hu, int id)
>>>>
>>>>         hu->proto = p;
>>>>
>>>> +       set_bit(HCI_UART_PROTO_READY, &hu->flags);
>>>> +
>>>>         err = hci_uart_register_dev(hu);
>>>>         if (err) {
>>>>                 return err;
>>>>         }
>>>>
>>>> -       set_bit(HCI_UART_PROTO_READY, &hu->flags);
>>>>         return 0;
>>>>  }
>>>>
>>>> --
>>>> 2.30.1
>>>
>>>
>>>

