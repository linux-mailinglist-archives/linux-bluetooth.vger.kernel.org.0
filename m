Return-Path: <linux-bluetooth+bounces-18859-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dXG0FoZGiGnhmwQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18859-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sun, 08 Feb 2026 09:17:10 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F29108155
	for <lists+linux-bluetooth@lfdr.de>; Sun, 08 Feb 2026 09:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BA1C300CFEC
	for <lists+linux-bluetooth@lfdr.de>; Sun,  8 Feb 2026 08:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2BA33ADB8;
	Sun,  8 Feb 2026 08:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m164v9q6"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8802836B1
	for <linux-bluetooth@vger.kernel.org>; Sun,  8 Feb 2026 08:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770538624; cv=none; b=b2neiDSDyGEFftIriCrH4A5kgA7tWJF2yq6aiMAIqQCGePQsNnF/xAXb/FqK79EuGNeezaNHzgx5cE80boSGi8ougTCl0KffZWFZgjNPK3f+XyGS5eyaBEL/4sNDDVAbzd+Kw1FEnB+3oS4BuemP44wogVY+37AxYuR5PDaWXBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770538624; c=relaxed/simple;
	bh=2F0eTEsUsPogrrtWldAvIMPzTANo+7xsrnfLzY4YkRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JN6N4ITncT3AANOkLWXZko2BI94IiDYMaVjOBz4XQI4pmW5HD3sflcL09AoNdDeXRp5Kq4sdkiFQNJhkpD0Rq4HgaGdNNt1V8uRzjbwwOpcp2IrzaExJl0ha8OZBgMnygSULfn9LeEG/Mxh6y+vRuSYe7j8S8eiHk5GIVc8iQFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m164v9q6; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-649278a69c5so2912940d50.3
        for <linux-bluetooth@vger.kernel.org>; Sun, 08 Feb 2026 00:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770538623; x=1771143423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YYmyZ4dAbcgt20eJDm1830mz9l003fdJMi+pDwnX9c0=;
        b=m164v9q6svA9zeE0t7wctGU5/ErBTSY12fK+TD7krzRT78O039Z0pyWye6LGup0ASn
         6q3zU0nrefM3TVMde9r7rtZHfbV55XxyFOWCuRrVnQXRhETPD/t+SZmM6rYzmhQSmNtv
         Y1OrS1KUMFZypYrGgH+twNI0d4pyF9HSM6tb0YhCcBPJPFSLSGAhinVg02qcgmWSPPYE
         e8KDylkIZuLw2ZuNPa2GaBs3sQlrjv5JE/KCp2kAsc8JZwef27S1sKf8QW/RmdG/AOba
         3J4yZjwhL82a7Ci/NPcH/Ws9BGFcKmNupOiHxjCEUHkOelmmSkmZGRA3aAggIl7qIHMM
         A21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770538623; x=1771143423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYmyZ4dAbcgt20eJDm1830mz9l003fdJMi+pDwnX9c0=;
        b=KOcgb5uIeeAlz0JIbyDKAmogGn8RGcMIsF9mHYcg1jxorU+TAAMAwObTVjxWbFpaws
         ufqYN6cpbUtMjWZq0YSouLdpEyvJf/RsOQDWxHbHwNiJYTiuYdL8KJTVp0AXvHW474C1
         CWUtlkWemNiFpzYcTHgQexPsOKB5cmNQZDf72w5IbzDhMGUkxDfsA2NdKuLo4hpqTajz
         XTfolPCDeVGPojlhSbTGbY+ArQOh3cs5g1gVSRA2AhnyrkY3ybl1L7Qqo8UbznfoBBPb
         HLFqAW5OZ3kp4NvcRwDnMBrHAfrU4sNJMy1prgElsqZLx30LfIx+K3+sOh+bOvMDIR0H
         nOuA==
X-Gm-Message-State: AOJu0YwvD+lmK0/nAQL5DFQ5bJHuJHQ8cz5H/XplLl6qMUt7BGporNVX
	FYurNLig2+2mXN41zVCzDFidFf9ReIhKXSRE09co70+Lz8G0LX9lpMtv7zGCvA==
X-Gm-Gg: AZuq6aJCfHar2JNt3xkzZPFM3xk4f0ESPTmJZXCihl2HaKcCaoMviXmAELJ4WUbTaGL
	jj8nf0WpC5/83bkCMDV0nd7TgsmnfpRY/GC9ItEPgNEkpgoSjTFyQdmK1PUNbtD6aqCsBDWAupj
	nKRe5XQFbX8YNpK0nYKGrEULHudl1z2o1vDC52/vnUlJ45B+SM8cFA/eRe7eb1TJA3DeGsP/mIF
	++6K3IyAhluR0AXnUNoyivreVdUxg/W9QdsNwcWlwe1xCapAD483R0g6XzTHPZMabo1+32NIgEA
	OsxeWv42DY9WKvalFw7VUivnFY84F/II11wWeF9IXdcnqAKiWyTuQEHb3ALcaiI1Ovz6/AAW0nU
	uIEXrndb87bqvDZnRgdWFn7W+fRh7rEBefjv825ZVsIkfAxMOb6AzlfV2cBQbJc6fOomd3dOGG9
	gLiBUdcTQ9wzhNvfmMajhATcOKAQ2Nxg0UIP6rKDA/HyqF01THZzmhqjzRzPUk4i521RW6
X-Received: by 2002:a05:690e:4085:b0:64a:db22:1cef with SMTP id 956f58d0204a3-64adb221f23mr1870371d50.42.1770538623207;
        Sun, 08 Feb 2026 00:17:03 -0800 (PST)
Received: from binary.. ([177.39.58.68])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64ad8a12432sm3521745d50.21.2026.02.08.00.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 00:17:02 -0800 (PST)
From: Maiquel Paiva <maiquelpaiva@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: luiz.dentz@gmail.com,
	gregkh@linuxfoundation.org,
	marcel@holtmann.org,
	Maiquel Paiva <maiquelpaiva@gmail.com>
Subject: [PATCH v4 0/2] Bluetooth: mgmt: Fix heap overflow and race condition
Date: Sun,  8 Feb 2026 08:15:57 +0000
Message-ID: <20260208081559.44983-1-maiquelpaiva@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,holtmann.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-18859-lists,linux-bluetooth=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maiquelpaiva@gmail.com,linux-bluetooth@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: A1F29108155
X-Rspamd-Action: no action

This series fixes two vulnerabilities found in net/bluetooth/mgmt_util.c related to mesh handling.

Patch 1 addresses a heap buffer overflow in mgmt_mesh_add by validating the user-provided length.
Patch 2 resolves race conditions in mgmt_mesh_add and mgmt_mesh_find by protecting the list operations.

Changes in v4:
- Replaced guard(mutex) with guard(spinlock) using hdev->lock in Patch 2.
- This fixes the "sleeping function called from invalid context" and circular locking warnings reported by the CI robot in v3.

Changes in v3:
- Added Fixes and Cc: stable tags as requested by maintainers.
- No code changes from v2.

Maiquel Paiva (2):
  Bluetooth: mgmt: Fix heap overflow in mgmt_mesh_add
  Bluetooth: mgmt: Fix race conditions in mesh handling

 net/bluetooth/mgmt_util.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.43.0


