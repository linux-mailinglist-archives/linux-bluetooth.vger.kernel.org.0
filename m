Return-Path: <linux-bluetooth+bounces-19532-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNR9I1cno2kr+AQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19532-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sat, 28 Feb 2026 18:35:19 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4C11C4EFB
	for <lists+linux-bluetooth@lfdr.de>; Sat, 28 Feb 2026 18:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 11A22304E734
	for <lists+linux-bluetooth@lfdr.de>; Sat, 28 Feb 2026 17:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFB5338939;
	Sat, 28 Feb 2026 17:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rjp.ie header.i=@rjp.ie header.b="K9err4ra"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CB6333434
	for <linux-bluetooth@vger.kernel.org>; Sat, 28 Feb 2026 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772299979; cv=none; b=aBD3NwOckK7tcP1jBSAP2xMjs0X3FGF6/JVtmAxcmeGZpkqcv//VFJ4LhnOKVDmMNefAV1wnimFwR0N86gKeSioPfgoyyF7C+PWCDxxZlI5QL/Pl165eLm5AVM12vg4WTwfCHUhs8zDsdKPubQaotgONiH6uoE3QCODCuyZEx2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772299979; c=relaxed/simple;
	bh=AC4CBBouSMNuikSwBLz2DT4Ddd5QzXlx63pkU3ST7eo=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=CEWCcG9C3iryNzhBBRlVvwbPWd6ZjOPmeuL3hnZeZ7iLPAEf8Y6C2GTLXQzY3iRvFE46VmWBkaIzMzL1qOYcO+ngRC5Rv6NcIqmJK0VjAAXt2fOKxz40z2C/timrrXnnTw1A7tOOQ2LT/4QKYAWs7Onp3RekFa2yPy2qrV4lR4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rjp.ie; spf=pass smtp.mailfrom=rjp.ie; dkim=pass (1024-bit key) header.d=rjp.ie header.i=@rjp.ie header.b=K9err4ra; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rjp.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rjp.ie
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rjp.ie; s=key1;
	t=1772299975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AC4CBBouSMNuikSwBLz2DT4Ddd5QzXlx63pkU3ST7eo=;
	b=K9err4raWiW40wypktDDKZFTSUMJvxFzVp9zqy0WpWYtI5AmV8SKF+krY25DJu4AiWAB3J
	oh2ktDxXRHiT5K76WkX7j40wb03CN6mXrsBdj3onX2X3WHTK/TiNl4z94WXh4jvnh69bkM
	IVRiFEOxvn+CEQYQNNU/7DoWznxUa4g=
Date: Sat, 28 Feb 2026 17:32:48 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ronan Pigott" <ronan@rjp.ie>
Message-ID: <ec29771002a879c71934cd0c1a71b18d37a31952@rjp.ie>
TLS-Required: No
Subject: Re: [PATCH BlueZ 2/2] shared/shell: gracefully recover from failed
 input initialization
To: "Bastien Nocera" <hadess@hadess.net>, "Luiz Augusto von Dentz"
 <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
In-Reply-To: <62306adc1550b46aa164ddb57e8a4167dddeb261.camel@hadess.net>
References: <20260218024605.70890-1-ronan@rjp.ie>
 <20260218024605.70890-3-ronan@rjp.ie>
 <CABBYNZJqjaDJmkEy0yvyqLXP6kFH-dVjnzcCVknAkpu39zspaA@mail.gmail.com>
 <defdb4fb77123ebe7abea7e8f225720e4e72e6c5@rjp.ie>
 <CABBYNZLgugMFofwxAV4qFFP=RCnXG22MbcTgdt88ydbkSEKO9Q@mail.gmail.com>
 <cc92dcae7bf3c7832643071df30eb5734097d2d1.camel@hadess.net>
 <62306adc1550b46aa164ddb57e8a4167dddeb261.camel@hadess.net>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rjp.ie,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[rjp.ie:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19532-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[hadess.net,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ronan@rjp.ie,linux-bluetooth@vger.kernel.org];
	DKIM_TRACE(0.00)[rjp.ie:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F4C11C4EFB
X-Rspamd-Action: no action

February 27, 2026 at 4:31 AM, "Bastien Nocera" wrote:

Hi Bastien,

> I've integrated tests for both bugs (no output in 5.86 and btmgmt
> hanging) into the integration tests at:
> https://github.com/hadess/bluez/commits/wip/hadess/add-integration-test=
s/
>=20
>=20and I've independently tested that both problems were fixed by the
> patches I sent to the list this instant.

Looks good! Thanks!

