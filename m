Return-Path: <linux-bluetooth+bounces-19329-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKO5DlZVnWk2OgQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19329-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 Feb 2026 08:37:58 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3C01831E2
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 Feb 2026 08:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54342304603C
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 Feb 2026 07:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA08364E81;
	Tue, 24 Feb 2026 07:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HL2GlmaL"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D99834AB17;
	Tue, 24 Feb 2026 07:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771918533; cv=none; b=YW6Q4GvhFoB6RzyTAAXlH5NP5Pu2BcYuzkk2MSn8Xn9CDi+cX8tclZod0MVBFwGehM4p3A7QQz2GI5QESt3cbZUhSJEATb6srQTQKIl5X2GlBzcJIDKzrg9fe/+s1DKdeIV++D1R2x56KOTB2VfFDpO7T2tU2EsElAduUh8QCvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771918533; c=relaxed/simple;
	bh=dhSwf3k1HrmWVHlZ3Q/Y2/I5lhf86qqq7D1+qtQ+b7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sah/16YmwBzmDzcQaZY54xYshh6bnOS1nPsyiNsmM5PwT3rhrpJTP3LVcz5SqNRlP2Dv0uUsNfBT+H6sSJZ44jsZ1KdJv+mKkhJrMt1rd0othanX1gu0iMkTutOiTx0qAIjiazCVX9KE0uqGx0n3s7KDSh0l0M1EtxP9gViMZGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HL2GlmaL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E445C116D0;
	Tue, 24 Feb 2026 07:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771918533;
	bh=dhSwf3k1HrmWVHlZ3Q/Y2/I5lhf86qqq7D1+qtQ+b7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HL2GlmaL52g+UexPBFB5+UeLxzZ/RlXW7EY/UtD8nysDHRkcsdFdhrkeg2OPxC13b
	 iSAhM5ndpcBBp1bY0QV1Fuvt3yIBrLA8v2Xq57SmPUbDxElSZ6nzJyZDZZsJ6wvKhr
	 /5KPDsTmr+Ybm9seywWMhWeYIjvz5yE0LIgFKa1hRruo1E0fHjfPlxwt/n8rjTsivn
	 TTcQ5iUyFxokdQd16g3fMjgYfm01CxIqSVeI90YQDGsF/2B88gJZMQbkLdL4Xt46ld
	 j6/FTBbrWIrloDBDLTBm2VeB5ZQqYWGALNOl3t7pf3ZwT7dQs8UMqGEbzgtban7b+N
	 8Kcyz/T9jtxTA==
Date: Tue, 24 Feb 2026 08:35:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, pierluigi.p@variscite.com, 
	Stefano Radaelli <stefano.r@variscite.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <david@lechnology.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: net: bluetooth: ti: Add property for
 enhanced SCO setup erratum
Message-ID: <20260224-ancient-herring-of-debate-c3b5f8@quoll>
References: <cover.1771847350.git.stefano.r@variscite.com>
 <db4c7eab9d0c2f71eb61baff240957596f099401.1771847350.git.stefano.r@variscite.com>
 <a5d4ebf0-9d99-494c-b46b-a6140610c9e2@kernel.org>
 <aZxE__Ybg5p2DaFM@Lord-Beerus.station>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aZxE__Ybg5p2DaFM@Lord-Beerus.station>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19329-lists,linux-bluetooth=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-bluetooth@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,variscite.com,holtmann.org,gmail.com,kernel.org,lechnology.com];
	TAGGED_RCPT(0.00)[linux-bluetooth,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,variscite.com:email]
X-Rspamd-Queue-Id: 8D3C01831E2
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 01:15:59PM +0100, Stefano Radaelli wrote:
> On Mon, Feb 23, 2026 at 01:03:27PM +0100, Krzysztof Kozlowski wrote:
> > On 23/02/2026 12:52, Stefano Radaelli wrote:
> > > From: Stefano Radaelli <stefano.r@variscite.com>
> > > 
> > > Some Bluetooth controller/firmware combinations advertise support for the
> > 
> > Which ones?
> > 
> > 
> > This looks a lot like controller issue, thus deducible from the
> > compatible. And even if particular firmware has problem, how do you see
> > changing static DTS on linux-firmware update?
> > 
> > Best regards,
> > Krzysztof
> 
> Hi Krzysztof,
> 
> thank you for your review!
> 
> We have observed this behaviour specifically on TI WL1831 modules.
> 
> When using the HCI Enhanced Setup Synchronous Connection command,
> SCO setup fails even though the controller reports the command as
> supported. The only working path for this controller is to fall back
> to the legacy HCI Setup Synchronous Connection (0x0028).
> The behaviour matches the scenario described in commit 05abad857277,
> which introduced HCI_QUIRK_BROKEN_ENHANCED_SETUP_SYNC_CONN for that
> reason.
> 
> We are using the latest firmware available from TI for the wl18xx
> family (from the official TI repository), so this is not related to
> an outdated firmware version.
> 
> The reason for proposing a DT property was to keep the workaround
> flexible and avoid forcing the quirk on all TI controllers handled
> by hci_ll without confirmation.

I did not propose to enable it on ALL TI controllers. I asked to deduce
it from given compatible, so to enable it on affected devices.

> 
> However, since this may be considered deducible from the compatible,
> would you prefer enabling
> HCI_QUIRK_BROKEN_ENHANCED_SETUP_SYNC_CONN automatically for
> "ti,wl1831-st" instead of using a DT property?

Yes

Best regards,
Krzysztof


