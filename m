Return-Path: <linux-bluetooth+bounces-10795-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5965A4C11A
	for <lists+linux-bluetooth@lfdr.de>; Mon,  3 Mar 2025 13:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0AED3A8C59
	for <lists+linux-bluetooth@lfdr.de>; Mon,  3 Mar 2025 12:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05716210184;
	Mon,  3 Mar 2025 12:58:12 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B44C20408D
	for <linux-bluetooth@vger.kernel.org>; Mon,  3 Mar 2025 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741006691; cv=none; b=MtaRcwUZu00OSzPKhQbmHaqIdERnm0MkD6SxkRXwckFP624HB184CsX2C2XZmmO1gJL/8UcYELYYyDoYg8vQASCwXXallBfYPGBh8JtdOOeXkj0QEKl/r0VWpoyu62rpJFawdV1NaP5OSIrwmAm8nxxc7G+VxzwePMiguHXLZEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741006691; c=relaxed/simple;
	bh=CthffvlFZmYkEOQbxsBO8BrlykDXncl0GpZIvHTBHbI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hFOQZhMAnQAowp7jGF+dyisauKXkoXaBxhAJVRyCN/CyBnGKN6gzrQg7bisYTyqAOzbOTIzSSRJxTHDZH0Ol42DzIAcd8bA3nhR24jXnwuI8dET0K1DLaOqVBrCYLelIw78liwb/JqNkAPBb8Vk3KYGNjIYHzx8K5OiQpOI2vv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from localhost.localdomain (178.204.251.109) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 3 Mar
 2025 15:57:46 +0300
From: Roman Smirnov <r.smirnov@omp.ru>
To: <linux-bluetooth@vger.kernel.org>
CC: Roman Smirnov <r.smirnov@omp.ru>
Subject: [PATCH BlueZ] client: add input validation to main()
Date: Mon, 3 Mar 2025 15:57:22 +0300
Message-ID: <20250303125724.54665-1-r.smirnov@omp.ru>
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
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 03/03/2025 12:38:09
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 191431 [Mar 03 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: r.smirnov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 51 0.3.51
 68896fb0083a027476849bf400a331a2d5d94398
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {Tracking_repetitive_subdir_in_url}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.204.251.109 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.204.251.109 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	github.com:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.204.251.109
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 03/03/2025 12:41:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 3/3/2025 10:13:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

An error was found during fuzzing testing. When passing Unicode
characters to bluetoothctl the application crashes in dbus:

dbus[5324]: arguments to dbus_message_iter_append_basic() were
incorrect, assertion "_dbus_check_is_valid_utf8 (*string_p)"
failed in file .../dbus-message.c line 2765.

Check that all characters are written in utf8.

Fixes: https://github.com/bluez/bluez/issues/1118
---
 client/main.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/client/main.c b/client/main.c
index feb21a116..f3180a0fe 100644
--- a/client/main.c
+++ b/client/main.c
@@ -843,6 +843,17 @@ static gboolean parse_argument(int argc, char *argv[], const char **arg_table,
 	return FALSE;
 }
 
+static int validate_input(int argc, char *argv[]) {
+	for (int i = 0; i < argc; i++) {
+		if (!strisutf8(argv[i], strlen(argv[i]))) {
+			printf("Invalid character in string: %s\n", argv[i]);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static void cmd_list(int argc, char *argv[])
 {
 	GList *list;
@@ -3299,6 +3310,10 @@ int main(int argc, char *argv[])
 	int timeout;
 	unsigned int timeout_id;
 
+	status = validate_input(argc, argv);
+	if (status)
+		return status;
+
 	bt_shell_init(argc, argv, &opt);
 	bt_shell_set_menu(&main_menu);
 	bt_shell_add_submenu(&advertise_menu);
-- 
2.43.0


