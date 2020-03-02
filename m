Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D561E1766A7
	for <lists+linux-bluetooth@lfdr.de>; Mon,  2 Mar 2020 23:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbgCBWR3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 2 Mar 2020 17:17:29 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35590 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgCBWR3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 2 Mar 2020 17:17:29 -0500
Received: by mail-lj1-f195.google.com with SMTP id a12so1293563ljj.2
        for <linux-bluetooth@vger.kernel.org>; Mon, 02 Mar 2020 14:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kuu7sKozS1Z90XhK5FCj83LlSIm0feUCvy8NV+fPy6A=;
        b=Yh9Qi0EH3xBWueCI0zxU18DnTQhseDRg8jvaWXH23tE+0Q4lwEM9vXItnTEl8fTakA
         ZcpqOvSMU6ePo8ptoZ3+okl8k6Vxim+umA5pGr3od/Kmd6A+1wfJURGYTnLA24B7Z11D
         whNODo3S+nhbGaN/PGmkn0iUTRbZdpCNVnbnkNAXH8/Zk4VHlP90lc2nroRaUAnEjS7O
         +v+9MYxa9iTmRSfMBM3/ODZ6yFZMj6SEoD7t0pOL+jBBjfYD++tLPS8hzDs//6DFKoS+
         32Vtpo7zjD/sn2HOP7rpxdMSANpt73Ptndl3lU98gCBzghoZFleNoYaJ8CcmwNfcDp7M
         i6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kuu7sKozS1Z90XhK5FCj83LlSIm0feUCvy8NV+fPy6A=;
        b=i49nQ77bDBu4xwBsFdrznaBR+V4b94TuSCuMLdiUY978RO04kvS7y1BwskvvInw7Qg
         9eYrcAOuWA2CQniF9wj69egG+8y52a3ILJsMQGMX9qMOcNffwdhrqxuyXjH4MKQkWLVp
         zem7FuV2koANdyf7k3I99qaYa2rXaBaZQo/d8kLsKOVqWOBQzQP5ExU/IzVlNvmEBeWu
         sxvCZH0fYyKeFqgmg/SuC4wceSPSOOQZF7pPtSm/Pz62NH8ZjMaGflxOvqeuAE9vf0Z3
         aDJoasVcUpDLsLhZqpJIXOI0BJice53lgrTng/w6PBDDfhXeBiFLOfkRjnrsFEhrxVUK
         lw8A==
X-Gm-Message-State: ANhLgQ2dHY/OxlzHhJ8iuNk8b+kmwztOWyo+P34Iz8+fYCdZZI+pcMyG
        hsghXo1qBfehftwG2o3ajLPqVmd54NaaxUWHBeGpWJ5K
X-Google-Smtp-Source: ADFU+vtDYVc5nEdjzICnk0W2Hfq6RkBT9nzH8nXRajylbwlaUQANULdya28QkZKI5/a3o6Sh9hB9b7Ruu1JK9PjABRw=
X-Received: by 2002:a2e:9bc6:: with SMTP id w6mr577692ljj.81.1583187446155;
 Mon, 02 Mar 2020 14:17:26 -0800 (PST)
MIME-Version: 1.0
References: <20200228163922.87031-1-alainm@chromium.org> <6257E23A-64BD-4073-AED6-4BB7155B5A89@holtmann.org>
 <CALWDO_UDy+0uywAVJSa75sGG+hgK0aYhAZH-MUJVv=ZYn-yBDg@mail.gmail.com> <8CC46B7A-0EE5-4482-B9AB-B72B8B381F7F@holtmann.org>
In-Reply-To: <8CC46B7A-0EE5-4482-B9AB-B72B8B381F7F@holtmann.org>
From:   Alain Michaud <alainmichaud@google.com>
Date:   Mon, 2 Mar 2020 17:17:14 -0500
Message-ID: <CALWDO_X2U0vekAp5+y_hsUefQaK9UzXr2sM=nvSV_MZtuD0=Wg@mail.gmail.com>
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

