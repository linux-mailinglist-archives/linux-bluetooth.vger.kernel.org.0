Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF222F4805
	for <lists+linux-bluetooth@lfdr.de>; Wed, 13 Jan 2021 10:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbhAMJuU (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 13 Jan 2021 04:50:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbhAMJuU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 13 Jan 2021 04:50:20 -0500
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9516C061794
        for <linux-bluetooth@vger.kernel.org>; Wed, 13 Jan 2021 01:49:39 -0800 (PST)
Received: by mail-qv1-xf4a.google.com with SMTP id k16so1003534qve.19
        for <linux-bluetooth@vger.kernel.org>; Wed, 13 Jan 2021 01:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=/VNAtsVw6enMHnDDbVjZRt46WOBcUozQBtnp1MuA0cc=;
        b=WlqIydCS5Psxv3ojlyqGV1Ne+qW/U5PhdVpHfSpB3TV4jQoy/wFZCtt/usRtNlRGKT
         d5knZhgor8bk44BCUyZguT+Nt5LoIIiZw3UaFcuRIvUoYKJJjqX1KMaRYIlElO9+aYUs
         kYGbfHA5OPd385B7QAwL9EyaQ4j2Hdw1PV/g8I27G1i9fnawNSuDsHYJjA85y94Py72B
         2IZchXFKNK3A3zeQcQzzSYiz89DWUFtutKBwd3Zrk1f4qnaOpchMZ2nYvPFudWSQZPvd
         EETY/iHwV1zmacBA6BFWgj9tPzXRQxAVEL36P/U7lWoH1nIijahGfNFaK116d4o5cGvj
         gO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=/VNAtsVw6enMHnDDbVjZRt46WOBcUozQBtnp1MuA0cc=;
        b=mLQw7odFlUYbR4uQcAQX73YEHBnb1+hJcL8TMc5OvHpVC0HmBTnhti+SgFCv7Q4naz
         X48fN6iTvb74fMrP3v/qAAbMNzFIkUAFpvMAGjFprqFWQMpAF08u7YM/gTuYknFiRvX7
         xGQQojZZ/mCXD9IiQtYbyFHKhrBd6UhvZ1A8/govIn8KdqSOMzwYJ3TX2ImePBwHBoo6
         pXdGKnifjO3hpVRNuc/ZHMQ+4Zw6JyzoNBZpMNxYrjnuVVvF5pGJrAxOxg894+Q632dV
         rX990DDwGkNXXsry9I6rRs/EOGHIliudCFSdca2mOnZGBkxjN7Wsl+lF31irGsjy+6wK
         e6Vw==
X-Gm-Message-State: AOAM532UI2MdklvXZM5Sy4ac0AxduYn+aDGl74qNNs+68uPlAfoJ/moT
        dS0qrf/IXL+LkJEnmDfoxcY5eAJfgpO39zRiBD2R9GBojWEE2WYgdczsjK+PyY5U6fddXKVvVrZ
        hbI+Ak14ZlGXQ7KmzER4UYS1pA6FyvqqBofPYbSLqpC1qagtEXL24jt01PjXjZxzLOtBYY96RiX
        sR
X-Google-Smtp-Source: ABdhPJxO1aVfYqUSjL1JVTbiiCOBl0oew4DJqnVwdGMnCyauPeXjJM15PDKCJu0GD4PIrGa80ydUp99ztBw1
Sender: "apusaka via sendgmr" <apusaka@apusaka-p920.tpe.corp.google.com>
X-Received: from apusaka-p920.tpe.corp.google.com ([2401:fa00:1:b:f693:9fff:fef4:2347])
 (user=apusaka job=sendgmr) by 2002:ad4:4e31:: with SMTP id
 dm17mr1531187qvb.27.1610531379016; Wed, 13 Jan 2021 01:49:39 -0800 (PST)
Date:   Wed, 13 Jan 2021 17:49:02 +0800
In-Reply-To: <20210113094905.2787919-1-apusaka@google.com>
Message-Id: <20210113174829.Bluez.v2.2.I9a37334cdf4a6eaadc1850f5a777e724e9a7081c@changeid>
Mime-Version: 1.0
References: <20210113094905.2787919-1-apusaka@google.com>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [Bluez PATCH v2 2/5] src/adv_monitor: add monitor with rssi support
 for mgmt
From:   Archie Pusaka <apusaka@google.com>
To:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     CrosBT Upstreaming <chromeos-bluetooth-upstreaming@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>,
        Yun-Hao Chung <howardchung@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Archie Pusaka <apusaka@chromium.org>

Using the new opcode MGMT_OP_ADD_ADV_PATTERNS_MONITOR_RSSI to
monitor advertisement according to some RSSI criteria.

Reviewed-by: Yun-Hao Chung <howardchung@google.com>
---

(no changes since v1)

 src/adv_monitor.c | 143 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 110 insertions(+), 33 deletions(-)

diff --git a/src/adv_monitor.c b/src/adv_monitor.c
index 5a0498ec2e..bd53e0a0d9 100644
--- a/src/adv_monitor.c
+++ b/src/adv_monitor.c
@@ -44,6 +44,8 @@
 #define ADV_MONITOR_UNSET_TIMER		0	/* second */
 #define ADV_MONITOR_MIN_TIMER		1	/* second */
 #define ADV_MONITOR_MAX_TIMER		300	/* second */
+#define ADV_MONITOR_UNSET_SAMPLING_PERIOD 256	/* 100 ms */
+#define ADV_MONITOR_MAX_SAMPLING_PERIOD	255	/* 100 ms */
 
 struct btd_adv_monitor_manager {
 	struct btd_adapter *adapter;
@@ -95,6 +97,10 @@ struct adv_monitor {
 	uint16_t high_rssi_timeout;	/* High RSSI threshold timeout */
 	int8_t low_rssi;		/* Low RSSI threshold */
 	uint16_t low_rssi_timeout;	/* Low RSSI threshold timeout */
+	uint16_t sampling_period;	/* Merge packets in the same timeslot.
+					 * Currenly unimplemented in user space.
+					 * Used only to pass data to kernel.
+					 */
 	struct queue *devices;		/* List of adv_monitor_device objects */
 
 	enum monitor_type type;		/* MONITOR_TYPE_* */
@@ -363,6 +369,7 @@ static struct adv_monitor *monitor_new(struct adv_monitor_app *app,
 	monitor->high_rssi_timeout = ADV_MONITOR_UNSET_TIMER;
 	monitor->low_rssi = ADV_MONITOR_UNSET_RSSI;
 	monitor->low_rssi_timeout = ADV_MONITOR_UNSET_TIMER;
+	monitor->sampling_period = ADV_MONITOR_UNSET_SAMPLING_PERIOD;
 	monitor->devices = queue_new();
 
 	monitor->type = MONITOR_TYPE_NONE;
@@ -432,6 +439,7 @@ static bool parse_rssi_and_timeout(struct adv_monitor *monitor,
 	DBusMessageIter prop_struct, iter;
 	int16_t h_rssi, l_rssi;
 	uint16_t h_rssi_timer, l_rssi_timer;
+	int16_t sampling_period;
 	uint16_t adapter_id = monitor->app->manager->adapter_id;
 
 	/* Property RSSIThresholdsAndTimers is optional */
@@ -473,6 +481,13 @@ static bool parse_rssi_and_timeout(struct adv_monitor *monitor,
 	if (dbus_message_iter_get_arg_type(&iter) != DBUS_TYPE_UINT16)
 		goto failed;
 	dbus_message_iter_get_basic(&iter, &l_rssi_timer);
+	if (!dbus_message_iter_next(&iter))
+		goto failed;
+
+	/* Extract SamplingPeriod */
+	if (dbus_message_iter_get_arg_type(&iter) != DBUS_TYPE_UINT16)
+		goto failed;
+	dbus_message_iter_get_basic(&iter, &sampling_period);
 
 	/* Verify the values of RSSIs and their timers. For simplicity, we
 	 * enforce the all-or-none rule to these fields. In other words, either
@@ -481,7 +496,8 @@ static bool parse_rssi_and_timeout(struct adv_monitor *monitor,
 	if (h_rssi == ADV_MONITOR_UNSET_RSSI &&
 		l_rssi == ADV_MONITOR_UNSET_RSSI &&
 		h_rssi_timer == ADV_MONITOR_UNSET_TIMER &&
-		l_rssi_timer == ADV_MONITOR_UNSET_TIMER) {
+		l_rssi_timer == ADV_MONITOR_UNSET_TIMER &&
+		sampling_period == ADV_MONITOR_UNSET_SAMPLING_PERIOD) {
 		goto done;
 	}
 
@@ -498,17 +514,22 @@ static bool parse_rssi_and_timeout(struct adv_monitor *monitor,
 		goto failed;
 	}
 
+	if (sampling_period > ADV_MONITOR_MAX_SAMPLING_PERIOD)
+		goto failed;
+
 	monitor->high_rssi = h_rssi;
 	monitor->low_rssi = l_rssi;
 	monitor->high_rssi_timeout = h_rssi_timer;
 	monitor->low_rssi_timeout = l_rssi_timer;
+	monitor->sampling_period = sampling_period;
 
 done:
 	DBG("Adv Monitor at %s initiated with high RSSI threshold %d, high "
 		"RSSI threshold timeout %d, low RSSI threshold %d, low RSSI "
-		"threshold timeout %d", path, monitor->high_rssi,
-		monitor->high_rssi_timeout, monitor->low_rssi,
-		monitor->low_rssi_timeout);
+		"threshold timeout %d, sampling period %d", path,
+		monitor->high_rssi, monitor->high_rssi_timeout,
+		monitor->low_rssi, monitor->low_rssi_timeout,
+		monitor->sampling_period);
 
 	return true;
 
@@ -517,6 +538,7 @@ failed:
 	monitor->low_rssi = ADV_MONITOR_UNSET_RSSI;
 	monitor->high_rssi_timeout = ADV_MONITOR_UNSET_TIMER;
 	monitor->low_rssi_timeout = ADV_MONITOR_UNSET_TIMER;
+	monitor->sampling_period = ADV_MONITOR_UNSET_SAMPLING_PERIOD;
 
 	btd_error(adapter_id,
 			"Invalid argument of property RSSIThresholdsAndTimers "
@@ -673,16 +695,88 @@ static void add_adv_patterns_monitor_cb(uint8_t status, uint16_t length,
 	DBG("Adv monitor with handle:0x%04x added", monitor->monitor_handle);
 }
 
-static void monitor_copy_patterns(void *data, void *user_data)
+static bool monitor_rssi_is_unset(struct adv_monitor *monitor)
 {
-	struct bt_ad_pattern *pattern = data;
-	struct mgmt_cp_add_adv_monitor *cp = user_data;
+	return monitor->high_rssi == ADV_MONITOR_UNSET_RSSI &&
+		monitor->low_rssi == ADV_MONITOR_UNSET_RSSI &&
+		monitor->high_rssi_timeout == ADV_MONITOR_UNSET_TIMER &&
+		monitor->low_rssi_timeout == ADV_MONITOR_UNSET_TIMER &&
+		monitor->low_rssi_timeout == ADV_MONITOR_UNSET_TIMER;
+}
 
-	if (!pattern)
-		return;
+/* sends MGMT_OP_ADD_ADV_PATTERNS_MONITOR */
+static bool monitor_send_add_pattern(struct adv_monitor *monitor)
+{
+	struct mgmt_cp_add_adv_monitor *cp = NULL;
+	uint8_t pattern_count, cp_len;
+	const struct queue_entry *e;
+	bool success = true;
+
+	pattern_count = queue_length(monitor->patterns);
+	cp_len = sizeof(*cp) + pattern_count * sizeof(struct mgmt_adv_pattern);
+
+	cp = malloc0(cp_len);
+	if (!cp)
+		return false;
 
-	memcpy(cp->patterns + cp->pattern_count, pattern, sizeof(*pattern));
-	cp->pattern_count++;
+	for (e = queue_get_entries(monitor->patterns); e; e = e->next) {
+		struct bt_ad_pattern *pattern = e->data;
+
+		memcpy(&cp->patterns[cp->pattern_count++], pattern,
+							sizeof(*pattern));
+	}
+
+	if (!mgmt_send(monitor->app->manager->mgmt,
+			MGMT_OP_ADD_ADV_PATTERNS_MONITOR,
+			monitor->app->manager->adapter_id, cp_len, cp,
+			add_adv_patterns_monitor_cb, monitor, NULL)) {
+		error("Unable to send Add Adv Patterns Monitor command");
+		success = false;
+	}
+
+	free(cp);
+	return success;
+}
+
+/* sends MGMT_OP_ADD_ADV_PATTERNS_MONITOR_RSSI */
+static bool monitor_send_add_pattern_rssi(struct adv_monitor *monitor)
+{
+	struct mgmt_cp_add_adv_patterns_monitor_rssi *cp = NULL;
+	uint8_t pattern_count, cp_len;
+	const struct queue_entry *e;
+	bool success = true;
+
+	pattern_count = queue_length(monitor->patterns);
+	cp_len = sizeof(*cp) + pattern_count * sizeof(struct mgmt_adv_pattern);
+
+	cp = malloc0(cp_len);
+	if (!cp)
+		return false;
+
+	cp->rssi.high_threshold = monitor->high_rssi;
+	/* High threshold timeout is unsupported in kernel. Value must be 0. */
+	cp->rssi.high_threshold_timeout = 0;
+	cp->rssi.low_threshold = monitor->low_rssi;
+	cp->rssi.low_threshold_timeout = htobs(monitor->low_rssi_timeout);
+	cp->rssi.sampling_period = monitor->sampling_period;
+
+	for (e = queue_get_entries(monitor->patterns); e; e = e->next) {
+		struct bt_ad_pattern *pattern = e->data;
+
+		memcpy(&cp->patterns[cp->pattern_count++], pattern,
+							sizeof(*pattern));
+	}
+
+	if (!mgmt_send(monitor->app->manager->mgmt,
+			MGMT_OP_ADD_ADV_PATTERNS_MONITOR_RSSI,
+			monitor->app->manager->adapter_id, cp_len, cp,
+			add_adv_patterns_monitor_cb, monitor, NULL)) {
+		error("Unable to send Add Adv Patterns Monitor RSSI command");
+		success = false;
+	}
+
+	free(cp);
+	return success;
 }
 
 /* Handles an Adv Monitor D-Bus proxy added event */
@@ -690,8 +784,6 @@ static void monitor_proxy_added_cb(GDBusProxy *proxy, void *user_data)
 {
 	struct adv_monitor *monitor;
 	struct adv_monitor_app *app = user_data;
-	struct mgmt_cp_add_adv_monitor *cp = NULL;
-	uint8_t pattern_count, cp_len;
 	uint16_t adapter_id = app->manager->adapter_id;
 	const char *path = g_dbus_proxy_get_path(proxy);
 	const char *iface = g_dbus_proxy_get_interface(proxy);
@@ -725,24 +817,12 @@ static void monitor_proxy_added_cb(GDBusProxy *proxy, void *user_data)
 
 	queue_push_tail(app->monitors, monitor);
 
-	pattern_count = queue_length(monitor->patterns);
-	cp_len = sizeof(struct mgmt_cp_add_adv_monitor) +
-			pattern_count * sizeof(struct mgmt_adv_pattern);
-
-	cp = malloc0(cp_len);
-	queue_foreach(monitor->patterns, monitor_copy_patterns, cp);
-
-	if (!mgmt_send(app->manager->mgmt, MGMT_OP_ADD_ADV_PATTERNS_MONITOR,
-			adapter_id, cp_len, cp, add_adv_patterns_monitor_cb,
-			monitor, NULL)) {
-		error("Unable to send Add Adv Patterns Monitor command");
-		goto done;
-	}
+	if (monitor_rssi_is_unset(monitor))
+		monitor_send_add_pattern(monitor);
+	else
+		monitor_send_add_pattern_rssi(monitor);
 
 	DBG("Adv Monitor allocated for the object at path %s", path);
-
-done:
-	free(cp);
 }
 
 /* Handles the removal of an Adv Monitor D-Bus proxy */
@@ -1428,10 +1508,7 @@ static void adv_monitor_filter_rssi(struct adv_monitor *monitor,
 	 * DeviceFound() event without tracking for the RSSI as the Adv has
 	 * already matched the pattern filter.
 	 */
-	if (monitor->high_rssi == ADV_MONITOR_UNSET_RSSI &&
-		monitor->low_rssi == ADV_MONITOR_UNSET_RSSI &&
-		monitor->high_rssi_timeout == ADV_MONITOR_UNSET_TIMER &&
-		monitor->low_rssi_timeout == ADV_MONITOR_UNSET_TIMER) {
+	if (monitor_rssi_is_unset(monitor)) {
 		DBG("Calling DeviceFound() on Adv Monitor of owner %s "
 		    "at path %s", monitor->app->owner, monitor->path);
 
-- 
2.30.0.284.gd98b1dd5eaa7-goog

