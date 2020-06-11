Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2221F684C
	for <lists+linux-bluetooth@lfdr.de>; Thu, 11 Jun 2020 14:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgFKMxI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 11 Jun 2020 08:53:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:58146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726471AbgFKMxH (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 11 Jun 2020 08:53:07 -0400
Received: from pali.im (pali.im [31.31.79.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D70320760;
        Thu, 11 Jun 2020 12:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591879986;
        bh=9/E9z9R4TwC5GOLnH3lazk6TwVqXe+EfKPu692+SEYw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ht+ORP6kJG6ZO1setA1QcMfm+lrcwg7V5cQy27IiPQ/GTDkfR9aRpHjSrxgRgMENm
         zvG0HVoA4i+lcswSc0doBpO2BgJGNjJhV3siBKvBBuJlcfj0otVINRpMAgLIl4HR9L
         6NixXnOEyzhARewmZiwpOu7lnF9jjfxqpOK0ZvRU=
Received: by pali.im (Postfix)
        id 67755851; Thu, 11 Jun 2020 14:53:04 +0200 (CEST)
Date:   Thu, 11 Jun 2020 14:53:04 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] Install avinfo utility
Message-ID: <20200611125304.b4mxxuv7rupamfmg@pali>
References: <20200506193435.3746-1-pali@kernel.org>
 <CECA6D9A-0F26-40E8-BFDF-A24CD972307D@holtmann.org>
 <20200610093306.zt3q3s2wmwp3almw@pali>
 <7672C0A0-AF6A-41B2-B50F-7836B3E5CC73@holtmann.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7672C0A0-AF6A-41B2-B50F-7836B3E5CC73@holtmann.org>
User-Agent: NeoMutt/20180716
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wednesday 10 June 2020 19:31:47 Marcel Holtmann wrote:
> Hi Pali,
> 
> >>> This utility is very useful for determining which A2DP codecs are supported
> >>> by remote side. So install it to system as part of bluez package.
> >>> ---
> >>> Makefile.tools | 4 ++--
> >>> 1 file changed, 2 insertions(+), 2 deletions(-)
> >>> 
> >>> diff --git a/Makefile.tools b/Makefile.tools
> >>> index 9b9236609..d52721612 100644
> >>> --- a/Makefile.tools
> >>> +++ b/Makefile.tools
> >>> @@ -176,9 +176,9 @@ endif
> >>> if TOOLS
> >>> bin_PROGRAMS += tools/rctest tools/l2test tools/l2ping tools/bccmd \
> >>> 			tools/bluemoon tools/hex2hcd tools/mpris-proxy \
> >>> -			tools/btattach
> >>> +			tools/btattach tools/avinfo
> >>> 
> >>> -noinst_PROGRAMS += tools/bdaddr tools/avinfo tools/avtest \
> >>> +noinst_PROGRAMS += tools/bdaddr tools/avtest \
> >>> 			tools/scotest tools/amptest tools/hwdb \
> >>> 			tools/hcieventmask tools/hcisecfilter \
> >>> 			tools/btinfo tools/btconfig \
> >> 
> >> I had no intention to install that tool since it is too limited
> > 
> > Sorry, but I have not seen any limitations with this tool yet. I'm using
> > it very often. And also other people who use it have not mentioned any
> > limitations or problems.
> > 
> > So could you be more specific what are those limitations?
> > 
> > Also it is the first thing which I'm saying people that should run and
> > send me output of it if something related to A2DP does not work.
> > 
> > And because linux distributions do not package this utility and bluez
> > developers (for me for unknown reasons) decided to not install it,
> > result is that people have to always compile bluez from source to run
> > this utility if their A2DP audio does not work or "remote" debugging of
> > A2DP is needed.
> > 
> > So result is that who want to know why A2DP audio does not work is
> > forced to compile & install bluez from sources and not to use from
> > distribution package. And this probably not the expected state.
> > 
> > In any case, nobody reported to me any limitation with one exception
> > that it cannot decode capabilities of some custom vendor codecs. But
> > most of them are already supported as I sent needed patches in past.
> > 
> >> and makes too many assumption.
> > 
> > For example which assumptions?
> 
> that nothing else is happening right now. It backstabs the actual AVDTP and A2DP implementation.

Marcel, but this is not a problem. For that one purpose which avinfo
provides it ideal and works fine. Personally I do not see any problem
with it.

> >> In addition it has a bad name with no Bluetooth prefix.
> > 
> > So, lets rename it. What about "btavinfo"?
> 
> Lets extend btinfo with all sort of capabilities. Make the av portion just one of. I want to remove the multitudes of test utilities anyway. We have to many tiny utilities that are just scattered around and avinfo is just one of them.

This looks like a not-so-trivial task and moreover independent of
providing current version of avinfo to users.

avinfo already exists, is already part of bluez project, it is already
compiling during bluez build and is already used by me and lot of other
users and works for that one purpose as expected.

> > 
> >> If we think it is useful to have such a test utility, then we need to clean this up first
> > 
> > What exactly to clean up first?
> > 
> > Note that I have already done cleanup of this utility.
> > 
> >> and put this into a larger btinfo work to gather appropriate information from a remote device for debug purposes.
> > 
> > I do not see how btinfo can be used for A2DP purposes. Seems this is
> > utility for local controller info and not for remove A2DP.
> 
> This needs a bit thinking, but pretty much simple things like this:
> 
> 	btinfo local
> 	btinfo avdtp <remote_bdaddr>
> 
> We can create a module handling system so that you can easily links existing tiny utilities into one.

I'm not against this change. But this is additional work which needs to
be done. And it would not happen today or tomorrow unless you have
already patches which implement it.

As I said avinfo is already there, implemented, it is working and is
part of bluez source code. And is basically the first step when
debugging issues with A2DP audio.

So what is the real issue with not only compiling this avinfo tool
during building bluez but also installing it?
