Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15D5C2F5B83
	for <lists+linux-bluetooth@lfdr.de>; Thu, 14 Jan 2021 08:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbhANHp7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 14 Jan 2021 02:45:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbhANHp6 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 14 Jan 2021 02:45:58 -0500
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDED8C06179F
        for <linux-bluetooth@vger.kernel.org>; Wed, 13 Jan 2021 23:45:17 -0800 (PST)
Received: by mail-qk1-x749.google.com with SMTP id q3so3834185qkq.21
        for <linux-bluetooth@vger.kernel.org>; Wed, 13 Jan 2021 23:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=RqtDsIXvMfTgeVjAs/e5jncwDRdMDC1iNm2WoYsej+A=;
        b=YSv+A4lgROGhRhIh5VZM5gMco3MIvpgdgmtqxWC/8hhRcz0FcUAMQ3RVdSr3/sHg4c
         uFYlpgkRmjXcnuOPXWBk2ymAvViKgejzJIjDJtNP6mGgM8jk+PJxVZHl2j+DdfsT8JYO
         rWUfGkHiEXAis97XoZc/dKjNmn8prVGokpARU1W102JEY/aP0XgWu50UBNvMGyqjkdxk
         guyDFClmOF9de9dFR4y6l3OGqMQXhWhLflTuH8V7dAClvBClZxfOfuWiNGLKi80WyxnU
         MqFnywHFwUT1v0cumR88BD3KVT1HjdTBlD35phMEP4vKrxDvwUbS2w8muz3pn2jL2pvQ
         /d/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=RqtDsIXvMfTgeVjAs/e5jncwDRdMDC1iNm2WoYsej+A=;
        b=XWk5edRPQQh7zojF06SEGJ4o8BxJheyzlgILB1ZR7BjN7vUJXBpfkCh7g4tjuA4yC6
         KNe9KHGEbludw2tWCQ+FduquxnGGjsyMJDoTHXeHgPqCRQPTrnOR3cGGgUhnQTAbau3j
         ZTCL983dXkBhAjJuOTGbrAXU9XqHbctL0bFNf6hlEQ0NlRbhEp9lMrTEY9inPSkm7gsW
         0N48VI2CLeZX5ihYrmM+orrJ30ZR+jtETDuXUEOXl6HQopYkkglZ6YlA4gGKp9zwsPg3
         YmUohRse3VBadSxIbMGhRchljYuSWhiUQ0grC/7qznqccoiLJ7QJLkqKyD+AeNkhCFFb
         QGDA==
X-Gm-Message-State: AOAM53187wUg3eDVLTsgwndHrZ2ll/MVLapNj1EJlikXWiSHf4b0bPqO
        hixc5LtsueUQkUbyRj1h7wuQk5wvTq8bqHKbm+UPBnMFPolVKwE5RG/U1MAcIvpEkP0J708a38Z
        NcL418c2T3cWw7nM/r0rWkerWqwIp9D2JWgaDpL8tyZhVC5i5Mt47vKtv6n76tm7G3LDGsUKvxN
        0X
X-Google-Smtp-Source: ABdhPJy0CY2NxE+oMdbFyPythggpBXPt4hCtDfWlailAbALxaJbCpnSVySE4NGU2rvL4vyV7lhehe9XN1ZP+
Sender: "apusaka via sendgmr" <apusaka@apusaka-p920.tpe.corp.google.com>
X-Received: from apusaka-p920.tpe.corp.google.com ([2401:fa00:1:b:f693:9fff:fef4:2347])
 (user=apusaka job=sendgmr) by 2002:a25:ad93:: with SMTP id
 z19mr8592954ybi.486.1610610317009; Wed, 13 Jan 2021 23:45:17 -0800 (PST)
Date:   Thu, 14 Jan 2021 15:44:56 +0800
In-Reply-To: <20210114074458.3399055-1-apusaka@google.com>
Message-Id: <20210114154405.Bluez.v3.3.I16fa24fb791fe886f6723373772b644783b3ab92@changeid>
Mime-Version: 1.0
References: <20210114074458.3399055-1-apusaka@google.com>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [Bluez PATCH v3 3/5] btmgmt: advmon add rssi support
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

 tools/btmgmt.c | 160 +++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 134 insertions(+), 26 deletions(-)

