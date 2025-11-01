Return-Path: <linux-bluetooth+bounces-16232-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6987DC27D13
	for <lists+linux-bluetooth@lfdr.de>; Sat, 01 Nov 2025 12:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 110503AE092
	for <lists+linux-bluetooth@lfdr.de>; Sat,  1 Nov 2025 11:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4482F5483;
	Sat,  1 Nov 2025 11:52:44 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66CD2F5A19
	for <linux-bluetooth@vger.kernel.org>; Sat,  1 Nov 2025 11:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761997963; cv=none; b=KOXxqrwa/4zX1GEIPjyYluGI/vwDQo6urbC+3/TKnXD0H+INQhfXMIckxrU9kqE1yfN1/YQB7E8mOCy5pyq3imUGE2klGF3Sy/KhUq/UeL9Pzi/69vN24UoUs1wDyEtWwxxgSX2k+6REbWpMZDYEY0MHk411udXCo8sKS+I79n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761997963; c=relaxed/simple;
	bh=rvZP7pZ2U80JgFvC3KSgJkOIy5tdTbkj7jPOWCOUDCI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GdYjNZXpAlr3pCcbQyjXrkwtKup11SqKc7V+C3nTMyhptACVqKNfRu63+Td/p7iAb66VUxfaMabpTxna3JH1zgq9WkFEjwLc0yCsschrFgFpFOpdFQOYHHTtmeepgiXWSpHJ6NHovOHFSyT17V/iNVxsmwfKeX0yiTRjelVjREQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from localhost.localdomain (178.204.178.115) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Sat, 1 Nov
 2025 14:52:22 +0300
