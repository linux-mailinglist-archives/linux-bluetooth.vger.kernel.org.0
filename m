Return-Path: <linux-bluetooth+bounces-18339-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAT8JBJhcmnfjQAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18339-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 18:40:34 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E216B85A
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 18:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8995301F165
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 17:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB103A7040;
	Thu, 22 Jan 2026 17:00:30 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE94328243
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 17:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769101226; cv=none; b=bxb4TvuG+IQy4navSnaH1L4ceTR/VWpMpBRPAkvMoVrLaW3rdFFjS/jCLKwhhYZ+G4ttBaEe6d7gxHU7LZ7mZJuYlrJPzL49/0FKfobCCD30sTLcRI/JUVG36TNRDc1K+UF8YsPkU9dVSj2PHHJaP09Lm3Zt08tEyjeaVAXrqRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769101226; c=relaxed/simple;
	bh=TXPzKmLNE9+b2p0NWp2yqih8QLHYxdMzLMy3RrbbkIU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DJ2lvxHxFy2rEEPf1vhUJPOkDqgKOa8H9eCkhStEMQEBxsh6/Uvfz7XOqb6u4CP8GwMf4V6Eq/O4VH2wtf5t/lFdY+K8d3b4WkG+7FWa3FKrmn9aYeQGZ/QC+52RJDDBUmK+vTjyjNZn8/WSy8uj+WYs+r/PEsEYz1bQmls9JkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A732444E2
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 17:00:09 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Subject: [BlueZ 2/2] doc: Update .gitignore for new daemon man page locations
Date: Thu, 22 Jan 2026 17:58:58 +0100
Message-ID: <20260122170001.122052-3-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122170001.122052-1-hadess@hadess.net>
References: <20260122170001.122052-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeijeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeffieffueegieejheeggfeukeehgfehueeuhefhudejiefhuedtvdelleffffegffenucffohhmrghinheprhhsthdrihhnnecukfhppedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfedphhgvlhhopeholhhimhhpihgtpdhmrghilhhfrhhomhephhgruggvshhssehhrgguvghsshdrnhgvthdpqhhiugeptdetjeefvdeggeeggfdvpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-State: clean
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_FROM(0.00)[bounces-18339-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[hadess.net];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NEQ_ENVFROM(0.00)[hadess@hadess.net,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.902];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rst.in:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,hadess.net:mid]
X-Rspamd-Queue-Id: 14E216B85A
X-Rspamd-Action: no action

bluetoothd.rst.in and bluetooth-meshd.rst.in moved, so the generated
".rst" files moved too. Update .gitignore to match the new location.
---
 .gitignore | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitignore b/.gitignore
index f8e4ad686065..27c9b8b6eb65 100644
--- a/.gitignore
+++ b/.gitignore
@@ -150,9 +150,9 @@ tools/mesh-cfgclient
 tools/mesh-cfgtest
 tools/mesh-tester
 mesh/bluetooth-meshd
-mesh/bluetooth-meshd.rst
+doc/bluetooth-meshd.rst
 
-src/bluetoothd.rst
+doc/bluetoothd.rst
 src/bluetooth.service
 mesh/bluetooth-mesh.service
 
-- 
2.52.0


