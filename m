Return-Path: <linux-bluetooth+bounces-3972-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC668B0955
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Apr 2024 14:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 969F3289558
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Apr 2024 12:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DC915B977;
	Wed, 24 Apr 2024 12:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZBhL14Kh"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD44B15B568
	for <linux-bluetooth@vger.kernel.org>; Wed, 24 Apr 2024 12:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961450; cv=none; b=tDavH/W95AtDx3pQclRIPehSbYu2VxXcwlaLQ9K7O9qdnTxlX1x/IhLWrO9slCobMIw077NEhVW4TW1S7MexQAEKbrt6ZCjAJDvEf+Th/g2941V35sZ4/CJj4Ae0D3LWE8XZmEbm9BEyFS0xxc0dZ8UCQ6FzmaJwHc/TkjGL2j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961450; c=relaxed/simple;
	bh=xkpmZvyTfHixCtX+t/n6zmsXjcy6VJHSizSG8yiH3B8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qY7TKBTfjcgcrubx8rbBFp4jyYmVAEFqJBNKO72/uiFUoA67XeqSNhlGAy/qNYbj+PPQxoulJnrEbcI6UtJZUfKlEZ+SMd9XXc9F33/Sa3S6+TLwDu2Db/SqgEiF/bi1XgJfBDeLRA1N06NdtYi6ro42uQpgOuY6dsrw3D5GI4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZBhL14Kh; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5193363d255so9018228e87.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 24 Apr 2024 05:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713961447; x=1714566247; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkpmZvyTfHixCtX+t/n6zmsXjcy6VJHSizSG8yiH3B8=;
        b=ZBhL14KhcDK1oNa2ImekiyYMxdjh+EOTvL5haCFTPGx12t50AorHPttMIVd0nv8enu
         0jUBir99S0mi7Gs3vvYhzyGeMT0HVCaFv4McFh0mIoS67It12OPdNvlyan9L0UEstEqQ
         aFqJLqWBCYw1aEhRdgcolHan9Oqu3K4A1zyYD3HeKKzobrg15pmMOXIGbeE4wC9jcMSS
         G1L5rJgRLYZKmEEGUEmYqPbfiYhdqyXzt0LCuZ3bcCjm685xixfEDhIfXa+FRLlIGc+6
         ofSApGZJ3kOjVAtc9VyA0PCsaPkbnHEl+pTdUiPPMUghJlShdJ9MshF9ue3X9bIrGFMT
         oOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713961447; x=1714566247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkpmZvyTfHixCtX+t/n6zmsXjcy6VJHSizSG8yiH3B8=;
        b=Vfzre+lLNJjiUDVeiEfDlAnVbRQPTjtntIIaL9hczqrKm6DM3EoVvTuQI5csPVrVLC
         Q4tnyklQM8P0PE8A0RmEC8CwgbPyYmQUWJEugYuvwv2BRLHXE2BhIXh5mmkYsyO4LaUN
         9a8iSRLGTup79JHGlc+jCAKo4yHMiFjC3Q4Oe/zSXp4V3MpBuOYdMspIXfIdZQXR2nCJ
         8fIRyM2MJNaUbPOtoPPUbfZkJ6nGrmpVlrVvVxlLiadM1RFluoK7CvqgEKlwFQcvI/Y9
         QreEePgyPXIu7P7dB7HP08agd4t4567aeqQHq10ALEQDL+b8VxkkOQCGhMxRtx+Jmha2
         803w==
X-Forwarded-Encrypted: i=1; AJvYcCWmB02OuBrVv/Ge5tF9Q89T3pOAI/G3+vvppg8xZCO4dckKB6xsWCNdq8Dt4bcivbCvOQhuRF7jDmjAt1i+SDr2wsWvo59sdp1WaUZwyXHc
X-Gm-Message-State: AOJu0Yy+KPsHzvMLycopGT9/1oIXPvPbdOwbSOKeQf4lNlYi+yrsKq5I
	MeRU2b4vrwodVVVNVJMmLeberVQSUhiCQFy4TjqMEfWLhAnvEzpsvSDADprxe3+AtWYkntr3bah
	q0SMIAZBb529VzGPI4spE7TWDCODCZI1ODC8QAw==
