Return-Path: <linux-bluetooth+bounces-17905-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE44D083F2
	for <lists+linux-bluetooth@lfdr.de>; Fri, 09 Jan 2026 10:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CDBA2302569B
	for <lists+linux-bluetooth@lfdr.de>; Fri,  9 Jan 2026 09:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1693596FD;
	Fri,  9 Jan 2026 09:36:16 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A193596FB
	for <linux-bluetooth@vger.kernel.org>; Fri,  9 Jan 2026 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767951376; cv=none; b=nr7MEdi0d5gtqjs3xY29+am5XnN4iuywHhE2ivlgVYyDONh5KGzwNMHHvrsb5d3nFyfStM2bKRAT5ej+zD01uWgHFbEEhdza2o/r/ghCNVfPswZcncMwPM/wtg/jNlPrOt3nz5HTkzul2zQOpGaTVntF3fxtf5cd+RraR5QFr1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767951376; c=relaxed/simple;
	bh=t8CxN4ht7ZG6RoDUqjVRXk1u/lkRfdj6Ao6hP0Tay2M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=k6PWPpmPZFSb99MAyCjE+A7v1HDlq9LzB/Uvvd8UMaASl6c+09i1NuXrvpJdwaTM5ZbLBeQYpEXJM1wyscVzi2ZkV14VZgOQhfep3huvp6S9OlLMI5RXlT4ywfrOAfus99CMh6YCIE8ChzCfr5/6Hd1sIpFw8AmVcfY/6cu3qQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3372341CFA
	for <linux-bluetooth@vger.kernel.org>; Fri,  9 Jan 2026 09:36:11 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Subject: [BlueZ PATCH v1 0/3] Unit tests speed-up
Date: Fri,  9 Jan 2026 10:28:59 +0100
Message-ID: <20260109093602.1224918-1-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdekgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeffleeuffejvdeufeffvdejjedvheekgfeltdejhfeitdettefgjedvuedvhfejueenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeeffeejvdefgeduvefhtedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqsghluhgvthhoohhthhesvhhgvghrrdhkvghrnhgvlhdrohhrgh

With those small changes, as well as running tests concurrently using
meson, I was able to make the whole test suite run in less than 4
seconds on my desktop system, with a baseline of 50 seconds for "make
-j8 check" under the autotools.

make -j8 check: 50 seconds
meson before changes: 13 seconds
meson after changes: 3.6 seconds

Bastien Nocera (3):
  unit: Speed up unit-avdtp test
  unit: Speed up unit-gobex-transfer test
  unit: Speed up unit-ringbuf test

 unit/test-avdtp.c          | 2 +-
 unit/test-gobex-transfer.c | 2 +-
 unit/test-ringbuf.c        | 3 ---
 3 files changed, 2 insertions(+), 5 deletions(-)

-- 
2.52.0


