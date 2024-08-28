Return-Path: <linux-bluetooth+bounces-7066-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E05962C57
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Aug 2024 17:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D1741C24130
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Aug 2024 15:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBAA18A6BF;
	Wed, 28 Aug 2024 15:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyfQi2fB"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FF0189BAA
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Aug 2024 15:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724858886; cv=none; b=fT3VoLEKmt7iY1BkW46xmh09LiDMe4xsbRC6NAtMwLNQy34vYio/BqG1pPlOe3KmPwaZqqkizOWIwDa46s0cJDjlj/Aj1SPxaFTXVs1VMN1XOZcLB+XbD8A+YGsxChb6bQtBnXq34uA48WQOUrjCEV5urt4ySpLEL4gNfEZ/nCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724858886; c=relaxed/simple;
	bh=lvqRB4p6XHAxOqg55+JKleATRp7RboARP+2B875Tsec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJ/NTGRIKhYAf7KBt6WRcknn+xpot7mT5jWXyg9mzOFs7rvOmK1cM+3j0vmKqH3euLaAQIUZ4sSsOcmyt9v3YIPtLJrdsqVed4HRcSthRgqvVi1Q9SgLM33sVzlipNTEe6l8899O51x2vGWQVSJEe3Ymo7LlVMjSO0LDdpJzoCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyfQi2fB; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3db1d0fca58so1305171b6e.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 28 Aug 2024 08:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724858884; x=1725463684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aryVOEEdS4xT/TnQ0+KceyQm33+kLqEMahgUdjXoYdI=;
        b=kyfQi2fBpxCE1CclEp/lu87tf9mRwgijCjakiiXnVgxaHmjX7CHRCjZsH2+8Gho8Pq
         kER5r6JJtPqjAd7k7CGmYgYMhYU8aikUQV6Cz3tPVA2yeMDAfJLnK/2Af0Z0DdODl0u8
         12IoipZCVbAUdSjOYojTPkOsMAZ/ZueRSRbZFdjJd7fvzqtmAT45qv6Rx2F5kcDeHrdh
         WacXcqWXeVXW9N2KXswX3m0sWFf5eh7o5reivxblirj42W5eHmQy4md0j5pR1arzt5tg
         3NwTJrHOX6BjZmxOwDqsMU0a+CcGKV3fcVyGNU1kQJafDYkFmpD1f6aSzYPTxkJAHLZJ
         8UFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724858884; x=1725463684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aryVOEEdS4xT/TnQ0+KceyQm33+kLqEMahgUdjXoYdI=;
        b=WwUJA9ka1nsXNXvk7YcKsBX9YOvrgptMrRmP33csHMGn5EcrDpiy68mVSV8Kr11+o5
         Doz0PotmhzGjADkgL0Cb9pK30PpCOZ/vz1aHLgLX/O6oSE9lJQzVss5x4tJlkv9nWJ70
         wCRHt58PKoOfAO9mKObOTxkHcseV52S2EqmIfYY2/E0zJKjsKpOtvdWMvBFAx2nm+UGn
         aNmLj+B3z0mrty5GWJmQRTGiP+Hzjt0YED6Unt+L0t7+Fa3h1cx90NAI/eQr1zAYE694
         9pkLSDRSVZhXJeOA1N8LSWyoOC7i+RiVjV2tsCLBG9qVL60SwQfW/7JBX+JVp6HTJ/ni
         C/Rw==
X-Gm-Message-State: AOJu0YyjbsepvlzEjrTA91JD1N3UsWdcP/0HUBvfPFpEYH0fMA5e1juW
	llyMivoPA9mo8sybG3vZkY1SoWyOxH9yNv76dqpZpAcwKoCHriUyUSez/sWB3eApieWilwOnN/c
	XYJxA0+LNjbV3FLdZ0kreXwNW/6VQjlP4
X-Google-Smtp-Source: AGHT+IEGVqiR9p4Y2CHkGnWuLsxLiIlLNGEArGI13PdHqJ2nOtaAlokSXPCbZ2YL6V5d+6JkAB709Mp0C6oj2IJWSG4=
X-Received: by 2002:a05:6808:2007:b0:3db:215d:71ea with SMTP id
 5614622812f47-3deffbd0ccfmr2458462b6e.51.1724858883730; Wed, 28 Aug 2024
 08:28:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828041644.3331363-1-raj.khem@gmail.com> <CABBYNZ+vFe+TnsnwL01aRdkLswdYAg2H44VqSXpkC-G-pdJ3gw@mail.gmail.com>
 <CAMKF1soY46mW0brghP+d_nqfoZN3RpqqayZ+wucVXy+_KZ88+w@mail.gmail.com> <CABBYNZKKCcn2unGCpGejZwOocggXYa3h8xG9QSmdx2gdYifUTg@mail.gmail.com>
