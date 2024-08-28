Return-Path: <linux-bluetooth+bounces-7050-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E19AF961CBE
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Aug 2024 05:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA6501C22F31
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Aug 2024 03:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B97B8288F;
	Wed, 28 Aug 2024 03:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zougloub.eu header.i=@zougloub.eu header.b="WgBi8u/b"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from zougloub.eu (zougloub.eu [69.70.16.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB689647
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Aug 2024 03:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.70.16.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724814540; cv=none; b=j+AeKw6V693Zaz9DyTTvSSvTrUJOlwxzLkbpLeV55mnqKI8EePnmxDy07VA0aRL9upQxylsS67vJaDZnhlLtbiQZZBETKOxYMTT+vstjmn/T7WPUIhEvl2dQjB/LhlDxDbGRcnqRCR1STOcLFmF6pfaJaaB5AREao3Ev63m7qtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724814540; c=relaxed/simple;
	bh=K+mOfzHvbMBNcA2rgF4BcQtysJ+UbAxsAjMjUCBm79Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kkyB8YoTok5N6jVZ6idkAhHXK31JF5MSWVcBLZXFqY2/WM3MbUtAk7rv42fzed6he55NgFLDd5zV4fR6NM3UbEWGD0k7ln5o2uXbQc/8fp4H9174siW9ISCUm1Vo/OwG4map+9Fm5Ptt+cE9zzl/F1FIvpEKAo5bbGlHh8qoJKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zougloub.eu; spf=pass smtp.mailfrom=zougloub.eu; dkim=pass (1024-bit key) header.d=zougloub.eu header.i=@zougloub.eu header.b=WgBi8u/b; arc=none smtp.client-ip=69.70.16.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zougloub.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zougloub.eu
Received: from pouet.cJ (exmakhina.com [69.70.16.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by zougloub.eu (Postfix) with ESMTPSA id A0F353E71A42;
	Tue, 27 Aug 2024 23:03:12 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zougloub.eu;
	s=zougloub.eu; t=1724814192;
	bh=K+mOfzHvbMBNcA2rgF4BcQtysJ+UbAxsAjMjUCBm79Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WgBi8u/bCuUmL9qp7mVLwxgvPvLnXsLJc9c7cKqKYYtkoDOvgz0PDZQaMkERiVsIS
	 r05F00Sx0JDe2ZfdZ6na/AEKjIAb9lhcMPF2SNtsq+7Jy36hhaWNY4uBCwXzuU1P/k
	 hH7mdHukMr1ZspW4KFYGITo3LJJx9XKW1txecu6g=
Message-ID: <298e82abb31826fbcd07f62aa6194e73ffedbcf5.camel@zougloub.eu>
Subject: Re: Puzzling software regression (flaky device control, scanning
 issues, scan filter?)
From: =?ISO-8859-1?Q?J=E9r=F4me?= Carretero <cJ-ko@zougloub.eu>
To: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Anton Khirnov
	 <anton@khirnov.net>
Cc: linux-bluetooth@vger.kernel.org
Date: Tue, 27 Aug 2024 23:03:08 -0400
In-Reply-To: <9f121aaae37f79022bb6d1aa7787e50492f7ee00.camel@zougloub.eu>
References: <9f121aaae37f79022bb6d1aa7787e50492f7ee00.camel@zougloub.eu>
Autocrypt: addr=cJ@zougloub.eu; prefer-encrypt=mutual;
 keydata=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
 ZXJvIDxjSkByZXotbWV0ei5zdXBlbGVjLmZyPoh9BBMRAgA9AhsjBgsJCAcDAgQVAggDBBYCAwECH
 gECF4AWIQS8OqgR3MKGddOiFIEeNSHmalewWgUCYBdf5gUJGxbSMwAKCRAeNSHmalewWtlDAJ9brw
 aFR6vaVnBIS5EDoeNReYvgZACgqM7h6fB484xfoLrgUzs/ZqGiaaO0LErDqXLDtG1lIENhcnJldGV
 ybyAoSmFiYmVyIG9ubHkpIDxjSkB4aW0uY2E+iH0EExECAD0CGyMGCwkIBwMCBBUCCAMEFgIDAQIe
 AQIXgBYhBLw6qBHcwoZ106IUgR41IeZqV7BaBQJgF1/mBQkbFtIzAAoJEB41IeZqV7Bacb8An0Wk1
 An7xVo41IL+B/wpjkJGK0DgAKCL35xA1LgxNSewks+xrcUO/I5b/rQwSsOpcsO0bWUgQ2FycmV0ZX
 JvIDxKZXJvbWUuQ2FycmV0ZXJvQHN1cGVsZWMuZnI+iH0EExECAD0CGyMCHgECF4AGCwkIBwMCBBU
 CCAMEFgIDARYhBLw6qBHcwoZ106IUgR41IeZqV7BaBQJgF1/mBQkbFtIzAAoJEB41IeZqV7Ba6XkA
 n1NwjueFs0ftw5CP15kWGwV41A5uAKDeK//q9xOFq8yl16H6Gf6Rfog967Q1SsOpcsO0bWUgQ2Fyc
 mV0ZXJvIDxKZXJvbWUuQ2FycmV0ZXJvQG1ldHouc3VwZWxlYy5mcj6IfQQTEQIAPQIbIwYLCQgHAw
 IEFQIIAwQWAgMBAh4BAheAFiEEvDqoEdzChnXTohSBHjUh5mpXsFoFAmAXX+YFCRsW0jMACgkQHjU
 h5mpXsFrE2QCfbEGoChRKIGq/t1QOQbEu92LhP3EAoOKJSqWvCX4c4V+R08ijK3fxRURxtDdKw6ly
 w7RtZSBDYXJyZXRlcm8gKEpvYikgPEplcm9tZS5DYXJyZXRlcm9AY3NjYW5hZGEuY2E+iH0EExECA
 D0CGyMGCwkIBwMCBBUCCAMEFgIDAQIeAQIXgBYhBLw6qBHcwoZ106IUgR41IeZqV7BaBQJgF1/nBQ
 kbFtIzAAoJEB41IeZqV7BaIh0AoJjZ+fpMXcVBpE7YeB0azBGouL/zAKDKcKtrzkMAE6sOF9QcBeT
 iZUq9qLQ8SsOpcsO0bWUgQ2FycmV0ZXJvIDxKZXJvbWUuQ2FycmV0ZXJvQGluZ2VuaWV1cnMtc3Vw
 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
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-pTNDgjwEDBoU3IWOkt0h"
User-Agent: Evolution 3.52.1 
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-pTNDgjwEDBoU3IWOkt0h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


On Wed, 2023-08-02 at 09:21 -0400, J=C3=A9r=C3=B4me Carretero wrote:
> Hi there,
>=20
>=20
> There is something wrong with my software stack or configuration and
> so far I can't put my finger on it. This probably has been going on
> for a few months. I found a way to express my issue as follows.
>=20
>  [...]
>=20
> =C2=A0Failed to start discovery: org.bluez.Error.InProgress


I see that the problem is gone in a v6.10.2..v6.10.6 upgrade and blame
says I should thank Anton Khirnov and Luiz Augusto von Dentz for this.

So thank you guys.


--=20
J=C3=A9r=C3=B4me


--=-pTNDgjwEDBoU3IWOkt0h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJDBAABCAAtFiEEk5TkdsnFh9XvC+SieNwb2r75s3MFAmbOk2wPHGNqQHpvdWds
b3ViLmV1AAoJEHjcG9q++bNzaUMQAMDzFMwOWYeWCpA+gst7dqkbAFRPnOXCFYFK
rCaaA1IgDTqtn+ktFZM6JFfh1k4OPUz/0BxoPWSRIGcGFhWKutoaIm7vRoQSzEc/
1xu/SdtYLtCexe1j30az5pBT5lkFmFprtvfQmbjFgPYv2eBsM8B+iBmSvqg8vrxs
XJYyBiz8nuJnPIBfyR3wu6mnNB0wlRFxPEkmUsFRpQ9ylkUcZ5SgVoHtDqx1sjiV
lSGs57QELkIsozYjsSRtkLMHTuqNxvu80BfK1c3BlKAbqOS3YDfXE70EraRAy6qk
Wsm87tjH4K/BeTW6umXt1UAbW1FP4YxKrRkwkL/OPXj+4G6amblqIei/O3fiK7m3
mnHqed7BxbGLFyKsEBSNlgdtkkj3PCgCjHjUWOpoXqlbB4thbZSHJQk8i9x1b3QH
CCG/KWmxgfwlamWlTiLJDzvghZ+rRjSSrRXERJFq4MUPIYCxaVHNIC21PwGk5c+O
HfAa63MmZGLtkx7rwH+hgTj0JUurTFdstkRN/jC2Lo0ra092VRuRUT/iOJzFfGTF
49m6+w5yGPxiMLPi58U7+50Q9r0CtfPX7WajUG6P7jxILgjSJoY6xzKSUVx/9Irt
cjZi6gnef7/DRNaoySJXV7A7JyLn3E2uFmywCnU6lKXHGd71Rw8kei3sRmA5w7+U
fKcdkoqV
=r6qZ
-----END PGP SIGNATURE-----

--=-pTNDgjwEDBoU3IWOkt0h--

