Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 644E01A2B58
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Apr 2020 23:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbgDHVkI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 8 Apr 2020 17:40:08 -0400
Received: from 3.mo68.mail-out.ovh.net ([46.105.58.60]:46755 "EHLO
        3.mo68.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbgDHVkI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 8 Apr 2020 17:40:08 -0400
Received: from player157.ha.ovh.net (unknown [10.108.54.59])
        by mo68.mail-out.ovh.net (Postfix) with ESMTP id B4C261612CB
        for <linux-bluetooth@vger.kernel.org>; Wed,  8 Apr 2020 23:40:05 +0200 (CEST)
Received: from labapart.com (i577BCB3D.versanet.de [87.123.203.61])
        (Authenticated sender: olivier@labapart.com)
        by player157.ha.ovh.net (Postfix) with ESMTPSA id 4B2CD1141C8E4;
        Wed,  8 Apr 2020 21:40:04 +0000 (UTC)
Subject: Re: btvirt with two virtual controllers: Cannot connect to GATT
 server
From:   Olivier MARTIN <olivier@labapart.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
References: <6cf0d3da-a7d0-c820-3343-3f3722bae9a4@labapart.com>
 <638ce0f7-3075-c7d2-57c4-55392f8f5e0a@labapart.com>
 <CABBYNZKpLr6Bj4U7ryJe7512uuGPW7v84xb+8Z-BKAd_rHNURQ@mail.gmail.com>
 <f0a196cc-cf28-cd8b-d4a7-3d646e128db8@labapart.com>
Message-ID: <b1f9acc4-93f4-9624-70f1-2e1e1fdf427a@labapart.com>
Date:   Wed, 8 Apr 2020 23:40:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f0a196cc-cf28-cd8b-d4a7-3d646e128db8@labapart.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Ovh-Tracer-Id: 4950863365521370700
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudejgdduiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffhvfhfkffffgggjggtgfesthekredttdefjeenucfhrhhomhepqfhlihhvihgvrhcuofettffvkffpuceoohhlihhvihgvrheslhgrsggrphgrrhhtrdgtohhmqeenucfkpheptddrtddrtddrtddpkeejrdduvdefrddvtdefrdeiudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduheejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepohhlihhvihgvrheslhgrsggrphgrrhhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqsghluhgvthhoohhthhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

On 07.04.20 08:30, Olivier MARTIN wrote:
> Hi Luiz,
>
> On 07.04.20 02:26, Luiz Augusto von Dentz wrote:
>> Hi Olivier,
>>
>> On Mon, Apr 6, 2020 at 4:06 PM Olivier MARTIN <olivier@labapart.com> 
>> wrote:
>>> Hi all,
>>>
>>> I am trying to test BLE connection between two virtual controllers
>>> (created with 'btvirt'). But when trying to connect to the GATT server
>>> running on the first virtual controller, I have the error
>>> "src/device.c:att_connect_cb() connect error: Transport endpoint is not
>>> connected (107)"
>>>
>>>
>>> To test my test case, I am using the head of Bluez (2a7df9323e, Sunday
>>> 5th April).
>>>
>>> Here is the test case:
>>>
>>> 1. Start btvirt for BLE: sudo ./emulator/btvirt -L -U2 (you will 
>>> need my
>>> patch to fix command line parsing I sent a couple of minutes ago)
>>>
>>> 2. Start bluetoothctl to initialize the Virtual Controller that would
>>> play the role of GATT Server:
>>>
>>>      $ bluetoothctl
>>>      [NEW] Controller DB:E3:2A:E8:90:C4 olivier-ThinkPad-T480 #2 
>>> [default]
>>>      [NEW] Device E3:01:36:88:4C:DE TestAdvertisement
>>>      [NEW] Controller E3:01:36:88:4C:DE olivier-ThinkPad-T480
>>>      [NEW] Device DB:E3:2A:E8:90:C4 TestAdvertisement
>>>
>>>      [bluetooth]# list
>>>      Controller DB:E3:2A:E8:90:C4 olivier-ThinkPad-T480 #2 [default]
>>>      Controller E3:01:36:88:4C:DE olivier-ThinkPad-T480
>>>
>>>      [bluetooth]# power on
>>>      Changing power on succeeded
>>>      [CHG] Controller DB:E3:2A:E8:90:C4 Powered: yes
>>>
>>>      [bluetooth]# discoverable on
>>>      Changing discoverable on succeeded
>>>      [CHG] Controller DB:E3:2A:E8:90:C4 Discoverable: yes
>> Try with advertise.discoverable on, advertise instances actually have
>> their discoverable flag.
>
> I am not sure to understand how "advertise.discoverable on" will fix 
> my issue.
>
> I do not have any issue to discover the GATT server running on the 
> first instance of the virtual controller from the second one (see log 
> below).
>
> The only issue is when I try connecting to the GATT server with 
> 'connect DB:E3:2A:E8:90:C4', I have the error "Failed to connect: 
> org.bluez.Error.Failed" with the error in bluetoothd 
> "src/device.c:att_connect_cb() connect error: Transport endpoint is 
> not connected (107)".

I still wanted to make sure "advertise.discoverable on" would not solve 
my issue. I have just tested with the latest bluez (commit 60423fed392a) 
by adding "menu advertise" + "discoverable on" to the steps to duplicate 
the issue. And I still see the error:

bluetoothd[14755]: src/device.c:btd_device_set_temporary() temporary 0
bluetoothd[14755]: src/device.c:device_connect_le() Connection attempt 
to: DB:E3:2A:E8:90:C4
bluetoothd[14755]: src/device.c:att_connect_cb() connect error: 
Transport endpoint is not connected (107)


>
>>>      [bluetooth]# advertise on
>>>      [CHG] Controller DB:E3:2A:E8:90:C4 SupportedInstances: 0x04
>>>      [CHG] Controller DB:E3:2A:E8:90:C4 ActiveInstances: 0x01
>>>      Advertising object registered
>>>
>>>
>>> 3. Use './test/example-gatt-server' to simulate GATT server. I confirm
>>> the server is started on DB:E3:2A:E8:90:C4 (first virtual controller)
>>>
>>> 4. Return to bluetoothctl to switch to second virtual controller and
>>> connect to the first one
>>>
>>>      [bluetooth]# select E3:01:36:88:4C:DE
>>>      Controller E3:01:36:88:4C:DE olivier-ThinkPad-T480 [default]
>>>
>>>      [bluetooth]# power on
>>>      Changing power on succeeded
>>>      [CHG] Controller E3:01:36:88:4C:DE Powered: yes
>>>
>>>      [bluetooth]# scan on
>>>      Discovery started
>>>      [CHG] Controller E3:01:36:88:4C:DE Discovering: yes
>>>      [NEW] Device DB:E3:2A:E8:90:C4
>>>      [bluetooth]# scan off
>>>      Discovery stopped
>>>      [CHG] Controller E3:01:36:88:4C:DE Discovering: no
>>>
>>>      [bluetooth]# connect DB:E3:2A:E8:90:C4
>>>      Attempting to connect to DB:E3:2A:E8:90:C4
>>>      Failed to connect: org.bluez.Error.Failed
>>>      [CHG] Controller DB:E3:2A:E8:90:C4 Discoverable: no
>>>
>>>
>>> And in the bluetoothd log:
>>>
>>>      bluetoothd[15175]: src/adapter.c:start_discovery() sender :1.6483
>>>      bluetoothd[15175]: src/adapter.c:update_discovery_filter()
>>>      bluetoothd[15175]: src/adapter.c:discovery_filter_to_mgmt_cp()
>>>      bluetoothd[15175]: src/adapter.c:trigger_start_discovery()
>>>      bluetoothd[15175]: src/adapter.c:cancel_passive_scanning()
>>>      bluetoothd[15175]: src/adapter.c:start_discovery_timeout()
>>>      bluetoothd[15175]: src/adapter.c:start_discovery_timeout() 
>>> adapter->current_discovery_filter == 0
>>>      bluetoothd[15175]: src/adapter.c:start_discovery_complete() 
>>> status 0x00
>>>      bluetoothd[15175]: src/adapter.c:discovering_callback() hci0 
>>> type 6 discovering 1 method 0
>>>      bluetoothd[15175]: src/adapter.c:device_found_callback() hci0 
>>> addr DB:E3:2A:E8:90:C4, rssi 0 flags 0x0000 eir_len 3
>>>      bluetoothd[15175]: src/device.c:device_set_legacy() legacy 0
>>>      bluetoothd[15175]: src/device.c:device_set_flags() flags 6
>>>      bluetoothd[15175]: src/adapter.c:stop_discovery() sender :1.6483
>>>      bluetoothd[15175]: src/adapter.c:stop_discovery_complete() 
>>> status 0x00
>>>      bluetoothd[15175]: src/adapter.c:trigger_passive_scanning()
>>>      bluetoothd[15175]: src/adapter.c:discovery_remove() owner :1.6483
>>>      bluetoothd[15175]: src/adapter.c:discovering_callback() hci0 
>>> type 6 discovering 0 method 0
>>>      bluetoothd[15175]: src/device.c:device_connect_le() Connection 
>>> attempt to: DB:E3:2A:E8:90:C4
>>>      bluetoothd[15175]: src/device.c:att_connect_cb() connect error: 
>>> Transport endpoint is not connected (107)
>>>
>>