On Mon, Mar 2, 2020 at 5:10 PM Marcel Holtmann <marcel@holtmann.org> wrote:
>
> Hi Alain,
>
> >>> This change will enable erroneous data reporting if wide band speech =
is
> >>> supported by the controller as indicated by the
> >>> HCI_QUIRK_WIDE_BAND_SPEECH_SUPPORTED quirk.
> >>>
> >>> Signed-off-by: Alain Michaud <alainm@chromium.org>
> >>> ---
> >>>
> >>> include/net/bluetooth/hci.h      | 13 ++++++++
> >>> include/net/bluetooth/hci_core.h |  1 +
> >>> net/bluetooth/hci_core.c         |  3 ++
> >>> net/bluetooth/hci_event.c        | 55 +++++++++++++++++++++++++++++++=
+
> >>> net/bluetooth/mgmt.c             |  3 +-
> >>> 5 files changed, 74 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.=
h
> >>> index 0b3ebd35681d..aa1654f9b579 100644
> >>> --- a/include/net/bluetooth/hci.h
> >>> +++ b/include/net/bluetooth/hci.h
> >>> @@ -1095,6 +1095,19 @@ struct hci_rp_read_inq_rsp_tx_power {
> >>>      __s8     tx_power;
> >>> } __packed;
> >>>
> >>> +#define HCI_OP_READ_DEF_ERR_DATA_REPORTING   0x0c5a
> >>> +     #define ERR_DATA_REPORTING_DISABLED     0x00
> >>> +     #define ERR_DATA_REPORTING_ENABLED      0x01
> >>
> >> are these two defines make the code really more readable. Or is 0x00 a=
nd 0x01 obvious enough?
> > I generally dislike magic numbers.  There are a number of precedent
> > set in the core specification where 0 and 1 becomes 0, 1 and many
> > other options (like scan policies).  Having the values clearly spelled
> > out makes more sense to me, but I'm happy to follow your guidance
> > here.
>
> we don=E2=80=99t have a clear cut style in this regard. In a lot of cases=
 we have done 0x00 and 0x01, or adding a comment to make sure the reader kn=
ows what is going on. Or use a descriptive constant.
>
> I look at it from a code readability point of view. If 6 month from know,=
 the magic number is clear, then it sometimes makes sense to use it to help=
 keep the line length short and avoid to many line breaks. So it is a judge=
ment call.
Since the constant doesn't make the code difficult to read, am I ok to
assume it's ok to use a constant here? :)

>
> >>> +struct hci_rp_read_def_err_data_reporting {
> >>> +     __u8     status;
> >>> +     __u8     err_data_reporting;
> >>
> >
> >> Just call this field enabled.
> > This is using the field value as defined in the Core Spec.  Happy to
> > change it if you feel strongly about this.
>
> The Core spec is not consistent either with its field names. But lets kee=
p err_data_reporting then.
You are right, should we try to be consistent with the core spec in
any case? :). I dream of a day where these sort of struct will be
generated by a code generator.

