Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A22394CEDA3
	for <lists+linux-bluetooth@lfdr.de>; Sun,  6 Mar 2022 21:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbiCFUWe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 6 Mar 2022 15:22:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiCFUWd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 6 Mar 2022 15:22:33 -0500
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F79A13DF7
        for <linux-bluetooth@vger.kernel.org>; Sun,  6 Mar 2022 12:21:40 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id h30so8542994vsq.13
        for <linux-bluetooth@vger.kernel.org>; Sun, 06 Mar 2022 12:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=LoM4XEodrBVaABJSgjKFlKlwjoO4sP/v/3gpJ+8s9Gs=;
        b=ZwUPiK6mBdiJSIuRRMSt523d7ykO8pg9VOTVq960PaCbhBTXto3Zk+OpxjICJdhOM3
         zwOjQbbe+AJHDvO/rmQYIiN+XH9brugzv19rykU11QHmQEpNIfTQhQrGxV2iQO+6aIHo
         evVBKUDXBplcmjUlT6xh5o7X0ehNspJ/NTwi6tXJo7No5fIEOoMdXZkBHCRgGAE7k/Uv
         4FEybGIc/ZvDH+05iUJq37jg7DZZ+P8GHG90D1D6XiM/vRi4mkuRXDiFmta6BXXaF9me
         6tTb2bD/plpdwbS5MkzYs7GhORVwgzWcrT5Q/sTaFHiPh2Ea1i0aN23GMLJ6HFgc6VdS
         pG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=LoM4XEodrBVaABJSgjKFlKlwjoO4sP/v/3gpJ+8s9Gs=;
        b=wt93eOHG5clGdRbi9miUz4HEUFZgK038p8LM+6TnZJ5vW/qbUvcVyluONBRn10QbYC
         BoJa4ZR7J87ebrUv+HynlxpeWnaKlfXhqzwS1dJKVamrPryjnbuklX5BvU6xwtIuXj3v
         slWQrdlPcQP91tlwegr9Z2+b3iP1c6CO8gheMd+dERUqBvUUJdzedP3DjHsfPr5SORnO
         +JDgtrU0aAq7Ir4rkzqsnRiZsToQ1mfGJeRkKGclSB+cGH+iE0RIPCJq4o9zTM8sfMlP
         CrdOdJFmZS49/nJHPYN/Q5A8iTrKp6KCGP9aw5zczHlmS42hiWv4Lb/ZKmW/b4yH8/C0
         Ptcw==
X-Gm-Message-State: AOAM531qRqagu0dQ4UF0oxyVUsAWblS8Ez3LVhIsAJf4/Ml2eAafcqXa
        OusY7Q348O2aIpoSpdLzfo52Iv/N/yPi6ZfSapg=
X-Google-Smtp-Source: ABdhPJwi/xBYe+Ld3H89Uxka1vhENSjP+NcspnbGQUNgr8f98WwY8uak17QDA2hLWvC4kctL2b3HV1h6YvYj2jwi/UQ=
X-Received: by 2002:a05:6102:302d:b0:320:98c4:215 with SMTP id
 v13-20020a056102302d00b0032098c40215mr2039058vsa.3.1646598099222; Sun, 06 Mar
 2022 12:21:39 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:b9cc:0:b0:294:ac02:e41 with HTTP; Sun, 6 Mar 2022
 12:21:38 -0800 (PST)
Reply-To: gisabelanv@gmail.com
From:   Isabel Guerrero <bamigbocheakimou@gmail.com>
Date:   Sun, 6 Mar 2022 20:21:38 +0000
Message-ID: <CACQ-1hqv4JZSd7qXdnVaYS-RyEG5YsG0rv=SqVmhzD8=R=xMvw@mail.gmail.com>
Subject: URGENT CONTACT
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello, I=E2=80=99ve not yet received your response to my previous mail.
