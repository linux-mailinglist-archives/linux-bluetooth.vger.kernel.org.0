Return-Path: <linux-bluetooth+bounces-482-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F1F80AB1B
	for <lists+linux-bluetooth@lfdr.de>; Fri,  8 Dec 2023 18:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABB901C2086A
	for <lists+linux-bluetooth@lfdr.de>; Fri,  8 Dec 2023 17:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B503B793;
	Fri,  8 Dec 2023 17:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="V/oW7BdH"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09F11738;
	Fri,  8 Dec 2023 09:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3u/9XNVPaXTvbYqc+nnnyMawNo/lMpvd3yOqY2JQ8xM=; b=V/oW7BdH++6JFKIA/92PKPthBD
	Dq/lCvPvZ+OZJdrJpWOEQRVSHgXWEQrFa5A/E6TKp1OIn05/5FvE2ywRjlVsVIvO3qFpfbgxGkibl
	GwfKpRA/jU/pOC9x1CM3ZOQ4bxSxUGDz7YHgWioXvTFe+2hAdxW98lMLQTyOsO+gZkMZluo/+jKto
	LqF9bK/2jla6EZCxF8DvOxBi/PRhQdK1WJvau0SfWV1ej1RfAOu/RezbK+7oLZ8TVbkNVcog6cV9x
	51hJGHQihGftnpOwg9ZqmY5wvk0x7AT8JuiFa9kNaxN9EyN4KSNlP4YbrS6eLJ20q2xlIIJl8HrQv
	yJfO6G7w==;
Received: from p200301077700c3001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:107:7700:c300:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1rBexA-007As3-Aq; Fri, 08 Dec 2023 18:47:56 +0100
Date: Fri, 8 Dec 2023 18:47:53 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Adam Ford <aford173@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>, marcel@holtmann.org,
 johan.hedberg@gmail.com, luiz.dentz@gmail.com, johan@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
 =?UTF-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>, robh@kernel.org
Subject: Re: [RFC PATCH 0/3] bluetooth/gnss: GNSS support for TiWi chips
Message-ID: <20231208184753.6a88801b@aktux>
In-Reply-To: <CAHCN7x+veM=izOVGEOvKpTFca53C0VhrLkscJqdcBX1riOOWbA@mail.gmail.com>
References: <20231126191840.110564-1-andreas@kemnade.info>
	<20231127135424.GO5169@atomide.com>
	<20231127215108.6e985819@aktux>
	<CAHCN7x+veM=izOVGEOvKpTFca53C0VhrLkscJqdcBX1riOOWbA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 8 Dec 2023 08:39:21 -0600
Adam Ford <aford173@gmail.com> wrote:

> On Mon, Nov 27, 2023 at 2:51=E2=80=AFPM Andreas Kemnade <andreas@kemnade.=
info> wrote:
> >
> > Hi,
> >
> > On Mon, 27 Nov 2023 15:54:24 +0200
> > Tony Lindgren <tony@atomide.com> wrote:
> >
> > [...] =20
> > > > - Output at /dev/gnssX:
> > > >   AI2 vs. NMEA
> > > >   The chip can be configured into sending AI2-encapsulated NMEA,
> > > >   or proving data in a binary format.
> > > >   Some research has to be done yet for the details.
> > > >   A pile of logs is waiting for further analysis...
> > > >
> > > >   Arguments for/against NMEA:
> > > >   + Userspace is prepared to handle it
> > > >   + Power management can be easily done by the kernel
> > > >   - Less functionality can be used. =20
> > >
> > > I'd go with NMEA format as the default setting :)
> > > =20
> > yes, that would also be my preference.
> > =20
> > > >   Arguments for/against AI2:
> > > >   + Full functionality can be accessed from userspace (incl. A-GPS,
> > > >     maybe raw satellite data)
> > > >   - Userspace has to behave to have proper power management
> > > >   - No freely (not even as in beer) tool available to fully use AI2,
> > > >     so there will be only a real advantage after long "French Cafe"
> > > >     sessions. =20
> > >
> > > Seems AI2 could be optionally enabled as needed with some writes
> > > to /dev/gnss0 to change the mode? =20
> >
> > Hmm, we have
> > /sys/class/gnss/gnss0/type to get the mode, maybe we add some file
> > to change the mode? Or having it hidden behing a module parameter
> > and implement something better accessible if any need arrives?
> >
> > If we want NMEA output, probably some init commands will be sent at
> > open(), but userspace doing something with AI2 probably does not want
> > the device touched, so it should probably be already be set before open=
(). =20
>=20
> Is there another revision coming or should I try to test this one?  I
> am not very familiar with the GNSS part of the module, but it sounds
> like there was some consensus as to which direction we should go.  I
> should have a little time this weekend.
>=20
Progress is only in my test program. No more checksum errors, I have
made some progress in protocol reverse engineering. So make sure
you do a git pull for https://github.com/akemnade/bt200tools

Regards,
Andreas

