Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFF86E02A2
	for <lists+linux-bluetooth@lfdr.de>; Thu, 13 Apr 2023 01:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjDLXiw (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 12 Apr 2023 19:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbjDLXiv (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 12 Apr 2023 19:38:51 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5642C449C
        for <linux-bluetooth@vger.kernel.org>; Wed, 12 Apr 2023 16:38:49 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-94a342f7c4cso305771566b.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 12 Apr 2023 16:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1681342727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cqi3F2DLTaK1XRD+XBhKe6ot1+wzOmTh1thtCJqRlgA=;
        b=VV/BN1szRArbtzTWiRfhFDCLoYJM3RKfVv+GHRmlXJ9owwqzHhiDB8wMf0nrMmomLI
         cXNiOprrIBUP5BAIMj4cfU2KJwoDAVE2BM3MvNMWBiTBF+/xE1lHtyAV4BMhBSWerrYH
         r+he4F8RCcFcLdN0Bb9F/lVurdNIjtoKlZt5Qc7molk5iWChp5uhQvemYzAXvuFrKEgC
         y9A5KJ1bR0JXbXDNUjtJi2jocfJTWlW4Hia0hiyHKytihdazhl9ndLNBFVRavyHowkGT
         a8/f+eO9NkoUKrdws6mvUKkT/1rAFhYVQPPHQI2U1vdgaDmiE2tWr2tu6V3617uV7tex
         /j9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681342727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cqi3F2DLTaK1XRD+XBhKe6ot1+wzOmTh1thtCJqRlgA=;
        b=cfVuDNuYT9RDN4dZ/yqZ7+DYkXxUrVJCIOlYhmQhBD/5E3fSfyZqhhrWv4k0yYDxTg
         +5s2DM2wiwNwhLt96svYGGAqi3bISOAug4fY8ETC/Il/XuSaYzIm0aC52WrQiL1Lcwcd
         4bmVSSUcgMcv909OYyPoQJ+HBwlquhyCAwUjj0tytUKSoHVPv0GJKm9i8SMqOno8K3BS
         pxiirPwO2v7coS6k8RqsaGOUIX5PyQh/ExJxufKY8M0gqKPFl9OHFGarqwn512tEv3JF
         DF/ucecGZ4iUWD9Co5ahX/V6D1yM/cOeAvFkAt7kSc9Cm7JG7z+J7Nr95uoFxPss3ZS+
         8xmA==
X-Gm-Message-State: AAQBX9cGcoIaexH0pTPGRoQw1NrcSj8th+5sppeMYQ/T8BZnpbJqwo5W
        4o/1vuwgsopTSGJMc5ufG8HOILkw589B3MUeE+YiEA==
X-Google-Smtp-Source: AKy350Ylw76zATlXqd22goKD6jZ1DfF1RaS1ReYl4pCHK9HRFt/rpX4TdFDVfYAqLNPyVH8aVC/lYmaBfyGXOk10SPU=
X-Received: by 2002:a50:aa84:0:b0:506:4139:541f with SMTP id
 q4-20020a50aa84000000b005064139541fmr190771edc.8.1681342727602; Wed, 12 Apr
 2023 16:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230326233812.28058-1-steev@kali.org> <20230326233812.28058-3-steev@kali.org>
 <ZCVgMuSdyMQhf/Ko@hovoldconsulting.com> <CAKXuJqjJjd6SY1g3JW8w53rEVCqgDkJXQ=1iA3qXcF+C9qv1SQ@mail.gmail.com>
 <CABBYNZKX9bixyy8GZ0VDFaeNeY0_MSVDDNvcTqiAXEx8zFXfbA@mail.gmail.com>
In-Reply-To: <CABBYNZKX9bixyy8GZ0VDFaeNeY0_MSVDDNvcTqiAXEx8zFXfbA@mail.gmail.com>
From:   Steev Klimaszewski <steev@kali.org>
Date:   Wed, 12 Apr 2023 18:38:36 -0500
Message-ID: <CAKXuJqiZ9iQESFpVs-b5YLEF5cuPQf7tNtBYGerUxfEp3sj19Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] Bluetooth: hci_qca: Add support for QTI Bluetooth
 chip wcn6855
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Sven Peter <sven@svenpeter.dev>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>,
        Tim Jiang <quic_tjiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

On Wed, Apr 12, 2023 at 3:00=E2=80=AFPM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Steev,
>
> On Thu, Mar 30, 2023 at 9:35=E2=80=AFAM Steev Klimaszewski <steev@kali.or=
g> wrote:
> >
> > Hi Johan,
> >
> > On Thu, Mar 30, 2023 at 5:10=E2=80=AFAM Johan Hovold <johan@kernel.org>=
 wrote:
> > >
> > > On Sun, Mar 26, 2023 at 06:38:10PM -0500, Steev Klimaszewski wrote:
> > > > Add regulators, GPIOs and changes required to power on/off wcn6855.
> > > > Add support for firmware download for wcn6855 which is in the
> > > > linux-firmware repository as hpbtfw21.tlv and hpnv21.bin.
> > > >
> > > > Based on the assumption that this is similar to the wcn6750
> > > >
> > > > Tested-on: BTFW.HSP.2.1.0-00538-VER_PATCHZ-1
> > > >
> > > > Signed-off-by: Steev Klimaszewski <steev@kali.org>
> > > > Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> > > > Tested-by: Bjorn Andersson <andersson@kernel.org>
> > > > ---
> > > > Changes since v7:
> > > >  * None
> > >
> > > Only noticed now when Luiz applied the patches, but why did you drop =
my
> > > reviewed-by and tested-by tags from this patch when submitting v8?
> > >
> > > For the record:
> > >
> > > Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> > > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > >
> > Oops, that wasn't intentional! I only meant to drop it on the dts bits
> > as that part I wanted to make sure I got right based on your comments,
> > my apologies!
> > --steev
>
> This one seems to be causing a new warning:
>
> drivers/bluetooth/hci_qca.c:18
> 94:37: warning: unused variable 'qca_soc_data_wcn6855' [-Wunused-const-va=
riable]
>
I had seen this as well and I just noticed that the others were marked
as __maybe_unused and I forgot to.  Will send a fix up for that!


> --
> Luiz Augusto von Dentz
-- steev
