Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 685E2212738
	for <lists+linux-bluetooth@lfdr.de>; Thu,  2 Jul 2020 17:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbgGBPBX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 2 Jul 2020 11:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbgGBPBW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 2 Jul 2020 11:01:22 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A81C08C5C1
        for <linux-bluetooth@vger.kernel.org>; Thu,  2 Jul 2020 08:01:22 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id z24so7701761ljn.8
        for <linux-bluetooth@vger.kernel.org>; Thu, 02 Jul 2020 08:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yz7Jmxr8mb3QoIiRZAxjOj5pQVUc4DNEwN36TOLAcqw=;
        b=cbKekr7emqwLL/vRPLe8buZGATil0p/VQOQqlji8rYv+yWc1UUrJD4p8s2b5gcb9JS
         fnc2usvul4lwtacK5YdXVWGqdl4b8TpVQz0jwVuAuIsbdBSpLfHNQoiuHrhfQVn8A1f7
         bSfaVhUTqAoynEtz0oWESffrKkC5CCnLJqXgfBT6B4TrBlTqq6V3R/tZ9dVKg1gOHtex
         /HeRBkb7SNDRzNlE+J8oboOI+Vbwe2XbEC/LnlpIWceUxFTs18FNuUR1tc8CQQmziL1c
         lgC4S/ClVcF8OD3Nu15mN/gFknQFYrxDKuxtRpdwQ14XUE/MABXB9YD3YLTjY3dNX6Gz
         5l4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yz7Jmxr8mb3QoIiRZAxjOj5pQVUc4DNEwN36TOLAcqw=;
        b=YNJPMQps6+tYNy0ceeRqxRtyZpbdNd//NpnZEcJwwl++C0yYLrwZfc9NH8QGSV9LGc
         tc3wZd3bwY86ZySMcdi7bAlo52GjB2QPFcZ1QGNcQBuMr3f8xj8YuztDvyAAKLt7EU0H
         B82+jBOXWrqH3wLL/AxdSxtVf/6URlLZRDr8jQdUW8oS8nTB4hbSLu1HsQfrX1BiZPvx
         zP0nUPRi0UgczWahamk1tRGxQjYmxbZNapEKOnk+5tqB3H4aflYl1c5Y9EJw8/Ek3TsK
         gLMuJCRKYE7uPV079xQxy+NYnv6sGCeGvMcKt1KHdJVrNwhR+4JQwLshXtBqAXqnhoXj
         pNLQ==
X-Gm-Message-State: AOAM530HcNI7k4ueDbTjTiHT4vHFgbx20Va/64RhD4LoA5Ct4TvNQzPz
        W76SmamKAJDFqnhABQ9PQ/x9Te6TbhjIWHNqf+kPgQ==
X-Google-Smtp-Source: ABdhPJy/h0xDCvDFfGr8gMGmrpbIjY5MIp5Cxsj9j0ofU0WQzN8di+dv4laZrV3+j+fko4/bC+9PowQWtrUuaFka400=
X-Received: by 2002:a05:651c:11c7:: with SMTP id z7mr9072197ljo.39.1593702080592;
 Thu, 02 Jul 2020 08:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200701220853.421445-1-alainm@chromium.org> <427B6E1C-178C-405D-88F8-899EC48AC8A9@holtmann.org>
 <CALWDO_XT=O4NiqMur+_u1z4o0868ZzBr4gpUikgmgw2U4zqMzw@mail.gmail.com>
In-Reply-To: <CALWDO_XT=O4NiqMur+_u1z4o0868ZzBr4gpUikgmgw2U4zqMzw@mail.gmail.com>
From:   Alain Michaud <alainmichaud@google.com>
Date:   Thu, 2 Jul 2020 11:01:09 -0400
Message-ID: <CALWDO_Wf5gftarhsxq-itzWhvtjj171hVYezsRN-GU_dv-zaVg@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: le_supported_roles experimental feature
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Alain Michaud <alainm@chromium.org>,
        BlueZ <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Resending as plaintext.


