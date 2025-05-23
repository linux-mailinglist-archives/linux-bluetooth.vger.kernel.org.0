Return-Path: <linux-bluetooth+bounces-12532-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D137AC2131
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 May 2025 12:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6657BA24A32
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 May 2025 10:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BDF227EA7;
	Fri, 23 May 2025 10:34:13 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from alt2.a-painless.mh.aa.net.uk (alt2.a-painless.mh.aa.net.uk [81.187.30.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0C7189919
	for <linux-bluetooth@vger.kernel.org>; Fri, 23 May 2025 10:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.187.30.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747996453; cv=none; b=hp08FdoABZCDV0Q8UOp3x45Cjhy7bod8qh8qA3DE+PNG4JJi0oA39uyCxuyBrUGoWrnwya0fWeKagPyRixGVV4MytLm58HtdAl/QYgBwdDQf2oiW8/gjgPd59DeewDlEC5mtXTL/QnumdjlkIBOqWrqc/iL3ZHxnuc/ZFOFevpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747996453; c=relaxed/simple;
	bh=1ev01/LLEnIbQC6U+gj8swXpDcOsVQ6qw6CPxLD/Mzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C1gJYFrbvi8nwD3YawZ4wN9t7xEhYBwwMj0rl86sX5wPNYYqS/94YFjm7NdpO2KYU5v4ZIywKajzzQEQsx52eTVd21/f+9bPPAa7cMGGlPgJFpN2P3z4cWkjrCvYgl4g4zsbfBNqahfdfHjWAfz6Gs5itcVuwPDueX7gAwzqYpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pileofstuff.org; spf=pass smtp.mailfrom=pileofstuff.org; arc=none smtp.client-ip=81.187.30.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pileofstuff.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pileofstuff.org
Received: from 5.5.b.7.3.b.f.b.f.e.2.7.1.c.8.c.0.5.8.0.9.1.8.0.0.b.8.0.1.0.0.2.ip6.arpa ([2001:8b0:819:850:c8c1:72ef:bfb3:7b55] helo=andrews-2024-laptop.sayers)
	by painless-a.thn.aa.net.uk with esmtp (Exim 4.96)
	(envelope-from <kernel.org@pileofstuff.org>)
	id 1uIPj6-003EUr-15;
	Fri, 23 May 2025 11:34:08 +0100
Date: Fri, 23 May 2025 11:33:44 +0100
From: Andrew Sayers <kernel.org@pileofstuff.org>
To: =?iso-8859-1?Q?Fr=E9d=E9ric?= Danis <frederic.danis@collabora.com>
Cc: luiz.dentz@gmail.com, pav@iki.fi, linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH BlueZ v6 1/3] obexd: Unregister profiles when the user is
 inactive
Message-ID: <aDBPCM8f0dpkJ7ob@andrews-2024-laptop.sayers>
References: <20250430131648.1291354-1-kernel.org@pileofstuff.org>
 <20250430131648.1291354-2-kernel.org@pileofstuff.org>
 <333ad76e-0aba-4f93-b141-8e69fb47535f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <333ad76e-0aba-4f93-b141-8e69fb47535f@collabora.com>

On Thu, May 22, 2025 at 04:55:22PM +0200, Fr�d�ric Danis wrote:
> Hi Andrew,
> 
> On 30/04/2025 15:14, Andrew Sayers wrote:
> 
> > Obexd is usually run as a user service, and can exhibit surprising
> > behaviour if two users are logged in at the same time.
> > 
> > Unregister profiles when the user is detected to be off-seat.
> > 
> > It may be impossible to detect whether a user is on-seat in some cases.
> > For example, a version of obexd compiled with systemd support might be
> > run outside of a systemd environment.  Warn and leave services
> > registered if that happens.
> > 
> > Obexd can be run as a system service, in which case this check makes no
> > sense.  Disable this check when called with `--system-bus`.
> > 
> > Obexd can also be run by a user that does not have an active session.
> > For example, someone could use `ssh` to access the system.  There might
> > be a use case where someone needs Bluetooth access but can't log in with
> > a keyboard, or there might be a security issue with doing so.  This isn't
> > handled explicitly by this patch, but a future patch could add support
> > by calling `logind_set(FALSE)` in the same way as is currently done
> > with `--system-bus`.
> > 
> > Unregister profiles by closing private connections instead of sending
> > UnregisterProfile on the shared connection.  Pipewire has apparently
> > found the latter to cause long shutdown delays, because bluetoothd
> > may be shutting down and unable to handle this message.
> > 
> > Based in large part on the wireplumber code mentioned by Pauli Virtanen:
> > https://gitlab.freedesktop.org/pipewire/wireplumber/-/blob/master/modules/module-logind.c#L52
> > 
> > Other services are likely to need similar functionality,
> > so I have created a gist to demonstrate the basic technique:
> > https://gist.github.com/andrew-sayers/1c4a24f86a9a4c1b1e38d109f1bd1d1e
> > 
> > Suggested-by: Pauli Virtanen <pav@iki.fi>
> > Signed-off-by: Andrew Sayers <kernel.org@pileofstuff.org>
> 
> I have a problem to connect PBAP profile using obexctl, using upstream
> bluetoothd and obexd built on Ubuntu 24.04, the org.bluez.obex.PhonebookAccess1
> interface doesn't appear.
> 
> After bisecting I found that this commit cause this issue.

Hmm, my guess is that seat detection isn't working properly.
Could you try this gist?  You should get "Active: 1" when it starts,
"Active: 0" when you switch away from your current screen, and "Active: 1"
when you switch back.

https://gist.github.com/andrew-sayers/1c4a24f86a9a4c1b1e38d109f1bd1d1e

> 
> -- 
> Fr�d�ric Danis
> Senior Software Engineer
> 
> Collabora Ltd.
> Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, United Kingdom
> Registered in England & Wales, no. 5513718
> 
> 

