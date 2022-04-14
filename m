Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 574C25015F7
	for <lists+linux-bluetooth@lfdr.de>; Thu, 14 Apr 2022 17:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbiDNOqE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 14 Apr 2022 10:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242465AbiDNOGW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 14 Apr 2022 10:06:22 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E0E048E4D
        for <linux-bluetooth@vger.kernel.org>; Thu, 14 Apr 2022 07:00:45 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id q14so6118787ljc.12
        for <linux-bluetooth@vger.kernel.org>; Thu, 14 Apr 2022 07:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=IT3baNs1cYLv1VfMNDHtjFEZoYHbdLniO99+ccrcjHo=;
        b=jtbSOTi+FLZRYM9u6g9elrinEQLE0TzdOu6MDDQbo1a37CGLfxHG4g4WtrFcNRSkQV
         5bNpka6mpDtSZII5ZpzDyzhkR9fWccdt3krWDHRyyWIunEWZ6bcRNv2yH6OJDGDCy7JC
         IkX9BFrGHCvBvfEYAAOtbWsKhss0oIFZfOzwD8baQ3BqhNbfyoVci9u3roxsDwbcCndg
         VmkzCVBQNBXsh3FIqV3nwrrQ529aF+KdKq3hROypJy45OrA4Db8agJjVomRfVNLql2Lv
         wBJMgTI65rOEm5VyTBk6fcSpAmuTMOUh86ZUBxbdB1tq9SW0d2NwowV/7OH+GfrH+Tfr
         5djA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=IT3baNs1cYLv1VfMNDHtjFEZoYHbdLniO99+ccrcjHo=;
        b=jnjjgCGgmM5fJp7LNbg8cf+NPA+GRlsHy/cGAtvyv0+31S69EjJrEcJnyHp7PEy3Gw
         vzNFerHxXSHF61Ie28U79LHJenqWrok40h4q5t6aK5R5/zwQ7B7KYfPIziU0xfc4TJh7
         8SRhrYi5ZE6x+z48tlMwpl3avXSv53wxerGtYKqrrTlZEJOgbYtjIkNk8Hs6tT7mYn/Q
         JuXPiXHCc6N4vLLt+xOzFT44XCoOUnEclOwyh+nri6IqrkuhMlbYQaOpOMe4e1dx2XFB
         2ASO6Gi2S4HLeGbnuBMeM2i6HXohNBZvIhG2dz8HAuDz2+gS9T37KtRvFYVNlTPgiMoH
         xY4g==
X-Gm-Message-State: AOAM530UZ/ghMvtZxHjw2y8/ej6Utf528Duc9eO2lL44bLikqH+45dDe
        BAJyU1lbziLw9hrsU7Ce051KQGsvLDppNr3xtKw=
X-Google-Smtp-Source: ABdhPJxpItqo+37cE4AMSygohF3Nrku8cbRYiWDvjWana+xOUAbxdHv13VEfSPZVj4q7dftvyCQJY02DvdutcMoWvOk=
X-Received: by 2002:a2e:b8c2:0:b0:24b:6b07:fafd with SMTP id
 s2-20020a2eb8c2000000b0024b6b07fafdmr1741268ljp.207.1649944843461; Thu, 14
 Apr 2022 07:00:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6504:144f:0:0:0:0 with HTTP; Thu, 14 Apr 2022 07:00:42
 -0700 (PDT)
From:   rymond chan <graceel047@gmail.com>
Date:   Thu, 14 Apr 2022 07:00:42 -0700
Message-ID: <CAOTqtT5kQwjpy_+YZ5aNjwHACc02F3NHEwhPTztMODNG=4+Mqg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.5 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

-- 
a business proposal worth $47.1M USD for you.
