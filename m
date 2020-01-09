Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB191359CF
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 Jan 2020 14:13:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730540AbgAINN1 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 Jan 2020 08:13:27 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39987 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728974AbgAINN1 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 Jan 2020 08:13:27 -0500
Received: by mail-wr1-f68.google.com with SMTP id c14so7334641wrn.7
        for <linux-bluetooth@vger.kernel.org>; Thu, 09 Jan 2020 05:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/rBG0TQpboOYHQ3dtsZ2LO09lSi5DlQHgDK1Z1Ip0gU=;
        b=BCftgX9EKTr00X5H7I/K7vBUiQorQS3fXvQVNfIZE7Z6WJ3Y+U4C9AA0MFcXkMM7uF
         qiubw+mjHA/9fB9cHwlCHLc4/svNqgftQC9XbBb/wq7sYV0Hie1T9QHrWQ3vQUNS77bd
         jDcmLRBkgD6fICBLnJdx1wcr1WE6c/TOY42irLjAZPQoZgm2b8+45ZQMNCJbIORF5fIL
         cIe4GYsFjeE8JYJxiV+hx9+h72c5ie4YUtOl+U2lku4oUzIJKc9TtZB8S7jQEd4MODSm
         vYMHyDVaH2DUUyGEgMo/Rfo8Jxdz63REA/ekA+P53DqTz3pYngAXWwyqNaDySvqdDv2V
         BtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/rBG0TQpboOYHQ3dtsZ2LO09lSi5DlQHgDK1Z1Ip0gU=;
        b=mJorVMNotSJi/FTwoUxioAhBF3Npj/26mQGbStT/h03Gt3v0e+6ypeG6GfTGD7QU1Y
         v8RHovDot0ds/n7P9OJl9346D70KOQy2/hRCVGO6DhO3Ult/GSDd20WPhmlo4D7sz7Ti
         5kS/+SuGnCEbwAeX8+c+s2VQzCVnYeUDRpP/KDMgq0d+tRjgJfsBRnm8uF12F2XlKZUT
         yCWkbRADIGfqsU0Z1eg37H2F+hPhbLDi4S+/6SY9o6r6lQWo6YvPsfORLkhjY+wcFccu
         Ed/SPymFSmJKCGcw5Z4d+N6jfMaT3yc9vuESx7v31bEZqCynOq3TNcM/NjKlNXbWBjxx
         RraA==
X-Gm-Message-State: APjAAAWsuBhlZI5n5A/Vw1rTeupBIcu4pIFJgtUHbf++kb0QCVAcaHzi
        CfloV8/jm9jkL3VJq6FQIgy+Gg==
X-Google-Smtp-Source: APXvYqw5xl2LtfiT4yZTxV5PMSEStk6+USro+b+cq5P49/waQtNeQlu36EPIthHWXsqYJeJlJWTwvA==
X-Received: by 2002:adf:fe86:: with SMTP id l6mr10525600wrr.252.1578575604924;
        Thu, 09 Jan 2020 05:13:24 -0800 (PST)
Received: from [10.1.4.98] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q19sm2726293wmc.12.2020.01.09.05.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2020 05:13:24 -0800 (PST)
Subject: Re: [PATCH v6 1/2] dt-bindings: net: bluetooth: add interrupts
 properties
To:     Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        nsaenzjulienne@suse.de, linux-kernel@vger.kernel.org,
        khilman@baylibre.com
References: <20200109104257.6942-1-glaroque@baylibre.com>
 <20200109104257.6942-2-glaroque@baylibre.com>
 <20200109105305.GL30908@localhost>
From:   guillaume La Roque <glaroque@baylibre.com>
Message-ID: <a33f9c30-03a8-ea12-e9d3-5e050e41318e@baylibre.com>
Date:   Thu, 9 Jan 2020 14:13:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200109105305.GL30908@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org


On 1/9/20 11:53 AM, Johan Hovold wrote:
> On Thu, Jan 09, 2020 at 11:42:56AM +0100, Guillaume La Roque wrote:
>> add interrupts and interrupt-names as optional properties
>> to support host-wakeup by interrupt properties instead of
>> host-wakeup-gpios.
>>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/net/broadcom-bluetooth.txt | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
>> index c44a30dbe43d..d33bbc998687 100644
>> --- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
>> +++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
>> @@ -37,7 +37,9 @@ Optional properties:
>>      - pcm-frame-type: short, long
>>      - pcm-sync-mode: slave, master
>>      - pcm-clock-mode: slave, master
>> -
>> + - interrupts: must be one, used to wakeup the host processor if
>> +   gpiod_to_irq function not supported
>> + - interrupt-names: must be "host-wakeup"
> Looks like you forgot to address Rob's comment. If I understood him
> correctly you either need to stick with "host-wakeup-gpios" (and fix
> your platform) or deprecate it in favour of "interrupts":
>
> 	https://lkml.kernel.org/r/20191218203818.GA8009@bogus

not forgot marcel ask me a v6

for rob comment ok but it's not possible to support gpiod_to_irq on my platform.

if i deprecated it i need to update all DT with good interrupt number right?



> Johan

Regards

Guillaume

