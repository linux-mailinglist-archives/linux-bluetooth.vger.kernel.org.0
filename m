Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F35A25B88AE
	for <lists+linux-bluetooth@lfdr.de>; Wed, 14 Sep 2022 14:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbiINMzg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 14 Sep 2022 08:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbiINMzd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 14 Sep 2022 08:55:33 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7831222B9
        for <linux-bluetooth@vger.kernel.org>; Wed, 14 Sep 2022 05:55:30 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 130so22553470ybz.9
        for <linux-bluetooth@vger.kernel.org>; Wed, 14 Sep 2022 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=QIq127AsrVETtjmlZHJuq6KTgcVseSvZ0/hA9NYCU2w=;
        b=dQ7OJ3+1KRiMJrRQMvd3LvRoNOSD2pJhAgZJbA+aUTgWMj+Kutx04r7f/ZXwlTpeer
         8olZRiCOQD6cs1ZK8uZhrPZmhn15++7w7VrorD4EROLTw5YRI2ep/erKNcgKrhU+KPzW
         SObKpkfbSqx6oA2j2dZMMIXNrQUvyx/sc8cboF8Sjcg24U6eT/c4kyEUB2g88xgH5dRr
         0XUTLd4NPCv/6Bhp1i7qoMMatuH15rKNEwIlo1VWiotW4muQtvoYL5q2ca+VfY6FpEOK
         PNeLl5wIeGaiuwGtDXJr/xy5yI9s15qyApF5tGny5UbZB8W5D9TlzWXTkUoUhUQD/LX2
         0yBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=QIq127AsrVETtjmlZHJuq6KTgcVseSvZ0/hA9NYCU2w=;
        b=ekrYrnpuQMsi2onRUH0WIU1TVFfXB4YybohNQOps/Ng9y6k6dQX6JQBy+ZRtDm+Jl+
         PMgGz8dqdDsrlNIfXwXxbu6wtrO5hsctcs6ZRiBuUgRNVfg60Dy7+MBfFrH164nfWBwM
         EPj3UMteM5hGMjccJX7jpizFdgWA4ya+0yEEa9Dr7ODc042J9hcCqp08xhF1v1o+HzNd
         6io8LMMr2VppvqwEvu2OxjTy6hcqrmiEpMli23p+tZwuM7QAqL8odcFrwQpbqaZqXa6R
         3oT5otLemxEuEM58+h2d0f6uYlz591Y8a9q9LyfCjFf43x8dK3k5AwhEehmeeLZIsz7V
         VzXQ==
X-Gm-Message-State: ACgBeo1YaUOn+wjmdd/CtNTmyO9SIbTQV5Ml+n/Ov7rhnpee7QUGAXnn
        +PIwT2srl5HNBHQUlcAq48cwlktcBfB8Rt35wN0=
X-Google-Smtp-Source: AA6agR76PDdl7uOzHAuoe+S3VKmfXiet6skAb4heyl8lJf6c1nBHiieKZZVlfd6FZfx59/mNAZHA2FkdCdIC+oO8xoA=
X-Received: by 2002:a25:c704:0:b0:6aa:aef4:f325 with SMTP id
 w4-20020a25c704000000b006aaaef4f325mr30674626ybe.544.1663160130108; Wed, 14
 Sep 2022 05:55:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:4e91:0:0:0:0 with HTTP; Wed, 14 Sep 2022 05:55:29
 -0700 (PDT)
Reply-To: westernuniontg453@gmail.com
From:   POST OFFICE <mrmajidaahmedmuhammed@gmail.com>
Date:   Wed, 14 Sep 2022 05:55:29 -0700
Message-ID: <CAD-=s3XHBos9adu7kREyGjT__+BsuSQ4+1n1weDS+bAZ4QJHEA@mail.gmail.com>
Subject: Merhaba sevgili e-posta sahibi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Say=C4=B1n E-posta Sahibi;

Uluslararas=C4=B1 Para Fonu (IMF), t=C3=BCm doland=C4=B1r=C4=B1c=C4=B1l=C4=
=B1k kurbanlar=C4=B1n=C4=B1 ve talep
edilmemi=C5=9F fonlar=C4=B1 olanlar=C4=B1 tazmin ediyor ve e-posta adresini=
z talep
edilmeyen fon listesinde bulundu. Bu Western Union ofisi, IMF
taraf=C4=B1ndan tazminat=C4=B1n=C4=B1z=C4=B1 Western Union Para Transferi y=
oluyla size
aktarmakla g=C3=B6revlendirilmi=C5=9Ftir. Ara=C5=9Ft=C4=B1rd=C4=B1k ve bu f=
onun ger=C3=A7ek sahibi
oldu=C4=9Funuzu =C3=B6=C4=9Frendik.

Ancak, toplam 800.000,00 ABD Dolar=C4=B1 tutar=C4=B1ndaki tutar size tamame=
n
aktar=C4=B1lana kadar, g=C3=BCnl=C3=BCk 5000 ABD Dolar=C4=B1 tutar=C4=B1nda=
ki Western Union
Para Transferi yoluyla kendi =C3=B6demenizi havale etmeyi kararla=C5=9Ft=C4=
=B1rd=C4=B1k.

Bu =C3=B6demeyi yaln=C4=B1zca e-posta adresinizle g=C3=B6nderemeyebiliriz, =
bu nedenle
g=C3=BCnl=C3=BCk 5000 dolar=C4=B1 size g=C3=B6nderece=C4=9Fimiz yerlere bil=
gilerinize
ihtiyac=C4=B1m=C4=B1z var, =C3=B6rne=C4=9Fin;

Al=C4=B1c=C4=B1n=C4=B1n ad=C4=B1: ________________
Adres: ________________
=C3=9Clke: __________________
Meslek: __________________
Telefon numaras=C4=B1:________________
Kimli=C4=9Finizin ekli kopyas=C4=B1: ___________
Ya=C5=9F: _____________

Yukar=C4=B1daki bilgilerinizi al=C4=B1r almaz transfere ba=C5=9Flayaca=C4=
=9F=C4=B1z: =C4=B0leti=C5=9Fim
e-postas=C4=B1 (westernuniontg453@gmail.com)

Sayg=C4=B1lar=C4=B1mla te=C5=9Fekk=C3=BCrler

Western Union Para Transferi Direkt=C3=B6r=C3=BC Bayan Martins Nanny,
Merkez Ofis Lome Togo.
