Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 224B51ED71B
	for <lists+linux-bluetooth@lfdr.de>; Wed,  3 Jun 2020 21:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgFCTww (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 3 Jun 2020 15:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgFCTwv (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 3 Jun 2020 15:52:51 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B5CC08C5C0
        for <linux-bluetooth@vger.kernel.org>; Wed,  3 Jun 2020 12:52:51 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id h7so2916984otr.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 03 Jun 2020 12:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8/mXneW7ht4EZPvLrDPgILB3BHVPtTWk9KHSwgWw+aE=;
        b=CP/qgmsnonKMqYc7KzaaPsMaZ6zyMvvjU9KPr5X2vwE0++Uttp7Xc6LTCvuW/ng+jc
         bqyCznD00h1vQ9jpYn9E+zROP5OlSaFVpjPZXmn8b+Swsn3fOLPz2c2OZvmCyrBlsKMm
         TDwuS/i1NbU+B7tBVoTvY8aTT020Esq3RfP3K1uaIsXWJhgAvI8isNto9aFYGekvdnMd
         FNj6IjhoV7/PrO0VR8Honlu6heG9LSrmQRiQu2ohmeEC9vZ+pdKcHMRQ+3e/xDUfNUur
         zqSMWb8DAwyASCYsKi8DSJOsT/YwCBQ9L8/JM6ZWthgc4BlX2IWWtNhE//62g2VtVs7w
         YufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8/mXneW7ht4EZPvLrDPgILB3BHVPtTWk9KHSwgWw+aE=;
        b=S3xwb3fIvkCsptEW3MknELlzo9IDpWV4JVfH6y8YTTnz1+gGRaznsQhedeZfCHIHu6
         yXLTKXfxoGMIgn60SVsRwqqNDH/Bi1Bq1IYY+fk5FQ/B+kOYQbFQl4X1GrxZWdTr9JW4
         AmQ3ZIRkDcWb1IhAGyKd2L9WlEh/Yx6kQaF/m0ZoSra3xUITeCF0KPKf2RYpjgOpaxZQ
         7FDuBkOeq6BvskQlQ6wgsXOfISBtqIA+vVfOsk1V2pYWZs3QsAbZdmGf6mhNkHHIQqPb
         pr0f7kbLoXqgVaFeRvpdGonBDNmJ4VuAppmrzr4Vm/k6raxV8tv8YBDc5cxzeMwKwlrl
         lMvw==
X-Gm-Message-State: AOAM530t/+qlhkGBe/ooDSeUpmfu79jsjMBx1iYkxu7ll4tgSkAj5Ktv
        8EOB0P1CaozAvD2gF41OtiR8wL3K3JCmdYl7a2XY7g==
X-Google-Smtp-Source: ABdhPJyakEGLUHYjVLg7F/CzZlcXrDitja4VF27VW6hh1r71+Q/496/PdbA1PN4y5H/NkN2lQVuutuVfVBuzJiMndBk=
X-Received: by 2002:a05:6830:14c4:: with SMTP id t4mr1209611otq.79.1591213970768;
 Wed, 03 Jun 2020 12:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAPHZWUe9sLt8jsD57i3=PQxMfjODP7dUYLBm2qpSXFdgd9cvAQ@mail.gmail.com>
 <64A824C9-7C3C-4B08-8A9E-827121C4786D@holtmann.org>
In-Reply-To: <64A824C9-7C3C-4B08-8A9E-827121C4786D@holtmann.org>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Wed, 3 Jun 2020 12:52:39 -0700
Message-ID: <CABBYNZJtgCNeZCYQ9tWno9qD9Vi2AaJNLH5TLxMtASHS-c+ySQ@mail.gmail.com>
Subject: Re: Should we disable ERTM as default?
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Yun-hao Chung <howardchung@google.com>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        ChromeOS BT Qualification <chromeos-bt-qual@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Yun-hao,

On Wed, Jun 3, 2020 at 10:43 AM Marcel Holtmann <marcel@holtmann.org> wrote=
:
>
> Hi Yun-hao,
>
> > When I ran the following tests in PTS qualification on Chrome OS, I
> > couldn=E2=80=99t pass all of them because they all failed to create an =
AVDTP
> > connection with channel type as =E2=80=98Streaming=E2=80=99 or =E2=80=
=98Enhanced
> > Retransmission=E2=80=99.
> >
> > - MPS/AG-SRC-TG/HFAV/CLH/SD/BV-03-I
> > - MPS/AG-SRC-TG/HFAV/CLH/SD/BV-04-I
> > - MPS/AG-SRC-TG/HFAV/CLH/SD/BV-05-I
> > - MPS/AG-SRC-TG/HFAV/CLH/SD/BV-06-I
> >
> > It looks like bluez doesn=E2=80=99t want to change its mode even though=
 it
> > claims it supports them. Our question is do we still want to enable
> > this feature as default?

We don't use ERTM on AVDTP connections, in fact only AVRCP Browsing
channel requires that but I guess you want low level testing of L2CAP
parameters it more common to use l2test instead, or this does not come
from L2CAP test spec?

> I am a bit confused. So when you use the disable_ertm kernel parameters, =
these test pass? But ERTM is mandatory for AVRCP 1.3 and later.
>
> Are we sure that MPS test cases are correct? I mean, we never required ER=
TM for HFP since that is based on RFCOMM and ERTM is useless for RFCOMM.
>
> Regards
>
> Marcel
>


--=20
Luiz Augusto von Dentz
