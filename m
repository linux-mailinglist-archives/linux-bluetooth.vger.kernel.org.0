Return-Path: <linux-bluetooth+bounces-18315-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLlfGlHrcWl6ZAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18315-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 10:18:09 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E61B64675
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 10:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4B17E38B9AD
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 09:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FEE7364059;
	Thu, 22 Jan 2026 09:10:22 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CFD33DEEB
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 09:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073022; cv=none; b=Kdh2k+a63SYEXWH6LDyLQpS6F4E5kgLU1stTZrk4o+KvCpLayPCVwuW3cYhjeM36qkWt9h5OdAY7QMqoZc47ZS0aYjTJVIYw9m1Nx+KFaYY/+xYNUdnX7O7rTtZ/tbdGWypSgBgaD1TnVEnFRSxzXCXorwm27+klocimC7xknrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073022; c=relaxed/simple;
	bh=rw9vLb9RYRj8M3mvezUe8aRku9MqswvgQST04yCb4Lw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=V1Wk5UADlRgM+x00yEQalDPpZyS1enePChbwG0M2r+hJyAWf+l/3agi1APIKcRoslzcsWNtScGpYp3T473KZuclxwleGJnlWPDc0lUpTMESKrJl4fb3OayHse8KbCDWvFHNoSenAJC4Gh2k52CJNdBWS1gzcXKV0eS5Bc8SNl/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64A77430BF
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 09:10:12 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Subject: [BlueZ v3 0/9] Port text docs to RST and move man pages
Date: Thu, 22 Jan 2026 10:04:59 +0100
Message-ID: <20260122091003.398400-1-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeehjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpefgfeeujeefveffgeevkeduieefueejgfegtddtkedtgfevgfekgeetfeeglefhueenucffohhmrghinheprhhsthdrihhnnecukfhppedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfedphhgvlhhopeholhhimhhpihgtpdhmrghilhhfrhhomhephhgruggvshhssehhrgguvghsshdrnhgvthdpqhhiugepieegteejjeegfedtuefhpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdhorhhg
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
	TAGGED_FROM(0.00)[bounces-18315-lists,linux-bluetooth=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 0E61B64675
X-Rspamd-Action: no action

This supersedes the "Port text docs to RST" patchset

Changes since v2:
- Move all man pages under doc/ so make it easier to reference
  in the HTML docs.
- Fix syntax error in maintainer-guidelines
Changes since v1:
- Fix distcheck

Bastien Nocera (9):
  doc: Rename section 7 man pages
  doc: Move all the man pages to doc/
  doc: Port assigned-numbers.txt to RST
  doc: Port thermometer-api.txt to RST
  doc: Port security-bugs.txt to RST
  doc: Port coding-style.txt to RST
  doc: Port sap-api.txt to RST
  doc: Port maintainer-guidelines.txt to RST
  doc: Port health-api.txt to RST

 Makefile.am                                   |  41 +-
 Makefile.mesh                                 |   4 +-
 Makefile.tools                                |  68 ++--
 configure.ac                                  |   4 +-
 doc/assigned-numbers.rst                      |  29 ++
 doc/assigned-numbers.txt                      |  26 --
 {tools => doc}/bdaddr.rst                     |   0
 {mesh => doc}/bluetooth-meshd.rst.in          |   0
 {client => doc}/bluetoothctl-admin.rst        |   0
 {client => doc}/bluetoothctl-advertise.rst    |   0
 {client => doc}/bluetoothctl-assistant.rst    |   0
 {client => doc}/bluetoothctl-bredr.rst        |   0
 {client => doc}/bluetoothctl-endpoint.rst     |   0
 {client => doc}/bluetoothctl-gatt.rst         |   0
 {client => doc}/bluetoothctl-hci.rst          |   0
 {client => doc}/bluetoothctl-le.rst           |   0
 {client => doc}/bluetoothctl-mgmt.rst         |   0
 {client => doc}/bluetoothctl-monitor.rst      |   0
 {client => doc}/bluetoothctl-player.rst       |   0
 {client => doc}/bluetoothctl-scan.rst         |   0
 {client => doc}/bluetoothctl-telephony.rst    |   0
 {client => doc}/bluetoothctl-transport.rst    |   0
 {client => doc}/bluetoothctl.rst              |   0
 {src => doc}/bluetoothd.rst.in                |   0
 {tools => doc}/btattach.rst                   |   0
 {tools => doc}/btmgmt.rst                     |   0
 {monitor => doc}/btmon.rst                    |   0
 {tools => doc}/ciptool.rst                    |   0
 doc/coding-style.rst                          | 349 ++++++++++++++++++
 doc/coding-style.txt                          | 279 --------------
 doc/{hci.rst => hci-protocol.rst}             |   0
 {tools => doc}/hciattach.rst                  |   0
 {tools => doc}/hciconfig.rst                  |   0
 {tools => doc}/hcidump.rst                    |   0
 {tools => doc}/hcitool.rst                    |   0
 doc/health-api.txt                            | 152 --------
 {tools => doc}/hid2hci.rst                    |   0
 doc/{iso.rst => iso-protocol.rst}             |   0
 {tools => doc}/isotest.rst                    |   0
 doc/{l2cap.rst => l2cap-protocol.rst}         |   0
 {tools => doc}/l2ping.rst                     |   0
 ...idelines.txt => maintainer-guidelines.rst} |  62 ++--
 doc/{mgmt.rst => mgmt-protocol.rst}           |   0
 doc/org.bluez.HealthChannel.rst               |  72 ++++
 doc/org.bluez.HealthDevice.rst                |  94 +++++
 doc/org.bluez.HealthManager.rst               |  68 ++++
 doc/org.bluez.SimAccess.rst                   |  40 ++
 doc/org.bluez.Thermometer.rst                 |  51 +++
 doc/org.bluez.ThermometerManager.rst          |  64 ++++
 doc/org.bluez.ThermometerWatcher.rst          |  79 ++++
 {tools => doc}/rctest.rst                     |   0
 doc/rfcomm-protocol.rst                       | 212 +++++++++++
 doc/rfcomm.rst                                | 234 +++---------
 doc/sap-api.txt                               |  20 -
 doc/{sco.rst => sco-protocol.rst}             |   0
 {tools => doc}/sdptool.rst                    |   0
 doc/{security-bugs.txt => security-bugs.rst}  |   1 +
 doc/thermometer-api.txt                       | 134 -------
 tools/rfcomm.rst                              | 100 -----
 59 files changed, 1226 insertions(+), 957 deletions(-)
 create mode 100644 doc/assigned-numbers.rst
 delete mode 100644 doc/assigned-numbers.txt
 rename {tools => doc}/bdaddr.rst (100%)
 rename {mesh => doc}/bluetooth-meshd.rst.in (100%)
 rename {client => doc}/bluetoothctl-admin.rst (100%)
 rename {client => doc}/bluetoothctl-advertise.rst (100%)
 rename {client => doc}/bluetoothctl-assistant.rst (100%)
 rename {client => doc}/bluetoothctl-bredr.rst (100%)
 rename {client => doc}/bluetoothctl-endpoint.rst (100%)
 rename {client => doc}/bluetoothctl-gatt.rst (100%)
 rename {client => doc}/bluetoothctl-hci.rst (100%)
 rename {client => doc}/bluetoothctl-le.rst (100%)
 rename {client => doc}/bluetoothctl-mgmt.rst (100%)
 rename {client => doc}/bluetoothctl-monitor.rst (100%)
 rename {client => doc}/bluetoothctl-player.rst (100%)
 rename {client => doc}/bluetoothctl-scan.rst (100%)
 rename {client => doc}/bluetoothctl-telephony.rst (100%)
 rename {client => doc}/bluetoothctl-transport.rst (100%)
 rename {client => doc}/bluetoothctl.rst (100%)
 rename {src => doc}/bluetoothd.rst.in (100%)
 rename {tools => doc}/btattach.rst (100%)
 rename {tools => doc}/btmgmt.rst (100%)
 rename {monitor => doc}/btmon.rst (100%)
 rename {tools => doc}/ciptool.rst (100%)
 create mode 100644 doc/coding-style.rst
 delete mode 100644 doc/coding-style.txt
 rename doc/{hci.rst => hci-protocol.rst} (100%)
 rename {tools => doc}/hciattach.rst (100%)
 rename {tools => doc}/hciconfig.rst (100%)
 rename {tools => doc}/hcidump.rst (100%)
 rename {tools => doc}/hcitool.rst (100%)
 delete mode 100644 doc/health-api.txt
 rename {tools => doc}/hid2hci.rst (100%)
 rename doc/{iso.rst => iso-protocol.rst} (100%)
 rename {tools => doc}/isotest.rst (100%)
 rename doc/{l2cap.rst => l2cap-protocol.rst} (100%)
 rename {tools => doc}/l2ping.rst (100%)
 rename doc/{maintainer-guidelines.txt => maintainer-guidelines.rst} (65%)
 rename doc/{mgmt.rst => mgmt-protocol.rst} (100%)
 create mode 100644 doc/org.bluez.HealthChannel.rst
 create mode 100644 doc/org.bluez.HealthDevice.rst
 create mode 100644 doc/org.bluez.HealthManager.rst
 create mode 100644 doc/org.bluez.SimAccess.rst
 create mode 100644 doc/org.bluez.Thermometer.rst
 create mode 100644 doc/org.bluez.ThermometerManager.rst
 create mode 100644 doc/org.bluez.ThermometerWatcher.rst
 rename {tools => doc}/rctest.rst (100%)
 create mode 100644 doc/rfcomm-protocol.rst
 delete mode 100644 doc/sap-api.txt
 rename doc/{sco.rst => sco-protocol.rst} (100%)
 rename {tools => doc}/sdptool.rst (100%)
 rename doc/{security-bugs.txt => security-bugs.rst} (99%)
 delete mode 100644 doc/thermometer-api.txt
 delete mode 100644 tools/rfcomm.rst

-- 
2.52.0


