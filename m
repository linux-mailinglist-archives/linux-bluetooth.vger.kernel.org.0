Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80A3D5BB054
	for <lists+linux-bluetooth@lfdr.de>; Fri, 16 Sep 2022 17:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbiIPPhR (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 16 Sep 2022 11:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbiIPPhM (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 16 Sep 2022 11:37:12 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77D597B34
        for <linux-bluetooth@vger.kernel.org>; Fri, 16 Sep 2022 08:37:11 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id g5so33085791ybg.11
        for <linux-bluetooth@vger.kernel.org>; Fri, 16 Sep 2022 08:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date;
        bh=WS4wMSByWryX8P5xXNg6/F9cuXaZcQ/JDEQQ6/oYhcI=;
        b=GfeKhhTnG6rJ1nCybDv37mL9OaaEGOZeBJLeF+wqAiIb5zF78B4pQKHisVS8kY8Qtb
         0AiOAjXADtiOgowDehtBXy7x8y/KYhjBcbBd49q4LSFR3G7C0orAjW0KjS5Rp8f150HZ
         /U/oOPC6u4WP1WOArTIj6Spom/bnbsYkJVMLvOL3sHsWwp0Ed4e3r0n9Qjp7WD4azrBO
         ciGQ9gDblEkQAF8I4Dp2SzGl3UAr/hwz59bRi0A4Zid7allOCAUXllVRna2tA9Xrli/Q
         Evnt0G9/fah8fJeTrK2PioG8kdjwckkSZjrmYC+Em7S60m3CW43OWOihrJkhPI+bY2zl
         cEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=WS4wMSByWryX8P5xXNg6/F9cuXaZcQ/JDEQQ6/oYhcI=;
        b=kxPWYtKagvkPIBpENwcHXXto1xOgCp/r5W2YEVlVGwU0GbqFLCzcfFoCYgUCm9BCNN
         LJ+anP1kUfOuIzArSSMfqc9Dk4hyb8A4AijihOfcsDyMCltYeDeK9AfIEEPsmvWHJwlU
         lpxGVO4tEwaUVdUMeGJKZO/9neDx2Iozo8Ozg6e2PAK+vsnXIvNIP/g3hQgD8y6WaILs
         6ycND/y+jx/xmWEOxmcjKZKo6SDo8h2/QGYePOmhbv6HXd5NjKc5YumYRd5YctKyM/Jt
         3N0r3W3u+8/Wxb1XFkf20Tm74BbVy6EMgzaptiLGEDJMzWzbpEbCFE9m3E8qJl94SjGh
         O6Cw==
X-Gm-Message-State: ACrzQf09Fdzxln78Ei/KXma8eEULHVTKaGtd7jwbuEkUApq58hcOTCot
        gAh2UCZ1wpN1OnZI9zOe8xLWOE/MTSYzByPW7g==
X-Google-Smtp-Source: AMsMyM58e7a6F7CiW63c1qU62w0Jvg6UCdZ3cib6UlSFerZZnywi+BpFJWeB+8LWwFAITxDI7EnMIa/sU+cw/9YZa4A=
X-Received: by 2002:a05:6902:15cf:b0:67c:1ee7:149 with SMTP id
 l15-20020a05690215cf00b0067c1ee70149mr4805612ybu.594.1663342631104; Fri, 16
 Sep 2022 08:37:11 -0700 (PDT)
MIME-Version: 1.0
Sender: chantalstark91@gmail.com
Received: by 2002:a05:7110:4b14:b0:191:623f:b301 with HTTP; Fri, 16 Sep 2022
 08:37:10 -0700 (PDT)
From:   Aisha Gaddafi <aishagaddafi6604@gmail.com>
Date:   Fri, 16 Sep 2022 15:37:10 +0000
X-Google-Sender-Auth: _CWx7KLEkQVPZLret8RFlrfwUZ8
Message-ID: <CAOzO0HTsGSxdGhj=kupuwA=3zZEgtRL1Vuvbj-YYmH1cSKCupQ@mail.gmail.com>
Subject: Investment proposal,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.3 required=5.0 tests=BAYES_99,BAYES_999,
        DEAR_FRIEND,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_HUNDRED,
        MILLION_USD,MONEY_FRAUD_5,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b29 listed in]
        [list.dnswl.org]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 1.0000]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 1.0000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [chantalstark91[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [chantalstark91[at]gmail.com]
        *  2.6 DEAR_FRIEND BODY: Dear Friend? That's not very dear!
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        *  0.0 MILLION_USD BODY: Talks about millions of dollars
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  0.0 MONEY_FRAUD_5 Lots of money and many fraud phrases
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Dear Friend.,

With sincerity of purpose I wish to communicate with you seeking your
acceptance towards investing in your country under your Management as
my foreign investor/business partner I'm Mrs. Aisha Al-Gaddafi, the
only biological Daughter of the late Libyan President (Late Colonel
Muammar. Gaddafi) I'm a single Mother and a widow with three Children,
presently residing herein Oman the Southeastern coast of the Arabian
Peninsula in Western Asia. I have an investment funds worth Twenty
Seven Million Five Hundred Thousand United State Dollars (
$27.500.000.00) which I want to entrust on you for investment project
in your country as my investment Manager/Partner.

I am willing to negotiate an investment/business profit sharing ratio
with you based on the future investment earning profits. If you are
willing to handle this project kindly reply urgently to enable me to
provide you more information about the investment funds..

Best Regards
Mrs. Aisha Muammar. Al-Gaddafi..
