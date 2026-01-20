Return-Path: <linux-bluetooth+bounces-18255-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MKJEZXPb2kTMwAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18255-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 19:55:17 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF68C49DD6
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 19:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EFB758636D4
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 17:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1EC33D6476;
	Tue, 20 Jan 2026 17:20:47 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D913238B98A
	for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jan 2026 17:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768929647; cv=none; b=gddQzsvtzqVNXaLsuLBscZNq64cZsbOi5WRDr7ZPY58RwyQfPzv8xONSGx4XA83u+Ebu0RmgDoQp5MewQfJ4ImeszCz87xYibslZ94s6ftyQWxLs09PpC4RKsTt0aUl0rB1ZAjw7N2HiLTzopC5ig0tz0IK0qEKrDtcJQdrvOZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768929647; c=relaxed/simple;
	bh=ZFaqx3FZvSbvMRctJwmZZi3BKhpSp27KPfM7SHG0sqc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=u15EdeL/l8BcieWGuXlZDMUPNmyc16QSEOl4FnrOAa/nw/sYMkvMq5pHBnv2J5fgb9zBpsbbafeznGlHwdaf71jln3iLzbo7LA0DkIEf+peQ0eNxoWnaOWdnd7au/DNAjYPOVeeDScxjw8szdtqyT8dKsEfy5FGHdyYk/DL4Awc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D9BD44373
	for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jan 2026 17:20:43 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Subject: [BlueZ v2 0/7] Port text docs to RST
Date: Tue, 20 Jan 2026 18:18:45 +0100
Message-ID: <20260120172034.3463151-1-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedtleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepuegrshhtihgvnhcupfhotggvrhgruceohhgruggvshhssehhrgguvghsshdrnhgvtheqnecuggftrfgrthhtvghrnhepteeuhfeigffgfeeuuedvvdfhudfhvdfgvdeiudfgkedvudegleehleelveeuheeinecuffhomhgrihhnpehgihhthhhusgdrihhonecukfhppedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfedphhgvlhhopeholhhimhhpihgtpdhmrghilhhfrhhomhephhgruggvshhssehhrgguvghsshdrnhgvthdpqhhiugepvdffleeuffeggeefjeefpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-State: clean
X-GND-Score: 49
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
	TAGGED_FROM(0.00)[bounces-18255-lists,linux-bluetooth=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NEQ_ENVFROM(0.00)[hadess@hadess.net,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hadess.net:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,hadess.github.io:url]
X-Rspamd-Queue-Id: DF68C49DD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

So they can be integrated into our upcoming HTML docs. See:
https://hadess.github.io/bluez/
for a preview.

Changes since v1:
- Fix distcheck

Bastien Nocera (7):
  doc: Port assigned-numbers.txt to RST
  doc: Port thermometer-api.txt to RST
  doc: Port security-bugs.txt to RST
  doc: Port coding-style.txt to RST
  doc: Port sap-api.txt to RST
  doc: Port maintainer-guidelines.txt to RST
  doc: Port health-api.txt to RST

 Makefile.am                                   |  30 +-
 doc/assigned-numbers.rst                      |  29 ++
 doc/assigned-numbers.txt                      |  26 --
 doc/coding-style.rst                          | 349 ++++++++++++++++++
 doc/coding-style.txt                          | 279 --------------
 doc/health-api.txt                            | 152 --------
 ...idelines.txt => maintainer-guidelines.rst} |  61 +--
 doc/org.bluez.HealthChannel.rst               |  72 ++++
 doc/org.bluez.HealthDevice.rst                |  94 +++++
 doc/org.bluez.HealthManager.rst               |  68 ++++
 doc/org.bluez.SimAccess.rst                   |  40 ++
 doc/org.bluez.Thermometer.rst                 |  51 +++
 doc/org.bluez.ThermometerManager.rst          |  64 ++++
 doc/org.bluez.ThermometerWatcher.rst          |  79 ++++
 doc/sap-api.txt                               |  20 -
 doc/{security-bugs.txt => security-bugs.rst}  |   1 +
 doc/thermometer-api.txt                       | 134 -------
 17 files changed, 908 insertions(+), 641 deletions(-)
 create mode 100644 doc/assigned-numbers.rst
 delete mode 100644 doc/assigned-numbers.txt
 create mode 100644 doc/coding-style.rst
 delete mode 100644 doc/coding-style.txt
 delete mode 100644 doc/health-api.txt
 rename doc/{maintainer-guidelines.txt => maintainer-guidelines.rst} (65%)
 create mode 100644 doc/org.bluez.HealthChannel.rst
 create mode 100644 doc/org.bluez.HealthDevice.rst
 create mode 100644 doc/org.bluez.HealthManager.rst
 create mode 100644 doc/org.bluez.SimAccess.rst
 create mode 100644 doc/org.bluez.Thermometer.rst
 create mode 100644 doc/org.bluez.ThermometerManager.rst
 create mode 100644 doc/org.bluez.ThermometerWatcher.rst
 delete mode 100644 doc/sap-api.txt
 rename doc/{security-bugs.txt => security-bugs.rst} (99%)
 delete mode 100644 doc/thermometer-api.txt

-- 
2.52.0


