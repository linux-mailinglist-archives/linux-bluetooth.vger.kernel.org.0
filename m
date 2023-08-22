Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A245784880
	for <lists+linux-bluetooth@lfdr.de>; Tue, 22 Aug 2023 19:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjHVRjM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 22 Aug 2023 13:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjHVRjL (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 22 Aug 2023 13:39:11 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F364EC0
        for <linux-bluetooth@vger.kernel.org>; Tue, 22 Aug 2023 10:39:08 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b9b904bb04so75246191fa.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 22 Aug 2023 10:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692725947; x=1693330747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XO5nZdf7IRsgPhCtVcSGuvmMqOFA2hTPptieXV4yj28=;
        b=dMGj9jGSXpZL7HRAHe0R3JEc45VtirWbtzC7uCEZU1JUflkLfB+lI0QlHIVwhhSSnn
         Z3vIfQx0vSkGwJmLpPILLFF0Tqpwu5MZAEOZvzqCqqbJM2uLHYPXvinmzk9+5DaURMdn
         p8hGTAoA342ZhG5/Ou7ZtxdKiQpmlzGYnIl8uBzmf/3rssiQDzFy8cJoqH4dZOEeeMIn
         r8WuHnHaHLJnsBlHQr5n3fcX0Z9y6yOeMPcBana4ZFA/bB0ccDe/dB25doR7TJaOWVJ6
         LcuoYa8+R+dTDfNxSusQvNKKyxyY2zkHn0ocT/UwVj6QudQP02dE6qsrUithNrmfq80l
         QTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692725947; x=1693330747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XO5nZdf7IRsgPhCtVcSGuvmMqOFA2hTPptieXV4yj28=;
        b=WrVvC0VF6XcYHsStoc7qIldn4nmbtRY6aiR4isV6Cs+M3ycg3dJ5HZ1oGWtIyxnRV3
         7onJgYYuEglksBGlxlQObYXdSXkzly38e/rPvMby8xmUsMfBeQDKmm0KkMG9a7OB59Vf
         Dc9Bgb1RG5EgJ65hmC5x4VOfoaPEMexAoTTqCquKvP5+GbSGb+OwXxCoboFUpMmmeW/p
         1/JuGrVTjE975TYuEsNi0kUljLX8JJsbCdxCzyfad98pBDBXW49YaViJwnBYsBXabPnP
         jO5ucnhHdl1gvJciZ3SQnn0DwFGjvZXfufPhaJaoSS+dE5wwVCUKITgWMjs9Az0/8dGO
         XGRg==
X-Gm-Message-State: AOJu0Ywtpkn/jpIBfKho/2WWvUNZLcdziKjmYs8gUemVez7o+zrGhxfr
        ttmYO8ydBOna05AVUxAitJtNfCQRgIHzMlwUkSKZiRtG
X-Google-Smtp-Source: AGHT+IEH/Ofhsgml2AOLNCTI8CQdE51X1bsE8up2iwEWeurEKUsVeybb4icf73qRXxPMLzieGOmrgLAEMOC/g1PNzaI=
X-Received: by 2002:a2e:b714:0:b0:2b6:e2aa:8fbc with SMTP id
 j20-20020a2eb714000000b002b6e2aa8fbcmr7663572ljo.8.1692725946312; Tue, 22 Aug
 2023 10:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230821102810.Bluez.v1.1.Ib819b0964a5b8339305d94611acab85774a6c8ce@changeid>
 <CABBYNZK8SW9aMHL-yrCQUN+72z_rDZWK83wAdutMA8xG-Zdo9A@mail.gmail.com>
 <CAB4PzUpL-FBU0tz1gXjqZXY1ZoJKNSCqcf92Q=yhGo0g5YbtEQ@mail.gmail.com>
 <CABBYNZKaaSjmJ4ZLOsBjHYRw8Uoou0XbJKKnZ07Y30+hQONqnQ@mail.gmail.com>
 <CABBYNZ+zbs7TP57pn==YPKy_8MUOLBkjiJRPATM3prvO==L1-g@mail.gmail.com> <CAB4PzUoM=zxkNWy57N_nEucD_Q_9OotGnOHKb=yEXjnbBB-WGA@mail.gmail.com>
In-Reply-To: <CAB4PzUoM=zxkNWy57N_nEucD_Q_9OotGnOHKb=yEXjnbBB-WGA@mail.gmail.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Tue, 22 Aug 2023 10:38:54 -0700
Message-ID: <CABBYNZLyf96gs8vYPqfVYem1Sj5+sD7duAzuF50a7Bj3qTe+zw@mail.gmail.com>
Subject: Re: [Bluez PATCH v1] adapter: check wake_override when setting device privacy
To:     Zhengping Jiang <jiangzp@google.com>
Cc:     linux-bluetooth@vger.kernel.org,
        chromeos-bluetooth-upstreaming@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

On Mon, Aug 21, 2023 at 9:10=E2=80=AFPM Zhengping Jiang <jiangzp@google.com=
> wrote:
>
> Hi Luiz,
>
> A few questions on the patch.
> (1) I checked in the new_irk_callback, the patch calls
> device_set_rpa(device, true). This feels like the assumption is still
> having IRK means using RPA. If I understand correctly, this is not
> true. For example, the MX Master 3 mouse I am using. It is using an
> identity address, but still having IRK.
>
> This is from the pairing log, the RPA is empty in the callback.
> > src/adapter.c:new_irk_callback() hci0 new IRK for E3:C1:E3:A6:10:D9 RPA=
 00:00:00:00:00:00
>
> I think we may need to check the type of the conn_bdaddr and make sure
> it is a RPA.

The presence of an IRK means the device _can_ use RPA so it doesn't
really matter if the connection was done using an identity address or
not, that said some devices have the logic to user itd identity
address if they are nothing connects after some time so perhaps we can
detect that somehow since that means we can use the allow list.

> (2)
> > Note you need LL Privacy on the scanner side, not on the peripheral
> > that is advertising, so if you got this the other way around it will
> > not work. RPA resolution is required to be able to resolve the
> > advertisements using RPAs since the accept list can only be programmed
> > with the identity address.
>
> Regarding this, I have enabled privacy in both scanner and peripheral.
> As shown in the log, after the adapter is powered on. The identity
> address is added to the accept list and the IRK is added to the
> resolving list. Then the address resolution is enabled.
>
> < HCI Command: LE Add Device To Resolving List (0x08|0x0027) plen 39
>
>                #582 [hci0] 16:06:32.070202
>         Address type: Public (0x00)
>         Address: DC:A6:32:A4:09:DF (OUI DC-A6-32)
>         Peer identity resolving key: b724b925ee4e955d723fa2247bba24a0
>         Local identity resolving key: 00000000000000000000000000000000
> ...
> < HCI Command: LE Set Privacy Mode (0x08|0x004e) plen 8
>
>                #584 [hci0] 16:06:32.071113
>         Peer Identity address type: Public (0x00)
>         Peer Identity address: DC:A6:32:A4:09:DF (OUI DC-A6-32)
>         Privacy Mode: Use Device Privacy (0x01)
> ...
> < HCI Command: LE Add Device To Accept List (0x08|0x0011) plen 7
>
>                #586 [hci0] 16:06:32.072126
>         Address type: Public (0x00)
>         Address: DC:A6:32:A4:09:DF (OUI DC-A6-32)
> ...
> < HCI Command: LE Set Address Resolution Enable (0x08|0x002d) plen 1
>
>                #588 [hci0] 16:06:32.073130
>         Address resolution: Enabled (0x01)
> > HCI Event: Command Complete (0x0e) plen 4                              =
                                                                           =
         #589 [hci0] 16:06:32.073986
>       LE Set Address Resolution Enable (0x08|0x002d) ncmd 1
>         Status: Success (0x00)
>
> The scan policy is set to 0x01.
>
> < HCI Command: LE Set Extended Scan Parameters (0x08|0x0041) plen 8
>
>                #590 [hci0] 16:06:32.074074
>         Own address type: Public (0x00)
>         Filter policy: Ignore not in accept list (0x01)
>         PHYs: 0x01
>         Entry 0: LE 1M
>           Type: Passive (0x00)
>           Interval: 367.500 msec (0x024c)
>           Window: 37.500 msec (0x003c)
>
> The advertisement also shows the address is resolved.
>
> > HCI Event: LE Meta Event (0x3e) plen 32                                =
                                                                           =
         #604 [hci0] 16:07:05.292173
>       LE Extended Advertising Report (0x0d)
> ...
>           Address type: Resolved Public (0x02)
>           Address: DC:A6:32:A4:09:DF (OUI DC-A6-32)
>
> (3) Given comment (2), when LL privacy is enabled both on scanner and
> peripheral, the issue still exists in hog_probe. The connection is
> built with the RPA, so the connection cannot be found before adding
> the device is done. It will fail at hci_conn_params_lookup. As
> set_device_flags is always called with identity address.

Not really following, what is failing on hog_probe? Also please try
with master since we have merged some changes wrt to how experimental
is enabled.

> params =3D hci_conn_params_lookup(hdev, &cp->addr.bdaddr,
> le_addr_type(cp->addr.type));
>
> During add_device, a new hci_conn_params will be added with
> hci_conn_params_set. Then the following set_device_flags will not
> fail.
>
> Zhengping
>
>
> Thanks,
> Zhengping
>
>
>
>
>
> On Mon, Aug 21, 2023 at 12:59=E2=80=AFPM Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
> >
> > Hi,
> >
> > On Mon, Aug 21, 2023 at 12:51=E2=80=AFPM Luiz Augusto von Dentz
> > <luiz.dentz@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > On Mon, Aug 21, 2023 at 12:45=E2=80=AFPM Zhengping Jiang <jiangzp@goo=
gle.com> wrote:
> > > >
> > > > Hi Luiz,
> > > >
> > > > Thanks for the reply. I applied the above patch "device: Fix enabli=
ng
> > > > wake support without RPA Resolution" and tried again. I can see the=
re
> > > > are still some things missing.
> > > > I have attached a btsnoop log for reference. Here I am using a rasp=
 pi
> > > > configured as a LE mouse which is in privacy mode.
> > > >
> > > > The ll privacy feature is enabled at the beginning.
> > > > @ MGMT Command: Set Experimental Feature (0x004a) plen 17
> > > >                                                {0x0003} [hci0]
> > > > 19:21:30.193783
> > > >         UUID: BlueZ Experimental LL privacy
> > > >         Action: Enabled (0x01)
> > > >
> > > > Later the LE advertisement with RPA is received.
> >
> > Note you need LL Privacy on the scanner side, not on the peripheral
> > that is advertising, so if you got this the other way around it will
> > not work. RPA resolution is required to be able to resolve the
> > advertisements using RPAs since the accept list can only be programmed
> > with the identity address.
> >
> > > >
> > > > > HCI Event: LE Meta Event (0x3e) plen 32                          =
                                                       #311 [hci0] 19:22:36=
.633724
> > > >       LE Extended Advertising Report (0x0d)
> > > >         Num reports: 1
> > > >         Entry 0
> > > >           Event type: 0x0013
> > > >             Props: 0x0013
> > > >               Connectable
> > > >               Scannable
> > > >               Use legacy advertising PDUs
> > > >             Data status:  [0;32mComplete [0m
> > > >           Legacy PDU Type: ADV_IND (0x0013)
> > > >           Address type: Random (0x01)
> > > >           Address: 6F:CB:45:0C:AD:1F (Resolvable)
> > > >
> > > > But I still get the error for not being able to set wake_support. I
> > > > think this is not right as the address resolution is already enable=
d.
> > > > I haven't checked the details yet.
> > > >
> > > > =3D bluetoothd: Unable to set wake_support without RPA resolution
> > > >
> > > > 19:22:41.337325
> > > >
> > > > Then the wake up flag is not set as a result.
> > > >
> > > > @ MGMT Event: Device Flags Changed (0x002a) plen 15
> > > >                                                {0x0003} [hci0]
> > > > 19:22:41.372969
> > > >         LE Address: DC:A6:32:A4:08:BF (OUI DC-A6-32)
> > > >         Supported Flags: 0x00000003
> > > >           Remote Wakeup
> > > >           Device Privacy Mode
> > > >         Current Flags: 0x00000002
> > > >           Device Privacy Mode
> > > >
> > > > The address resolution is enabled as shown later in the log, after =
the
> > > > adapter reboot and the LE mouse can reconnect with RPA.
> > > >
> > > > < HCI Command: LE Set Address Resolution Enable (0x08|0x002d) plen =
1
> > > >                                                    #601 [hci0]
> > > > 19:22:57.164690
> > > >         Address resolution: Disabled (0x00)
> > > > > HCI Event: Command Complete (0x0e) plen 4                        =
                                                       #602 [hci0] 19:22:57=
.165530
> > > >       LE Set Address Resolution Enable (0x08|0x002d) ncmd 1
> > > >         Status: Success (0x00)
> > > > < HCI Command: LE Add Device To Resolving List (0x08|0x0027) plen 3=
9
> > > >                                                    #603 [hci0]
> > > > 19:22:57.165663
> > > >         Address type: Public (0x00)
> > > >         Address: DC:A6:32:A4:08:BF (OUI DC-A6-32)
> > > >         Peer identity resolving key: 0bf179254f3b2eb51324711e416f22=
e8
> > > >         Local identity resolving key: 00000000000000000000000000000=
000
> > > > ...
> > > >
> > > > Before applying the above patch, there will be a set device flag
> > > > command in the place of the error, but the command will fail.
> > > >
> > > > @ MGMT Command: Set Device Flags (0x0050) plen 11
> > > >                                                {0x0003} [hci0]
> > > > 00:42:59.247080
> > > >         LE Address: E4:5F:01:89:8F:85 (OUI E4-5F-01)
> > > >         Current Flags: 0x00000001
> > > >           Remote Wakeup
> > > > @ MGMT Event: Command Complete (0x0001) plen 10
> > > >                                                {0x0003} [hci0]
> > > > 00:42:59.247129
> > > >       Set Device Flags (0x0050) plen 7
> > > >         Status: Invalid Parameters (0x0d)
> > > >         LE Address: E4:5F:01:89:8F:85 (OUI E4-5F-01)
> > > >
> > > > Please let me know your opinion.
> > >
> > > Perhaps we need the following patch in order to make sure the
> > > experimental flags are enabled _before_ wake_support logic is
> > > triggered:
> > >
> > > https://patchwork.kernel.org/project/bluetooth/patch/00052eaeb78774fd=
7be365805203cb0c8b189243.1692531437.git.pav@iki.fi/
> > >
> > > I'm in the process of applying it since it we do have similar problem
> > > with the likes of ISO sockets that needs to be enabled before loading
> > > drivers, etc.
> > >
> > > > Thanks,
> > > > Zhengping
> > > >
> > > > On Mon, Aug 21, 2023 at 11:00=E2=80=AFAM Luiz Augusto von Dentz
> > > > <luiz.dentz@gmail.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Mon, Aug 21, 2023 at 10:28=E2=80=AFAM Zhengping Jiang <jiangzp=
@google.com> wrote:
> > > > > >
> > > > > > For the device using a RPA, hog_probe sets wake_override to tru=
e, but
> > > > > > the command to set remote wakeup fails because the device has n=
ot been
> > > > > > added to the kernel and the connection with the public address =
cannot be
> > > > > > found.
> > > > >
> > > > > This is actually not true, hog_probe does call
> > > > > device_set_wake_support, also note that I had a fix on how we han=
dle
> > > > > RPA with remote wakeup because that depends on LL Privacy/RPA
> > > > > Resolution:
> > > > >
> > > > > commit 7a4b67f9caa6bdc004c910f3a52108744a8cab74
> > > > > Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> > > > > Date:   Thu May 12 16:40:49 2022 -0700
> > > > >
> > > > >     device: Fix enabling wake support without RPA Resolution
> > > > >
> > > > >     If device uses RPA it shall only enable wakeup if RPA Resolut=
ion has
> > > > >     been enabled otherwise it cannot be programmed in the acceptl=
ist which
> > > > >     can cause suspend to fail.
> > > > >
> > > > >     Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D215768
> > > > >
> > > > >
> > > > > > When setting the device privacy flag, the wakeup flag should be=
 set
> > > > > > according to the wake_override, instead of the current flags.
> > > > >
> > > > > Afaik wake_override is only set by the user via WakeAllowed, plug=
ins
> > > > > shall not be using it directly, so it really sounds like this doe=
sn't
> > > > > apply to current upstream.
> > > > >
> > > > > > Signed-off-by: Zhengping Jiang <jiangzp@google.com>
> > > > > > ---
> > > > > >
> > > > > > Changes in v1:
> > > > > > - Add function to fetch wake_override value
> > > > > > - Set the remote wakeup bit if privacy mode is used when settin=
g flags
> > > > > >
> > > > > >  src/adapter.c | 2 ++
> > > > > >  src/device.c  | 5 +++++
> > > > > >  src/device.h  | 1 +
> > > > > >  3 files changed, 8 insertions(+)
> > > > > >
> > > > > > diff --git a/src/adapter.c b/src/adapter.c
> > > > > > index 004062e7c..f63018495 100644
> > > > > > --- a/src/adapter.c
> > > > > > +++ b/src/adapter.c
> > > > > > @@ -5520,6 +5520,8 @@ static void add_device_complete(uint8_t s=
tatus, uint16_t length,
> > > > > >         if (btd_opts.device_privacy) {
> > > > > >                 uint32_t flags =3D btd_device_get_current_flags=
(dev);
> > > > > >
> > > > > > +               if (device_get_wake_override(dev))
> > > > > > +                       flags |=3D DEVICE_FLAG_REMOTE_WAKEUP;
> > > > >
> > > > > We shall only use override if wake_support is set.
> > > > >
> > > > > >                 /* Set Device Privacy Mode has not set the flag=
 yet. */
> > > > > >                 if (!(flags & DEVICE_FLAG_DEVICE_PRIVACY)) {
> > > > > >                         adapter_set_device_flags(adapter, dev, =
flags |
> > > > > > diff --git a/src/device.c b/src/device.c
> > > > > > index 9b58e0c4e..ae75f2fd1 100644
> > > > > > --- a/src/device.c
> > > > > > +++ b/src/device.c
> > > > > > @@ -1545,6 +1545,11 @@ void device_set_wake_override(struct btd=
_device *device, bool wake_override)
> > > > > >         }
> > > > > >  }
> > > > > >
> > > > > > +bool device_get_wake_override(struct btd_device *device)
> > > > > > +{
> > > > > > +       return device->wake_override;
> > > > > > +}
> > > > > > +
> > > > > >  static void device_set_wake_allowed_complete(struct btd_device=
 *device)
> > > > > >  {
> > > > > >         if (device->wake_id !=3D -1U) {
> > > > > > diff --git a/src/device.h b/src/device.h
> > > > > > index 3252e14ef..79377a13a 100644
> > > > > > --- a/src/device.h
> > > > > > +++ b/src/device.h
> > > > > > @@ -141,6 +141,7 @@ void device_set_wake_support(struct btd_dev=
ice *device, bool wake_support);
> > > > > >  void device_set_wake_override(struct btd_device *device, bool =
wake_override);
> > > > > >  void device_set_wake_allowed(struct btd_device *device, bool w=
ake_allowed,
> > > > > >                              guint32 id);
> > > > > > +bool device_get_wake_override(struct btd_device *device);
> > > > > >  void device_set_refresh_discovery(struct btd_device *dev, bool=
 refresh);
> > > > > >
> > > > > >  typedef void (*disconnect_watch) (struct btd_device *device, g=
boolean removal,
> > > > > > --
> > > > > > 2.42.0.rc1.204.g551eb34607-goog
> > > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Luiz Augusto von Dentz
> > >
> > >
> > >
> > > --
> > > Luiz Augusto von Dentz
> >
> >
> >
> > --
> > Luiz Augusto von Dentz



--=20
Luiz Augusto von Dentz
