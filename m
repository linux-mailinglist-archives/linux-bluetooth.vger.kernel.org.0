Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92C5B4C2036
	for <lists+linux-bluetooth@lfdr.de>; Thu, 24 Feb 2022 00:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238635AbiBWXpu (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 23 Feb 2022 18:45:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245071AbiBWXps (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 23 Feb 2022 18:45:48 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 441F55C64D
        for <linux-bluetooth@vger.kernel.org>; Wed, 23 Feb 2022 15:45:20 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id vz16so805240ejb.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 23 Feb 2022 15:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=zI3YMoABJRyR+odt0AbJrQOCfTLDDuwNt2ksIU5nkFY=;
        b=JJCvVvmZddjxXHlZ2aM9A9nLqvQrKtA/AUHWVQo/dfZ9hFB9q3KrKZeFgFN601sLzL
         kK8i1m/qgCl8A7C3zPBCmA6xOkShzep0vW5uajL+/fvr9+/5IaLXEPxQ4F87aUZ+zAgX
         741xXNPC2s2vvJbBh9SLasdtnXLSwrvppqgd3XRcj3TwRGK+xENcEjFYTWvlchum8ccF
         jmUwa5vGMmX9WIGRkincOmT8kvkEU+OkaKwomg0Eb7nAcZN/IXd++J0p/i13jcU5OUQE
         2q9lyHUpx13wanoaINjc7ZL5v6l80HTPlsusA3KkHoUOoCTJ45mdQtzsJOStsEM0unLX
         O9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=zI3YMoABJRyR+odt0AbJrQOCfTLDDuwNt2ksIU5nkFY=;
        b=OijKpJvFXZzz/iZc66DiB50BiaKcZlGcrByw99RjkHUCS2gWT+FisOTAo9j6lREqrD
         EvDbf/yHO1MxcezMDX/JPHjoMXCG8zNDdzAaxYmLntfjaFtWm4lS6JcSfrQxS9Kw3Jgk
         SDxYlBHCdmIBvD9vapGjiqIcD3YEu6HROLN/VMI1hqUe+QkEPmesYx45vGRDavk84MCj
         5ikgJeLOx2BzR8o7dxaDKKhkopfQLcrM0puo2U2STW8Q+YbpSYlMKQLrksZOkVYIpHKl
         mg4Jwndv7A5GoAKuwcZ3TH3Vln/ghvSfrOJeheM3Dz8VULZ2XzyD/W31wtlGeWtNbbs5
         Gilg==
X-Gm-Message-State: AOAM530JP8pQ0i8WoTrCTbOSso9SVe6TZuA37W9E1DYIIsEbBxu7ymUf
        MIW6hrJXXPjRI100228ZTlNGjBNF8Kaphh2cKDoY8F1Hv44=
X-Google-Smtp-Source: ABdhPJw6gCeAEQjtdGajxeh1VEbU8JfbJREyrXd88EMr6zeV4gR7rXiCRWlr4RxD8jl0RdXxNLM6cvUFxP9xhPfZvsQ=
X-Received: by 2002:a17:906:c314:b0:6ce:6f9:dd9c with SMTP id
 s20-20020a170906c31400b006ce06f9dd9cmr64977ejz.311.1645659918599; Wed, 23 Feb
 2022 15:45:18 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:141a:0:0:0:0 with HTTP; Wed, 23 Feb 2022 15:45:18
 -0800 (PST)
Reply-To: fionahill.usa@outlook.com
From:   Fiona Hill <drivanrobert81@gmail.com>
Date:   Wed, 23 Feb 2022 15:45:18 -0800
Message-ID: <CAJp5pinGhtn15csQmPDaE-4X8UxuVQNB+39P9CwnL1zaTR-1wg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

-- 
Please with honesty did you receive my message i sent to you?
