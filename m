Return-Path: <linux-bluetooth+bounces-18900-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIjgON5KimndJAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18900-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Feb 2026 22:00:14 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E51114ACD
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Feb 2026 22:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B148303C2B9
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Feb 2026 20:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4355332B98F;
	Mon,  9 Feb 2026 20:58:28 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71D42475F7
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Feb 2026 20:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770670708; cv=none; b=HUikxk5jkn9udgEHYTh9V9CvpFoYMRQ7gX/ZIAfO0DZ9TIA/oX9y1aeYATfzogzf8y4GmUDzkdJFjyq8zbaHac4urk2QfEvpHsegqS91SpTSWyN19jjBL/T7VGdqqtGMI2YU96MO5+JGA1KANIK98a6NiCyHzkxumKpP1b0+W0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770670708; c=relaxed/simple;
	bh=Cf6kpt8SK4VxKeECel2YlY421lIZJMHdzZEKtt0Ayyk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZcNDJAS2VjEnTTKxNIuxCfT+yB1M8VULbmmiRaVIVZ8D/COUmw95DJshWSw45xQ9fPrOwxyiGoPiPr+V2GryLU88g2mfZ0iX+LOXOBMqXMZ4o/EhRL6yAbKLW6x139H4RTsgcy4Ae6xG1c5nopkQROSnzv+BV3QnuwKYJ3DF/DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id F34A3441D6;
	Mon,  9 Feb 2026 20:58:23 +0000 (UTC)
Message-ID: <4ce2e450a4fe20591901278e1f597e7bb2aa84a7.camel@hadess.net>
Subject: Re: 5.86 build failure (was Re: [bluez/bluez] 11dc12: build: Update
 library version)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org, Pauli Virtanen <pav@iki.fi>
Date: Mon, 09 Feb 2026 21:58:23 +0100
In-Reply-To: <75bcb8dfac6144ab335b7f5b6822c7cde8ee7f66.camel@hadess.net>
References: <bluez/bluez/push/refs/heads/master/6704b4-74770b@github.com>
	 <75bcb8dfac6144ab335b7f5b6822c7cde8ee7f66.camel@hadess.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-GND-Sasl: hadess@hadess.net
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduleejkeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkuffhvfffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeffvefhhfektdetfeekvefffeejheefueeiiefggfekfedtfeduhffglefhffelffenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeelsgdvleemtggufeeimeeikehfugemtgdtleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeelsgdvleemtggufeeimeeikehfugemtgdtleefpdhhvghloheplgfkrfhvieemvdgrtddumegvfeegmegvtgejfeemtghfvddtmeelsgdvleemtggufeeimeeikehfugemtgdtleefngdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupefhfeegteefgeegudffiedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheplhhinhhugidqsghluhgvthhoohhth
 hesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghvsehikhhirdhfih
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hadess.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iki.fi:email];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DMARC_NA(0.00)[hadess.net];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[hadess@hadess.net,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-18900-lists,linux-bluetooth=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 32E51114ACD
X-Rspamd-Action: no action

On Mon, 2026-02-09 at 11:12 +0100, Bastien Nocera wrote:
> On Sun, 2026-02-08 at 13:28 -0800, Marcel Holtmann wrote:
> <snip>:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > https://github.com/bluez/bluez/commit/74770b1fd2be612f9c2cf807db81fcdcc=
35e6560
> > =C2=A0 Author: Marcel Holtmann <marcel@holtmann.org>
> > =C2=A0 Date:=C2=A0=C2=A0 2026-02-08 (Sun, 08 Feb 2026)
> >=20
> > =C2=A0 Changed paths:
> > =C2=A0=C2=A0=C2=A0 M ChangeLog
> > =C2=A0=C2=A0=C2=A0 M configure.ac
> >=20
> > =C2=A0 Log Message:
> > =C2=A0 -----------
> > =C2=A0 Release 5.86
>=20
> The build fails on Fedora's s390x build system, which is the only big
> endian system we have.
>=20
> Regression is caused by:
> commit 85888a8357eac652c1760da888ac68d0417f0e89
> Author: Pauli Virtanen <pav@iki.fi>
> Date:=C2=A0=C2=A0 Sat Nov 29 18:41:01 2025 +0200
>=20
> =C2=A0=C2=A0=C2=A0 bthost: add bthost_setup_sco() and accept incoming eSC=
O
> =C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 Add support for bthost initiating SCO connections and =
accepting
> eSCO
> =C2=A0=C2=A0=C2=A0 ones with BT_HCI_CMD_ACCEPT_SYNC_CONN_REQUEST.
>=20
> Full build logs as attachment.
>=20
> TLDR, it doesn't like having bswap_*() be used to assign constants.

Patch sent:
https://patchwork.kernel.org/project/bluetooth/list/?series=3D1052425

