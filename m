Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6EA27043C
	for <lists+linux-bluetooth@lfdr.de>; Fri, 18 Sep 2020 20:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgIRSlU (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 18 Sep 2020 14:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgIRSlU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 18 Sep 2020 14:41:20 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C21C0613CF
        for <linux-bluetooth@vger.kernel.org>; Fri, 18 Sep 2020 11:41:20 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id n13so6976417edo.10
        for <linux-bluetooth@vger.kernel.org>; Fri, 18 Sep 2020 11:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wms5trIpKfVccABLrif0z9aki5fMPBGPNTttsMku0Gg=;
        b=oCgi+35e+SGXJpQtP0aktvxdT+7faA+kec80zRzmZGxqO7HKYHkf0V4Yg5xFlIva4/
         o+ork1MYbbbDtIpOHh5M4+3PrZWb8t0gjw65lZRQJ1HXnkEt7eQe4J57iISUOXUzeytv
         SVfY+4ptXwd6+OlascjkgvxtaJjhzupncoDW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wms5trIpKfVccABLrif0z9aki5fMPBGPNTttsMku0Gg=;
        b=ilDagKq/tyvzR7FzdgXQncIS3TVQaxAc/A0LyyAJhqNAe4L0r4Xm69Lz1QugljUXaT
         VRQjSQBck9e8vK9mJ7EGOzDA1lKpVj1ndPlFxRGpMCTFwS6qT0QWKN6xCO0rqUed4Mni
         qiX2/GVFmJ3QRvCyffgOsdg1ceiLFACCWD6eMmHoo762/5bmpRxa+aS9Jd1xacXk2iOr
         uxakfgUavNabYG0sOxWFBatNj9gOWfNfOE2eoJ3vLDqsojvNvli78P69YXbzwXMH/MaO
         V6J0Z1ccK6HXIEz8DSy0OBnu/Kzybl1/ms7kzY4v0XXIT5izfFyPD1xJv/znx3XHVc2P
         bh9Q==
X-Gm-Message-State: AOAM533jLjnVAIZgFmgHSWGtjXvL8R/UR0qY6lvki7V0GdA8DuC+KC0O
        6DuUDR/LD2Ksd1An0AC+oWN/QYKVu8lOjg==
X-Google-Smtp-Source: ABdhPJwW1saM/kskq2Xepr+thaxo/Rl9iyBJ4ZaHMQ6nhrOf7KnhzoGWZtxx+/1DnkWTvsC55orgYw==
X-Received: by 2002:a05:6402:1151:: with SMTP id g17mr40854885edw.227.1600454478017;
        Fri, 18 Sep 2020 11:41:18 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id qu11sm2827229ejb.15.2020.09.18.11.41.17
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2020 11:41:17 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id m6so6618790wrn.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 18 Sep 2020 11:41:17 -0700 (PDT)
X-Received: by 2002:a5d:468f:: with SMTP id u15mr38859518wrq.336.1600454476464;
 Fri, 18 Sep 2020 11:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200917221034.154218-1-sonnysasaka@chromium.org> <CABBYNZ+d=dtHAtHOi7es_dGx4B7WnrE1dHnd_W1UvXRH0DVSog@mail.gmail.com>
In-Reply-To: <CABBYNZ+d=dtHAtHOi7es_dGx4B7WnrE1dHnd_W1UvXRH0DVSog@mail.gmail.com>
From:   Sonny Sasaka <sonnysasaka@chromium.org>
Date:   Fri, 18 Sep 2020 11:41:05 -0700
X-Gmail-Original-Message-ID: <CAO271mny2RkCtb8Cs6uEcLNHhSSVcFoCa24gMATubJXPRCmB2Q@mail.gmail.com>
Message-ID: <CAO271mny2RkCtb8Cs6uEcLNHhSSVcFoCa24gMATubJXPRCmB2Q@mail.gmail.com>
Subject: Re: [PATCH BlueZ v2] a2dp: Keep track of ref ownership of a2dp_setup
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Alain Michaud <alainm@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

On Fri, Sep 18, 2020 at 10:43 AM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Sonny,
>
> On Thu, Sep 17, 2020 at 3:13 PM Sonny Sasaka <sonnysasaka@chromium.org> wrote:
> >
> > Currently transport_cb and abort_cfm make assumption that they have an
> > a2dp_setup reference held as a result of open_ind invocation. In the
> > field this is not always true, for example when the peer device opens an
> > L2CAP channel for AVDTP transport channel without sending AVDTP_OPEN
> > request through the AVDTP signaling channel first. Although in this case
> > the peer device does not behave correctly, we should protect this
> > possible crash from happening by making sure that transport_cb and
> > abort_cfm are really holding a reference of a2dp_setup object before
> > trying to unref them.
> >
> > After grabbing a reference, open_ind stores the pointer in
> > stream->user_data. If this field is set, that means there is a pending
> > AVDTP_OPEN command and it needs to be unref-fed later once and only
> > once: when the transport channel is created (transport_cb) or when the
> > AVDTP_OPEN command is aborted (abort_cfm). If this field is not set,
> > nothing should unref it. This enforces that the reference counting is
> > correct regardless of the behavior of the peer device.
> >
> > A sample crash stack trace from Chrome OS:
> > * thread #1, stop reason = signal SIGSEGV
> >   * frame #0: 0x0c64f0e8 bluetoothd`queue_remove_all at queue.c:351
> >     frame #1: 0x0c64f086 bluetoothd`queue_destroy at queue.c:73
> >     frame #2: 0x0c6022b0 bluetoothd`setup_unref at a2dp.c:222
> >     frame #3: 0x0c604942 bluetoothd`transport_cb at a2dp.c:2229
> >     frame #4: 0x0c61e35c bluetoothd`accept_cb at btio.c:203
> >     frame #5: 0xf679523c libglib-2.0.so.0`g_main_context_dispatch at gmain.c:3182
> >     frame #6: 0xf67954aa libglib-2.0.so.0`g_main_context_iterate at gmain.c:3920
> >     frame #7: 0xf679569a libglib-2.0.so.0`g_main_loop_run at gmain.c:4116
> >     frame #8: 0x0c65a5a0 bluetoothd`mainloop_run at mainloop-glib.c:79
> >     frame #9: 0x0c65a7ea bluetoothd`mainloop_run_with_signal at mainloop-notify.c:201
> >     frame #10: 0x0c6477ec bluetoothd`main at main.c:772
> >     frame #11: 0xf65bc0a2 libc.so.6`__libc_start_main at libc-start.c:308
> >
> > Reviewed-by: Alain Michaud <alainm@chromium.org>
> >
> > ---
> >  profiles/audio/a2dp.c  | 34 ++++++++++++++++++++++++++--------
> >  profiles/audio/avdtp.c | 17 +++++++++++++++++
> >  profiles/audio/avdtp.h |  5 +++++
> >  3 files changed, 48 insertions(+), 8 deletions(-)
> >
> > diff --git a/profiles/audio/a2dp.c b/profiles/audio/a2dp.c
> > index 2feea66c0..26147f96e 100644
> > --- a/profiles/audio/a2dp.c
> > +++ b/profiles/audio/a2dp.c
> > @@ -915,6 +915,11 @@ static void update_last_used(struct a2dp_channel *chan, struct a2dp_sep *lsep,
> >                                         avdtp_get_seid(rsep));
> >  }
> >
> > +static void destroy_setup(void *data)
> > +{
> > +       setup_unref(data);
> > +}
> > +
> >  static gboolean open_ind(struct avdtp *session, struct avdtp_local_sep *sep,
> >                                 struct avdtp_stream *stream, uint8_t *err,
> >                                 void *user_data)
> > @@ -927,10 +932,21 @@ static gboolean open_ind(struct avdtp *session, struct avdtp_local_sep *sep,
> >         else
> >                 DBG("Source %p: Open_Ind", sep);
> >
> > +       if (avdtp_stream_get_user_data(stream)) {
> > +               warn("setup already exists");
> > +               return FALSE;
> > +       }
>
> I've sent a patch fixing the code when Open is sent multiple times, we
> were actually overwriting pending_open and its timer, I think it might
> be the source of these crashes, not an unbalanced reference of the
> setup. Also it is possible that the headsets doing this sort of
> operation would like us to start the L2CAP connection procedure so we
> could perhaps attempt to connect it after a sorter timer, but it might
> be hard to check how well it would work without having such a headset
> to test if it really does help.

Thanks for the patch. Although your patch "Fix not checking if stream
is already set as pending open" solves an issue, this is not the issue
that we are experiencing in the field. We don't have a device that can
reproduce the crashes, but we got evidence from custom log messages
that the crashes are caused by "the peer device opens an L2CAP channel
for AVDTP transport channel without sending AVDTP_OPEN request through
the AVDTP signaling channel first", as I described in the commit
message of this patch. So, I believe we still need to fix that. We
could solve that in avdtp by not allowing that peer behavior, but what
this patch is fixing is the generic reference counting bug by having a
proper reference ownership proof such that if we follow this
principles, we can guarantee correct ref counting and avoid even other
crashes due to unhandled unexpected peer behavior.

>
> >         setup = a2dp_setup_get(session);
> >         if (!setup)
> >                 return FALSE;
> >
> > +       /*
> > +        * Use avdtp_stream's user_data to keep the reference ownership of the
> > +        * setup object. This ensures that this reference will be unref-ed
> > +        * exactly once.
> > +        */
> > +       avdtp_stream_set_user_data(stream, setup, destroy_setup);
> >         setup->stream = stream;
> >
> >         if (!err && setup->chan)
> > @@ -1285,14 +1301,13 @@ static void abort_cfm(struct avdtp *session, struct avdtp_local_sep *sep,
> >                         void *user_data)
> >  {
> >         struct a2dp_sep *a2dp_sep = user_data;
> > -       struct a2dp_setup *setup;
> > +       struct a2dp_setup *setup = avdtp_stream_get_user_data(stream);
> >
> >         if (a2dp_sep->type == AVDTP_SEP_TYPE_SINK)
> >                 DBG("Sink %p: Abort_Cfm", sep);
> >         else
> >                 DBG("Source %p: Abort_Cfm", sep);
> >
> > -       setup = find_setup_by_session(session);
> >         if (!setup)
> >                 return;
> >
> > @@ -1302,6 +1317,7 @@ static void abort_cfm(struct avdtp *session, struct avdtp_local_sep *sep,
> >         }
> >
> >         setup_unref(setup);
> > +       avdtp_stream_set_user_data(stream, NULL, NULL);
> >  }
> >
> >  static gboolean reconf_ind(struct avdtp *session, struct avdtp_local_sep *sep,
> > @@ -2216,11 +2232,12 @@ fail:
> >
> >  static void transport_cb(GIOChannel *io, GError *err, gpointer user_data)
> >  {
> > -       struct a2dp_setup *setup = user_data;
> > +       struct avdtp_stream *stream = user_data;
> > +       struct a2dp_setup *setup = avdtp_stream_get_user_data(stream);
> >         uint16_t omtu, imtu;
> >
> > -       if (!g_slist_find(setups, setup)) {
> > -               warn("bt_io_accept: setup %p no longer valid", setup);
> > +       if (!setup) {
> > +               warn("transport_cb: setup does not exist");
> >                 g_io_channel_shutdown(io, TRUE, NULL);
> >                 return;
> >         }
> > @@ -2238,8 +2255,7 @@ static void transport_cb(GIOChannel *io, GError *err, gpointer user_data)
> >                 goto drop;
> >         }
> >
> > -       if (!avdtp_stream_set_transport(setup->stream,
> > -                                       g_io_channel_unix_get_fd(io),
> > +       if (!avdtp_stream_set_transport(stream, g_io_channel_unix_get_fd(io),
> >                                         imtu, omtu))
> >                 goto drop;
> >
> > @@ -2249,6 +2265,7 @@ static void transport_cb(GIOChannel *io, GError *err, gpointer user_data)
> >         setup->io = NULL;
> >
> >         setup_unref(setup);
> > +       avdtp_stream_set_user_data(stream, NULL, NULL);
> >
> >         return;
> >
> > @@ -2297,7 +2314,8 @@ static void confirm_cb(GIOChannel *io, gpointer data)
> >                         goto drop;
> >                 }
> >
> > -               if (!bt_io_accept(io, transport_cb, setup, NULL, &err)) {
> > +               if (!bt_io_accept(io, transport_cb, setup->stream, NULL,
> > +                                 &err)) {
> >                         error("bt_io_accept: %s", err->message);
> >                         g_error_free(err);
> >                         goto drop;
> > diff --git a/profiles/audio/avdtp.c b/profiles/audio/avdtp.c
> > index 782268c08..76d06f47c 100644
> > --- a/profiles/audio/avdtp.c
> > +++ b/profiles/audio/avdtp.c
> > @@ -366,6 +366,8 @@ struct avdtp_stream {
> >         GSList *caps;
> >         GSList *callbacks;
> >         struct avdtp_service_capability *codec;
> > +       void *user_data;
> > +       avdtp_stream_user_data_destroy_t user_data_destroy;
> >         guint io_id;            /* Transport GSource ID */
> >         guint timer;            /* Waiting for other side to close or open
> >                                  * the transport channel */
> > @@ -727,6 +729,9 @@ static void stream_free(void *data)
> >         g_slist_free_full(stream->callbacks, g_free);
> >         g_slist_free_full(stream->caps, g_free);
> >
> > +       if (stream->user_data && stream->user_data_destroy)
> > +               stream->user_data_destroy(stream->user_data);
> > +
> >         g_free(stream);
> >  }
> >
> > @@ -3147,6 +3152,18 @@ struct avdtp_remote_sep *avdtp_stream_get_remote_sep(
> >         return NULL;
> >  }
> >
> > +void avdtp_stream_set_user_data(struct avdtp_stream *stream, void *data,
> > +                               avdtp_stream_user_data_destroy_t destroy)
> > +{
> > +       stream->user_data = data;
> > +       stream->user_data_destroy = destroy;
> > +}
> > +
> > +void *avdtp_stream_get_user_data(struct avdtp_stream *stream)
> > +{
> > +       return stream->user_data;
> > +}
> > +
> >  gboolean avdtp_stream_set_transport(struct avdtp_stream *stream, int fd,
> >                                                 size_t imtu, size_t omtu)
> >  {
> > diff --git a/profiles/audio/avdtp.h b/profiles/audio/avdtp.h
> > index 011fea89e..247e9df75 100644
> > --- a/profiles/audio/avdtp.h
> > +++ b/profiles/audio/avdtp.h
> > @@ -133,6 +133,8 @@ typedef void (*avdtp_set_configuration_cb) (struct avdtp *session,
> >                                                 struct avdtp_stream *stream,
> >                                                 struct avdtp_error *err);
> >
> > +typedef void (*avdtp_stream_user_data_destroy_t)(void *data);
> > +
> >  /* Callbacks for when a reply is received to a command that we sent */
> >  struct avdtp_sep_cfm {
> >         void (*set_configuration) (struct avdtp *session,
> > @@ -260,6 +262,9 @@ gboolean avdtp_stream_has_capabilities(struct avdtp_stream *stream,
> >                                         GSList *caps);
> >  struct avdtp_remote_sep *avdtp_stream_get_remote_sep(
> >                                                 struct avdtp_stream *stream);
> > +void avdtp_stream_set_user_data(struct avdtp_stream *stream, void *data,
> > +                               avdtp_stream_user_data_destroy_t destroy);
> > +void *avdtp_stream_get_user_data(struct avdtp_stream *stream);
> >
> >  unsigned int avdtp_add_state_cb(struct btd_device *dev,
> >                                 avdtp_session_state_cb cb, void *user_data);
> > --
> > 2.26.2
> >
>
>
> --
> Luiz Augusto von Dentz
