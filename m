Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF763B695D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 28 Jun 2021 21:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237168AbhF1T6o (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 28 Jun 2021 15:58:44 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:36053 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237160AbhF1T6o (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 28 Jun 2021 15:58:44 -0400
Received: (Authenticated sender: hadess@hadess.net)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id E1984100002;
        Mon, 28 Jun 2021 19:56:16 +0000 (UTC)
Message-ID: <c06e5bf272de638997ab352c71c9bdc836cb17e9.camel@hadess.net>
Subject: Re: [PATCH BlueZ] doc/agent-api: Add AuthenticationFailed method
From:   Bastien Nocera <hadess@hadess.net>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Date:   Mon, 28 Jun 2021 21:56:16 +0200
In-Reply-To: <CABBYNZKaWn_6FEX8YOmDX5bDo6pe5yERDs1X+=76yH4X3sH0hw@mail.gmail.com>
References: <20210623184355.3685859-1-luiz.dentz@gmail.com>
         <363a48e3df83590ad4f53383830ca447c71939d7.camel@hadess.net>
         <CABBYNZKaWn_6FEX8YOmDX5bDo6pe5yERDs1X+=76yH4X3sH0hw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.2 (3.40.2-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Mon, 2021-06-28 at 10:32 -0700, Luiz Augusto von Dentz wrote:
> Hi Bastien,
> 
> On Mon, Jun 28, 2021 at 7:59 AM Bastien Nocera <hadess@hadess.net>
> wrote:
> > 
> > On Wed, 2021-06-23 at 11:43 -0700, Luiz Augusto von Dentz wrote:
> > > From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> > > 
> > > This introduces AuthenticationFailed method which is used to
> > > indicate
> > > when there was an authentication failure with a remote device
> > > which is
> > > recommended by the core spec:
> > > 
> > > BLUETOOTH CORE SPECIFICATION Version 5.2 | Vol 3, Part C page
> > > 1314:
> > >  '5.2.2.3 Simple Pairing after authentication failure
> > >  When the link key is stored, subsequent connections to the same
> > > device
> > >  will use authentication but this may fail if the remote device
> > > has
> > >  deleted the link key. Table 5.2 defines what shall be done
> > > depending
> > >  on the type of the link key and whether bonding was performed or
> > > not.'
> > > 
> > > So following Table 5.2 recommendation the AuthenticationFailed
> > > method
> > > would be called when authentication fails with a bonded device.
> > > ---
> > >  doc/agent-api.txt | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/doc/agent-api.txt b/doc/agent-api.txt
> > > index 0d9347cab..91d752b0a 100644
> > > --- a/doc/agent-api.txt
> > > +++ b/doc/agent-api.txt
> > > @@ -183,3 +183,8 @@ Methods             void Release()
> > > 
> > >                         This method gets called to indicate that
> > > the
> > > agent
> > >                         request failed before a reply was
> > > returned.
> > > +
> > > +               void AuthenticationFailed(object device, byte
> > > status)
> > > +
> > > +                       This method indicates that there was an
> > > authentication
> > > +                       failure with a remote device.
> > 
> > Is there a way that we could have some persistent storage for when
> > the
> > last authentication error happened?
> > 
> > This would allow showing a /!\ icon in the device list even though
> > we
> > don't have an agent running in the session, just when the settings
> > are
> > open, in GNOME.
> 
> I guess you are suggesting introducing a property to the device
> object
> e.g. AuthenticationStatus or something like that, that way one can
> figure out if the device needs repairing or not.

That would work pretty well, yes.

>  Alternatively we
> could just remove the device, after a few attempts, if there is no
> agent of the agent don't implement the new method.

This is very much a dark pattern. I can expect to get bug reports about
devices disappearing from the known devices list on the computer when
it's actually the device losing its link keys for example.

I wouldn't recommend doing this at all, or by default.

> 
> > This would also allow the settings to get this information in the
> > first
> > place, otherwise we'd need to have some side-channel to funnel that
> > information from the "desktop-wide" agent to the settings agent.
> > 
> > I've made the upstream bug[1] public now, can you reference it in
> > the
> > commit message?
> 
> Sure.
> 
> > Cheers
> > 
> > [1]: https://gitlab.gnome.org/GNOME/gnome-bluetooth/-/issues/91
> > 
> 
> 


