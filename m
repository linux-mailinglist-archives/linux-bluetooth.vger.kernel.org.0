Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B21D53AFF5
	for <lists+linux-bluetooth@lfdr.de>; Thu,  2 Jun 2022 00:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbiFAVCN (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 1 Jun 2022 17:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbiFAVCH (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 1 Jun 2022 17:02:07 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 531902236B9
        for <linux-bluetooth@vger.kernel.org>; Wed,  1 Jun 2022 14:02:05 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id r206so4214866oib.8
        for <linux-bluetooth@vger.kernel.org>; Wed, 01 Jun 2022 14:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to;
        bh=Gk4nfCem3ECRa7Gml0J0mN/3RZoOAdfGaQAqyHPKtiI=;
        b=RGd9c1aErSn0Z6Ze8KLoF3EWbTH/9kTlwI+HC+SAx7dzvBrwHHsKOlh0JbRb09xcBP
         iM2OCHeO/Jrl9Xle2mDSw6T0q2WeDDZSG5qe5a4Dg+cUelC504vEzjOQufYXWP9aJXgI
         V/LFJCahzAFFpJlr1tiv2Vp4M01X+B3LdrfN7rOxB8bGQcOq43FjV1KDwVfyhOisNkOG
         FD6f0xHzXypVyOoc2S2G61yyKZweooFWr6HTnKbFSpcoQrcxWgeekfUkx9WrMRo9A/lx
         1hTIaXz5Rg+fQ0IRlejP5CxzHN8QjtW4TV9t29PD5AzmW/wzytk4/unH4gfxTM3MusEo
         OocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to;
        bh=Gk4nfCem3ECRa7Gml0J0mN/3RZoOAdfGaQAqyHPKtiI=;
        b=fUqWxltWl8MToUhjrA+ewM+YMtttoXjEaVz0QjidbUcBwiShbDW2ZZIjzMRkCOuGtS
         hw+VST4nm+tqqxewTv7zXTBneMXmFzUBhXkHDnly3XUqcsQ4L2xrxXXcGVeKxSoBsEah
         DgNnC1GaEe0bO8+/WfoSEvOZkNNOjC7eR1pMB6Xb5C6gAixu3cOQSTTG5GzAitdRh7J8
         u0Ya4Qn59G2Wz0wFE4P9JLdwSl95f/DTcb6i8U9eMvjnYRKRnHLWb8c+q1rfTvuGoM+S
         2Yi25leKWRnkn58N5GDjl1h5d2FGFJDYvuhNExR76h6Ugl2ErMEsktc0/gBncxL0E3/U
         G3PA==
X-Gm-Message-State: AOAM531YN0MNWxcd3P9sOLYuayedNSMKXtdn9dmEykCahtw6xoEMqP6Z
        I5LYhdhPWJqVkT8Uvx3ffVuIouwRdIGCouTFsV3vTOksSUk=
X-Google-Smtp-Source: ABdhPJw3lgUh0oxmgmjzAwlNNZ94ksw/9I0mOwLnUtgereG7iWZKY4s1I5RZI0o0mPKS7RYxDWrvjq+R1cXj2tliMpE=
X-Received: by 2002:a05:6870:4619:b0:f1:e78d:fd54 with SMTP id
 z25-20020a056870461900b000f1e78dfd54mr18171419oao.195.1654111014269; Wed, 01
 Jun 2022 12:16:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:3601:b0:a3:2139:251d with HTTP; Wed, 1 Jun 2022
 12:16:53 -0700 (PDT)
Reply-To: johnwinery@online.ee
In-Reply-To: <CAFqHCSRskayxkisB-+u26DtbT6KFL5dAQ+X5s5W-kcBz_DGgTw@mail.gmail.com>
References: <CAFqHCSRskayxkisB-+u26DtbT6KFL5dAQ+X5s5W-kcBz_DGgTw@mail.gmail.com>
From:   johnwinery <alicejohnson8974@gmail.com>
Date:   Wed, 1 Jun 2022 12:16:53 -0700
Message-ID: <CAFqHCSSwNksOc4c+jJ+6tiF2b2hWGn9JARB6iPpgQJTeHU_7AA@mail.gmail.com>
Subject: Re: good day
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Greeting ,I had written an earlier mail to you but without response
