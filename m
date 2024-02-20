Return-Path: <linux-bluetooth+bounces-2021-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AF785BD57
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Feb 2024 14:39:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AAF628560E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Feb 2024 13:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242C06A337;
	Tue, 20 Feb 2024 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OewB+TF4"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173056A33F
	for <linux-bluetooth@vger.kernel.org>; Tue, 20 Feb 2024 13:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708436328; cv=none; b=he3x1I3hWiTlIX6rU0SB4i4fvzj820yyLnInYCbuCV9Oy7S4ediE07bhZTQrvOgCeQl1uT3H7WJMy1M3+n9DDE6/R3dVykuaUYDQoUz/qHBt2A9rsD95fCrxE8xnQvfMwudJn1uK/J9Yu4F8PRyvSrCT8QsAVVNsmJxBa0dDTH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708436328; c=relaxed/simple;
	bh=4WZOopDoEYKpAtwPm5C0A71TU5vL9M5eFHgg+NZQj4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Io5VEFNCDJHFlZJx/SgnMfALx7wK0aab0h85t8C/zRQD+tz1C0x0HVDHDLX2qjOeSCEGvq6m/7gxUgYVzPrA44ZjLFSjRqkaiD+8f9S/zp8fMNYfypjxNXI2kh4nCupqoF15R0bgaeasUrsxUv2eT9lSI3jN4MYQVoS1gUkzdmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OewB+TF4; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7d5bbbe57bbso2191386241.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 20 Feb 2024 05:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708436325; x=1709041125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYWyO9WtNhHDsuk1E/qE9QTBsr5s/M0F3rpI0kzs3Ro=;
        b=OewB+TF498dZFsT/KuZm7ufWPtOwybPSt3hEHvRNDqzwE7m9wAi8x+gaS0uUgHnfud
         8/SW6nylrrsqUBhU0ZtsB6TOqazdzg62hNqvxA2aDSVb+b77OgymP+ZBePaiu/lQf7U7
         CwM0Tv81mVdcqbZyXnn918TFP5SeE5NjqsvlqSPxxPVcyfd9MCVU07zWyaKebJnBfi+r
         3XjsPR6g4dCr8qTZVwmFGb2k1W6EqgX9wFpMpydW/d1Ctd6HSMfKItoj+uOqE7WpE3pA
         gerrJlMLDgdfzRCMVtKLS8OUfDTGb7H9E+JgXoL9v/qxxi4fb/zZQ394shf/+HJurLEU
         Yrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708436325; x=1709041125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jYWyO9WtNhHDsuk1E/qE9QTBsr5s/M0F3rpI0kzs3Ro=;
        b=Cmf+0ozXiSlBJRJQag/uzgoDJKECyk9fvhMppWquCK1NhQqNR/LNhxm2Vd0AJcuMMw
         aM9P/MCQT0qV9m6KUgJ4yUFsgp0LpxFgzMeYLjTiemzxfRDWbd/e96yoks2f74NCzoWC
         F6dSxBHKNhTsHtUG9RGb6LyXpkXk7JGj0BvzH9pxTJm+bEin07VYzmuGAie0xhLhAHQ2
         vxLKVOgXc25SCnK3UrQVViSePZehOJJWk2DcUZLgHzFEY6IndN9TdDCDgPJa9d8DKSs6
         nwvSxloUpfQGe5o4L+MYCYBjOuG7Vou+VUgxjCzb1yuC2CH+AI+w6SzLjrI7A9TTndhh
         ic9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMPfiy77bRJP3xkSl8m8Ft1hS3IYbtYHHvM38u5PCoUJj4lgBLhahJqQ73zY97bTCQ0d2J0NJrddE/I8tiWsx8vFqOZag4q97lQrr2ztHj
X-Gm-Message-State: AOJu0YyL+QF9LbjFS8d06XOM/ERUakUFvUwju0keZ6hNHJ3S021Iz80X
	xuzOgluvULT/V2dl7lUg7ZhPwyPhJYSoz/PeWHxoJ31qSYF9lHZBUsoKlwx2mUPz8DxE2pZtGQ7
	mpFLs2JjmJTKKQnU2CfWYuEVOEyTjNIjbm9uchg==
