Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACB936C8A97
	for <lists+linux-bluetooth@lfdr.de>; Sat, 25 Mar 2023 04:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbjCYDKv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 24 Mar 2023 23:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjCYDKu (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 24 Mar 2023 23:10:50 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D11C1422E
        for <linux-bluetooth@vger.kernel.org>; Fri, 24 Mar 2023 20:10:45 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id g17so4580043lfv.4
        for <linux-bluetooth@vger.kernel.org>; Fri, 24 Mar 2023 20:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679713843;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21T2ruoV7Hb2byNjXRrKdStLSJ9N1tOpZrLYkVqWI4g=;
        b=DVBp6IM4QEk51zOjXsKkHWEQPmDzXCe512wtZJN5rOWcaqKLFdq3Jzy31Q3JVfY/E3
         sT7PKEJmuyNz7/dHGpbT3//qOpNLnmt95/jiomDdP2JsEX+MmGf21i6RcfM2BRqNYyKZ
         5tEYUZJNY7kC7Ua5yV91ofI7KhFApzwvetmf1cj1SYQHTeX/UXk5DKmdTlre6akTa4vk
         SurS1wF633sPE51+E+eiXgB5IWT6K5z5M6U7s4ZxqjlsHGMoBYWvnosJ62DJ8wh+6nls
         T+8wg+Mjyawy5ASWtKBbtxeQpKPNEBcgmrDIpC6KWtDsQn/Z3jSTFCmnhPuG+M8AXuUz
         UEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679713843;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=21T2ruoV7Hb2byNjXRrKdStLSJ9N1tOpZrLYkVqWI4g=;
        b=VVnuNKr2cGAWmgLAjsEiGGghbDoDyQX6p+UJyDrd0C6fWrMUpTBDkBhKLbjY54G3eV
         SJIld6kPsxc0PEdvb4o7zW34vMhjc7rgiEnT6YivFxMGQhRHd/ik7cFzGEf/MLAirm1M
         58vIliDqxOvmoGvjzxF9SD5G5dfCkR4YAP8KxmT23VcOtjMVKb5pBiJGx2+vzWDXowpK
         Nfy4cqE2hUkrNczoNrwo2r/aZYABOmk+ZbUuyMGyq9Sxr49Qs6Dl940BzNXEDmrpI4uZ
         R7PbZGVxkkf+GO6XbFSVazo9+Terv92iAkcX+er1FvaqtQcPYeT9MINjaaEnU18NmN1y
         XW6Q==
X-Gm-Message-State: AAQBX9fIL9O3PRVowVHZkCdrEAYb/MLFM7QYQ9K2dMG6NssTKnrMPbzz
        TL2WayhGLLQW4HhJXMGJetCCtFhNByTR8AP0NPU=
X-Google-Smtp-Source: AKy350a3WMVHJt/+HLtDaQWymMLL0z+GbI1iDxzNStu1tLwQzTtw8HJhDzWkPTb6EsfGy58NzpZnDHFJg61+MhoZftA=
X-Received: by 2002:ac2:55a4:0:b0:4eb:a8c:5f22 with SMTP id
 y4-20020ac255a4000000b004eb0a8c5f22mr83184lfg.5.1679713843640; Fri, 24 Mar
 2023 20:10:43 -0700 (PDT)
MIME-Version: 1.0
Sender: ahmedmusas66688@gmail.com
Received: by 2002:ab2:51a:0:b0:1b2:c788:b617 with HTTP; Fri, 24 Mar 2023
 20:10:42 -0700 (PDT)
From:   Mrs Suzara Maling Wan <mrssuzaramailingwan12@gmail.com>
Date:   Sat, 25 Mar 2023 03:10:42 +0000
X-Google-Sender-Auth: a40wMiAsSmxC1nVfnR8u9cOFdL4
Message-ID: <CAEiNFvY-=HPnpStGByJa4EQH1uVu=GADGYVzNbppj=355or+mw@mail.gmail.com>
Subject: DEAR FRIEND
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=DEAR_FRIEND,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,T_HK_NAME_FM_MR_MRS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:143 listed in]
        [list.dnswl.org]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ahmedmusas66688[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ahmedmusas66688[at]gmail.com]
        *  2.6 DEAR_FRIEND BODY: Dear Friend? That's not very dear!
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

I am Mrs Suzara Maling Wan, I have a desire to build an orphanage home
in your country and also support the poor and less privilege in your
society, I want you to handle this project on my behalf, I have $4.5
Million Dollars with Ecobank to execute this project .

If you are in a good position to handle this project, reply for
further details of the project

Regards
Mrs Suzara Maling Wan
