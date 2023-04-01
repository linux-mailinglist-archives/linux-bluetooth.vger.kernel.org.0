Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFC16D2EE8
	for <lists+linux-bluetooth@lfdr.de>; Sat,  1 Apr 2023 09:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233537AbjDAHhj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 1 Apr 2023 03:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233517AbjDAHhi (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 1 Apr 2023 03:37:38 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1471811151
        for <linux-bluetooth@vger.kernel.org>; Sat,  1 Apr 2023 00:37:35 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id cu12so16182752pfb.13
        for <linux-bluetooth@vger.kernel.org>; Sat, 01 Apr 2023 00:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680334654;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vE40mJuVkISt0zg8IVAmmNvtPq9ArtEbvKSLEgCOttk=;
        b=GDsKVagSaIQ3EUdA7FAfkiQbdhQY+1+dUFCPXj4lWsxN3qnKv/lsflRr/q8ReKy7Yw
         133yBbDddUiO0kdCaaTeJFJargHOgBYfhtCqXlt1atbrkJAHtQ8WJA2PPLFcjEi9RfhQ
         0BiCZLI7uYSjCYa81zoXwEW61qRNOeGNhYMsZk1L+tbAihKtCxAPrsdakYaL6ahYh4Yg
         4hPrLrs/75LfcJBjwkbEs+mlIZ63Lpurkun5lroChEFpMBvXe2CgmzXaG2AQ6/2fhVbz
         NUbKyi8p1pDMY+USjFM3zCR18uoQeT/RmjjYX6Ez8R/ysnrLxxNDYDZTefrNL+DiyeUg
         S1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680334654;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vE40mJuVkISt0zg8IVAmmNvtPq9ArtEbvKSLEgCOttk=;
        b=VHF4b21SLnuOXmNZ91cwEUtXz1T3+arTJS7bWC4r8S3SFEYjNWnykCSd8DmQ9HaUUc
         KPnJ6LwSwPs5HGDFRLz7pDiqEx5pJm8ojcOy0++klnsxIQqfZRqv3/+N3ppiCAGlq2gf
         y8HnMc5XrLwfrf2kflaW8ZvG0cfKFVdgEJ1Jl0EznUx9uGsjrUrOfcvj2jd0aX0v4OED
         Uzn+cRWKtqHrAeNob+ef7+KuRxAQonl6fccnWSYG9frNBldN/8zEcWhuKHJezzQJNDY/
         w5/7kD8q1R49xq+jtbfaNmOBXcnt0yWDMCRuLlAoVShCF29cGTlkmSh8jOfKZfKBdC6d
         ffDQ==
X-Gm-Message-State: AO0yUKXC4kYdcgO2FfGnkAeT7B4dq56pSJuIz4Bal0CxTTPfdu/mYh1a
        gZF/2kZzpQuIxBEN0Qe7h/LPo5j/mvJQpCVa93c=
X-Google-Smtp-Source: AKy350Z0EgBQwEG5Xl3qi0dO7AO63uhQuxlyN1E/94xEoRdjhUs0Uc2WqrcH0GAgRQoRQyrE+JNptq4f71w281Lh3nQ=
X-Received: by 2002:a05:6a00:848:b0:626:2343:76b0 with SMTP id
 q8-20020a056a00084800b00626234376b0mr15911628pfk.6.1680334654487; Sat, 01 Apr
 2023 00:37:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:c6d1:b0:47a:d3f2:35eb with HTTP; Sat, 1 Apr 2023
 00:37:34 -0700 (PDT)
Reply-To: ab8111977@gmail.com
From:   MS NADAGE LASSOU <gusau219@gmail.com>
Date:   Sat, 1 Apr 2023 08:37:34 +0100
Message-ID: <CAP-GnWyqE3nX78VOQJ3JQPaffeJ+mpbb23oNpE1rjJA3vQWFmw@mail.gmail.com>
Subject: PLEASE REPLY BACK URGENT
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Greetings.

I am Ms Nadage Lassou,I have something important to discuss with you.
i will send you the details once i hear from you.
Thanks,
Ms Nadage Lassou
