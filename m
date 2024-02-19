Return-Path: <linux-bluetooth+bounces-2006-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F149085A9BD
	for <lists+linux-bluetooth@lfdr.de>; Mon, 19 Feb 2024 18:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7CB3287377
	for <lists+linux-bluetooth@lfdr.de>; Mon, 19 Feb 2024 17:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6FD44C7E;
	Mon, 19 Feb 2024 17:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hqQqDI3U"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F48C446C9
	for <linux-bluetooth@vger.kernel.org>; Mon, 19 Feb 2024 17:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708363115; cv=none; b=HJsdZOAVfRIBSmtOJR9Yv++RR1ODzm2SHL82wStogRE+Oogd2Arg/34yPWpgixwGZC25rfNJvEEXLPFL5gzi1roEoKPTDCbRCgJZGyZGV8C/Smi02Am4kPtc+9degvl4ZpUCTowPz7yoHDNBlcD8cwLpv3MrPRkmLYjEpF3CD98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708363115; c=relaxed/simple;
	bh=YtBsaUyY/Wb1P24PhdovpdBvyLf28UKpe0gDT+2Ldzs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=W+zX/AuWKzIodb8JKVvQSxdLWAxfE6thZjg2ycXOoObskl1oHFyfRfaCuZ37qeh3QoU0KEU0IGoaYwx4Tc/SUQAQSrD6Fk8GyzgGLut6D2DU2DevnB2O/iS1TASF09tytGnY3crBOLBMf0wHL0/coFuFDZkBDbGHZTiTMa286Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hqQqDI3U; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4126cff604bso334555e9.3
        for <linux-bluetooth@vger.kernel.org>; Mon, 19 Feb 2024 09:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708363111; x=1708967911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7kZlLXHS08bcdnhY94K2kbmvHbCpRcAmjuD4rUAeN0=;
        b=hqQqDI3UTvqcM1op56C6Rxsqy2oUu2x4TlZ1k0D/AcnXfFRlvHXlixoiL09wHuY+1K
         KifV4Hj16GRpLJvi0BOxcXIq4CnWM+xP6YQUHKmBCnO7RE2i5IeI32xKsYbaQNd2b1d1
         6SdFADJUGBsRib9RmIJVut+ivdi7b1r/F5pQI5XzvCjmj11XUnmfPv8x6/qDKQE/DAI5
         RH8pNs4O2znG2C3/Nk7P5yKvbyRYz4mAqc4FvTQwDnYzsesCth2md4HFGFE4woDwJUXZ
         DSCzXRT0gCrNvnEBxcUl3c+yV54GhP1tmfaI7CGTfgLR2/xAkzJRpoxj1z706POhjtCK
         JnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708363111; x=1708967911;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u7kZlLXHS08bcdnhY94K2kbmvHbCpRcAmjuD4rUAeN0=;
        b=CYNjktHlrB2jlp2oau8zacJpjBtjbytuTy9r89VZ3QRKAnADFaQb8rFfhOIFCdb1F5
         y0hqRxyzRw3oi0ny8s4WjGXt6ZdVYDTUVNF6fGTPMyOPUJUMfnYVRW9CmAd6EdQG/q5h
         6pQIFzSRW+N8ox69TIBIAz7TAYmZ9clE9Aqa6afu5Sq2/O6gQY/VFXr0j4AK//4bcLA3
         fiPTXM2CP4kQG9t3UxGewilRoZ/FzRI87lOieV7KkeXOWkXCGBP48V320OS0A+nJGnif
         yWhb+8kdFBwXxDiXLij1I07pKr501JLgw72ePwECcArbGZCdYlGjBjGtcJLC7llzfk/2
         IShA==
X-Forwarded-Encrypted: i=1; AJvYcCWERJjDQrcYB/g4wN9da73th/gEY7eJbw9LGryF8ndEyQ7BzJQWnzallI9JY9oS7RKEJ5ys+Yq2Yzi71wDAzibjEAzSb6x03g3FMtClFTh+
X-Gm-Message-State: AOJu0YwZ2aFWM+tyqhX/AuPqgVTAhM8ucOcIpYo/bTYiTteOI/sBPESh
	FVPqodQhODCjpKKh0Iib+wJ1KV9jqZ/F0HRHqqVfFryXn9ClcpxlL0Qt6ZRdlfc=
X-Google-Smtp-Source: AGHT+IG6HApNAr08gNp8EANCLSEDYJY0OEJeO4RN59vBmzRJNnpiIxby3zbW1YTKTzihCko1G1T4UQ==
X-Received: by 2002:a05:600c:5186:b0:412:6953:fc8c with SMTP id fa6-20020a05600c518600b004126953fc8cmr1379148wmb.23.1708363111460;
        Mon, 19 Feb 2024 09:18:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:fe7f:ff5e:4cf1:97b9? ([2a01:e0a:982:cbb0:fe7f:ff5e:4cf1:97b9])
        by smtp.gmail.com with ESMTPSA id p17-20020a05600c469100b004120b4c57c9sm12103046wmo.4.2024.02.19.09.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 09:18:30 -0800 (PST)
