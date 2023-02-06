Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E117C68B693
	for <lists+linux-bluetooth@lfdr.de>; Mon,  6 Feb 2023 08:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbjBFHm6 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 6 Feb 2023 02:42:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbjBFHmy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 6 Feb 2023 02:42:54 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14A705597
        for <linux-bluetooth@vger.kernel.org>; Sun,  5 Feb 2023 23:42:51 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id g6so1486028wrv.1
        for <linux-bluetooth@vger.kernel.org>; Sun, 05 Feb 2023 23:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2XA64voz9ivBR8UNL1Z4b6fr6//lgNZOlEzIgWzkqrI=;
        b=Iad+7Ny2E+UALOfO6NNonPCSf+2HKHeRfPbUezACIXgAcbJUJ3G8UHXjGooNRK3KEk
         NuwofdM+hk+PKfCB0DcqJ6du5yKbaccuJ3uTdtaVldcs04CW/ohNsPol//L4wMeG1sU/
         RtEUvOVe93QJ0T/8b1V6fJUQ3tM1F0ty6OAxrBZZtAViiFDqpRwikB9fQdyTSczSSi8i
         rndOCKOdsNE0xp0OgHe6AW7sqoFiV9fZzc8jQ+q/c3FPNCMf++mzw1zLATPOXSWfSgHM
         +c/IVuPcNtRqFuow0ZU9GZ18xmDoNxsRAcx8RD3GTucjpbrzw2lrphPE4phT/+QXG7xQ
         rXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2XA64voz9ivBR8UNL1Z4b6fr6//lgNZOlEzIgWzkqrI=;
        b=u46HkHaUCIpYJ3loPwhCT4zuLmA8el4SVFyGSY7Kk7sZmaTk1W+EtXNCdlOvuNSl9W
         cbhWKwUG3L8pqGEa6Ej6673xrVvqJOj4XJtfy806dGgXJRs+bSkhG59kn9aKP2eEzpoY
         PQV71Micm+rzOd7isC/0y0VVeEcTNmHvGSlObjd+gjlWnU2YvhETVT7S+SF/h+IITVtL
         57dgolAYyMEU36LCuBqDT7ZZfOSYQ+gXHMs16HpGqCHOh24UtvDzSVhiXRm3lIRKnGbi
         DwvqjGD1bsu8oEiwt+8W++w9d+mfCynUrZDn/a5V/9+88n9yKzVuJqWQEtaSEHmNqh7v
         O/eQ==
X-Gm-Message-State: AO0yUKUn5XMeXEx5GNblYc13RYwsJ+VfN9p/pP+yjS4RGpUrDWD39BFq
        kVeda8fOz0fmkGqxR4zoK4sn6A==
X-Google-Smtp-Source: AK7set/zNQJeepBp90+pb7siQybo5fz/0fjOBRUb17obj/tzEFyZevEn0oFiVuXuge8l3CN8hkHVCg==
X-Received: by 2002:a05:6000:136f:b0:2c3:e80f:6aa3 with SMTP id q15-20020a056000136f00b002c3e80f6aa3mr2835371wrz.51.1675669369259;
        Sun, 05 Feb 2023 23:42:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f9-20020adff989000000b002c3e6b39512sm2682210wrr.53.2023.02.05.23.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Feb 2023 23:42:48 -0800 (PST)
Message-ID: <5454d5c6-1151-af9b-54a3-3bdd66b621e8@linaro.org>
Date:   Mon, 6 Feb 2023 08:42:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RESEND PATCH v3 1/4] dt-bindings: net: Add WCN6855 Bluetooth
Content-Language: en-US
To:     Steev Klimaszewski <steev@kali.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Sven Peter <sven@svenpeter.dev>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>
References: <20230206001634.2566-1-steev@kali.org>
 <20230206001634.2566-2-steev@kali.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206001634.2566-2-steev@kali.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On 06/02/2023 01:16, Steev Klimaszewski wrote:
> Add bindings for the QTI WCN6855 chipset, based on the WCN6750.
> 
> ---
> - v3 No changes from v2
> - v2 drop second binding in subject line
> 
> Signed-off-by: Steev Klimaszewski <steev@kali.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Still broken.

Best regards,
Krzysztof

