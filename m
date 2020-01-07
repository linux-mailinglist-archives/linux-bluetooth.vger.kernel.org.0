Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F11013263A
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Jan 2020 13:33:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgAGMdw (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Jan 2020 07:33:52 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40541 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbgAGMdw (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Jan 2020 07:33:52 -0500
Received: by mail-wr1-f67.google.com with SMTP id c14so53723115wrn.7
        for <linux-bluetooth@vger.kernel.org>; Tue, 07 Jan 2020 04:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=GXTBxUXFf/0lblKnPV2tJJx5huyZR82ySCgLFN7gCSA=;
        b=cwJlYynOcPBu0xjHXZZtpNCmwXosTzSWCtLwB3W1r1F0BYW1V+9cNdIXBOJ7v5ssmn
         KxurqCUl8ttNr8KL4synUaSdUyAOcSW+XSv4HHYpnC+E6ctaLjgOPMHNm1kqUEGBTzEF
         MkwoqzXCAQt2sJ1fAtXtdaHp1UaJ6OXabwQqaIjuQiS5gRHZJiW6HVMJFPHZdneDiwbj
         LZ8RZRw1vpqaLW8KXieB2i+2arTsB0wBlFWVsIryoPlSJfdh58C8W+d5YHTc8iLfC3vf
         bZVSd3eU9AzvXiPSUmUUzzwjELxsvKf37egkTVkqPmnkSJo5ucKHDyjDRzqvmB4KHxp6
         pSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=GXTBxUXFf/0lblKnPV2tJJx5huyZR82ySCgLFN7gCSA=;
        b=BEzguodmG0jTK5ZEwMP1U6xCqnQzPhqxESIg0VQrZlK//KMPrstOLiL/umubhDVEFN
         RutKpyeEhFBYylW0Fw8JPNc/y0l0PTnyEMjklnOGJXOwkbNwVISOeaxVZ0qK+9CnoEFn
         5xV/xZtYbxgSyqZNBPIImFbc5xlIsXx4DsNCrgYJBixleDaAWiW0gJLhHRRPnee9Iqiw
         iKhzCoggXfM05Gl3drGi4UnCwgHlGWoIowLDYsqPxDqYYM9IRNYFFq9zpqLU21gNbLjp
         qUTOy8S3frRhwl/jJ/puxkQJIyYsdzhSu1FFeht3r6FC5/bzN1zJMFM37F+jMUgoHxQc
         DaOQ==
X-Gm-Message-State: APjAAAUf6dJyjRl5nfvtne0WiXVHRqDS3rHdn+3wnnA2PaWczjCJ1yvn
        O/tjuny8OxV87Cr+pp6+tKwGpQ==
X-Google-Smtp-Source: APXvYqy74uz9nvj2BIPxpdM20AIWwAe3Di+G7rYdWb/b+n9twWOnu7KnRC6p6sEYexCJAXfIfdL7xA==
X-Received: by 2002:adf:dd4d:: with SMTP id u13mr110724265wrm.394.1578400430159;
        Tue, 07 Jan 2020 04:33:50 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca? ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
        by smtp.gmail.com with ESMTPSA id f127sm26361528wma.4.2020.01.07.04.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 04:33:49 -0800 (PST)
Subject: Re: [PATCH v4] bluetooth: hci_bcm: enable IRQ capability from node
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        BlueZ devel list <linux-bluetooth@vger.kernel.org>,
        nsaenzjulienne@suse.de, linux-kernel@vger.kernel.org,
        khilman@baylibre.com
References: <20191213105521.4290-1-glaroque@baylibre.com>
 <20191213111702.GX10631@localhost>
 <162e5588-a702-6042-6934-dd41b64fa1dc@baylibre.com>
 <20191213134404.GY10631@localhost>
 <08ae6108-0829-3bb4-f398-7e6a58719d29@baylibre.com>
 <8EBBCE1B-688D-4097-A2AF-6E099A0AD68B@holtmann.org>
From:   guillaume La Roque <glaroque@baylibre.com>
Message-ID: <11747601-6d29-d2c8-7639-896d654280a4@baylibre.com>
Date:   Tue, 7 Jan 2020 13:33:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <8EBBCE1B-688D-4097-A2AF-6E099A0AD68B@holtmann.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel,

On 1/4/20 10:58 AM, Marcel Holtmann wrote:
> Hi Guillaume,
>
>>>>>> @@ -1421,6 +1422,7 @@ static int bcm_serdev_probe(struct serdev_device *serdev)
>>>>>> #endif
>>>>>> 	bcmdev->serdev_hu.serdev = serdev;
>>>>>> 	serdev_device_set_drvdata(serdev, bcmdev);
>>>>>> +	bcmdev->irq = of_irq_get(bcmdev->dev->of_node, 0);
>>>>> Shouldn't you be used using of_irq_get_byname()?
>>>> i can use it if you prefer but no other interrupt need to be defined
>>> Maybe not needed then. Was just thinking it may make it more clear that
>>> you now have two ways to specify the "host-wakeup" interrupt (and in
>>> your proposed implementation the interrupts-property happens to take
>>> priority). Perhaps that can be sorted out when you submit the binding
>>> update for review.
>> no problem i add a "host-wakeup" interrupt-name.
>> you are right it will be more clear with name and we know why this interrupt is needed.
> have I missed the v5 or are still sending it?

sorry i was in chrismas holidays .

v5 was sent before holiday and you comment it [1] ;) , on v5 you ask me to send v6 with tag.


Regards

Guillaume

>
> Regards
>
> Marcel
>
[1] : https://www.spinics.net/lists/linux-bluetooth/msg82424.html
