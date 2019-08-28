Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5582FA09D4
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Aug 2019 20:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbfH1SnU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 28 Aug 2019 14:43:20 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:52686 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbfH1SnT (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 28 Aug 2019 14:43:19 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <dan.streetman@canonical.com>)
        id 1i32ub-0003Xe-6G
        for linux-bluetooth@vger.kernel.org; Wed, 28 Aug 2019 18:43:17 +0000
Received: by mail-io1-f70.google.com with SMTP id h7so758941ioj.5
        for <linux-bluetooth@vger.kernel.org>; Wed, 28 Aug 2019 11:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xo4NJ4KDDgALFX7Tqoxor2uGZPbldp8kTAdetgMQVtA=;
        b=sknjb5W/I/ycKsOFyR4DwAW868iGdD2VGx83ovbALuyO+/aFagP3WOA1pSU2D9U6Rg
         vShmIge/pcaDuv/gzZZoykZZl2qVt2p/SNG+PFW7uQCH6yvRNfe6zekDAccEUV0LVsbI
         udzfX+PMVfpCgs4SsekzW0CfsoYctXhhd0n8qVmz2xpS3+fAds0c0f+u2qCShbty+JWj
         otPcnXVor3R3VzauRbK3oUGmT/Hn/uJJEkaBWrfwOMTTmfM9y89Ds+OzhpYlAmW8092+
         bcGUf/K+FB21Zm4foXsQaye+p17xdkNJbDLIyP7MMNcl8bIHB6zd+DFlB5QXlrLXmUcU
         vvyw==
X-Gm-Message-State: APjAAAUILNt7LSLWEDOljIR4Fo3DrxJiYty0dFXR17AAbfsxKUV+t3d3
        OAZDfQaACwK0aoCwsQjWyEpCR3QXdTq/ApmqiWEY9P63mB7a+BUpGOg64uFY42qNIXMTi52+7kL
        tVHbaYyIBtQaHu1HcKb+GzKajNK164Z5y7vOKIIiFIXxWyMNMEm5SHLv1vytTTg==
X-Received: by 2002:a5e:a80f:: with SMTP id c15mr2725646ioa.270.1567017796180;
        Wed, 28 Aug 2019 11:43:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMujKUJUD7JXYB1erKP8udJALPFmCxjApwznrkp0elZ7PfnmIZUeX3Sjz0w46mowoOarXhx9KFcf8h6NdqDac=
X-Received: by 2002:a5e:a80f:: with SMTP id c15mr2725605ioa.270.1567017795889;
 Wed, 28 Aug 2019 11:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAOZ2QJOZStRYa=5fyod_AEJcJQw90_yX40dPYY3Dhvfso1e=RA@mail.gmail.com>
 <20190828175051.GK7482@intel.com> <20190828175913.GL7482@intel.com>
In-Reply-To: <20190828175913.GL7482@intel.com>
From:   Dan Streetman <dan.streetman@canonical.com>
Date:   Wed, 28 Aug 2019 14:42:39 -0400
Message-ID: <CAOZ2QJP-P1jfpNXL4nsRB802a+j-Hxc-suQa1e-=ypvto_MtXw@mail.gmail.com>
Subject: Re: Follow up on hid2hci: Fix udev rules for linux-4.14+
To:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Brian Gix <brian.gix@intel.com>,
        Bastien Nocera <hadess@hadess.net>,
        Steve Brown <sbrown@ewol.com>
Cc:     linux-bluetooth@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Kay Sievers <kay.sievers@vrfy.org>,
        systemd-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Zbigniew_J=C4=99drzejewski=2DSzmek?= <zbyszek@in.waw.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wed, Aug 28, 2019 at 1:59 PM Ville Syrjälä
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Aug 28, 2019 at 08:50:51PM +0300, Ville Syrjälä wrote:
> > On Wed, Aug 28, 2019 at 01:34:07PM -0400, Dan Streetman wrote:
> > > It looks like this patch got lost at some point:
> > > https://lore.kernel.org/patchwork/patch/902126/#1138115
> > >
> > > but it seems to still be a problem and I'd like to pull it into Ubuntu:
> > > https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/1759836
> > >
> > > Ville, did you ever follow up with a v2 for that patch and/or do you
> > > know if it will be accepted soon?
> >
> > There's a more recent version of that somewhere on the mailing list.
> > The problem is getting someone to actually apply it. Seems much harder
> > than it should be...
>
> https://lore.kernel.org/patchwork/patch/1021109/

I added to this reply a few of the most recent commit authors to the
bluez tools/ subdir...can any of you review and/or apply Ville's
patch?

Marcel, you appear to have created the hid2hci.rules file back in
2012, can you comment on the patch?

>
> >
> > And IIRC I also posted a few other fixes for hid2hci tool which didn't
> > get any response from the crowd.
>
> https://www.spinics.net/lists/linux-bluetooth/msg79803.html
>
> --
> Ville Syrjälä
> Intel
