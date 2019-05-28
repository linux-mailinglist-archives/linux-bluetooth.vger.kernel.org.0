Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC2F2C012
	for <lists+linux-bluetooth@lfdr.de>; Tue, 28 May 2019 09:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfE1H3C (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 28 May 2019 03:29:02 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:41514 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726816AbfE1H3C (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 28 May 2019 03:29:02 -0400
Received: by mail-io1-f65.google.com with SMTP id w25so3462853ioc.8
        for <linux-bluetooth@vger.kernel.org>; Tue, 28 May 2019 00:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FZj8oWyFq3CoJbFnxhmHQl5Z1o9Vs+qjAi2PsBJzKX8=;
        b=Um4OlysCGBHGA44CeY55xcHo861uo0c+FB5zM5s8Qnqn8P6QSmVoPuAMS9X2g+QoND
         L2hKkop2CfC/5H/BLntyqiaENDlcJoxPSyUxHBtm5NPUZUK/JzTi6RXGTmVZmxb0n7P+
         6jHA85NqhcYJC5VXcAQHDq802kneWZD/Z6G+qQ2NjGaDJKIdgv8AmzqFWX+s9ZGEJnXk
         CDqH0FOGRjubh1XCLJyVAtiJhL4FdUkMBvCaTiM3ohohXkV45aOGGrln7zSFOeao9Jp5
         QmYKnAus6zrh6nJIHAGNalDdaJ/gzKto/+H758RArtTQ6OF+YSsSPGUtplQQz/PZMK3O
         3Jfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FZj8oWyFq3CoJbFnxhmHQl5Z1o9Vs+qjAi2PsBJzKX8=;
        b=QNoYrseu1YJpfroRfC2BHkQgsN/ycz7xnExwqBaVGq3hiLtxNFxCbHAEDDtne4+fCz
         3ET6iwfyhdrSgmxjg7AJAsNl80wM7sK6GU/g2D3kirGKl6ZP3SG7T3Um7qRbo5+bzJ79
         pJjY79bde2AxxMGtfUTDFO82fO3KovJzCjxG2mJBrOaAGAlBNVQ6KRBbhzeNFpvpRZEX
         xqLPac9Ah/5VH7D8k3v/adBOAWS/k9KnLVk1/lQiVzFbzlx2XUEytCVII3JU+QUF6KmY
         p+5hMcuxYcxQisasf6SBWL4TAKraBr5SjKrbPfEvEa8vWREr0r2qlLMv8aZWXr9uGuVc
         ZrMA==
X-Gm-Message-State: APjAAAVxzinIjjzDJEvLeQNWsoQiZH0WwOlTQ3rV3qgscR1iOCyrbhf1
        ZcpkGtoCrzXlFELKLo/kDcXURWxSy/JDsee71TCY3w==
X-Google-Smtp-Source: APXvYqz5HTMwCU1nNFiGQw1Cl+PiaV7RZ+6gwoCCCeYzL4XRGENI0nfCZqfBnBr90mrMZshmEUDljEMbIyPgp87//wQ=
X-Received: by 2002:a5d:9dc7:: with SMTP id 7mr8023315ioo.237.1559028541410;
 Tue, 28 May 2019 00:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190523175321.13094-1-brian.gix@intel.com> <1558634183.332.19.camel@intel.com>
In-Reply-To: <1558634183.332.19.camel@intel.com>
From:   =?UTF-8?Q?Micha=C5=82_Lowas=2DRzechonek?= 
        <michal.lowas-rzechonek@silvair.com>
Date:   Tue, 28 May 2019 09:28:50 +0200
Message-ID: <CACXRGxx4XO-Rev-nY_ahCqFrCzSeDFDNm8CEyYRm=Et-gZzscA@mail.gmail.com>
Subject: Re: [PATCH BlueZ] mesh: Fix long MIC usage in segmented messages
To:     "Gix, Brian" <brian.gix@intel.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "jakub.witowski@silvair.com" <jakub.witowski@silvair.com>,
        "Stotland, Inga" <inga.stotland@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Yes, it's fine.

--=20
Micha=C5=82 Lowas-Rzechonek
Lambda Team Leader

Silvair
Jasnog=C3=B3rska 44
31-358 Krakow
POLAND

http://www.silvair.com

pon., 27 maj 2019 o 20:14 Gix, Brian <brian.gix@intel.com> napisa=C5=82(a):
>
> Hi Jakub and Michal,
>
> If you guys are OK with this, this is the version of the patch on long MI=
Cs and segment count I will be
> applying.
>
> On Thu, 2019-05-23 at 10:53 -0700, Brian Gix wrote:
> > From: Jakub Witowski <jakub.witowski@silvair.com>
> >
> > Contrary to the comment, implementation used a 8-byte MIC even if this
> > generated an additional segment.
> > ---
> >  mesh/model.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/mesh/model.c b/mesh/model.c
> > index 034d54496..90bb62db8 100644
> > --- a/mesh/model.c
> > +++ b/mesh/model.c
> > @@ -40,6 +40,9 @@
> >  #include "mesh/util.h"
> >  #include "mesh/model.h"
> >
> > +/* Divide and round to ceiling (up) to calculate segment count */
> > +#define CEILDIV(val, div) (((val) + (div) - 1) / (div))
> > +
> >  struct mesh_model {
> >       const struct mesh_model_ops *cbs;
> >       void *user_data;
> > @@ -451,7 +454,7 @@ static bool msg_send(struct mesh_node *node, bool c=
redential, uint16_t src,
> >
> >       /* Use large MIC if it doesn't affect segmentation */
> >       if (msg_len > 11 && msg_len <=3D 376) {
> > -             if ((out_len / 12) =3D=3D ((out_len + 4) / 12)) {
> > +             if (CEILDIV(out_len, 12) =3D=3D CEILDIV(out_len + 4, 12))=
 {
> >                       szmic =3D true;
> >                       out_len =3D msg_len + sizeof(uint64_t);
> >               }
