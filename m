Return-Path: <linux-bluetooth+bounces-18581-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKxHFjEFemlE1gEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18581-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 13:46:41 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D32CEA182A
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 13:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE9103016CB1
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 12:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63907350A0B;
	Wed, 28 Jan 2026 12:45:03 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89719284B2E
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 12:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769604303; cv=none; b=XBZykC/soMUz6ZLYUEHeHdPwTx77PvOlPPt0ksUeNpJt0VlJw/nBCFDN9G/iIZNfRxet25FLaBEA0sp3AKsROErbhoJTHoGt9pBkMqnCIqBUysrpLYKfyNoYx29rbNP5wn512j7vnhuWxUEucMO39shESDYh84gmcouaEfWeGQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769604303; c=relaxed/simple;
	bh=taZmEHAhg7yp2z0Gq1/uKSugIskE4/smmvc1FURvBco=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BJ08diMzubGcH4ph5mu9/mTigpixMPBCdb/rFB3wWNwjEGPuzicpeBKQBVIVf2ZKM4fGuqRUDlC0c7ylmBeELbUQ+RSuW+VJdfDSMoGR7BZqULRIfkhKFiyMA1bHLuacxsF4QFeEFiglKyDxFnlypPF2AWliGq37ALy8YKxqqSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5450F43A5E;
	Wed, 28 Jan 2026 12:44:53 +0000 (UTC)
Message-ID: <f2bb9c6c5f0caf82fd5a2af9cd6676e4349a70b9.camel@hadess.net>
Subject: Re: [PATCH BlueZ] doc/qualification: Fix typos
From: Bastien Nocera <hadess@hadess.net>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Danis <frederic.danis@collabora.com>, 
	linux-bluetooth@vger.kernel.org
Date: Wed, 28 Jan 2026 13:44:52 +0100
In-Reply-To: <20260128115359.222251-1-frederic.danis@collabora.com>
References: <20260128115359.222251-1-frederic.danis@collabora.com>
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
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieefgedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkuffhvfffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeeuveeivdetkeekgfefffeftefhjeeikeetffdvteejheefieeltedtvdeuleduleenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeelsgdvleemtggufeeimeeikehfugemtgdtleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeelsgdvleemtggufeeimeeikehfugemtgdtleefpdhhvghloheplgfkrfhvieemvdgrtddumegvfeegmegvtgejfeemtghfvddtmeelsgdvleemtggufeeimeeikehfugemtgdtleefngdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeehgeehtdfhgeefteehgfdpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepfhhrvgguvghrihgtrdgurghnihhssegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtoheplhhinhhugidqsghlu
 hgvthhoohhthhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-State: clean
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[hadess.net];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hadess@hadess.net,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18581-lists,linux-bluetooth=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: D32CEA182A
X-Rspamd-Action: no action

On Wed, 2026-01-28 at 12:53 +0100, Fr=C3=A9d=C3=A9ric Danis wrote:
> This fix the errors and warnings found during HTML generation.

Tested locally, and fixes the docs generation errors as expected.

+1 from me.

