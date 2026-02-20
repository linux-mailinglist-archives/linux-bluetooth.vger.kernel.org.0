Return-Path: <linux-bluetooth+bounces-19252-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNKNLHWomGmvKgMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19252-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 19:31:17 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1301F16A127
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 19:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21D6A302D13B
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 18:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC07237707;
	Fri, 20 Feb 2026 18:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6uJkrPw"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A125D23C4F2
	for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 18:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771612270; cv=none; b=WCyy420B3NONXKBfEkWVkbCiff6pBuQ0SlqTViONRDr1RI3uePyo4VJONMgr7t3hjyL6h2J5rZVZGjb91zIm6Py2uwU8lSzW0HJA0nm1Ds5DIyDCX+2rSDUQGouRw91XGvQznBX5xEYXSkGntcQbQ94irL0SxigCi8wpR8trGkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771612270; c=relaxed/simple;
	bh=jtxdnsFoaJ7ZZ3Cqn+tSp7m5G53dJk4cSH6H7At3v18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kp+rtEdgDOEtbWG7SCBtv4TW0TrfNUrlv9mj/mYcyfGxxatKWUIFc1dOjdF5G4MffLKPRWa7FJ/Z28d1jL1YfwrFGH3NQCTBO3sX/jIVXPlvhMUV/l/e8R5CnKVhZeBc94DAfKXuU97NROSZIyyhMnX4H85XzsmGrA9YJjueW50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6uJkrPw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7B8C2BC87
	for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 18:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771612270;
	bh=jtxdnsFoaJ7ZZ3Cqn+tSp7m5G53dJk4cSH6H7At3v18=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a6uJkrPwgYJUifSyCTS6qLRblT3UuP8pQhDCmNAd2ogqq5vgBEsHwq8dslg95Fr1M
	 QE1qEwpPqLbgGyGBKdPG/vP4VNWVDlhs9IYK06sSbep9fCo3MBIK+S5fNuzsKmGmWL
	 h2/G71sxc2mVMfFqbdMY7IclfV225a4CVo51pykG11YGDk2h68oBqoWRHwrOTXN+eB
	 HsbrO5uBlRdRKmL/zJwkT1bbPqJYSawCm7Zz78cgYbavZ+KUnACdpmbZj5IO+i0aRE
	 XNBFYKoaXBvfdKZOJURklibqI4NNg3hc/C/o8ekrxP3QxYh6KF4Kdav65dJaAoaVfg
	 nEz+gA8l7HzDQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38706b63929so22062611fa.3
        for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 10:31:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxuMiHjAdaRzfADq4qAP+w9oZoU1jLLHLEJmW8Zp7/7lJmqV6pRshe5qGnQQ+qnv4jXyVPrX2iffeDHgWHKUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGOae5pNHRit1jxzQbRqZjhuokFzmh1og9/Nu1KsVbx0K6H3SF
	Q1NNrFK3JVDVvpZ59RZf2NtvOxT1/vhkxHPS5hz8OKMBM6xFdHHbkjd5mbXCi7/mHoBVcHyDm2g
	BzMon0kSaNidkPYSf4EeJT3ohB7H5c8E=
X-Received: by 2002:ac2:4f0d:0:b0:59d:f2a4:3e98 with SMTP id
 2adb3069b0e04-5a0ed88d733mr123595e87.4.1771612268567; Fri, 20 Feb 2026
 10:31:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219231624.8226-1-sean.wang@kernel.org> <0cb6c45b-a5a4-46bf-a73d-97c482da9339@molgen.mpg.de>
In-Reply-To: <0cb6c45b-a5a4-46bf-a73d-97c482da9339@molgen.mpg.de>
From: Sean Wang <sean.wang@kernel.org>
Date: Fri, 20 Feb 2026 12:30:56 -0600
X-Gmail-Original-Message-ID: <CAGp9LzqYB=xPfAuL61xi-ve=f6PZWWaa2gpf50-75yXWee-ZHA@mail.gmail.com>
X-Gm-Features: AaiRm50CGzZAUpdHBs8DARRVcPhWLB2FVeLnVfyzVg436zGF1NWQ8dHO4F1lG6w
Message-ID: <CAGp9LzqYB=xPfAuL61xi-ve=f6PZWWaa2gpf50-75yXWee-ZHA@mail.gmail.com>
Subject: Re: [PATCH 1/4] mmc: sdio: add MediaTek MT7902 SDIO device ID
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, ulf.hansson@linaro.org, 
	linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-mmc@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,linaro.org,vger.kernel.org,lists.infradead.org,mediatek.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-19252-lists,linux-bluetooth=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean.wang@kernel.org,linux-bluetooth@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:email]
X-Rspamd-Queue-Id: 1301F16A127
X-Rspamd-Action: no action

Dear Paul,

On Thu, Feb 19, 2026 at 5:28=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>
> Dear Sean,
>
>
> Thank you for the patch.
>
> Am 20.02.26 um 00:16 schrieb Sean Wang:
> > From: Sean Wang <sean.wang@mediatek.com>
> >
> > Add SDIO device ID (0x790a) for MediaTek MT7902 to sdio_ids.h.
>
> Tested how?

Tested on real hardware with successful card detection, driver
initialization and the connectivity.

>
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> >   include/linux/mmc/sdio_ids.h | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/include/linux/mmc/sdio_ids.h b/include/linux/mmc/sdio_ids.=
h
> > index 673cbdf43453..97cc834fb3d5 100644
> > --- a/include/linux/mmc/sdio_ids.h
> > +++ b/include/linux/mmc/sdio_ids.h
> > @@ -112,6 +112,7 @@
> >   #define SDIO_DEVICE_ID_MEDIATEK_MT7663              0x7663
> >   #define SDIO_DEVICE_ID_MEDIATEK_MT7668              0x7668
> >   #define SDIO_DEVICE_ID_MEDIATEK_MT7961              0x7961
> > +#define SDIO_DEVICE_ID_MEDIATEK_MT7902               0x790a
>
> Please sort it.

I will address the sorting in v2.
Thanks for the review.

>
> >
> >   #define SDIO_VENDOR_ID_MICROCHIP_WILC               0x0296
> >   #define SDIO_DEVICE_ID_MICROCHIP_WILC1000   0x5347
>
>
> Kind regards,
>
> Paul

