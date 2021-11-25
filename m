Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86F5345E2D9
	for <lists+linux-bluetooth@lfdr.de>; Thu, 25 Nov 2021 23:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344995AbhKYWEL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 25 Nov 2021 17:04:11 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:55397 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbhKYWCK (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 25 Nov 2021 17:02:10 -0500
Received: from smtpclient.apple (p5b3d2e91.dip0.t-ipconnect.de [91.61.46.145])
        by mail.holtmann.org (Postfix) with ESMTPSA id 57A7FCECC7;
        Thu, 25 Nov 2021 22:58:57 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH] Bluetooth: virtio_bt: fix device removal
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20211125161434-mutt-send-email-mst@kernel.org>
Date:   Thu, 25 Nov 2021 22:58:56 +0100
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        virtualization@lists.linux-foundation.org
Content-Transfer-Encoding: 8BIT
Message-Id: <2B9668C9-427B-4D8B-A393-AAB5E50763C5@holtmann.org>
References: <20211125174200.133230-1-mst@redhat.com>
 <F52F65FE-6A07-486B-8E84-684ED85709E9@holtmann.org>
 <20211125154314-mutt-send-email-mst@kernel.org>
 <C8D84EA4-E9A8-44CC-918F-57640A05C81D@holtmann.org>
 <20211125161434-mutt-send-email-mst@kernel.org>
To:     "Michael S. Tsirkin" <mst@redhat.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Michael,

>>>>> Device removal is clearly out of virtio spec: it attempts to remove
>>>>> unused buffers from a VQ before invoking device reset. To fix, make
>>>>> open/close NOPs and do all cleanup/setup in probe/remove.
>>>> 
>>>> so the virtbt_{open,close} as NOP is not really what a driver is suppose
>>>> to be doing. These are transport enable/disable callbacks from the BT
>>>> Core towards the driver. It maps to a device being enabled/disabled by
>>>> something like bluetoothd for example. So if disabled, I expect that no
>>>> resources/queues are in use.
>>>> 
>>>> Maybe I misunderstand the virtio spec in that regard, but I would like
>>>> to keep this fundamental concept of a Bluetooth driver. It does work
>>>> with all other transports like USB, SDIO, UART etc.
>>>> 
>>>>> The cost here is a single skb wasted on an unused bt device - which
>>>>> seems modest.
>>>> 
>>>> There should be no buffer used if the device is powered off. We also don’t
>>>> have any USB URBs in-flight if the transport is not active.
>>>> 
>>>>> NB: with this fix in place driver still suffers from a race condition if
>>>>> an interrupt triggers while device is being reset. Work on a fix for
>>>>> that issue is in progress.
>>>> 
>>>> In the virtbt_close() callback we should deactivate all interrupts.
>>>> 
>>> 
>>> If you want to do that then device has to be reset on close,
>>> and fully reinitialized on open.
>>> Can you work on a patch like that?
>>> Given I don't have the device such a rework is probably more
>>> than I can undertake.
>> 
>> so you mean move virtio_find_vqs() into virtbt_open() and del_vqs() into
>> virtbt_close()?
> 
> And reset before del_vqs.
> 
>> Or is there are way to set up the queues without starting them?
>> 
>> However I am failing to understand your initial concern, we do reset()
>> before del_vqs() in virtbt_remove(). Should we be doing something different
>> in virtbt_close() other than virtqueue_detach_unused_buf(). Why would I
>> keep buffers attached if they are not used.
>> 
> 
> They are not used at that point but until device is reset can use them.
> Also, if you then proceed to open without a reset, and kick,
> device will start by processing the original buffers, crashing
> or corrupting memory.

so the only valid usage is like this:

	vdev->config->reset(vdev);

	while ((.. = virtqueue_detach_unused_buf(vq))) {
	}

	vdev->config->del_vqs(vdev);

If I make virtbt_{open,close} a NOP, then I keep adding an extra SKB to inbuf on
every power cycle (ifup/ifdown). How does netdev handle this?

Regards

Marcel

