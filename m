Return-Path: <linux-bluetooth+bounces-18957-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eInuD1N6jGkcpgAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18957-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 13:47:15 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FDF1247F5
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 13:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB32D3051C83
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 12:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489D61E7660;
	Wed, 11 Feb 2026 12:46:11 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B5E3542FA
	for <linux-bluetooth@vger.kernel.org>; Wed, 11 Feb 2026 12:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813970; cv=none; b=WA5FwZxwk7qUS66X7+C8u08velP0q/EeLYC5u6+D/lMf1nkzIaPwRHPRnPEd2maGcFCi6xvt3w7JLZ1xrtSiMXWy2O0tVpXc3Xxb8DCqRx9nkStsoWUv2yZVKTriGhNHUmgQ/sc4LatiAc2yIQGh+pXjM36tzigDGokPqioKlsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813970; c=relaxed/simple;
	bh=UozeGtWAEAbLLTAdfRediERR/fgNH42W0WG0oo43/Ho=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f63u95AuVVeyo91A3XsKt6ZujGBrHxtrB9Nhpn8b2vleYUFxBYuW/KPQO/3qqlVmTovJn+FZMNROnMXFuZBxwE0heRjcZnHbn7POVQA542sciZXNQ7amhrpgVoYFrx+4KYg+fH8+l9W+cnkn6LJBTj6/v/2dWuiHoiefyno6t70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A89B43941
	for <linux-bluetooth@vger.kernel.org>; Wed, 11 Feb 2026 12:46:01 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v8 09/15] unit: Run test-bap tests concurrently
Date: Wed, 11 Feb 2026 13:42:05 +0100
Message-ID: <20260211124550.3830639-10-hadess@hadess.net>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtddvheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeekteetgeettdehieduiedttdetffelleehtdejkeeluedvgfffvdevteetudfhkeenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeelsgdvleemtggufeeimeeikehfugemtgdtleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmeelsgdvleemtggufeeimeeikehfugemtgdtleefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeekteekleeugeefleeguddpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqsghluhgvthhoohhthhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[hadess.net];
	TAGGED_FROM(0.00)[bounces-18957-lists,linux-bluetooth=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hadess@hadess.net,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hadess.net:mid,meson.build:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,unittest_list.sh:url]
X-Rspamd-Queue-Id: B9FDF1247F5
X-Rspamd-Action: no action

---
 meson.build           |  2 +-
 unit/meson.build      | 25 ++++++++++++++++++++++---
 unit/unittest_list.sh | 15 +++++++++++++++
 3 files changed, 38 insertions(+), 4 deletions(-)
 create mode 100644 unit/unittest_list.sh

diff --git a/meson.build b/meson.build
index 2d4203a02a0b..f2220b2c4613 100644
--- a/meson.build
+++ b/meson.build
@@ -273,6 +273,7 @@ endif
 if rst2man.found()
   subdir('doc')
 endif
+sh = find_program('sh')
 if not get_option('tests').disabled()
   subdir('test')
   subdir('unit')
@@ -280,7 +281,6 @@ endif
 
 # Fix permissions on install
 install = find_program('install')
-sh = find_program('sh')
 if get_option('daemon').enabled()
   meson.add_install_script(sh, '-c', 'install -dm755 ${DESTDIR}/' + configdir)
 endif
diff --git a/unit/meson.build b/unit/meson.build
index 1e9b7020c089..b74a67541e99 100644
--- a/unit/meson.build
+++ b/unit/meson.build
@@ -7,7 +7,6 @@ tests1 = [
   [ 'test-avrcp.c', '../src/log.c', 'avctp.c', 'avrcp-lib.c' ],
   [ 'test-lib.c' ],
   [ 'test-gatt.c' ],
-  [ 'test-bap.c' ],
   [ 'test-micp.c' ],
   [ 'test-bass.c' ],
   [ 'test-vcp.c' ],
@@ -39,6 +38,26 @@ foreach t: tests1
 endforeach
 
 tests2 = [
+  [ 'test-bap.c' ],
+]
+
+unittest_list = find_program('unittest_list.sh')
+
+foreach t: tests2
+  test_name = t[0].substring(0, -2)
+  exe = executable(test_name,
+    sources: t,
+    dependencies: [ libshared_glib_dep, libbluetooth_internal_dep ],
+  )
+
+  r = run_command(sh, unittest_list, t, check: true)
+  unit_tests = r.stdout().strip().split(' ')
+  foreach ut: unit_tests
+    test(ut, exe, args: [ '-p', ut ])
+  endforeach
+endforeach
+
+tests3 = [
   [ 'test-textfile.c', '../src/textfile.c' ],
   [ 'test-crc.c', '../monitor/crc.c' ],
   [ 'test-crypto.c' ],
@@ -53,7 +72,7 @@ tests2 = [
 ]
 
 if ical_dep.found()
-  tests2 += [
+  tests3 += [
     [ 'test-gobex.c', 'util.c', gobex_sources ],
     [ 'test-gobex-packet.c', 'util.c', gobex_sources ],
     [ 'test-gobex-header.c', 'util.c', gobex_sources ],
@@ -62,7 +81,7 @@ if ical_dep.found()
   ]
 endif
 
-foreach t: tests2
+foreach t: tests3
   test_name = t[0].substring(0, -2)
   exe = executable(test_name,
     sources: t,
diff --git a/unit/unittest_list.sh b/unit/unittest_list.sh
new file mode 100644
index 000000000000..c478edc9d3e4
--- /dev/null
+++ b/unit/unittest_list.sh
@@ -0,0 +1,15 @@
+#!/bin/sh
+
+if [ $# -lt 1 ] ; then
+	echo "Usage: $0 FILE..."
+	exit 1
+fi
+
+TESTS=$(grep '^[[:space:]]*define_test[_a-z]*("' $* | cut -d \" -f 2 | cut -d " " -f 1)
+if [ -z "$TESTS" ] ; then
+	TESTS=$(grep '^[[:space:]]*tester_add("' $* | cut -d \" -f 2 | cut -d " " -f 1)
+fi
+if [ -z "$TESTS" ] ; then
+	TESTS=$(grep '^[[:space:]]*g_test_add_*func("' $* | cut -d \" -f 2 | cut -d " " -f 1)
+fi
+echo $TESTS
-- 
2.52.0


