Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29B202291A
	for <lists+linux-bluetooth@lfdr.de>; Sun, 19 May 2019 23:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730132AbfESVWA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 19 May 2019 17:22:00 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:59601 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730130AbfESVWA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 19 May 2019 17:22:00 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 62094802FE; Sun, 19 May 2019 23:21:48 +0200 (CEST)
Date:   Sun, 19 May 2019 23:21:58 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>
Subject: Re: HCI Set custom bandwidth for AuriStream SCO codec
Message-ID: <20190519212157.GB31403@amd>
References: <20190504171550.llqfv5674gxd3bnn@pali>
 <20190506151651.pu2us2fgsf7w2vos@pali>
 <20190516183429.ql3hxtnmiabcq7tj@pali>
 <CABBYNZLJB0bK7o=Tvf9mhb5U41xAin6SdPY9=76AuEvpEiA_8g@mail.gmail.com>
 <20190519082305.q7y4gpmdhvx3vzvo@pali>
 <CABBYNZJKO07p-8ufP7=4WUYS1oLhnsKY_pnP6-0SbVzi=CYZsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Content-Disposition: inline
In-Reply-To: <CABBYNZJKO07p-8ufP7=4WUYS1oLhnsKY_pnP6-0SbVzi=CYZsQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org


--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > to be honest, I would rather see WBS implementation finally
> > > reach PA before we start digging into this.
> >
> > First I want to finish improving A2DP codec support in pulseaudio. Later
> > I can look at HSP/HFP profiles. Ideally it should have modular/plugin
> > extensible design. So the aim is that adding new codec would be very
> > simple, without need to hack something related to mSBC/WBC, AuriStream
> > or any other codec.
>=20
> Well HSP don't have support for codec negotiation, but yes a modular
> design is probably recommended.
>=20
> > But for AuriStream I need to set custom SCO parameters as described
> > below and currently kernel does not support it. This is why I'm asking
> > how kernel can export for userspace configuration of SCO parameters...
>=20
> We can always come up with socket options but we got to see the value
> it would bring since AuriStream don't look that popular among
> headsets, at least Ive never seem any device advertising it like
> apt-X, etc.

Pali clearly has such device and he is willing to work on it. Surely
that means it is popular enough to be supported...?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzhyPUACgkQMOfwapXb+vIvJgCcDAPvhrkaqmFshDeCJfQFZTpl
+mgAoJ228D9E/9rOrUdeOXrymGkR6Acr
=PaGJ
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
