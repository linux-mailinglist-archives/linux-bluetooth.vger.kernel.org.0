Return-Path: <linux-bluetooth+bounces-13715-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0EAAFC93A
	for <lists+linux-bluetooth@lfdr.de>; Tue,  8 Jul 2025 13:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFA5C1AA740F
	for <lists+linux-bluetooth@lfdr.de>; Tue,  8 Jul 2025 11:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102A22D979B;
	Tue,  8 Jul 2025 11:11:38 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036722D9795
	for <linux-bluetooth@vger.kernel.org>; Tue,  8 Jul 2025 11:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751973097; cv=none; b=hnXdcz/HO0u7EWTxJGhIs+fHlNbHdRPgn1Im70TLOlcwETr9zbF1CgnC92+ljsZOpJGsO1ChUsn72En7U+B0zVugDv2vl3jCcyX0KjN2ZRsCjO+BIVbWye5TQ0WCWCEEosbGtSfEjR94vTF+xYQrsucaPe8+czTVWSlR074XEnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751973097; c=relaxed/simple;
	bh=kImVzDKQ14AehRi1BFFqGwfVI7w2TZQNFt7JQE/0fog=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HezuF3hqXfOnzRLknL8d5dppS7aUZGZh9EJkf06CZ10g0blOGikzClniSFK0CXMtMOKAcRLwKTyetwgyODEiQmfsjY3iFvmFkW8ejuj5uCb7lT2B9kkDh+BJ1eQuV4y7Fn9U2sFUKiqprgfuFd9C4TE+q366APk+JnJhAvtuZuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from inp1wst013.omp.ru (81.22.207.138) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 8 Jul
 2025 14:11:22 +0300
From: Ismagil Iskakov <i.iskakov@omp.ru>
To: <linux-bluetooth@vger.kernel.org>
CC: Ismagil Iskakov <i.iskakov@omp.ru>
Subject: [PATCH BlueZ v2 10/11] profiles/audio: fix io_unlink args order
Date: Tue, 8 Jul 2025 14:09:08 +0300
Message-ID: <20250708110909.2626286-11-i.iskakov@omp.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708110909.2626286-1-i.iskakov@omp.ru>
References: <20250708110909.2626286-1-i.iskakov@omp.ru>
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
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 07/08/2025 10:58:06
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 194611 [Jul 08 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: i.iskakov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 63 0.3.63
 9cc2b4b18bf16653fda093d2c494e542ac094a39
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;inp1wst013.omp.ru:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1;81.22.207.138:7.1.2
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 81.22.207.138
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 07/08/2025 10:59:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 7/8/2025 7:58:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

Seems like a breaking bug. Analogous to bt_bap_stream_io_link,
but there the order is correct.
---
 profiles/audio/bass.c      | 2 +-
 profiles/audio/transport.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/profiles/audio/bass.c b/profiles/audio/bass.c
index f617efa2c..e1c05e05a 100644
--- a/profiles/audio/bass.c
+++ b/profiles/audio/bass.c
@@ -457,7 +457,7 @@ static void stream_unlink(void *data, void *user_data)
 	struct bt_bap_stream *link = data;
 	struct bt_bap_stream *stream = user_data;
 
-	bt_bap_stream_io_unlink(link, stream);
+	bt_bap_stream_io_unlink(stream, link);
 }
 
 static void bass_remove_bis(struct bass_setup *setup)
diff --git a/profiles/audio/transport.c b/profiles/audio/transport.c
index a1fdf948b..a355bde24 100644
--- a/profiles/audio/transport.c
+++ b/profiles/audio/transport.c
@@ -2015,7 +2015,7 @@ static void transport_unlink(void *data, void *user_data)
 		return;
 	}
 
-	bt_bap_stream_io_unlink(link, stream);
+	bt_bap_stream_io_unlink(stream, link);
 
 	bap_update_links(transport);
 
-- 
2.34.1


