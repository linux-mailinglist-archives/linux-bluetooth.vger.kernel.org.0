Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2C1175F61
	for <lists+linux-bluetooth@lfdr.de>; Mon,  2 Mar 2020 17:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbgCBQTo (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 2 Mar 2020 11:19:44 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:32795 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726621AbgCBQTo (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 2 Mar 2020 11:19:44 -0500
Received: by mail-lf1-f67.google.com with SMTP id c20so46541lfb.0
        for <linux-bluetooth@vger.kernel.org>; Mon, 02 Mar 2020 08:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2UQKf3Rr8bvCc43XSu2GXeF9l3xnDibLppJgZbrqfJc=;
        b=MDPO13kBT0uHbAnYWzQY+0GkpjnRVLHJWPgL1PGlKf+KN6Op9QD+0fKkvZZb4PMhWb
         QlKSpE/DDlcY0GQFLP60DSa9TfoDZE9H7t0B7QdTFVJwCk89RbAMwtCwhvew5r2DiLu4
         gTdRPhA7brh219KnzmJJGUiSGeXyzdHQk1yWEHJ5k61jMRuY5rc7vbSQBnfBiRKaCFr3
         mORj7cVMosWGNjlyRZp4HGlWOWZpDdBLr4sBWLW5siVGO3wb+YQKSLnms4qY0g/RtknV
         WlvUJxPlswOUVDCAyzMZjrDeY0MpKnpB8ScstPPq7+++4lAyaocNAzfVdRflgQNLgwSI
         DuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2UQKf3Rr8bvCc43XSu2GXeF9l3xnDibLppJgZbrqfJc=;
        b=h3emsi3R/7KahSAwlUMVllrC4Mc5rOO3mN3swBv0rDB3h4J4vOXTN43PMNXdHa8lbb
         hYxoxG4valt0/T6d59XSZtmfoaM/eItdxeVkOLNsGgBEQ6jO8nMEuAGcG0Ro2yqlYSu7
         UZTb8ftppVdkY21mEF+1SCTG/OdDx27MqlxGJ9aPeXU+Kn1e7fnKxheivcmwYkC7KDHx
         K/4DNj1N3tj/2Nk2rBbmi4GDEH25zMV2pOfQYP03ZMMFO/1Uwq5uxiqDjFDsYBlowmVq
         F5My2esT6+WWhj3bxHSYIk2oyIlHuYPx/GmVAhAKWP4G5bJ3OLk+rcFa7ok2X3dHtWHS
         EI5A==
X-Gm-Message-State: ANhLgQ11pMSzk9wBC2T2CjC/jTixvy8VqocUMB+OVpLr5i/UgDbpSsPy
        ocLrsT0nQBMAsVMG4yy7bkiTyKPmMfb1AhzMmuTVkg==
X-Google-Smtp-Source: ADFU+vsnXXaMYUKC1sBCUDdgIoCi2O/iJtrknDLY6MOOca+DSF7mfYO0JZd+FE5AFQZ4mgA8SDY8hgPwj7bxjGLZUGM=
X-Received: by 2002:a05:6512:10cf:: with SMTP id k15mr4640172lfg.142.1583165981421;
 Mon, 02 Mar 2020 08:19:41 -0800 (PST)
MIME-Version: 1.0
References: <20200228163922.87031-1-alainm@chromium.org> <6257E23A-64BD-4073-AED6-4BB7155B5A89@holtmann.org>
In-Reply-To: <6257E23A-64BD-4073-AED6-4BB7155B5A89@holtmann.org>
From:   Alain Michaud <alainmichaud@google.com>
Date:   Mon, 2 Mar 2020 11:19:29 -0500
Message-ID: <CALWDO_UDy+0uywAVJSa75sGG+hgK0aYhAZH-MUJVv=ZYn-yBDg@mail.gmail.com>
Subject: Re: [PATCH v2] bluetooth: Enable erroneous data reporting if wbs is supported
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Alain Michaud <alainm@chromium.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel,



On Sat, Feb 29, 2020 at 9:43 PM Marcel Holtmann <marcel@holtmann.org> wrote=
:
>
> Hi Alain,
>
> > This change will enable erroneous data reporting if wide band speech is
> > supported by the controller as indicated by the
> > HCI_QUIRK_WIDE_BAND_SPEECH_SUPPORTED quirk.
> >
> > Signed-off-by: Alain Michaud <alainm@chromium.org>
> > ---
> >
> > include/net/bluetooth/hci.h      | 13 ++++++++
> > include/net/bluetooth/hci_core.h |  1 +
> > net/bluetooth/hci_core.c         |  3 ++
> > net/bluetooth/hci_event.c        | 55 ++++++++++++++++++++++++++++++++
> > net/bluetooth/mgmt.c             |  3 +-
> > 5 files changed, 74 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> > index 0b3ebd35681d..aa1654f9b579 100644
> > --- a/include/net/bluetooth/hci.h
> > +++ b/include/net/bluetooth/hci.h
> > @@ -1095,6 +1095,19 @@ struct hci_rp_read_inq_rsp_tx_power {
> >       __s8     tx_power;
> > } __packed;
> >
> > +#define HCI_OP_READ_DEF_ERR_DATA_REPORTING   0x0c5a
> > +     #define ERR_DATA_REPORTING_DISABLED     0x00
> > +     #define ERR_DATA_REPORTING_ENABLED      0x01
>
> are these two defines make the code really more readable. Or is 0x00 and =
0x01 obvious enough?
I generally dislike magic numbers.  There are a number of precedent
set in the core specification where 0 and 1 becomes 0, 1 and many
other options (like scan policies).  Having the values clearly spelled
out makes more sense to me, but I'm happy to follow your guidance
here.

>
> > +struct hci_rp_read_def_err_data_reporting {
> > +     __u8     status;
> > +     __u8     err_data_reporting;
>

> Just call this field enabled.
This is using the field value as defined in the Core Spec.  Happy to
change it if you feel strongly about this.

>
> > +} __packed;
> > +
> > +#define HCI_OP_WRITE_DEF_ERR_DATA_REPORTING  0x0c5b
> > +struct hci_cp_write_def_err_data_reporting {
> > +     __u8     err_data_reporting;
>
> Same as above, just call it enabled.
Same as above.


>
> > +} __packed;
> > +
> > #define HCI_OP_SET_EVENT_MASK_PAGE_2  0x0c63
> >
> > #define HCI_OP_READ_LOCATION_DATA     0x0c64
> > diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/h=
ci_core.h
> > index dcc0dc6e2624..c498ac113930 100644
> > --- a/include/net/bluetooth/hci_core.h
> > +++ b/include/net/bluetooth/hci_core.h
> > @@ -260,6 +260,7 @@ struct hci_dev {
> >       __u8            stored_num_keys;
> >       __u8            io_capability;
> >       __s8            inq_tx_power;
> > +     __u8            err_data_reporting;
> >       __u16           page_scan_interval;
> >       __u16           page_scan_window;
> >       __u8            page_scan_type;
> > diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> > index 4e6d61a95b20..3becdce5457a 100644
> > --- a/net/bluetooth/hci_core.c
> > +++ b/net/bluetooth/hci_core.c
> > @@ -603,6 +603,9 @@ static int hci_init3_req(struct hci_request *req, u=
nsigned long opt)
> >       if (hdev->commands[8] & 0x01)
> >               hci_req_add(req, HCI_OP_READ_PAGE_SCAN_ACTIVITY, 0, NULL)=
;
> >
> > +     if (hdev->commands[18] & 0x02)
> > +             hci_req_add(req, HCI_OP_READ_DEF_ERR_DATA_REPORTING, 0, N=
ULL);
> > +
> >       /* Some older Broadcom based Bluetooth 1.2 controllers do not
> >        * support the Read Page Scan Type command. Check support for
> >        * this command in the bit mask of supported commands.
> > diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> > index 591e7477e925..21fd1ebd9c6a 100644
> > --- a/net/bluetooth/hci_event.c
> > +++ b/net/bluetooth/hci_event.c
> > @@ -901,6 +901,53 @@ static void hci_cc_read_inq_rsp_tx_power(struct hc=
i_dev *hdev,
> >       hdev->inq_tx_power =3D rp->tx_power;
> > }
> >
> > +static void hci_cc_read_def_err_data_reporting(struct hci_dev *hdev,
> > +                                            struct sk_buff *skb)
> > +{
> > +     struct hci_rp_read_def_err_data_reporting *rp =3D (void *)skb->da=
ta;
> > +
> > +     BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
> > +
> > +     if (rp->status)
> > +             return;
> > +
> > +     hdev->err_data_reporting =3D rp->err_data_reporting;
> > +
> > +     /* If the controller supports wide_band_speech, enable erroneous
> > +      * data reporting.
> > +      */
> > +     if (hdev->err_data_reporting !=3D ERR_DATA_REPORTING_ENABLED &&
> > +         (hdev->commands[18] & 0x04) &&
> > +         test_bit(HCI_QUIRK_WIDE_BAND_SPEECH_SUPPORTED, &hdev->quirks)=
) {
> > +             struct hci_request req;
> > +             struct hci_cp_write_def_err_data_reporting cp =3D {};
> > +
> > +             hci_req_init(&req, hdev);
> > +             cp.err_data_reporting =3D ERR_DATA_REPORTING_ENABLED;
> > +
> > +             hci_req_add(&req, HCI_OP_WRITE_DEF_ERR_DATA_REPORTING,
> > +                         sizeof(cp), &cp);
> > +     }
>
> Please don=E2=80=99t do this here. These event callbacks are just here to=
 store the information in hci_dev for simple read/write commands like this =
one.
Any recommendations as to where to do this after the read has completed?

>
> > +}
> > +
> > +static void hci_cc_write_def_err_data_reporting(struct hci_dev *hdev,
> > +                                             struct sk_buff *skb)
> > +{
> > +     __u8 status =3D *((__u8 *)skb->data);
> > +     struct hci_cp_write_def_err_data_reporting *cp;
> > +
> > +     BT_DBG("%s status 0x%2.2x", hdev->name, status);
> > +
> > +     if (status)
> > +             return;
> > +
> > +     cp =3D hci_sent_cmd_data(hdev, HCI_OP_WRITE_DEF_ERR_DATA_REPORTIN=
G);
> > +     if (!cp)
> > +             return;
> > +
> > +     hdev->err_data_reporting =3D cp->err_data_reporting;
> > +}
> > +
> > static void hci_cc_pin_code_reply(struct hci_dev *hdev, struct sk_buff =
*skb)
> > {
> >       struct hci_rp_pin_code_reply *rp =3D (void *) skb->data;
> > @@ -3302,6 +3349,14 @@ static void hci_cmd_complete_evt(struct hci_dev =
*hdev, struct sk_buff *skb,
> >               hci_cc_read_inq_rsp_tx_power(hdev, skb);
> >               break;
> >
> > +     case HCI_OP_READ_DEF_ERR_DATA_REPORTING:
> > +             hci_cc_read_def_err_data_reporting(hdev, skb);
> > +             break;
> > +
> > +     case HCI_OP_WRITE_DEF_ERR_DATA_REPORTING:
> > +             hci_cc_write_def_err_data_reporting(hdev, skb);
> > +             break;
> > +
> >       case HCI_OP_PIN_CODE_REPLY:
> >               hci_cc_pin_code_reply(hdev, skb);
> >               break;
> > diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> > index 1002c657768a..8827d942b2d9 100644
> > --- a/net/bluetooth/mgmt.c
> > +++ b/net/bluetooth/mgmt.c
> > @@ -764,7 +764,8 @@ static u32 get_supported_settings(struct hci_dev *h=
dev)
> >                       settings |=3D MGMT_SETTING_SECURE_CONN;
> >
> >               if (test_bit(HCI_QUIRK_WIDE_BAND_SPEECH_SUPPORTED,
> > -                          &hdev->quirks))
> > +                          &hdev->quirks) &&
> > +                 hdev->err_data_reporting =3D=3D ERR_DATA_REPORTING_EN=
ABLED)
> >                       settings |=3D MGMT_SETTING_WIDE_BAND_SPEECH;
>
> This change is wrong. We always want to have it listed as a supported set=
ting. That setting should never change. For the current settings, you want =
the Wideband speech indication to change. And lets really tie this together=
 with a Set Wideband Speech mgmt command so you can toggle this.
>
> It is good to have an option to enable/disable it. We do the same for SSP=
, Secure Connections and other options. Even if bluetoothd will just enable=
 them by default if available, for qualification purposes it has been cruci=
al that we can select different settings at runtime.
I could be convinced that there is value in enabling/disabling
erroneous data reporting, I'm not so sure there is value in being able
to toggle what is supposed to represent the controller's capability to
do it.  Please remember that wide_band_speech in this context is a
capability, not a setting per say while erroneous data reporting is a
setting that could arguably be enabled/disabled.  As previously
discussed you had indicated a preference for tying the two together,
but I'd argue these are separate things.  Perhaps we should go back to
my original proposal to treat them separately?
(https://patchwork.kernel.org/patch/11400785/)






>
> Regards
>
> Marcel
>
