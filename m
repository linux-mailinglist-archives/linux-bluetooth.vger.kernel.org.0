Return-Path: <linux-bluetooth+bounces-250-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFF87FAAA2
	for <lists+linux-bluetooth@lfdr.de>; Mon, 27 Nov 2023 20:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18CC41C20D88
	for <lists+linux-bluetooth@lfdr.de>; Mon, 27 Nov 2023 19:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF6D45966;
	Mon, 27 Nov 2023 19:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C55D60;
	Mon, 27 Nov 2023 11:51:51 -0800 (PST)
Received: from p200301077700a9001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:107:7700:a900:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1r7hdy-006mkA-4B; Mon, 27 Nov 2023 20:51:46 +0100
Date: Mon, 27 Nov 2023 20:51:44 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Adam Ford <aford173@gmail.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 johan@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 tomi.valkeinen@ideasonboard.com, Tony Lindgren <tony@atomide.com>,
 =?UTF-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>, robh@kernel.org
Subject: Re: [RFC PATCH 0/3] bluetooth/gnss: GNSS support for TiWi chips
Message-ID: <20231127205144.2137de38@aktux>
In-Reply-To: <CAHCN7xL-HjK4WGVB7xHxWjAR0h7U6SLViLfWgur7Vc-bvf43+w@mail.gmail.com>
References: <20231126191840.110564-1-andreas@kemnade.info>
	<CAHCN7xL-HjK4WGVB7xHxWjAR0h7U6SLViLfWgur7Vc-bvf43+w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Nov 2023 08:03:24 -0600
Adam Ford <aford173@gmail.com> wrote:

> On Sun, Nov 26, 2023 at 1:47=E2=80=AFPM Andreas Kemnade <andreas@kemnade.=
info> wrote:
> >
> > Some of these chips have GNSS support. In some vendor kernels
> > a driver on top of misc/ti-st can be found providing a /dev/tigps
> > device which speaks the secretive Air Independent Interface (AI2) proto=
col.
> > Implement something comparable as a GNSS interface.
> >
> > With some userspace tools a proof-of-concept can be shown. A position
> > can be successfully read out.  Basic properties of the protocol are
> > understood.
> >
> > This was tested on the Epson Moverio BT-200. =20
>=20
> Can you tell me which WiLink chip this uses?
>=20
> I'd like to try it on the WL1283, but I want to understand which
> WiLink chips you're targeting.
>=20
I think, it is a WL1283 here, too.

If you want to play around with it now:
- set the devicetree node name to bluetooth-gnss
- for testing you can use the read-gps program at https://github.com/akemna=
de/bt200tools

Regards,
Andreas

