Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83978597F91
	for <lists+linux-bluetooth@lfdr.de>; Thu, 18 Aug 2022 09:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243924AbiHRHw0 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 18 Aug 2022 03:52:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243922AbiHRHwY (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 18 Aug 2022 03:52:24 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F59AF0DC
        for <linux-bluetooth@vger.kernel.org>; Thu, 18 Aug 2022 00:52:23 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id w5so1114478lfq.5
        for <linux-bluetooth@vger.kernel.org>; Thu, 18 Aug 2022 00:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=E2AIxNklHpAkEmvdFb/6QmrZopBm26DEbGRIJwurv7Y=;
        b=MmEdDy7qiQ4/33PKGrN9eUKYa4kdGaG70E1X8Nv42yU4eDMpWxoy5lM1cAZxhHW4Jm
         hAc8ZaEmVwXpCJ0T+H/GrzJC0azm1b13jElQ/wn0CMUB9awiC62H/u6mkLcob5uMJJfF
         jcCIZ2r3j47tyXUUAnmWot+eGqIcH4G3waU9S6oTZ5rD1+/Rl6qp8fDHfxCb+qOhXbcK
         Pzv7LPFClQJO+UiF7Dn4r7xVVTDUv4wywwcfAi6z43JylKsr+F/YiLaOgrJfCrxjg1E4
         Nr9br5fAZzJNH6/ed3xdoTMeIjpXECiQRwmVxrsVtUOm29A4/3xeIUMVRh5ksR8EqlUH
         rj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=E2AIxNklHpAkEmvdFb/6QmrZopBm26DEbGRIJwurv7Y=;
        b=1ZNs/zCXfmxUpboZaWeO+bN27J/pvtEyS93kB7wG2BSDDI/SzEBr0uCVNyJthWBrW5
         ohvxQJYGCdcv2fvDbFPjrEt9cXbW5JqnAVjtk+0UZYMmhEBbv7qZg6g3Eg2mfdFGqxQb
         +TP9EBZ1M9G8ZD2kx2xpM9H3GaOYL30oE72Fyg+yB72Onil5JfzAkJNSmOtxcaT1NOtB
         VdKyNbQ8q8ilq1Ps/1yPxM9Orlc4qTbuQM3N58we/FDlCHtsqdxO0hBHZqt4HivtUZss
         2HcfUS6rE29Ebe/uh2SQoZX/sJ9chDx1TTqTL30Pd+XPjmYhD9I+FR8fcRerIynOxQlf
         uh7Q==
X-Gm-Message-State: ACgBeo09WoUs5JPZjpMiOVzLwoyCg9nFV/F2/2LuJNzsZT0eDmUkPHlo
        aGyKP7Q66adVZZfIBqr415icBVbmfw2hEehbtaU=
X-Google-Smtp-Source: AA6agR43J/pRDjxmBhwa4WzbL0Ysx/5gYjeLsoYRxNtdWavE4+J2zlTY5GWI3m/WGkcWmhsp8vUXN7+vHsvHPArxOj0=
X-Received: by 2002:a05:6512:2241:b0:479:6426:15af with SMTP id
 i1-20020a056512224100b00479642615afmr584278lfu.631.1660809141568; Thu, 18 Aug
 2022 00:52:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6500:220a:b0:152:f46e:12f with HTTP; Thu, 18 Aug 2022
 00:52:20 -0700 (PDT)
Reply-To: suzara.wans2021@gmail.com
From:   Mrs Suzara Maling Wan <drdavidedos58@gmail.com>
Date:   Thu, 18 Aug 2022 00:52:20 -0700
Message-ID: <CAA-vLmx5z_RgAhJdANRuYt5YMTof2OBuixRV2rh8wT4ZC=uffw@mail.gmail.com>
Subject: Mrs Suzara Maling Wan
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:129 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5008]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [drdavidedos58[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [drdavidedos58[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [suzara.wans2021[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

I am Mrs Suzara Maling Wan from (Philippine) but based in West
AfricaCountry since eight years as a business woman dealing with gold
exportation, I have a dream and desire of building an orphanage home
in your country, and i have a deposit fund to the project, but
presently my health condition we not allow me to carry out the project
my self, now my doctor has already told me that I have just few period
of time to leave because of my ovarian cancer disease, can you help
fulfill this project.

If you have the mind to help me in this project, contact me privet
email address  for more details on the way forward

With kind Regards,
Mrs Suzara Maling Wan
