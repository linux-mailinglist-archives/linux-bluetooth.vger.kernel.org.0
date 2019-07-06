Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FCC8610C9
	for <lists+linux-bluetooth@lfdr.de>; Sat,  6 Jul 2019 15:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbfGFNYD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 6 Jul 2019 09:24:03 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:40563 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfGFNYD (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 6 Jul 2019 09:24:03 -0400
Received: from [192.168.0.171] (188.146.228.97.nat.umts.dynamic.t-mobile.pl [188.146.228.97])
        by mail.holtmann.org (Postfix) with ESMTPSA id 7799BCF12E;
        Sat,  6 Jul 2019 15:32:33 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] Bluetooth: Check state in l2cap_disconnect_rsp
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20190521100722.GA15063@makarhum-Latitude-E5440>
Date:   Sat, 6 Jul 2019 15:24:00 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <BA19D8C4-BE85-48AB-B5F4-3DE003C65320@holtmann.org>
References: <20190521100722.GA15063@makarhum-Latitude-E5440>
To:     Matias Karhumaa <matias.karhumaa@gmail.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Matias,

> Because of both sides doing L2CAP disconnection at the same time, it
> was possible to receive L2CAP Disconnection Response with CID that was
> already freed. That caused problems if CID was already reused and L2CAP
> Connection Request with same CID was sent out. Before this patch kernel
> deleted channel context regardless of the state of the channel.
> 
> Example where leftover Disconnection Response (frame #402) causes local
> device to delete L2CAP channel which was not yet connected. This in
> turn confuses remote device's stack because same CID is re-used without
> properly disconnecting.
> 
> Btmon capture before patch:
> ** snip **
>> ACL Data RX: Handle 43 flags 0x02 dlen 8                #394 [hci1] 10.748949
>      Channel: 65 len 4 [PSM 3 mode 0] {chan 2}
>      RFCOMM: Disconnect (DISC) (0x43)
>         Address: 0x03 cr 1 dlci 0x00
>         Control: 0x53 poll/final 1
>         Length: 0
>         FCS: 0xfd
> < ACL Data TX: Handle 43 flags 0x00 dlen 8                #395 [hci1] 10.749062
>      Channel: 65 len 4 [PSM 3 mode 0] {chan 2}
>      RFCOMM: Unnumbered Ack (UA) (0x63)
>         Address: 0x03 cr 1 dlci 0x00
>         Control: 0x73 poll/final 1
>         Length: 0
>         FCS: 0xd7
> < ACL Data TX: Handle 43 flags 0x00 dlen 12               #396 [hci1] 10.749073
>      L2CAP: Disconnection Request (0x06) ident 17 len 4
>        Destination CID: 65
>        Source CID: 65
>> HCI Event: Number of Completed Packets (0x13) plen 5    #397 [hci1] 10.752391
>        Num handles: 1
>        Handle: 43
>        Count: 1
>> HCI Event: Number of Completed Packets (0x13) plen 5    #398 [hci1] 10.753394
>        Num handles: 1
>        Handle: 43
>        Count: 1
>> ACL Data RX: Handle 43 flags 0x02 dlen 12               #399 [hci1] 10.756499
>      L2CAP: Disconnection Request (0x06) ident 26 len 4
>        Destination CID: 65
>        Source CID: 65
> < ACL Data TX: Handle 43 flags 0x00 dlen 12               #400 [hci1] 10.756548
>      L2CAP: Disconnection Response (0x07) ident 26 len 4
>        Destination CID: 65
>        Source CID: 65
> < ACL Data TX: Handle 43 flags 0x00 dlen 12               #401 [hci1] 10.757459
>      L2CAP: Connection Request (0x02) ident 18 len 4
>        PSM: 1 (0x0001)
>        Source CID: 65
>> ACL Data RX: Handle 43 flags 0x02 dlen 12               #402 [hci1] 10.759148
>      L2CAP: Disconnection Response (0x07) ident 17 len 4
>        Destination CID: 65
>        Source CID: 65
> = bluetoothd: 00:1E:AB:4C:56:54: error updating services: Input/o..   10.759447
>> HCI Event: Number of Completed Packets (0x13) plen 5    #403 [hci1] 10.759386
>        Num handles: 1
>        Handle: 43
>        Count: 1
>> ACL Data RX: Handle 43 flags 0x02 dlen 12               #404 [hci1] 10.760397
>      L2CAP: Connection Request (0x02) ident 27 len 4
>        PSM: 3 (0x0003)
>        Source CID: 65
> < ACL Data TX: Handle 43 flags 0x00 dlen 16               #405 [hci1] 10.760441
>      L2CAP: Connection Response (0x03) ident 27 len 8
>        Destination CID: 65
>        Source CID: 65
>        Result: Connection successful (0x0000)
>        Status: No further information available (0x0000)
> < ACL Data TX: Handle 43 flags 0x00 dlen 27               #406 [hci1] 10.760449
>      L2CAP: Configure Request (0x04) ident 19 len 19
>        Destination CID: 65
>        Flags: 0x0000
>        Option: Maximum Transmission Unit (0x01) [mandatory]
>          MTU: 1013
>        Option: Retransmission and Flow Control (0x04) [mandatory]
>          Mode: Basic (0x00)
>          TX window size: 0
>          Max transmit: 0
>          Retransmission timeout: 0
>          Monitor timeout: 0
>          Maximum PDU size: 0
>> HCI Event: Number of Completed Packets (0x13) plen 5    #407 [hci1] 10.761399
>        Num handles: 1
>        Handle: 43
>        Count: 1
>> ACL Data RX: Handle 43 flags 0x02 dlen 16               #408 [hci1] 10.762942
>      L2CAP: Connection Response (0x03) ident 18 len 8
>        Destination CID: 66
>        Source CID: 65
>        Result: Connection successful (0x0000)
>        Status: No further information available (0x0000)
> *snip*
> 
> Similar case after the patch:
> *snip*
>> ACL Data RX: Handle 43 flags 0x02 dlen 8            #22702 [hci0] 1664.411056
>      Channel: 65 len 4 [PSM 3 mode 0] {chan 3}
>      RFCOMM: Disconnect (DISC) (0x43)
>         Address: 0x03 cr 1 dlci 0x00
>         Control: 0x53 poll/final 1
>         Length: 0
>         FCS: 0xfd
> < ACL Data TX: Handle 43 flags 0x00 dlen 8            #22703 [hci0] 1664.411136
>      Channel: 65 len 4 [PSM 3 mode 0] {chan 3}
>      RFCOMM: Unnumbered Ack (UA) (0x63)
>         Address: 0x03 cr 1 dlci 0x00
>         Control: 0x73 poll/final 1
>         Length: 0
>         FCS: 0xd7
> < ACL Data TX: Handle 43 flags 0x00 dlen 12           #22704 [hci0] 1664.411143
>      L2CAP: Disconnection Request (0x06) ident 11 len 4
>        Destination CID: 65
>        Source CID: 65
>> HCI Event: Number of Completed Pac.. (0x13) plen 5  #22705 [hci0] 1664.414009
>        Num handles: 1
>        Handle: 43
>        Count: 1
>> HCI Event: Number of Completed Pac.. (0x13) plen 5  #22706 [hci0] 1664.415007
>        Num handles: 1
>        Handle: 43
>        Count: 1
>> ACL Data RX: Handle 43 flags 0x02 dlen 12           #22707 [hci0] 1664.418674
>      L2CAP: Disconnection Request (0x06) ident 17 len 4
>        Destination CID: 65
>        Source CID: 65
> < ACL Data TX: Handle 43 flags 0x00 dlen 12           #22708 [hci0] 1664.418762
>      L2CAP: Disconnection Response (0x07) ident 17 len 4
>        Destination CID: 65
>        Source CID: 65
> < ACL Data TX: Handle 43 flags 0x00 dlen 12           #22709 [hci0] 1664.421073
>      L2CAP: Connection Request (0x02) ident 12 len 4
>        PSM: 1 (0x0001)
>        Source CID: 65
>> ACL Data RX: Handle 43 flags 0x02 dlen 12           #22710 [hci0] 1664.421371
>      L2CAP: Disconnection Response (0x07) ident 11 len 4
>        Destination CID: 65
>        Source CID: 65
>> HCI Event: Number of Completed Pac.. (0x13) plen 5  #22711 [hci0] 1664.424082
>        Num handles: 1
>        Handle: 43
>        Count: 1
>> HCI Event: Number of Completed Pac.. (0x13) plen 5  #22712 [hci0] 1664.425040
>        Num handles: 1
>        Handle: 43
>        Count: 1
>> ACL Data RX: Handle 43 flags 0x02 dlen 12           #22713 [hci0] 1664.426103
>      L2CAP: Connection Request (0x02) ident 18 len 4
>        PSM: 3 (0x0003)
>        Source CID: 65
> < ACL Data TX: Handle 43 flags 0x00 dlen 16           #22714 [hci0] 1664.426186
>      L2CAP: Connection Response (0x03) ident 18 len 8
>        Destination CID: 66
>        Source CID: 65
>        Result: Connection successful (0x0000)
>        Status: No further information available (0x0000)
> < ACL Data TX: Handle 43 flags 0x00 dlen 27           #22715 [hci0] 1664.426196
>      L2CAP: Configure Request (0x04) ident 13 len 19
>        Destination CID: 65
>        Flags: 0x0000
>        Option: Maximum Transmission Unit (0x01) [mandatory]
>          MTU: 1013
>        Option: Retransmission and Flow Control (0x04) [mandatory]
>          Mode: Basic (0x00)
>          TX window size: 0
>          Max transmit: 0
>          Retransmission timeout: 0
>          Monitor timeout: 0
>          Maximum PDU size: 0
>> ACL Data RX: Handle 43 flags 0x02 dlen 16           #22716 [hci0] 1664.428804
>      L2CAP: Connection Response (0x03) ident 12 len 8
>        Destination CID: 66
>        Source CID: 65
>        Result: Connection successful (0x0000)
>        Status: No further information available (0x0000)
> *snip*
> 
> Fix is to check that channel is in state BT_DISCONN before deleting the
> channel.
> 
> This bug was found while fuzzing Bluez's OBEX implementation using
> Synopsys Defensics.
> 
> Reported-by: Matti Kamunen <matti.kamunen@synopsys.com>
> Reported-by: Ari Timonen <ari.timonen@synopsys.com>
> Signed-off-by: Matias Karhumaa <matias.karhumaa@gmail.com>
> ---
> net/bluetooth/l2cap_core.c | 6 ++++++
> 1 file changed, 6 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

