Return-Path: <linux-bluetooth+bounces-1480-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DE1841CE5
	for <lists+linux-bluetooth@lfdr.de>; Tue, 30 Jan 2024 08:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62BF81F22825
	for <lists+linux-bluetooth@lfdr.de>; Tue, 30 Jan 2024 07:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E0055E51;
	Tue, 30 Jan 2024 07:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c1ISUHC/"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184AF53E1A
	for <linux-bluetooth@vger.kernel.org>; Tue, 30 Jan 2024 07:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706600878; cv=none; b=AzK8QeYTND2tBgPBBV8JQRn0zs44adan0uYYrHHTJGKDaHJ+jtCAguSg3lfOTEmzuhrQgQ13BTeT2K4aVv+xq68dc81Uppw/DWy6FFn0K4iDnt0yEM96lx1pgqilyDDH1tX1zGJaCgmoQXAs/WT6F1PdKA1BBEcDerIua8l+nu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706600878; c=relaxed/simple;
	bh=fe9RoJ7uIEL7hCMIEw33xQ4RK3TqAFvgh1skAFVlC+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RvlOm3x18k3j0tACfyKIqk5k5DIzsDsvKSuMMsIjjWRFDKPQMFdNBjI6WZCmAW254Fc058taJIK0tlbyhPWjNOuiuHi3WOTaPxfy/blcDrje0DxEBemNxoDXlOrMbKiZEjMDXCOHtEuvbVAaX7x0EednEAFyVg4NbpFx39TDioE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c1ISUHC/; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2cf42ca9bb2so43276101fa.1
        for <linux-bluetooth@vger.kernel.org>; Mon, 29 Jan 2024 23:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706600875; x=1707205675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrrtCIWXL3eiBU/IKZjiGTOMDFzcQj7B56yYFQBrFdY=;
        b=c1ISUHC/CAOMlQULakPGmdjoDYkECksEWpDpMafZBc/2gDLcssChTWGTLpKqQoO0H3
         l7AG4z+4NKSSCwTN5rpfPrtP0oVCRWdA27+AZTQU10+mFDEZ3gUBn0T4fFmubkC8VGzZ
         BpSLVqfc6taYpXNLo+9meQOEVoEFCRpn/PxCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706600875; x=1707205675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrrtCIWXL3eiBU/IKZjiGTOMDFzcQj7B56yYFQBrFdY=;
        b=ZFTqgQNZ4Tt4AeDDvVLH27iknptG/fGCt7tdr+hbjjREBvyk5sXJ4pSd+x0hCGFeyh
         RywouzFwNi7XO3qvyPNNDOzLt4LJTHFMDLiCNSa+4uaoyh7J/x7QoS4GCTZGn/vmJLqD
         iO2+MNFIsTtAFOLu63fMkdZYF0wrF2dtWZAaOxyzZSgky9GcV2kMOLFxbjU88ZQEi2Q4
         wwR1yC9Dmr2cTfaletBq5LBMsc78SjYcyC3a0QYddoXdUtjCA2lAoovL94Yx5V+GXdbT
         nb6EM8k1PSX2Pud9Fr0Z6yF+hKvvfEbZZYKYcis2SDfzeFOOZMyYFf6AHVlknhTyLtsS
         pWsA==
X-Gm-Message-State: AOJu0Yx73NECdYJ5YLkpyC0hfso1kdMpbSllx6G6d1su6hJUrmOMRcB4
	H/9Js1KOMvhtdoFlxi7bmdZTFYuf0lsDC2ctTYhPB1ig5qcptI0TPS2d+7H0VNZ5Jxt9q/nei0m
	MaUvLCt5QvFVT9v6yeED/ACZIFiffkebpPuSM
X-Google-Smtp-Source: AGHT+IFXKjnS+us0d6V3OrZKd3SFgNJjm8Z8sdbBJxjxbvtvtuMmj6Rg5rbxK84S2bRJqhxRvRxcNPSPjSDkjD+diCE=
X-Received: by 2002:a05:651c:b07:b0:2cf:4c49:a8fc with SMTP id
 b7-20020a05651c0b0700b002cf4c49a8fcmr6437489ljr.22.1706600875032; Mon, 29 Jan
 2024 23:47:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126063500.2684087-1-wenst@chromium.org> <20240126063500.2684087-2-wenst@chromium.org>
 <74b9f249-fcb4-4338-bf7b-8477de6c935c@linaro.org> <CAGXv+5Hu+KsTBd1JtnKcaE3qUzPhHbunoVaH2++yfNopHtFf4g@mail.gmail.com>
 <21568334-b21f-429e-81cd-5ce77accaf3c@linaro.org> <CAGXv+5HxXzjigN3Bp96vkv71WfTJ1S2b7Wgafc4GxLmhu6+jMg@mail.gmail.com>
 <a4324473-e0c6-4d53-8de0-03b69480e40b@linaro.org>
In-Reply-To: <a4324473-e0c6-4d53-8de0-03b69480e40b@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 30 Jan 2024 15:47:43 +0800
Message-ID: <CAGXv+5HAqmUizXztMH_nY6e+6oQh01hCtxEJXKtCn3_74-sOsQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S
 SDIO Bluetooth
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 3:37=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 30/01/2024 04:32, Chen-Yu Tsai wrote:
> > On Mon, Jan 29, 2024 at 3:34=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 29/01/2024 04:38, Chen-Yu Tsai wrote:
> >>
> >>>>> +allOf:
> >>>>> +  - $ref: bluetooth-controller.yaml#
> >>>>> +
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    enum:
> >>>>> +      - mediatek,mt7921s-bluetooth
> >>>>
> >>>> Can it be also WiFi on separate bus? How many device nodes do you ne=
ed
> >>>> for this device?
> >>>
> >>> For the "S" variant, WiFi is also on SDIO. For the other two variants=
,
> >>> "U" and "E", WiFi goes over USB and PCIe respectively. On both those
> >>> variants, Bluetooth can either go over USB or UART. That is what I
> >>> gathered from the pinouts. There are a dozen GPIO pins which don't
> >>> have detailed descriptions though. If you want a comprehensive
> >>> binding of the whole chip and all its variants, I suggest we ask
> >>> MediaTek to provide it instead. My goal with the binding is to docume=
nt
> >>> existing usage and allow me to upstream new device trees.
> >>>
> >>> For now we only need the Bluetooth node. The WiFi part is perfectly
> >>> detectable, and the driver doesn't seem to need the WiFi reset pin.
> >>> The Bluetooth driver only uses its reset pin to reset a hung controll=
er.
> >>
> >> Then suffix "bluetooth" seems redundant.
> >
> > I think keeping the suffix makes more sense though. The chip is a two
> > function piece, and this only targets one of the functions. Also, the
>
> That's why I asked and you said there is only one interface: SDIO.

There's only one interface, SDIO, but two SDIO functions. The two
functions, if both were to be described in the device tree, would
be two separate nodes. We just don't have any use for the WiFi one
right now. Does that make sense to keep the suffix?

> > compatible string is already used in an existing driver [1] and
> > soon-to-be in-tree device tree [2].
>
> That's not the way to upstream compatible. You cannot send it bypassing
> bindings and review and later claim that's an ABI.

I get that. I can fix up the existing users where necessary. A proper
binding would make the driver lookup be more efficient as well.


Thanks
ChenYu

