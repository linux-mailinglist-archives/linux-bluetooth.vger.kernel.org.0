Return-Path: <linux-bluetooth+bounces-9438-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 138079F8576
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Dec 2024 21:10:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCC44165E99
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Dec 2024 20:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C851B6D08;
	Thu, 19 Dec 2024 20:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="fwsVPBUL"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6451A4F1B;
	Thu, 19 Dec 2024 20:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734638837; cv=none; b=pEctcEWHxohkG+9gcP4oykDhzj3ogMdIlMrvDrx2B0f3zLX/vgrZQot1wodhgM809hmZySU8FOLyK5sPXAZIaHyV75M5o/fbVPz1XxqvmEyEVQ6NhI3JReE2FpSMJ6tCD/gG7lZTdzXWezmBWY7FHshjt+pM4FtwWWenfZP5Xos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734638837; c=relaxed/simple;
	bh=Widbspgz0asvcuzbdhS85IL9bqqyMl8ENQ3nkpiJViw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oIgJ7gW21jx3VIu5+ZsWJrDyeF9J50E3FFUHBDNs4WxdAZ3OXfSMKrDbt26BRnjuOotLb9rxpjpf1v+a+TAcZcelH2CpArscRlrE+xszAdyKSrmUHFBUycHqdmLSv0liyJA3rJWrEmvjrzZBcMCB42S1ObyY1VMRqDl0ejKhJog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=fwsVPBUL; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 03D47120011;
	Thu, 19 Dec 2024 23:07:03 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 03D47120011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1734638823;
	bh=xU1zNzAFspHmrXgOdAoKvrYuWjEOQZLxkzd/anTUXqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=fwsVPBUL3pkx224QUM/k59/SvAwNzSxpAaNBVztCNT1kjcwOS7VqOrAk+u2Pw6KhU
	 84q2MrWeYCBO0n45SEPVX+tfpeZ718LY5ae00W6iKRPQaXWeatNEMbeHRD+FKaCJZS
	 h6LotAKi+oV+gzFG4olYWTj1yg0gTkTVYXCBNJ/UVWT9gxshhfowMvdveHMipyGrdo
	 xAYf9i+1TE2r5a3SxU9QlldunYpC8s9Tu7BiyxOTP3s0DWHAT+wkHoVSo8L1CYnY0J
	 QaUv99FS+iDyrXujV+2qBXLHXfkF/ogZeHpHK2zNJyU+E5Ra9TG8E/SJDkq3URfBOm
	 gbwuo6KKe5diQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 19 Dec 2024 23:07:02 +0300 (MSK)
Message-ID: <e0b77a36-2d2b-735c-7a23-bbaab5adeba7@salutedevices.com>
Date: Thu, 19 Dec 2024 23:07:01 +0300
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] Bluetooth: hci_uart: fix race during initialization
Content-Language: en-US
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
CC: Marcel Holtmann <marcel@holtmann.org>, <oxffffaa@gmail.com>,
	<linux-bluetooth@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>
References: <d159c57f-8490-4c26-79da-6ad3612c4a14@salutedevices.com>
 <CABBYNZLa9amkcQzqRyiCK7acKeXiPLkfX8thMonQhXN+5PnmmQ@mail.gmail.com>
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
In-Reply-To: <CABBYNZLa9amkcQzqRyiCK7acKeXiPLkfX8thMonQhXN+5PnmmQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 189958 [Dec 19 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49 28b3b64a43732373258a371bd1554adb2caa23cb, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/12/19 19:16:00 #26891781
X-KSMG-AntiVirus-Status: Clean, skipped



On 19.12.2024 22:18, Luiz Augusto von Dentz wrote:
> Hi Arseniy,
> 
> On Tue, Dec 17, 2024 at 3:12 AM Arseniy Krasnov
> <avkrasnov@salutedevices.com> wrote:
>>
>> 'hci_register_dev()' calls power up function, which is executed by
>> kworker - 'hci_power_on()'. This function does access to bluetooth chip
>> using callbacks from 'hci_ldisc.c', for example 'hci_uart_send_frame()'.
>> Now 'hci_uart_send_frame()' checks 'HCI_UART_PROTO_READY' bit set, and
>> if not - it fails. Problem is that 'HCI_UART_PROTO_READY' is set after
>> 'hci_register_dev()', and there is tiny chance that 'hci_power_on()' will
>> be executed before setting this bit. In that case HCI init logic fails.
>>
>> Patch moves setting of 'HCI_UART_PROTO_READY' before calling function
>> 'hci_uart_register_dev()'.
>>
>> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
>> ---
>>  Changelog v1->v2:
>>  * Move 'set_bit()' before 'hci_uart_register_dev()' instead of
>>    adding new bit 'HCI_UART_PROTO_INIT'.
> 
> What drivers/controllers this was tested with? I want to make sure
> this doesn't cause regressions to other drivers if there are perhaps
> some drivers assuming HCI_UART_PROTO_READY was set in a certain order.

Hi,

I tested this on:

CONFIG_BT=y
CONFIG_BT_HCIUART=y
CONFIG_BT_HCIUART_H4=y

Yes, my v1 patchset with extra INIT bit was targeted to keep
original behaviour - e.g. PROTO_READY bit usage still the same,
just adding extra bit to handle this specific case.

Thanks

> 
>>  drivers/bluetooth/hci_ldisc.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bluetooth/hci_ldisc.c b/drivers/bluetooth/hci_ldisc.c
>> index 30192bb083549..07b9aa09bbe2e 100644
>> --- a/drivers/bluetooth/hci_ldisc.c
>> +++ b/drivers/bluetooth/hci_ldisc.c
>> @@ -704,12 +704,13 @@ static int hci_uart_set_proto(struct hci_uart *hu, int id)
>>
>>         hu->proto = p;
>>
>> +       set_bit(HCI_UART_PROTO_READY, &hu->flags);
>> +
>>         err = hci_uart_register_dev(hu);
>>         if (err) {
>>                 return err;
>>         }
>>
>> -       set_bit(HCI_UART_PROTO_READY, &hu->flags);
>>         return 0;
>>  }
>>
>> --
>> 2.30.1
> 
> 
> 

