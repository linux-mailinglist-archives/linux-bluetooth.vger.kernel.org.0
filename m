Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 692FB1919E3
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 Mar 2020 20:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbgCXTaE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 24 Mar 2020 15:30:04 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:41690 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727105AbgCXTaE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 24 Mar 2020 15:30:04 -0400
Received: by mail-io1-f65.google.com with SMTP id y24so19331460ioa.8
        for <linux-bluetooth@vger.kernel.org>; Tue, 24 Mar 2020 12:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=I1Lp5ErzQY7aQfom99TDhDfGZD38/iC3dvfnr1eRNlw=;
        b=Dy6jWN5FKI6d2urMmVBGmEPv5vMJCRzLjtBUBHlpNpDVkDRs+UKHr5vpoPnnxMrhZT
         1gXFl8MRl7hSy1Ht8DAKLxJrzZVpG7GXArsTucBIUdSfTfqFR/Y4HNFU96cfNzZ3m4A8
         T0NAs/e5M55wEzCijFO/C/GbcSCDtxqXUtS9gOuDPoIMbPz3MUWv4MM58KmWrN6/VlJk
         2Feu6GyXWy4NnyOZu6kzd15tiVarbuOeGA/5VfNBOBbsAiqzh8fAdQfGuwKtVQsV10jM
         H/IH/Nr5/jGgOexiWt/1lWrwvR1MVpyam6uATtBI8hriU37bRrZ8hRuPN6ddlG14Vc5z
         s0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=I1Lp5ErzQY7aQfom99TDhDfGZD38/iC3dvfnr1eRNlw=;
        b=HtLhl611vYmDtrGn/gLuSuBAnC1AP3cZWawvFG8BsOIOV1L1tykFHZZ+2Q244p6C/6
         pIE6ai3Ufn9lZeIj7AVYnBpj38u/4IgjpriaBJN7VZUUoAA2soYEfxaf1SRei32+FF2o
         uTI53BDng01hLav7yVeTpDO1QrR/wU+CXr17QjbOgGLtAFVObaMGBm769x4yE5Ef6wuU
         3PhRp8uvrR02tTu9MIA8/c2ReLOTSiJiT6BmOjecnsm7HkKKJehAgj+KUZkc3DiQKzy+
         /k0SVdfViHRXtmWUMV551G1m5uSx67cYnQhP4oeZdNWda5RNr4gfGqivRhDTFmvaE1wz
         Pe3A==
X-Gm-Message-State: ANhLgQ3AFhMYzYUzOr1TrdFO/XFPn7dk8bLMV9ONrvBm8NFsv/2c8c9U
        KMVMLgOcV3icJAZchcj9o5p2eyDIHfOmTvfljpMOqz+T
X-Google-Smtp-Source: ADFU+vshU5Mw4ft9k0npR5q8eWCNkhTclXDjmygG4LzTBDLRyAwHdme40QjLD6pKlE5BVuhGojuQY1qsfxh5NZUstcY=
X-Received: by 2002:a02:cc37:: with SMTP id o23mr14980162jap.106.1585078202414;
 Tue, 24 Mar 2020 12:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200320133748.154926-1-alainm@chromium.org> <CALWDO_WSHiNw+uwcZzufJ7rjHr=zpMs6f3ry=rdLMGLz2gJZ=w@mail.gmail.com>
 <1ACCF17B-90EB-4DE1-BD8C-A927ABEC3913@holtmann.org> <CALWDO_V=6NXLTZ=XTc+uAe3YUVkUfe88c4beWWoqWK7+vK4+8g@mail.gmail.com>
 <992DB845-DB7F-41B9-93E0-538B08BDF910@holtmann.org>
In-Reply-To: <992DB845-DB7F-41B9-93E0-538B08BDF910@holtmann.org>
From:   Alain Michaud <alainmichaud@google.com>
Date:   Tue, 24 Mar 2020 15:29:51 -0400
Message-ID: <CALWDO_WF4n_Ta-fYoxTv4OF_guZy=d8urEyrosUPgWdHXo8Pag@mail.gmail.com>
Subject: Re: [PATCH v2] bluetooth: Enforce classic key size verification.
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Alain Michaud <alainm@chromium.org>,
        Marcel Holtmann <marcel.holtmann@intel.com>,
        BlueZ <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Tue, Mar 24, 2020 at 2:33 PM Marcel Holtmann <marcel@holtmann.org> wrote=
:
>
> Hi Alain,
>
> >>>> This change introduces a new configuration to strictly enforce key s=
ize
> >>>> checks.  This ensures that systems are in a secured configuration by
> >>>> default while allowing for a compatible posture via a Kconfig option=
 to
