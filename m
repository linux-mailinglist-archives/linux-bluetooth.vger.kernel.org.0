Return-Path: <linux-bluetooth+bounces-2585-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5176A87EAB4
	for <lists+linux-bluetooth@lfdr.de>; Mon, 18 Mar 2024 15:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C91A284CDF
	for <lists+linux-bluetooth@lfdr.de>; Mon, 18 Mar 2024 14:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43A34DA0B;
	Mon, 18 Mar 2024 14:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vWIN4beV"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FC94AEF5
	for <linux-bluetooth@vger.kernel.org>; Mon, 18 Mar 2024 14:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710771458; cv=none; b=VKyaCvvp8Tvnby5oWTZ4K6rn5WsiqIhlZDK7lv79z1vvKruxb+CIIH8XQiMbu2Y3PGu8bZ/7c7E4/mSbEkTx5Nf0UMb9idacFrbQQbdA4YCy3iC7N+jKLX8HZv/AhfyrAVeJ9XWaghI6jnB8AkUv5FsazbRSnYyzx4i+J5JcWqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710771458; c=relaxed/simple;
	bh=ikAlB86gpifveSTewS4ZULYqijKVqVlt49o5eZKo3y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTh/YlIkdrt7Uh1xw0KeZesnhPqTaOmwxgDTQkrJ5pSPIg4muVt254rHdVWQNy5QPSBOjeGWki1fCZOPgwpyYc0HtV7ksMKm3+V2I+80UoS3avsGuFivtPNPDCeuXqCDic1hhbhS3R4tT2YRSczowdOq+bAXqE38AX4n66ERkfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vWIN4beV; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso4021531276.3
        for <linux-bluetooth@vger.kernel.org>; Mon, 18 Mar 2024 07:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710771456; x=1711376256; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TzlwcHj9rzlTdK+4b+F6n+PcRBRh+2MYpTcgzzeZa60=;
        b=vWIN4beVKFs+72BEslEjqeLxlIPWUsFeKXJQjR8FFYh7UkfVka3EzjU1yhq9K9Vbha
         r3A4c8oAAGABlOwDTzcTN4locc7oa214sPPPOd5SXmeu7eGPgQp3d/RTE0O/0IelPNE7
         MawCkYxLVSOkHuPsJvjF0fqr5FiO+WQ9RdPd35gknoRAoW6BEiHU4viyP1x7tI5qS54U
         OrLtvnyJHcQxB530COO/MnjjVdZDdxrx2xtSlARayxqlmszcs8m+m1HC4ve5QKZ3k8r3
         69mU74w1Svrv/2R0SjnYv/LlZWCdJC2MNU+jn85hf6fx+nMsNhVke04flBFg3HjjLnWL
         a4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710771456; x=1711376256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzlwcHj9rzlTdK+4b+F6n+PcRBRh+2MYpTcgzzeZa60=;
        b=toP7lgL8ZS6ZVIz3lUz0wQvgR3BiDGfYUTbHaEWvGtrATd8Jr7OhwA6bsqoswf7E2C
         l6gL5R31t30SNjrWgU9eGFgOMsaYsZWeIvoT/m+BBoQTmIKSKnv+SFhdsXl598+uNjZi
         4m39x0GOd1A/Sp8FkES19CZqhjdAt0Amd1r+EktG2bISuSsBqDkuL0mbyg0quL6R2H2E
         ejjZb/Q0BFyomucUb+zFeX7ptWjJP1cAAITf2FQlf26jFlc5qgibl9V80EYiilyMjOxe
         sO87Tn9hK09DjlQr3u3QXHgn1YGMIDeshZGTF0OlKM6uOZ4CV+Wlgoj+36dyI3sbe/s6
         yhbg==
X-Forwarded-Encrypted: i=1; AJvYcCW1cXDkycDpXKst5X4+e/Sfcqh6bqdulKi62yW1yEwdvZaZezLrArilszYhCeyGJ8/CdnvTpDsZPTuM5sseAfvn2FOKdZHlYPOrX7baikEy
X-Gm-Message-State: AOJu0YxW84vFMwA35zgHwOhJx3mafqZjZfBUK3HxKX5fiJcOcnZe6IOZ
	mWYC0z7Ro81xYpVMk4RnRhgMtQtltkwMHoMzSWw0C5Cmb/mHVu8ZJYHzP//cDdlp9cC8iSlWv0W
	A4lGxh5FkeorZtp2Yrurw1VBfatVb/rXFFklIjg==
X-Google-Smtp-Source: AGHT+IEg0K4vqskZLdSXL1XoDTQnXJtUP7LU4A0/ukD+ZZv5YFEKOUiK5+NKtoU9LiEirCb1HWMQxLx8ot6J6toV9gk=
X-Received: by 2002:a25:a02a:0:b0:dcb:f7b0:4788 with SMTP id
 x39-20020a25a02a000000b00dcbf7b04788mr9079471ybh.60.1710771455547; Mon, 18
 Mar 2024 07:17:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318110855.31954-1-johan+linaro@kernel.org>
 <20240318110855.31954-2-johan+linaro@kernel.org> <CAA8EJprywWbdoyfAbys=0WzEdAkp0UK1fzzCPzxKRjyk9DrC6Q@mail.gmail.com>
 <Zfg--2_NMPSPTxK-@hovoldconsulting.com>
In-Reply-To: <Zfg--2_NMPSPTxK-@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 18 Mar 2024 16:17:24 +0200
Message-ID: <CAA8EJpoxq6__DMcsuAEsnxBfPrrQBuu4ZgfULkok4KWSYVxuHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: bluetooth: add new wcn3991 compatible
 to fix bd_addr
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, 
	Doug Anderson <dianders@google.com>, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-bluetooth@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Mar 2024 at 15:17, Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, Mar 18, 2024 at 03:00:40PM +0200, Dmitry Baryshkov wrote:
> > On Mon, 18 Mar 2024 at 13:09, Johan Hovold <johan+linaro@kernel.org> wrote:
> > >
> > > Several Qualcomm Bluetooth controllers lack persistent storage for the
> > > device address and instead one can be provided by the boot firmware
> > > using the 'local-bd-address' devicetree property.
> > >
> > > The Bluetooth bindings clearly says that the address should be specified
> > > in little-endian order, but due to a long-standing bug in the Qualcomm
> > > driver which reversed the address some bootloaders have been providing
> > > the address in big-endian order instead.
> > >
> > > The only device out there that should be affected by this is the WCN3991
> > > used in some Chromebooks. To maintain backwards compatibility, mark the
> > > current compatible string as deprecated and add a new
> > > 'qcom,wcn3991-bt-bdaddr-le' for firmware which conforms with the
> > > binding.
>
> > This compatible doesn't describe new hardware kind. As such, I think,
> > the better way would be to continue using qcom,wcn3991-bt compatible
> > string + add some kind of qcom,bt-addr-le property.
>
> No, you can't handle backwards compatibility by *adding* a property.
>
> I wanted to avoid doing this, but if we have to support Google's broken
> boot firmware for these devices, then this is how it needs to be done.

One hardware compat string per hardware type.

-- 
With best wishes
Dmitry

