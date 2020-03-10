Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEFE0180B8D
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Mar 2020 23:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgCJW3m (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 10 Mar 2020 18:29:42 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35532 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgCJW3m (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 10 Mar 2020 18:29:42 -0400
Received: by mail-ot1-f65.google.com with SMTP id k26so7604759otr.2
        for <linux-bluetooth@vger.kernel.org>; Tue, 10 Mar 2020 15:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XejOvauJ9IU9KT5jPA+2U9DhC1ziZ+kVzeu+yxfALq0=;
        b=tN63+Q7HXZ4e+DFePUaunmkj6kfn6vjefhOuiZe9BTDors0PV+xZA9HiKMhM6Zq3RN
         UKAy6xHouX2jDCJNSM8T7MbXARY8IrgxYfrS/KkFTGd5IieY/xKuIxzPvHsrw1ZaLt1+
         1GjpcQGCOorrMAM48nMLcRF9U4OQaMR4splAS0dGwjJWJSc6o+mGqTf9Q68FWS+45676
         5v3w/0Odh29dCvO73c/vHoR2+FpLpgXj8QYxCZkSKxivfszfQkUw8G0oVRSK7SY356TP
         LgZNvcA8+OHqw3pRwshP4sPfKGZjiVDbPDkoy0oAbnIIT411ziNv44O3l8vtT60wsrKk
         uhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XejOvauJ9IU9KT5jPA+2U9DhC1ziZ+kVzeu+yxfALq0=;
        b=gpy0DIZ36miWc69Zp/Sygab3oiiTQbS5t6hx8QmjmXa7sN7yGA15bEWuxvIseb0yJs
         E6AsXWL3wIcU7ByegRf7SoMO7HdR4triT0IzrqCL5/Ssy7XM1zYkoIm2fL349r56raea
         bBc1B3+t4QI8VoflIKl2yAKxoXsDkYa7o73dUs0Yr1VN23acwUUn5uCloygVNoVvROj+
         AZIXG9CmE9xoy/NKq+/jQ+FK0r6MtvU9O3YdFyyiwlit221i/D5mAeTYXk6z5vWD38cE
         TznQWL2LNN81bd8onXu32Z/bci9IiDdFr7sXUHEwLEEEblk/CsKq1TDkPzkBfqa3zYKH
         9tPg==
X-Gm-Message-State: ANhLgQ0ZI9zCg1atWfqzNDdijxOowOLpBddaIKhsdUTik5Gk+t8vR+Y+
        PPLxlGOyXwuRpVI7Xf/m5IFLoK7GDvGfXBkivFM=
X-Google-Smtp-Source: ADFU+vt5sirN9Xp4MbyZHwRA+1RKL5jGk+KjnvkdlayL3H0GniUKY6aiPgUeICsTJPAsOP5mpE8lOrImQQU6XPGaQQs=
X-Received: by 2002:a9d:53cc:: with SMTP id i12mr14221965oth.11.1583879380361;
 Tue, 10 Mar 2020 15:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200310173649.32722-1-luiz.dentz@gmail.com> <CALWDO_U+J1mCf1TzeWM=tSvy-NCsxnyoMeHppFsLKkaaYTiwug@mail.gmail.com>
 <CABBYNZ+6NDnuErRSiUkVacOViCBz1Bieda_KYD_0c3VrveER-A@mail.gmail.com>
 <CALWDO_Ws7=aEuhUU7GiGJ1=x4WREO8K1V=D4iGOABo0_ik9eRA@mail.gmail.com>
 <CABBYNZ+pbPswfY4AGpvL8XQL3JVPPi9srO5qt-8KbKzMDi+W9g@mail.gmail.com>
 <CALWDO_UBgHxtaO8U8kLpAdXaL7B1HMXVhbGANKf3Fnk9G9Hwcw@mail.gmail.com>
 <CABBYNZ+H6Tv--z-u9Lr=M_XJ1RUXrRS6nwqxkSpjKpSPMSzK5w@mail.gmail.com> <CALWDO_W1G9H5YbBG0v4s94NxN5Jh=mJ2ZJZMhEuvUVSYwt-h9g@mail.gmail.com>
In-Reply-To: <CALWDO_W1G9H5YbBG0v4s94NxN5Jh=mJ2ZJZMhEuvUVSYwt-h9g@mail.gmail.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Tue, 10 Mar 2020 15:29:28 -0700
Message-ID: <CABBYNZLewocbWMyJCqNYP+7RtbBXirGUFbCxF9ckscHURHcrSA@mail.gmail.com>
Subject: Re: [PATCH BlueZ] input: hog: Attempt to set security level if not bonded
To:     Alain Michaud <alainmichaud@google.com>
Cc:     BlueZ <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

On Tue, Mar 10, 2020 at 2:07 PM Alain Michaud <alainmichaud@google.com> wro=
te:
>
> Hi Luiz
>
> On Tue, Mar 10, 2020 at 4:39 PM Luiz Augusto von Dentz <luiz.dentz@gmail.=
com> wrote:
>>
>> Hi Alain,
>>
>> On Tue, Mar 10, 2020 at 11:53 AM Alain Michaud <alainmichaud@google.com>=
 wrote:
>> >
>> > Hi Luiz,
>> >
>> > On Tue, Mar 10, 2020 at 2:46 PM Luiz Augusto von Dentz
>> > <luiz.dentz@gmail.com> wrote:
>> > >
>> > > Hi Alain,
>> > >
>> > > On Tue, Mar 10, 2020 at 11:37 AM Alain Michaud <alainmichaud@google.=
com> wrote:
>> > > >
>> > > > Hi Luiz,
>> > > >
>> > > > On Tue, Mar 10, 2020 at 2:27 PM Luiz Augusto von Dentz
>> > > > <luiz.dentz@gmail.com> wrote:
>> > > > >
>> > > > > Hi Alain,
>> > > > >
>> > > > > On Tue, Mar 10, 2020 at 11:04 AM Alain Michaud <alainmichaud@goo=
gle.com> wrote:
>> > > > > >
>> > > > > > Hi Luiz,
>> > > > > >
>> > > > > > On Tue, Mar 10, 2020 at 1:36 PM Luiz Augusto von Dentz
>> > > > > > <luiz.dentz@gmail.com> wrote:
>> > > > > > >
>> > > > > > > From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
>> > > > > > >
>> > > > > > > This attempts to set the security if the device is not bonde=
d, the
>> > > > > > > kernel will block any communication on the ATT socket while =
bumping
>> > > > > > > the security and if that fails the device will be disconnect=
ed which
>> > > > > > > is better than having the device dangling around without bei=
ng able to
>> > > > > > > communicate with it until it is properly bonded.
>> > > > > > > ---
>> > > > > > >  profiles/input/hog.c | 13 +++++++++++--
>> > > > > > >  1 file changed, 11 insertions(+), 2 deletions(-)
>> > > > > > >
>> > > > > > > diff --git a/profiles/input/hog.c b/profiles/input/hog.c
>> > > > > > > index dfac68921..f0226ebbd 100644
>> > > > > > > --- a/profiles/input/hog.c
>> > > > > > > +++ b/profiles/input/hog.c
>> > > > > > > @@ -49,6 +49,8 @@
>> > > > > > >  #include "src/shared/util.h"
>> > > > > > >  #include "src/shared/uhid.h"
>> > > > > > >  #include "src/shared/queue.h"
>> > > > > > > +#include "src/shared/att.h"
>> > > > > > > +#include "src/shared/gatt-client.h"
>> > > > > > >  #include "src/plugin.h"
>> > > > > > >
>> > > > > > >  #include "suspend.h"
>> > > > > > > @@ -187,8 +189,15 @@ static int hog_accept(struct btd_servic=
e *service)
>> > > > > > >         }
>> > > > > > >
>> > > > > > >         /* HOGP 1.0 Section 6.1 requires bonding */
>> > > > > > > -       if (!device_is_bonded(device, btd_device_get_bdaddr_=
type(device)))
>> > > > > > > -               return -ECONNREFUSED;
>> > > > > > > +       if (!device_is_bonded(device, btd_device_get_bdaddr_=
type(device))) {
>> > > > > > > +               struct bt_gatt_client *client;
>> > > > > > > +
>> > > > > > > +               client =3D btd_device_get_gatt_client(device=
);
>> > > > > > > +               if (!bt_gatt_client_set_security(client,
>> > > > > > > +                                               BT_ATT_SECUR=
ITY_MEDIUM)) {
>> > > > > > > +                       return -ECONNREFUSED;
>> > > > > > > +               }
>> > > > > > > +       }
>> > > > > > I wonder if this is really necessary.  For example, this may c=
ause a
>> > > > > > device the user has not deliberately bonded to suddenly expose=
 a HOG
>> > > > > > Service which will trigger the user to pair (most users are kn=
own to
>> > > > > > blindly accept the pairing).  I believe the previous posture i=
s more
>> > > > > > secure by having the user deliberately pair HID devices as opp=
osed to
>> > > > > > on demand.
>> > > > >
>> > > > > There are dedicated APIs to connect specific profiles, so if
>> > > > > hog_accept is reached it means the user/application does want to
>> > > > > connect HoG and in that case it should trigger bonding, so this =
only
>> > > > > automate the process, like Ive commented for legacy HID we alrea=
dy
>> > > > > attempt to bump the security in a similar way. Having the user
>> > > > > deliberately pair may cause breakage since in most cases the GAT=
T
>> > > > > services do that on demand, in fact HoG is possibly the only exc=
eption
>> > > > > to that since it appear to mandate encryption at connection leve=
l
>> > > > > rather than on attribute level, so if the user had a peripheral =
that
>> > > > > used to not require bonding it will suddenly stop working but if=
 we do
>> > > > > have this change it would possible still work after the pairing
>> > > > > procedure is complete.
>> > > > The outgoing contract where the user somehow asked for the profile=
 to
>> > > > be connected and would result in pairing, I'm ok with.  However, t=
his
>> > > > being in the accept path, it doesn't seem to always be client side
>> > > > initiated, so that still seems like a concern to me.
>> > >
>> > > Since this is a profile so we are always acting as GATT client here,
>> > > so it is either initiated by the client when setting up a new
>> > > peripheral or it has been previously setup with Add Device and is
>> > > marked to auto connect, the later is exactly the problem I described
>> > > that there could be existing peripheral not requiring bonding that
>> > > suddenly stop working.
>> > My understanding is that the HOG service can get added to any other
>> > device through a service change notification or other means, so I
>> > don't think it is a safe assumption that this code will only execute
>> > if a user explicitly requested it.
>>
>> I would assume the users would expect that this would trigger pairing
>> procedure since silently ignoring the change would make this go
>> completely unnoticed.
>
> In this case it may be a device impersonating a device you were just comm=
unicating with without bonding, manages to connect and expose an HOG Servic=
e and all of the suddent requests a pairing confirmation.  Data suggests us=
ers pay little attention to these sorts of notification and tend to blindly=
 accept them leading them to a compromised state.  HOGP is unique in the se=
nse that the consequences are higher since it can lead to executing code in=
 the user's context by injecting keystrokes.

Sure but this is true regardless of doing pairing automatically or
requiring the user to pair it manually, or you are suggesting this is
safer because it would have the go over the setting to start the
pairing? Im afraid not all user interface would react the same in this
regard,  or at all,also at this state even if the user pair the device
it would have to reconnect before it start working again since the
driver would not be probed again.

>>
>>
>> > You are correct that the change may cause a device to stop working if
>> > it was using HOGP without bonding, but this would also be a non
>> > compliant device and one that compromises the system's security.  I'm
>> > ok if we make this a configuration in case you believe the
>> > compatibility with these sorts of scenarios must be maintained.
>>
>> This gets a bit tricky since the HOGP mandates security but HIDS does no=
t:
>>
>> Security Permissions of =E2=80=9CNone=E2=80=9D means that this service d=
oes not impose
>> any requirements.
>>
>> So my understanding is that a peripheral implementing HIDS does _not_
>> require bonding and to make matters more confusing none of the
>> attributes requires security etiher which is perhaps the very reason
>> HOGP mandates bonding, also afaik peripherals are not mandate to
>> initiate pairing procedures so it looks like peripherals can in fact
>> not require bonding and still be compliant.
>
>
> The peripheral yes, but HOGP would not so I'd assert if the device is req=
uired to work without bonding, it likely didn't pass the profile qualificat=
ion.

It would have pass it alright, its the PTS side that would exercise
this requirement of HOGP not the peripheral, the peripheral just have
to respond to the pairing procedure but it may never inititate it by
itself. Like I said none of HIDS attributes require any security and
the TS don't seem to even test authentication errors as it only
mentions something like:

If the IUT requires a bonding procedure then perform a bonding procedure.

Take for example zephyr hids example:

https://github.com/zephyrproject-rtos/zephyr/blob/master/samples/bluetooth/=
peripheral_hids/src/hog.c

It never checks for bonding nor it requires any security, so if I attempt:

#bluetoothctl> connect

HoG no longer connects.

> As stated before,  it seems acceptable to me if BlueZ would want a more c=
ompatible posture here, I would however like to request that a configuratio=
n be available so that HOGP can simply reject as the original patch did.

Well in that case we would have to implement reprobing logic so that
if the device gets paired hog_accept should be called once again, imo
triggering bonding seems a better alternative in the sort term until
we verify all use cases are attended.

>>
>>
>> > >
>> > > > >
>> > > > > >
>> > > > > > >
>> > > > > > >         /* TODO: Replace GAttrib with bt_gatt_client */
>> > > > > > >         bt_hog_attach(dev->hog, attrib);
>> > > > > > > --
>> > > > > > > 2.21.1
>> > > > > > >
>> > > > >
>> > > > >
>> > > > >
>> > > > > --
>> > > > > Luiz Augusto von Dentz
>> > >
>> > >
>> > >
>> > > --
>> > > Luiz Augusto von Dentz
>>
>>
>>
>> --
>> Luiz Augusto von Dentz



--=20
Luiz Augusto von Dentz
