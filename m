Return-Path: <linux-bluetooth+bounces-13680-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BCCAFC42C
	for <lists+linux-bluetooth@lfdr.de>; Tue,  8 Jul 2025 09:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4F1D1786EB
	for <lists+linux-bluetooth@lfdr.de>; Tue,  8 Jul 2025 07:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059D6298CA7;
	Tue,  8 Jul 2025 07:35:35 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA13429898B
	for <linux-bluetooth@vger.kernel.org>; Tue,  8 Jul 2025 07:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751960134; cv=none; b=IlBYsl5KpTvjhgcHMQQSA5kKkJzHN+4xWU9rhdElrUdnKNrMQ7px3ZutTSO0GvoKUyrJWbMOlcc2boaEZns8LU8rigYjXUXxHTFiInBRoG6Qi4RkLXLkj8lgDMRDKK/RuniCzj4RQF1zuT0k9o1xxMTZjAmXpGAWNnXVzuy35kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751960134; c=relaxed/simple;
	bh=8b9O2g/fKZh/97gHFBzf03g/mLI7u459pLQHKAD1tEg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qHwPriCVLsulJNu/95WUy+qwVj3chGhzf8xV68GtbTZqPEuVB6WfzJ6typ0uKId6Cmncg2rVINfkd3saMYiyvCiWfxikSF2ofbZYA9g2BQzJKJ/Z1c03wy3YdGK4swlxv5ILHWYylbciM9J12V6mBz9u269v7tQFcLOJxOUeRq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from inp1wst013.omp.ru (81.22.207.138) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 8 Jul
 2025 10:35:18 +0300
From: Ismagil Iskakov <i.iskakov@omp.ru>
To: <linux-bluetooth@vger.kernel.org>
CC: Ismagil Iskakov <i.iskakov@omp.ru>
Subject: [PATCH BlueZ 00/11] Fix bugs found by static analysis
Date: Tue, 8 Jul 2025 10:33:23 +0300
Message-ID: <20250708073334.2393559-1-i.iskakov@omp.ru>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 07/08/2025 07:11:13
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 194600 [Jul 08 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: i.iskakov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 63 0.3.63
 9cc2b4b18bf16653fda093d2c494e542ac094a39
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 81.22.207.138 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;inp1wst013.omp.ru:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1;81.22.207.138:7.1.2
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 81.22.207.138
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 07/08/2025 07:12:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 7/8/2025 5:27:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

This patch corrects some of the bugs not connected
to the functionality but to memory management etc.
Two exceptions being about fixing the arguments
order, which also could've caused some trouble.

Ismagil Iskakov (11):
  btio: fix range validation of security level
  profiles/audio: add nullity checks
  src/shared: add nullity checks
  isotest: close fd after sending when nconn=1
  obexd/client: fix err condition causing memleak
  profiles/audio: fix memleak of bt_bap
  src/shared: fix memleak
  src/shared: move null checks before dereferencing
  isotest: remove repeating conditions
  profiles/audio: fix io_unlink args order
  src/plugin: fix args order

 btio/btio.c                |  2 +-
 obexd/client/transfer.c    |  2 +-
 profiles/audio/a2dp.c      | 45 +++++++++++++++++++++++++++++---------
 profiles/audio/avrcp.c     | 24 +++++++++++++++++---
 profiles/audio/bap.c       | 23 +++++++++----------
 profiles/audio/bass.c      |  7 +++++-
 profiles/audio/transport.c |  2 +-
 src/plugin.c               |  2 +-
 src/shared/bap.c           | 42 ++++++++++++++++++++++++++++-------
 src/shared/gatt-db.c       |  5 ++++-
 src/shared/vcp.c           |  3 +++
 tools/isotest.c            |  8 ++++---
 12 files changed, 124 insertions(+), 41 deletions(-)

-- 
2.34.1


