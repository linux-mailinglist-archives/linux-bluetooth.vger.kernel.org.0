Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8092DFF93
	for <lists+linux-bluetooth@lfdr.de>; Mon, 21 Dec 2020 19:22:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgLUSVP (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 21 Dec 2020 13:21:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgLUSVP (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 21 Dec 2020 13:21:15 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C2DC0613D6
        for <linux-bluetooth@vger.kernel.org>; Mon, 21 Dec 2020 10:20:34 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 23so25862974lfg.10
        for <linux-bluetooth@vger.kernel.org>; Mon, 21 Dec 2020 10:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:references:to:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=okk7R6EENs9F9AGYcJIKj+Et4PPgeoKvR4raYqU1sEc=;
        b=Esx75Lm726XNVF/HTLM3CDwfKMtRhBeNoTSGA1J5TrLzcTW08UvPQamBuPPQ6KaPNw
         4beJNiLSTiWv6R1WtHNTVifOQaSW6JPIrSxG8wkh6dOpmEM7Y+CixUJLVxUjSxEO3OwY
         g/JsWZXf74ZCZ/fOnjKw1TmIHqh49zS89moJiSH+Nw1LqCeVIaaRpp49JYgmCxORsjrM
         CYPun84LS95k3d/DMxeUeluSta4YXZn7Mma3xHMgYYACNuf2vgovjs3hlSkNekZOpM2p
         oy0zXo+0zhqR1+wqjr7/Qa7W5p1+GpXKjvriu2AyNEk6dPqfiYHhqy5ctBhC5LIVUqLU
         ch4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:references:to:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=okk7R6EENs9F9AGYcJIKj+Et4PPgeoKvR4raYqU1sEc=;
        b=iXJUQ3uYvZA/TvtfgaOmHWK0krbeBFwmaHFCCKI/TTSPWOnp9TbtxvXSQxH/Opw/IC
         HtoVBPY0ZBIAYT1sfn2a1FXDUquCBttmrZm3Lidbr1Z7U7MVJrLeO0X0l1/o2CKS3STo
         qMNrdHhx1YFQhhGjBmQqasfA9ukfMyRrq7z/ScYUObHAU0/g3R1EGrOPpSBgjmwSzZW1
         SS0hxMjqtTUvd2q0UAO01eOImhGlVUew6XCDd2JjbVoV4ISmNQScLKPNuRwecj4m7KQh
         Bac4oF8uHsCq1qP1Wos7b6R9MeZrMNKUa7mR0XRRtPhRMoI1/MNrxo7rWykjm2pJqQuj
         t3lg==
X-Gm-Message-State: AOAM531F8xPRsZycv20H+JN/12CMNLxHJHg6z24iOmgvDPVjxf+vQLQ7
        uH+htmtNEIXoS5+SSmj+mweLXvj4I/h40w==
X-Google-Smtp-Source: ABdhPJze+EbwR5Mi9BJj+r0hD3GrRSXb9XgVR+duya69SEVn7/lxwMM++UkyRf8B5w1R6290oO9elA==
X-Received: by 2002:a17:906:402:: with SMTP id d2mr16214560eja.35.1608571567177;
        Mon, 21 Dec 2020 09:26:07 -0800 (PST)
Received: from ?IPv6:2a02:908:1982:45e0:523f:96f4:62fb:8f1? ([2a02:908:1982:45e0:523f:96f4:62fb:8f1])
        by smtp.googlemail.com with ESMTPSA id cb14sm9421034ejb.105.2020.12.21.09.26.05
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Dec 2020 09:26:05 -0800 (PST)
Subject: Re: Bluetooth connection disconnects every few minutes
References: <67077b05-dc49-3a97-c83f-4090f1cc7cea@gmail.com>
 <phdhvi$sdh$1@blaine.gmane.org>
 <8e41e2ae-bef4-d479-9706-49fd214081a6@chini.tk>
 <phdpkn$q3q$1@blaine.gmane.org> <pht30d$27m$1@blaine.gmane.org>
 <53d57478-4b61-65a4-7f09-b7e473cc613a@chini.tk>
 <305017ee-6420-3c44-7842-14776c37207d@gmail.com>
 <12fa0585-c993-0685-ac76-27d96d539ca2@gmail.com>
 <9a633975-704c-1a00-3f9f-b93a499947c2@gmail.com>
 <8bf4641f-4d3e-faf4-f53a-c571b97d9be4@gmail.com>
 <2bd00ced-f685-9048-5a10-a20028595086@gmail.com>
 <CABBYNZ+ZqS1LHVjLwt3mQvmFi1y7ogf_Tstvu70-XnDVT3nAAA@mail.gmail.com>
 <21f3b905-566c-00a0-e576-f47ae13019a6@gmail.com>
 <727b6dfa-b666-9cc3-1e5f-2715700d38f6@gmail.com>
 <cf2f6ebd-d8a0-a2ee-6935-564c27d3b884@gmail.com>
To:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
From:   Julian Sikorski <belegdol@gmail.com>
Message-ID: <34a556d7-d49e-6daa-a746-bdd57d8b2c51@gmail.com>
Date:   Mon, 21 Dec 2020 18:26:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <cf2f6ebd-d8a0-a2ee-6935-564c27d3b884@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

W dniu 02.11.2020 o 20:40, Julian Sikorski pisze:
> W dniu 05.09.2020 o 15:05, Julian Sikorski pisze:
>> W dniu 02.09.2020 o 07:58, Julian Sikorski pisze:
>>> W dniu 02.09.2020 o 01:14, Luiz Augusto von Dentz pisze:
>>>> Hi Julian,
>>>>
>>>> On Tue, Sep 1, 2020 at 1:42 PM Julian Sikorski 
>>>> <belegdol-Re5JQEeQqe8AvxtiuMwx3w-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org> 
>>>> wrote:
>>>>>
>>>>> W dniu 01.09.2020 o 22:10, Julian Sikorski pisze:
>>>>>> W dniu 12.08.2018 o 17:49, Julian Sikorski pisze:
>>>>>>> W dniu 01.08.2018 o 19:46, Julian Sikorski pisze:
>>>>>>>> W dniu 09.07.2018 o 18:51, Julian Sikorski pisze:
>>>>>>>>> W dniu 08.07.2018 o 19:46, Georg Chini pisze:
>>>>>>>>>> On 08.07.2018 15:21, Julian Sikorski wrote:
>>>>>>>>>>> W dniu 02.07.2018 o 20:09, Julian Sikorski pisze:
>>>>>>>>>>>> W dniu 02.07.2018 o 18:04, Georg Chini pisze:
>>>>>>>>>>>>> On 02.07.2018 17:58, Julian Sikorski wrote:
>>>>>>>>>>>>>> W dniu 29.06.2018 o 21:47, Julian Sikorski pisze:
>>>>>>>>>>>>>>> Hi list,
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> I have noticed that the bluetooth connection between my 
>>>>>>>>>>>>>>> laptop (Intel
>>>>>>>>>>>>>>> 7260) and my headphones (Sennheiser Momentum Wirelless) 
>>>>>>>>>>>>>>> is very
>>>>>>>>>>>>>>> unreliable. While under Windows 10 devices stay connected 
>>>>>>>>>>>>>>> for
>>>>>>>>>>>>>>> hours on
>>>>>>>>>>>>>>> end, under Fedora 28 the connection is lost every few 
>>>>>>>>>>>>>>> minutes at
>>>>>>>>>>>>>>> most.
>>>>>>>>>>>>>>> Often the connection will be reestablished only to be 
>>>>>>>>>>>>>>> lost again.
>>>>>>>>>>>>>>> bluetoothd shows messages like:
>>>>>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>>>>>> I am not sure where to look further. Does it look like an 
>>>>>>>>>>>>>>> issue with
>>>>>>>>>>>>>>> pulseaudio, or a deeper problem with linux bluetooth 
>>>>>>>>>>>>>>> stack? Thanks
>>>>>>>>>>>>>>> for
>>>>>>>>>>>>>>> your input in advance!
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Best regards,
>>>>>>>>>>>>>>> Julian
>>>>>>>>>>>>>> This is what is logged by pulseaudio at the time the 
>>>>>>>>>>>>>> connection is
>>>>>>>>>>>>>> lost:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> ( 118.064|  34.694) I: [bluetooth] module-bluez5-device.c: 
>>>>>>>>>>>>>> FD error:
>>>>>>>>>>>>>> POLLERR POLLHUP
>>>>>>>>>>>>>> ( 118.064|   0.000) I: [bluetooth] bluez5-util.c: Transport
>>>>>>>>>>>>>> /org/bluez/hci0/dev_00_1B_66_81_8D_76/fd27 auto-released 
>>>>>>>>>>>>>> by BlueZ or
>>>>>>>>>>>>>> already released
>>>>>>>>>>>>>> ( 118.064|   0.000) I: [pulseaudio] backend-native.c: Lost 
>>>>>>>>>>>>>> RFCOMM
>>>>>>>>>>>>>> connection.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>   From what you are writing, it looks to me as if the issue 
>>>>>>>>>>>>> is in the
>>>>>>>>>>>>> USB
>>>>>>>>>>>>> stack and the BT dongle keeps disconnecting/connecting. 
>>>>>>>>>>>>> Have you
>>>>>>>>>>>>> tried another dongle?
>>>>>>>>>>>> Hi,
>>>>>>>>>>>>
>>>>>>>>>>>> I unfortunately do not own any other dongles. I tried 
>>>>>>>>>>>> getting some
>>>>>>>>>>>> useful info with btmon but the log seems flooded with way 
>>>>>>>>>>>> too many
>>>>>>>>>>>> messages to make anything out.
>>>>>>>>>>>>
>>>>>>>>>>> Hi Georg,
>>>>>>>>>>>
>>>>>>>>>>> it looks like the problem is more related to how the dongle 
>>>>>>>>>>> interacts
>>>>>>>>>>> with this specific headphone model. I have recently bought 
>>>>>>>>>>> another one
>>>>>>>>>>> for running (AfterShokz Trekz Air) and it works perfectly, 
>>>>>>>>>>> connecting
>>>>>>>>>>> automatically, staying connected and even switching profiles
>>>>>>>>>>> automatically without issues so far.
>>>>>>>>>>> The hci0: last event is not cmd complete (0x0f) message seems 
>>>>>>>>>>> harmless
>>>>>>>>>>> as it spams the dmesg output regardless of the device 
>>>>>>>>>>> connected (and
>>>>>>>>>>> also when no device is connected at all.
>>>>>>>>>>> It appears that whatever is happening it makes the dongle 
>>>>>>>>>>> reconnect:
>>>>>>>>>>>
>>>>>>>>>>> [nie lip  8 15:14:12 2018] usb 2-1.4: USB disconnect, device 
>>>>>>>>>>> number 6
>>>>>>>>>>> [nie lip  8 15:14:12 2018] usb 2-1.4: new full-speed USB 
>>>>>>>>>>> device number 7
>>>>>>>>>>> using ehci-pci
>>>>>>>>>>> [nie lip  8 15:14:12 2018] usb 2-1.4: New USB device found,
>>>>>>>>>>> idVendor=8087, idProduct=07dc, bcdDevice= 0.01
>>>>>>>>>>> [nie lip  8 15:14:12 2018] usb 2-1.4: New USB device strings: 
>>>>>>>>>>> Mfr=0,
>>>>>>>>>>> Product=0, SerialNumber=0
>>>>>>>>>>> [nie lip  8 15:14:12 2018] Bluetooth: hci0: read Intel version:
>>>>>>>>>>> 3707100180012d0d2a
>>>>>>>>>>> [nie lip  8 15:14:12 2018] Bluetooth: hci0: Intel device is 
>>>>>>>>>>> already
>>>>>>>>>>> patched. patch num: 2a
>>>>>>>>>>>
>>>>>>>>>>> Where would you recommend to look for reasons for this 
>>>>>>>>>>> behaviour? btmon?
>>>>>>>>>>> Thank you for the pointers!
>>>>>>>>>>>
>>>>>>>>>>> Best regards,
>>>>>>>>>>> Julian
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>> Hi Julian,
>>>>>>>>>>
>>>>>>>>>> sorry, I have no further ideas. Maybe Luiz can help you to 
>>>>>>>>>> investigate.
>>>>>>>>>> To me it looks like the headphone is sending something that 
>>>>>>>>>> makes the
>>>>>>>>>> dongle reset.
>>>>>>>>>>
>>>>>>>>>> Regards
>>>>>>>>>>              Georg
>>>>>>>>>
>>>>>>>>> Hi Georg,
>>>>>>>>>
>>>>>>>>> no worries - hopefully Luiz will find some time to look into this.
>>>>>>>>> In the meantime I have been getting acquainted with btmon. I have
>>>>>>>>> managed to pinpoint the exact moment during which sound stops 
>>>>>>>>> coming
>>>>>>>>> through the headphones and starts coming through the laptop 
>>>>>>>>> speakers. In
>>>>>>>>> the below testcase, it happens at 18:42:58:
>>>>>>>>>
>>>>>>>>> < ACL Data TX: Handle 256 flags 0x02 dlen 850
>>>>>>>>>                                #1825 [hci0] 18:42:58.908586
>>>>>>>>>        Channel: 450 len 846 [PSM 25 mode 0] {chan 2}
>>>>>>>>> < ACL Data TX: Handle 256 flags 0x02 dlen 850
>>>>>>>>>                                #1826 [hci0] 18:42:58.928877
>>>>>>>>>        Channel: 450 len 846 [PSM 25 mode 0] {chan 2}
>>>>>>>>> @ MGMT Event: Class Of Device Changed (0x0007) plen 3
>>>>>>>>>                             {0x0002} [hci0] 18:43:00.653578
>>>>>>>>>          Class: 0x000000
>>>>>>>>>            Major class: Miscellaneous
>>>>>>>>>            Minor class: 0x00
>>>>>>>>> @ MGMT Event: Class Of Device Changed (0x0007) plen 3
>>>>>>>>>                             {0x0001} [hci0] 18:43:00.653578
>>>>>>>>>          Class: 0x000000
>>>>>>>>>            Major class: Miscellaneous
>>>>>>>>>            Minor class: 0x00
>>>>>>>>> @ MGMT Event: New Settings (0x0006) plen 4
>>>>>>>>>                             {0x0002} [hci0] 18:43:00.653609
>>>>>>>>>          Current settings: 0x00000ada
>>>>>>>>>            Connectable
>>>>>>>>>            Discoverable
>>>>>>>>>            Bondable
>>>>>>>>>            Secure Simple Pairing
>>>>>>>>>            BR/EDR
>>>>>>>>>            Low Energy
>>>>>>>>>            Secure Connections
>>>>>>>>> @ MGMT Event: New Settings (0x0006) plen 4
>>>>>>>>>                             {0x0001} [hci0] 18:43:00.653609
>>>>>>>>>          Current settings: 0x00000ada
>>>>>>>>>            Connectable
>>>>>>>>>            Discoverable
>>>>>>>>>            Bondable
>>>>>>>>>            Secure Simple Pairing
>>>>>>>>>            BR/EDR
>>>>>>>>>            Low Energy
>>>>>>>>>            Secure Connections
>>>>>>>>> = bluetoothd: Unable to get io data for Headset Voice gateway:
>>>>>>>>> getpeername: Transport endpoint is not connected.. 18:43:00.654133
>>>>>>>>> = Close Index: 7C:5C:F8:B2:DF:08
>>>>>>>>>                                      [hci0] 18:43:00.678348
>>>>>>>>> @ MGMT Event: Index Removed (0x0005) plen 0
>>>>>>>>>                             {0x0002} [hci0] 18:43:00.678372
>>>>>>>>> @ MGMT Event: Index Removed (0x0005) plen 0
>>>>>>>>>                             {0x0001} [hci0] 18:43:00.678372
>>>>>>>>> = Delete Index: 7C:5C:F8:B2:DF:08
>>>>>>>>>                                      [hci0] 18:43:00.678377
>>>>>>>>> = bluetoothd: Endpoint unregistered: sender=:1.1492
>>>>>>>>> path=/MediaEndpoint/A2DPSource
>>>>>>>>> 18:43:00.678966
>>>>>>>>> = bluetoothd: Endpoint unregistered: sender=:1.1492
>>>>>>>>> path=/MediaEndpoint/A2DPSink
>>>>>>>>> 18:43:00.678984
>>>>>>>>>
>>>>>>>>> I am copying linux-bluetooth, maybe someone there will have an 
>>>>>>>>> idea as
>>>>>>>>> well. Thank you for all your help in advance!
>>>>>>>>>
>>>>>>>>> Best regards,
>>>>>>>>> Julian
>>>>>>>>
>>>>>>>> Hi all,
>>>>>>>>
>>>>>>>> I tried to get more information using hcidump, but it does not 
>>>>>>>> appear
>>>>>>>> very interesting. I am attaching it here just in case. The last 
>>>>>>>> entry
>>>>>>>> appearing - command complete (read encryption key size) - 
>>>>>>>> appears upon
>>>>>>>> successful connection, not when the connection is dropped. How else
>>>>>>>> could I try to figure out what is being sent at the time of
>>>>>>>> disconnection? Thank you!
>>>>>>>>
>>>>>>>> Best regards,
>>>>>>>> Julian
>>>>>>>
>>>>>>> Hi list,
>>>>>>>
>>>>>>> I just realised I never attached the full btmon dump. Here it 
>>>>>>> goes, the
>>>>>>> connection drops at 17:32:04:
>>>>>>>
>>>>>>> < ACL Data TX: Handle 256 flags 0x02 dlen 850
>>>>>>>                                #1340 [hci0] 17:32:04.774611
>>>>>>>        Channel: 450 len 846 [PSM 25 mode 0] {chan 2}
>>>>>>>> HCI Event: Number of Completed Packets (0x13) plen 5
>>>>>>>                                #1341 [hci0] 17:32:04.783175
>>>>>>>          Num handles: 1
>>>>>>>          Handle: 256
>>>>>>>          Count: 1
>>>>>>> < ACL Data TX: Handle 256 flags 0x02 dlen 850
>>>>>>>                                #1342 [hci0] 17:32:04.794981
>>>>>>>        Channel: 450 len 846 [PSM 25 mode 0] {chan 2}
>>>>>>>> HCI Event: Number of Completed Packets (0x13) plen 5
>>>>>>>                                #1343 [hci0] 17:32:04.803054
>>>>>>>          Num handles: 1
>>>>>>>          Handle: 256
>>>>>>>          Count: 1
>>>>>>> < ACL Data TX: Handle 256 flags 0x02 dlen 850
>>>>>>>                                #1344 [hci0] 17:32:04.815326
>>>>>>>        Channel: 450 len 846 [PSM 25 mode 0] {chan 2}
>>>>>>>> HCI Event: Number of Completed Packets (0x13) plen 5
>>>>>>>                                #1345 [hci0] 17:32:04.823198
>>>>>>>          Num handles: 1
>>>>>>>          Handle: 256
>>>>>>>          Count: 1
>>>>>>> < ACL Data TX: Handle 256 flags 0x02 dlen 850
>>>>>>>                                #1346 [hci0] 17:32:04.835578
>>>>>>>        Channel: 450 len 846 [PSM 25 mode 0] {chan 2}
>>>>>>> < ACL Data TX: Handle 256 flags 0x02 dlen 850
>>>>>>>                                #1347 [hci0] 17:32:04.856093
>>>>>>>        Channel: 450 len 846 [PSM 25 mode 0] {chan 2}
>>>>>>> < ACL Data TX: Handle 256 flags 0x02 dlen 850
>>>>>>>                                #1348 [hci0] 17:32:04.876186
>>>>>>>        Channel: 450 len 846 [PSM 25 mode 0] {chan 2}
>>>>>>> < ACL Data TX: Handle 256 flags 0x02 dlen 850
>>>>>>>                                #1349 [hci0] 17:32:04.896454
>>>>>>>        Channel: 450 len 846 [PSM 25 mode 0] {chan 2}
>>>>>>> < ACL Data TX: Handle 256 flags 0x02 dlen 850
>>>>>>>                                #1350 [hci0] 17:32:04.916869
>>>>>>>        Channel: 450 len 846 [PSM 25 mode 0] {chan 2}
>>>>>>> @ MGMT Event: Class Of Device Changed (0x0007) plen 3
>>>>>>>                             {0x0002} [hci0] 17:32:06.637019
>>>>>>>          Class: 0x000000
>>>>>>>            Major class: Miscellaneous
>>>>>>>            Minor class: 0x00
>>>>>>> @ MGMT Event: Class Of Device Changed (0x0007) plen 3
>>>>>>>                             {0x0001} [hci0] 17:32:06.637019
>>>>>>>          Class: 0x000000
>>>>>>>            Major class: Miscellaneous
>>>>>>>            Minor class: 0x00
>>>>>>> @ MGMT Event: New Settings (0x0006) plen 4
>>>>>>>                             {0x0002} [hci0] 17:32:06.637034
>>>>>>>          Current settings: 0x00000ada
>>>>>>>            Connectable
>>>>>>>            Discoverable
>>>>>>>            Bondable
>>>>>>>            Secure Simple Pairing
>>>>>>>            BR/EDR
>>>>>>>            Low Energy
>>>>>>>            Secure Connections
>>>>>>> @ MGMT Event: New Settings (0x0006) plen 4
>>>>>>>                             {0x0001} [hci0] 17:32:06.637034
>>>>>>>          Current settings: 0x00000ada
>>>>>>>            Connectable
>>>>>>>            Discoverable
>>>>>>>            Bondable
>>>>>>>            Secure Simple Pairing
>>>>>>>            BR/EDR
>>>>>>>            Low Energy
>>>>>>>            Secure Connections
>>>>>>> = Close Index: 7C:5C:F8:B2:DF:08
>>>>>>>                                      [hci0] 17:32:06.654087
>>>>>>> @ MGMT Event: Index Removed (0x0005) plen 0
>>>>>>>                             {0x0002} [hci0] 17:32:06.654114
>>>>>>> @ MGMT Event: Index Removed (0x0005) plen 0
>>>>>>>                             {0x0001} [hci0] 17:32:06.654114
>>>>>>> = Delete Index: 7C:5C:F8:B2:DF:08
>>>>>>>                                      [hci0] 17:32:06.654120
>>>>>>> = bluetoothd: Unable to get io data for Headset Voice gateway:
>>>>>>> getpeername: Transport endpoint is not connected..   17:32:06.654352
>>>>>>> = bluetoothd: Endpoint unregistered: sender=:1.750
>>>>>>> path=/MediaEndpoint/A2DPSource
>>>>>>> 17:32:06.654796
>>>>>>> = bluetoothd: Endpoint unregistered: sender=:1.750
>>>>>>> path=/MediaEndpoint/A2DPSink
>>>>>>> 17:32:06.654836
>>>>>>>
>>>>>>> I tried sending the btmon capture as attachment but it appears to 
>>>>>>> be too
>>>>>>> large for the list, so I uploaded it here instead:
>>>>>>>
>>>>>>> https://belegdol.fedorapeople.org/btmon-aug.log
>>>>
>>>> Is this perhaps related to https://github.com/bluez/bluez/issues/18,
>>>> we have a fix already applied upstream for it.
>>>>
>>>
>>> Hi Luiz,
>>>
>>> it looks like a different issue. I tried both passing --noplugin=avrcp
>>> and applying the two patches mentioned in the github issue to Fedora
>>> RPM, neither helped. I am attaching a new btmon capture in case
>>> something changed. In this one the disconnect happens after #371.
>>>
>>> Best regards,
>>> Julian
>> Hi Luiz,
>>
>> I have now tested the same headset (Sennheiser Momentum Wireless aka 
>> M2 AEBT) with another machine, this time a desktop equipped with Intel 
>> 3168NGW dongle. With this machine everything appears to be working 
>> flawlessly, with no disconnection happening for several minutes. I 
>> have uploaded the btmon log to my dropbox as it is too large to attach 
>> here:
>> https://www.dropbox.com/s/ttetss50jqlvi35/m2-aebt-desktop.zip?dl=0
>> Hopefully there is something in the log indicating as to why the 
>> headset keeps disconnecting from the laptop. The laptop is equipped 
>> with Intel 7260 dongle.
>>
>> Best regards,
>> Julian
>>
>>
> The problem is still happening with kernel-5.8.17, bluez-5.55 and Fedora 
> 33. Latest log is attached, the disconnect happens after #1023.
> I tried deleting ~/.config/pulse as a hail mary attempt, but it did not 
> help either.
> 
> Best regards,
> Julian
> 
It is still broken with kernel-5.9.15. The strange thing is that every 
now and again if the stars align just right, the connection is stable. 
Is there a way of making btmon even more verbose so that I can see what 
is going on?
My wild guess is that the stability of the connection has something to 
do with which profile (A2DP or HSP) gets activated first. Can this be 
controlled somehow?

Best regards,
Julian
>>>>>>> Best regards,
>>>>>>> Julian
>>>>>>>
>>>>>>
>>>>>> Hi all,
>>>>>>
>>>>>> I have tried the headset again with kernel-5.8.4, bluez-5.54 and
>>>>>> pulseaudio-13.99.1. The situation has unfortunately not improved 
>>>>>> in the
>>>>>> last two years.
>>>>>> I am attaching the btmon capture of two connection attempts:
>>>>>> - the first connects and then almost immediately disconnects
>>>>>> - the second never succeeds
>>>>>> Does the capture provide any information as to why the connection is
>>>>>> failing? If I can provide any more data, please let me know. Thanks!
>>>>>>
>>>>>> Best regards,
>>>>>> Julian
>>>>>>
>>>>> If I am not mistaken, the disconnect happens right after #636
>>>>>
>>>>> Best regards,
>>>>> Julian
>>>>
>>>>
>>>>
>>>
>>
>>
> 

