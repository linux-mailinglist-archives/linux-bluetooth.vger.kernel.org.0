Return-Path: <linux-bluetooth+bounces-18299-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLSwFUQ6cWnKfQAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18299-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Jan 2026 21:42:44 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CC03C5D7CE
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Jan 2026 21:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3C6E89EB354
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Jan 2026 19:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FEC6342C94;
	Wed, 21 Jan 2026 19:28:22 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331473B52F1;
	Wed, 21 Jan 2026 19:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.132.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769023701; cv=none; b=Re7WuDDkFsOpHGwMh+LLBgEtH898FBBZHvwbsEqR7yqHjkv0c6TWUZmAjfhr34EFqndorYf4ltkUByIA9d5W3l8NWcneCnpxefeRdzf5v/zuDZCTr7XS+zAw/jwCMNRptQs2AmFH6Zcwmjl+lWB3ECebgSDTEyW9WbyGksMT1kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769023701; c=relaxed/simple;
	bh=Ln9oKnp9sriaa5rqvrwzweLxXvYbJoYB/OUH43OmwBI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=P79yC6P4HXz5FPnbf1odH3jqMj5cWDjjW1/nQFd/3+cU2HSWWParfkOJvv4naR9Bna1zQLpJ8fFJT1wINavl2mNMZl8w1vSoGsaX7i7QMEdOKU9Au/BNsvjim4dlPGvqe/Zns7bbQ2vK6joDio4QB8knyVeBSwHyrm2vmB16G1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org; spf=pass smtp.mailfrom=holtmann.org; arc=none smtp.client-ip=212.227.132.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=holtmann.org
Received: from smtpclient.apple (p4ff9f357.dip0.t-ipconnect.de [79.249.243.87])
	by mail.holtmann.org (Postfix) with ESMTPSA id 25D36CECC9;
	Wed, 21 Jan 2026 20:19:11 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v2 07/11] Bluetooth: btnxpuart: Add device authentication
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20260113074718.2384043-8-neeraj.sanjaykale@nxp.com>
Date: Wed, 21 Jan 2026 20:19:00 +0100
Cc: luiz.dentz@gmail.com,
 amitkumar.karwar@nxp.com,
 sherry.sun@nxp.com,
 dmitrii.lebed@nxp.com,
 linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D2E6AF7C-D037-471A-B230-ABED4357DDB4@holtmann.org>
References: <20260113074718.2384043-1-neeraj.sanjaykale@nxp.com>
 <20260113074718.2384043-8-neeraj.sanjaykale@nxp.com>
To: Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-Spamd-Result: default: False [-0.76 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,nxp.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-18299-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[holtmann.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marcel@holtmann.org,linux-bluetooth@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[holtmann.org:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: CC03C5D7CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Neeraj,

> This implements secure device authentication during TLS 1.3-like
> handshake with ECDSA signature verification.
>=20
> The authentication flow:
> - Derive handshake traffic secret from ECDH shared secret
> - Decrypt device hello encrypted section using AES-GCM with traffic =
secret
> - Extract ECDSA public key from firmware metadata for verification

where is the storage of the private key?

And where are the firmware files? When looking this up I saw that NXP =
has not updated linux-firmware for a long time. The current driver =
references firmware files that are not contributed to linux-firmware. =
That is not ok.

> - Verify device handshake signature to authenticate device identity
> - Validate device finished message using calculated verify data
> - Clear handshake traffic secret after successful authentication
>=20
> This ensures only devices with valid private keys can complete the
> handshake.
>=20
> Key components added:
> - AES-GCM encrypt/decrypt with traffic secret derived keys
> - ECDSA P-256 signature verification using kernel crypto API
> - X9.62 to P1363 signature format conversion
> - TLS 1.3 finished message verification
> - Secure memory cleanup of cryptographic material

Why not just use HPKE here? Seems a lot simpler than trying to emulate =
TLS 1.3.

Regards

Marcel


