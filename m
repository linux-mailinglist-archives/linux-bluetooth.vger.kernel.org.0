Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B767714182
	for <lists+linux-bluetooth@lfdr.de>; Sun,  5 May 2019 19:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbfEERdM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 5 May 2019 13:33:12 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:43545 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbfEERdM (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 5 May 2019 13:33:12 -0400
Received: from marcel-macpro.fritz.box (p4FF9FD9B.dip0.t-ipconnect.de [79.249.253.155])
        by mail.holtmann.org (Postfix) with ESMTPSA id 6694ACEE02;
        Sun,  5 May 2019 19:41:24 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: [PATCH v5] Bluetooth: Ignore CC events not matching the last HCI
 command
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20190502020152.2099-1-jprvita@endlessm.com>
Date:   Sun, 5 May 2019 19:33:10 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>, bgodavar@codeaurora.org,
        ytkim@qca.qualcomm.com, "David S. Miller" <davem@davemloft.net>,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@endlessm.com,
        =?utf-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <830B6F2E-BEA4-4C99-85E8-0371F528261F@holtmann.org>
References: <A657D3D3-93D8-4F77-A143-72E921C552AE@holtmann.org>
 <20190502020152.2099-1-jprvita@endlessm.com>
To:     =?utf-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
X-Mailer: Apple Mail (2.3445.104.8)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Joao Paulo,

> This commit makes the kernel not send the next queued HCI command until
> a command complete arrives for the last HCI command sent to the
> controller. This change avoids a problem with some buggy controllers
> (seen on two SKUs of QCA9377) that send an extra command complete event
> for the previous command after the kernel had already sent a new HCI
> command to the controller.
> 
> The problem was reproduced when starting an active scanning procedure,
> where an extra command complete event arrives for the LE_SET_RANDOM_ADDR
> command. When this happends the kernel ends up not processing the
> command complete for the following commmand, LE_SET_SCAN_PARAM, and
> ultimately behaving as if a passive scanning procedure was being
> performed, when in fact controller is performing an active scanning
> procedure. This makes it impossible to discover BLE devices as no device
> found events are sent to userspace.
> 
> This problem is reproducible on 100% of the attempts on the affected
> controllers. The extra command complete event can be seen at timestamp
> 27.420131 on the btmon logs bellow.
> 
> Bluetooth monitor ver 5.50
> = Note: Linux version 5.0.0+ (x86_64)                                  0.352340
> = Note: Bluetooth subsystem version 2.22                               0.352343
> = New Index: 80:C5:F2:8F:87:84 (Primary,USB,hci0)               [hci0] 0.352344
> = Open Index: 80:C5:F2:8F:87:84                                 [hci0] 0.352345
> = Index Info: 80:C5:F2:8F:87:84 (Qualcomm)                      [hci0] 0.352346
> @ MGMT Open: bluetoothd (privileged) version 1.14             {0x0001} 0.352347
> @ MGMT Open: btmon (privileged) version 1.14                  {0x0002} 0.352366
> @ MGMT Open: btmgmt (privileged) version 1.14                {0x0003} 27.302164
> @ MGMT Command: Start Discovery (0x0023) plen 1       {0x0003} [hci0] 27.302310
>        Address type: 0x06
>          LE Public
>          LE Random
> < HCI Command: LE Set Random Address (0x08|0x0005) plen 6   #1 [hci0] 27.302496
>        Address: 15:60:F2:91:B2:24 (Non-Resolvable)
>> HCI Event: Command Complete (0x0e) plen 4                 #2 [hci0] 27.419117
>      LE Set Random Address (0x08|0x0005) ncmd 1
>        Status: Success (0x00)
> < HCI Command: LE Set Scan Parameters (0x08|0x000b) plen 7  #3 [hci0] 27.419244
>        Type: Active (0x01)
>        Interval: 11.250 msec (0x0012)
>        Window: 11.250 msec (0x0012)
>        Own address type: Random (0x01)
>        Filter policy: Accept all advertisement (0x00)
>> HCI Event: Command Complete (0x0e) plen 4                 #4 [hci0] 27.420131
>      LE Set Random Address (0x08|0x0005) ncmd 1
>        Status: Success (0x00)
> < HCI Command: LE Set Scan Enable (0x08|0x000c) plen 2      #5 [hci0] 27.420259
>        Scanning: Enabled (0x01)
>        Filter duplicates: Enabled (0x01)
>> HCI Event: Command Complete (0x0e) plen 4                 #6 [hci0] 27.420969
>      LE Set Scan Parameters (0x08|0x000b) ncmd 1
>        Status: Success (0x00)
>> HCI Event: Command Complete (0x0e) plen 4                 #7 [hci0] 27.421983
>      LE Set Scan Enable (0x08|0x000c) ncmd 1
>        Status: Success (0x00)
> @ MGMT Event: Command Complete (0x0001) plen 4        {0x0003} [hci0] 27.422059
>      Start Discovery (0x0023) plen 1
>        Status: Success (0x00)
>        Address type: 0x06
>          LE Public
>          LE Random
> @ MGMT Event: Discovering (0x0013) plen 2             {0x0003} [hci0] 27.422067
>        Address type: 0x06
>          LE Public
>          LE Random
>        Discovery: Enabled (0x01)
> @ MGMT Event: Discovering (0x0013) plen 2             {0x0002} [hci0] 27.422067
>        Address type: 0x06
>          LE Public
>          LE Random
>        Discovery: Enabled (0x01)
> @ MGMT Event: Discovering (0x0013) plen 2             {0x0001} [hci0] 27.422067
>        Address type: 0x06
>          LE Public
>          LE Random
>        Discovery: Enabled (0x01)
> 
> Signed-off-by: João Paulo Rechi Vita <jprvita@endlessm.com>
> ---
> include/net/bluetooth/hci.h |  1 +
> net/bluetooth/hci_core.c    |  5 +++++
> net/bluetooth/hci_event.c   | 12 ++++++++++++
> net/bluetooth/hci_request.c |  5 +++++
> net/bluetooth/hci_request.h |  1 +
> 5 files changed, 24 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

