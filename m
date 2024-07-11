Return-Path: <linux-bluetooth+bounces-6125-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1AB92DBA5
	for <lists+linux-bluetooth@lfdr.de>; Thu, 11 Jul 2024 00:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 389C71F270D3
	for <lists+linux-bluetooth@lfdr.de>; Wed, 10 Jul 2024 22:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3E714AD25;
	Wed, 10 Jul 2024 22:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lwCPatGc"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC8F1465B1
	for <linux-bluetooth@vger.kernel.org>; Wed, 10 Jul 2024 22:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720649303; cv=none; b=sWfA38CrjL0Nx3t8jSJLjrtJamRYCL9wxnJbUUIFJolTOkzsr0Iex7BsGdd7iyqJGOCN9H/Gqjo27Y7ZZB6iGChYXMBlY+B0z5uJKWq3ElxAjQvvErRenCT9FE5ff3lJLHdHSrNHZAEDe8/2x9bzyNANvI3BAzGZO6vGYK/2KuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720649303; c=relaxed/simple;
	bh=dzOLJpFyieQl7kksJPwjcpnbe7AKqyPC/fUWFO7I6TY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q8+oQK7L2kdTBJoJ1h1mKecBgXWPg8mq8MylX9HIggcJXNhqRXUsZD2fIOD1/yemRpmZqt0oXllOK7ZvVGUik3PLAAdInwojT12KYDcovPTSG2Y7ZidP0dz/DL7V08F2+4jIAXAPQ+ZFisZEzh2mib4ulAQgl6GEPPAMTYlNIWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lwCPatGc; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so3068521fa.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 10 Jul 2024 15:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720649299; x=1721254099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IbyAVC5whDcTrfC0f+jOeAkJG6+z9GUKk1zNJj92TQw=;
        b=lwCPatGcQxe+wDMwNtcBtnz+Brwi29I16ZfR+pZMjB25AzhGqSdenxIsy1WJieZ4uv
         x1nEncoMOtHjmCHlmB/rMReuY6Wre/M13QsXHoz2DZsXGXYUzrD6BqXDy4TNNmbFwOYd
         8Z7AYZiOEo3awTKUz3BPTNdx40RI9FG2mNNEXbkebudXtgdAtW4mgxavEbjmTBchqnvG
         b/exIrXiPfMaDHN0DpeStfMpzjRXQOIftFK3GjN8JCZv/o1RpZG2oS4wDyauxvg2Tk0U
         RyjavS7R8O3jmncaDalVdIQEZdfw/pMWVVsoUliqAnYbM5BJw6BLOgprAbiliyghHiOa
         7scA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720649299; x=1721254099;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbyAVC5whDcTrfC0f+jOeAkJG6+z9GUKk1zNJj92TQw=;
        b=YW23kGxFT1IQmCfr3Rwan5NCI8QA+nlZ+HKxE+pwDQXw0MUUasHlvqZqXm0HNjZSj1
         /Pd1Ud8XOsksdjXK9VtA+4mvhBsDcuHEhNXDuw0CBh0hX1b74CmTzw/XbWfZ2NqNOr1p
         +poZGQiNHHXnY5SRR+EysSP6ewlIOH2uGniiRnpqAdGvBHAog7LAx0zFaa80FjlpCcgs
         Dz9X019Ctwg1NEP3mjVvcVB1cYt/Aq1HnutChRNHLvkZLEa0l+EMfPoT+xQ/OdinRwUo
         3qdj5XBfZZCN/RhaavZqnTR2ncvXLq4ZlAkYxeEMSttom/26heOM18nnbcSb0Gp2CTO0
         BuAA==