From: Roman Smirnov <r.smirnov@omp.ru>
To: <linux-bluetooth@vger.kernel.org>
CC: Roman Smirnov <r.smirnov@omp.ru>
Subject: [PATCH BlueZ v4 1/2] shared/battery: improve the display of the charge level
Date: Sat, 1 Nov 2025 14:51:58 +0300
Message-ID: <20251101115201.97961-1-r.smirnov@omp.ru>
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
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 11/01/2025 11:40:25
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 197715 [Nov 01 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: r.smirnov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 74 0.3.74
 076026cf5b16801374fbd5d19166f5aeefca6115
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {Tracking_repetitive_subdir_in_url}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.204.178.115 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;github.com:7.1.1;178.204.178.115:7.1.2;omp.ru:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.204.178.115
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/01/2025 11:45:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/1/2025 9:02:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

The battery charge level may fluctuate due to uncalibrated
sensors. Commit smooths out such fluctuations.

The algorithm for determining uncalibrated sensors consists of
finding the number of changes in charge direction (i.e., "spikes").
If the number of spikes is zero, the device is charging or discharging.
If there is one spike, it may mean that the device has started charging
or has been disconnected from charging. If there are two or more spikes,
this is a clear indication of an uncalibrated sensor.

Check that the battery charge is fluctuating. If the battery charge
is fluctuating, use the average charge value, otherwise use the current
value.

Fixes: https://github.com/bluez/bluez/issues/1612
---
V3 -> V4: Functionality has been moved to separate files, unit tests
have been added in the next patch, simple averaging of values is
used instead of exponential averaging, and last_charges now stores
values instead of pointers. 

V2 -> V3: A queue is used instead of an array for the last charges,
a bug with the spikes variable increment has been fixed, and the
fluctuation check is called each time a new battery charge appears.

V1 -> V2: Smoothing is only applied to uncalibrated sensors, the
last 8 values are saved instead of 4, and the average value is used
for smoothing instead of the minimum value.

 Makefile.am          |  3 +-
 src/battery.c        | 10 ++++-
 src/shared/battery.c | 96 ++++++++++++++++++++++++++++++++++++++++++++
 src/shared/battery.h | 21 ++++++++++
 4 files changed, 128 insertions(+), 2 deletions(-)
 create mode 100644 src/shared/battery.c
 create mode 100644 src/shared/battery.h

diff --git a/Makefile.am b/Makefile.am
index 94f625db4..4bf859685 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -244,7 +244,8 @@ shared_sources = src/shared/io.h src/shared/timeout.h \
 			src/shared/ccp.h src/shared/ccp.c \
 			src/shared/lc3.h src/shared/tty.h \
 			src/shared/bap-defs.h \
-			src/shared/asha.h src/shared/asha.c
+			src/shared/asha.h src/shared/asha.c \
+			src/shared/battery.h src/shared/battery.c
 
 if READLINE
 shared_sources += src/shared/shell.c src/shared/shell.h
diff --git a/src/battery.c b/src/battery.c
index 4c1ea79d9..796dbc4ac 100644
--- a/src/battery.c
+++ b/src/battery.c
@@ -19,6 +19,7 @@
 
 #include "gdbus/gdbus.h"
 #include "bluetooth/bluetooth.h"
+#include "src/shared/battery.h"
 #include "src/shared/queue.h"
 #include "src/shared/util.h"
 #include "battery.h"
@@ -39,6 +40,7 @@ struct btd_battery {
 	uint8_t percentage; /* valid between 0 to 100 inclusively */
 	char *source; /* Descriptive source of the battery info */
 	char *provider_path; /* The provider root path, if any */
+	struct bt_battery *filter;
 };
 
 struct btd_battery_provider_manager {
@@ -96,6 +98,7 @@ static struct btd_battery *battery_new(const char *path, const char *source,
 		battery->source = g_strdup(source);
 	if (provider_path)
 		battery->provider_path = g_strdup(provider_path);
+	battery->filter = bt_battery_new();
 
 	return battery;
 }
@@ -108,6 +111,11 @@ static void battery_free(struct btd_battery *battery)
 	if (battery->source)
 		g_free(battery->source);
 
+	if (battery->filter) {
+		bt_battery_free(battery->filter);
+		free(battery->filter);
+	}
+
 	free(battery);
 }
 
@@ -234,7 +242,7 @@ bool btd_battery_update(struct btd_battery *battery, uint8_t percentage)
 	if (battery->percentage == percentage)
 		return true;
 
-	battery->percentage = percentage;
+	battery->percentage = bt_battery_filter(battery->filter, percentage);
 	g_dbus_emit_property_changed(btd_get_dbus_connection(), battery->path,
 				     BATTERY_INTERFACE, "Percentage");
 
diff --git a/src/shared/battery.c b/src/shared/battery.c
new file mode 100644
index 000000000..5704bbb6c
--- /dev/null
+++ b/src/shared/battery.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *
+ *  BlueZ - Bluetooth protocol stack for Linux
+ *
+ *  Copyright (C) 2025  Open Mobile Platform LLC <community@omp.ru>
+ *
+ *
+ */
+
+#include <stdint.h>
+#include <stdlib.h>
+
+#include "src/shared/battery.h"
+#include "src/shared/queue.h"
+#include "src/shared/util.h"
+
+struct bt_battery {
+	struct queue *last_charges; /* last charges received */
+	uint8_t avg_charge; /* average battery charge */
+	bool is_fluctuating; /* true, if the battery sensor fluctuates */
+};
+
+struct bt_battery *bt_battery_new(void)
+{
+	struct bt_battery *battery;
+
+	battery = new0(struct bt_battery, 1);
+	battery->last_charges = queue_new();
+	battery->avg_charge = 0;
+	battery->is_fluctuating = false;
+
+	return battery;
+}
+
+void bt_battery_free(struct bt_battery *battery)
+{
+	if (battery->last_charges)
+		queue_destroy(battery->last_charges, NULL);
+}
+
+static void bt_battery_check_fluctuations(struct bt_battery *battery)
+{
+	const struct queue_entry *entry;
+	uint8_t spikes = 0;
+	int8_t step;
+	int8_t direction = 0;
+	int8_t prev_direction;
+	uintptr_t prev_charge;
+	uintptr_t next_charge;
+	uint16_t sum_charge = 0;
+
+	for (entry = queue_get_entries(battery->last_charges); entry->next;
+	     entry = entry->next) {
+		prev_direction = direction;
+		prev_charge = PTR_TO_UINT(entry->data);
+		next_charge = PTR_TO_UINT(entry->next->data);
+		step = next_charge - prev_charge;
+		sum_charge += prev_charge;
+
+		/*
+		 * The battery charge fluctuates too much,
+		 * which may indicate a battery problem, so
+		 * the actual value should be displayed.
+		 */
+		if (abs(step) >= MAX_CHARGE_STEP) {
+			battery->is_fluctuating = false;
+			return;
+		}
+
+		if (step > 0)
+			direction = 1;
+		else if (step < 0)
+			direction = -1;
+
+		if (direction != prev_direction && prev_direction)
+			spikes++;
+	}
+
+	sum_charge += next_charge;
+	battery->avg_charge = sum_charge / LAST_CHARGES_SIZE;
+
+	battery->is_fluctuating = (spikes > 1) ? true : false;
+}
+
+uint8_t bt_battery_filter(struct bt_battery *battery, uint8_t percentage)
+{
+	queue_push_tail(battery->last_charges, UINT_TO_PTR(percentage));
+
+	if (queue_length(battery->last_charges) == LAST_CHARGES_SIZE) {
+		bt_battery_check_fluctuations(battery);
+		queue_pop_head(battery->last_charges);
+	}
+
+	return (battery->is_fluctuating) ? battery->avg_charge : percentage;
+}
diff --git a/src/shared/battery.h b/src/shared/battery.h
new file mode 100644
index 000000000..41a7ed2b0
--- /dev/null
+++ b/src/shared/battery.h
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *
+ *  BlueZ - Bluetooth protocol stack for Linux
+ *
+ *  Copyright (C) 2025  Open Mobile Platform LLC <community@omp.ru>
+ *
+ *
+ */
+
+#include <stdint.h>
+
+#define LAST_CHARGES_SIZE 8
+#define MAX_CHARGE_STEP 5
+
+struct bt_battery;
+
+struct bt_battery *bt_battery_new(void);
+void bt_battery_free(struct bt_battery *battery);
+
+uint8_t bt_battery_filter(struct bt_battery *battery, uint8_t percentage);
-- 
2.43.0


