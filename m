Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9356D4B2A3B
	for <lists+linux-bluetooth@lfdr.de>; Fri, 11 Feb 2022 17:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351465AbiBKQYi (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 11 Feb 2022 11:24:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351459AbiBKQYh (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 11 Feb 2022 11:24:37 -0500
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 62B283B3
        for <linux-bluetooth@vger.kernel.org>; Fri, 11 Feb 2022 08:24:34 -0800 (PST)
Received: from smtpclient.apple (p4fefcd07.dip0.t-ipconnect.de [79.239.205.7])
        by mail.holtmann.org (Postfix) with ESMTPSA id 285D2CECEB;
        Fri, 11 Feb 2022 17:24:34 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH] Bluetooth: btusb: add support for LG LGSBWAC02
 (MT7663BUN)
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20220211093103.18124-1-pepe2k@gmail.com>
Date:   Fri, 11 Feb 2022 17:24:33 +0100
Cc:     linux-bluetooth@vger.kernel.org,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Transfer-Encoding: 7bit
Message-Id: <6D0E36B3-5719-4411-8F90-5D204281546C@holtmann.org>
References: <20220211093103.18124-1-pepe2k@gmail.com>
To:     Piotr Dymacz <pepe2k@gmail.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Piotr,

> The LG LGSBWAC02 (FCC ID: BEJLGSBWAC02) is a combo Wi-Fi/BT module which
> can be found in several different LG TV models. This module is based on
> already supported MediaTek MT7663U series.
> 
> Device from /sys/kernel/debug/usb/devices:
> 
> T:  Bus=01 Lev=02 Prnt=02 Port=03 Cnt=02 Dev#=  4 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=043e ProdID=310c Rev= 1.00
> S:  Manufacturer=MediaTek Inc.
> S:  Product=Wireless_Device
> S:  SerialNumber=000000000
> C:* #Ifs= 3 Cfg#= 1 Atr=a0 MxPwr=100mA
> A:  FirstIf#= 0 IfCount= 2 Cls=e0(wlcon) Sub=01 Prot=01
> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=125us
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
> I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
> I:* If#= 2 Alt= 0 #EPs= 8 Cls=ff(vend.) Sub=ff Prot=ff Driver=mt7663u
> E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=08(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=06(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=07(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=09(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: Piotr Dymacz <pepe2k@gmail.com>
> ---
> drivers/bluetooth/btusb.c | 5 +++++
> 1 file changed, 5 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

