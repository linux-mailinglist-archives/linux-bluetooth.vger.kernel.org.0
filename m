Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E2C22C48A
	for <lists+linux-bluetooth@lfdr.de>; Fri, 24 Jul 2020 13:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbgGXLuE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 24 Jul 2020 07:50:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41020 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726411AbgGXLuC (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 24 Jul 2020 07:50:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595591400;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6+ChtD0GXCo4LLqaKWKmtcOwT0zGgtGTIGQjamaPLVU=;
        b=KMOE2zapcVtqQ8kwm8oQF4efmW+DJhXLyTo5cedOfeQSHblAOQmHEA3a8n/5eSd2fAPHu/
        1JyAfaWAkUXzUAK0SVmlDaV9B6JyCccRILiQfTPETpL8SZOy+TQnFWlpwqtFZA2JUCyLyP
        XkbUki9fEBVdx3gQ9t0Q19Cgeve/F7A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-URbMgH0nPSOJnCqFBofrug-1; Fri, 24 Jul 2020 07:49:59 -0400
X-MC-Unique: URbMgH0nPSOJnCqFBofrug-1
Received: by mail-wm1-f70.google.com with SMTP id v4so1755616wmh.3
        for <linux-bluetooth@vger.kernel.org>; Fri, 24 Jul 2020 04:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6+ChtD0GXCo4LLqaKWKmtcOwT0zGgtGTIGQjamaPLVU=;
        b=o72AZuyE6qm3pppcCKN/nURd+OBGpyFNOQESUR5mo3n7jDQYi62r+Ql9DyrcqPtFGP
         Midx5I5UIuUfU7WwRMHdC1Rx40kivMXNxOOvVq7n1IfacvO2CkPGQHi9MedJ4jWmsWKw
         LrHDznt1gU7kN5mr6wMRZf3hhaTdxM9Zx+h+zADpwrRxUyYpuNfX2qrPYutKYorHnHTz
         e5iDDXhjDXL72G1Zy4GPLi2B19R54+817A4OQMPXJuLodowlD8NbYrEntJCUYQRmnb8e
         ugThlm75TMdRZHiicyEkD43SG4LzWuhEVezZ8E2qhlL+msHnwPOgjMGbwBkjwYSBWfsh
         3A1A==
X-Gm-Message-State: AOAM530A05ERfQp8ZlBoh57MmKyy1l22OhnIslEnNrE5HZPK3g3cf0Ob
        KdLJ5aRCix6iZyBAosrRNTCgquJrBSWvNZa1AGVrQjvCgUEzkWxLspiHMCj0bPjrILELKrZDwpU
        BT8H73OUGIf6gRPbyFAitHlyW0/3q
X-Received: by 2002:a1c:f616:: with SMTP id w22mr8057670wmc.44.1595591397782;
        Fri, 24 Jul 2020 04:49:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA9RMYWdAPaTFDYdlul0e8hCah4d4e5ddH+g/hUNmfx6ovHLama1NPhon8tgbN52ktZUIM6Q==
X-Received: by 2002:a1c:f616:: with SMTP id w22mr8057655wmc.44.1595591397515;
        Fri, 24 Jul 2020 04:49:57 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id u10sm6595252wml.29.2020.07.24.04.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 04:49:56 -0700 (PDT)
Subject: Re: [PATCH 1/2] Bluetooth: hci_h5: Set HCI_UART_RESET_ON_INIT to
 correct flags
To:     Nicolas Boichat <drinkcat@chromium.org>,
        Marcel Holtmann <marcel@holtmann.org>
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200721103652.1.Idbc7eddf1f24f750a8bbcbc8e06743736ae3be31@changeid>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6c76582e-5e5d-0977-37b6-82bc84bd81c9@redhat.com>
Date:   Fri, 24 Jul 2020 13:49:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200721103652.1.Idbc7eddf1f24f750a8bbcbc8e06743736ae3be31@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

On 7/21/20 4:37 AM, Nicolas Boichat wrote:
> HCI_UART_RESET_ON_INIT belongs in hdev_flags, not flags.
> 
> Fixes: ce945552fde4a09 ("Bluetooth: hci_h5: Add support for serdev enumerated devices")
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> 
> ---
> 
>   drivers/bluetooth/hci_h5.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
> index e60b2e0773db110..e41854e0d79aae2 100644
> --- a/drivers/bluetooth/hci_h5.c
> +++ b/drivers/bluetooth/hci_h5.c
> @@ -793,7 +793,7 @@ static int h5_serdev_probe(struct serdev_device *serdev)
>   	if (!h5)
>   		return -ENOMEM;
>   
> -	set_bit(HCI_UART_RESET_ON_INIT, &h5->serdev_hu.flags);
> +	set_bit(HCI_UART_RESET_ON_INIT, &h5->serdev_hu.hdev_flags);
>   
>   	h5->hu = &h5->serdev_hu;
>   	h5->serdev_hu.serdev = serdev;
> 

