Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37E186A734E
	for <lists+linux-bluetooth@lfdr.de>; Wed,  1 Mar 2023 19:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjCASSq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 1 Mar 2023 13:18:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjCASSo (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 1 Mar 2023 13:18:44 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703153668A
        for <linux-bluetooth@vger.kernel.org>; Wed,  1 Mar 2023 10:18:42 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id m8-20020a17090a4d8800b002377bced051so177541pjh.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 01 Mar 2023 10:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677694722;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SMt7axMQbQeEE0CBN+7cLsm38pqjF8+UDAWISk+ju1w=;
        b=nIk6YSHg6X0PbNo+2KHmx6A8IcfkVst5qQRg6Z6AgsQyjqFPR0sjP0AqIjmGkPAKfB
         /jGJS2Rl7eIdtMKzGloVJvdy4OPxOw9Anq5ujpjln+nYbRG0KFXvucFAW8yT7o4BaSox
         /Kius/Jdro7rok/RQZyzMKVxdbDxbBf5td2tjdVTvPPTjQJOSlCI5R8mggb/bwq3y7cC
         P6vQvWAYu+mW6npH40nEnv5NIoTNnfH9cJdaTcMxcxNcbcfTCzac0lOdcjnse9uEbmb8
         jorO87Abs4fY0vl+gMRpdI50XKllLGOK8AOxMEgTSYmKRtH//b9Ydv8UJI+41BFHF+FN
         SJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677694722;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMt7axMQbQeEE0CBN+7cLsm38pqjF8+UDAWISk+ju1w=;
        b=q+FakBRGmnefKP40Tr2TUwck48ieYY5sSfYHniYOYGlPd2wDUYTV84M9vc/MbG1i4O
         5aJxUsHTVM1av+z2YvrInLgvu+HW0kr2i4//NJbhxcz2DB+wizRQ5Wj6HQnmr87LzTnB
         mWxTS3xFFx5sUh8V59Hn35Zwo54K+gKdD3cXBX22nyhRQ1zHWG23As0uN8aG17Szp04a
         0vplprTdhicsAG+AXn7UgOwQF+xJPc5hGlqKVExZHgTpAwaOdo92iyOtrvzqtaC7UWnv
         OuI2lhcdX9eedaf9p+I/yEcvvYxYFzj74GIxVgzmhfArQYs/ZAjGYiN1Hku0kXrdGwWm
         WsIQ==
X-Gm-Message-State: AO0yUKXOLS9gfmdB9eOm4GBUC4561+k/O+QWtTYmBGKN+9cwgsmJ5VdG
        xX/q7YL6O5DNLl6E6pap7aMcx/lQZiNKY5lcsj0=
X-Google-Smtp-Source: AK7set9eix+P0nlT80/20cyINjOka8BHdmMC2Se0y1QAcfhudRjQQegcqdrU+3OrBst/olgIpBmvip7weUL8ItoVnQk=
X-Received: by 2002:a17:903:2601:b0:19a:fdca:e3e9 with SMTP id
 jd1-20020a170903260100b0019afdcae3e9mr2704096plb.10.1677694721686; Wed, 01
 Mar 2023 10:18:41 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:e818:b0:44b:720f:304f with HTTP; Wed, 1 Mar 2023
 10:18:41 -0800 (PST)
Reply-To: sackrobert@yandex.com
From:   Robert Sack <sophiebrandon679@gmail.com>
Date:   Wed, 1 Mar 2023 19:18:41 +0100
Message-ID: <CAFXeZCTb5+bsMLEJ=sLzAUeOhD2JcpoL4s1h_wwneOYtXvCFnw@mail.gmail.com>
Subject: INVESTMENT
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1044 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [sophiebrandon679[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [sophiebrandon679[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  0.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  3.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Dear Partner,

My Name is Mr.Robert Sack from  the United Kingdom.
It is my resolve to contact you for an investment proposal.
I have a client who owns a pool of funds worth Eight Million,Five
Hundred Thousand British Pounds(=C2=A38.5m)
and wants to invest in any viable and profitable business that has
good returns on investment(ROI)
such as Manufacturing, Agriculture, Real Estate,
Hoteling,Education,trading and others, in an effort to expand his
business empire globally.

If you choose to partner with my client,please indicate.

Thank you in anticipation as I look forward to reading your reply.

Mr. Robert Sack
International Financial Consultant
