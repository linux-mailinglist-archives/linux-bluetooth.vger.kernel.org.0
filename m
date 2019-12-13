Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9E311E397
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Dec 2019 13:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfLMMbV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 13 Dec 2019 07:31:21 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35606 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726903AbfLMMbV (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 13 Dec 2019 07:31:21 -0500
Received: by mail-wm1-f68.google.com with SMTP id p17so6393809wmb.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 13 Dec 2019 04:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=z41FKQuYBUSuoSb2FV0vifxkTTBPMXxzD/YOhZ2tMXg=;
        b=Ly/oQT9L+ts7qFVZIDbECN/aSDdc+QRYixCMzB3z+8bWc36CMUodtwuYDGPaBOM/Ih
         gLkJq29oULc4rltitaD9MXHtFWZFPgwpOtHwj9ZMOKuo01Yy8jFUyMK5dFhAa75pBX+7
         CQMwgUHLt9uRCgaYBPs6z9R8fpeYG6seMH6b/CGWq0OB9ozvko1nV46ueLh0yAmeFB7U
         qot0qE7kJH6deDEOt5ZZTwWT5Keh4ntPraiEvn6E+TFHvEG2QCaC+sCh1TYeqJVDcnAq
         StldK8xrkuSot7KQ5sgxR+59OsbvQikY9X50zAf2wOgPOzKqLUlm24kNLlQy9Gg5lbuA
         Vlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=z41FKQuYBUSuoSb2FV0vifxkTTBPMXxzD/YOhZ2tMXg=;
        b=Gb8YtDtB7N6h3XxE5zhe45Iqxg4S6oEnJiLppi1UPn46+BxzRmBuLB1plI+OEOHaoP
         h6WD69TyhfZF5NlBV9FEu8j/FFDILctvxb2tb/eiUqvQ2blM1XNZjg6yDhWzQUUnVzbZ
         TLOfMYiAA+HJdZlr6idteRj235KHrzuXRPiHGC+XmXDMwGSvdu34FanMFIfqDCS1+OTt
         HiSQwqp6aiPBpx6K0D8N30/lFP5G5dpwEhN8NKWtfVRAiZ5rbv9UFURS42YnkkYXsxYP
         k9UykJOl3ya3+mhbGXSp6W7c0Xba7nPky80XL7qRFVAZpf1bIVsoHdSODH527je4W7aT
         QeGg==
X-Gm-Message-State: APjAAAW6Dm9wkWQo43P/3Bhhaqss888MAQ3Kz4afK/2SYLWQpzuYdLCC
        tHjwuSeqeNzy/nAOTLVkozOyuA==
X-Google-Smtp-Source: APXvYqyI9oCoKlmkTNb1eHINYrX90erhUnwNmt0X9Htia3GuiYl8nmeYuA97/k8Vm2oQdER9i+aAoQ==
X-Received: by 2002:a1c:3d07:: with SMTP id k7mr5002476wma.79.1576240279760;
        Fri, 13 Dec 2019 04:31:19 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca? ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
        by smtp.gmail.com with ESMTPSA id g7sm9913377wrq.21.2019.12.13.04.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2019 04:31:19 -0800 (PST)
Subject: Re: [PATCH v4] bluetooth: hci_bcm: enable IRQ capability from node
To:     Johan Hovold <johan@kernel.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-bluetooth@vger.kernel.org, nsaenzjulienne@suse.de,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
References: <20191213105521.4290-1-glaroque@baylibre.com>
 <20191213111702.GX10631@localhost>
From:   guillaume La Roque <glaroque@baylibre.com>
Message-ID: <162e5588-a702-6042-6934-dd41b64fa1dc@baylibre.com>
Date:   Fri, 13 Dec 2019 13:31:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191213111702.GX10631@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Johan,

On 12/13/19 12:17 PM, Johan Hovold wrote:
> On Fri, Dec 13, 2019 at 11:55:21AM +0100, Guillaume La Roque wrote:
>> Actually IRQ can be found from GPIO but all platforms don't support
>> gpiod_to_irq, it's the case on amlogic chip.
>> so to have possibility to use interrupt mode we need to add interrupts
>> field in node and support it in driver.
> "node" is a bit vague, please refer to devicetree here and in the patch
> summary.
>
 i will
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>>  drivers/bluetooth/hci_bcm.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
>> index f8f5c593a05c..aa194f8d703e 100644
>> --- a/drivers/bluetooth/hci_bcm.c
>> +++ b/drivers/bluetooth/hci_bcm.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/module.h>
>>  #include <linux/acpi.h>
>>  #include <linux/of.h>
>> +#include <linux/of_irq.h>
>>  #include <linux/property.h>
>>  #include <linux/platform_data/x86/apple.h>
>>  #include <linux/platform_device.h>
>> @@ -1421,6 +1422,7 @@ static int bcm_serdev_probe(struct serdev_device *serdev)
>>  #endif
>>  	bcmdev->serdev_hu.serdev = serdev;
>>  	serdev_device_set_drvdata(serdev, bcmdev);
>> +	bcmdev->irq = of_irq_get(bcmdev->dev->of_node, 0);
> And this clearly makes no sense for acpi, so you'd need to add it to
> bcm_of_probe().
>
> Shouldn't you be used using of_irq_get_byname()?
i can use it if you prefer but no other interrupt need to be defined
>
> And since you're extending the binding, I think you need a preparatory
> patch documenting this in:
>
> 	Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
sorry i forgot this, i will do
>>  	/* Initialize routing field to an unused value */
>>  	bcmdev->pcm_int_params[0] = 0xff;
> Johan


thanks

Guillaume

