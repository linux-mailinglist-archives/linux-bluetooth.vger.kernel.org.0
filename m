Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEBF05120BB
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Apr 2022 20:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244401AbiD0Rnc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 27 Apr 2022 13:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244345AbiD0Rna (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 27 Apr 2022 13:43:30 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB449C4025
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Apr 2022 10:40:16 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id i38so4655439ybj.13
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Apr 2022 10:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=3EFWB19a1Chh2SjnoysoX6/VQoqNb6piiPOAPnA2gVg=;
        b=qL/62GKXFe+RX38smO7/tUZltCd4esbfFKfuHHwhl6susAfBt15GJRcy+Bo/1AXnHs
         MUqDywkYROALXEsNhHk+XBjsz31tMI+eWGZCoKl/qD8RkVfZK26NMT9FfXF6CUt5R1RG
         4wIfxhJx5Dd1xGfB/nG7uxJr05//Vpo6P/fxoL+RUT9CSzFm1OAIBmnAn8kXBAwtm2lw
         mo90B/+/CM2JXUyTwhHzkc7mfub6hS8hxUC8CD0YkNAyxXVc6uECGL0YIyEQpXqNeMyK
         l8hDv9Lb3kZN7Ym/zKU97i9ULwkinyfROIdWFNHitzmBn/MJIp6HeB/KS1GxdzuljINh
         vsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=3EFWB19a1Chh2SjnoysoX6/VQoqNb6piiPOAPnA2gVg=;
        b=4QEGyTd+k9Djtw7slIbU5/j7Ed+uGA7benV3b6Jf11ZTCV7COobv5i6kVfPtac86Cd
         04e7dBOph97moz/msy/OPkR+dqQ8CM5R7ruaCSHTrrH1aTVgNv7n6b4kqzahZWtWh1Lm
         WSOQ4p7/nV0mE0yoHMtAjxFb9EJTFtTBLE7XsPnLCBIW4JlvQgKBQw7KzxPBZ7uCo//i
         HbOtx0ePkY37TM+0oZtYJ9AxWIDNyp9b2qCPk6S8GanV/bBo8LPHYd9U/9IjCF7dPwL/
         BvNXT3HAvS2WhMohMHhivCAVcEB3SIKafiWESCalhr5T0EvRDG3guxXdtAQ78Fs2UcDo
         Wc2g==
X-Gm-Message-State: AOAM532kisRlcDdnR3Q4vPGFFA+edQpkIAxxrOc3TJcikpT/uOwVR0BP
        8jcJoDQaAh1i+DQa8+NeQntx3vfpjxY1bvyEMLE=
X-Google-Smtp-Source: ABdhPJxs9LDf96ZelUqm62fsaRYm2fnBeYZNjjrqN79CZ30g7Pw0ztfKGL/5AXqO0qmszqG+qDKkVvnNZOdj8xD8sBs=
X-Received: by 2002:a05:6902:10c1:b0:63e:df54:7095 with SMTP id
 w1-20020a05690210c100b0063edf547095mr27483449ybu.433.1651081215297; Wed, 27
 Apr 2022 10:40:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:2049:b0:170:285b:5d9 with HTTP; Wed, 27 Apr 2022
 10:40:14 -0700 (PDT)
Reply-To: awoonorpatrick301@gmail.com
From:   Dr Patrick Awoonor <colleyking04@gmail.com>
Date:   Wed, 27 Apr 2022 17:40:14 +0000
Message-ID: <CALJPoxqu2B_obyywRQ9L+9nJt=KinBov-x0Fn8jyRbSDWxhVGQ@mail.gmail.com>
Subject: Re :
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Did you receive my previous email?

Dr Patrick Awoonor
