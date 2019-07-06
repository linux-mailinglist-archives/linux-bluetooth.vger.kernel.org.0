Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49BFF610E5
	for <lists+linux-bluetooth@lfdr.de>; Sat,  6 Jul 2019 15:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfGFN6G (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 6 Jul 2019 09:58:06 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:47969 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbfGFN6F (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 6 Jul 2019 09:58:05 -0400
Received: from [192.168.0.171] (188.146.228.97.nat.umts.dynamic.t-mobile.pl [188.146.228.97])
        by mail.holtmann.org (Postfix) with ESMTPSA id 1B1FCCF12E;
        Sat,  6 Jul 2019 16:06:36 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] Bluetooth: SMP: Workaround Microsoft Surface Precision
 Mouse bug
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20190618224747.446-1-szymon.janc@codecoup.pl>
Date:   Sat, 6 Jul 2019 15:58:03 +0200
Cc:     linux-bluetooth@vger.kernel.org,
        Maarten Fonville <maarten.fonville@gmail.com>,
        stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <47663D4D-8800-4A7A-87A6-4708651C40EC@holtmann.org>
References: <20190618224747.446-1-szymon.janc@codecoup.pl>
To:     Szymon Janc <szymon.janc@codecoup.pl>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Szymon,

> Microsoft Surface Precision Mouse provides bogus identity address when
> pairing. It connects with Static Random address but provides Public
> Address in SMP Identity Address Information PDU. Address has same
> value but type is different. Workaround this by dropping IRK if ID
> address discrepancy is detected.
> 
>> HCI Event: LE Meta Event (0x3e) plen 19
>      LE Connection Complete (0x01)
>        Status: Success (0x00)
>        Handle: 75
>        Role: Master (0x00)
>        Peer address type: Random (0x01)
>        Peer address: E0:52:33:93:3B:21 (Static)
>        Connection interval: 50.00 msec (0x0028)
>        Connection latency: 0 (0x0000)
>        Supervision timeout: 420 msec (0x002a)
>        Master clock accuracy: 0x00
> 
> ....
> 
>> ACL Data RX: Handle 75 flags 0x02 dlen 12
>      SMP: Identity Address Information (0x09) len 7
>        Address type: Public (0x00)
>        Address: E0:52:33:93:3B:21
> 
> Signed-off-by: Szymon Janc <szymon.janc@codecoup.pl>
> Tested-by: Maarten Fonville <maarten.fonville@gmail.com>
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=199461
> Cc: stable@vger.kernel.org
> ---
> net/bluetooth/smp.c | 14 ++++++++++++++
> 1 file changed, 14 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