> >>>> support controllers who may not support the read encryption key size
> >>>> command.
> >>>>
> >>>> Signed-off-by: Alain Michaud <alainm@chromium.org>
> >>>> ---
> >>>>
> >>>> net/bluetooth/Kconfig     | 20 ++++++++++++++++++++
> >>>> net/bluetooth/hci_core.c  | 10 ++++++++++
> >>>> net/bluetooth/hci_event.c |  4 ++++
> >>>> 3 files changed, 34 insertions(+)
> >>>>
> >>>> diff --git a/net/bluetooth/Kconfig b/net/bluetooth/Kconfig
> >>>> index 165148c7c4ce..8e177d4f3f02 100644
> >>>> --- a/net/bluetooth/Kconfig
> >>>> +++ b/net/bluetooth/Kconfig
> >>>> @@ -128,4 +128,24 @@ config BT_DEBUGFS
> >>>>         Provide extensive information about internal Bluetooth state=
s
> >>>>         in debugfs.
> >>>>
> >>>> +config BT_EXPERT
> >>>> +       bool "Expert Bluetooth options"
> >>>> +       depends on BT
> >>>> +       default n
> >>>> +       help
> >>>> +         Provides a set of expert options and configurations that s=
hould
> >>>> +         only be used deliberately by BT experts.  This is consider=
ed a
> >>>> +         global switch to ensure these advanced features or options=
 that
> >>>> +         depends on BT_EXPERT are only used in expert mode.
> >>>> +
> >>>> +config BT_ENFORCE_CLASSIC_KEY_SIZES
> >>>> +       bool "Enforces security requirements for Bluetooth classic"
> >>>> +       depends on BT && BT_EXPERT
> >>>> +       default y
> >>>> +       help
> >>>> +         Enforces Bluetooth classic security requirements by disall=
owing
> >>>> +         use of insecure Bluetooth controllers, i.e. that doesn't s=
upport
> >>>> +         Read Encryption Key Size command to prevent BT classic con=
nection
> >>>> +         with very short encryption key.
> >>>> +
> >>>> source "drivers/bluetooth/Kconfig"
> >>>> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> >>>> index 4e6d61a95b20..142130d4b66b 100644
> >>>> --- a/net/bluetooth/hci_core.c
> >>>> +++ b/net/bluetooth/hci_core.c
> >>>> @@ -1540,6 +1540,16 @@ static int hci_dev_do_open(struct hci_dev *hd=
ev)
> >>>>
> >>>>       clear_bit(HCI_INIT, &hdev->flags);
> >>>>
> >>>> +#ifdef BT_ENFORCE_CLASSIC_KEY_SIZES
> >>>> +       /* Don't allow usage of Bluetooth if the chip doesn't suppor=
t */
> >>>> +       /* Read Encryption Key Size command */
> >>>> +       if (!ret && !(hdev->commands[20] & 0x10)) {
> >>>> +               bt_dev_err(hdev,
> >>>> +                          "Disabling BT, Read Encryption Key Size !=
supported");
> >>>> +               ret =3D -EIO;
> >>>> +       }
> >>>> +#endif
> >>> Just FYI, I haven't changed this bit yet.  I'll wait for your guidanc=
e
> >>> on where best to put this to leave the controller in the right state.
> >>
> >> while I was writing a patch to show how to use unconfigured state for =
controllers that don=E2=80=99t support the Read Encryption Key Size command=
, I was wonder why put this into the kernel in the first place.
> >>
> >> I was thinking that essentially userspace can just make the decision t=
o use a controller, or use it in LE only mode or not use a controller at al=
l. So all we need is to collect the security information of the controller =
and kernel and expose them to bluetoothd.
> >>
> >> +Read Security Features Command
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +       Command Code:           0x0048
> >> +       Controller Index:       <controller id>
> >> +       Command Parameters:
> >> +       Return Parameters:      Security_Features (4 Octets)
> >> +
> >> +       This command is used to retrieve the supported security featur=
es
> >> +       by the controller or the kernel.
> >> +
> >> +       The Security_Features parameter is a bitmask with currently th=
e
> >> +       following available bits:
> >> +
> >> +               0       Encryption Key Size enforcement (BR/EDR)
> >> +               1       Encryption Key Size enforcement (LE)
> >> +
> >> +       This command generates a Command Complete event on success or
> >> +       a Command Status event on failure.
> >> +
> >> +       Possible errors:        Invalid Parameters
> >> +                               Invalid Index
> >> +
> >> +
> >>
> >> I was also considering that we additionally add the ECDH Public Key va=
lidation here as supported bits. And in the future even more security relat=
ed information that we want to enforce. However the enforcement to power on=
 or not use a controller is left to bluetoothd and its main.conf configurat=
ion. Thoughts?
> > I like the idea.  However, I feel we will still need to guard against
> > the Read Encryption Key Size failing.  Perhaps we can just do this
> > unconditionally (where it is reported as supported but fails, we
> > simply set the encryption key size to 0 and move on).
>
> I was thinking the same thing. Lets just set the encryption size to zero =
and report the error. Care to send a patch for it or should I send one?
I'll do it shortly.

Would you want to send patch you suggested (eg: Read Security Features
Command) or should I?

>
> Regards
>
> Marcel
>
