Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9867751E0AB
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 May 2022 23:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444364AbiEFVJk (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 6 May 2022 17:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444415AbiEFVJV (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 6 May 2022 17:09:21 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A071D0C1
        for <linux-bluetooth@vger.kernel.org>; Fri,  6 May 2022 14:05:35 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id z5-20020a17090a468500b001d2bc2743c4so7885711pjf.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 06 May 2022 14:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=VSSUIwdzgxQxnEkB7+u7pnweyPajIQMP3nQqWYs8VX0=;
        b=gmmgqd2enKSblS7bCmnm2ivMD5ZTgpfnW/j/MNizwci6pH3rJEQXq3L9+ZdKL4HUTr
         YB+Dhjpe2MkKztjhU+UDqenquKjwj+pPKOCMhVrtxmSec4u8GzSTlKnYmXQROsqwJ7YF
         fpyt4ZWxoGKOIdNHSzn6X8527WsL9seFFIUc417Aceaz0HyqyfLzhrTyiK1hfEoe7bgf
         O66BH+VPp/USBREXReLf48zIB9vdsgcsn+kPDpodP7afE/7TIv51GGMLWkNAhK51uLVF
         lGR5deZqynPeLivFeL+j4lPiytJOppTfXKPKuEkvtzBoRNP5faKFInL0FLuVz9LTzW90
         0CuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to;
        bh=VSSUIwdzgxQxnEkB7+u7pnweyPajIQMP3nQqWYs8VX0=;
        b=OAw90abAET7YbMQ1eWBG6dSYYpjDL3TIbFDhsW0960JDxWaacEVhL8nwU2h4FqDaQw
         7DnFuCGFAHh/kp90W5r6nKnPkPY4gEbUeDsRP+0rZo0b/nKtPlrmxEXMuqQbpiX6iX6f
         wdA8o1WWkN3r6qk4sz8Eklg+oCWB0Tjk3/7sVvIO+IGpGvw7y6EX2i/BwPPOfU9co0FD
         YUGMRVR7CfAtBABmXp3/8UUxNoDs48p9rQ7uFn5cpLJKHbH1DhN5MpXuhX7qYCv/8Sly
         cnl7fLQcPqSObF48hRXKawcONRTgiK/L0+6rLVtlej8HcxWg9JCujWzfn1HTBiN6atOz
         kmDA==
X-Gm-Message-State: AOAM533RYKabBBg/W8wveBW0n8pqRO8DamyGz2NOs3zEXFkwRChu6CWy
        SePBS9Q73Zd9Z2urj8zYPgApcg+Z8zENffS0WA==
X-Google-Smtp-Source: ABdhPJyqTkc39jIaJ9/Rbqdi6sONfGmoHQRCW6ADRHNTA3OhSOJwlsoTVRnEtva6v71BUuTBbiWSrg7BAnP42QBwIqU=
X-Received: by 2002:a17:902:a501:b0:153:f956:29f0 with SMTP id
 s1-20020a170902a50100b00153f95629f0mr5598333plq.120.1651871135500; Fri, 06
 May 2022 14:05:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac4:9906:0:b0:4ba:807b:b8f3 with HTTP; Fri, 6 May 2022
 14:05:33 -0700 (PDT)
Reply-To: warren001buffett@gmail.com
In-Reply-To: <CAD_xG_pvNZK6BFCW+28Xv4DE=_5rbDZXDok2BYNn9xw6Ma7iow@mail.gmail.com>
References: <CAD_xG_pvNZK6BFCW+28Xv4DE=_5rbDZXDok2BYNn9xw6Ma7iow@mail.gmail.com>
From:   Warren Buffett <guidayema@gmail.com>
Date:   Fri, 6 May 2022 21:05:33 +0000
Message-ID: <CAD_xG_o-NeOti3yu7R9R5-myJ=Pi4nnU5Tuumw-xPcT-nT8e=Q@mail.gmail.com>
Subject: Fwd: My name is Warren Buffett, an American businessman.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1044 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4978]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [guidayema[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
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

My name is Warren Buffett, an American businessman and investor I have
something important to discuss with you.

Mr. Warren Buffett
warren001buffett@gmail.com
Chief Executive Officer: Berkshire Hathaway
aphy/Warren-Edward-Buffett
