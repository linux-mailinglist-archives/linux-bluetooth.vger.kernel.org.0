Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD7C5A2409
	for <lists+linux-bluetooth@lfdr.de>; Fri, 26 Aug 2022 11:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245208AbiHZJTA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 26 Aug 2022 05:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244937AbiHZJS7 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 26 Aug 2022 05:18:59 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B49ED758E
        for <linux-bluetooth@vger.kernel.org>; Fri, 26 Aug 2022 02:18:58 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id cu2so2075662ejb.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 26 Aug 2022 02:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=ddKdS4x8c4ZSI9PbKdla4xMHlbecpUYnHnf7KqPY/v4=;
        b=NGAROjKMYClTCI5w7BngLHX12zT63CCE2UOo/qbw8Srl9co47DJ+7vbvamSmeVqlnM
         olswjWnLG1sRFkVoI369YuzpJVPym2TFOas6QM6s25dth+Gl+Q0T29Om/WbjTKeO8vEY
         Ey7JtBTKNCTYEWZAR3XnKMl6DmoHUPe9NeFVq7DxWaUX1yyBireno506xZgBzZMDtsMH
         urhwypxJXh2nJ9Dzh32G4EaoYitE1bb9/+KwEYob0tQkPF85HQdgBvHJXjU+UeeBBPMY
         wmRpi3FMd66Qtl24qUUkymzkVXbrwlFA+/csEjwdZSugaQlJqGF8CjmH1MZiobIbeglz
         /vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=ddKdS4x8c4ZSI9PbKdla4xMHlbecpUYnHnf7KqPY/v4=;
        b=WRV2eoTUdoVZ6lgSN34WUa2y8SRdLiRdHz9AZC0ydbD++M2DXmt+j5rXFJ+bmUsuvG
         jK+vKRsamo1pZ5j95oDYMfkjiV1VUXfDv6y6LZ/e9QkRetFMhFSWTlg7dnCOzfmANYUk
         kojN6rgWromgIyoAA166uZ+bu4z+3L7D14NzomnhARN5sC27EkazDYo8XlSe9c53iMF0
         3oVJyJIYxHrufNDXZOtWHedG/WyTtG+bFQ6tIXdyJbiMj2UPaGJf/VvA3WX2p689F9FN
         8L1h9k3KsMr+wHAB1bx7eFK7mEt45TNXQbrrkYM7hlrJfl8hBwZb9I50i4s45HryfxsN
         bv4w==
X-Gm-Message-State: ACgBeo0QgIcMTZhDAB1T6XIggZhW2JCNSDKlN8ioKIBbfbTb6sSuhLm1
        LkAfRfBHsBn2nDndMPvlx0Jt0sZy6PqFaoZ4Tyw=
X-Google-Smtp-Source: AA6agR4FX8of8XQpUJ89xzY49pSC2eoMfLqa1AKgJdLVCsnYzdu2rRfAylORIlRcJMH1yWrRycSrnWX9AEPgX42Rp78=
X-Received: by 2002:a17:907:9495:b0:734:e049:3d15 with SMTP id
 dm21-20020a170907949500b00734e0493d15mr5107339ejc.187.1661505536787; Fri, 26
 Aug 2022 02:18:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a55:c298:0:b0:1af:67e3:84cd with HTTP; Fri, 26 Aug 2022
 02:18:56 -0700 (PDT)
Reply-To: biksusan825@gmail.com
From:   susan Bikarm <susanbikarm8@gmail.com>
Date:   Fri, 26 Aug 2022 02:18:56 -0700
Message-ID: <CAG7qnpeqBAxzVENsxHBrEJGwA-burmsB2JbLUzLJ8goGia3Vew@mail.gmail.com>
Subject: Waiting to hear from you
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:642 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4999]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [biksusan825[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [susanbikarm8[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [susanbikarm8[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Dear ,

Please can I have your attention and possibly help me for humanity's
sake please. I am writing this message with a heavy heart filled with
sorrows and sadness.
Please if you can respond, i have an issue that i will be most
grateful if you could help me deal with it please.

Susan
