Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA6E75F5249
	for <lists+linux-bluetooth@lfdr.de>; Wed,  5 Oct 2022 12:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiJEKKD (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 5 Oct 2022 06:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiJEKKA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 5 Oct 2022 06:10:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DC1C17
        for <linux-bluetooth@vger.kernel.org>; Wed,  5 Oct 2022 03:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664964596;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bCmfb77Gu94ZkcAxubGU7yIzblH73abcjBUc6fLGu9I=;
        b=jV8x1OqnXSlb1P9PHdeXkacYXhtw6OzHhsxL73ZESElzA/qe45p+Bv4c80zLv5liJTX6DU
        eVNQGefX8TQEwijI8dtlmA96/c9Xh52fB5NSeYMsNSgQBZPr9pTSyYhmMeOzVBly0wOysl
        Ao9aP0S4Xos7AmCVZfPRl/qmz1qGP/o=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-37-AjTy-BKCNh-TkZ_4XC0BuA-1; Wed, 05 Oct 2022 06:09:55 -0400
X-MC-Unique: AjTy-BKCNh-TkZ_4XC0BuA-1
Received: by mail-pf1-f199.google.com with SMTP id a6-20020aa78e86000000b0055f94e0cf93so7169194pfr.20
        for <linux-bluetooth@vger.kernel.org>; Wed, 05 Oct 2022 03:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCmfb77Gu94ZkcAxubGU7yIzblH73abcjBUc6fLGu9I=;
        b=nxfqZnfEr1KPQcqkxLD8+L5/Fm4q4hTbBpvNbO9s6gLIlTGC+64xWKH6otKNU4sO5v
         syfXXZ32l3wmYcE+LAOrWsoa6FLT5SAkrVV/NIOq9TocKDiOEHo1DWqWgmPmuOx8dI0h
         L+9qc7RZDhZxnBA2GZoiaWgqXd5REkEd51RF01VWGTC/yV2ADqxFvL14N3QK7HnaEV2K
         1VfdaoCMqHIFyrh/TfsZ3d1dXhQ0DJEEfp03zaENPQCyHlnhhXxUROBDZGkXovfyqr+W
         hFI98rVNj1lI0BMUmgZOPDaaeh72VJTsiEEdAqwp5zFVcCdZCorcknwuvTKQhbBQGDhk
         hU8g==
X-Gm-Message-State: ACrzQf1T7KpGPmZ1ChgWVIR41cPg4xLN6V9tukVjPaQ7V8XwCUum3snq
        CNMWibBxshDbtcs7obbKTKWkKFc/Jr+GXhTk0uP92650pHD4zBGHbkWqlMuwbzBr1gIATAGaiT2
        7loZ1RI5EGywm3IDSUxIYW99mtTgUQMID36Y5/wQII5dB
X-Received: by 2002:a63:86c1:0:b0:458:b8d7:71d3 with SMTP id x184-20020a6386c1000000b00458b8d771d3mr1887395pgd.385.1664964594199;
        Wed, 05 Oct 2022 03:09:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6wwCmISH7aopwKfVkqB1xrqDh3Ec/Lw0sT9LALNj2t55Oys1IsWRYfvQmKnyjPfS25VCsIh/259EbbMxBF4QY=
X-Received: by 2002:a63:86c1:0:b0:458:b8d7:71d3 with SMTP id
 x184-20020a6386c1000000b00458b8d771d3mr1887377pgd.385.1664964593909; Wed, 05
 Oct 2022 03:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4oucG2z14214jWGJj9XZ5cYMnQpw9CACHvPZ09cbL7m9z_g@mail.gmail.com>
 <100b06a944de88a4b80119c5a2024e0e59cf5243.camel@sipsolutions.net>
 <CACT4oufKgUG5n6Ocgi6r-Z=+Nt9vNVK1e5dJDccogmd8h7xM8Q@mail.gmail.com> <5c47143aea07c34dbe95fdb2cab677f2a7a753fb.camel@sipsolutions.net>
In-Reply-To: <5c47143aea07c34dbe95fdb2cab677f2a7a753fb.camel@sipsolutions.net>
From:   =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>
Date:   Wed, 5 Oct 2022 12:09:42 +0200
Message-ID: <CACT4oud9qSQJVUsEBt2dvX__k5JuHVzOOPyYWUy92bURw0AknQ@mail.gmail.com>
Subject: Re: iwlwifi: AC9560 firmware crash with iwlwifi-QuZ-a0-jf-b0 versions
 above 55
To:     Johannes Berg <johannes@sipsolutions.net>
Cc:     gregory.greenman@intel.com, golan.ben.ami@intel.com,
        jonathan.sade@intel.com,
        Linux List Kernel Mailing <linux-wireless@vger.kernel.org>,
        linux-bluetooth@vger.kernel.org,
        Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
        Laura Trivelloni <ltrivell@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wed, Oct 5, 2022 at 12:07 PM Johannes Berg <johannes@sipsolutions.net> w=
rote:
>
> On Wed, 2022-10-05 at 11:50 +0200, =C3=8D=C3=B1igo Huguet wrote:
> > On Wed, Oct 5, 2022 at 11:35 AM Johannes Berg <johannes@sipsolutions.ne=
t> wrote:
> > >
> > > On Fri, 2022-09-09 at 12:41 +0200, =C3=8D=C3=B1igo Huguet wrote:
> > > > With an AC9560 installed on a system with Quasar (11th gen processo=
r,
> > > > in my case) we're getting a firmware crash as soon as you try to do
> > > > something with the card. The problem doesn't happen with the card
> > > > installed in older platforms (8th / 9th gen), and it neither happen=
s
> > > > with firmware iwlwifi-QuZ-a0-jf-b0-55 version, but yes with any oth=
er
> > > > newer version.
> > > >
> > > > I've tried different versions of kernel and firmware, including the
> > > > latest kernel and linux-firmware available today, and all of them f=
ail
> > > > unless I remove all fw files above version 55.
> > > >
> > >
> > > I believe this is a duplicate of
> > >
> > > https://bugzilla.kernel.org/show_bug.cgi?id=3D214343
> > >
> > > which was supposed to be fixed in firmware, but evidently that fix wa=
s
> > > never backported to older images.
> > >
> > > Internally, FW commit d8887278 fixed this, so FW version 69 should be
> > > OK?
> >
> > I don't think so, we've reproduced it with iwlwifi-QuZ-a0-jf-b0-71.ucod=
e
> >
>
> Indeed, my git-fu was bad. Looks like 74 only fixes it (or will, since
> it hasn't been released, apparently).
>
> We could do some awful workaround like this I guess:
>
> diff --git a/drivers/net/wireless/intel/iwlwifi/fw/acpi.c b/drivers/net/w=
ireless/intel/iwlwifi/fw/acpi.c
> index 009a4074d062..0c0a28d748f2 100644
> --- a/drivers/net/wireless/intel/iwlwifi/fw/acpi.c
> +++ b/drivers/net/wireless/intel/iwlwifi/fw/acpi.c
> @@ -1119,6 +1119,11 @@ int iwl_read_ppag_table(struct iwl_fw_runtime *fwr=
t, union iwl_ppag_table_cmd *c
>          int i, j, num_sub_bands;
>          s8 *gain;
>
> +       /* many firmware images for JF lie about this */
> +       if (CSR_HW_RFID_TYPE(fwrt->trans->hw_rf_id) =3D=3D
> +           CSR_HW_RFID_TYPE(CSR_HW_RF_ID_TYPE_JF))
> +               return -EOPNOTSUPP;
> +
>          if (!fw_has_capa(&fwrt->fw->ucode_capa, IWL_UCODE_TLV_CAPA_SET_P=
PAG)) {
>                  IWL_DEBUG_RADIO(fwrt,
>                                  "PPAG capability not supported by FW, co=
mmand not sent.\n");
>
>
> johannes
>

Thanks, I will give it a try the next days and tell you the result.

--=20
=C3=8D=C3=B1igo Huguet

