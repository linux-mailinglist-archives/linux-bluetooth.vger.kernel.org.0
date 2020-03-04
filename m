Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92609179422
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Mar 2020 16:56:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729689AbgCDP4W (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 4 Mar 2020 10:56:22 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:43009 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729588AbgCDP4W (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 4 Mar 2020 10:56:22 -0500
Received: by mail-oi1-f180.google.com with SMTP id p125so2534457oif.10
        for <linux-bluetooth@vger.kernel.org>; Wed, 04 Mar 2020 07:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VV/LwjGAuFG122pw9deWkt8oTfImhEcvzc9d+ks21nk=;
        b=Swh77TG3TlFSsrqm0ARSwq5RLztRO7+6IOts4yprOGxrkV1pwRmOP7gUq4KdIabRaP
         xkmRvZfmM0y8UdI62FYGj11QryfTc50dCZp+PuXYQ+TisjMUzqaHFInf+PpxKmag1nIc
         ppUUoEXO+42jl3SUAlfYov1fv8zZFHOhAxyJzMKtubhYN+3W91QIYgxOACF6IIgyem7O
         xjOhSgj1dukuljrhJlt+AflTcQICMJqHCMI4GPOe1KiO3ak6D7sqjDJqWU9VZTTwCCQN
         rEfladMFtklRVqhPKuBwRJD/x553mdNj+Rtw+KZUsrpA5iXy3xGHTUU2EbygcTRt7zkU
         N2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VV/LwjGAuFG122pw9deWkt8oTfImhEcvzc9d+ks21nk=;
        b=tp0QDEwimuDrqZVpSrH6VrBg/JO0wPRZVzBv6ubQs5qJf/m0cJKVePdolZDfggGbIS
         Jh13YA0T9czBmqrr8chkfwIo5UsMYSZfb+jCdnqMNVi5SGv1ck76MMlyWfkFKZXRFu+U
         YqDsJUGbS4OkYoucWeInkevTXl3ZsiDsvM61H+ZOb0vvbfczhos2HHurPev854CgujS8
         vB97WznbwF775ptrhfwQeoPaMmYaSBslXVYXoWBCT0uoC1CwwgNiRDNf8WO8cyRNN8Pp
         sg+BGbU44lT/dcX2c0fhsWlSo2gwgh3m6j5AG89xckWuGCGQkEA3+43kkfCmFabrnGcD
         /nLw==
X-Gm-Message-State: ANhLgQ0NfaYZp7agJb07Z3yrwot4kuaEaayFRDj8GhrNOCCc/bMYqirU
        xn3XiTl+bffakZoOScKRdxb5lYq5EjtzWszzhfE=
X-Google-Smtp-Source: ADFU+vttj6zB+i/ZhK18nwgT9gyoYyQzG9teLQrOpRMb/l8GLRKUDm9a4t4M6psWy4E1O50vNFrNSWMSsowVoEPith8=
X-Received: by 2002:aca:56ca:: with SMTP id k193mr2255868oib.133.1583337381513;
 Wed, 04 Mar 2020 07:56:21 -0800 (PST)
MIME-Version: 1.0
References: <CAO1O6sdGJeAKTHBVyDSUa7-Hp_ULYmfOHJEbb6=-B6xuPHvffQ@mail.gmail.com>
 <CABBYNZKtxPmTUn2fw9-dy1V9M_Pb996O6VmHkg4NrAr-=t+-4A@mail.gmail.com>
 <CAO1O6sdke-2J=eYHS2SoG83v-hMJDBu-gasufJYDyHK+1R+w5g@mail.gmail.com> <CH2PR14MB3658759A2701FB52A2D6573BE6E50@CH2PR14MB3658.namprd14.prod.outlook.com>
In-Reply-To: <CH2PR14MB3658759A2701FB52A2D6573BE6E50@CH2PR14MB3658.namprd14.prod.outlook.com>
From:   Emil Lenngren <emil.lenngren@gmail.com>
Date:   Wed, 4 Mar 2020 16:56:10 +0100
Message-ID: <CAO1O6sfwcEswTkuuntoBM_S5oFkQv7mCP1GH8Z0S0vgHk2Bp5A@mail.gmail.com>
Subject: Re: Get negotiated ATT MTU?
To:     Jamie Mccrae <Jamie.Mccrae@lairdconnect.com>
Cc:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

Den ons 4 mars 2020 kl 11:55 skrev Jamie Mccrae <Jamie.Mccrae@lairdconnect.=
com>:
>
> Hi,
> > It should be fine also if the remote end sends an Exchange MTU request
> > at the beginning of the connection since we can then immediately send
> > a response and assign the MTU property without waiting for the
> > Exchange MTU response (that corresponds to our request).
> >
> > Let me know if you think I've missed some edge case...
>
> In the core specification 5.2 volume 3 part A, there is a command, L2CAP_=
CREDIT_BASED_RECONFIGURE_REQ, which allows for the MTU to be changed after =
it has been established. This requires an enhanced ATT service however, but=
 it means that the initial MTU is subject to change.

I just read the L2CAP/ATT/GATT parts in the new spec. Is EATT
implemented yet for the dbus-api, and will it affect the API? Anyway,
for EATT it's a requirement that the MTU can only increase, never
decrease, which shouldn't cause issues for apps. But change my "ATT
MTU exchanged" property name proposal to "Initial ATT MTU exchanged"
then, if waiting for the ServicesResolved wouldn't be enough, and set
it true immediately if EATT is used and after an Exchange MTU
procedure for unenhanced ATT. Then update the ATT MTU property when
the MTU is increased.

/Emil