diff --git a/tools/btmgmt.c b/tools/btmgmt.c
index c0e55f58e6..383e7199e4 100644
--- a/tools/btmgmt.c
+++ b/tools/btmgmt.c
@@ -4858,64 +4858,169 @@ static bool str2pattern(struct mgmt_adv_pattern *pattern, const char *str)
 	return true;
 }
 
-static void advmon_add_usage(void)
+static struct option add_monitor_rssi_options[] = {
+	{ "help",		0, 0, 'h' },
+	{ "high-threshold",	1, 0, 'R' },
+	{ "low-threshold",	1, 0, 'r' },
+	{ "high-timeout",	1, 0, 'T' },
+	{ "low-timeout",	1, 0, 't' },
+	{ "sampling",		1, 0, 's' },
+	{ 0, 0, 0, 0 }
+};
+
+static void advmon_add_pattern_usage(void)
+{
+	bt_shell_usage();
+	print("patterns format:\n"
+		"\t<ad_type:offset:pattern> [patterns]\n"
+		"e.g.:\n"
+		"\tadd-pattern 0:1:c504 ff:a:9a55beef");
+}
+
+static void advmon_add_pattern_rssi_usage(void)
 {
 	bt_shell_usage();
-	print("Monitor Types:\n\t-p <ad_type:offset:pattern>..."
-		"\tPattern Monitor\ne.g.:\n\tadd -p 0:1:c504 1:a:9a55beef");
+	print("RSSI options:\n"
+		"\t -R, --high-threshold <dBm>  "
+			"RSSI high threshold. Default: -70\n"
+		"\t -r, --low-threshold <dBm>   "
+			"RSSI low threshold. Default: -50\n"
+		"\t -T, --high-timeout <s>      "
+			"RSSI high threshold duration. Default: 0\n"
+		"\t -t, --low-timeout <s>       "
+			"RSSI low threshold duration. Default: 5\n"
+		"\t -s, --sampling <N * 100ms>  "
+			"RSSI sampling period. Default: 0\n"
+		"patterns format:\n"
+		"\t<ad_type:offset:pattern> [patterns]\n"
+		"e.g.:\n"
+		"\tadd-pattern-rssi -R 0xb2 -r -102 0:1:c504 ff:a:9a55beef");
 }
 
