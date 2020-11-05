Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4697C2A8888
	for <lists+linux-bluetooth@lfdr.de>; Thu,  5 Nov 2020 22:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732235AbgKEVKS (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 5 Nov 2020 16:10:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgKEVKS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 5 Nov 2020 16:10:18 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 111DEC0613CF
        for <linux-bluetooth@vger.kernel.org>; Thu,  5 Nov 2020 13:10:18 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id k3so4666752ejj.10
        for <linux-bluetooth@vger.kernel.org>; Thu, 05 Nov 2020 13:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c8LEGJMe/igkNiUkdt9CGUsmevTk0LQKGDSP5HCl3I0=;
        b=TG2XqK2CgLggiGBAjrQyPXJxd4yQrp5lfrPzf+WY1zMgmOB9A4oyercJ1Y6jE5p89b
         qSsVsXFAd8DoQmTQLbqj482Q7XLC8X7+DiNnlUeWhfPCbd84t64abwZRcMcfBo33h/o6
         SVVXwj3xJB4SgD2r0oKZvzJwDWPmBRLPyDhZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c8LEGJMe/igkNiUkdt9CGUsmevTk0LQKGDSP5HCl3I0=;
        b=LwchWSrRPmabPqCNNt1BiMhp4MJX4EqC6GGAYC7lJe8f6Lrxf1DQczsnTguIT/qXgl
         YbyBButB1h9MHD8VWHbXhjCDDkFGuxjya4SlmLEM8Y38POQurYyLZUmp4UPz9W8FtXaA
         mX3wF+jayWWZvAhk/+6idsbS2/Pj+mMnUNuJcVqpJBN5jvPo1NWE96ASMFtxDZfecoUZ
         0qi/YmEqBNTHsKgBgZKsRmyraYUpXBOoXl/r9Fy4eM+JQ0LvwxRYHq7zWes2iLCHxtj+
         sbqnjq2pohwGP4VBtJ6uOT3G3xzBHpK6gWhqxWdjX8CViONl73YkEmc1BrkFNezc6Ld2
         5J1w==
X-Gm-Message-State: AOAM532jYn50UEdcu0B1eTCFfaFN/6h5RETY3luMDDKzqEg8wNKhi3PQ
        oC9pctSugKqVXAE4hpOipS1FJeo6Z4/HHA==
X-Google-Smtp-Source: ABdhPJxvmbRqwUVwCux05eodVzwurY3/c/+SL8x9DpGzx0D7N+3Z8hTCSksrWd/HcWvvbqcW8LoJBw==
X-Received: by 2002:a17:906:7c4b:: with SMTP id g11mr4392246ejp.469.1604610615975;
        Thu, 05 Nov 2020 13:10:15 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id a12sm1073787edb.96.2020.11.05.13.10.15
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 13:10:15 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id c16so2965567wmd.2
        for <linux-bluetooth@vger.kernel.org>; Thu, 05 Nov 2020 13:10:15 -0800 (PST)
X-Received: by 2002:a7b:c309:: with SMTP id k9mr4466957wmj.125.1604610614445;
 Thu, 05 Nov 2020 13:10:14 -0800 (PST)
MIME-Version: 1.0
References: <20201105002412.37720-1-sonnysasaka@chromium.org>
 <CABBYNZ+=wukeRdRD9p=46NAeHhmSVSkAieJCya2UvMz-=zf3sg@mail.gmail.com>
 <CAO271m=Q50FX4W5+6LndarO6uWz-9QzzrWAurZF9gVwf=f6Hig@mail.gmail.com> <CABBYNZJLyhF8oAujNfFJ3R69T9PoUq5-P=GdtJkw2Z33ozF4Zw@mail.gmail.com>
In-Reply-To: <CABBYNZJLyhF8oAujNfFJ3R69T9PoUq5-P=GdtJkw2Z33ozF4Zw@mail.gmail.com>
From:   Sonny Sasaka <sonnysasaka@chromium.org>
Date:   Thu, 5 Nov 2020 13:10:03 -0800
X-Gmail-Original-Message-ID: <CAO271mnosJM7YQbYaPEeQ22xJNO=fUnF5dE_EAqfxWb_TP5fSg@mail.gmail.com>
Message-ID: <CAO271mnosJM7YQbYaPEeQ22xJNO=fUnF5dE_EAqfxWb_TP5fSg@mail.gmail.com>
Subject: Re: [PATCH BlueZ] gatt-client: Do not continue service discovery if disconnected
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Archie Pusaka <apusaka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

bt_gatt_client is not freed. It is expected that bt_gatt_client is
still alive at discovery_op_complete since the code clearly references
it. It is the gatt_db_attribute objects in client->pending_svcs that
are already freed.

On Thu, Nov 5, 2020 at 1:03 PM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Sonny,
>
> On Thu, Nov 5, 2020 at 11:20 AM Sonny Sasaka <sonnysasaka@chromium.org> wrote:
> >
> > Hi Luiz,
> >
> >
> > On Thu, Nov 5, 2020 at 10:46 AM Luiz Augusto von Dentz
> > <luiz.dentz@gmail.com> wrote:
> > >
> > > Hi Sonny,
> > >
> > > On Wed, Nov 4, 2020 at 10:01 PM Sonny Sasaka <sonnysasaka@chromium.org> wrote:
> > > >
> > > > If device is disconnected, discovery_complete_op should not continue
> > > > processing since this can lead to a crash because the GATT-related
> > > > objects may already be freed.
> > > >
> > > > Sample crash stack trace:
> > > > 0  gatt_db_service_get_handles (service=0x1751130, service=0x1751130, end_handle=0x7ffcd600806e, start_handle=0x7ffcd600806c) at src/shared/gatt-db.c:569
> > > > 1  gatt_db_attribute_get_service_data (attrib=<optimized out>, start_handle=0x7ffcd600806c, end_handle=0x7ffcd600806e, primary=0x0, uuid=0x0) at src/shared/gatt-db.c:1657
> > > > 2  0x00000000004983a8 in discovery_op_complete (op=op@entry=0x173b320, success=<optimized out>, err=err@entry=10 '\n') at src/shared/gatt-client.c:406
> > > > 3  0x000000000049a548 in discover_descs_cb (success=<optimized out>, att_ecode=<optimized out>, result=<optimized out>, user_data=0x173b320) at src/shared/gatt-client.c:915
> > > > 4  0x00000000004a1d87 in discovery_op_complete (op=0x1748450, success=<optimized out>, ecode=<optimized out>) at src/shared/gatt-helpers.c:615
> > > > 5  0x00000000004a2379 in discover_descs_cb (opcode=<optimized out>, pdu=0x174d551, length=<optimized out>, user_data=0x1748450) at src/shared/gatt-helpers.c:1465
> > > > 6  0x00000000004966db in handle_rsp (pdu_len=4, pdu=<optimized out>, opcode=<optimized out>, chan=0x17483c0) at src/shared/att.c:814
> > > > 7  can_read_data (io=<optimized out>, user_data=0x17483c0) at src/shared/att.c:1011
> > >
> > > Weird, are you still receiving data after the device is disconnected?
> > To be more precise, this happens if I do "remove device" from
> > bluetoothctl while it's still doing GATT discovery, i.e. connect and
> > quickly remove device. Also this is reproducible if the GATT.Cache
> > config is set to "yes". So, the "disconnection" may not be physical
> > but a consequence of the code path of the RemoveDevice API. I can
> > reproduce it almost 100% of the time with an LE Mouse (tried with MS
> > Mouse 3600 and Logitech M355).
> > >
> > > > 8  0x00000000004a0853 in watch_callback (channel=<optimized out>, cond=<optimized out>, user_data=<optimized out>) at src/shared/io-glib.c:157
> > > > 9  0x00007fb3f2d7fe87 in g_main_context_dispatch () from /usr/lib64/libglib-2.0.so.0
> > > > 10 0x00007fb3f2d80230 in ?? () from /usr/lib64/libglib-2.0.so.0
> > > > 11 0x00007fb3f2d80542 in g_main_loop_run () from /usr/lib64/libglib-2.0.so.0
> > > > 12 0x00000000004a0e25 in mainloop_run () at src/shared/mainloop-glib.c:66
> > > > 13 0x00000000004a11f2 in mainloop_run_with_signal (func=func@entry=0x43f200 <signal_callback>, user_data=user_data@entry=0x0) at src/shared/mainloop-notify.c:188
> > > > 14 0x000000000040c72e in main (argc=<optimized out>, argv=<optimized out>) at src/main.c:959
> > > >
> > > > Reviewed-By: Archie Pusaka <apusaka@chromium.org>
> > > >
> > > > ---
> > > >  src/device.c             |  3 +++
> > > >  src/shared/gatt-client.c | 20 ++++++++++++++++++++
> > > >  src/shared/gatt-client.h |  2 ++
> > > >  3 files changed, 25 insertions(+)
> > > >
> > > > diff --git a/src/device.c b/src/device.c
> > > > index a5ef46730..9dad746eb 100644
> > > > --- a/src/device.c
> > > > +++ b/src/device.c
> > > > @@ -586,6 +586,9 @@ static void gatt_client_cleanup(struct btd_device *device)
> > > >                 device->gatt_ready_id = 0;
> > > >         }
> > > >
> > > > +       /* Make sure that service discovery is stopped if any is in progress */
> > > > +       bt_gatt_client_reset_in_discovery(device->client);
> > >
> > > Does this means that other references will also get interrupted? That
> > > is something very weird here since when disconnected the bt_att
> > > instance should actually have informed the bt_gatt_client and the
> > > cleanup should had happened there.
> > What do you mean by "other references"? My guess is that
> > bt_gatt_client has done the cleanup, but discovery_op_complete still
> > tries to execute the whole code path which involves accessing the
> > already cleaned-up gatt_db_attribute objects.
>
> Here normally what should have happened is:
>
> bt_gatt_client_unref -> bt_gatt_client_free ->
> bt_gatt_client_cancel_all -> bt_gatt_request_unref ->
> discovery_op_unref -> discovery_op_free
>
> So there is something about this code path that is not really working
> as intended or perhaps bt_gatt_client_free is never really called? It
> would perhaps be worth trying to reproduce this with a a unit test.
>
> > >
> > > > +
> > > >         bt_gatt_client_unref(device->client);
> > > >         device->client = NULL;
> > > >  }
> > > > diff --git a/src/shared/gatt-client.c b/src/shared/gatt-client.c
> > > > index 8becf1c6c..2ba6efe9a 100644
> > > > --- a/src/shared/gatt-client.c
> > > > +++ b/src/shared/gatt-client.c
> > > > @@ -104,6 +104,9 @@ struct bt_gatt_client {
> > > >
> > > >         struct bt_gatt_request *discovery_req;
> > > >         unsigned int mtu_req_id;
> > > > +
> > > > +       /* Whether there is a service discovery operation ongoing */
> > > > +       bool in_discovery;
> > > >  };
> > > >
> > > >  struct request {
> > > > @@ -381,6 +384,12 @@ static void discovery_op_complete(struct discovery_op *op, bool success,
> > > >  {
> > > >         const struct queue_entry *svc;
> > > >
> > > > +       /* Service discovery may be reset due to disconnection */
> > > > +       if (!op->client->in_discovery)
> > > > +               return;
> > > > +
> > > > +       op->client->in_discovery = false;
> > > > +
> > > >         op->success = success;
> > > >
> > > >         /* Read database hash if discovery has been successful */
> > > > @@ -1857,6 +1866,9 @@ static void process_service_changed(struct bt_gatt_client *client,
> > > >  {
> > > >         struct discovery_op *op;
> > > >
> > > > +       if (client->in_discovery)
> > > > +               goto fail;
> > > > +
> > > >         op = discovery_op_create(client, start_handle, end_handle,
> > > >                                                 service_changed_complete,
> > > >                                                 service_changed_failure);
> > > > @@ -1869,6 +1881,7 @@ static void process_service_changed(struct bt_gatt_client *client,
> > > >                                                 discovery_op_ref(op),
> > > >                                                 discovery_op_unref);
> > > >         if (client->discovery_req) {
> > > > +               client->in_discovery = true;
> > > >                 client->in_svc_chngd = true;
> > > >                 return;
> > > >         }
> > > > @@ -2057,6 +2070,7 @@ static bool gatt_client_init(struct bt_gatt_client *client, uint16_t mtu)
> > > >                 return false;
> > > >         }
> > > >
> > > > +       client->in_discovery = true;
> > > >         client->in_init = true;
> > > >
> > > >         return true;
> > > > @@ -2080,6 +2094,7 @@ discover:
> > > >         }
> > > >
> > > >  done:
> > > > +       client->in_discovery = true;
> > > >         client->in_init = true;
> > > >         return true;
> > > >  }
> > > > @@ -3694,3 +3709,8 @@ int bt_gatt_client_get_security(struct bt_gatt_client *client)
> > > >
> > > >         return bt_att_get_security(client->att, NULL);
> > > >  }
> > > > +
> > > > +void bt_gatt_client_reset_in_discovery(struct bt_gatt_client *client)
> > > > +{
> > > > +       client->in_discovery = false;
> > > > +}
> > > > diff --git a/src/shared/gatt-client.h b/src/shared/gatt-client.h
> > > > index dc5102394..dcd8e5cf6 100644
> > > > --- a/src/shared/gatt-client.h
> > > > +++ b/src/shared/gatt-client.h
> > > > @@ -126,3 +126,5 @@ bool bt_gatt_client_unregister_notify(struct bt_gatt_client *client,
> > > >
> > > >  bool bt_gatt_client_set_security(struct bt_gatt_client *client, int level);
> > > >  int bt_gatt_client_get_security(struct bt_gatt_client *client);
> > > > +
> > > > +void bt_gatt_client_reset_in_discovery(struct bt_gatt_client *client);
> > > > --
> > > > 2.26.2
> > > >
> > >
> > >
> > > --
> > > Luiz Augusto von Dentz
>
>
>
> --
> Luiz Augusto von Dentz
