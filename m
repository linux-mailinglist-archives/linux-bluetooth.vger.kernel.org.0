Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5AF6F5003
	for <lists+linux-bluetooth@lfdr.de>; Wed,  3 May 2023 08:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjECGU1 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 3 May 2023 02:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjECGU0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 3 May 2023 02:20:26 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCE83359B
        for <linux-bluetooth@vger.kernel.org>; Tue,  2 May 2023 23:20:24 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-54cbb666aa5so488285eaf.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 02 May 2023 23:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683094823; x=1685686823;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nHhH2clqN/moR+BtPwqo9RJEjJKqZSsX5yPmJcGuU/4=;
        b=Qm23IJ3qwDu2GYHmte3rmr/BwmR1sLshT4bpO+8HkDufXbff5NxEl1qQpfmhKnIJYI
         3Ukaw4Mz4uqK95sK6Mx5stQhQr6jUxP/g2duYrtSeToW/p/5XaBIeHn+B36zaY9XSYSK
         SPllXwfuUQZiIpV5MZN+lGiSvMvIW8h7qkuZIo2oj0xJCyJbqb/5hZFutQOdoAVRyK7w
         mPYEC9ikwEEUnzu+cn7/cpkljdi6vMXsS/IQswya2wBwBb6oVSCjcA/1VNMDLxD/IwtA
         h2Gia4mkWfvxwj79Jj4OAr1WtCfYO+neB8jUp8/hoR9KzusebxdzqaM5EKH6k24TacoM
         TaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683094823; x=1685686823;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHhH2clqN/moR+BtPwqo9RJEjJKqZSsX5yPmJcGuU/4=;
        b=LnzWyWhmoL1ygkk7Oa27Viif2kbD+myN20z51lOvgH7e35fTrrmQ+vh9qtFX/nnmOr
         B/Gi9TMBXWykLK4a3y65nIkfOlhxyuOW+n6mlkVY0WZ1O4J/5pzGoI5gt9ZFSDW7bhR6
         t4jIqKxY48OoMGQ+Igi9M6+Nin12yWn0zps31Trufjcq333CbJHMVhKoHjihec4X7AXS
         8G/7HObUZopgatkAOXlihNhwuHhTEPV/EzuJyy4N0O8UFuLfIJxRIGM81GDTHWoVjSo5
         oYRNqn/fENuCjU/NzX6RoRELY0w0tiYmSGdfwAn+VSC1GZUymDsmRYmw8oJ/weoTcpcR
         m9Dg==
X-Gm-Message-State: AC+VfDwLzAF8iwKZIiQ/nIoBcBgs3ujk9seB6c+Lctti3rguqeiO6fE0
        yN9w9F3gg08jgbpWWgVDZObPQ+rx6u+LBuG/UDo=
X-Google-Smtp-Source: ACHHUZ4pi4LSU/sM9203YQp7lAK8IMxN6yS2IO19MPnb45VQmNVsDbq94Wl/y4WRXOzKEK0PX2WjGnk6MY1w9veUMHA=
X-Received: by 2002:a05:6808:4249:b0:390:5e63:8146 with SMTP id
 dp9-20020a056808424900b003905e638146mr9275448oib.42.1683094823053; Tue, 02
 May 2023 23:20:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7516:0:b0:4bb:a83f:27ab with HTTP; Tue, 2 May 2023
 23:20:22 -0700 (PDT)
Reply-To: jennifermbaya036@gmail.com
From:   "Mrs.Jennifer Mbaya" <promiseokemini1@gmail.com>
Date:   Wed, 3 May 2023 07:20:22 +0100
Message-ID: <CA+Pj5bSgizWpYmDx9fiDRwMZEAy5b7Tvnqid=gvxRja66phjiQ@mail.gmail.com>
Subject: =?UTF-8?B?UHLDrWplbWNh?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        HK_NAME_FM_MR_MRS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Pr=C3=ADjemca
Dostali ste sa na ocenenie od Organiz=C3=A1cie Spojen=C3=BDch n=C3=A1rodov =
pridru=C5=BEenej k
medzin=C3=A1rodn=C3=BD menov=C3=BD fond, v ktorom bola va=C5=A1a e-mailov=
=C3=A1 adresa a fond
n=C3=A1m boli uvolnen=C3=A9 na v=C3=A1=C5=A1 prevod, preto po=C5=A1lite svo=
je =C3=BAdaje na prevod.

Dostali sme pokyn, aby sme v=C5=A1etky neuhraden=C3=A9 transakcie previedli=
 v
r=C3=A1mci nasleduj=C3=BAceho
48 hod=C3=ADn, alebo ste u=C5=BE dostali svoj fond, ak okam=C5=BEite nevyho=
viete. Pozn=C3=A1mka:
Potrebujeme va=C5=A1u naliehav=C3=BA odpoved, toto nie je jeden z t=C3=BDch
internetov=C3=BDch podvodn=C3=ADkov
tam vonku, je to =C3=BAlava od COVID-19.

Thanks
Jennifer Mbaya
