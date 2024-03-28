Return-Path: <linux-bluetooth+bounces-2872-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4293288EEB7
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Mar 2024 19:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A14ED2A4093
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Mar 2024 18:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1013414F9D4;
	Wed, 27 Mar 2024 18:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="k+GzYoMN"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D9E14F9CC
	for <linux-bluetooth@vger.kernel.org>; Wed, 27 Mar 2024 18:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711565785; cv=none; b=tpXp/MDOpUTNfvvYDLFvVowUlXanuR+HkBMhPQSpGCeD83ySm8o0lTotydnv++s/MOZuiTpkzkbfkPAnU7N3r1hiBq463OkE1IjnZegfdRRRpS3msEYOqtPMkbxRAyEvz10ckiZPsCM96alxF4XwGJQrio1/LG1v/7Gb0+D6MDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711565785; c=relaxed/simple;
	bh=4NcW9kjQzz+4rxkmVWvO3SDYc5HCNpy2e5LNejNHhtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=epJyuUZ1W0O7n7bb/miU3QpsrusEQH/kJoivxiZ0f7JvqCmWvA7DSlTDCp5G+QrS4iEuEuBMpZzw+CMn7WRXlJo+59E8HOA5PK2xJ2PdM9XmLq4LgE0lclqnBHsWBCyEl37bTH4SrwFTgmLn5UbIcw2cMDzXMXyahLgKBPtCyyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=k+GzYoMN; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-515b69e8f38so69224e87.1
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Mar 2024 11:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711565782; x=1712170582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l22hpajQYrTCvXSZPoe2VYkKnBi8J9PfZ646Pjp2W30=;
        b=k+GzYoMNF+LcVXBmiHcmrFB4dZFJNgouhgKcpQvZW0IdaI7TRkIBxVVfis7Xf6/YgV
         i+cxoTNndWJGoWXc8oNFRXMWAxQJ/skQNhUIvkHYB1NHmCBgDN+yxTad5sBUPb+4uWUR
         98y1M0cJGM+XwXEkKF8reiwDzWclpLd5qDXD64sgPy0URIHowh3ALJy4fgAYb56FmxX6
         Xlpg74waxdIpybanX+ddeb25ROMy1YHi2KDtqerIB1Rok6jFWGgieaoXtCUUBGAYpEeb
         gDIo45RdX2dT1mltKpiLiyWloSc6W5lUBq2LXZ/LjbwvpONUK2yw+ZH5jG0SimlbiNtv
         HoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711565782; x=1712170582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l22hpajQYrTCvXSZPoe2VYkKnBi8J9PfZ646Pjp2W30=;
        b=beXqbV/ALnAfL5d0S1S9ljFFCnJiUKfzrduhJs6cJiKtzuzkbZ3dnEs6EEzxKGFPGD
         h24Ke2Gd+q4HeCCUVC3cQFG+wsqrovnvz+IQAkxYGycKlEarn+Hf82qmOcCrmptPQav7
         dyeCprT4y5KawY6I+pHBHpXbE1zgO5UScJy6rlDyg42UJRtqr9aSjftLn7MdYi4broCW
         Zxeca3jUMwn1Rt5oaKbQvn3W1MwXuwKBVwTK1bI8Ca/GsQKs5hxNCYTMKe8C8fjbdgmG
         3+XyWLpznBzc6MF7Z3KWggJAOEDBFqS1sbnGFOPZsiGeL25otqRf5E22VUVkdW0de0rm
         PNKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnCN9hZ2fTaS4LModF/oj+bvAyfs+USH2fLL2a3ApPrNa2TIoLJeenGyQuxT1w5WInjwo58N5fAv2NybMYYdLW0w58euYhVtQ8z9QM6HpS
X-Gm-Message-State: AOJu0YweAqMhrMiRLR1CB5E1V1J3vAx39KgY0YV6/Z4C433t7yatGBO4
	es8anCkyhMJQYJpO8+1BuSGWZ8T3A7RpDNhPO1WWH0IXLH7gjB8Spg64tdLYE5NfmRs5wH44BnK
	QpvlVSKGb944gY+/fIPXxYZP1BPVk8SFbjc5bgA==
X-Google-Smtp-Source: AGHT+IHKydle8I12XQm1CXJCoOY/EXeZTUxgXyi6L8xBSnmh4cSMTwhyhLVJE5IgeGuedARFVJZKgD+gbga9ggLr/Og=
X-Received: by 2002:a05:6512:60a:b0:513:9b96:a954 with SMTP id
 b10-20020a056512060a00b005139b96a954mr200564lfe.68.1711565781942; Wed, 27 Mar
 2024 11:56:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325131624.26023-1-brgl@bgdev.pl> <20240325131624.26023-3-brgl@bgdev.pl>
 <1614af1c-330d-49ee-aa22-a19de866862e@linaro.org>
In-Reply-To: <1614af1c-330d-49ee-aa22-a19de866862e@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 Mar 2024 19:56:10 +0100
Message-ID: <CAMRc=Mf3eVc2iJxdkSMgeLFU0rCVnwOQ_mg=fj=uOxj01e5yNQ@mail.gmail.com>
Subject: Re: [PATCH v6 02/16] regulator: dt-bindings: describe the PMU module
 of the WCN7850 package
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Saravana Kannan <saravanak@google.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
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

On Wed, Mar 27, 2024 at 7:19=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 25/03/2024 14:16, Bartosz Golaszewski wrote:
> > +    then:
> > +      required:
> > +        - vdd-supply
> > +        - vddio-supply
> > +        - vddaon-supply
> > +        - vdddig-supply
> > +        - vddrfa1p2-supply
> > +        - vddrfa1p8-supply
>
> I assume vddio1p2 is not required on purpose.
>

Correct.

Bart

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
>

