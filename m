Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA4525E86
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 May 2019 09:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbfEVHIE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 May 2019 03:08:04 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:55670 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727453AbfEVHIE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 May 2019 03:08:04 -0400
Received: from marcel-macpro.fritz.box (p5B3D2A37.dip0.t-ipconnect.de [91.61.42.55])
        by mail.holtmann.org (Postfix) with ESMTPSA id 0887ACF183;
        Wed, 22 May 2019 09:16:22 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] Revert "Bluetooth: Align minimum encryption key size for
 LE and BR/EDR connections"
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <6BD1D3F7-E2F2-4B2D-9479-06E27049133C@holtmann.org>
Date:   Wed, 22 May 2019 09:08:02 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <7B7F362B-6C8B-4112-8772-FB6BC708ABF5@holtmann.org>
References: <20190522052002.10411-1-anarsoul@gmail.com>
 <6BD1D3F7-E2F2-4B2D-9479-06E27049133C@holtmann.org>
To:     Vasily Khoruzhick <anarsoul@gmail.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Vasily,

>> This reverts commit d5bb334a8e171b262e48f378bd2096c0ea458265.
>> 
>> This commit breaks some HID devices, see [1] for details
>> 
>> https://bugzilla.kernel.org/show_bug.cgi?id=203643
>> 
>> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
>> Cc: stable@vger.kernel.org
> 
> let me have a look at this. Maybe there is a missing initialization for older HID devices that we need to handle. Do you happen to have the full btmon binary trace from controller initialization to connection attempt for me?
> 
> Are both devices Bluetooth 2.1 or later device that are supporting Secure Simple Pairing? Or is one of them a Bluetooth 2.0 or earlier device?

I am almost certain that you have a Bluetooth 2.0 mouse. I made a really stupid mistake in the key size check logic and forgot to bind it to SSP support. Can you please check the patch that I just send you.

https://lore.kernel.org/linux-bluetooth/20190522070540.48895-1-marcel@holtmann.org/T/#u

Regards

Marcel

