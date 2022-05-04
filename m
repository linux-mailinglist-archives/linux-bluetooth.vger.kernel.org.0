Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC85A51B372
	for <lists+linux-bluetooth@lfdr.de>; Thu,  5 May 2022 01:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383816AbiEDXVM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 4 May 2022 19:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383279AbiEDXHD (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 4 May 2022 19:07:03 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F8B5E776
        for <linux-bluetooth@vger.kernel.org>; Wed,  4 May 2022 15:58:39 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-e656032735so2725181fac.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 04 May 2022 15:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=gT0qunonoqmQDH3Sx35AGkd9jYv/vMqV6NEmgNMh3r8=;
        b=fNMc4I4jeaewbd8j3B1O4Or8uOSH9lWNuZT/bBffgFB7065JX2XWY429li18neI2wa
         soRf6oW5dNRM5Uvcjhfc6Y9StG3RASVx77Lq42lhd6ODQCdsOHZM76ryieTB4mIa0TPG
         hzre9HfSqsadCprGEz1RVJlLCSpaer/7wWqhjLTx/A63M7LhNuQVRAVnqU3+o4FfWlTK
         C5i8pOLCCzheAUbX40AeiT6ta9tzQupK5+g4y2RK+D7bD84S1RroY+txA0VPS9iJaE0i
         ZTkRac0mOSIgXYZ7SlVhSvxqLKhFmie7z6L/yDtr/1wFoopxioJGgbWGxMiVXWLuxZPW
         n8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=gT0qunonoqmQDH3Sx35AGkd9jYv/vMqV6NEmgNMh3r8=;
        b=yA+59os2q+MI0c8XKNQil7Cw9cvQHuS2m7/CrEDr6mvH8cDhM1QlgITQOw9Sw+7u8k
         /2GQ1DFJ4yQpinuKWgnC5E+taf4OeqVFhUulq/aHQu3eApn4X9ubewNkAEUeSFWETHRp
         vcJet9BtcHHQDyQXGkzJOnq2WyOKpZmA8pG4MD2kRBRuobWeoB1ymRpKNFETD3IX7wTp
         jzC3CIJW+2Bl6jYuHwEIffvsQajiFkSKoaaDYCwPbLAzqqfk2eYYva9uy9zyj8nogDJV
         OxTrogSpS9RWnEHgpZieB9gZnjJR4vRXJEx4pOgKViV2I478pmuHMq03b+AmGDccxOF7
         9KcA==
X-Gm-Message-State: AOAM531R5i6RWJjqtTAHIP+LfOjznYr80vFJ/R6VWa1dBSytTQKijrBt
        YpCIXRXvx5yvTmgnEzD0hfN/eUu4OMqjy12buoI=
X-Google-Smtp-Source: ABdhPJw2+ext7MoCVSwrPFOQK0LCsZ9Jk0kI7QwBVyscknk96p6hFU8K3KiVNZyRshvWo8tWA9xElW7WbMBJkcIUoz0=
X-Received: by 2002:a05:6870:6011:b0:e6:2d00:6b5a with SMTP id
 t17-20020a056870601100b000e62d006b5amr902685oaa.263.1651705020242; Wed, 04
 May 2022 15:57:00 -0700 (PDT)
MIME-Version: 1.0
Reply-To: nafi177z@hotmail.com
Sender: g.prosper001@gmail.com
Received: by 2002:a4a:978f:0:0:0:0:0 with HTTP; Wed, 4 May 2022 15:56:59 -0700 (PDT)
From:   Ms Nafisa Zongo <msnafisazongo@gmail.com>
Date:   Wed, 4 May 2022 15:56:59 -0700
X-Google-Sender-Auth: nDVCApw3wKw1oblZlU51SrGyPM8
Message-ID: <CAL_6emcZ_9MCit2rK+jRFG8ewgVimJECdPOF5amk7eJ62dVMiA@mail.gmail.com>
Subject: RE.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:2e listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4934]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [msnafisazongo[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [g.prosper001[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

I seek for your partnership in a transaction business which you will
be communicated in details upon response.

Best regards
Ms. Nafisa.