>
> >
> >>
> >>> +} __packed;
> >>> +
> >>> +#define HCI_OP_WRITE_DEF_ERR_DATA_REPORTING  0x0c5b
> >>> +struct hci_cp_write_def_err_data_reporting {
> >>> +     __u8     err_data_reporting;
> >>
> >> Same as above, just call it enabled.
> > Same as above.
> >
> >
> >>
> >>> +} __packed;
> >>> +
> >>> #define HCI_OP_SET_EVENT_MASK_PAGE_2  0x0c63
> >>>
> >>> #define HCI_OP_READ_LOCATION_DATA     0x0c64
> >>> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth=
/hci_core.h
> >>> index dcc0dc6e2624..c498ac113930 100644
> >>> --- a/include/net/bluetooth/hci_core.h
> >>> +++ b/include/net/bluetooth/hci_core.h
> >>> @@ -260,6 +260,7 @@ struct hci_dev {
> >>>      __u8            stored_num_keys;
> >>>      __u8            io_capability;
> >>>      __s8            inq_tx_power;
> >>> +     __u8            err_data_reporting;
> >>>      __u16           page_scan_interval;
> >>>      __u16           page_scan_window;
> >>>      __u8            page_scan_type;
> >>> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> >>> index 4e6d61a95b20..3becdce5457a 100644
> >>> --- a/net/bluetooth/hci_core.c
> >>> +++ b/net/bluetooth/hci_core.c
> >>> @@ -603,6 +603,9 @@ static int hci_init3_req(struct hci_request *req,=
 unsigned long opt)
> >>>      if (hdev->commands[8] & 0x01)
> >>>              hci_req_add(req, HCI_OP_READ_PAGE_SCAN_ACTIVITY, 0, NULL=
);
> >>>
> >>> +     if (hdev->commands[18] & 0x02)
> >>> +             hci_req_add(req, HCI_OP_READ_DEF_ERR_DATA_REPORTING, 0,=
 NULL);
> >>> +
> >>>      /* Some older Broadcom based Bluetooth 1.2 controllers do not
> >>>       * support the Read Page Scan Type command. Check support for
> >>>       * this command in the bit mask of supported commands.
> >>> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> >>> index 591e7477e925..21fd1ebd9c6a 100644
> >>> --- a/net/bluetooth/hci_event.c
> >>> +++ b/net/bluetooth/hci_event.c
> >>> @@ -901,6 +901,53 @@ static void hci_cc_read_inq_rsp_tx_power(struct =
hci_dev *hdev,
> >>>      hdev->inq_tx_power =3D rp->tx_power;
> >>> }
> >>>
> >>> +static void hci_cc_read_def_err_data_reporting(struct hci_dev *hdev,
> >>> +                                            struct sk_buff *skb)
> >>> +{
> >>> +     struct hci_rp_read_def_err_data_reporting *rp =3D (void *)skb->=
data;
> >>> +
> >>> +     BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
> >>> +
> >>> +     if (rp->status)
> >>> +             return;
> >>> +
> >>> +     hdev->err_data_reporting =3D rp->err_data_reporting;
> >>> +
> >>> +     /* If the controller supports wide_band_speech, enable erroneou=
s
> >>> +      * data reporting.
> >>> +      */
> >>> +     if (hdev->err_data_reporting !=3D ERR_DATA_REPORTING_ENABLED &&
> >>> +         (hdev->commands[18] & 0x04) &&
> >>> +         test_bit(HCI_QUIRK_WIDE_BAND_SPEECH_SUPPORTED, &hdev->quirk=
s)) {
> >>> +             struct hci_request req;
> >>> +             struct hci_cp_write_def_err_data_reporting cp =3D {};
> >>> +
> >>> +             hci_req_init(&req, hdev);
> >>> +             cp.err_data_reporting =3D ERR_DATA_REPORTING_ENABLED;
> >>> +
> >>> +             hci_req_add(&req, HCI_OP_WRITE_DEF_ERR_DATA_REPORTING,
> >>> +                         sizeof(cp), &cp);
> >>> +     }
> >>
> >> Please don=E2=80=99t do this here. These event callbacks are just here=
 to store the information in hci_dev for simple read/write commands like th=
is one.
> > Any recommendations as to where to do this after the read has completed=
?
>
> Do it in one of the init stages.
ok.

>
> >>> +}
> >>> +
> >>> +static void hci_cc_write_def_err_data_reporting(struct hci_dev *hdev=
,
> >>> +                                             struct sk_buff *skb)
> >>> +{
> >>> +     __u8 status =3D *((__u8 *)skb->data);
> >>> +     struct hci_cp_write_def_err_data_reporting *cp;
> >>> +
> >>> +     BT_DBG("%s status 0x%2.2x", hdev->name, status);
> >>> +
> >>> +     if (status)
> >>> +             return;
> >>> +
> >>> +     cp =3D hci_sent_cmd_data(hdev, HCI_OP_WRITE_DEF_ERR_DATA_REPORT=
ING);
> >>> +     if (!cp)
> >>> +             return;
> >>> +
> >>> +     hdev->err_data_reporting =3D cp->err_data_reporting;
> >>> +}
> >>> +
> >>> static void hci_cc_pin_code_reply(struct hci_dev *hdev, struct sk_buf=
f *skb)
> >>> {
> >>>      struct hci_rp_pin_code_reply *rp =3D (void *) skb->data;
> >>> @@ -3302,6 +3349,14 @@ static void hci_cmd_complete_evt(struct hci_de=
v *hdev, struct sk_buff *skb,
> >>>              hci_cc_read_inq_rsp_tx_power(hdev, skb);
> >>>              break;
> >>>
> >>> +     case HCI_OP_READ_DEF_ERR_DATA_REPORTING:
> >>> +             hci_cc_read_def_err_data_reporting(hdev, skb);
> >>> +             break;
> >>> +
> >>> +     case HCI_OP_WRITE_DEF_ERR_DATA_REPORTING:
> >>> +             hci_cc_write_def_err_data_reporting(hdev, skb);
> >>> +             break;
> >>> +
> >>>      case HCI_OP_PIN_CODE_REPLY:
> >>>              hci_cc_pin_code_reply(hdev, skb);
> >>>              break;
> >>> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> >>> index 1002c657768a..8827d942b2d9 100644
> >>> --- a/net/bluetooth/mgmt.c
> >>> +++ b/net/bluetooth/mgmt.c
> >>> @@ -764,7 +764,8 @@ static u32 get_supported_settings(struct hci_dev =
*hdev)
> >>>                      settings |=3D MGMT_SETTING_SECURE_CONN;
> >>>
> >>>              if (test_bit(HCI_QUIRK_WIDE_BAND_SPEECH_SUPPORTED,
> >>> -                          &hdev->quirks))
> >>> +                          &hdev->quirks) &&
> >>> +                 hdev->err_data_reporting =3D=3D ERR_DATA_REPORTING_=
ENABLED)
> >>>                      settings |=3D MGMT_SETTING_WIDE_BAND_SPEECH;
> >>
> >> This change is wrong. We always want to have it listed as a supported =
setting. That setting should never change. For the current settings, you wa=
nt the Wideband speech indication to change. And lets really tie this toget=
her with a Set Wideband Speech mgmt command so you can toggle this.
> >>
> >> It is good to have an option to enable/disable it. We do the same for =
SSP, Secure Connections and other options. Even if bluetoothd will just ena=
ble them by default if available, for qualification purposes it has been cr=
ucial that we can select different settings at runtime.
> > I could be convinced that there is value in enabling/disabling
> > erroneous data reporting, I'm not so sure there is value in being able
> > to toggle what is supposed to represent the controller's capability to
> > do it.  Please remember that wide_band_speech in this context is a
> > capability, not a setting per say while erroneous data reporting is a
> > setting that could arguably be enabled/disabled.  As previously
> > discussed you had indicated a preference for tying the two together,
> > but I'd argue these are separate things.  Perhaps we should go back to
> > my original proposal to treat them separately?
> > (https://patchwork.kernel.org/patch/11400785/)
>
> So I prefer to introduce a MGMT_SETTING_WIDEBAND_SPEECH and Set Wideband =
Speech command to toggle the setting on and off. I really prefer that we ca=
n enable/disable this setting. For me it is also important that we have con=
sistency throughout the API as much as possible. As mentioned, this is the =
same as SSP, SC, BR/EDR, LE etc. setting that configure core features of th=
e hardware. The mgmt is meant to signal that some feature is supported and =
then allow enabling it if bluetoothd chooses to do so. That bluetoothd migh=
t enable it all the time is by design.
>
> And I am almost certain that for qualification purposes, you thank me lat=
er that you could easily disable Wideband speech by just calling btmgmt wbs=
 off.
I'm not clear what it would mean at this layer to disable wideband
speech.  It would effectively be a no-op unless you want to tie this
setting to erroneous data reporting.  Using or not using wideband
speech is then a profile level decision (codec negotiation etc, so I
don't see any point in having an enable/disable interface here).  I do
however see the value in a enable/disable MGMT interface for erroneous
data reporting which is a separate thing.


>
> Regards
>
> Marcel
>
