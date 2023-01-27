Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF8E567EA3E
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Jan 2023 17:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231810AbjA0QCT (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 27 Jan 2023 11:02:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbjA0QCP (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 27 Jan 2023 11:02:15 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E6888CC4
        for <linux-bluetooth@vger.kernel.org>; Fri, 27 Jan 2023 08:01:38 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so5730635wmb.2
        for <linux-bluetooth@vger.kernel.org>; Fri, 27 Jan 2023 08:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVtlaBH2oW7gQDOB4EYMReZLPA6GM1pQjljM+jQPnhA=;
        b=LS8e3XXvmrSAOOfNlcAd/w+utdfOKbDy+boOtZbeEZMx3J+dghiCZIapd3IEJ80bEO
         ZQwGIt6BaNKrR4pwRJp4L/hkNg3NxR2N7OJ7rnCPo2NsRG4qD7f8oTEw+rRsF4BmVV7k
         k2w+8JUwG0L5YKvqCq6I/Azr9zv9xb30IVHYUNdbpNGKXT4e0nL2z2vkLrc8x/eLEq0d
         uxTQxVDqdG+kzDkQ36/LwdFE01t+lBTvteJ3GmqcAjUVrynl9ZK4arMklJnG8DMETK/D
         +Y6ss5dVUq5AH3tLX4O28HhRbiuuxAJEVDLDaw6yZRrIG98xBc6iok/tVlGbP//MP5A7
         uQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVtlaBH2oW7gQDOB4EYMReZLPA6GM1pQjljM+jQPnhA=;
        b=3iToqCXYq21edC8iceoo7e4JPB08cIkcAyXaEfCxe42tRFV1Dnoh+yRuqAy7SrlOlU
         WfHtx34T5RcG86hUBJFA8c3GBhuim9nwDLU1twwIuwbohxPShoB++aGxmXdIlIRcxhT4
         J5z0FYSP24U7VM6Cd9oCcJLmwdMePyANGTi2+A8o5KwaqxOMG1idmA20gjhs8Yr1sXcI
         7hN7hzk3KB3/faSmjx/x04WIn+WOk7P75xbd/ppKe2clQJLRbyBVlJb+iiWgdNZkeSjq
         Cma/rxctxWB4pWJfiOCunL4E+aJlV8RIcqbjKLlDC3nVfBGOhKAItqfVAhRwa7JAwkDo
         G4pQ==
X-Gm-Message-State: AFqh2krS/ZcB0Xw9+7w01hOaXEnKGivWKZuGdrnHyREmv9WHTAOXTdPD
        Bea9df8vukbwAy5aV+HW9+VbyRgYNFAg9i2juQQ=
X-Google-Smtp-Source: AMrXdXuJDax+UKPF7gdSGuz9t+JeSva///+hoX0tEhCzQqIh/mHoksFwU4jOXOOquTomXA6FmLco3BIuh6bai3UuA6Y=
X-Received: by 2002:a05:600c:b85:b0:3d9:ed04:727 with SMTP id
 fl5-20020a05600c0b8500b003d9ed040727mr2883054wmb.137.1674835295236; Fri, 27
 Jan 2023 08:01:35 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a5d:6d89:0:0:0:0:0 with HTTP; Fri, 27 Jan 2023 08:01:34
 -0800 (PST)
Reply-To: innocent_iddrisa@innocent.com
From:   Mr innocent Kanazoe Iddrisa <lindaqare13@gmail.com>
Date:   Fri, 27 Jan 2023 16:01:34 +0000
Message-ID: <CAPfsn2v8+RySr-VkgOhHsUSaCGsNbFGAxE+bH5y30U8WikPwjg@mail.gmail.com>
Subject: Please reply me this mail today.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:343 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [lindaqare13[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [lindaqare13[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  0.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  3.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

-- 
Greetings to you.I am Mr.innocent kanazoe iddrisa working at the coris
bank international.I have a transaction that worth a total sum of
$18.7 million dollars to handle with you.Reply me today for more
detailed information if you are interested.