X-Google-Smtp-Source: AGHT+IHez508i8rKwFXJLq+MmlnYcRFhCJXklYpkOKtPALfYGVznxIgsQEekDscIKGhR2FGP8107Do5jDZq7aOpexmY=
X-Received: by 2002:a67:fbcb:0:b0:470:3ece:b431 with SMTP id
 o11-20020a67fbcb000000b004703eceb431mr5233751vsr.4.1708436324939; Tue, 20 Feb
 2024 05:38:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216203215.40870-1-brgl@bgdev.pl> <20240216203215.40870-10-brgl@bgdev.pl>
 <48164f18-34d0-4053-a416-2bb63aaae74b@sirena.org.uk> <CAMRc=Md7ymMTmF1OkydewF5C32jDNy0V+su7pcJPHKto6VLjLg@mail.gmail.com>
 <8e392aed-b5f7-486b-b5c0-5568e13796ec@sirena.org.uk> <CAMRc=MeAXEyV47nDO_WPQqEQxSYFWTrwVPAtLghkfONj56FGVA@mail.gmail.com>
 <5a3f5e1b-8162-4619-a10b-d4711afe533b@sirena.org.uk>
In-Reply-To: <5a3f5e1b-8162-4619-a10b-d4711afe533b@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 20 Feb 2024 14:38:33 +0100
Message-ID: <CAMRc=MdTub4u0dm5PgTQPnYPuR=SRnh=ympEZqo_UyrQDrQw6w@mail.gmail.com>
Subject: Re: [PATCH v5 09/18] arm64: dts: qcom: qrb5165-rb5: model the PMU of
 the QCA6391
To: Mark Brown <broonie@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
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

On Tue, Feb 20, 2024 at 2:31=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Feb 20, 2024 at 12:16:10PM +0100, Bartosz Golaszewski wrote:
> > On Mon, Feb 19, 2024 at 8:59=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
> > > On Mon, Feb 19, 2024 at 07:48:20PM +0100, Bartosz Golaszewski wrote:
>
> > > > No, the users don't request any regulators (or rather: software
> > > > representations thereof) because - as per the cover letter - no
> > > > regulators are created by the PMU driver. This is what is physicall=
y
> > > > on the board - as the schematics and the datasheet define it. I too=
k
>
> > > The above makes no sense.  How can constraints be "what is physically=
 on
> > > the board", particularly variable constrants when there isn't even a
> > > consumer?  What values are you taking from which documentation?
>
> > The operating conditions for PMU outputs. I took them from a
> > confidential datasheet. There's a table for input constraints and
> > possible output values.
>
> That sounds like you're just putting the maximum range of voltages that
> the PMU can output in there.  This is a fundamental misunderstanding of
> what the constraints are for, the constraints exist to specify what is
> safe on a specific board which will in essentially all cases be much
> more restricted.  The regulator driver should describe whatever the PMU
> can support by itself, the constraints whatever is actually safe and
> functional on the specific board.
>

Ok, got it. Yeah I misunderstood that, but I think it's maybe the
second or third time I'm adding a regulators node myself to DT. I'll
change that.

> > And what do you mean by there not being any consumers? The WLAN and BT
> > *are* the consumers.
>
> There are no drivers that bind to the regulators and vary the voltages
> at runtime.
>

Even with the above misunderstanding clarified: so what? DT is the
representation of hardware. There's nothing that obligates us to model
DT sources in drivers 1:1.

> > > > the values from the docs verbatim. In C, we create a power sequenci=
ng
> > > > provider which doesn't use the regulator framework at all.
>
> > > For something that doesn't use the regulator framework at all what
> > > appears to be a provider in patch 16 ("power: pwrseq: add a driver fo=
r
> > > the QCA6390 PMU module") seems to have a lot of regualtor API calls?
>
> > This driver is a power sequencing *provider* but also a regulator
> > *consumer*. It gets regulators from the host and exposes a power
> > sequencer to *its* consumers (WLAN and BT). On DT it exposes
> > regulators (LDO outputs of the PMU) but we don't instantiate them in
> > C.
>
> Right, which sounds a lot like being a user of the regualtor framework.

Ok, I meant "user" as a regulator provider but maybe I wasn't clear enough.

Bart

