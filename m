Return-Path: <linux-bluetooth+bounces-19013-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CRlAnfRjmnJFAEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19013-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 08:23:35 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 516C61337EA
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 08:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F14E93039806
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 07:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93A52D5950;
	Fri, 13 Feb 2026 07:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaoYk5xq"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C162C3768
	for <linux-bluetooth@vger.kernel.org>; Fri, 13 Feb 2026 07:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770967359; cv=none; b=n+LohMSHqG6ziOBAOrMqY1zENP8W9SdEMaB1wu3hjUptbMGd+nzJ6NgiBHal5HNqGSKqqgslBazNQZzit7NfDu8gODtLcW/F3LYCDvXxpzKtq+heM9ntom7tzHbeR6G6/sZYp1bVY9fUfhRPoBbg9v+ZD1hzii25fqQiRv+rYlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770967359; c=relaxed/simple;
	bh=LSYFkz0UrOYAmwgkQWvg5id8QdlFKf3BK68u5Xx8e2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VLdRMSXTssNgnomUtRNP3o+bP8Wwd0lbgYAm7ncvmdZa9AOvkAhCEVFlnKKFqgEIFvexlJGf7cILcj05iET3qEi57oTUoKQRYCzPa3xn72uRDqp68NfQU0wn972JFPVlD4eWvYv+C1bePULZWaWHFuHLrL00+c1KIfyzdANjcfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaoYk5xq; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b4520f6b32so781126eec.0
        for <linux-bluetooth@vger.kernel.org>; Thu, 12 Feb 2026 23:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770967357; x=1771572157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fiCbh2V+lOmkwVu8CiLzDS6uSCAV7WhBVlxztbyz1pI=;
        b=DaoYk5xqkP7/w4vfPaR8ZCHq3058kThbaT0Y2Vto0NCLEXQzaNQo3cIX2NUKSTBs4L
         GMU3f2nmLsahoY8PV/5ZLSE0wvDrIx4QSu8Wmt9FsmPQa0dufRfExfjVSRxuqg//ejjk
         JDHZLo9FGo9MsSh0arO6ILS+NHgfMufWxQgRHKKL1gI++3BUiWv5osyE5jvMu8wTW5Oj
         EJpJXEHtqCTRoeVZ9HZ2jTknzOXTP5o9crEQzAfeT/yynZt0eiOyJoZ4/GN18CQ9Jd60
         an3Mhfe7M+Shvt6VMd4BIodD5pNZAzve6oszdOk9E+WGsOTySbJ1rESfXteyjF3HR3AN
         3RNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770967357; x=1771572157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiCbh2V+lOmkwVu8CiLzDS6uSCAV7WhBVlxztbyz1pI=;
        b=cYSlVegmnCO84zwaj0MGPDxYfGRToWMycUTQc1D65dkekWmjjjjrQS/NGu365QfTTF
         v/oNSEI77zKnDr1xnMNTxgtiSLfl01mVrHNPj7MB54BNAbfGMxKALGtj83f5uLxLD/pA
         hgjveGqwug37ZFFRL2c8ItoQPoGnVkpcHsqLqHWE8iDbf4TgKzPCrAB0XPumnpja0ptG
         rwIBcb+VPozm3hZ366kYHi68/ZKl5ydIZ0PkE7r34Z9CSxpXcxg8HLVuAWm8+fpU21cX
         ZqSdUnUw/499Kte46XpdceSyYaHJatEncPH2OQjSXsyU2+VvZjdbo9RLD2MFldzKLOqJ
         6G9A==
X-Gm-Message-State: AOJu0Yx/g/DEF0NCrGtHq3/ZgVORxbmsvTD7TkKjURvGoMqwerjauOqS
	wcLHgyhFmA8fb4Ag9c6YW8nsxrBQWjQr8A4nW/ZytXrWBrHbTev1zBn2E5/1sA==
X-Gm-Gg: AZuq6aJpy3mzAMPtkTM6WWnpgV0UsHUrpLrLtSHjXomuWLjQGVFDqlL8BzRugwREO2+
	XX3tvjOZ71wf6v+zxi4XoFfJRBAgx0Le8r4jk/5Z53vGOk+NvpHY3ZW1QhjEXVF47KRcE3uvQx9
	Tsz7UlnkQIpoWhixCc+VPFFxCMy+hy5JIupgH7b4OA6ugWI3A/BP0hMORYNOj5mGMy245tq7SQj
	TogQyk+R5xk8zj5jGIor/y4ocqwUk8AMCglN88gXPDGnzIUSXtAofiRi0Ty5I3eiXm8bR0/+i7k
	Pwj8dR4KKYUAfYyZoqayIq2BkR4/Zovy7b8DBj1IYHlGcFPWieN25A8tdpLHP0BF21+hjak5v/Q
	npDOUVfdKqlWOqsRtd1tyuxxVEjfShTOisYOgKLVGi/S+6sveiunPzbdgOHuKcK4JTucOq1Cicd
	IOItEDre9+Sl+51yqm2ESRCdAPn/HS9x0T/7i0RZiWWsfNR5tze7XreTbw9GaJ6/jvmW95T5GEe
	lW89tYVEg+rFx/dWcooI6T3G/uxr7CK2x9o
X-Received: by 2002:a05:7301:5792:b0:2ba:858b:3751 with SMTP id 5a478bee46e88-2babc3a977amr344411eec.3.1770967357418;
        Thu, 12 Feb 2026 23:22:37 -0800 (PST)
Received: from kernel.. ([45.232.185.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dcfe6b7sm5898148eec.29.2026.02.12.23.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 23:22:36 -0800 (PST)
From: Maiquel Paiva <maiquelpaiva@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: luiz.dentz@gmail.com,
	gregkh@linuxfoundation.org,
	marcel@holtmann.org,
	stable@vger.kernel.org,
	Maiquel Paiva <maiquelpaiva@gmail.com>
Subject: [PATCH v8 0/1] Bluetooth: mgmt: Fix heap overflow and race condition
Date: Fri, 13 Feb 2026 07:22:04 +0000
Message-ID: <20260213072205.18404-1-maiquelpaiva@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,holtmann.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-19013-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maiquelpaiva@gmail.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,test.bot:url]
X-Rspamd-Queue-Id: 516C61337EA
X-Rspamd-Action: no action

This patch addresses two vulnerabilities in mesh handling within mgmt_util.c:
a heap buffer overflow and race conditions during list traversal.

The fixes have been consolidated into a single patch to ensure atomic
application and to follow maintainer feedback regarding the use of 
existing mutexes.

Changes in v8:
- Rebased against the latest bluetooth-fixes/master to resolve the 
  merge conflict at line 413 reported by bluez.test.bot.
- No functional changes since v7.

Changes in v5-v7:
- Combined heap overflow and race condition fixes into one patch.
- Switched to guard(mutex) using 'mgmt_pending_lock' instead of a 
  spinlock, as requested by maintainers.
- Resolved minor style and alignment issues.

Maiquel Paiva (1):
  Bluetooth: mgmt: Fix heap overflow and race condition in mesh handling

 net/bluetooth/mgmt_util.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.43.0


