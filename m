Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B74AD69E53A
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 Feb 2023 17:56:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234861AbjBUQ44 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 21 Feb 2023 11:56:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234121AbjBUQ4z (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 21 Feb 2023 11:56:55 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95EC22C653
        for <linux-bluetooth@vger.kernel.org>; Tue, 21 Feb 2023 08:56:53 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id cy6so14359915edb.5
        for <linux-bluetooth@vger.kernel.org>; Tue, 21 Feb 2023 08:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aCU6SPAFZVv6VrbiMY/N7BZbYYEaRXFZQb7KA4W8RVo=;
        b=lKw4QodbdDMkDON5+34Zsg2fW6BQUEa2d+bZoarpRELg92X9u9882K/pe/HdFj3huM
         6Lc1FGAQOGl2+g2eNBp4hLPPUc159jfqYetPDRRGOx+PfHrpa75zdoZOVko23d+DNsx7
         bJMjyXLEHWXAgpH4l9oLRg+9/Nyyfdqn8Bf03IQaFqlL24+BjhWhC8oDFC9XznL3Zj6B
         ProL6idqXQw/7zoq4/44IhfKpGd2J22IMD7LU9BKwvIKO27RiActjOIBqzuJGyhivbAh
         moM2bqoVWcHjGqcVn78k7heXQSuKtbmvJWLati5vrlghaIxvtYV8SNZQqt8wkYhjz+PD
         kj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aCU6SPAFZVv6VrbiMY/N7BZbYYEaRXFZQb7KA4W8RVo=;
        b=ymxAVcSHPCvHv9XbBrqZcjV2U21PtcoxJeBaqwWLELsFnxaONdEw0sEm7ja35EPaMK
         DwNRbdiorZTAJEgf/XQhT4Z26sKOYNy9hE+n/rV6sHCmi5oUiulIIHXZkO6fjrHe7QXj
         3AKcKOJTYiBuCYX+uKHP+7P7LjJdLE4mOAiEkbeJhGz/P5bPQH1AD/OKmx0brMxfDJvc
         zdweGYT+zy+mvlL5RH7wnHn+crwtPWtdTwVFCgunLNnaUgSCzGBSCf/tOClXcW7tHIMt
         3vCG/6SMzMSCFfJkg7RP0ol9AzbOIzJb2FJDNz6elaSe54OcvYJpq8ho0/bhZqut2qwD
         mhuw==
X-Gm-Message-State: AO0yUKXc/yz3BI2qdtoIxznkOSKJ5/Mpug7A7wtisyxHC5ZqfXUCXBad
        SjlE1G8UE5iokMiXhD3LUYrp4Q==
X-Google-Smtp-Source: AK7set/vywrHZuTi6XuUog062h/Qf6hzYttHgoOMW0LLI9sVJlPsm0rv0sXGCDZ0eASaCbRg2wq0Iw==
X-Received: by 2002:a17:907:2128:b0:8af:54d0:181d with SMTP id qo8-20020a170907212800b008af54d0181dmr12541426ejb.35.1676998612081;
        Tue, 21 Feb 2023 08:56:52 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id me19-20020a170906aed300b008b17662e1f7sm6816234ejb.53.2023.02.21.08.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 08:56:51 -0800 (PST)
Message-ID: <764cf3a6-abcc-5c43-606f-10248c6fd0bf@linaro.org>
Date:   Tue, 21 Feb 2023 17:56:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/3] dt-bindings: net: bluetooth: Add NXP bluetooth
 support
Content-Language: en-US
To:     Neeraj sanjay kale <neeraj.sanjaykale@nxp.com>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "marcel@holtmann.org" <marcel@holtmann.org>,
        "johan.hedberg@gmail.com" <johan.hedberg@gmail.com>,
        "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "jirislaby@kernel.org" <jirislaby@kernel.org>,
        "alok.a.tiwari@oracle.com" <alok.a.tiwari@oracle.com>,
        "hdanton@sina.com" <hdanton@sina.com>,
        "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "leon@kernel.org" <leon@kernel.org>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Amitkumar Karwar <amitkumar.karwar@nxp.com>,
        Rohit Fule <rohit.fule@nxp.com>,
        Sherry Sun <sherry.sun@nxp.com>
References: <20230213145432.1192911-1-neeraj.sanjaykale@nxp.com>
 <20230213145432.1192911-3-neeraj.sanjaykale@nxp.com>
 <60928656-c565-773d-52e6-2142e997eee4@linaro.org>
 <DU2PR04MB8600F997FCED520DCBAB2330E7A59@DU2PR04MB8600.eurprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DU2PR04MB8600F997FCED520DCBAB2330E7A59@DU2PR04MB8600.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On 21/02/2023 17:40, Neeraj sanjay kale wrote:
> Hi Krzysztof,
> 
> Thank you for reviewing this patch. I have fixed all the review comments in this document.
> Please let me know if you have any more comments or suggestions on the new v4 patch.
> 
>>>  .../bindings/net/bluetooth/nxp,w8xxx-bt.yaml  | 44
>>> +++++++++++++++++++
>>
>> I don't think I proposed such filename.
> Renamed file to nxp,w8987-bt.yaml
> 
> 
>>> +examples:
>>> +  - |
>>> +    uart2 {
>>
>> This is a friendly reminder during the review process.
>>
>> It seems my previous comments were not fully addressed. Maybe my
>> feedback got lost between the quotes, maybe you just forgot to apply it.
>> Please go back to the previous discussion and either implement all requested
>> changes or keep discussing them.

And how did you fix this one?

Best regards,
Krzysztof

