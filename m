Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA063294297
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Oct 2020 20:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437917AbgJTS5T (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 20 Oct 2020 14:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437914AbgJTS5T (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 20 Oct 2020 14:57:19 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7DFDC0613CE
        for <linux-bluetooth@vger.kernel.org>; Tue, 20 Oct 2020 11:57:18 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id a28so3182231ljn.3
        for <linux-bluetooth@vger.kernel.org>; Tue, 20 Oct 2020 11:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kjdokkT+bfPPVpMzenHKs7+Qeyx8aKmmkfXa9e6xoIQ=;
        b=CIBnvO4XIBKlsGH83odMJ6ahjguUIej/QMsOMG7sgigECFTWstjR+ArtFDKrblpQxP
         8aHnKK4oVPIzSd9ycwEszdlS7zq9KaIVP7D7W9dnFqNTXN2QIiq05lmHtj6pKKjL3H+5
         dpTaNcHU7j7zNr4ZpXKSOh1vJ0b9kyCgl3hgxsbVRs+1VUGMMtn9QSXd8NiUwkY/n6Hu
         9MZ2r5/72vb3n2OU0EdFe5BnwafNtixe94/eWv7KbpTwAfvMsJqHgAvye2dwCNR8cYX5
         oPnjSlOpQMgbfvrvCddDGkuwAZFoxPFwa8Wl02kYCRV3z1k77GIXpl5rkSfdKhnPE3QZ
         YY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kjdokkT+bfPPVpMzenHKs7+Qeyx8aKmmkfXa9e6xoIQ=;
        b=VvCMxqtCrMppvBXowd55LS2vIYAhby5PRZcz2L+v506yTVdXmKap4IeOKuUiCBpUTj
         e8HCG9+jtyUwTSxzQmvC3wXRzhhB+NXdgzLEQUAlaAkQMxMedI8cH7QC74DgDYDDHKMr
         a+qhL+IHE3mW2GGRIXd2azpkhfKIUCFWJR922/Romy5CmFVhfgjBZfMvUNNwA0Tu/H9h
         A7zrNqQIDLKV72AGjBB90+HMOKciBnYi0bZ6zKctWFYNuKB5JVeLHcZjxCbgcoMRuFPK
         j1OR6gdV2qOR0GwfvIeQmw7kJekqVvsZGBrFu/fvcgbf+x3eHQw+eS9IWSTC4oR6j/fO
         IQuA==
X-Gm-Message-State: AOAM530Q+5qZT0K0M6QZN+R5NjaY7MDoj5I5CU0rAj1kf4yNhFArFmHs
        sy8UkHwAOmQ8OZDftnbUSU3wchApZArzkp1UeZ+/vlmQ0DI=
X-Google-Smtp-Source: ABdhPJyM9fojdO3Bkybv1OsnhHtBbqmG89ygdwY1UsAV8ZEeLsaGCeRoj4OiODWCRV/Uu4OWxLujF8bNGmgcpguDK9o=
X-Received: by 2002:a2e:145c:: with SMTP id 28mr1839345lju.68.1603220237109;
 Tue, 20 Oct 2020 11:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <CABLzjm8S1J5MRhrwFu1pbX9fub7X5nXmYRWmtRsmVRObeJOCbw@mail.gmail.com>
 <B67F1317-2644-4803-8A16-2A2E7CC425F3@holtmann.org>
In-Reply-To: <B67F1317-2644-4803-8A16-2A2E7CC425F3@holtmann.org>
From:   Alexandre Augusto <alexandre.a.giron@gmail.com>
Date:   Tue, 20 Oct 2020 15:57:04 -0300
Message-ID: <CABLzjm-S-hp8K2AhB0EX+tdSzkoxSAYF4Jcq1-gnwU3okN9hXA@mail.gmail.com>
Subject: Re: Entropy source based on the RSSI
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel,

excellent. Let me know if any clarification is needed.

Best regards

Em ter., 20 de out. de 2020 =C3=A0s 15:38, Marcel Holtmann
<marcel@holtmann.org> escreveu:
>
> Hi Alexandre,
>
> > based on the motivation that IoT devices do not have many entropy
> > sources available, and also on the fact that trusting in a single
> > source may be risky, I have researched some additional ways to collect
> > randomness for the device, using bluetooth technology for that
> > purpose.
> >
> > For those who are interested in:
> >
> > Github: https://github.com/AAGiron/Bluerandom
> > Presentation: https://www.youtube.com/watch?v=3DiAKaKAmqCFo
> >
> > I also want to say thanks in advance to Emil Lenngren for his valuable
> > comments, here in this mailing list (back in 2019), and also to the
> > Bluez community.
>
> I would integrate as kernel driver. The Bluetooth stack could just use it=
s
> own LE random generator and an initial passive scan to gather RSSI values=
.
> No need to push this into user space.
>
> Regards
>
> Marcel
>


--=20
Alexandre Augusto Giron
Professor da UTFPR
Doutorando em Ci=C3=AAncia da Computa=C3=A7=C3=A3o (UFSC)
