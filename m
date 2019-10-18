Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33602DC016
	for <lists+linux-bluetooth@lfdr.de>; Fri, 18 Oct 2019 10:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392374AbfJRIhe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 18 Oct 2019 04:37:34 -0400
Received: from emh07.mail.saunalahti.fi ([62.142.5.117]:37292 "EHLO
        emh07.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbfJRIhe (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 18 Oct 2019 04:37:34 -0400
Received: from ydin.reaktio.net (reaktio.net [85.76.255.15])
        by emh07.mail.saunalahti.fi (Postfix) with ESMTP id D49FBB00EA;
        Fri, 18 Oct 2019 11:37:31 +0300 (EEST)
Received: by ydin.reaktio.net (Postfix, from userid 1001)
        id CAE1036C0F8; Fri, 18 Oct 2019 11:37:31 +0300 (EEST)
Date:   Fri, 18 Oct 2019 11:37:31 +0300
From:   Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Subject: Re: [PATCH BlueZ 1/4] doc/media-api: Add RegisterApplication method
Message-ID: <20191018083731.GJ28704@reaktio.net>
References: <20191003181855.GF28704@reaktio.net>
 <20191006100503.fsbttcschr6wgsdq@pali>
 <CABBYNZLS4MMxJ=gQED-BVfn81D0bvx8aLw5OO3tNmXAnWeA57Q@mail.gmail.com>
 <20191006120245.tkrooh45q7irtm6l@pali>
 <20191007143307.ez6g466afu3trlxn@pali>
 <CABBYNZ+2CGn2rONg+Tpdh9vr7E40_SFFT4Mmru2vQw7MKHTFjQ@mail.gmail.com>
 <20191008103333.rqn2btlkwtcrpouo@pali>
 <CABBYNZKKUf6-FPBEGjuC5GbsNzNsDLy7LgCHxqiW_g98BaX+QA@mail.gmail.com>
 <20191009131921.ysl3ianpv5e4m677@pali>
 <20191017095957.cce7jzejvn76kwkc@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191017095957.cce7jzejvn76kwkc@pali>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Thu, Oct 17, 2019 at 11:59:57AM +0200, Pali Roh�r wrote:
> > > >
> > > > So... what should applications expects and how they should implement
> > > > above decision?
> > > 
> > > Actually the decision should be based on the presence of
> > > RegisterApplication method, if that exists then endpoint switching
> > > should be supported as well, so has nothing to do the
> > > GetManagedObjects API of the bluetoothd. That said RegisterApplication
> > > was not made experimental which kind makes 5.51 broken because it
> > > would appear that it endpoint objects would be exposed but when in
> > > fact there are not, anyway lets finally have the code to use this
> > > interface and then we can remove the experimental flag from
> > > MediaEndpoint.
> > 
> > Ok, so can pulseaudio do following?
> > 
> > Call RegisterApplication. If success then expects that codec switching
> > is possible and via GetManagedObjects exports all available codecs.
> > If RegisterApplication fails then fallback to RegisterEndpoint, expects
> > that codec switching is not possible and so register only one SBC codec.
> 
> Also can we solve this problem in bluez ASAP? Last released bluez
> version is due to that non-experimental API broken and once applications
> (e.g. pulseaudio) starts using this new API then A2DP without bluetoothd
> -E would be broken.
> 
> I would propose to remove experimental mark for codec switching API and
> release a new bugfix version of bluez, so people would not use released
> 5.51 broken version... which could prevent breakage of A2DP in future.
>

+1

It would be nice to get bluez 5.52 released before 5.51 gets released by distros..


-- Pasi