On Thu, Jul 2, 2020 at 10:59 AM Alain Michaud <alainmichaud@google.com> wro=
te:
>
> Hi Marcel
>
> On Thu, Jul 2, 2020 at 9:18 AM Marcel Holtmann <marcel@holtmann.org> wrot=
e:
>>
>> Hi Alain,
>>
>> > This patch adds an le_supported_roles features which allows a
>> > clients to determine if the controller is able to support peripheral a=
nd
>> > central connections separately and at the same time.
>> >
>> > Signed-off-by: Alain Michaud <alainm@chromium.org>
>> > ---
>> >
>> > Changes in v2:
>> > - Slight change of design based on offline feedback
>> >
>> > net/bluetooth/mgmt.c | 36 +++++++++++++++++++++++++++++++++++-
>> > 1 file changed, 35 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
>> > index 5e9b9728eeac..c13fcc21745f 100644
>> > --- a/net/bluetooth/mgmt.c
>> > +++ b/net/bluetooth/mgmt.c
>> > @@ -3753,10 +3753,36 @@ static const u8 debug_uuid[16] =3D {
>> > };
>> > #endif
>> >
>> > +/* 671b10b5-42c0-4696-9227-eb28d1b049d6 */
>> > +static const u8 le_supported_roles[16] =3D {
>> > +     0xd6, 0x49, 0xb0, 0xd1, 0x28, 0xeb, 0x27, 0x92,
>> > +     0x96, 0x46, 0xc0, 0x42, 0xb5, 0x10, 0x1b, 0x67,
>> > +};
>> > +
>> > +static u32 get_le_roles_flags(struct hci_dev *hdev)
>> > +{
>> > +     u32 flags =3D 0;
>> > +
>> > +     /* Central connections supported */
>> > +     if (hdev->le_states[4] & 0x08)
>> > +             flags |=3D BIT(0);
>> > +
>> > +     /* Peripheral connections supported */
>> > +     if (hdev->le_states[4] & 0x40)
>> > +             flags |=3D BIT(1);
>> > +
>> > +     /* Simult central and peripheral connections supported */
>> > +     if (test_bit(HCI_QUIRK_VALID_LE_STATES, &hdev->quirks) &&
>> > +         (hdev->le_states[3] & 0x10))
>> > +             flags |=3D BIT(2);
>> > +
>> > +     return flags;
>> > +}
>>
>> this is not what we can do here. The flags are defined like this.
>>
>>         The following bits are defined for the Flags parameter:
>>
>>                 0       Feature active
>>                 1       Causes change in supported settings
>>
>> And I want these flags for generic handling of experimental features. In=
dividual features can not overwrite it.
>>
>> So if you only want to support a the =E2=80=9Cread" functionality, then =
something like this please.
>>
>>         if ((hdev->le_states[4] & 0x08) &&      /* Central */
>>             (hdev->le_states[4] & 0x40) &&      /* Peripheral */
>>             (hdev->le_states[3] & 0x10) &&      /* Simultaneous */
>>             test_bit(HCI_QUIRK_VALID_LE_STATES, &hdev->quirks))
>>                 flags |=3D BIT(0);
>>
> OK, Since the userspace Api we discussed reports individual states, would=
 you suggest if LE is supported that the Central and Peripheral roles are s=
upported and just use this to query the simultaneous support?
>
>>
>> > +
>> > static int read_exp_features_info(struct sock *sk, struct hci_dev *hde=
v,
>> >                                 void *data, u16 data_len)
>> > {
>> > -     char buf[42];
>> > +     char buf[44];
>> >       struct mgmt_rp_read_exp_features_info *rp =3D (void *)buf;
>> >       u16 idx =3D 0;
>> >
>> > @@ -3774,6 +3800,14 @@ static int read_exp_features_info(struct sock *=
sk, struct hci_dev *hdev,
>> >       }
>> > #endif
>> >
>> > +     if (hdev) {
>> > +             memcpy(rp->features[idx].uuid, le_supported_roles,
>> > +                    sizeof(le_supported_roles));
>> > +
>>
>> And I would put it all here instead of a separate function.
>>
>> > +             rp->features[idx].flags =3D cpu_to_le32(get_le_roles_fla=
gs(hdev));
>> > +             ++idx;
>> > +     }
>> > +
>> >       rp->feature_count =3D cpu_to_le16(idx);
>> >
>> >       /* After reading the experimental features information, enable
>>
>> Regards
>>
>> Marcel
>>
