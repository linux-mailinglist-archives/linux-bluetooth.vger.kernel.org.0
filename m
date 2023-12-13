Return-Path: <linux-bluetooth+bounces-507-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F87880BD6B
	for <lists+linux-bluetooth@lfdr.de>; Sun, 10 Dec 2023 22:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 918D51C2084E
	for <lists+linux-bluetooth@lfdr.de>; Sun, 10 Dec 2023 21:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066D21D52D;
	Sun, 10 Dec 2023 21:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="6WiLE4GA"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4444CF;
	Sun, 10 Dec 2023 13:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FewMH2e65vLlSlAlvvNbXt8MICx3KL/gTD+zmuCLG/M=; b=6WiLE4GA5TFbCooHIYnga01kqi
	C9hC0tViHv8oP/IZ6ouEkJOJNTTBo9p9fDtohOZQrmuQE/sn1LhQYcz9RrtbjbA5scS17WxgpJB/a
	19cH/bH7JhQX0j/yQulhoVdzdL+vzgT5afCQLKFQj9NeoWKOn6HfgLJaZn4eI4oU63nyIIhh62cDk
	7i8TvxqJnsgft3IGV+iWvvS95Drk1+D6redXYCChqM8SemB515nFbJ+AO0wPJeotDuI9rMqyZtd/f
	8XZjfOXNs4lSWIyfbTjYIwi7emWjZAgwvn7KnzznksExdl8fythfBpONpgD1ooTCCyqp6bRJvJdR3
	1zALeNZw==;
Received: from p200301077700c3001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:107:7700:c300:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1rCRh5-007FGn-Fp; Sun, 10 Dec 2023 22:50:35 +0100
Date: Sun, 10 Dec 2023 22:50:32 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 johan@kernel.org, arnd@arndb.de, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, tomi.valkeinen@ideasonboard.com, Tony
 Lindgren <tony@atomide.com>, =?UTF-8?B?UMOpdGVy?= Ujfalusi
 <peter.ujfalusi@gmail.com>, robh@kernel.org
Subject: Re: [RFC PATCH 3/3] drivers: misc: ti-st: begin to deorbit
Message-ID: <20231210225032.38d8c36f@aktux>
In-Reply-To: <2023112729-qualify-relearn-6a72@gregkh>
References: <20231126191840.110564-1-andreas@kemnade.info>
	<20231126191840.110564-4-andreas@kemnade.info>
	<2023112729-qualify-relearn-6a72@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Greg,

On Mon, 27 Nov 2023 08:25:46 +0000
Greg KH <gregkh@linuxfoundation.org> wrote:

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
> 
Well, I just thought that marking something as broken and then deleting
it if no one complains would be the standard procedure. So we can
delete it now since there are obviously no users (no board files, no
device tree support)?

The logical connection between the other patches of this series is given
only by the fact that patches 1+2 are for me the proof that we do not
need that ti-st driver. 
I think since there are no in-tree users, having that proof in lkml is
enough, so we can probably remove the driver now?

I will send a separate remove patch including going with a brush through
include/linux/ti_wilink_st.h

Regards,
Andreas

