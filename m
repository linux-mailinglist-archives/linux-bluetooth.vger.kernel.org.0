Return-Path: <linux-bluetooth+bounces-3974-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B85C8B0974
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Apr 2024 14:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07F72284F6E
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Apr 2024 12:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9340E15B0F1;
	Wed, 24 Apr 2024 12:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="187GRk5Z"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9263A15A4AA
	for <linux-bluetooth@vger.kernel.org>; Wed, 24 Apr 2024 12:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961668; cv=none; b=Vc/UPr1MlEl9ialzy5TDxZZaewa8ld1qZT43YO8fgxtOeG7GsQOuVb/BI0GNaK08KMNZbflyOWL3s/G/TM39h9F4PdnG4grdThuLqGpnjawAvV+MW0BsX7P151vZjwnCNi5wOt4C+gSx0x/r6snt0GXpGY1kTh7pozXlKMBIfNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961668; c=relaxed/simple;
	bh=4l5jZLb/34NM5dMz9g2a72zUgmN/UcICDE4JDkqzAyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ddXin6jNlS3BsKkNldVrqAWmCo3SA/z+NmZ7RCb+jyrf9R9Sw8jsrCzX3dgWTIa+E43ebsqXlNRSJcTybV6rsfgecNxmfbVFw/8wimvWrJEGT+UhRmM2dl7i4Z84ALFmBr4+mix/4bhv9sdWw6quIjOtMAbGuZsUz2KtgeAnZfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=187GRk5Z; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51967f75729so8013578e87.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 24 Apr 2024 05:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713961665; x=1714566465; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4l5jZLb/34NM5dMz9g2a72zUgmN/UcICDE4JDkqzAyI=;
        b=187GRk5Z/0YU/NZSmDCUzyWaIqkXszx4MK+5rLBQNmRWun/zLuedYCrQCcOp1Epl62
         t/OTNmtPNlNBh1TAwIhD9CH2hqixQ0OX34hHZOsWa3kB0jYMW1KjLgyVgH8qzVunTmX5
         HTaYCo9q/k78yAxmzud9gRxQBYmMi6mkF6i51jJVmL4CtpyKXqszkeCMnrcFDsW4WcQ+
         luOJwDjo5r8TtCR1FlYhLrhr6B7qIwl5IYcGXkJi/FKWuXfSV7QUvOycmKdXcbI5y7+m
         WeInu9QVbSnQxuJleOO1+GUOSvpEZhwecWiyvhNfakPkKh4Hd8HxbYxltHpDwLmUdFW5
         /7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713961665; x=1714566465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4l5jZLb/34NM5dMz9g2a72zUgmN/UcICDE4JDkqzAyI=;
        b=YTduPON6TaTfdWrFTMpTmRe6R3airslzz/sDmvalqb1ehXnszQYAxOttfj2dxVtw5o
         70pGN0yt3n+KxZWO0KYlOAhS8KR0cYXt6lhQaabkQ+vLqYn8TmfSxt3SDl+YGWC4ZgRg
         YYe7EYUENeWq7BSD9NSR2D8VFS4oEeA1hE9Kbbx/zbheiaDS2VZmpqM+nLYca41FRmIX
         +1dgh+Ah/VQFOrOe6I1HRuNeQdrs4S6Wd/EFsaLW3E5Yv3cc7+pNN3k8Bp+kjAir4wvJ
         wdlLjIPyZE/hA0zCI5gwQQ1dbfPxtritf89XQL/1eQlC9bpuCLHwAZb0JFX5Nkk57DRn
         qInw==
X-Forwarded-Encrypted: i=1; AJvYcCXEVo/KguqaYxnDUwdqP8xtytoQLr+WKuriB/cw2e3LN1pxeKtTGb89q5wBc2nMrqh6qKKhl0P/s3Coz3GZJ2TQ5+ztvmfxXFV2QHuC86os
X-Gm-Message-State: AOJu0YxSOQ1lEZABV7pQiV24G7fhQrWdQ9rOT58JHFoOuXmfwbDJPXov
	cu5DobQwkoFeydfVP3oxtUGdYD5aFSgFh7sxd4kWJG9q8/w+5VNike3CcCLfp9+tLdhYzeKTXhb
	vQZaFLB+ArVBTEwkX3OB7/osldlS5bCIr7UD7BQ==
X-Google-Smtp-Source: AGHT+IEll4Bjei7FceIOjFM3qSQzXFnA3XhBgj9AgK54O0M7JAe5lK4EymcfO4Pheh7hFc4bw9qSPJP/TsvzZdrGOg4=
X-Received: by 2002:a05:6512:748:b0:51a:f255:ade3 with SMTP id
 c8-20020a056512074800b0051af255ade3mr1477665lfs.20.1713961664672; Wed, 24 Apr
 2024 05:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240422130036.31856-1-brgl@bgdev.pl> <99242a7c-53bf-4227-9623-7bc092f564b3@penguintechs.org>
 <CAMRc=MepDwUbAKrWgm0CXKObqy8=igtug0QDgo-CgwxjZCAC2Q@mail.gmail.com>
 <b982b73d-0540-409c-a6e2-0e03ecb11715@penguintechs.org> <0381f39c-38ba-4a2b-915c-f14c5f911eb9@penguintechs.org>
 <CAMRc=MfnEct7ThQhCA3AoY7hxq8j1mmFLNNkK17+RSvJxs67XQ@mail.gmail.com>
 <2371f538-ec53-4037-b171-c62bf4e06eb1@penguintechs.org> <CACMJSeunUaj0cxLaN4MpFmX5vTOx_vnWjBN4Y2FavdQoQxFRkg@mail.gmail.com>
 <4c33304a-5dbc-450a-b874-e04ba9e93150@penguintechs.org>
In-Reply-To: <4c33304a-5dbc-450a-b874-e04ba9e93150@penguintechs.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Apr 2024 14:27:33 +0200
Message-ID: <CAMRc=MeDQFHX9r-sHNxqkfpi=LkHoRSL7i6dWokB-J+J03rBEg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: qca: set power_ctrl_enabled on NULL returned
 by gpiod_get_optional()
To: Wren Turkal <wt@penguintechs.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 2:24=E2=80=AFPM Wren Turkal <wt@penguintechs.org> w=
rote:
> >>>
> >>> That's OK, we have the first part right. Let's now see if we can reus=
e
> >>> patch 2/2 from Zijun.
> >>
> >> I'm compiling it right now. Be back soon.
> >>
> >
> > Well I doubt it's correct as it removed Krzysztof's fix which looks
> > right. If I were to guess I'd say we need some mix of both.
>
> Patch 2/2 remove K's fix? I thought only 1/2 did that.
>
> To be specific, I have applied your patch and Zijun's 2/2 only.
>

No, patch 1/2 from Zijun reverted my changes. Patch 2/2 removes
Krzysztof's changes and replaces them with a different if else. This
patch is a better alternative to Zijun's patch 1/2. For 2/2, I'll let
Krzysztof handle it.

Bart