X-Google-Smtp-Source: AGHT+IFOeBZePCP+f0xM90P2Lnt+nsICvvd6CG+PexnWGNvAxYibGYTtsSwBuAMSnd5Ork/hdXeJjk5eFwi8uDscPD0=
X-Received: by 2002:a05:6512:3e8:b0:51a:ca97:7e93 with SMTP id
 n8-20020a05651203e800b0051aca977e93mr1537595lfq.25.1713961446936; Wed, 24 Apr
 2024 05:24:06 -0700 (PDT)
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
In-Reply-To: <CACMJSeunUaj0cxLaN4MpFmX5vTOx_vnWjBN4Y2FavdQoQxFRkg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Apr 2024 14:23:55 +0200
Message-ID: <CAMRc=MeZh6YugXtDeF=nuwmpW5qvmHLt+g6S3Guoome7mz2xyA@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: qca: set power_ctrl_enabled on NULL returned
 by gpiod_get_optional()
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Wren Turkal <wt@penguintechs.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 2:20=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:
>
> On Wed, 24 Apr 2024 at 14:17, Wren Turkal <wt@penguintechs.org> wrote:
> >
> > On 4/24/24 4:56 AM, Bartosz Golaszewski wrote:
> > > On Wed, Apr 24, 2024 at 1:53=E2=80=AFPM Wren Turkal <wt@penguintechs.=
org> wrote:
> > >>
> > >> On 4/24/24 4:16 AM, Wren Turkal wrote:
> > >>> On 4/24/24 2:04 AM, Bartosz Golaszewski wrote:
> > >>>> On Wed, 24 Apr 2024 07:07:05 +0200, Wren Turkal<wt@penguintechs.or=
g>
> > >>>> said:
> > >>>>> On 4/22/24 6:00 AM, Bartosz Golaszewski wrote:
> > >>>>>> From: Bartosz Golaszewski<bartosz.golaszewski@linaro.org>
> > >>>>>>
> > >>>>>> Any return value from gpiod_get_optional() other than a pointer =
to a
> > >>>>>> GPIO descriptor or a NULL-pointer is an error and the driver sho=
uld
> > >>>>>> abort probing. That being said: commit 56d074d26c58 ("Bluetooth:
> > >>>>>> hci_qca:
> > >>>>>> don't use IS_ERR_OR_NULL() with gpiod_get_optional()") no longer=
 sets
> > >>>>>> power_ctrl_enabled on NULL-pointer returned by
> > >>>>>> devm_gpiod_get_optional(). Restore this behavior but bail-out on
> > >>>>>> errors.
> > >>>>> Nack. This patch does fixes neither the disable/re-enable problem=
 nor
> > >>>>> the warm boot problem.
> > >>>>>
> > >>>>> Zijun replied to this patch also with what I think is the proper
> > >>>>> reasoning for why it doesn't fix my setup.
> > >>>>>
> > >>>> Indeed, I only addressed a single issue here and not the code unde=
r the
> > >>>> default: label of the switch case. Sorry.
> > >>>>
> > >>>> Could you give the following diff a try?
> > >>>
> > >>> I had a feeling that was what was going on. I'll give the patch a s=
hot.
> > >>>
> > >>> wt
> > >>
> > >> Considering this patch is basically equivalent to patch 1/2 from Zij=
un,
> > >> I am not surprised that is works similarly. I.e. on a cold boot, I c=
an
> > >> disable/re-enable bluetooth as many time as I want.
> > >>
> > >
> > > Zijun didn't bail out on errors which is the issue the original patch
> > > tried to address and this one preserves.
> > >
> > >> However, since this patch doesn't include the quirk fix from Zijun's
> > >> patchset (patch 2/2), bluetooth fails to work after a warm boot.
> > >>
> > >
> > > That's OK, we have the first part right. Let's now see if we can reus=
e
> > > patch 2/2 from Zijun.
> >
> > I'm compiling it right now. Be back soon.
> >
>
> Well I doubt it's correct as it removed Krzysztof's fix which looks
> right. If I were to guess I'd say we need some mix of both.
>
> Bart
>

Anyway, these are two separate issues. Let me send a v2 of this one to
address at least one of them. I think Krzysztof will be better at
fixing the other one as it's his patch that caused the second
regression.

Bart

