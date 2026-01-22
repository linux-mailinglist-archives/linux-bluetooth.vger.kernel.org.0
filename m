Return-Path: <linux-bluetooth+bounces-18337-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCwDF/JfcmnbjAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18337-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 18:35:46 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC596B6FC
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 18:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8392830C344B
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 17:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600DD3A704F;
	Thu, 22 Jan 2026 17:00:31 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B42C3A5C02
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 17:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769101226; cv=none; b=hYPj2ur6rjlTfUM6KfAmcJIOEZQVjFuVIIGQBoJe5B2cGctPHrxr9nyPgd/qbb45SCKOTRDoYdOn8zicuj6jgl0VRmEoaOu0mQzauhrvoAuPOIMPHexOcGo4u8NYCa94TgI+3vaNxOjHXQOoC9TFfuVfO2XtG7vLTk2qaPaU6Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769101226; c=relaxed/simple;
	bh=fIaU0LbqCI+dWN9lO0oKFPk1uOqDfPq/eyLDAkNed1M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Eib7WmQ3atA9pfT+tjoeYluWYQEPR9KQWqHL9Hjv6UaQ1gd1CJkqhEjzZH74iGp3fvxyr3SLXY3NguvMZ6tarHpn/ySVnDKahjSaZhIgVbbJrlyy4o2s/GVrUpdixysUEPUXptI2jrrTyh6uXL7+LDjRONNg5eQwkIw7qcq3ZeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92D3F4334D
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 17:00:09 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Subject: [BlueZ 0/2] Documentation fixups
Date: Thu, 22 Jan 2026 17:58:56 +0100
Message-ID: <20260122170001.122052-1-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeijeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeffleeuffejvdeufeffvdejjedvheekgfeltdejhfeitdettefgjedvuedvhfejueenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeelvdfffefhgeeffeegffdpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqsghluhgvthhoohhthhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-State: clean
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_FROM(0.00)[bounces-18337-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[hadess.net];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NEQ_ENVFROM(0.00)[hadess@hadess.net,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.923];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CDC596B6FC
X-Rspamd-Action: no action

Some documentation fixups after "Port text docs to RST and move man
pages" got merged.

Bastien Nocera (2):
  doc: Add "C" code-block markers for coding-style doc
  doc: Update .gitignore for new daemon man page locations

 .gitignore           |  4 ++--
 doc/coding-style.rst | 46 ++++++++++++++++++++++----------------------
 2 files changed, 25 insertions(+), 25 deletions(-)

-- 
2.52.0


