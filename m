Return-Path: <linux-bluetooth+bounces-6098-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 341C292D40C
	for <lists+linux-bluetooth@lfdr.de>; Wed, 10 Jul 2024 16:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66CD91C21547
	for <lists+linux-bluetooth@lfdr.de>; Wed, 10 Jul 2024 14:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BACD193451;
	Wed, 10 Jul 2024 14:17:28 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7867D193464
	for <linux-bluetooth@vger.kernel.org>; Wed, 10 Jul 2024 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720621048; cv=none; b=szgDO65XBNZ5Kt/6izryVscHXyFFEPlb7dxeKi+y7wul36uPtqahpIyfDr11BHOhzji7DF2/mvoJtAjyNKxplzhsJ0d2+hKrMb5rhXhWfhqiA84TclXxEmBjmPo090Wife0Y3gBjiAjX6UULoNshTj8VCfwlos83au2oEK1ZiS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720621048; c=relaxed/simple;
	bh=lbw2WXsXRPsNT/bVt3lXhVCgOtg+RehsBWVnvkYM8Ns=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X8Oueecvi1PxvGC9sIBH3yTqLkMfnkba5Grw3xO8Tw6zlp3QmEywMmP7QLGzSnmIuEYx3jpvihm6sAgTHQlg72TaVFDyxgHgz4LA0+7KzwN+5Ai81+dssPQPgpE6l9dT71G366ujbAk7aN46q5z5Zc6/oR1a/fkuKXKWnQG36oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from localhost.localdomain (178.205.55.202) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 10 Jul
 2024 17:16:39 +0300
From: Roman Smirnov <r.smirnov@omp.ru>
To: <linux-bluetooth@vger.kernel.org>
CC: Roman Smirnov <r.smirnov@omp.ru>
Subject: [PATCH BlueZ v3 resend 5/6] player: fix the order of args in cmd_register_endpoint()
Date: Wed, 10 Jul 2024 17:16:18 +0300
Message-ID: <20240710141621.64394-6-r.smirnov@omp.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710141621.64394-1-r.smirnov@omp.ru>
References: <20240710141621.64394-1-r.smirnov@omp.ru>
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
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 07/10/2024 13:54:49
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 186438 [Jul 10 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: r.smirnov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 24 0.3.24
 186c4d603b899ccfd4883d230c53f273b80e467f
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.205.55.202
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 07/10/2024 14:00:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 7/10/2024 12:34:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

Based on the function prototype, ep->cid and ep->vid should be swapped.

Found with the SVACE static analysis tool.
---
 V1 -> V3: the patch name has been shortened
 client/player.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/client/player.c b/client/player.c
index de4491b53..2480ed64b 100644
--- a/client/player.c
+++ b/client/player.c
@@ -3388,7 +3388,7 @@ static void cmd_register_endpoint(int argc, char *argv[])
 
 	if (strrchr(argv[2], ':')) {
 		ep->codec = 0xff;
-		parse_vendor_codec(argv[2], &ep->cid, &ep->vid);
+		parse_vendor_codec(argv[2], &ep->vid, &ep->cid);
 		ep->preset = new0(struct preset, 1);
 		ep->preset->custom.name = strdup("custom");
 		ep->preset->default_preset = &ep->preset->custom;
-- 
2.43.0


