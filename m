Return-Path: <linux-bluetooth+bounces-18345-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Fz+OOGDcmkrlwAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18345-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 21:09:05 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 520916D58E
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 21:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62D013037887
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 20:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1130B3803EC;
	Thu, 22 Jan 2026 20:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHJY1WkT"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAA1330B2C
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 20:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769112497; cv=none; b=YF0BPzoYHuZErHPcIqjdXc3MiWRMFtV4Q19QhcfrsBfIX9yHnbDpgPGjnryj0OjadKfnkO29i74OqijwRCUYsWTaIrOB5K27oJNR+9MCSHMd6nPCI2hjJ2E42JtiVVoBM37klPN+m7vGjn+vePcTKLJ4+kPx7G7UIdFbjSwvDo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769112497; c=relaxed/simple;
	bh=wm/RHjuswNCwmBvnkmo+iGq3fd3NCN9KTPdUzB6kpX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wv6z65GK/YcaoynhZkb9ms9lAzGXtI5nwhXpREllzb8o5qgeUl0mEzpkKIARNiXdeiL9TlB3xfXIvYggRkZ8uC9AKI20fuDaWorxc02CvNw5LcPoCKhG3fwKF83Y2wIhiBngHYzy/UbB8v8K7c7bu5ySD2MM+MZwffrsDXU15yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHJY1WkT; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78fc174ada4so11932197b3.2
        for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 12:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769112482; x=1769717282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zP48DsrAV6yhVQzMKRTRKuibNQZ+iRXBgot6LlmaTJc=;
        b=WHJY1WkTOKsBPQdh20jfhb19N1pTQKzxgS/KvL+Y51EgbSS1uZNk2Y6gJ8lx/v92yY
         rXcij9YJD/pqOCpQx7h+Q3B0TzWJKgbq1yPe0OzKXmU1iB8P4v+g8FAsXl+4mChDczU3
         fkoTLF0V2fmwyDaB5t7/7m/4Y2g4rZP1jxp4163bKF0gxCvQ0gVV8IA3XCcjTx2uhuEL
         X+wIN3dApeJgMMknDHYyX4rJ+sX+JCg/aP2221fJoiXArsg3OOiKu+w+EIh9uejzzRmf
         5VAsJyLg/eljuz4qSF9AlipgXwCJAXP9JcZyROJn2/Vh/rK/o/hJ72hvDRLBHFgr9CYf
         sKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769112482; x=1769717282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zP48DsrAV6yhVQzMKRTRKuibNQZ+iRXBgot6LlmaTJc=;
        b=dH75BW8WvyUwAV/YaPdBKRI3ewbuzGRsISt/MDlpoAsxlhuclW9hy+ThvAxmqFUyTI
         XGMDmvfu+iO4EiRT2h+7BNKcgrOKA+uBkNzy+QfHN91yLqQkZA3lrI76005lH9jRzstQ
         V95+Ze67ob6vc0ywgo1yLysZ/cQitI2sX+HM02MyxITDxzSiYOWQkWe38OMzi7axb3aX
         yAecDWCdmtdAW8aUqyET1Z8lMtDzUHzCHtvHnR64zFO5aX/dGeTvwsWPvy+I1x7q96LX
         CFR72wGdH4AmZbsW42qwhlCZRnK70r8r4yLJgJWxj6GY4wXwpZcdkOGxWPg8FZz1LTcV
         Izsg==
X-Gm-Message-State: AOJu0Yzmp+NbUvJFfFoljBNuHI+ZFbJHFQ7Upd8ozu69TeX49aIwW9c6
	Lbw+k/W/Et2G5HWPQkmvH6AXDgLQJt6Ied6SqzXxeR+Tx7q/8qRbPysv
X-Gm-Gg: AZuq6aLjBZ4GDCQiFgnCgMF9f2tVSHqKw/dJNABisNCvGVHjGZmzewAzvqXNSzeXoDO
	fIbteFeyGvE6urO2O1GNYfHWgg0UMiNpygCYDV0IIL91VG/JyVi013E0qZmaRd7Gm9zKoxFruEh
	+ECEmFDq/G3gV4AkaRMf6JZjfZBuI0C8GG1xtgA6swbJ79O/WsfMullMX5ZJoWc3RXuncJ5sxAP
	hbJ7Jf25CzKbTvCZ4srE2Xuxnc1UdIvGKoEqxXvm6iMqlkVGt+NF+svu+5rf4zAdl5ry3E8oC/5
	MML2aGhNnRbJPFtJnJgDqpBehyBvmTEM5rMLJbXuA4+KqGL1VrRzuW/gXfRrhvcviC44TLyTGC7
	yrOLaPSh9prCdrx5wJfA5nj7oYLLIHa7M5c/U/lWxddD/N5tvFjwlpDYpIu38HBgW7X4nzP82fO
	rCe4rf/L9ZNAyGgQX2flLKEwfyyQWXI2wzoyZ+xhM8FB/1aEQi90oem34hWFpy9BAq2t3Kq9pcP
	kjsk2LcZfzfQsjW
X-Received: by 2002:a05:690c:9:b0:793:8eec:3a7a with SMTP id 00721157ae682-794398eefaamr8131917b3.29.1769112481914;
        Thu, 22 Jan 2026 12:08:01 -0800 (PST)
Received: from lvondent-mobl5 ([72.188.211.115])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7943af14432sm1004227b3.8.2026.01.22.12.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 12:08:01 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org
Cc: linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [GIT PULL] bluetooth 2026-01-22
Date: Thu, 22 Jan 2026 15:07:51 -0500
Message-ID: <20260122200751.2950279-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18345-lists,linux-bluetooth=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 520916D58E
X-Rspamd-Action: no action

The following changes since commit 4a3dba48188208e4f66822800e042686784d29d1:

  Octeontx2-af: Add proper checks for fwdata (2026-01-22 08:09:00 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git tags/for-net-2026-01-22

for you to fetch changes up to 1b9c17fd0a7fdcbe69ec5d6fe8e50bc5ed7f01f2:

  Bluetooth: MGMT: Fix memory leak in set_ssp_complete (2026-01-22 13:26:53 -0500)

----------------------------------------------------------------
bluetooth pull request for net:

 - hci_uart: fix null-ptr-deref in hci_uart_write_work
 - MGMT: Fix memory leak in set_ssp_complete

----------------------------------------------------------------
Jia-Hong Su (1):
      Bluetooth: hci_uart: fix null-ptr-deref in hci_uart_write_work

Jianpeng Chang (1):
      Bluetooth: MGMT: Fix memory leak in set_ssp_complete

 drivers/bluetooth/hci_ldisc.c | 4 ++--
 net/bluetooth/mgmt.c          | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

