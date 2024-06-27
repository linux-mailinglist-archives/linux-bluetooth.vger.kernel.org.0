Return-Path: <linux-bluetooth+bounces-5600-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E7B91AAAF
	for <lists+linux-bluetooth@lfdr.de>; Thu, 27 Jun 2024 17:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E1B81F26A68
	for <lists+linux-bluetooth@lfdr.de>; Thu, 27 Jun 2024 15:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3819419882E;
	Thu, 27 Jun 2024 15:10:52 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457381591F0
	for <linux-bluetooth@vger.kernel.org>; Thu, 27 Jun 2024 15:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719501051; cv=none; b=c8t0CwGV2p8n4xoyEPgyxRXbfPcWZLr1Ffo0mXfxnQhokXjMiiFXTb5r2tO1fShTm6IRqMAbSQ4vMEkUwMUQmW2LfvPGKhPVqvaiFdDJTGBTXDlwnH3+Bs/JC0sWwPk/wRSBYGcvFub19m6o4ITj+EA8J1nwoZ8Z0QzmFzr0Gdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719501051; c=relaxed/simple;
	bh=oJPxJd9Z9bdivSU7xCB8+DhvqpJ+g4iq3GdLyBo0IPo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r2vrNCghdvp+2qGsNWABRjXUZ3eXcLN8c0U7StxDx8zsFeDbwr5Za2jzRyosdHp5Coy64vklJ+gJDg+i7J66EaEbx7sO3bocIamS0jv57UQIPW71Onnfd8BRduZjHJAfqu9LvtF5SfJknYRz/b6pBm78F90bNeE+AAjky4depn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from localhost.localdomain (84.18.99.27) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 27 Jun
 2024 18:10:31 +0300
From: Roman Smirnov <r.smirnov@omp.ru>
To: <linux-bluetooth@vger.kernel.org>
CC: Roman Smirnov <r.smirnov@omp.ru>
Subject: [PATCH BlueZ v1] gatt-server: fix memory leak in bt_gatt_server_send_notification()
Date: Thu, 27 Jun 2024 18:09:16 +0300
Message-ID: <20240627150917.85755-1-r.smirnov@omp.ru>
X-Mailer: git-send-email 2.43.0
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
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 06/27/2024 14:59:00
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 186191 [Jun 27 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: r.smirnov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 21 0.3.21
 ebee5449fc125b2da45f1a6a6bc2c5c0c3ad0e05
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 84.18.99.27
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/27/2024 15:02:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 6/27/2024 12:52:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

data-pdu is allocated but not released when an error occurs.

Add data-pdu release before exiting the function in case of an error.

Found by Linux Verification Center (linuxtesting.org) with the SVACE
static analysis tool.
---
 src/shared/gatt-server.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/shared/gatt-server.c b/src/shared/gatt-server.c
index 0e399ceb1..fb8819c70 100644
--- a/src/shared/gatt-server.c
+++ b/src/shared/gatt-server.c
@@ -1822,6 +1822,7 @@ bool bt_gatt_server_send_notification(struct bt_gatt_server *server,
 	return result;
 
 error:
+	free(data->pdu);
 	if (data)
 		free(data);
 
-- 
2.43.0


