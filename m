Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 381987189F3
	for <lists+linux-bluetooth@lfdr.de>; Wed, 31 May 2023 21:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbjEaTR1 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 31 May 2023 15:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjEaTR0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 31 May 2023 15:17:26 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A13012C
        for <linux-bluetooth@vger.kernel.org>; Wed, 31 May 2023 12:17:08 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2af2db78b38so303821fa.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 31 May 2023 12:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685560626; x=1688152626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VQjUBUpsyqw3DIJXc9ZoCTjdfBNwBfjzNGh8BXiADs=;
        b=jh0kZBMmMtcS2439V6qYL1c5YEfJN34HGXwoniup/3SprCzCI9f93LEWAN3mOihtSl
         bC00CU0tC434OljvAZgomggV+1iUKf6vJH2Xdgx4sJcWAYp5Mi56NpUCJ4ZF5749oD7x
         KD1ptUA+nYp6Hz5K5nCxtf3L9DzBLj1JTZtJCPQ0T419vaIaCc6pQWlLyejEjwUZ8OqI
         bbsbaDmZrtD4Yu0k1sPEzN7PwxHPV+Ecl/8SkFdrU5gdNPDouusQmtIYk3Y2nGBl113D
         MoBBE0G7MG6XFIpzWxvP60E91N3MZiiga34A1ds46OLB43+Q4Zv0+hql5UqK41PTbLAJ
         oBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685560626; x=1688152626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5VQjUBUpsyqw3DIJXc9ZoCTjdfBNwBfjzNGh8BXiADs=;
        b=W70jXUnfPeHA55CmZqSLyZQtI23ricMdUGAtlCHOW0c59IiVRR+k/kAkDMAjXxZgiU
         Q6iC6Oh7Ou4zJzWr0QfdLd0ru3iXqYmnAC8kITvhaOWIsXg418B9t+rY29OoV4yyeThx
         DyhXp9N2cFlGgyntu4f3rW2h0iiOSdKmVeRhIOKYd6v+pxXowf7o/ib04t+t3VXYN8Lt
         RMnXunxHgEvYYzRNChWZCHbqrdaS4kA6L8pl+g3TqoMjH/H/7SObBGbNfI0VlAh1OtbC
         ybJQCGUvRaRRTWSOEHpBVlBuUUPmecjHeXD7yTtOHDF6hdbhByGz/aGig1XqirbzzpC+
         eShg==
X-Gm-Message-State: AC+VfDxmRmJksfNFf3nikh4e1bQ/1/2Hc2RHMx+FoX7N+E3yvs4+ZhO6
        lYD1Rf9Yj+uflE9fMZDbl1EaucLdxVvpxBACnjxuqqh5
X-Google-Smtp-Source: ACHHUZ4E42fFfnZ3kGMqPG+bzWmL3aFgrPBVzLameWF8+GyvtyeUAJzOEuhfjUB3XG+J/m78MigWau4yjKGYkjxU9vU=
X-Received: by 2002:a2e:8410:0:b0:2a8:bd1f:a377 with SMTP id
 z16-20020a2e8410000000b002a8bd1fa377mr3482936ljg.20.1685560626038; Wed, 31
 May 2023 12:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685294131.git.pav@iki.fi> <46eefccceb45556120a0d1fa95cf27c576e9649a.1685294131.git.pav@iki.fi>
 <8eacbb0919470938a9ea10fc507d684b6a6d169f.camel@iki.fi>
In-Reply-To: <8eacbb0919470938a9ea10fc507d684b6a6d169f.camel@iki.fi>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Wed, 31 May 2023 12:16:53 -0700
Message-ID: <CABBYNZJy7vC4cz5zrm4hkYx0w5hBRykxC5nRnJxEMMgKu1uRKQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] Bluetooth: ISO: fix maximum number of CIS in Set CIG Parameters
To:     Pauli Virtanen <pav@iki.fi>
Cc:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Pauli,

On Sun, May 28, 2023 at 4:58=E2=80=AFPM Pauli Virtanen <pav@iki.fi> wrote:
>
> su, 2023-05-28 kello 17:44 +0000, Pauli Virtanen kirjoitti:
> > The maximum CIS_Count is 0x1f (Core v5.3 Vol 4 Part E Sec 7.8.97).
> >
> > Fixes: 26afbd826ee3 ("Bluetooth: Add initial implementation of CIS conn=
ections")
> > Signed-off-by: Pauli Virtanen <pav@iki.fi>
> > ---
> >  net/bluetooth/hci_conn.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
> > index 1f906f8508bc..7b1a83ec50ae 100644
> > --- a/net/bluetooth/hci_conn.c
> > +++ b/net/bluetooth/hci_conn.c
> > @@ -788,7 +788,7 @@ struct iso_list_data {
> >       int count;
> >       struct {
> >               struct hci_cp_le_set_cig_params cp;
> > -             struct hci_cis_params cis[0x11];
> > +             struct hci_cis_params cis[0x1f];
> >       } pdu;
> >  };
> >
> > @@ -1815,7 +1815,8 @@ static bool hci_le_set_cig_params(struct hci_conn=
 *conn, struct bt_iso_qos *qos)
> >       }
> >
> >       /* Reprogram all CIS(s) with the same CIG */
> > -     for (data.cig =3D qos->ucast.cig, data.cis =3D 0x00; data.cis < 0=
x11;
> > +     for (data.cig =3D qos->ucast.cig, data.cis =3D 0x00;
> > +          data.cis < ARRAY_SIZE(data.pdu.cis);
> >            data.cis++) {
> >               data.count =3D 0;
> >
>
> Probably should also have cleaned up this loop while at it, the command
> takes 0x1f configurations at most, but CIS IDs are <=3D 0xef. For v2...

Can you prioritize this set? I'd like to have it merged asap since
without it CI is failing some tests.


--=20
Luiz Augusto von Dentz
