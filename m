Return-Path: <linux-bluetooth+bounces-5736-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B376923908
	for <lists+linux-bluetooth@lfdr.de>; Tue,  2 Jul 2024 11:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AD41284163
	for <lists+linux-bluetooth@lfdr.de>; Tue,  2 Jul 2024 09:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1666152782;
	Tue,  2 Jul 2024 09:01:43 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE28C15216E
	for <linux-bluetooth@vger.kernel.org>; Tue,  2 Jul 2024 09:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719910903; cv=none; b=SreIYWEGIKfFjuGeUgyLWSnddS2adzY9b/2FS+C4ONur4o7Awv7k0SQFMAFRKs3aprWu/bECCMT90cuWIr66k5ckcyve0vMAQvVp+U+5rVjiG+InYTEJwk5EjXhtSPnuA4+7xuMKS5HmJI1ogUBLIQ47L6fw2MVovv+3tcQH+nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719910903; c=relaxed/simple;
	bh=r7CjFWBCLSDo4URMdBgxqvPT8WLRAZpopr2aTTJ3dIk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Cq4J4DaajXmxGwWDmpEHqTLQboBcAGA/Ea47JSykJN6GJc1xbnK1BQfS/dhw+M+8FTti4BkvPUBoRZyi6lfBXqmSy57ntHED42FqKeRGav2Jir2TFWSpLV2YLhEbgOAoTeYGr9PWjFgqyb+NZAIVFvsCmcF8EzacCr8CRpfbRvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from inp1wst083.omp.ru (81.22.207.138) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 2 Jul
 2024 12:01:32 +0300
From: Roman Smirnov <r.smirnov@omp.ru>
To: <linux-bluetooth@vger.kernel.org>
CC: Roman Smirnov <r.smirnov@omp.ru>
Subject: [PATCH BlueZ v2] shared/csip: add NULL checks to foreach_csis_service()
Date: Tue, 2 Jul 2024 12:01:20 +0300
Message-ID: <20240702090120.33631-1-r.smirnov@omp.ru>
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
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 07/02/2024 08:39:34
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 186271 [Jul 02 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: r.smirnov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 21 0.3.21
 ebee5449fc125b2da45f1a6a6bc2c5c0c3ad0e05
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 81.22.207.138 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	81.22.207.138:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2;inp1wst083.omp.ru:7.1.1
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
X-KSE-Antiphishing-Bases: 07/02/2024 08:44:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 7/2/2024 7:20:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

Make foreach_csis_service() safe for passing NULL pointers.

Found with the SVACE static analysis tool.
---
 V1 -> V2: added check for attr

 src/shared/csip.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/shared/csip.c b/src/shared/csip.c
index 87b4590d9..9a734e7d6 100644
--- a/src/shared/csip.c
+++ b/src/shared/csip.c
@@ -611,6 +611,9 @@ static void foreach_csis_service(struct gatt_db_attribute *attr,
 	struct bt_csip *csip = user_data;
 	struct bt_csis *csis = csip_get_csis(csip);
 
+	if (!csis || !attr)
+		return;
+
 	csis->service = attr;
 
 	gatt_db_service_set_claimed(attr, true);
-- 
2.34.1