-static bool advmon_add_pattern(int argc, char **argv)
+static void cmd_advmon_add_pattern(int argc, char **argv)
 {
+	bool success = true;
 	uint16_t index;
 	int i, cp_len;
 	struct mgmt_cp_add_adv_monitor *cp = NULL;
-	bool success = false;
 
-	index = mgmt_index;
-	if (index == MGMT_INDEX_NONE)
-		index = 0;
+	if (!strcmp(argv[1], "-h"))
+		goto done;
 
-	cp_len = sizeof(struct mgmt_cp_add_adv_monitor) +
-			argc * sizeof(struct mgmt_adv_pattern);
+	argc -= 1;
+	argv += 1;
 
+	cp_len = sizeof(*cp) + argc * sizeof(struct mgmt_adv_pattern);
 	cp = malloc0(cp_len);
 	cp->pattern_count = argc;
 
 	for (i = 0; i < argc; i++) {
 		if (!str2pattern(&cp->patterns[i], argv[i])) {
 			error("Failed to parse monitor patterns.");
+			success = false;
 			goto done;
 		}
 	}
 
-	if (!mgmt_send(mgmt, MGMT_OP_ADD_ADV_PATTERNS_MONITOR, index, cp_len,
-					cp, advmon_add_rsp, NULL, NULL)) {
-		error("Unable to send \"Add Advertising Monitor\" command");
+	index = mgmt_index;
+	if (index == MGMT_INDEX_NONE)
+		index = 0;
+
+	if (!mgmt_send(mgmt, MGMT_OP_ADD_ADV_PATTERNS_MONITOR, index,
+				cp_len, cp, advmon_add_rsp, NULL, NULL)) {
+		error("Unable to send Add Advertising Monitor command");
+		success = false;
 		goto done;
 	}
 
-	success = true;
+	free(cp);
+	return;
 
 done:
 	free(cp);
-	return success;
+	advmon_add_pattern_usage();
+	bt_shell_noninteractive_quit(success ? EXIT_SUCCESS : EXIT_FAILURE);
 }
 
-static void cmd_advmon_add(int argc, char **argv)
+static void cmd_advmon_add_pattern_rssi(int argc, char **argv)
 {
-	bool success = false;
+	bool success = true;
+	int opt;
+	int8_t rssi_low = -70;
+	int8_t rssi_high = -50;
+	uint16_t rssi_low_timeout = 5;
+	uint16_t rssi_high_timeout = 0;
+	uint8_t rssi_sampling_period = 0;
+	uint16_t index;
+	int i, cp_len;
+	struct mgmt_cp_add_adv_patterns_monitor_rssi *cp = NULL;
 
-	if (strcasecmp(argv[1], "-p") == 0 && argc > 2) {
-		argc -= 2;
-		argv += 2;
-		success = advmon_add_pattern(argc, argv);
+	while ((opt = getopt_long(argc, argv, "+hr:R:t:T:s:",
+				add_monitor_rssi_options, NULL)) != -1) {
+		switch (opt) {
+		case 'h':
+			goto done;
+		case 'r':
+			rssi_low = strtol(optarg, NULL, 0);
+			break;
+		case 'R':
+			rssi_high = strtol(optarg, NULL, 0);
+			break;
+		case 't':
+			rssi_low_timeout = strtol(optarg, NULL, 0);
+			break;
+		case 'T':
+			rssi_high_timeout = strtol(optarg, NULL, 0);
+			break;
+		case 's':
+			rssi_sampling_period = strtol(optarg, NULL, 0);
+			break;
+		default:
+			success = false;
+			goto done;
+		}
 	}
 
-	if (!success) {
-		advmon_add_usage();
-		bt_shell_noninteractive_quit(EXIT_FAILURE);
+	argc -= optind;
+	argv += optind;
+	optind = 0;
+
+	cp_len = sizeof(*cp) + argc * sizeof(struct mgmt_adv_pattern);
+	cp = malloc0(cp_len);
+	cp->pattern_count = argc;
+	cp->rssi.high_threshold = rssi_high;
+	cp->rssi.low_threshold = rssi_low;
+	cp->rssi.high_threshold_timeout = htobs(rssi_high_timeout);
+	cp->rssi.low_threshold_timeout = htobs(rssi_low_timeout);
+	cp->rssi.sampling_period = rssi_sampling_period;
+
+	for (i = 0; i < argc; i++) {
+		if (!str2pattern(&cp->patterns[i], argv[i])) {
+			error("Failed to parse monitor patterns.");
+			success = false;
+			goto done;
+		}
+	}
+
+	index = mgmt_index;
+	if (index == MGMT_INDEX_NONE)
+		index = 0;
+
+	if (!mgmt_send(mgmt, MGMT_OP_ADD_ADV_PATTERNS_MONITOR_RSSI, index,
+				cp_len, cp, advmon_add_rsp, NULL, NULL)) {
+		error("Unable to send Add Advertising Monitor RSSI command");
+		success = false;
+		goto done;
 	}
+
+	free(cp);
+	return;
+
+done:
+	free(cp);
+	optind = 0;
+	advmon_add_pattern_rssi_usage();
+	bt_shell_noninteractive_quit(success ? EXIT_SUCCESS : EXIT_FAILURE);
 }
 
 static void advmon_remove_rsp(uint8_t status, uint16_t len, const void *param,
@@ -5037,8 +5142,11 @@ static const struct bt_shell_menu monitor_menu = {
 					"features"			},
 	{ "remove",		"<handle>",
 		cmd_advmon_remove,	"Remove advertisement monitor "	},
-	{ "add",		"<-p|-h> [options...]",
-		cmd_advmon_add,		"Add advertisement monitor"	},
+	{ "add-pattern",	"[-h] <patterns>",
+		cmd_advmon_add_pattern,	"Add advertisement monitor pattern" },
+	{ "add-pattern-rssi",	"[options] <patterns>",
+		cmd_advmon_add_pattern_rssi,
+		"Add advertisement monitor pattern with RSSI options"    },
 	{ } },
 };
 
-- 
2.30.0.284.gd98b1dd5eaa7-goog

