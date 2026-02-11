Return-Path: <linux-bluetooth+bounces-18951-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOEmFxZ6jGktpAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18951-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 13:46:14 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED911247AB
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 13:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 861BF301BA71
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 12:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0954369982;
	Wed, 11 Feb 2026 12:46:09 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1666F31ED83
	for <linux-bluetooth@vger.kernel.org>; Wed, 11 Feb 2026 12:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813969; cv=none; b=hBFcF6iLKnY7GnEjA1Jtx6oxnvISEll6dhFWfG5zFp+0daj3txNNsUNhZ/uD9U5NCGZT83iN18vkO1S2kHcB1EE8hKTk5LAcCHys3MuDROPwGXq+n134Y2yW4q3ACjDPeZ1zjfdBmFFVA2JJ/7JnEAYVxAzNprU0KBNhwTet8tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813969; c=relaxed/simple;
	bh=Bpg0ki4o8s846ERbB60s1Xv+XqtP+3CFVio82a04zdY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZBSfiQwprkuAuZLuLQlQcOd8ze2B5hWnE74lSsEL1ASrFTr6V9g6uGJqVgvRx93mQ5ZmZ8Jc094EpEVPCGvxOAZDapj67ifEC56IzYqulI4kmpf1IRUD3XIkMVmPygBUBhc9mA4a7WFEh+SiOcW8aMBtKpQ7yWeA6nuZqMzjXQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9285B441EF
	for <linux-bluetooth@vger.kernel.org>; Wed, 11 Feb 2026 12:46:00 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v8 05/15] tools: Install gatttool if deprecated tools are enabled
Date: Wed, 11 Feb 2026 13:42:01 +0100
Message-ID: <20260211124550.3830639-6-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211124550.3830639-1-hadess@hadess.net>
References: <20260211124550.3830639-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtddvheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeeiudejjedujeegheegleefjeehgfevteefffeitdefjeehuefhgfejueejtdekueenucffohhmrghinheprhgvughhrghtrdgtohhmpdguvggsihgrnhdrohhrghenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeelsgdvleemtggufeeimeeikehfugemtgdtleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeelsgdvleemtggufeeimeeikehfugemtgdtleefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeelvdekheeugeegudfghfdpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqsghluhgvthhoohhthhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[hadess.net];
	TAGGED_FROM(0.00)[bounces-18951-lists,linux-bluetooth=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hadess@hadess.net,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hadess.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9ED911247AB
X-Rspamd-Action: no action

Fixes:
https://bugzilla.redhat.com/show_bug.cgi?id=1141909
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=720486
---
 tools/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/meson.build b/tools/meson.build
index e945fcaed953..431082cba94a 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -216,6 +216,7 @@ if get_option('tools').enabled()
     executable('gatttool',
       sources: gatttool_sources,
       dependencies: [ libbluetooth_internal_dep, libshared_glib_dep, readline_dep ],
+      install: true
     )
     executable('hciattach',
       sources: [
-- 
2.52.0


