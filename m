Return-Path: <linux-bluetooth+bounces-2083-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D1385F9C2
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Feb 2024 14:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A73051F2707D
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Feb 2024 13:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BFC1350D2;
	Thu, 22 Feb 2024 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lI/NOJ4L"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0643413340A
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Feb 2024 13:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708608433; cv=none; b=bmAxAn3CQQ7teWmOf1TMgroqehg8t5N5C+n2gpD6DHQ1bW14eqY5VgvHbAwqCLfVDsW2n0LjfuLyt37Nnwkx3Yd5O2ACWCibB0cQ4T0qzKrcNgFWGTRivsD5tRMKBwHJWJXrvR6cRVCQc3FJu0V0VY1ob5iHeb/g3MxAe6gq0vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708608433; c=relaxed/simple;
	bh=snpGyI7YNE/Sro06+yGoEFaZBAn/Q00Q5PkCi6CMdMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Np2hzowmSN8msX0zQLmqLi3djn1vGVNNKvrpEA958WwSx/SB8hmTCD1NHx72/zs6W9Bg+kU3U1Ryqrqnc3QfVIROwvDbWQPpGkb679yqyLpdg495epUkwytkh6ySfVeEPRVpPNVSotYHFY5sVM3z7ADT94l9mxZ8xXprf53Fxew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lI/NOJ4L; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7d2a67daa25so4775532241.0
        for <linux-bluetooth@vger.kernel.org>; Thu, 22 Feb 2024 05:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708608431; x=1709213231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snpGyI7YNE/Sro06+yGoEFaZBAn/Q00Q5PkCi6CMdMw=;
        b=lI/NOJ4Lt8pYoAkCV7uSez40ysyo/fZizj5Qyb2djhe7NH5YUXKKSW0jZtpbvQiBRj
         yQN5k+eopYB6SrpNnjW+fxBdV/g0k2i5WzfWhfQpMl0uHcTvuvGH8CcswGRysRwYFPwA
         mbyLrMF6eal2fpxQN3ZEza6kApGnbiqPPFp5Maxvp41hX6pm7o5BAHWvUsz5W5g3CZaX
         WDhJU6879r1E6Kcv+CDTzHI/YSIwOto/F9O0tj7Yp+QGnEGt8VxwU0D7P2GtQCpyOI24
         DtCzXXi2/P0otU+jF/4hb4M7t3i4g4K6Gh/pzEZoIg3gMOWX0K5gkTMpOSVfctybvLEi
         ct/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708608431; x=1709213231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snpGyI7YNE/Sro06+yGoEFaZBAn/Q00Q5PkCi6CMdMw=;
        b=Bjc0M4wwXz9nP+LX8FWnua0eY49/BWbXwXAUsSjCWIO1GUF0maN+hPq+fhchJScDLl
         jRw8yvjdW6yq/88IVB3if6e6ixOh3Jt3SCzvHMb9MFRWIkn3G875d9kYANIEWXXsJAL0
         792BmZR6Ic47VCSFRPmAiEr8i1WqOa3K9k3afbA/RC6JZBsN6FpucWnTlOdSWlYImtb/
         Z9MfsJBO4zolHNeFxNGrcEr6SPA4bBaCtQloR9DzI73vh5oKTTqlGDmEBb1zSH8XMBbz
         z9lgxLIUTGqXQIqcLlkKiwDpc6Bi6cIQhZMPO7XgPwMuoB7I1JHbUzbZs7iQbueDH/gg
         i9wA==
X-Forwarded-Encrypted: i=1; AJvYcCVgaDBQF7QmfaXzfxia8zF14UEqfidjPKNB/klUD8ptXWzF9j//gzDrzMtnIyc3agufXt3ltWMTpSmyExvs8q7R0MpQ1ps1SX7UaS8ctJnJ
X-Gm-Message-State: AOJu0YwgecvK6uUA2KVWXGVJv/VnrZMhxCN5X2lFbW0zG3zLH61mp/8e
	bTJ4voviqM2guDKNiEYD4huRXFBs3KeEk4EYqVEDfSrRP2a2Ho0wq9XuUkl6og8gYY6NqUstS5l
	TlnEy3B7Z9g4wKX1T8PVWplYRa2TOeC+RNpEFqA==
X-Google-Smtp-Source: AGHT+IGZke8GPxuTnIFkoutjIP1dxFF56tGFJbVOgH1doqRbM8ENn6+k7HWpy/CEfw0YnaYPzOd9wrML9VZzcB0ao6s=
X-Received: by 2002:a67:f9c9:0:b0:470:492d:672e with SMTP id
 c9-20020a67f9c9000000b00470492d672emr11912352vsq.9.1708608430904; Thu, 22 Feb
 2024 05:27:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216203215.40870-1-brgl@bgdev.pl> <20240216203215.40870-15-brgl@bgdev.pl>
 <d5d603dc-ec66-4e21-aa41-3b25557f1fb7@sirena.org.uk> <CAMRc=MeUjKPS3ANE6=7WZ3kbbGAdyE8HeXFN=75Jp-pVyBaWrQ@mail.gmail.com>
 <ea08a286-ff53-4d58-ae41-38cca151508c@sirena.org.uk> <17bbd9ae-0282-430e-947b-e6fb08c53af7@linaro.org>
 <53f0956f-ee64-4bd6-b44f-cbebafd42e46@sirena.org.uk> <CAMRc=MedCX_TGGawMhr39oXtJPF4pOQF=Jh2z4uXkOxwhfJWRw@mail.gmail.com>
 <52fba837-989b-4213-8af7-f02cd8cb48c8@sirena.org.uk> <CAMRc=MeF7xVjRKetg1A3MNO4yMasPA2GC7MLCBrOiwO5UBv6LA@mail.gmail.com>
 <68e401c6-6e59-4c35-8f05-40f6c5eb6849@sirena.org.uk>
In-Reply-To: <68e401c6-6e59-4c35-8f05-40f6c5eb6849@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 Feb 2024 14:26:59 +0100
Message-ID: <CAMRc=Mfi6wgGSsH=pS68-GFWZwHB98YnH4+6LiBFprTEHntdcQ@mail.gmail.com>
Subject: Re: [PATCH v5 14/18] PCI/pwrctl: add a power control driver for WCN7850
To: Mark Brown <broonie@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Saravana Kannan <saravanak@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Alex Elder <elder@linaro.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 2:15=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Feb 22, 2024 at 01:26:59PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Feb 22, 2024 at 1:21=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
> > > On Thu, Feb 22, 2024 at 10:22:50AM +0100, Bartosz Golaszewski wrote:
>
> > > > Removing it would be out of scope for this series and I don't reall=
y
> > > > want to introduce any undefined behavior when doing a big developme=
nt
> > > > like that. I'll think about it separately.
>
> > > This is new code?
>
> > It's a new driver but Qualcomm standard has been to provide the load
> > values. If it's really unnecessary then maybe let's consider it
> > separately and possibly rework globally?
>
> That doesn't seem a great reason to add more instances of this - it's
> more instances that need to be removed later, and somewhere else people
> can cut'n'paste from to introduce new usage.

Ok, whatever, I'll drop these until they're needed.

Bartosz

