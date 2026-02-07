Return-Path: <linux-bluetooth+bounces-18854-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id al2eI2Jdh2kvXQQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18854-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sat, 07 Feb 2026 16:42:26 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D5510665C
	for <lists+linux-bluetooth@lfdr.de>; Sat, 07 Feb 2026 16:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F31C13004D82
	for <lists+linux-bluetooth@lfdr.de>; Sat,  7 Feb 2026 15:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EBA3314DA;
	Sat,  7 Feb 2026 15:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LP3smMve"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02962270ED2;
	Sat,  7 Feb 2026 15:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770478939; cv=none; b=G4+c5mnDjeBjiv/mT05kBpYnxdL6S3Gm2OE/zxA4+cZQ9nDVDet+rLKian9vqw/NOn8Wn6E+21f0EyjAPVAovTtV3C1TaDSBClfhzE5nfBtaX03QN9O9t8f+CdyzHYXPgznJFjEjIC6r473jHbz9MUU0MTjSYzvlXzqzjJ0B3Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770478939; c=relaxed/simple;
	bh=ri6f3vyHX+IIfBScLjMKkNIPOLVtFjJp3CZtLRqWUwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=US55jicYwRA82LitkmLBGagya/q152LmTiVkiD7m91ezxWPQyUL9Nfne3McWkqMIvgaNg/h0NNu/ccTLdmck8dBNjoLlzW/6TE1TXMQ6D6ke9soPicJesF0b7Sy3TVJ2N4s6oqSAAdZ/O5spjvSsWTiZv548c0pKbB7kMRhkU24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LP3smMve; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04EF3C116D0;
	Sat,  7 Feb 2026 15:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770478938;
	bh=ri6f3vyHX+IIfBScLjMKkNIPOLVtFjJp3CZtLRqWUwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LP3smMvekHtQ2R4dyIVJ1F5jTXKcu4MsOL2g/kimZSP5nHFBk6Y/pjARckNW9RaJU
	 rIjgCRGOB4hnpvEf6MxVfMOmfCmlz83dR/ifVOcEO8l7oICRt5RgESJQgJ3FVN42WF
	 08U/VjEKxF2KmdAM28fo0YGWuRD8WnwKFj85XO+o=
Date: Sat, 7 Feb 2026 16:42:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jeongjun Park <aha310510@gmail.com>
Cc: stable@vger.kernel.org, tglx@linutronix.de, Julia.Lawall@inria.fr,
	akpm@linux-foundation.org, anna-maria@linutronix.de, arnd@arndb.de,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@roeck-us.net, luiz.dentz@gmail.com, marcel@holtmann.org,
	maz@kernel.org, peterz@infradead.org, rostedt@goodmis.org,
	sboyd@kernel.org, viresh.kumar@linaro.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 5.15.y 00/14] timers: Provide timer_shutdown[_sync]()
Message-ID: <2026020754-boxing-tug-de15@gregkh>
References: <20251128160539.358938-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128160539.358938-1-aha310510@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18854-lists,linux-bluetooth=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-bluetooth@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linutronix.de,inria.fr,linux-foundation.org,arndb.de,roeck-us.net,gmail.com,holtmann.org,kernel.org,infradead.org,goodmis.org,linaro.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 79D5510665C
X-Rspamd-Action: no action

On Sat, Nov 29, 2025 at 01:05:25AM +0900, Jeongjun Park wrote:
> The "timers: Provide timer_shutdown[_sync]()" patch series implemented a
> useful feature that addresses various bugs caused by attempts to rearm
> shutdown timers.
> 
> https://lore.kernel.org/all/20221123201306.823305113@linutronix.de/
> 
> However, this patch series was not fully backported to versions prior to
> 6.2, requiring separate patches for older kernels if these bugs were
> encountered.
> 
> The biggest problem with this is that even if these bugs were discovered
> and patched in the upstream kernel, if the maintainer or author didn't
> create a separate backport patch for versions prior to 6.2, the bugs would
> remain untouched in older kernels.
> 
> Therefore, to reduce the hassle of having to write a separate patch, we
> should backport the remaining unbackported commits from the
> "timers: Provide timer_shutdown[_sync]()" patch series to versions prior
> to 6.2.

You forgot to include commit 20739af07383 ("timers: Fix NULL function
pointer race in timer_shutdown_sync()") in this series.  I've now taken
them all, let's see how it goes!

thanks,

greg k-h

