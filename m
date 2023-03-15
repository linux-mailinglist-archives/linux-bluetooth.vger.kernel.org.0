Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 604D76BBCAD
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 Mar 2023 19:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbjCOStc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 Mar 2023 14:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232262AbjCOStb (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 Mar 2023 14:49:31 -0400
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D85381FD9
        for <linux-bluetooth@vger.kernel.org>; Wed, 15 Mar 2023 11:49:06 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 4D2372406B7
        for <linux-bluetooth@vger.kernel.org>; Wed, 15 Mar 2023 19:49:05 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4PcKDc4zfcz9rxV;
        Wed, 15 Mar 2023 19:49:04 +0100 (CET)
Message-ID: <54ad88223b5af198d9bee0ef582458a6df379c10.camel@iki.fi>
Subject: Re: [PATCH BlueZ 1/2] transport: add CIG/CIS/PHY properties, don't
 show unset QoS properties
From:   Pauli Virtanen <pav@iki.fi>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
Date:   Wed, 15 Mar 2023 18:49:04 +0000
In-Reply-To: <CABBYNZJeJkR18gAdy9bLW0aCkj9t3eAQ_Vpvz7whnjeaeY+2cw@mail.gmail.com>
References: <e856ad3174024bb61113217cb889005a0bf0ad1c.1678902782.git.pav@iki.fi>
         <CABBYNZJeJkR18gAdy9bLW0aCkj9t3eAQ_Vpvz7whnjeaeY+2cw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NEUTRAL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

ke, 2023-03-15 kello 11:19 -0700, Luiz Augusto von Dentz kirjoitti:
> Hi Pauli,
> 
> On Wed, Mar 15, 2023 at 10:54 AM Pauli Virtanen <pav@iki.fi> wrote:
> > 
> > Add CIG, CIS, and PHY properties to BAP transport.  The other QoS
> > properties are there, and these may also be useful to clients, e.g.  to
> > manage CIG/CIS allocation as client.
> > 
> > Hide transport QoS properties when they are not configured.
> > ---
> >  profiles/audio/transport.c | 67 ++++++++++++++++++++++++++++++++++----
> >  1 file changed, 61 insertions(+), 6 deletions(-)
> > 
> > diff --git a/profiles/audio/transport.c b/profiles/audio/transport.c
> > index 457590746..53bf13175 100644
> > --- a/profiles/audio/transport.c
> > +++ b/profiles/audio/transport.c
> > @@ -811,6 +811,38 @@ static const GDBusPropertyTable a2dp_properties[] = {
> >         { }
> >  };
> > 
> > +static gboolean qos_exists(const GDBusPropertyTable *property, void *data)
> > +{
> > +       struct media_transport *transport = data;
> > +       struct bap_transport *bap = transport->data;
> > +
> > +       return bap->qos.phy != 0x00;
> > +}
> > +
> > +static gboolean get_cig(const GDBusPropertyTable *property,
> > +                                       DBusMessageIter *iter, void *data)
> > +{
> > +       struct media_transport *transport = data;
> > +       struct bap_transport *bap = transport->data;
> > +
> > +       dbus_message_iter_append_basic(iter, DBUS_TYPE_BYTE,
> > +                                                       &bap->qos.cig_id);
> > +
> > +       return TRUE;
> > +}
> > +
> > +static gboolean get_cis(const GDBusPropertyTable *property,
> > +                                       DBusMessageIter *iter, void *data)
> > +{
> > +       struct media_transport *transport = data;
> > +       struct bap_transport *bap = transport->data;
> > +
> > +       dbus_message_iter_append_basic(iter, DBUS_TYPE_BYTE,
> > +                                                       &bap->qos.cis_id);
> > +
> > +       return TRUE;
> > +}
> > +
> >  static gboolean get_interval(const GDBusPropertyTable *property,
> >                                         DBusMessageIter *iter, void *data)
> >  {
> > @@ -835,6 +867,17 @@ static gboolean get_framing(const GDBusPropertyTable *property,
> >         return TRUE;
> >  }
> > 
> > +static gboolean get_phy(const GDBusPropertyTable *property,
> > +                                       DBusMessageIter *iter, void *data)
> > +{
> > +       struct media_transport *transport = data;
> > +       struct bap_transport *bap = transport->data;
> > +
> > +       dbus_message_iter_append_basic(iter, DBUS_TYPE_BYTE, &bap->qos.phy);
> > +
> > +       return TRUE;
> > +}
> > +
> >  static gboolean get_sdu(const GDBusPropertyTable *property,
> >                                         DBusMessageIter *iter, void *data)
> >  {
> > @@ -962,12 +1005,15 @@ static const GDBusPropertyTable bap_properties[] = {
> >         { "Codec", "y", get_codec },
> >         { "Configuration", "ay", get_configuration },
> >         { "State", "s", get_state },
> > -       { "Interval", "u", get_interval },
> > -       { "Framing", "b", get_framing },
> > -       { "SDU", "q", get_sdu },
> > -       { "Retransmissions", "y", get_retransmissions },
> > -       { "Latency", "q", get_latency },
> > -       { "Delay", "u", get_delay },
> > +       { "CIG", "y", get_cig, NULL, qos_exists },
> > +       { "CIS", "y", get_cis, NULL, qos_exists },
> > +       { "Interval", "u", get_interval, NULL, qos_exists },
> > +       { "Framing", "b", get_framing, NULL, qos_exists },
> > +       { "PHY", "y", get_phy, NULL, qos_exists },
> > +       { "SDU", "q", get_sdu, NULL, qos_exists },
> > +       { "Retransmissions", "y", get_retransmissions, NULL, qos_exists },
> > +       { "Latency", "q", get_latency, NULL, qos_exists },
> > +       { "Delay", "u", get_delay, NULL, qos_exists },
> >         { "Endpoint", "o", get_endpoint, NULL, endpoint_exists },
> >         { "Location", "u", get_location },
> >         { "Metadata", "ay", get_metadata },
> > @@ -1191,12 +1237,21 @@ static void bap_update_qos(const struct media_transport *transport)
> > 
> >         bap->qos = *qos;
> > 
> > +       g_dbus_emit_property_changed(btd_get_dbus_connection(),
> > +                       transport->path, MEDIA_TRANSPORT_INTERFACE,
> > +                       "CIG");
> > +       g_dbus_emit_property_changed(btd_get_dbus_connection(),
> > +                       transport->path, MEDIA_TRANSPORT_INTERFACE,
> > +                       "CIS");
> >         g_dbus_emit_property_changed(btd_get_dbus_connection(),
> >                         transport->path, MEDIA_TRANSPORT_INTERFACE,
> >                         "Interval");
> >         g_dbus_emit_property_changed(btd_get_dbus_connection(),
> >                         transport->path, MEDIA_TRANSPORT_INTERFACE,
> >                         "Framing");
> > +       g_dbus_emit_property_changed(btd_get_dbus_connection(),
> > +                       transport->path, MEDIA_TRANSPORT_INTERFACE,
> > +                       "PHY");
> >         g_dbus_emit_property_changed(btd_get_dbus_connection(),
> >                         transport->path, MEDIA_TRANSPORT_INTERFACE,
> >                         "SDU");
> > --
> > 2.39.2
> 
> I'm fine adding these but you could also have used BT_ISO_QOS
> socketopt to read it directly from the socket in case you want to use
> it on pipewire.

Yes, we can do that once we have the fd.

But if client wants to do CIG+CIS allocation in its SelectProperties,
it needs to know already reserved CIG+CIS. Acquiring the fd moves ASEs
out from qos state, which is not wanted for this.

Also, no Acquire call will return until all CIS in the same CIG have
been connected. To acquire the right transports (only those in the same
CIG), we need to know CIGs of all transports before starting to acquire
any. So we don't have any fds at that point.

Managing that probably should be responsibility of BlueZ, it could
connect all CIS in the same CIG when one of the transports is acquired.
Or, try address it in kernel but maybe that has more constraints.

But I think these properties can be added regardless of the above,
given that they have some uses also otherwise.

-- 
Pauli Virtanen
