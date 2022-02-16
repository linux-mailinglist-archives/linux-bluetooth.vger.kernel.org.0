Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A96554B934F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 16 Feb 2022 22:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235204AbiBPVla (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 16 Feb 2022 16:41:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234834AbiBPVla (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 16 Feb 2022 16:41:30 -0500
Received: from mail-yw1-x1144.google.com (mail-yw1-x1144.google.com [IPv6:2607:f8b0:4864:20::1144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2096A2A0D52
        for <linux-bluetooth@vger.kernel.org>; Wed, 16 Feb 2022 13:41:17 -0800 (PST)
Received: by mail-yw1-x1144.google.com with SMTP id 00721157ae682-2d66f95f1d1so13186857b3.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 16 Feb 2022 13:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=m0TMDQXrKCMlQ/9UmN6Gtg1Bk4E+XAeQVtlmy8Kzj+o=;
        b=CSwFOyf7AyUEDF7t+o3B7ZcwWhCW7OysSPxe+OuYUe64ippTNAbgBoohv8WRkQ0up2
         HU0xc6EUCqNRRVSTeCYzb9oZLpOdGg1eCvaJMCd7fcl6X5Do7t6YbkiIVIEjPKin9Ts/
         x5fMW2XJrk3ZCBVeZe0uDKO0Sc8ANN8CUYuVz//AfkS8VYAofebQnwMmy30fC8t1Gwu6
         jzSOlHVpf1lbYMiK0CjcfEG60PXNHzBNj7rezXkPhEAifOup+70mTNXCE6nHIxx4pO6b
         JT1qn45Ik0hluIiXall0LBTatOB3q/iTNf8vFGepFZnvX9l4PUK0piQ1qqziOY/BLatM
         FB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=m0TMDQXrKCMlQ/9UmN6Gtg1Bk4E+XAeQVtlmy8Kzj+o=;
        b=WOfOh50h058p4BkC55Jjz9+ve7aJI42/B2k6Ya1KkzAKbFptw6iNA8Wfr9UfJ6eYTM
         jMtAWxj5LU7PNjWnpCzoAOqmWqzbnqolzI1Ab9CRv6f4mRHun51+2vLDcYmZ1bnZ5wGs
         1dNMryFjKn4I9IcYlltRliT+9PghGpqNPrIhEvM+fM55rlzeXr10b+D81eSRV99GTPC/
         BH6JwCRcIn99BH6J8x+4zLAI1kiNKLzokYGj6+s53XYtgwoS56d/w6tM39R5MwHlDn40
         JUiieU50Kp9pWUrsktoVpY8BHj2gdVtNvNvgB5q5wf1392lwLPdBxpVwnodReoIXR2LN
         hTsg==
X-Gm-Message-State: AOAM533htIp/Cuuphj3moVpbIbUSfMeATsMo81tLkf5K/frP7NSEfSGI
        BGfbX/4B2lFYEcB02ZXL6mGFL/aPnDiSvAqb7LE=
X-Google-Smtp-Source: ABdhPJyk3MbFBo5Q+pCCQAMxmIrQ6STz338eGJQ93JfaHr9q7pjDJ839xX0KwqsOXiiCkN4DSgYsw4bZGjiJ88IY8pA=
X-Received: by 2002:a0d:f785:0:b0:2d0:e9ac:faa0 with SMTP id
 h127-20020a0df785000000b002d0e9acfaa0mr4185700ywf.432.1645047676419; Wed, 16
 Feb 2022 13:41:16 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7010:724f:b0:20e:3c0b:2bd0 with HTTP; Wed, 16 Feb 2022
 13:41:15 -0800 (PST)
From:   Bright Gawayn <bengabrielb282@gmail.com>
Date:   Thu, 17 Feb 2022 03:11:15 +0530
Message-ID: <CAMMweGyRpWadKHeg29eTbVqZSt+psZ843x2dYKLJWhcd0=PRbw@mail.gmail.com>
Subject: Supply Of Raw Material
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Good Day
Dear beloved.
 I am Mr Israel Ronald, we use a certain raw material in our
pharmaceutical firm for the manufacture of animal vaccines and many
more.

My intention is to give you the contact information of the local
manufacturer of this raw material in India and every details regarding
how to supply the material to my company if you're interested, my
company pays in advance for this material.

Due to some reasons, which I will explain in my next email, I cannot
procure this material and supply it to my company myself due to the
fact that i am a staff in the company.

Please get back to me as soon as possible for full detail if you are
interested.

Thanks and regards
Mr Israel.
