Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3FFE5FC029
	for <lists+linux-bluetooth@lfdr.de>; Wed, 12 Oct 2022 07:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiJLFml (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 12 Oct 2022 01:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiJLFmk (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 12 Oct 2022 01:42:40 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC0180F6B
        for <linux-bluetooth@vger.kernel.org>; Tue, 11 Oct 2022 22:42:39 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id u71so7160900pgd.2
        for <linux-bluetooth@vger.kernel.org>; Tue, 11 Oct 2022 22:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BDMpuNRYFLWr6LJJJfBkitOOUNnjHtr0ESlw6pD76Cs=;
        b=OENIjVtQZSiFaMgqDl6E36+evzUy2K/aBaOk+JzlGBigq9Yd1+9qSdyUuXjEBnCaUV
         /DnsrE/Xi8bAeUps8w8MGVHNa2Aw1m54wxr2mNf199iTW+CdTExeJPoFI4qQ/+YfSAv+
         pJrsxT8J+A/wEYaNsUU4PBsBw76PJrYNRUL/OT3Qda7nyaL/AXGngbuYhHiY40E+z6eT
         x3Xgya7iFopVdmqip0LY/FG90eje80LCYNarXAbKMT0NQUnV+fXeMDtcXdDGGZu54vtN
         SKxKqO83ZVxKd6W25kkmxnByMOf8X9JGJsqsGOl/qln0VTecupa9MeDzebp28sVlApWM
         yj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDMpuNRYFLWr6LJJJfBkitOOUNnjHtr0ESlw6pD76Cs=;
        b=A0+z6PHo+ww5s1q6c9TL2TuWFwVJuWbUCiNoM/d1zISnAOGIQ1umosk6w6IZCLF5l1
         FE5zs8b/Qr0eQVGOLjAAJ6EDzrLD89U9wncK0XuPk3qrvHHr87zCHBiqrrXQ3qF+xhqK
         Vn2t4cwBpDWjbLO28HYCBBCIs8Xc0j9Qnah31uHAWryvv+uswoAXIt+TDv+iSTGflOZq
         b3B5ZTeal/Vn+aDkZLY0v4wV5h9VGw0QoRy9/mIS3It6buPviXy7YALExAulgAEGrmMe
         Dp2UPVT+Ejxy966CMR8Xii3ujloUuA5W1Zow3k88mlM21k33SIresIl7wwGxxH5R5wsI
         3ACA==
X-Gm-Message-State: ACrzQf1zdL4FYBdicyZ60aU7P8W+2fIlTqANSItfBWXczhVCMs/sbyi4
        VezxDEZudF/g2h1u/N7p8Ws4aYxNnvYdSA6R/3YwmzMOYy0=
X-Google-Smtp-Source: AMsMyM493+o23mWxPTkm0otbDIXFUCDbpZpykUw/dWFbuy0JtODW/DH8yCAFJGUH1REP+bcQIp9CL94R609qsLkMj6w=
X-Received: by 2002:aa7:8687:0:b0:560:3299:a6c0 with SMTP id
 d7-20020aa78687000000b005603299a6c0mr28893585pfo.81.1665553358594; Tue, 11
 Oct 2022 22:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221011113116.70514-1-sathish.narasimman@intel.com> <CABBYNZJpebSE=hke9V6-FY4gc6AMS6_mVxiMnh7HhK7kHjDSGA@mail.gmail.com>
In-Reply-To: <CABBYNZJpebSE=hke9V6-FY4gc6AMS6_mVxiMnh7HhK7kHjDSGA@mail.gmail.com>
From:   Sathish Narasimman <nsathish41@gmail.com>
Date:   Wed, 12 Oct 2022 11:12:26 +0530
Message-ID: <CAOVXEJJCxMFwwTzN=uVSc9XsmqtjHtz8bD6bQVdLV=EUwyQ+uA@mail.gmail.com>
Subject: Re: [PATCH BlueZ v3 1/3] audio/transport: Adding volume callback to
 media transport
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     Sathish Narasimman <sathish.narasimman@intel.com>,
        linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz

On Wed, Oct 12, 2022 at 1:28 AM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Sathish,
>
> On Tue, Oct 11, 2022 at 4:38 AM Sathish Narasimman
> <sathish.narasimman@intel.com> wrote:
> >
> > Initialize set_volume and get_volume to media transport and update the
> > volume when media_transport_update_device_volume is called.
> > ---
> >  profiles/audio/transport.c | 126 +++++++++++++++++++++++++++++++++++--
> >  1 file changed, 120 insertions(+), 6 deletions(-)
> >
> > diff --git a/profiles/audio/transport.c b/profiles/audio/transport.c
> > index 41339da51e17..a1445cba7993 100644
> > --- a/profiles/audio/transport.c
> > +++ b/profiles/audio/transport.c
> > @@ -91,6 +91,7 @@ struct bap_transport {
> >         uint8_t                 rtn;
> >         uint16_t                latency;
> >         uint32_t                delay;
> > +       int8_t                  volume;
> >  };
> >
> >  struct media_transport {
> > @@ -116,6 +117,9 @@ struct media_transport {
> >                                                                 guint id);
> >         void                    (*set_state) (struct media_transport *transport,
> >                                                 transport_state_t state);
> > +       void                    (*set_volume) (struct media_transport *transp,
> > +                                               int8_t volume);
> > +       int8_t                  (*get_volume) (struct media_transport *transp);
> >         GDestroyNotify          destroy;
> >         void                    *data;
> >  };
> > @@ -769,6 +773,58 @@ error:
> >                                         "Invalid arguments in method call");
> >  }
> >
> > +static gboolean volume_bap_exists(const GDBusPropertyTable *property,
> > +                                       void *data)
> > +{
> > +       struct media_transport *transport = data;
> > +       struct bap_transport *bap = transport->data;
> > +
> > +       return bap->volume >= 0;
> > +}
> > +
> > +static gboolean get_bap_volume(const GDBusPropertyTable *property,
> > +                                       DBusMessageIter *iter, void *data)
> > +{
> > +       struct media_transport *transport = data;
> > +       struct bap_transport *bap = transport->data;
> > +       uint16_t volume = (uint16_t)bap->volume;
> > +
> > +       dbus_message_iter_append_basic(iter, DBUS_TYPE_UINT16, &volume);
> > +
> > +       return TRUE;
> > +}
> > +
> > +static void set_bap_volume(const GDBusPropertyTable *property,
> > +                          DBusMessageIter *iter, GDBusPendingPropertySet id,
> > +                          void *data)
> > +{
> > +       struct media_transport *transport = data;
> > +       struct bap_transport *bap = transport->data;
> > +       uint16_t arg;
> > +       int8_t volume;
> > +
> > +       if (dbus_message_iter_get_arg_type(iter) != DBUS_TYPE_UINT16)
> > +               goto error;
> > +
> > +       dbus_message_iter_get_basic(iter, &arg);
> > +       if (arg > INT8_MAX)
> > +               goto error;
> > +
> > +       g_dbus_pending_property_success(id);
> > +
> > +       volume = (int8_t)arg;
> > +       if (bap->volume == volume)
> > +               return;
> > +
> > +       /*TODO vcp_send_volume */
>
> What is this TODO item for? Can we complete it right now? Afaik we
> should be able to handle local changes and notify it to remote peers
> or that is not how VCP works?

The TODO part is for VCP Client. At present only VCP Server is implemented.
Whenever there is a change in volume locally we have to notify to the remote
peer in case of server Role(Volume renderer).

>
> > +       return;
> > +
> > +error:
> > +       g_dbus_pending_property_error(id, ERROR_INTERFACE ".InvalidArguments",
> > +                                       "Invalid arguments in method call");
> > +}
> > +
> > +
> >  static gboolean endpoint_exists(const GDBusPropertyTable *property, void *data)
> >  {
> >         struct media_transport *transport = data;
> > @@ -970,6 +1026,7 @@ static const GDBusPropertyTable bap_properties[] = {
> >         { "Retransmissions", "y", get_retransmissions },
> >         { "Latency", "q", get_latency },
> >         { "Delay", "u", get_delay },
> > +       { "Volume", "q", get_bap_volume, set_bap_volume, volume_bap_exists },
>
> Now that we have set_volume/get_volume as callbacks these could be
> changed to use them instead of having dedicated callback like abouve,
> something like:
>
> https://gist.github.com/Vudentz/19edcf96735567c1f7437a5e1dee7e04
>
will check and update
> >         { "Endpoint", "o", get_endpoint, NULL, endpoint_exists },
> >         { "Location", "u", get_location },
> >         { "Metadata", "ay", get_metadata },
> > @@ -1048,6 +1105,31 @@ static void source_state_changed(struct btd_service *service,
> >                 transport_update_playing(transport, FALSE);
> >  }
> >
> > +static int8_t get_volume_a2dp(struct media_transport *transport)
> > +{
> > +       struct a2dp_transport *a2dp = transport->data;
> > +
> > +       return a2dp->volume;
> > +}
> > +
> > +static void set_volume_a2dp(struct media_transport *transport, int8_t volume)
> > +{
> > +       struct a2dp_transport *a2dp = transport->data;
> > +
> > +       if (volume < 0)
> > +               return;
> > +
> > +       /* Check if volume really changed */
> > +       if (a2dp->volume == volume)
> > +               return;
> > +
> > +       a2dp->volume = volume;
> > +
> > +       g_dbus_emit_property_changed(btd_get_dbus_connection(),
> > +                                       transport->path,
> > +                                       MEDIA_TRANSPORT_INTERFACE, "Volume");
> > +}
> > +
> >  static int media_transport_init_source(struct media_transport *transport)
> >  {
> >         struct btd_service *service;
> > @@ -1061,6 +1143,8 @@ static int media_transport_init_source(struct media_transport *transport)
> >
> >         transport->resume = resume_a2dp;
> >         transport->suspend = suspend_a2dp;
> > +       transport->set_volume = set_volume_a2dp;
> > +       transport->get_volume = get_volume_a2dp;
> >         transport->cancel = cancel_a2dp;
> >         transport->data = a2dp;
> >         transport->destroy = destroy_a2dp;
> > @@ -1387,6 +1471,31 @@ static void free_bap(void *data)
> >         free(bap);
> >  }
> >
> > +static void set_volume_bap(struct media_transport *transport, int8_t volume)
> > +{
> > +       struct bap_transport *bap = transport->data;
> > +
> > +       if (volume < 0)
> > +               return;
> > +
> > +       /* Check if volume really changed */
> > +       if (bap->volume == volume)
> > +               return;
> > +
> > +       bap->volume = volume;
> > +
> > +       g_dbus_emit_property_changed(btd_get_dbus_connection(),
> > +                                       transport->path,
> > +                                       MEDIA_TRANSPORT_INTERFACE, "Volume");
> > +}
> > +
> > +static int8_t get_volume_bap(struct media_transport *transport)
> > +{
> > +       struct bap_transport *bap = transport->data;
> > +
> > +       return bap->volume;
> > +}
> > +
> >  static int media_transport_init_bap(struct media_transport *transport,
> >                                                         void *stream)
> >  {
> > @@ -1403,6 +1512,7 @@ static int media_transport_init_bap(struct media_transport *transport,
> >         bap->rtn = qos->rtn;
> >         bap->latency = qos->latency;
> >         bap->delay = qos->delay;
> > +       bap->volume = 127;
> >         bap->state_id = bt_bap_state_register(bt_bap_stream_get_session(stream),
> >                                                 bap_state_changed,
> >                                                 bap_connecting,
> > @@ -1413,6 +1523,8 @@ static int media_transport_init_bap(struct media_transport *transport,
> >         transport->suspend = suspend_bap;
> >         transport->cancel = cancel_bap;
> >         transport->set_state = set_state_bap;
> > +       transport->set_volume = set_volume_bap;
> > +       transport->get_volume = get_volume_bap;
> >         transport->destroy = free_bap;
> >
> >         return 0;
> > @@ -1537,12 +1649,13 @@ int8_t media_transport_get_device_volume(struct btd_device *dev)
> >         /* Attempt to locate the transport to get its volume */
> >         for (l = transports; l; l = l->next) {
> >                 struct media_transport *transport = l->data;
> > +
> >                 if (transport->device != dev)
> >                         continue;
> >
> > -               /* Volume is A2DP only */
> > -               if (media_endpoint_get_sep(transport->endpoint))
> > -                       return media_transport_get_volume(transport);
> > +               /* Get transport volume */
> > +               if (transport->get_volume)
> > +                       return transport->get_volume(transport);
> >         }
> >
> >         /* If transport volume doesn't exists use device_volume */
> > @@ -1560,12 +1673,13 @@ void media_transport_update_device_volume(struct btd_device *dev,
> >         /* Attempt to locate the transport to set its volume */
> >         for (l = transports; l; l = l->next) {
> >                 struct media_transport *transport = l->data;
> > +
> >                 if (transport->device != dev)
> >                         continue;
> >
> > -               /* Volume is A2DP only */
> > -               if (media_endpoint_get_sep(transport->endpoint)) {
> > -                       media_transport_update_volume(transport, volume);
> > +               /* Set transport volume */
> > +               if (transport->set_volume) {
> > +                       transport->set_volume(transport, volume);
> >                         return;
> >                 }
> >         }
> > --
> > 2.25.1
> >
>
>
> --
> Luiz Augusto von Dentz

Sathish N
