Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8F41788CC9
	for <lists+linux-bluetooth@lfdr.de>; Fri, 25 Aug 2023 17:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243287AbjHYPoT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 25 Aug 2023 11:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244063AbjHYPoN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 25 Aug 2023 11:44:13 -0400
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65BB81FC7
        for <linux-bluetooth@vger.kernel.org>; Fri, 25 Aug 2023 08:44:09 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout01.posteo.de (Postfix) with ESMTPS id C27EC240028
        for <linux-bluetooth@vger.kernel.org>; Fri, 25 Aug 2023 17:44:06 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4RXPPx5lygz9rxL;
        Fri, 25 Aug 2023 17:44:05 +0200 (CEST)
Message-ID: <bb06322befebb5ce0164bc4b3cc5ee94e487f3ab.camel@iki.fi>
Subject: Re: [BlueZ RFC] media-api: Make QoS a single property
From:   Pauli Virtanen <pav@iki.fi>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org
Cc:     Claudia Draghicescu <claudia.rosu@nxp.com>,
        iulia-tanasescu <iulia.tanasescu@nxp.com>,
        Silviu Florian Barbulescu <silviu.barbulescu@nxp.com>
Date:   Fri, 25 Aug 2023 15:44:05 +0000
In-Reply-To: <CABBYNZ+OcMjUsnJiehvnnAn-fZv+Tyy=ei3qWefJr4A3prSzbg@mail.gmail.com>
References: <20230824212153.11050-1-luiz.dentz@gmail.com>
         <CABBYNZ+OcMjUsnJiehvnnAn-fZv+Tyy=ei3qWefJr4A3prSzbg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NEUTRAL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

to, 2023-08-24 kello 14:28 -0700, Luiz Augusto von Dentz kirjoitti:
> Hi,
> 
> On Thu, Aug 24, 2023 at 2:21 PM Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
> > 
> > From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> > 
> > This moves QoS related propertis to a single dictionary.
> > ---
> >  doc/media-api.txt | 44 +++++++++++++++++++++-----------------------
> >  1 file changed, 21 insertions(+), 23 deletions(-)
> > 
> > diff --git a/doc/media-api.txt b/doc/media-api.txt
> > index 3a0ec38e244d..9f2482e73ac1 100644
> > --- a/doc/media-api.txt
> > +++ b/doc/media-api.txt
> > @@ -816,42 +816,40 @@ Properties        object Device [readonly]
> >                         Linked transport objects which the transport is
> >                         associated with.
> > 
> > -               byte CIG [ISO only, optional, experimental]
> > +               dict QoS [ISO only, optional, experimental]
> > 
> > -                       Indicates configured QoS CIG.
> >                         Only present when QoS is configured.
> > 
> > -               byte CIS [ISO only, optional, experimental]
> > +                       Possible values for Unicast:
> > 
> > -                       Indicates configured QoS CIS.
> > -                       Only present when QoS is configured.
> > +                       byte CIG
> > 
> > -               uint32 Interval [ISO only, optional, experimental]
> > +                               Indicates configured QoS CIG.
> > 
> > -                       Indicates configured QoS interval.
> > -                       Only present when QoS is configured.
> > +                       byte CIS
> > 
> > -               boolean Framing [ISO only, optional, experimental]
> > +                               Only present when QoS is configured.
> > 
> > -                       Indicates configured QoS framing.
> > -                       Only present when QoS is configured.
> > +                       uint32 Interval
> > 
> > -               byte PHY [ISO only, optional, experimental]
> > +                               Indicates configured QoS interval.
> > 
> > -                       Indicates configured QoS PHY.
> > -                       Only present when QoS is configured.
> > +                       boolean Framing

While we are breaking things, it would be useful to unify this API with
SelectProperties/SetConfiguration, where PHY is string "1M" or "2M" not
byte.

Can we make it byte everywhere? I think the enum ultimately comes from
Core spec, so not sure the string names are that useful.

> > 
> > -               uint16 SDU [ISO only, optional, experimental]
> > +                               Indicates configured QoS framing.
> > 
> > -                       Indicates configured QoS SDU.
> > -                       Only present when QoS is configured.
> > +                       byte PHY
> > 
> > -               byte Retransmissions [ISO only, optional, experimental]
> > +                               Indicates configured QoS PHY.
> > 
> > -                       Indicates configured QoS retransmissions.
> > -                       Only present when QoS is configured.
> > +                       uint16 SDU
> > 
> > -               uint16 Latency [ISO only, optional, experimental]
> > +                               Indicates configured QoS SDU.
> > 
> > -                       Indicates configured QoS latency.
> > -                       Only present when QoS is configured.
> > +                       byte Retransmissions
> > +
> > +                               Indicates configured QoS retransmissions.
> > +
> > +                       uint16 Latency
> > +
> > +                               Indicates configured QoS latency.
> > --
> > 2.41.0
> 
> Let me know if you have anything against doing these changes, this
> will break backward compatibility but since they are still marked as
> experimental we can still do these changes.

I think it's fine if Pipewire targets BlueZ master branch as long as
the feature is experimental.

-- 
Pauli Virtanen
