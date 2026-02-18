Return-Path: <linux-bluetooth+bounces-19157-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBmaN6T6lWknXwIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19157-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Feb 2026 18:45:08 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE38A158682
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Feb 2026 18:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 58CD93005AAA
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Feb 2026 17:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FCF248F73;
	Wed, 18 Feb 2026 17:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rjp.ie header.i=@rjp.ie header.b="ouzhoXEw"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B47346771
	for <linux-bluetooth@vger.kernel.org>; Wed, 18 Feb 2026 17:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771436705; cv=none; b=EoRdUkljXB2hVb/atZfif8IBZ5ZAO9AYm8vpwliU3Yr/KdeJ2HL4/+KwSYqEPo2RVMS+gs84dEm9GkVZFvISQ0dB4pTnIqKj0fESG6NmonoCmhYEXOvsWxsL6eCUrAOMK9qRzV8Bp+09mzOdZUPfFKi+1AUD1J+CflMF0Gc/5DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771436705; c=relaxed/simple;
	bh=7vaFhZrNm9QcC2MgavS9HKZnfik5aIl7Od15B1HQAFs=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=DiVc1LkGf525BFpdyKOWNT6kmdT8bUzLs9WMeRgJz+LZJrlwnoMPiNPAFGPMK0gy10K0aHdcHqgicB3iM5R+toRGLqlBCoAeKzZdu5+M+fOTQCbXYWX7WKg2e88k/NxmSvAqLO46chATvNZXO7eJnLNnKgiiuKVTt5nlTGlqFiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rjp.ie; spf=pass smtp.mailfrom=rjp.ie; dkim=pass (1024-bit key) header.d=rjp.ie header.i=@rjp.ie header.b=ouzhoXEw; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rjp.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rjp.ie
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rjp.ie; s=key1;
	t=1771436702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7vaFhZrNm9QcC2MgavS9HKZnfik5aIl7Od15B1HQAFs=;
	b=ouzhoXEwbc+vYoOCLWoEJ1gqOb6mmKUnqb3X5b/YC8DwWTurIlUuoBcQH22W8Q+qX9bF6F
	KTD1xdJikjBBAUoR4c97/CwASkAF8veEsvrhy3gDfauTfRin9z5vCnYVApgPqfHx4CPjAH
	ILOmC/SjwnLiAwW/tceMhsz7ITZvSZc=
Date: Wed, 18 Feb 2026 17:45:00 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ronan Pigott" <ronan@rjp.ie>
Message-ID: <defdb4fb77123ebe7abea7e8f225720e4e72e6c5@rjp.ie>
TLS-Required: No
Subject: Re: [PATCH BlueZ 2/2] shared/shell: gracefully recover from failed
 input initialization
To: "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
In-Reply-To: <CABBYNZJqjaDJmkEy0yvyqLXP6kFH-dVjnzcCVknAkpu39zspaA@mail.gmail.com>
References: <20260218024605.70890-1-ronan@rjp.ie>
 <20260218024605.70890-3-ronan@rjp.ie>
 <CABBYNZJqjaDJmkEy0yvyqLXP6kFH-dVjnzcCVknAkpu39zspaA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rjp.ie,quarantine];
	R_DKIM_ALLOW(-0.20)[rjp.ie:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-19157-lists,linux-bluetooth=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ronan@rjp.ie,linux-bluetooth@vger.kernel.org];
	DKIM_TRACE(0.00)[rjp.ie:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,rjp.ie:mid,rjp.ie:dkim]
X-Rspamd-Queue-Id: EE38A158682
X-Rspamd-Action: no action

February 18, 2026 at 7:58 AM, "Luiz Augusto von Dentz" <luiz.dentz@gmail.=
com> wrote:

> Yeah, the revert part doesn't really fly since
> e73bf582dae60356641a32fc27ae03d359ec4c47 does fixes a valid issue,
> that said we do have another proposal under discussion:
>=20
>=20https://patchwork.kernel.org/project/bluetooth/patch/20260217222954.4=
32676-1-larsch@belunktum.dk/

Hi Luiz,

I'm aware it fixes a valid issue. My hope with the patch is to fix that s=
ame issue in another way.

The problem adressed IIUC is that once the input is initialized, a subseq=
uent epoll_wait would hang
since the epoll_ctl call had failed to actually add the new event source.=
 The reverted patch had
fixed this by trying to avoid initializing stdin in all cases, which inad=
vertently broke
bluetoothctl. My suggestion is to revert that change, and instead check t=
he return value of
io_set_read_handler so that we can avoid digging ourselves into a deeper =
hole. Even if bt_shell_printf
is refactored so that it doesn't require the input fd, which sounds prude=
nt, I think it probably makes
sense to check the return values here, so I believe the reverted patch wo=
uld no longer be necessary.

I have seen Lars's patch, and that is actually what prompted me to submit=
 this one. Unfortunately,
it isn't correct since it causes non-interactive bluetoothctl invocations=
 to also print several
extraneous lines relating to the interactive shell.

I will submit the zsh changes separately as suggested.

Cheers,

Ronan

