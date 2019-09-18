Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8D30B68ED
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Sep 2019 19:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732183AbfIRRTg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 18 Sep 2019 13:19:36 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:33003 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732177AbfIRRTf (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 18 Sep 2019 13:19:35 -0400
Received: by mail-qk1-f196.google.com with SMTP id x134so286641qkb.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 18 Sep 2019 10:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TZ6zNmTN5K3wsuw0UnWMZDNmXyrZg+XulUxUtSzlTDQ=;
        b=ARUEYQc20VKVq0DC9iR4ZW+0ILmmp38aDfsgHOE6Je7RahPrHGv+1PsoTjZaYCGYHx
         HuK5+jLbDz/QruHJpkhdLZ2xPx123034b3vz53chKCSsjZKah3Cgo3DJDPz0dRmryALo
         7webVgnyiqJ1mCH0v1wKqCqToqpzY+EixxruU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TZ6zNmTN5K3wsuw0UnWMZDNmXyrZg+XulUxUtSzlTDQ=;
        b=Q56v1+gIHMBG1R4azbuqi+Oguv24dGLFCdZpMWN8s4AXjAE1HlMPtQ8J8kf9poy7iA
         9mwJ0jcxWBHSjN437kv/XTWwjtxDhl9c9IOgUtGMFENHjx1U9dywpF/euFLFKdl3SR2V
         IRMECSe0Oubk4fSS1bhjY4ulpdLIX1uLET/nElWrtmIakpeWfn/yt4dkjTtLSoik8p9s
         dVjdwlrjPJt3Sno5/vhwGWGwp4e7iGoDp6H+/c1wpr2Y6J9RMenP1No2iJ0gKoVEc/+c
         K37EZiLBR6ewBm002Yn8K5H5eYQBgQ+UHQFWwVQPEbaKbz4K7gUYeAzeTZhvfiqVqDAG
         xz5w==
X-Gm-Message-State: APjAAAVHx23XiyXABPSqFCGfsNOFIYkQiVnF5IioKHPx8jHKVNeX8C4h
        QHRn//cVoV9AIl10079VoefaxvxILSVUdLvq0vOq1w==
X-Google-Smtp-Source: APXvYqySXTHIUcstv5cPNi86ktBT04PmHseptOwBc0q27Fdkd1xYMUXPo9eFDDE5gpLKq/LzteJUa6hnXEf8sBpw5jw=
X-Received: by 2002:ae9:e817:: with SMTP id a23mr4977536qkg.294.1568827174941;
 Wed, 18 Sep 2019 10:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190917212702.35747-1-abhishekpandit@chromium.org> <Pine.LNX.4.44L0.1909181017300.1507-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1909181017300.1507-100000@iolanthe.rowland.org>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Wed, 18 Sep 2019 10:19:24 -0700
Message-ID: <CANFp7mX=THOVk-4TgSSscgtm598txqesDZYKE2sFtEVNHjN+-g@mail.gmail.com>
Subject: Re: [PATCH 0/2] Reset realtek bluetooth devices during user suspend
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-bluetooth@vger.kernel.org, linux-usb@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Hui Peng <benquike@gmail.com>, linux-pm@vger.kernel.org,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        Marcel Holtmann <marcel@holtmann.org>,
        Len Brown <len.brown@intel.com>,
        Mathias Payer <mathias.payer@nebelwelt.net>,
        Dmitry Torokhov <dtor@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mans Rullgard <mans@mansr.com>, Pavel Machek <pavel@ucw.cz>,
        YueHaibing <yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Sorry, last reply went out with HTML. Re-sending in plain text.

On Wed, Sep 18, 2019 at 7:23 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, 17 Sep 2019, Abhishek Pandit-Subedi wrote:
>
> > On a Realtek USB bluetooth device, I wanted a simple and consistent way
> > to put the device in reset during suspend (2 reasons: to save power and
> > disable BT as a wakeup source). Resetting it in the suspend callback
> > causes a detach and the resume callback is not called. Hence the changes
> > in this series to do the reset in suspend_noirq.
>
> What about people who _want_ BT to be a wakeup source?

When BT is enabled as a wakeup source, there is no reset.

> Why does putting the device in reset save power?  That is, a suspended
> device is very strictly limited in the amount of current it's allowed
> to draw from the USB bus; why should it draw significantly less when it
> is reset?

I don't know that it's significantly less (only that it's OFF). My
greater motivation is to make sure the bluetooth chip isn't
accumulating events while the host is turned off. Sorry, I should have
made that more clear in the cover letter.

When the host is off, it continues to accumulate events for the host
to process (packets from connected devices, LE advertisements, etc).
At some point, the firmware buffers fill up and no more events can be
stored. When the host is resumed later on, the firmware is in a bad
state and doesn't respond. I had originally just reset in ->resume but
then connected wireless devices wouldn't disconnect from the BT either
and I had trouble getting them to reconnect.

>
> > I looked into using PERSIST and reset on resume but those seem mainly
> > for misbehaving devices that reset themselves.
>
> They are, but that doesn't mean you can't use them for other things
> too.
>
> > This patch series has been tested with Realtek BT hardware as well as
> > Intel BT (test procedure = disable as wake source, user suspend and
> > observe a detach + reattach on resume).
>
> This series really seems like overkill for a single kind of device.
>
> Is there any way to turn off the device's BT radio during suspend (if
> wakeup is disabled) and then turn it back on during resume?  Wouldn't
> that accomplish what you want just as well?

Probably (but I couldn't find a way to do that). I want to prevent
bluetooth from waking up the host and to reliably be in a good state
when the host resumes. The reset logic I implemented causes the hci
device to disappear and reappear, which userspace seems to handle
gracefully.

> Alan Stern
>
