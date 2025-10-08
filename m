Return-Path: <linux-bluetooth+bounces-15729-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F45BC47AA
	for <lists+linux-bluetooth@lfdr.de>; Wed, 08 Oct 2025 13:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A7CE3B043D
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Oct 2025 11:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B32D2F618F;
	Wed,  8 Oct 2025 11:00:00 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082162F5A20
	for <linux-bluetooth@vger.kernel.org>; Wed,  8 Oct 2025 10:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759921199; cv=none; b=DYjWL5zyNBAksubrAacTqxmNMfGPLf4j1drMdtZN1JY2YQLwW6WXA88bw6QyHM3q+adA9UFrtfXYtizKVmu9w65B4bZoYjC8IkzKN/kzfVTI2euLR9wJSqCDUR4jcBmE10pvYxQBA5r7+fSbWr9NvnMrDAnXc+274FDWmmnsiqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759921199; c=relaxed/simple;
	bh=3g5tsTsxaeS44gs+2fAphc3J6aIL8hSv3JcO6c6SBh8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=e26eV4z7DjthoTl56Cv0SQuk8Gfz4N05dm+wPTNsyRU+dfIC9y9Gts/dy9GGD7Uq1nEA5hTa3MUTewtdhFNGR5kHldM3YW0Umkjw9uOK6awegTKn6lvoMP4V7+gY4wr3oRvXG7VcNygaPHaj3q1ZqO/Dz47Hmfoog7kv/yyYHgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 89453582DC9
	for <linux-bluetooth@vger.kernel.org>; Wed,  8 Oct 2025 10:41:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF37143B0B
	for <linux-bluetooth@vger.kernel.org>; Wed,  8 Oct 2025 10:41:40 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v3 00/10] build: Add meson build system
Date: Wed,  8 Oct 2025 12:40:15 +0200
Message-ID: <20251008104132.2206963-1-hadess@hadess.net>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net

Changes since v2:
- Fixed the 2 FIXMEs
- Note that the last patch should not be applied right now, meson 1.9.0
  is not widely available, but that's a necessary patch to restore
  parity with the autotools output

Changes since v1:
- A couple of bug fixes in the base patch (and we found a few bugs
  in the upstream code along the way)
- Added the option to disable bluetoothd build
- The ell subproject was replaced by a Meson Wrap, this means that
  tarball builds of bluez would require either an internet connection
  or a system installation of ell.

This version does not rely on forks of upstream projects, so I would
consider this ready for merging.

Bastien Nocera (10):
  build: Add meson wrap for libell
  build: Add meson build system
  build: Make more use of 'feature' options
  build: Separate systemd and libsystemd dependencies
  tools: Install gatttool if deprecated tools are enabled
  tools: Install avinfo tool by default
  tools: Install btmgmt along with other tools
  emulator: Install the emulator if built
  build: Add option to allow disabling bluetoothd
  build: Add License field to pkg-config file

 attrib/meson.build                            |  17 +
 btio/meson.build                              |   1 +
 client/meson.build                            |  54 +
 completion/meson.build                        |   3 +
 doc/meson.build                               |  41 +
 emulator/meson.build                          |  36 +
 gdbus/meson.build                             |  19 +
 gobex/meson.build                             |   8 +
 lib/meson.build                               |  54 +
 mesh/meson.build                              |  75 ++
 meson.build                                   | 297 ++++++
 meson_options.txt                             |  53 +
 monitor/meson.build                           |  47 +
 obexd/meson.build                             | 121 +++
 peripheral/meson.build                        |  13 +
 plugins/meson.build                           |  29 +
 profiles/meson.build                          | 170 ++++
 src/meson.build                               | 103 ++
 src/shared/meson.build                        |  80 ++
 subprojects/ell.wrap                          |  11 +
 .../0001-build-Add-meson-build-system.patch   | 922 ++++++++++++++++++
 test/meson.build                              |  41 +
 tools/mesh/meson.build                        |  16 +
 tools/meson.build                             | 341 +++++++
 tools/mpris-proxy.service.in                  |   2 +-
 unit/meson.build                              | 114 +++
 26 files changed, 2667 insertions(+), 1 deletion(-)
 create mode 100644 attrib/meson.build
 create mode 100644 btio/meson.build
 create mode 100644 client/meson.build
 create mode 100644 completion/meson.build
 create mode 100644 doc/meson.build
 create mode 100644 emulator/meson.build
 create mode 100644 gdbus/meson.build
 create mode 100644 gobex/meson.build
 create mode 100644 lib/meson.build
 create mode 100644 mesh/meson.build
 create mode 100644 meson.build
 create mode 100644 meson_options.txt
 create mode 100644 monitor/meson.build
 create mode 100644 obexd/meson.build
 create mode 100644 peripheral/meson.build
 create mode 100644 plugins/meson.build
 create mode 100644 profiles/meson.build
 create mode 100644 src/meson.build
 create mode 100644 src/shared/meson.build
 create mode 100644 subprojects/ell.wrap
 create mode 100644 subprojects/packagefiles/0001-build-Add-meson-build-system.patch
 create mode 100644 test/meson.build
 create mode 100644 tools/mesh/meson.build
 create mode 100644 tools/meson.build
 create mode 100644 unit/meson.build

-- 
2.51.0


