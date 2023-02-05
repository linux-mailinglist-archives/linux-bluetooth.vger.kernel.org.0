Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB7468B1E7
	for <lists+linux-bluetooth@lfdr.de>; Sun,  5 Feb 2023 22:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjBEVRS (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 5 Feb 2023 16:17:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjBEVRR (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 5 Feb 2023 16:17:17 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FEE216AE1
        for <linux-bluetooth@vger.kernel.org>; Sun,  5 Feb 2023 13:17:15 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id mm5so1724996qvb.12
        for <linux-bluetooth@vger.kernel.org>; Sun, 05 Feb 2023 13:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQpfxqbj8W16EcaK4RqVCodrekeKSrjK/jm5qyTP/Lw=;
        b=o49zfJQTX1TVubYCthchKrDz11Sc8q44WgHx+9GehoCmw1a/UUOBGtSbW8mJtT9Nhe
         OYPaFlhphng5zEAm1oRYXUhSPkEDQXbVKeTR6LdFNSWHMnv0GOmElv4bpNRmXmgpkcs4
         h5VwkMGb0cH7EL2rAuGhV/dYkMMdCMQ/8YKu1Oe7yUHn3rFflfF/S4DEC6ja8bEhXDDZ
         +YeLcpEFmwZjfjFYTC5EUCSHN7pDsNUBsJctDr4yg3GVmC8m7f8SBPCZiad651ZM6SUj
         R2Hrj+QbGTCZxNs8Ch6c0TYt4mcPKpuTPEP888KxqtXHcxfkgHwsZcWEBs081QhT22Kd
         7A8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQpfxqbj8W16EcaK4RqVCodrekeKSrjK/jm5qyTP/Lw=;
        b=iQObSL0Bf22jEuoEbkS4rICSSnV8UMuF0+tSoKfJDczqJ37nTLEToc5ImHw1FyPkLq
         nlacyZU+vB+zDEcrRm92RjNQkiCkAjXhGM0Vyb6GmEC9jN1ElUTQ6iT7h83nktasOZpu
         h9c8A169a57m+DBKOJ/6VnisFmVvTaMY8hMGf2uYuOlo35k4k8iC8QM4VusRK4PfvVmv
         jMerjX2Jw/2QtQ3+kISNrVH9gT7AtrXpBjVllbBNrrAKzUDxFS1DTwFCAG/zJ71JmF9r
         prc8aWc19PPCtIsHLqf1mcMYfTRAz79TYpVJBjP3htq/cScbz0bXzkwo+3DEw4Sq3GjT
         mf3A==
X-Gm-Message-State: AO0yUKWhp+rh3JDhO+fEbQ5lWPR5k3CK9vTD84uhqrbPMj5smzofU0r/
        CJ20K4S95/qnZp3MWcRHwIgagg==
X-Google-Smtp-Source: AK7set+SbqcAB7CSGrzF8/8vOEuKkbVHEowhg2nRY4TOn6pW9Wya4yVk0B/Rwf7K0CZjvcRRvCAHtA==
X-Received: by 2002:a05:6214:2582:b0:56b:eb9d:4342 with SMTP id fq2-20020a056214258200b0056beb9d4342mr11420162qvb.49.1675631834415;
        Sun, 05 Feb 2023 13:17:14 -0800 (PST)
Received: from localhost (23-118-233-243.lightspeed.snantx.sbcglobal.net. [23.118.233.243])
        by smtp.gmail.com with ESMTPSA id k1-20020a05620a414100b007112aa42c4fsm6196519qko.135.2023.02.05.13.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 13:17:13 -0800 (PST)
From:   Steev Klimaszewski <steev@kali.org>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
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
        Sven Peter <sven@svenpeter.dev>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: thinkpad-x13s: Add bluetooth
Date:   Sun,  5 Feb 2023 15:17:11 -0600
Message-Id: <20230205211712.48001-1-steev@kali.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <CABBYNZJPZChB0eOn05oFd2mknzOmr1RJRW3LFf3jbq_jpQ1UGA@mail.gmail.com>
References: <CABBYNZJPZChB0eOn05oFd2mknzOmr1RJRW3LFf3jbq_jpQ1UGA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

>Hi Steev,

>On Tue, Jan 31, 2023 at 7:13 PM Steev Klimaszewski <steev@kali.org> wrote:
>>
>> >On 31/01/2023 05:38, Steev Klimaszewski wrote:
>> >> Signed-off-by: Steev Klimaszewski <steev@kali.org>
>> >> ---
>> >>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 68 +++++++++++++++++++
>> >>  1 file changed, 68 insertions(+)
>> >>
>> >> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
>> >> index f936b020a71d..951438ac5946 100644
>> >> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
>> >> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
>> >> @@ -24,6 +24,8 @@ / {
>> >>      aliases {
>> >>              i2c4 = &i2c4;
>> >>              i2c21 = &i2c21;
>> >> +            serial0 = &uart17;
>> >> +            serial1 = &uart2;
>> >>      };
>> >>
>> >>      wcd938x: audio-codec {
>> >> @@ -712,6 +714,32 @@ &qup0 {
>> >>      status = "okay";
>> >>  };
>> >>
>> >> +&uart2 {
>> >> +    status = "okay";
>> >> +
>> >> +    pinctrl-names = "default";
>> >> +    pinctrl-0 = <&uart2_state>;
>> >> +
>> >> +    bluetooth {
>> >> +            compatible = "qcom,wcn6855-bt";
>> >> +
>> >> +/*

>> > Why dead code should be in the kernel?

>> As mentioned in the cover letter, this is a bit closer to an RFC than ready to
>> go in, and I do apologize that it wasn't clear enough.  I do not have access to
>> the schematics, and based on my reading of the schema for bluetooth, these
>> entries are supposed to be required, however, like the wcn6750, I have dummy
>> data entered into the qca_soc_data_wcn6855 struct.  I know that these should be
>> there, I just do not have access to the correct information to put, if that
>> makes sense?

>Well you don't have the RFC set in the subject which is probably why
>people are reviewing it like it is supposed to be merged, that said I
>do wonder if there is to indicate these entries are to be considered
>sort of experimental so we don't end up enabling it by default?
>

Initially, it was meant to be more of an RFC/RFT, but as it turns out it works
pretty good with the defaults in the bluetooth driver, so I've made a change in
v3 to just make a note that it's a TODO? I'm not sure if that's okay or not, but
I'm sure people will let me know :)

>>
>> <snip>
>>
>> -- steev
>--
>Luiz Agusto von Dentz

