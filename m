Return-Path: <linux-bluetooth+bounces-858-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 388488230B0
	for <lists+linux-bluetooth@lfdr.de>; Wed,  3 Jan 2024 16:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2E341F24822
	for <lists+linux-bluetooth@lfdr.de>; Wed,  3 Jan 2024 15:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AA41B26E;
	Wed,  3 Jan 2024 15:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkXSXorN"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655A11B267
	for <linux-bluetooth@vger.kernel.org>; Wed,  3 Jan 2024 15:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ccea11b6bbso5446991fa.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 03 Jan 2024 07:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704296414; x=1704901214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbIkeJHGkkXVu+FzC/s25r1tjnav2jYDvWv1eJoS8fY=;
        b=CkXSXorNRhj4KW0nCdrJWUG9HMg20qRp/NIUhWy8OIAB3WWp9Mdpxi+akKvzb86f0j
         OEeTZk/4nODmqq+yrsu2pE+FFmbSPnIydFBJSunq8x/yoIHVx6f40qbaVgyDmI9x3tV8
         c3rfzihzKqQ/11IvALsZOjCqPTxuB9HOJ/fWn7sS/chNKQddivPBwWSj1vY238cR0/p7
         PfDH3WEc1jbk8GPE5yOJ+hKdacna8+Uwdpbkvre6HAjilwKWlnhsiSYu2UVWvBFQwg+N
         kmdROXQ4N96JM/rZ2fxMyj4xULVXpHvZBIjqvuWngeo0ThnZ9TKo9n0kBNcSOX2w5ZvQ
         vN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704296414; x=1704901214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbIkeJHGkkXVu+FzC/s25r1tjnav2jYDvWv1eJoS8fY=;
        b=g1X2pMen9KgkeOXFllgdTtHLSVX4iPvFs3zquq9BvJ48tPcUoRjNqGDBtMpYINHOGp
         zF99PPIACs/wBK3bIGnqWEUONvZAOA3LnP0Rfn7C6p7BZ/Y2OXQB6YXsdHmyDgU4ZhhJ
         A3rODgtMng9Wy63qOIry4Hbfvx+MM0jaRgTvGomS9udbmm68IAN/qSUV8ZbZpj0Hxdrq
         kWOdNm4zyvjwmyNCcQnSIf5DNmEHPNCw70kf/Cf+38CvjGlpxAEuuZ9o3JXgS0NIoUjc
         ONxxy8hb05WfbrNLqW2q1E/s12iepqdYYdRLLFC8gnSBsLtdghI4HucLNkzVKi9qYpBH
         HQ6A==
X-Gm-Message-State: AOJu0YyQIcpU9NqPrNQGsp+5lukK7h+sxkl+/akfcT5Nbz3xn4NWCqbH
	SinbDhQLLfQQwhgo9knRYUbWjL4ot/YD9kKQ3bw=
X-Google-Smtp-Source: AGHT+IHrO6oRn9YVmJsbuiRmXXzmI+wjZVJ+3oSvOwpsusu/WZu5SDR6N6Vl8qRlSK5wLIPSM2yMITz9gDUT1gw+8cc=
X-Received: by 2002:a05:651c:b06:b0:2cd:178e:ad88 with SMTP id
 b6-20020a05651c0b0600b002cd178ead88mr749427ljr.15.1704296414141; Wed, 03 Jan
 2024 07:40:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240103143904.77146-1-xiaokeqinhealth@126.com> <CABBYNZLo9CVZsjvzjKsGKFyhOkrWoyWYL8bQoSfvTDf=PAQ-iw@mail.gmail.com>
In-Reply-To: <CABBYNZLo9CVZsjvzjKsGKFyhOkrWoyWYL8bQoSfvTDf=PAQ-iw@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 3 Jan 2024 10:40:00 -0500
Message-ID: <CABBYNZL0Szd768KCSAYXQ4q-4+a-eapYsBwJUxUw-byFzF76jw@mail.gmail.com>
Subject: Re: [PATCH BlueZ v3 1/2] avdtp: fix incorrect transaction label in
 setconf phase
To: Xiao Yao <xiaokeqinhealth@126.com>
Cc: linux-bluetooth@vger.kernel.org, Xiao Yao <xiaoyao@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 3, 2024 at 10:38=E2=80=AFAM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi,
>
> On Wed, Jan 3, 2024 at 9:40=E2=80=AFAM Xiao Yao <xiaokeqinhealth@126.com>=
 wrote:
> >
> > From: Xiao Yao <xiaoyao@rock-chips.com>
> >
> > BLUETOOTH SPECIFICATION Page 61 of 140
> > Audio/Video Distribution Transport Protocol Specification (V13)
> > 8.4.6 Message integrity verification at receiver side
> >
> > - The receiver of an AVDTP signaling message shall not interpret corrup=
ted
> > messages. Those messages are discarded and no signaling message is retu=
rned
> > to the sender if no error code is applicable. Possible corrupted messag=
es
> > are:
> >
> >   * Response messages where the transaction label cannot match a previo=
us
> >     command sent to the remote device
> >
> > Consider the following scenario:
> > btmon log:
> > ... ...
> > AVDTP: Discover (0x01) Command (0x00) type 0x00 label 5 nosp 0
> > AVDTP: Discover (0x01) Response Accept (0x02) type 0x00 label 5 nosp 0
> > AVDTP: Get All Capabilities (0x0c) Command (0x00) type 0x00 label 6 nos=
p 0
> > AVDTP: Get All Capabilities (0x0c) Resp Accept (0x02) type 0 label 6 no=
sp 0
> > AVDTP: Get All Capabilities (0x0c) Command (0x00) type 0x00 label 7 nos=
p 0
> > AVDTP: Get All Capabilities (0x0c) Resp Accept (0x02) type 0 label 7 no=
sp 0
> >
> > < AVDTP: Set Configuration (0x03) Command (0x00) type 0x00 label 8 nosp=
 0
