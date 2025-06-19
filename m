Return-Path: <linux-bluetooth+bounces-13094-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A38AE0A8F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Jun 2025 17:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F3B34A0EC8
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Jun 2025 15:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F6E231852;
	Thu, 19 Jun 2025 15:34:37 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F86213259
	for <linux-bluetooth@vger.kernel.org>; Thu, 19 Jun 2025 15:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750347277; cv=none; b=sQHIEq2mud2SAhI3Zfoui4D1AqXlp7kbInLIN6Bsyh2BFPtLhzO99qkrwUkB96H+CN6R9VBgXzgOoyjUjol5ryfmrgGMWSrimhOxhwTzgqxAKZWqzcr1a7FJFybP1aSjiYhrpTn/twY1+fpcraMIY5VkT9GqE5+qorR8qVkz4EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750347277; c=relaxed/simple;
	bh=oQ+WdVfhafwUUfmNNZFn81Qa5m55gd3l7cGq0fxFX80=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NGgX0it/ZrYrQw5drb/5JkoDzRUeVMcyCfJxR5Vk/mleDtGtF4Z70H73gQ7GCqZ/mbv7dJiALbs4f4RHxYH8dD4gfIuG2pJlV4TjPLkR4lEKvKf5EFLsYpjMabr0ZuHohvAe47KQ03oFSYAXXmgL458UeLKxEkI3snaPyjK6xlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from inp1wst087.omp.ru (81.22.207.138) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 19 Jun
 2025 18:34:25 +0300
From: Kirill Samburskiy <k.samburskiy@omp.ru>
To: <linux-bluetooth@vger.kernel.org>
CC: Kirill Samburskiy <k.samburskiy@omp.ru>
Subject: [PATCH BlueZ 2/2] test-vcp: free server-side bt_vcp on test teardown
Date: Thu, 19 Jun 2025 18:31:20 +0300
Message-ID: <20250619153120.126315-3-k.samburskiy@omp.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250619153120.126315-1-k.samburskiy@omp.ru>
References: <20250619153120.126315-1-k.samburskiy@omp.ru>
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
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 06/19/2025 15:18:50
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 194208 [Jun 19 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: k.samburskiy@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 62 0.3.62
 e2af3448995f5f8a7fe71abf21bb23519d0f38c3
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 81.22.207.138 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 81.22.207.138 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;127.0.0.199:7.1.2;inp1wst087.omp.ru:7.1.1;81.22.207.138:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
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
X-KSE-Antiphishing-Bases: 06/19/2025 15:21:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 6/19/2025 5:52:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

Shutdown tester IO before freeing bt_att instance to trigger its IO
disconnection callbacks. This detaches bt_vcp instance created by
vcp_get_session function, and executes detach callback registered
through bt_vcp_register that frees memory used by this bt_vcp instance.
This prevents the test from failing in some environments.
---
 unit/test-vcp.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/unit/test-vcp.c b/unit/test-vcp.c
index 6a61ea2c4..04254700b 100644
--- a/unit/test-vcp.c
+++ b/unit/test-vcp.c
@@ -38,6 +38,7 @@ struct test_data {
 	struct queue *ccc_states;
 	size_t iovcnt;
 	struct iovec *iov;
+	unsigned int vcp_id;
 };
 
 struct notify {
@@ -78,9 +79,9 @@ static void print_debug(const char *str, void *user_data)
 		tester_debug("%s%s", prefix, str);
 }
 
-static void test_teardown(const void *user_data)
+static gboolean test_teardown_finish(gpointer user_data)
 {
-	struct test_data *data = (void *)user_data;
+	struct test_data *data = user_data;
 
 	bt_vcp_unref(data->vcp);
 	bt_gatt_server_unref(data->server);
@@ -90,7 +91,16 @@ static void test_teardown(const void *user_data)
 
 	queue_destroy(data->ccc_states, free);
 
+	bt_vcp_unregister(data->vcp_id);
 	tester_teardown_complete();
+
+	return FALSE;
+}
+
+static void test_teardown(const void *user_data)
+{
+	tester_shutdown_io();
+	g_idle_add(test_teardown_finish, (void *) user_data);
 }
 
 static bool ccc_state_match(const void *a, const void *b)
@@ -163,6 +173,15 @@ done:
 							sizeof(value));
 }
 
+static void vcp_client_attached(struct bt_vcp *vcp, void *user_data)
+{
+}
+
+static void vcp_client_detached(struct bt_vcp *vcp, void *user_data)
+{
+	bt_vcp_unref(vcp);
+}
+
 static void test_server(const void *user_data)
 {
 	struct test_data *data = (void *)user_data;
@@ -188,6 +207,9 @@ static void test_server(const void *user_data)
 	data->vcp = bt_vcp_new(data->db, NULL);
 	g_assert(data->vcp);
 
+	data->vcp_id = bt_vcp_register(vcp_client_attached,
+						vcp_client_detached, NULL);
+
 	data->server = bt_gatt_server_new(data->db, att, 64, 0);
 	g_assert(data->server);
 
-- 
2.34.1


