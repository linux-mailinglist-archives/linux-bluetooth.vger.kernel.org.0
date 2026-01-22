Return-Path: <linux-bluetooth+bounces-18314-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEY8EojrcWl6ZAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18314-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 10:19:04 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FA564692
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 10:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ADE3E823534
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 09:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D4C3644A4;
	Thu, 22 Jan 2026 09:10:22 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C4B33B6CC
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 09:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073022; cv=none; b=hn+RA5Wo2uYOg5O+ZH3GhdcLeekAFSZDKhxcHciugvOL6uBK+RLCe4huGTY6jAklgGRWc8S8cFicHecosI9gJkk7LcCLyM7PfJhk5fyXNH6p1m1SG7ke2DtjanjvHnTtpjrcm0RpqkxvDqM/4czLTtNOZPx+8bIci2gj7b8fMbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073022; c=relaxed/simple;
	bh=/tum30SUFUoj2D9YtOeuSxCAnaj74uT6zv4Nt39kj0I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d1CG2upVT/VPMvkhkA5aC1auhT/ZKe0bICI1zMYkeoT2J6n4Uty1vY0aTpRJl5C2zwNQdSI0f7tvOBMLGUrFGTvDzZLY902Lcg4Ifr/zieKlrKoXmCdeFIq8KwaiahqTZoJZL/31C73q6tkVL0fBsIgFJ/Sc/Yd1y7dd28AwQMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3CDF430D4
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 09:10:12 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Subject: [BlueZ v3 1/9] doc: Rename section 7 man pages
Date: Thu, 22 Jan 2026 10:05:00 +0100
Message-ID: <20260122091003.398400-2-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122091003.398400-1-hadess@hadess.net>
References: <20260122091003.398400-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeehjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeekteetgeettdehieduiedttdetffelleehtdejkeeluedvgfffvdevteetudfhkeenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeetfeevfffhgeeftdffgedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqsghluhgvthhoohhthhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-State: clean
X-GND-Score: 0
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-18314-lists,linux-bluetooth=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NEQ_ENVFROM(0.00)[hadess@hadess.net,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hadess.net:mid,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,makefile.am:url]
X-Rspamd-Queue-Id: E4FA564692
X-Rspamd-Action: no action

So that rfcomm.rst can be used for the rfcomm command-line utilities.
This does not change the names of the generated man pages.
---
 Makefile.am                             | 7 ++++---
 doc/{hci.rst => hci-protocol.rst}       | 0
 doc/{iso.rst => iso-protocol.rst}       | 0
 doc/{l2cap.rst => l2cap-protocol.rst}   | 0
 doc/{mgmt.rst => mgmt-protocol.rst}     | 0
 doc/{rfcomm.rst => rfcomm-protocol.rst} | 0
 doc/{sco.rst => sco-protocol.rst}       | 0
 7 files changed, 4 insertions(+), 3 deletions(-)
 rename doc/{hci.rst => hci-protocol.rst} (100%)
 rename doc/{iso.rst => iso-protocol.rst} (100%)
 rename doc/{l2cap.rst => l2cap-protocol.rst} (100%)
 rename doc/{mgmt.rst => mgmt-protocol.rst} (100%)
 rename doc/{rfcomm.rst => rfcomm-protocol.rst} (100%)
 rename doc/{sco.rst => sco-protocol.rst} (100%)

diff --git a/Makefile.am b/Makefile.am
index 3adfa6cd51c3..c7a356b2cbd7 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -481,8 +481,9 @@ EXTRA_DIST += doc/assigned-numbers.txt doc/supported-features.txt \
 EXTRA_DIST += doc/health-api.txt \
 		doc/sap-api.txt
 
-EXTRA_DIST += doc/hci.rst doc/mgmt.rst doc/l2cap.rst doc/rfcomm.rst \
-	      doc/sco.rst doc/iso.rst
+EXTRA_DIST += doc/hci-protocol.rst doc/mgmt-protocol.rst \
+	      doc/l2cap-protocol.rst doc/rfcomm-protocol.rst \
+	      doc/sco-protocol.rst doc/iso-protocol.rst
 
 EXTRA_DIST += doc/org.bluez.Adapter.rst doc/org.bluez.Device.rst \
 		doc/org.bluez.Bearer.LE.rst doc/org.bluez.Bearer.BREDR.rst \
@@ -825,7 +826,7 @@ endif
 %.5: %.rst Makefile
 	$(RST2MAN_PROCESS)
 
-%.7: %.rst Makefile
+%.7: %-protocol.rst Makefile
 	$(RST2MAN_PROCESS)
 
 %.8: %.rst Makefile
diff --git a/doc/hci.rst b/doc/hci-protocol.rst
similarity index 100%
rename from doc/hci.rst
rename to doc/hci-protocol.rst
diff --git a/doc/iso.rst b/doc/iso-protocol.rst
similarity index 100%
rename from doc/iso.rst
rename to doc/iso-protocol.rst
diff --git a/doc/l2cap.rst b/doc/l2cap-protocol.rst
similarity index 100%
rename from doc/l2cap.rst
rename to doc/l2cap-protocol.rst
diff --git a/doc/mgmt.rst b/doc/mgmt-protocol.rst
similarity index 100%
rename from doc/mgmt.rst
rename to doc/mgmt-protocol.rst
diff --git a/doc/rfcomm.rst b/doc/rfcomm-protocol.rst
similarity index 100%
rename from doc/rfcomm.rst
rename to doc/rfcomm-protocol.rst
diff --git a/doc/sco.rst b/doc/sco-protocol.rst
similarity index 100%
rename from doc/sco.rst
rename to doc/sco-protocol.rst
-- 
2.52.0