X-Forwarded-Encrypted: i=1; AJvYcCVka9HfCdIPRToEHtOtcTnEVqoyecxKtS70gLsbS4y51zZT/Qt7OROSX0edZUP8uEIBhqL4TM4oqlJc1GQKvxfdPRSTSpToaekueyc/XS7Y
X-Gm-Message-State: AOJu0Yz7k9liqrawUhyHYER+WyEgcu5Tf4Ducrx/rfJ9AEHx54Z5Ysmy
	/6jtBx92O56mh+xvhxy00Bn58PFucIBqQJdhxOhB6pneEJ7fUtjwEoBiZRXlf1s=
X-Google-Smtp-Source: AGHT+IEA6hboE4ANnrmdhtPnPW83+HWCE5AxVYj933A9tcXvMgs+IAOcjdkaTD850mZDlEWXc6meOg==
X-Received: by 2002:a2e:99d1:0:b0:2ee:8566:32cb with SMTP id 38308e7fff4ca-2eeb30e45a8mr54224841fa.16.1720649298383;
        Wed, 10 Jul 2024 15:08:18 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a8561cfsm193900166b.163.2024.07.10.15.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 15:08:18 -0700 (PDT)
Message-ID: <05ae1a45-107e-4d01-9cfe-648b52cbb364@linaro.org>
Date: Thu, 11 Jul 2024 00:08:14 +0200
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Bluetooth: hci_qca: use the power sequencer for
 wcn7850
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 patchwork-bot+bluetooth@kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, marcel@holtmann.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_bgodavar@quicinc.com, quic_rjliao@quicinc.com, andersson@kernel.org,
 linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, bartosz.golaszewski@linaro.org
References: <20240709-hci_qca_refactor-v3-0-5f48ca001fed@linaro.org>
 <172064103479.11923.11962118903624442308.git-patchwork-notify@kernel.org>
 <CABBYNZKvSF9h1K29oex3kXm+2h+62gwJ8+YJPM0Orap6_xVDTQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CABBYNZKvSF9h1K29oex3kXm+2h+62gwJ8+YJPM0Orap6_xVDTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.07.2024 10:43 PM, Luiz Augusto von Dentz wrote:
> Hi Bartosz,
> 
> On Wed, Jul 10, 2024 at 3:50 PM <patchwork-bot+bluetooth@kernel.org> wrote:
>>
>> Hello:
>>
>> This series was applied to bluetooth/bluetooth-next.git (master)
>> by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:
>>
>> On Tue, 09 Jul 2024 14:18:31 +0200 you wrote:
>>> The following series extend the usage of the power sequencing subsystem
>>> in the hci_qca driver.
>>>
>>> The end goal is to convert the entire driver to be exclusively pwrseq-based
>>> and simplify it in the process. However due to a large number of users we
>>> need to be careful and consider every case separately.
>>>
>>> [...]
>>
>> Here is the summary with links:
>>   - [v3,1/6] dt-bindings: bluetooth: qualcomm: describe the inputs from PMU for wcn7850
>>     https://git.kernel.org/bluetooth/bluetooth-next/c/e1c54afa8526
>>   - [v3,2/6] Bluetooth: hci_qca: schedule a devm action for disabling the clock
>>     https://git.kernel.org/bluetooth/bluetooth-next/c/a887c8dede8e
>>   - [v3,3/6] Bluetooth: hci_qca: unduplicate calls to hci_uart_register_device()
>>     https://git.kernel.org/bluetooth/bluetooth-next/c/cdd10964f76f
>>   - [v3,4/6] Bluetooth: hci_qca: make pwrseq calls the default if available
>>     https://git.kernel.org/bluetooth/bluetooth-next/c/958a33c3f9fc
>>   - [v3,5/6] Bluetooth: hci_qca: use the power sequencer for wcn7850 and wcn6855
>>     https://git.kernel.org/bluetooth/bluetooth-next/c/4fa54d8731ec
>>   - [v3,6/6] arm64: dts: qcom: sm8650-qrd: use the PMU to power up bluetooth
>>     (no matching commit)
> 
> Last one doesn't apply so you will probably need to rebase or
> something if it really needs to go thru bluetooth-next.

Bartosz forgot to mention it should go through qcom

Konrad

