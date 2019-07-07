Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD046610DF
	for <lists+linux-bluetooth@lfdr.de>; Sat,  6 Jul 2019 15:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfGFNpF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 6 Jul 2019 09:45:05 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:41061 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfGFNpF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 6 Jul 2019 09:45:05 -0400
Received: from [192.168.0.171] (188.146.228.97.nat.umts.dynamic.t-mobile.pl [188.146.228.97])
        by mail.holtmann.org (Postfix) with ESMTPSA id D02BBCF12E;
        Sat,  6 Jul 2019 15:53:35 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: HCI Set custom bandwidth for AuriStream SCO codec
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20190607130245.mv4ch6dxnuptzdki@pali>
Date:   Sat, 6 Jul 2019 15:45:03 +0200
Cc:     Pavel Machek <pavel@ucw.cz>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <ED456CCA-CF85-48D9-B7E9-9B0BF02A32FC@holtmann.org>
References: <20190504171550.llqfv5674gxd3bnn@pali>
 <20190506151651.pu2us2fgsf7w2vos@pali> <20190516183429.ql3hxtnmiabcq7tj@pali>
 <CABBYNZLJB0bK7o=Tvf9mhb5U41xAin6SdPY9=76AuEvpEiA_8g@mail.gmail.com>
 <20190519082305.q7y4gpmdhvx3vzvo@pali>
 <CABBYNZJKO07p-8ufP7=4WUYS1oLhnsKY_pnP6-0SbVzi=CYZsQ@mail.gmail.com>
 <20190519212157.GB31403@amd> <20190607130245.mv4ch6dxnuptzdki@pali>
To:     =?utf-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Pali,

>>>>> to be honest, I would rather see WBS implementation finally
>>>>> reach PA before we start digging into this.
>>>> 
>>>> First I want to finish improving A2DP codec support in pulseaudio. Later
>>>> I can look at HSP/HFP profiles. Ideally it should have modular/plugin
>>>> extensible design. So the aim is that adding new codec would be very
>>>> simple, without need to hack something related to mSBC/WBC, AuriStream
>>>> or any other codec.
>>> 
>>> Well HSP don't have support for codec negotiation, but yes a modular
>>> design is probably recommended.
>>> 
>>>> But for AuriStream I need to set custom SCO parameters as described
>>>> below and currently kernel does not support it. This is why I'm asking
>>>> how kernel can export for userspace configuration of SCO parameters...
>>> 
>>> We can always come up with socket options but we got to see the value
>>> it would bring since AuriStream don't look that popular among
>>> headsets, at least Ive never seem any device advertising it like
>>> apt-X, etc.
>> 
>> Pali clearly has such device and he is willing to work on it. Surely
>> that means it is popular enough to be supported...?
> 
> Just put AT+CSRSF=0,0,0,0,0,7 to google search and you would see that
> not only I have such device...
> 
> So I would really would like to see that kernel finally stops blocking
> usage of this AuriStream codec.

we need to figure out on how we do the kernel API to allow you this specific setting. We have kept is really simple since there was only CVSD and mSBC as of now. I am also curious on what the assumptions are for the USB driver alternate settings are when using a different codec.

Regards

Marcel