In-Reply-To: <CABBYNZKKCcn2unGCpGejZwOocggXYa3h8xG9QSmdx2gdYifUTg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Aug 2024 08:27:38 -0700
Message-ID: <CAMKF1sqnGH1qDRQSnzAHKbr7rTu6fQGRgZXYDQcp-TkOwkqkpw@mail.gmail.com>
Subject: Re: [PATCH v5 BlueZ] Provide GNU basename compatible implementation
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 7:50=E2=80=AFAM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Khem,
>
> On Wed, Aug 28, 2024 at 10:20=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wr=
ote:
> >
> > On Wed, Aug 28, 2024 at 7:07=E2=80=AFAM Luiz Augusto von Dentz
> > <luiz.dentz@gmail.com> wrote:
> > >
> > > Hi Khem,
> > >
> > > On Wed, Aug 28, 2024 at 12:17=E2=80=AFAM Khem Raj <raj.khem@gmail.com=
> wrote:
> > > >
> > > > Call to basename() relies on a GNU extension
> > > > to take a const char * vs a char *. Let's define
> > > > a trivial helper function to ensure compatibility
> > > > with musl.
> > > >
> > > > Fixes Issue: https://github.com/bluez/bluez/issues/843
> > > > ---
> > > > v2: Fix code formatter reported errors
> > > > v3: Make just node_name as const and keep node_dir as such
> > > > v4: Fix code formatting errors
> > > > v5: Redo the patch to address textrels seen on ppc32/arm
> > >
> > > Not really sure why you went with something completely different then
> > > the util helper?
> >
> > util helper meant that we need to add -I option to build the utilities
> > needing this function from util,h
> > and this -I was causing more stuff to be included into these binaries,
> > It got caught when building for ppc32
> > since yocto build started failing due to textrels and I realized that
> > specifying -I can open up the possibility of
> > wrong includes coming from src/ dir. Thats the reason I went with the
> > alternative approach which is safer
> > although the function is copied twice.
>
> Where did you see this error? Perhaps we need to include such a build
> into our own CI then, anyway it seems fair enough but Id add some
> comment about it, also the other possibility would be to add something
> like l_path_basename to libell but I guess that comes with its own
> problem since we would need to uprev the ell dependency.

building hex2hcd for ppc32 target using pie enabled revealed the problem
for yocto, not sure if thats something of interest. I will add a
reasoning to not
add it to util.h in v7.