> > //Currently, a 'set configuration' message has been received from the
> > //sender, which contains a transaction label valued at 8. This message
> > //was then relayed to A2DP backend(PulseAudio/PipeWire) using the dbus
> > //interface.
> >   set_configuration()(media.c)
> >     dbus_message_new_method_call(..., "SetConfiguration", ...);
> >     g_dbus_send_message_with_reply(btd_get_dbus_connection(), ...);
> >     dbus_pending_call_set_notify(request->call, endpoint_reply, ...);
> >     ...
> >
> > > AVDTP: Discover (0x01) Command (0x00) type 0x00 label 0 nosp 0
> > //At this time, the A2DP reverse discovery issued an A2DP discover comm=
and.
> > < AVDTP: Discover (0x01) Response Accept (0x02) type 0x00 label 0 nosp =
0
> > //After receiving the discover reply, the session->in.transaction is
> > //changed to 0
> >
> > > AVDTP: Set Configuration (0x03) Resp Accept (0x02) type 0 label 0 nos=
p 0
> > //The audio backend reply the dbus message
> >   endpoint_reply (media.c)
> >     setconf_cb (avdtp.c)
> >       //Here avdtp_send sends an incorrect transaction value, causing
> >       //the sender to discard the message. (The correct transaction
> >       //value is 8)
> >       avdtp_send(session, session->in.transaction, AVDTP_MSG_TYPE_ACCEP=
T,
> >                  AVDTP_SET_CONFIGURATION, NULL, 0)
> >
> > AVDTP: Delay Report (0x0d) Command (0x00) type 0x00 label 1 nosp 0
> > AVDTP: Delay Report (0x0d) Response Accept (0x02) type 0x00 label 1 nos=
p 0
> > AVDTP: Get All Capabilities (0x0c) Command (0x00) type 0x00 label 2 nos=
p 0
> > AVDTP: Get All Capabilities (0x0c) Resp Accept (0x02) type 0 label 2 no=
sp 0
> > ... ...
> >
> > Therefore, a async_transaction that requires asynchronous return is
> > recorded to prevent it from being incorrectly modified.

Btw, we can probably come up with a test for this on unit/test-avdtp
to ensure we cover it.

> >
> > Signed-off-by: Xiao Yao <xiaoyao@rock-chips.com>
> > ---
> > v1 -> v2: Fixed "session->in.transaction" logic err.
> > v2 -> v3: Fixed some compile warnings
> > ---
> >  profiles/audio/avdtp.c | 19 ++++++++++++++-----
> >  1 file changed, 14 insertions(+), 5 deletions(-)
> >
> > diff --git a/profiles/audio/avdtp.c b/profiles/audio/avdtp.c
> > index 10ef380d4..386c7f67c 100644
> > --- a/profiles/audio/avdtp.c
> > +++ b/profiles/audio/avdtp.c
> > @@ -286,6 +286,7 @@ struct in_buf {
> >         gboolean active;
> >         int no_of_packets;
> >         uint8_t transaction;
> > +       uint8_t async_transaction;
>
> Didn't I already explain it already that we are not supposed to have 2
> outstanding transactions?
>
> >         uint8_t message_type;
> >         uint8_t signal_id;
> >         uint8_t buf[1024];
> > @@ -1462,15 +1463,16 @@ static void setconf_cb(struct avdtp *session, s=
truct avdtp_stream *stream,
> >         if (err !=3D NULL) {
> >                 rej.error =3D AVDTP_UNSUPPORTED_CONFIGURATION;
> >                 rej.category =3D err->err.error_code;
> > -               avdtp_send(session, session->in.transaction,
> > -                               AVDTP_MSG_TYPE_REJECT, AVDTP_SET_CONFIG=
URATION,
> > -                               &rej, sizeof(rej));
> > +               avdtp_send(session, session->in.async_transaction,
> > +                          AVDTP_MSG_TYPE_REJECT, AVDTP_SET_CONFIGURATI=
ON,
> > +                          &rej, sizeof(rej));
> >                 stream_free(stream);
> >                 return;
> >         }
> >
> > -       if (!avdtp_send(session, session->in.transaction, AVDTP_MSG_TYP=
E_ACCEPT,
> > -                                       AVDTP_SET_CONFIGURATION, NULL, =
0)) {
> > +       if (!avdtp_send(session, session->in.async_transaction,
> > +                       AVDTP_MSG_TYPE_ACCEPT,
> > +                       AVDTP_SET_CONFIGURATION, NULL, 0)) {
> >                 stream_free(stream);
> >                 return;
> >         }
> > @@ -1569,6 +1571,13 @@ static gboolean avdtp_setconf_cmd(struct avdtp *=
session, uint8_t transaction,
> >                 session->version =3D 0x0103;
> >
> >         if (sep->ind && sep->ind->set_configuration) {
> > +               /* The setconfig configuration stage is asynchronous;
> > +                * high CPU load or other factors can delay dbus messag=
e
> > +                * responses, potentially altering the transaction valu=
e.
> > +                * It's essential to record the received transaction va=
lue
> > +                * for use in the final accept command.
> > +                */
> > +               session->in.async_transaction =3D transaction;
> >                 if (!sep->ind->set_configuration(session, sep, stream,
> >                                                         stream->caps,
> >                                                         setconf_cb,
> >
> > base-commit: 7ad5669402c9acff8e4cc808edc12a41df36654e
> > --
> > 2.34.1
> >
> >
>
>
> --
> Luiz Augusto von Dentz



--=20
Luiz Augusto von Dentz

