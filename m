Return-Path: <linux-bluetooth+bounces-4844-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4DD8CB1D3
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 May 2024 18:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB1F51F23499
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 May 2024 16:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9365A1BC46;
	Tue, 21 May 2024 16:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mg+AIiCY"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283BA18054
	for <linux-bluetooth@vger.kernel.org>; Tue, 21 May 2024 16:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716307219; cv=none; b=S0eaATDTFFsOVm4d4SuI+8G6B24QzyiQkh/AazvTFJXw33D38sTcY/iTTWsSBuQzMoZVcy0PxShmD6KkOzGKIpK5sjknaNqMre1DPcyG9ZyErMYOOwxne4TlFEBI+xkfASwhI1H+3rpXA5hGBG3/1H0wb2aM0wReq/RP1djYnII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716307219; c=relaxed/simple;
	bh=vVAEAyfrohFgwQUdSFubvGXi+5gPA2p8YiWJ6hKb29M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lU7KoR2hMBD1InZOF7E7st/Sfcayj9wHOyRfB8dESy+4zk6W8dHW8Q3aBxXTIhjgixGZpQ1bHHbhUm8WDtmiKUnuQzIBlFMUpav/gt/5KQTQZGASmnY8NbkghnIWnYCVk/66Zp/jpEtHUtKW3LuxKFE0u55WKmzHegRTlm2WMp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mg+AIiCY; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-34e0d8b737eso2134330f8f.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 21 May 2024 09:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716307215; x=1716912015; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8P8f3Xe3WKGb6+A4BlKH0j6nQd7Typm/M8fTWRmWe/8=;
        b=Mg+AIiCYQYFNBMQw58mWdM5x1Bm+gIFhMJGoq4VxtlgsdJl3+nSiPq978Zf2xOntdL
         /eWu+s+uGmGkdslfLexbBocoMHIDQg2/nfjuJsklDZgWkFZcNx2zF6TVgnkGySDEsCP9
         4fL0Tg/yap0+XNqHXlRQkOAmZCLLP/Vj3yi5tUYD3t5KJAwucFWDQh1eIoOTrTRlw7iY
         M6gWuedvwV2qQ7RuQVNJS0itJj13MK6cBr1jjZB9dy+Q5vfbZMC6z/9P085hZ5uQRfdI
         IS9O532QPt87qFtuovdUT3rW0yb2md4g8mDiANzGzpZxwApzfItOj/HQUyXBX5I+57Re
         7t0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716307215; x=1716912015;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8P8f3Xe3WKGb6+A4BlKH0j6nQd7Typm/M8fTWRmWe/8=;
        b=Kk7jzMir/CG/qUyP10BZzAZjnIJLOn0vw2UCibo2pcsQQgkIbjRqixuAmkNnBxGRRj
         ZS1G7+kyTPoKiv+hvP35AFUtIqra2kUBcskpc2k/aFoQuEvBDL8Y630XjvzPq/dGtBbC
         hmhufcb6jgHfTmCq107nm8tw17inZ619RyfSAUpEpDZwqvZWks45J46fQ8cLx2GrkfNK
         a14cOjmOa1gutTuSlVLIIWcJtgCmbtKYxEkjLGKo8KYu7Fg9YqzOn4qFbdGC/8AIk022
         O/ZhCZ1xwwWYAyReWf2bpusl+Yk5xz6f1p2BEVx+5B/SlnVPdGlxdKad+uJKaXxhlnjt
         jgtg==
X-Forwarded-Encrypted: i=1; AJvYcCW+ohmnV8g/vJKNk7sUVwEM5QdUmuoYPx34G8Ih0lIOWi+QJllW0vpdJX9GkCpecqisIjc6MdudcsbAFAemlCWCqtnS7wgbzubxtgGkv0cr
X-Gm-Message-State: AOJu0Yxi75GiHBleP2zCQD9fZab59XdGUVy9PFxUXIPsGT9Q5DLb8FKS
	ScJPP1W9wnZqNNfgcoV5ieN6I3/BociBftmD+10IOFcB2tJ07W/XyyWOmYZX108=
X-Google-Smtp-Source: AGHT+IGsBK0SGmhtIHLM1fIBm3F0YiryCUR9LulcVEo0MSe6Wkw4Nnpo7JzMUoA92SZizwcd5PkxAw==
X-Received: by 2002:adf:a18c:0:b0:34c:cae0:c989 with SMTP id ffacd0b85a97d-354b8e38ec8mr8449631f8f.33.1716307215517;
        Tue, 21 May 2024 09:00:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-354cece0054sm2411078f8f.102.2024.05.21.09.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 09:00:14 -0700 (PDT)
Message-ID: <4ed8d1fc-40b9-4254-90a1-9d621adc71a4@linaro.org>
Date: Tue, 21 May 2024 18:00:12 +0200
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Bluetooth: qca: Fix BT enable failure again for
 QCA6390 after warm reboot
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Lk Sii <lk_sii@163.com>
Cc: Zijun Hu <quic_zijuhu@quicinc.com>, luiz.von.dentz@intel.com,
 marcel@holtmann.org, linux-bluetooth@vger.kernel.org, wt@penguintechs.org,
 regressions@lists.linux.dev, pmenzel@molgen.mpg.de, stable@vger.kernel.org
References: <1715866294-1549-1-git-send-email-quic_zijuhu@quicinc.com>
 <f343ecae-efee-4bdc-ac38-89b614e081b5@163.com>
 <CABBYNZ+nLgozYxL=znsXrg0qoz-ENgSBwcPzY-KrBnVJJut8Kw@mail.gmail.com>
 <34a8e7c3-8843-4f07-9eef-72fb1f8e9378@163.com>
 <CABBYNZLzTcnXP3bKdQB3wdBCMgCJrqu=jXQ91ws6+c1mioYt9A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CABBYNZLzTcnXP3bKdQB3wdBCMgCJrqu=jXQ91ws6+c1mioYt9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/05/2024 17:48, Luiz Augusto von Dentz wrote:
>> driver->remove() even is not triggered during above steps.
>>>> Commit C: 272970be3dab ("Bluetooth: hci_qca: Fix driver shutdown on
>>>> closed serdev")
>>>> this commit is to fix issue B which is actually caused by Commit B, but
>>>> it has Fixes tag for Commit A. and it also introduces the regression
>>>> issue A.
>>>>
>>>
>>>
> 
> Reading again the commit message for the UAF fix it sounds like a
> different problem:
> 
>     The driver shutdown callback (which sends EDL_SOC_RESET to the device
>     over serdev) should not be invoked when HCI device is not open (e.g. if
>     hci_dev_open_sync() failed), because the serdev and its TTY are not open
>     either.  Also skip this step if device is powered off
>     (qca_power_shutdown()).
> 
> So if hci_dev_open_sync has failed it says serdev and its TTY will not
> be open either, so I guess that's why HCI_SETUP was added as a
> condition to bail out? So it seems correct to do that although I'd
> change the comments.
> 
> @Krzysztof Kozlowski do you still have a test setup for 272970be3dab
> ("Bluetooth: hci_qca: Fix driver shutdown on closed serdev"), can you
> try with these changes?

Unfortunately not at the moment, because mainline never had a proper
support for a variant of this Bluetooth/WiFi on our boards, so it was
working with few out of tree patches. I think Bartosz is working on
fixing it via power sequence, but that's not in the mainline yet.

Best regards,
Krzysztof


