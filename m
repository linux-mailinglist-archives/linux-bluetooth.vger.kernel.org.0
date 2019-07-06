Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C43661043
	for <lists+linux-bluetooth@lfdr.de>; Sat,  6 Jul 2019 13:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfGFLGh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 6 Jul 2019 07:06:37 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:35620 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfGFLGh (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 6 Jul 2019 07:06:37 -0400
Received: from [192.168.0.113] (CMPC-089-239-107-172.CNet.Gawex.PL [89.239.107.172])
        by mail.holtmann.org (Postfix) with ESMTPSA id D2F22CEFAE;
        Sat,  6 Jul 2019 13:15:06 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] Bluetooth: Add new 13d3:3491 QCA_ROME device
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20190523203202.26957-1-jprvita@endlessm.com>
Date:   Sat, 6 Jul 2019 13:06:34 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@endlessm.com,
        =?utf-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <5AF5B2C3-7DE1-4AA0-B3E0-DC9EE8B03D43@holtmann.org>
References: <20190523203202.26957-1-jprvita@endlessm.com>
To:     =?utf-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Joao Paulo,

> Without the QCA ROME setup routine this adapter fails to establish a SCO
> connection.
> 
> T:  Bus=01 Lev=01 Prnt=01 Port=08 Cnt=01 Dev#=  2 Spd=12  MxCh= 0
> D:  Ver= 1.10 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=13d3 ProdID=3491 Rev=00.01
> C:  #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=100mA
> I:  If#=0x0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> I:  If#=0x1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> 
> Signed-off-by: João Paulo Rechi Vita <jprvita@endlessm.com>
> ---
> drivers/bluetooth/btusb.c | 1 +
> 1 file changed, 1 insertion(+)

Patch has been applied to bluetooth-next tree.

Regards

Marcel

