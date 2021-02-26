Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D93363269AA
	for <lists+linux-bluetooth@lfdr.de>; Fri, 26 Feb 2021 22:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbhBZVnY (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 26 Feb 2021 16:43:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbhBZVnX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 26 Feb 2021 16:43:23 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054F8C061574
        for <linux-bluetooth@vger.kernel.org>; Fri, 26 Feb 2021 13:42:43 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id v12so9336475ott.10
        for <linux-bluetooth@vger.kernel.org>; Fri, 26 Feb 2021 13:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WuRYzHFNhvWXrwK1WlZn+x6PP6eCL2/a7LmhBfBlxHA=;
        b=herVQz1ecWJPibpItmUE6DXEElK7Qy4kTYEiV/i1STDWjqLokm92y4b1tNOhgm+Wvt
         eHJKf9JKksdMA9t96FYq9nXC4OX4T4dlKMfRFy6nBe8F2PVqt9ewZkA6kxxBo3sMr4Mw
         CgXbuHE5al+EU2nG6+XWUYEkUiCD0ztoUFoZYGxnBPAdVX9p3ibRDfokXRvK4yurULmH
         juOJEqAKomqRRVVqsuDhuc69Np/H4WixsYb6G86fFZQBbgLtuYDjg8oXVhxzuXwUFVAn
         HzP/eDhDgzHSBxdj6ODZQcrSkB7ZFgutapGJSwqJXHlYoRxJP57vP5mwnrAPr0SO3/A4
         ebTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WuRYzHFNhvWXrwK1WlZn+x6PP6eCL2/a7LmhBfBlxHA=;
        b=dvvMHGUOQVLvVCIOhk1+bNlzez50w+KSQ8N9T5Tq1qHsBA3J/CWC4ocydQNwlrwYDo
         kWKGNBc1lrcIon8Geh0sTQYU0TGs7b4+4h2Uy5NlE+5HtPPsgA+X+z0NSkPtuexhtqX3
         rhKrtb3Ec/bBFJOvjvhcizUxJf95vHx9R3wnrJwjJRJJXeI3WwIFcgO8K5MFam2cOg1R
         7GSd3e0WLpW8l8OttIraWEXPRMnCQz4jbtYh7QSIziXUxe5v2Wfr1dhI6dox3GLcwiAU
         y6x/U5eAQQ7UJwiF6/dih08N690rMhSwuktl5I4e/oMJvABmNat/MqjAqqoQrKxhxByv
         2slA==
X-Gm-Message-State: AOAM530vPeWZJyk7fE7ezEadV9EAfhJ5hOz5riimm0kQbR2nv8fbJIcZ
        oQmUPFUCJg55yDRQYjnJdIaBAWwSLjEB9uwQAQbg8696/uOCbg==
X-Google-Smtp-Source: ABdhPJxpojwos5RPHdmCJOH8habdMvr0ituotZN8SI9fEAkVUuzpspZza5BY8RPB0u2rvk8Uf3z7dx3uQOXqBgLiMt4=
X-Received: by 2002:a9d:7b44:: with SMTP id f4mr4089532oto.240.1614375762315;
 Fri, 26 Feb 2021 13:42:42 -0800 (PST)
MIME-Version: 1.0
References: <20210222103021.20923-1-magdalena.kasenberg@codecoup.pl> <124AEB1E-158A-4CFB-BD5D-2DCA4C86ECD2@holtmann.org>
In-Reply-To: <124AEB1E-158A-4CFB-BD5D-2DCA4C86ECD2@holtmann.org>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Fri, 26 Feb 2021 13:42:31 -0800
Message-ID: <CABBYNZ+3njOxCGKE0cvxkw574=U5Uv7+HHn885MrVFaoO3NpNQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: Fix for L2CAP/LE/CFC/BV-15-C
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Magdalena Kasenberg <magdalena.kasenberg@codecoup.pl>,
        Bluetooth Kernel Mailing List 
        <linux-bluetooth@vger.kernel.org>,
        Szymon Janc <szymon.janc@codecoup.pl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel,

On Fri, Feb 26, 2021 at 12:23 PM Marcel Holtmann <marcel@holtmann.org> wrote:
>
> Hi Magdalena,
>
> > This is required for the qualification test L2CAP/LE/CFC/BV-15-C
> >
> > Implementation does not allow to set different key size for SMP and
> > L2CAP, which is needed for a current specification of the test. This fix
> > workarounds it with the debugfs variable le_l2cap_min_key_size.
> >
> > Logs from the test when the IUT uses a min and max l2cap encryption key size 16.
> > $ echo 16 > /sys/kernel/debug/bluetooth/hci0/le_l2cap_min_key_size
> > The lower tester uses a key size 7.
> >
> >> ACL Data RX: Handle 99 flags 0x02 dlen 11                #34 [hci0] 25.007392
> >      SMP: Pairing Request (0x01) len 6
> >        IO capability: DisplayYesNo (0x01)
> >        OOB data: Authentication data not present (0x00)
> >        Authentication requirement: Bonding, No MITM, SC, No Keypresses (0x09)
> >        Max encryption key size: 7
> >        Initiator key distribution: <none> (0x00)
> >        Responder key distribution: <none> (0x00)
> > < ACL Data TX: Handle 99 flags 0x00 dlen 11                #35 [hci0] 25.007591
> >      SMP: Pairing Response (0x02) len 6
> >        IO capability: KeyboardDisplay (0x04)
> >        OOB data: Authentication data not present (0x00)
> >        Authentication requirement: Bonding, No MITM, SC, No Keypresses (0x09)
> >        Max encryption key size: 16
> >        Initiator key distribution: <none> (0x00)
> >        Responder key distribution: <none> (0x00)
> > @ MGMT Event: New Long Term Key (0x000a) plen 37      {0x0001} [hci0] 28.788872
> >        Store hint: Yes (0x01)
> >        LE Address: C0:DE:C0:FF:FF:01 (OUI C0-DE-C0)
> >        Key type: Unauthenticated key from P-256 (0x02)
> >        Master: 0x00
> >        Encryption size: 7
> >        Diversifier: 0000
> >        Randomizer: 0000000000000000
> >        Key: 529e11e8c7b9f5000000000000000000
> >
> > <snip>
> >
> > After pairing with key size 7, L2CAP connection is requested which
> > requires key size 16.
> >
> >> ACL Data RX: Handle 99 flags 0x02 dlen 18                #56 [hci0] 34.998084
> >      LE L2CAP: LE Connection Request (0x14) ident 3 len 10
> >        PSM: 244 (0x00f4)
> >        Source CID: 64
> >        MTU: 256
> >        MPS: 284
> >        Credits: 1
> > < ACL Data TX: Handle 99 flags 0x00 dlen 18                #57 [hci0] 34.998325
> >      LE L2CAP: LE Connection Response (0x15) ident 3 len 10
> >        Destination CID: 0
> >        MTU: 0
> >        MPS: 0
> >        Credits: 0
> >        Result: Connection refused - insufficient encryption key size (0x0007)
> >
> > Signed-off-by: Magdalena Kasenberg <magdalena.kasenberg@codecoup.pl>
> > Reviewed-by: Szymon Janc <szymon.janc@codecoup.pl>
> > Cc: Szymon Janc <szymon.janc@codecoup.pl>
> > ---
> > include/net/bluetooth/hci_core.h |  1 +
> > net/bluetooth/hci_core.c         |  1 +
> > net/bluetooth/hci_debugfs.c      | 30 ++++++++++++++++++++++++++++++
> > net/bluetooth/l2cap_core.c       | 25 +++++++++++++++++++++++++
> > 4 files changed, 57 insertions(+)
> >
> > diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
> > index ebdd4afe30d2..0bf0543efec5 100644
> > --- a/include/net/bluetooth/hci_core.h
> > +++ b/include/net/bluetooth/hci_core.h
> > @@ -379,6 +379,7 @@ struct hci_dev {
> >       __u16           auth_payload_timeout;
> >       __u8            min_enc_key_size;
> >       __u8            max_enc_key_size;
> > +     __u8            le_l2cap_min_key_size;
> >       __u8            pairing_opts;
> >       __u8            ssp_debug_mode;
> >       __u8            hw_error_code;
> > diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> > index b0d9c36acc03..9ef4b39b380c 100644
> > --- a/net/bluetooth/hci_core.c
> > +++ b/net/bluetooth/hci_core.c
> > @@ -3788,6 +3788,7 @@ struct hci_dev *hci_alloc_dev(void)
> >       hdev->conn_info_max_age = DEFAULT_CONN_INFO_MAX_AGE;
> >       hdev->auth_payload_timeout = DEFAULT_AUTH_PAYLOAD_TIMEOUT;
> >       hdev->min_enc_key_size = HCI_MIN_ENC_KEY_SIZE;
> > +     hdev->le_l2cap_min_key_size = HCI_MIN_ENC_KEY_SIZE;
>
> so I am not a fan of doing this with another variable and managing through debugfs. Can we pass the qualification test case by using BT_SECURITY_FIPS (which will enforce 128-bit key size)?

I guess that will depend if PTS supports MITM which afaik it is
required with BT_SECURITY_FIPS, from the logs it looks like it doesn't
support it so we end up with an unauthenticated key so the error would
probably be different.

> If not then we might want to add a socket option to set min/max encryption key size requirement on a per socket basis.

Yep, it seems to be a common trend to have such tests on upper layers
(ATT/GATT also have such encryption key size), even though it is more
of a GAP test and perhaps could have been done at SMP level.

>
> Regards
>
> Marcel
>


-- 
Luiz Augusto von Dentz
