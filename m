Return-Path: <linux-bluetooth+bounces-233-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6A37FA1D3
	for <lists+linux-bluetooth@lfdr.de>; Mon, 27 Nov 2023 15:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C7D51C20E2E
	for <lists+linux-bluetooth@lfdr.de>; Mon, 27 Nov 2023 14:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01CC30F9C;
	Mon, 27 Nov 2023 14:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="sOg33PuR"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E25A3276
	for <linux-bluetooth@vger.kernel.org>; Mon, 27 Nov 2023 05:59:15 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id B87DF604AC;
	Mon, 27 Nov 2023 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701093034;
	bh=FE9cvV3PjTeKPLT9+4+I0lHD4+oUEtNr//lG4eUzrzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sOg33PuRFPb4dK1Qfkk80dZYbIvLfUVgUl30rBvhJk1LlEBQdjRwQsxNZvh2GPwZq
	 oU7Q0aIXs7RJI77othtwSKD5RLzgI6hLlQcud7CNbexg4It2oHqJlQx/zu4Fzq3BjU
	 FAl63pOdUEp2gLwOlFLuC6NIhoHq1rtllfPqTNmlsmR9iLV5vG5LuxSjkXpQ3JmDph
	 jFgQ6dkPvzH3Up1j8EPOOSW1FI7Xqiu0WUi0fLDkIkbbcRd1QU6VXD4Z56EGnZ4szs
	 InYkmJxbYJudmoCC23NUjac0819zpQiozHoWy2LtweHQucfhzbuw8KBG5PSKJyFbwA
	 zhpmZAGW/+pSw==
Date: Mon, 27 Nov 2023 15:50:08 +0200
From: Tony Lindgren <tony@atomide.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Andreas Kemnade <andreas@kemnade.info>, marcel@holtmann.org,
	johan.hedberg@gmail.com, luiz.dentz@gmail.com, johan@kernel.org,
	arnd@arndb.de, linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	=?utf-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>,
	robh@kernel.org
Subject: Re: [RFC PATCH 3/3] drivers: misc: ti-st: begin to deorbit
Message-ID: <20231127135008.GN5169@atomide.com>
References: <20231126191840.110564-1-andreas@kemnade.info>
 <20231126191840.110564-4-andreas@kemnade.info>
 <2023112729-qualify-relearn-6a72@gregkh>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023112729-qualify-relearn-6a72@gregkh>

* Greg KH <gregkh@linuxfoundation.org> [231127 08:25]:
> On Sun, Nov 26, 2023 at 08:18:40PM +0100, Andreas Kemnade wrote:
> > The TI-ST driver seems not to be used anymore. For bluetooth needs
> > there is hci_ll.c which has device tree support and can work without
> > this one. Also firmware download support is there, so it is also not needed
> > here. GPS can also reuse parts of the framework in hci_ll
> > 
> > Contrary from this driver, device tree support has been removed.
> > 
> > So start deorbiting it by marking it as broken.
> > 
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  drivers/misc/ti-st/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/misc/ti-st/Kconfig b/drivers/misc/ti-st/Kconfig
> > index 1503a6496f632..6bf9cc845745c 100644
> > --- a/drivers/misc/ti-st/Kconfig
> > +++ b/drivers/misc/ti-st/Kconfig
> > @@ -7,7 +7,7 @@ menu "Texas Instruments shared transport line discipline"
> >  config TI_ST
> >  	tristate "Shared transport core driver"
> >  	depends on NET && TTY
> > -	depends on GPIOLIB || COMPILE_TEST
> > +	depends on GPIOLIB || COMPILE_TEST || BROKEN
> 
> Why not just delete it?  Why have it stick around any longer?

Sounds good to me too.

Regards,

Tony

