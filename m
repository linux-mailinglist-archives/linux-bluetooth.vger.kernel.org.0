Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44B2067373A
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Jan 2023 12:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbjASLoV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 19 Jan 2023 06:44:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbjASLnv (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 19 Jan 2023 06:43:51 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6454D46722
        for <linux-bluetooth@vger.kernel.org>; Thu, 19 Jan 2023 03:43:30 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id r2so1570301wrv.7
        for <linux-bluetooth@vger.kernel.org>; Thu, 19 Jan 2023 03:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DsM8SnUX6738vv+FuZQZAB/Sb1enJJrq9R2KmfyF4DI=;
        b=I/NXo+JB+dcup6NvcY8BqxzMi77cSBmI2IToRjwoTrQqSmADhE+sn4M1eU9bhKi1QP
         N7W/AGnmDS83tZtL91EJGXFINWvkUUWmMERIMmM2jJnxmSQo51T7j0hMEhHHYb0S15AV
         kTix2fUMeczs5T8IF7DnYBbY1Cnuwza0sxbFPAE8CdLJo4lwuylQ9aLqHs5iNuc1nOxR
         n6ZinYbjOWPYAqajmOE48LjEw96HGmfDpoStrM01GS2WGQaVj5tn58faWtBgxHtULUrO
         eC7TXRsJZ1pQWv5bc+9v2q37CiCKnvwSgsFMHtKbpFvmY2qQoTKARBbuGpaJ66N9gMok
         Tq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DsM8SnUX6738vv+FuZQZAB/Sb1enJJrq9R2KmfyF4DI=;
        b=SeKZGMtk2S1s3oMKt4Pz7JZLDHM+bbpUkwOLK977HLGTXFU8DPe/7PH9Djb5DbMU4v
         VKFx++1kmmgU49WC4N3ER7NOd41ihwxikKn0SRjSbE6aHi0yb9amnyvfj6v8kELuAqoW
         3fJW81ZrXHcD4wv1vfwxC28i9ICqdMuE6KVDxC79XM4EcYbowO+NIy84v5eTiQEaW8W4
         2b6uQu22SMsXJkSMyqxeZ0cEcn+GU2ynZ+wKqMm5MU2IZ3XA+6lAr4ECNgqxx4JLISYI
         tsyDH9ASxPS0OiYUREDiyFmXaQqW1R4qkRkaJtLlFds3cx7xWnBmtHeYgWCfeU4ZNLJ0
         SVqg==
X-Gm-Message-State: AFqh2koFizYJsga2WSKvwppq+KFfPRSIlEN07MP+li/LMo3yGVqozpEd
        xZ1VB53ON6nTI+oe8mqSyXeHWA==
X-Google-Smtp-Source: AMrXdXv0v3jBWqBuFxLi8NxQbVFDlr7srs6jAca5/ZayShqefie0jHw4QWVBoBpugpkzBHTlW5nSZA==
X-Received: by 2002:a5d:6988:0:b0:2bd:f18d:e909 with SMTP id g8-20020a5d6988000000b002bdf18de909mr8898365wru.1.1674128608983;
        Thu, 19 Jan 2023 03:43:28 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l1-20020adfe9c1000000b00289bdda07b7sm32739711wrn.92.2023.01.19.03.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 03:43:28 -0800 (PST)
Message-ID: <73e4c2e5-800d-5595-004c-03f9cdf7f567@linaro.org>
Date:   Thu, 19 Jan 2023 12:43:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v1 1/4] dt-bindings: bluetooth: marvell: add 88W8997 DT
 binding
Content-Language: en-US
To:     Francesco Dolcini <francesco@dolcini.it>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     Stefan Eichenberger <stefan.eichenberger@toradex.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20230118122817.42466-1-francesco@dolcini.it>
 <20230118122817.42466-2-francesco@dolcini.it>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118122817.42466-2-francesco@dolcini.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On 18/01/2023 13:28, Francesco Dolcini wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Update the documentation with the device tree binding for the Marvell
> 88W8997 bluetooth device.

Subject: drop second/last, redundant "DT binding". The "dt-bindings"
prefix is already stating that these are bindings.

With above:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

