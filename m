Return-Path: <linux-bluetooth+bounces-19459-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aM+iKtiAoWkUtgQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19459-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Feb 2026 12:32:40 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DE41B69AD
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Feb 2026 12:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B43030B7182
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Feb 2026 11:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5E336E47C;
	Fri, 27 Feb 2026 11:29:21 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23953F0740
	for <linux-bluetooth@vger.kernel.org>; Fri, 27 Feb 2026 11:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772191760; cv=none; b=oQS7a++okhTdAV/apdsNDBQvd58w3wrSN3e3WoIGUwsfyceL/7ufvzMxhLhGfF55KaLnlAyUBcVLkn+OYANdgGZXH/llKnw7LBQRLeFnQr5mOC6G+z17J8GvCgVJCkX3tMHSC0b18yC05wWJazuYVsVJd9wZejyiJnJRVhcZvPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772191760; c=relaxed/simple;
	bh=bZaQVesixtq/CTMrEzvq6vsc3bIQETTijlja2hroLIY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+vynq4dpPVDnUwvJRbE82hRk1wnmxaVSq2R8UCTam70RjAoMObCY+BRt7WRs21p2Y43zK/rOzLLOhHl255dNqEiByJChwByQnNRPxedLjJNjtiXwrOEmMitswr0ldo6v3JFNU4PTBBC8qgDThOHXDMzjTNiw18DF3uErMmUi4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F6E643283
	for <linux-bluetooth@vger.kernel.org>; Fri, 27 Feb 2026 11:29:09 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ 1/2] Revert "shared/shell: Don't init input for non-interactive shells"
Date: Fri, 27 Feb 2026 12:27:17 +0100
Message-ID: <20260227112900.1946851-2-hadess@hadess.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227112900.1946851-1-hadess@hadess.net>
References: <20260227112900.1946851-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeekkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpedttdejfeeikedvhfelledtgffhhfdvleffhffhueffieeuhfffgfevveekteetfeenucffohhmrghinheprhgvughhrghtrdgtohhmnecukfhppedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfedphhgvlhhopeholhhimhhpihgtpdhmrghilhhfrhhomhephhgruggvshhssehhrgguvghsshdrnhgvthdpqhhiugepgefhiefgieegfedvkeefpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-State: clean
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_FROM(0.00)[bounces-19459-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[hadess.net];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NEQ_ENVFROM(0.00)[hadess@hadess.net,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,hadess.net:mid]
X-Rspamd-Queue-Id: 35DE41B69AD
X-Rspamd-Action: no action

This reverts commit e73bf582dae60356641a32fc27ae03d359ec4c47.

The fix caused "bluetoothctl list" to not output any text, breaking
a lot of existing scripts.

Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2440346
---
 src/shared/shell.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/src/shared/shell.c b/src/shared/shell.c
index 78d58c513d3e..b061f8001414 100644
--- a/src/shared/shell.c
+++ b/src/shared/shell.c
@@ -1642,13 +1642,13 @@ static bool shell_quit(void *data)
 
 bool bt_shell_attach(int fd)
 {
-	if (data.mode == MODE_INTERACTIVE) {
-		struct input *input;
+	struct input *input;
 
-		input = input_new(fd);
-		if (!input)
-			return false;
+	input = input_new(fd);
+	if (!input)
+		return false;
 
+	if (data.mode == MODE_INTERACTIVE) {
 		io_set_read_handler(input->io, input_read, input, NULL);
 		io_set_disconnect_handler(input->io, input_hup, input, NULL);
 
-- 
2.53.0


