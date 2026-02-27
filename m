Return-Path: <linux-bluetooth+bounces-19460-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC35IIaAoWkUtgQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19460-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Feb 2026 12:31:18 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB9E1B6977
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Feb 2026 12:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7432E313562F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Feb 2026 11:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF97D3F0765;
	Fri, 27 Feb 2026 11:29:22 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13143EFD18
	for <linux-bluetooth@vger.kernel.org>; Fri, 27 Feb 2026 11:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772191761; cv=none; b=PVNkKY1dfmubijZi8BXxRhYzHyi3Kz9idOEOkb76boPKv1FoeVp56I9TqPLRcoPqHxtDgrqwvbMY7yGg4bLugE7OpZtPR/SntsfeTsWyUCs0Du/U41qiqJPjiqRjggneCEYJ0z4ruEVzCBZ2Ghs2x52e+wrc4EdF5N/I4aIchqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772191761; c=relaxed/simple;
	bh=horvH+f8CJ0kVOIcCZHhdyqxsU/6Vfw4kLg+iPIj88I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=c+7OLeEZWoD6Dhid1H3/SvyFakGwaDLMtel6dbkkh4vn4accBj2VHhBl4OxUlFpqKLWx7W0qtOn4pUZYZ+fJJtx6HZbANeW/ALKvWWnWeqFcwdahMvVwKXT/PaHSjOsEOuySdQtGi9lY5Aocx+yBWlr8T502U30VsZsinvmE4gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14F6F4327B
	for <linux-bluetooth@vger.kernel.org>; Fri, 27 Feb 2026 11:29:08 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ 0/2] Fix bluetoothctl no output
Date: Fri, 27 Feb 2026 12:27:16 +0100
Message-ID: <20260227112900.1946851-1-hadess@hadess.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeekkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeffudfgkeffjeekieeivddtfeevvdelffejudfhhfehueehueefkeefueethfevfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfedphhgvlhhopeholhhimhhpihgtpdhmrghilhhfrhhomhephhgruggvshhssehhrgguvghsshdrnhgvthdpqhhiugepudeghfeihfegfedvjeeupdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-State: clean
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_FROM(0.00)[bounces-19460-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[hadess.net];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NEQ_ENVFROM(0.00)[hadess@hadess.net,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,makefile.tools:url]
X-Rspamd-Queue-Id: DBB9E1B6977
X-Rspamd-Action: no action

This fixes a regression in 5.86, and works around a problem specific to
btmgmt.

Both commits can be tested independently using the regression test in
the meson port:
https://github.com/hadess/bluez/commits/wip/hadess/add-integration-tests/

Bastien Nocera (2):
  Revert "shared/shell: Don't init input for non-interactive shells"
  tools: Work-around broken stdin handling in home-made mainloop

 Makefile.tools     |  4 ++--
 src/shared/shell.c | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.53.0