>
> >
> > >
> > > >  configure.ac            | 11 ++++++++++-
> > > >  mesh/mesh-config-json.c |  4 +++-
> > > >  mesh/missing.h          | 21 +++++++++++++++++++++
> > > >  mesh/rpl.c              |  1 +
> > > >  tools/hex2hcd.c         |  1 +
> > > >  tools/missing.h         | 21 +++++++++++++++++++++
> > > >  6 files changed, 57 insertions(+), 2 deletions(-)
> > > >  create mode 100644 mesh/missing.h
> > > >  create mode 100644 tools/missing.h
> > > >
> > > > diff --git a/configure.ac b/configure.ac
> > > > index d31eb1656..f0f1ec100 100644
> > > > --- a/configure.ac
> > > > +++ b/configure.ac
> > > > @@ -70,7 +70,16 @@ AC_CHECK_LIB(pthread, pthread_create, dummy=3Dye=
s,
> > > >  AC_CHECK_LIB(dl, dlopen, dummy=3Dyes,
> > > >                         AC_MSG_ERROR(dynamic linking loader is requ=
ired))
> > > >
> > > > -AC_CHECK_HEADERS(linux/types.h linux/if_alg.h linux/uinput.h linux=
/uhid.h sys/random.h)
> > > > +AC_CHECK_HEADERS(string.h linux/types.h linux/if_alg.h linux/uinpu=
t.h linux/uhid.h sys/random.h)
> > > > +
> > > > +# basename may be only available in libgen.h with the POSIX behavi=
or,
> > > > +# not desired here
> > > > +AC_CHECK_DECLS([basename], [],
> > > > +                               AC_MSG_WARN([GNU basename extension=
 not found]),
> > > > +                               [#define _GNU_SOURCE 1
> > > > +                                #include <string.h>
> > > > +                                ])
> > > > +
> > > >
> > > >  PKG_CHECK_MODULES(GLIB, glib-2.0 >=3D 2.28)
> > > >
> > > > diff --git a/mesh/mesh-config-json.c b/mesh/mesh-config-json.c
> > > > index c198627c6..e3b0a1809 100644
> > > > --- a/mesh/mesh-config-json.c
> > > > +++ b/mesh/mesh-config-json.c
> > > > @@ -28,6 +28,7 @@
> > > >  #include <ell/ell.h>
> > > >  #include <json-c/json.h>
> > > >
> > > > +#include "mesh/missing.h"
> > > >  #include "mesh/mesh-defs.h"
> > > >  #include "mesh/util.h"
> > > >  #include "mesh/mesh-config.h"
> > > > @@ -2694,7 +2695,8 @@ bool mesh_config_load_nodes(const char *cfgdi=
r_name, mesh_config_node_func_t cb,
> > > >
> > > >  void mesh_config_destroy_nvm(struct mesh_config *cfg)
> > > >  {
> > > > -       char *node_dir, *node_name;
> > > > +       char *node_dir;
> > > > +       const char* node_name;
> > > >         char uuid[33];
> > > >
> > > >         if (!cfg)
> > > > diff --git a/mesh/missing.h b/mesh/missing.h
> > > > new file mode 100644
> > > > index 000000000..eaf32815e
> > > > --- /dev/null
> > > > +++ b/mesh/missing.h
> > > > @@ -0,0 +1,21 @@
> > > > +// SPDX-License-Identifier: LGPL-2.1-or-later
> > > > +/*
> > > > + *
> > > > + *  BlueZ - Bluetooth protocol stack for Linux
> > > > + *
> > > > + *  Copyright (C) 2024  Khem Raj <raj.khem@gmail.com>
> > > > + *
> > > > + */
> > > > +
> > > > +#ifdef HAVE_CONFIG_H
> > > > +#include <config.h>
> > > > +#endif
> > > > +#if !HAVE_DECL_BASENAME
> > > > +#include <string.h>
> > > > +static inline const char *basename(const char *path)
> > > > +{
> > > > +  const char *base =3D strrchr(path, '/');
> > > > +
> > > > +  return base ? base + 1 : path;
> > > > +}
> > > > +#endif
> > > > diff --git a/mesh/rpl.c b/mesh/rpl.c
> > > > index fb225dddd..2fa17d72f 100644
> > > > --- a/mesh/rpl.c
> > > > +++ b/mesh/rpl.c
> > > > @@ -24,6 +24,7 @@
> > > >
> > > >  #include <ell/ell.h>
> > > >
> > > > +#include "mesh/missing.h"
> > > >  #include "mesh/mesh-defs.h"
> > > >
> > > >  #include "mesh/node.h"
> > > > diff --git a/tools/hex2hcd.c b/tools/hex2hcd.c
> > > > index e6dca5a81..452ab2beb 100644
> > > > --- a/tools/hex2hcd.c
> > > > +++ b/tools/hex2hcd.c
> > > > @@ -24,6 +24,7 @@
> > > >  #include <stdlib.h>
> > > >  #include <stdbool.h>
> > > >  #include <sys/stat.h>
> > > > +#include "tools/missing.h"
> > > >
> > > >  static ssize_t process_record(int fd, const char *line, uint16_t *=
upper_addr)
> > > >  {
> > > > diff --git a/tools/missing.h b/tools/missing.h
> > > > new file mode 100644
> > > > index 000000000..eaf32815e
> > > > --- /dev/null
> > > > +++ b/tools/missing.h
> > > > @@ -0,0 +1,21 @@
> > > > +// SPDX-License-Identifier: LGPL-2.1-or-later
> > > > +/*
> > > > + *
> > > > + *  BlueZ - Bluetooth protocol stack for Linux
> > > > + *
> > > > + *  Copyright (C) 2024  Khem Raj <raj.khem@gmail.com>
> > > > + *
> > > > + */
> > > > +
> > > > +#ifdef HAVE_CONFIG_H
> > > > +#include <config.h>
> > > > +#endif
> > > > +#if !HAVE_DECL_BASENAME
> > > > +#include <string.h>
> > > > +static inline const char *basename(const char *path)
> > > > +{
> > > > +  const char *base =3D strrchr(path, '/');
> > > > +
> > > > +  return base ? base + 1 : path;
> > > > +}
> > > > +#endif
> > > >
> > >
> > >
> > > --
> > > Luiz Augusto von Dentz
>
>
>
> --
> Luiz Augusto von Dentz

