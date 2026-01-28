Return-Path: <linux-bluetooth+bounces-18605-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNyOEDw+emlB4wEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18605-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 17:50:04 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C30B2A62D2
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 17:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE2D93103EE9
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 16:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3226330F555;
	Wed, 28 Jan 2026 16:12:03 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9.mail.gandi.net [217.70.178.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951663093A8
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 16:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616722; cv=none; b=YXoEBSLX8XBRGpRHaJwJ920rHSd4PdkX52BMchB2WJ7JbnqsBvehl2pMfGfcbuis/nopVaCU3AOdqkP4iKUlhIJICnIn+AOgwqqn+sx2EdSXQ2Zlv+T8JKdH0QcBE5sdP1hX6mNuDi6wHLrbHbXNB22lz8JuR2vDK6UmPYmo+wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616722; c=relaxed/simple;
	bh=wQjU0hnRMH50v2d7L9dsSq5qgMGWYTv5I1O3dzNlnjU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XMk3NjqnPGrX+XaPxsFeZaW4Mf0/ZhNspFQQv8TQGutdzUUjZhwEa3inRob6E6LzBRyWaB6cp0EpAGYR7Z4VMF9Wj2FBiXVtEY3Tht2AvRaZ5dZbTj9u7te8bTEoNTt0l9ERQub5b7xQ8fk27QjnHOsiz47ZWeZL0vygQO5HRVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.178.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by relay9-d.mail.gandi.net (Postfix) with ESMTP id 7D52444C15
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 16:55:59 +0100 (CET)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56E5B44007
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 15:55:59 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v6 10/20] tools: Install btmgmt along with other tools
Date: Wed, 28 Jan 2026 16:11:48 +0100
Message-ID: <20260128155548.2025252-11-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128155548.2025252-1-hadess@hadess.net>
References: <20260128155548.2025252-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-Score: 300
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieefjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecundevohgrshhtrghlucdlfedttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeeuueeuieefgfeiudeiteduvdduffeihfetjedvtdevfeejudejveduieevgefgjeenucffohhmrghinhepmhgvshhonhdrsghuihhlugenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeelsgdvleemtggufeeimeeikehfugemtgdtleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeelsgdvleemtggufeeimeeikehfugemtgdtleefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeehiefgheeugeegtddtjedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqsghluhgvthhoohhthhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-State: spam:medium
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-18605-lists,linux-bluetooth=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_NA(0.00)[hadess.net];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[hadess@hadess.net,linux-bluetooth@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hadess.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C30B2A62D2
X-Rspamd-Action: no action

btmgmt is not installed by default, but it is useful for debugging
some issues and to set the MAC address on HCIs which don't have their
MAC address configured.
---
 tools/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 63ae1363972e..40215df691b7 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -160,7 +160,8 @@ if get_option('tools').enabled()
   if readline_dep.found()
     executable('btmgmt',
       sources: [ 'btmgmt.c', '../src/uuid-helper.c', '../client/display.c', '../client/mgmt.c' ],
-      dependencies: [ libbluetooth_internal_dep, libshared_mainloop_dep, readline_dep ]
+      dependencies: [ libbluetooth_internal_dep, libshared_mainloop_dep, readline_dep ],
+      install: true
     )
     executable('obex-client-tool',
       sources: [ 'obex-client-tool.c', gobex_sources, btio_sources ],
-- 
2.52.0


