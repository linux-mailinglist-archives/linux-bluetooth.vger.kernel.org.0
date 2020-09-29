Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C362027DA47
	for <lists+linux-bluetooth@lfdr.de>; Tue, 29 Sep 2020 23:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728195AbgI2Vkc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 29 Sep 2020 17:40:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:58150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727958AbgI2Vkc (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 29 Sep 2020 17:40:32 -0400
Received: from pali.im (pali.im [31.31.79.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D01B2076A
        for <linux-bluetooth@vger.kernel.org>; Tue, 29 Sep 2020 21:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601415262;
        bh=YxrRfK9Bu9DaJ3+ROAFOgwtQ7uB5WjoeyzWI9wvmpOQ=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=VJGr4Wc6wxostVU3XWMWgsh9w3nzj1m5ZAIQ9F22akYrQg5r0Y0MXeych6YdirOEa
         8ahWNoSYpWKzhGTugs83aBMVkUJ9A4rJCWFiZ3iVqshX2YBUCKntm0fpGsJB6p8axZ
         RZrxJFekvagWDVArznz79M9cbN4JxkSIiqVhT6mw=
Received: by pali.im (Postfix)
        id 6B239AA6; Tue, 29 Sep 2020 23:34:20 +0200 (CEST)
Date:   Tue, 29 Sep 2020 23:34:20 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH] tools/hcidump: Decode FastStream, aptX Low Latency, aptX
 HD and LDAC
Message-ID: <20200929213420.zznc4a3yj65kgzq5@pali>
References: <20190206114300.rxw3ptq7hzathzqe@pali>
 <20190224131907.GV32745@reaktio.net>
 <20190305122630.gwnaz3y7ckzqfjfq@pali>
 <20190410082924.exo2oihzd7w2oz3e@pali>
 <20190607130739.j25oqqj624anmcqr@pali>
 <20191014110746.n3pmoigtf3ewbmrq@pali>
 <20200209130532.4evozfyutikzwn4a@pali>
 <20200414230015.5ndqz5k5kx5vakj4@pali>
 <20200503111449.k6ugzpaitbv5mggs@pali>
 <20200808132458.2ia4xxfjd5x4d6ds@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200808132458.2ia4xxfjd5x4d6ds@pali>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Saturday 08 August 2020 15:24:58 Pali Rohár wrote:
> On Sunday 03 May 2020 13:14:49 Pali Rohár wrote:
> > On Wednesday 15 April 2020 01:00:15 Pali Rohár wrote:
> > > On Sunday 09 February 2020 14:05:32 Pali Rohár wrote:
> > > > On Monday 14 October 2019 13:07:46 Pali Rohár wrote:
> > > > > On Friday 07 June 2019 15:07:39 Pali Rohár wrote:
> > > > > > On Wednesday 10 April 2019 10:29:24 Pali Rohár wrote:
> > > > > > > On Tuesday 05 March 2019 13:26:30 Pali Rohár wrote:
> > > > > > > > On Sunday 24 February 2019 15:19:07 Pasi Kärkkäinen wrote:
> > > > > > > > > On Wed, Feb 06, 2019 at 12:43:00PM +0100, Pali Rohár wrote:
> > > > > > > > > > On Friday 01 February 2019 14:43:53 Pasi Kärkkäinen wrote:
> > > > > > > > > > > Hi,
> > > > > > > > > > > 
> > > > > > > > > > > On Wed, Jan 30, 2019 at 02:24:11PM +0200, Luiz Augusto von Dentz wrote:
> > > > > > > > > > > > Hi Pali, Pasi,
> > > > > > > > > > > > On Wed, Jan 30, 2019 at 2:09 PM Pali Rohár <pali.rohar@gmail.com> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Wednesday 30 January 2019 10:15:17 Pasi Kärkkäinen wrote:
> > > > > > > > > > > > > > On Wed, Jan 23, 2019 at 06:54:48PM +0100, Pali Rohár wrote:
> > > > > > > > > > > > > > > On Wednesday 23 January 2019 18:46:18 Marcel Holtmann wrote:
> > > > > > > > > > > > > > > > Hi Pali,
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > > > tools/parser/avdtp.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++---
> > > > > > > > > > > > > > > > > 1 file changed, 55 insertions(+), 3 deletions(-)
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > diff --git a/tools/parser/avdtp.c b/tools/parser/avdtp.c
> > > > > > > > > > > > > > > > > index 18569c895..a21410f5a 100644
> > > > > > > > > > > > > > > > > --- a/tools/parser/avdtp.c
> > > > > > > > > > > > > > > > > +++ b/tools/parser/avdtp.c
> > > > > > > > > > > > > > > > > @@ -155,6 +155,12 @@ static char *vndcodec2str(uint32_t vendor, uint16_t vndcodec)
> > > > > > > > > > > > > > > > > {
> > > > > > > > > > > > > > > > >         if (vendor == 0x0000004f && vndcodec == 0x0001)
> > > > > > > > > > > > > > > > >                 return "aptX";
> > > > > > > > > > > > > > > > > +       else if (vendor == 0x0000000a && vndcodec == 0x0001)
> > > > > > > > > > > > > > > > > +               return "FastStream";
> > > > > > > > > > > > > > > > > +       else if (vendor == 0x0000000a && vndcodec == 0x0002)
> > > > > > > > > > > > > > > > > +               return "aptX Low Latency";
> > > > > > > > > > > > > > > > > +       else if (vendor == 0x000000d7 && vndcodec == 0x0024)
> > > > > > > > > > > > > > > > > +               return "aptX HD";
> > > > > > > > > > > > > > > > >         else if (vendor == 0x0000012d && vndcodec == 0x00aa)
> > > > > > > > > > > > > > > > >                 return "LDAC";
> > > > > > > > > > > > > > > > >         return "Unknown???;
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > lets keep the focus on btmon support since nobody should be using hcidump anymore.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > In btmon I already implemented it and patches are now merged. I just
> > > > > > > > > > > > > > > found another place where this capability parsing is implemented and
> > > > > > > > > > > > > > > based on fact that users still use hcidump I quickly looked at it and
> > > > > > > > > > > > > > > implemented this parsing.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I agree, hcidump still comes up on many places (guides, blogs, mailinglist posts, etc),
> > > > > > > > > > > > > > so it makes sense to add these patches to hcidump aswell. Especially when the patch is quite small.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Exactly, people still use hcidump...
> > > > > > > > > > > > 
> > > > > > > > > > > > Well it is a deprecated tool which we might remove starting on BlueZ
> > > > > > > > > > > > 6.x which we would like to do in the very next release, if that
> > > > > > > > > > > > doesn't happen than perhaps Id take these patches in for a very last
> > > > > > > > > > > > BlueZ 5.x release.
> > > > > > > > > > > > 
> > > > > > > > > > > > @Marcel: Or you have a better plan? We could do one last 5.x and then
> > > > > > > > > > > > start working on removing the deprecated tools/etc.
> > > > > > > > > > > > 
> > > > > > > > > > > 
> > > > > > > > > > > +1 for doing one last 5.x release before deprecating and removing tools etc!
> > > > > > > > > > 
> > > > > > > > > > Ok, what is the plan? If hcidump is not going to be deleted in upcoming
> > > > > > > > > > release, can you take this patch?
> > > > > > > > > >
> > > > > > > > > 
> > > > > > > > > How about applying this patch now, considering it's small, and has value for anyone using hcidump.
> > > > > > > > > hcidump then gets removed later whenever the removal of deprecated features/tools starts.
> > > > > > > > 
> > > > > > > > So... what are plans for next release?
> > > > > > > 
> > > > > > > Marcel, Luiz, can you comment next steps? It is waiting there for your
> > > > > > > info here for more than 2 months.
> > > > > > 
> > > > > > PING!
> > > > > 
> > > > > Just a gentle reminder for this thread and patch.
> > > > > 
> > > > 
> > > > Ping, another reminder.
> > > 
> > > Ping, could you please give us information what is the state of this
> > > tool and a linked patch?
> > 
> > Ping again, I have not got any reply for this patch for more then year.
> > Patch can be still cleanly applied on top of git master branch.
> 
> Hello! Have you had a time to look at this patch?

BUMP