Message-ID: <b9a31374-8ea9-407e-9ec3-008a95e2b18b@linaro.org>
Date: Mon, 19 Feb 2024 18:18:28 +0100
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 00/18] power: sequencing: implement the subsystem and
 add first users
Content-Language: en-US, fr
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Saravana Kannan <saravanak@google.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Alex Elder <elder@linaro.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Abel Vesa <abel.vesa@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Lukas Wunner <lukas@wunner.de>, linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240216203215.40870-1-brgl@bgdev.pl>
 <CAA8EJppt4-L1RyDeG=1SbbzkTDhLkGcmAbZQeY0S6wGnBbFbvw@mail.gmail.com>
 <e4cddd9f-9d76-43b7-9091-413f923d27f2@linaro.org>
 <CAA8EJpp6+2w65o2Bfcr44tE_ircMoON6hvGgyWfvFuh3HamoSQ@mail.gmail.com>
 <4d2a6f16-bb48-4d4e-b8fd-7e4b14563ffa@linaro.org>
 <CAA8EJpq=iyOfYzNATRbpqfBaYSdJV1Ao5t2ewLK+wY+vEaFYAQ@mail.gmail.com>
 <CAMRc=Mfnpusf+mb-CB5S8_p7QwVW6owekC5KcQF0qrR=iOQ=oA@mail.gmail.com>
 <CAA8EJppY7VTrDz3-FMZh2qHoU+JSGUjCVEi5x=OZgNVxQLm3eQ@mail.gmail.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <CAA8EJppY7VTrDz3-FMZh2qHoU+JSGUjCVEi5x=OZgNVxQLm3eQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/02/2024 13:33, Dmitry Baryshkov wrote:
> On Mon, 19 Feb 2024 at 14:23, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>> On Mon, Feb 19, 2024 at 11:26 AM Dmitry Baryshkov
>> <dmitry.baryshkov@linaro.org> wrote:
>>>
>>
>> [snip]
>>
>>>>>>>>
>>>>>>>> For WCN7850 we hide the existence of the PMU as modeling it is simply not
>>>>>>>> necessary. The BT and WLAN devices on the device-tree are represented as
>>>>>>>> consuming the inputs (relevant to the functionality of each) of the PMU
>>>>>>>> directly.
>>>>>>>
>>>>>>> We are describing the hardware. From the hardware point of view, there
>>>>>>> is a PMU. I think at some point we would really like to describe all
>>>>>>> Qualcomm/Atheros WiFI+BT units using this PMU approach, including the
>>>>>>> older ath10k units present on RB3 (WCN3990) and db820c (QCA6174).
>>>>>>
>>>>>> While I agree with older WiFi+BT units, I don't think it's needed for
>>>>>> WCN7850 since BT+WiFi are now designed to be fully independent and PMU is
>>>>>> transparent.
>>>>>
>>>>> I don't see any significant difference between WCN6750/WCN6855 and
>>>>> WCN7850 from the PMU / power up point of view. Could you please point
>>>>> me to the difference?
>>>>>
>>>>
>>>> The WCN7850 datasheet clearly states there's not contraint on the WLAN_EN
>>>> and BT_EN ordering and the only requirement is to have all input regulators
>>>> up before pulling up WLAN_EN and/or BT_EN.
>>>>
>>>> This makes the PMU transparent and BT and WLAN can be described as independent.
>>>
>>>  From the hardware perspective, there is a PMU. It has several LDOs. So
>>> the device tree should have the same style as the previous
>>> generations.
>>>
>>
>> My thinking was this: yes, there is a PMU but describing it has no
>> benefit (unlike QCA6x90). If we do describe, then we'll end up having
>> to use pwrseq here despite it not being needed because now we won't be
>> able to just get regulators from WLAN/BT drivers directly.
>>
>> So I also vote for keeping it this way. Let's go into the package
>> detail only if it's required.
> 
> The WiFi / BT parts are not powered up by the board regulators. They
> are powered up by the PSU. So we are not describing it in the accurate
> way.

I disagree, the WCN7850 can also be used as a discrete PCIe M.2 card, and in
this situation the PCIe part is powered with the M.2 slot and the BT side
is powered separately as we currently do it now.

So yes there's a PMU, but it's not an always visible hardware part, from the
SoC PoV, only the separate PCIe and BT subsystems are visible/controllable/powerable.

Neil

> 
> Moreover, I think we definitely want to move BT driver to use only the
> pwrseq power up method. Doing it in the other way results in the code
> duplication and possible issues because of the regulator / pwrseq
> taking different code paths.
> 
> 


