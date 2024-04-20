Return-Path: <linux-bluetooth+bounces-3794-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E00658ABB32
	for <lists+linux-bluetooth@lfdr.de>; Sat, 20 Apr 2024 13:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EA58281B2C
	for <lists+linux-bluetooth@lfdr.de>; Sat, 20 Apr 2024 11:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D6024A04;
	Sat, 20 Apr 2024 11:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UKq7THlG"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B217310E9
	for <linux-bluetooth@vger.kernel.org>; Sat, 20 Apr 2024 11:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713610872; cv=none; b=nlJAdJk0dW+tsoQ4e4TuH9nUDEuG1/Zu8zlmHTb4kLDgEQ9sZe4SoK+oCVTnFC32/odRhPUOC/qzLBfr31BEDCCyd1QtR4KevlbxhYc2EA942uMZDVHI05/nZ41cRvL//iPldODVkhSToqPwgjsNjZpQUMKFC919yImGlMBG9Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713610872; c=relaxed/simple;
	bh=KvTTcIynydoMVMkEWjIbPdh5Ljf+FACutsVGW76Glwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMyVgBvQs8YtATvw1IhtZ3ig/jq19iB6UtvaHcl4veTE9NvUY6Y5hQLYIn5iU4qJga2gr7aR1LKtnhqyFn7SU0ewKKmb8GPdTnGaJkoDwVUNyLx+yqZxPuD+BbJ4BEuSe+TZhDx6sWawiU2qiOd3T+3vzkIHSnYXHNI2c214qrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UKq7THlG; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-34a3e0b31e6so1710475f8f.1
        for <linux-bluetooth@vger.kernel.org>; Sat, 20 Apr 2024 04:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713610869; x=1714215669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9PiUQP5gvypWVoZr2xPjjpTD0Yh+IJNHD7o43Qkzl6I=;
        b=UKq7THlGgTiBw7EU23Jg5s40uPubEBZQnp5RbLxrfkUq+YFcHlnWtKjDkBLXs8lKif
         nSGMvmSr1uJliPV44aV4QgGfnAxihHZKMQOgzuQUlOwhS6xAVG3U+Z3xg59rXDB0TLKs
         uByhFpFhEfg8wvsGOwDuIuLAZsMb/x9bTKndzBe7L10hcDHTbgjH7pcKSyMwTFCok3lL
         W7vR34mYMJ68s6b3D4tN4QC3S6BtBMkQvy9m5iILzhZ5ucwwxRPk94d2Ls8xoVp2EWnh
         BrmhHoa/9rZUMiyx3jMjr7aBlchxU2boha8Z8abIM8K1xW/2UqMIzd+b3Pw23TB4T1Ii
         48Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713610869; x=1714215669;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PiUQP5gvypWVoZr2xPjjpTD0Yh+IJNHD7o43Qkzl6I=;
        b=D7h9DJnCyZH78Z/iMBXKfVZi7rfS83/6E8RQQrum7/6uOH3OOpOlLPHl6ffF4CPA8u
         T4wgwbsAVQPV552aI2TSIi3FivLRrlK0pt1KWeEMO4j1EyoGjo+LZoa1maMcTQJVqikZ
         3akt03Gh9xCokHINhQgFV6S7HEtUXWxRx+Hcd1D6cckEHZzRj+G0ZNyCjlc4QJPf4chk
         3RsYcbJ8UQ2Cq96EpI3yy/U4cwZO1MdjAs6ASyTW9wgZFAj8eAzmsa0XxDWef0oBmj8C
         HUWD2LwNhDPsd58/ztw0OoLfh4WcGEYqmwhoXRnP5HzOT7iRqsFERjhwas4SltDUwKdj
         dDyQ==
X-Gm-Message-State: AOJu0YwkgHkbtlrdBG5Mnhu2lqPFqZhz6mPlj81HfeTl/r/Dp6pkQVnE
	lL3N6ICn1Rzbz37pfF2lm47FgoXK5NIGiw1nr5srg9nq3Bmn/fN81/MHKBuKd5E=
X-Google-Smtp-Source: AGHT+IHA/b8mrVeDknKDDZOTZqOjRREx6lLqOOmfUFltXRMyJnnl6kNsiQ5O9HPJe+/yZiuxUx804g==
X-Received: by 2002:a5d:6743:0:b0:343:ab10:f31e with SMTP id l3-20020a5d6743000000b00343ab10f31emr2948596wrw.42.1713610868713;
        Sat, 20 Apr 2024 04:01:08 -0700 (PDT)
Received: from [10.236.36.88] ([88.128.88.151])
        by smtp.gmail.com with ESMTPSA id x13-20020a5d54cd000000b0034335e47102sm6565492wrv.113.2024.04.20.04.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 04:01:08 -0700 (PDT)
Message-ID: <3ab33f9c-206a-4c77-816a-471769591b6c@linaro.org>
Date: Sat, 20 Apr 2024 13:01:07 +0200
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Fix two regression issues for QCA controllers
To: Zijun Hu <quic_zijuhu@quicinc.com>, luiz.dentz@gmail.com,
 luiz.von.dentz@intel.com, marcel@holtmann.org
Cc: linux-bluetooth@vger.kernel.org, bartosz.golaszewski@linaro.org,
 wt@penguintechs.org
References: <1713449192-25926-1-git-send-email-quic_zijuhu@quicinc.com>
 <1713564212-21725-1-git-send-email-quic_zijuhu@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1713564212-21725-1-git-send-email-quic_zijuhu@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/04/2024 00:03, Zijun Hu wrote:
> This patch series are to fix below 2 regression issues for QCA controllers
> 1) BT can't be enabled once BT was ever enabled for QCA_QCA6390
> 2) BT can't be enabled after disable then warm reboot for QCA_QCA6390
> 
> the links for these issues are shown below:
> https://bugzilla.kernel.org/show_bug.cgi?id=218726
> https://lore.kernel.org/linux-bluetooth/ea20


Provide changelog, either in cover letter or in individual patches under
---.

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets.

Best regards,
Krzysztof


