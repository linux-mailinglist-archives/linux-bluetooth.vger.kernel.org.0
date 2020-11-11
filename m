Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 409892AF971
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Nov 2020 21:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726003AbgKKUEI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 11 Nov 2020 15:04:08 -0500
Received: from hoster906.com ([192.252.156.27]:60156 "EHLO hoster906.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725971AbgKKUEI (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 11 Nov 2020 15:04:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=mnmoran.org; h=subject
        :to:references:from:message-id:date:mime-version:in-reply-to
        :content-type:content-transfer-encoding; s=dkim; bh=dTipWsRJestd
        4Li8kMKjt+zKKITCEYj+meN0Ho0uReA=; b=SY+l6LAKjgYjbxrMDimuaqtsRJCu
        jdp8ddcZUxIzbxMV5tIz5CKhE11nDG/IpSPEFive3x8OxGs4ssZcmvoRUfR5LtRg
        yJs0hCcT/3UQNJ237TEW1xAk/pxNcq6S49ocr02FXUz8bYm9xBLnGyK62Ke+CHbv
        1Ty4+m8Mjj4J/gc=
Received: (qmail 37498 invoked by uid 503); 11 Nov 2020 20:04:07 -0000
Received: from unknown (HELO ?192.168.254.79?) (mike@mnmoran.org@40.134.89.129)
  by hoster906.com with ESMTPA; 11 Nov 2020 20:04:07 -0000
Subject: Re: LE Advertising: Command Disallowed
To:     Devin Bayer <dev@doubly.so>, linux-bluetooth@vger.kernel.org
References: <d343e320-b368-e85b-d428-d5c000eb69df@doubly.so>
From:   "Michael N. Moran" <mike@mnmoran.org>
Message-ID: <b86e5449-d784-deee-87d8-4bcf1b4b6308@mnmoran.org>
Date:   Wed, 11 Nov 2020 15:04:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d343e320-b368-e85b-d428-d5c000eb69df@doubly.so>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Devin,

If I recall correctly, you get this if advertising is already enabled.


On 11/11/20 12:49 PM, Devin Bayer wrote:
> Hello,
>
> I am trying to figure out why I'm getting "Command Disallowed" for the HCI
> commands "LE Set Advertise Enable" and "LE Set Advertising Parameters". I've
> been trying for a few days to get a GATT service running; first with the D-BUS
> API, which occasionally worked but was very unstable. Now I'm trying with HCI
> directly with the pybleno / bleno libraries.
>
> I have bluetoothd disabled and I have tried an `hciconfig reset` and reboot.
> Unsure what else I can do, I'm asking here.
>
> The errors are these:
>
>> HCI Event: Command Complete (0x0e) plen 4      #14 [hci0] 3.406377
>       LE Set Advertise Enable (0x08|0x000a) ncmd 1
>         Status: Command Disallowed (0x0c)
>
>> HCI Event: Command Complete (0x0e) plen 4      #16 [hci0] 3.407380
>       LE Set Advertising Parameters (0x08|0x0006) ncmd 1
>         Status: Command Disallowed (0x0c)


-- 
Michael N. Moran           (h) 770 704 9751
218 Wilshire Terrace       (c) 678 521 5460
White, GA, USA 30184       http://mnmoran.org

