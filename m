Return-Path: <linux-bluetooth+bounces-18238-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKnuM87Fb2mgMQAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18238-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 19:13:34 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6FE4934E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 19:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 29D5B823284
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 16:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA7E4418FB;
	Tue, 20 Jan 2026 16:08:25 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652F4449EA4
	for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jan 2026 16:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925304; cv=none; b=syDmhrPnDLQ+4w2ziB5K7TCNDnG1cfLA71lu9uaV31qGwG93YO0e6zTtW0zlFbxxyb/UO2kQOk3nP4itadxJAtA9LYTD5++vRstnVgCZUgGCoOZaLrrg0RttEKd7NPfZ1ysVC/TdSDTVhJqOC4+FPoACAQyoAlVDKRBzka3w/Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925304; c=relaxed/simple;
	bh=yeVegc93DWAhv3e9oz0QVH3WOQ2UJHUUF6TETtDtOp4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ruzq0iRlPPYSJcL/qdl6v4Ogv4+upLaJm2WMXwFQ1G9+JGlY6O3TzbfIXsPN6toY4QCBdG5BxpGcOgvOkzc0IygMHU8ewCx6nzh9gK/datEzhcV0REpQkScVmE6SnHe1qvD6fmtnWfjQcaBs8fgI6BNaz/b1fI28jo/0izxFXas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDCCB44382
	for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jan 2026 16:08:20 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Subject: [BlueZ 3/7] doc: Port security-bugs.txt to RST
Date: Tue, 20 Jan 2026 17:05:49 +0100
Message-ID: <20260120160811.3394320-4-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120160811.3394320-1-hadess@hadess.net>
References: <20260120160811.3394320-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedtkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeekteetgeettdehieduiedttdetffelleehtdejkeeluedvgfffvdevteetudfhkeenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeevffevveeugeegfeekvddpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqsghluhgvthhoohhthhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-State: clean
X-GND-Score: 0
X-Spamd-Result: default: False [0.24 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[hadess.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18238-lists,linux-bluetooth=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NEQ_ENVFROM(0.00)[hadess@hadess.net,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hadess.net:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 7C6FE4934E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---
 doc/{security-bugs.txt => security-bugs.rst} | 1 +
 1 file changed, 1 insertion(+)
 rename doc/{security-bugs.txt => security-bugs.rst} (99%)

diff --git a/doc/security-bugs.txt b/doc/security-bugs.rst
similarity index 99%
rename from doc/security-bugs.txt
rename to doc/security-bugs.rst
index bd4b0d68f309..0dcacfbd9eac 100644
--- a/doc/security-bugs.txt
+++ b/doc/security-bugs.rst
@@ -1,3 +1,4 @@
+=============
 Security bugs
 =============
 
-- 
2.52.0


