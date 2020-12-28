Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D57212E35B3
	for <lists+linux-bluetooth@lfdr.de>; Mon, 28 Dec 2020 11:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbgL1KFz (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 28 Dec 2020 05:05:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbgL1KFz (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 28 Dec 2020 05:05:55 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7384C061796
        for <linux-bluetooth@vger.kernel.org>; Mon, 28 Dec 2020 02:05:14 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id b123so17494313ybh.17
        for <linux-bluetooth@vger.kernel.org>; Mon, 28 Dec 2020 02:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=HzQbJfLng4nTdocg+2ktdAuB1zoBAkZF5kF7IpbEKGg=;
        b=JFv7fBgaq2FthsbHpLKlyMQuO8rHJYScMzqQ91tz8I6KSsD/AUq2zp7jq+DS4YrK2x
         VhCZBkcUBmDkwSFpCvlv8Z+5UvmfHol3BtD/hiitIpoBwq182vzsrgLC0XotTTwiU4Xa
         h2FNZ2EsRI3ipwcopE5SrML1Z85vAqsuKG8Mcz6KdXTww32Nb3EEjQteFSxcATh7MJKA
         BvAlfzKQhI6ZgSrcl/fzJFMUOhxb+5/wdCLuxlE9lrPhyMsjyDrW2mmyha7fa+zyMAeO
         x/d9r+tbTwSW+MlnksTXwEqJOXw08NIb0fdzZYHvulP3VXzkXJWy/LWkZtofCNX+JSZr
         XAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=HzQbJfLng4nTdocg+2ktdAuB1zoBAkZF5kF7IpbEKGg=;
        b=FED/qxZkIO/TqLILzSWBl11a8g8BoJQvT5e/s6QCw59gZyLkvxMNn/8aGPU1EwWpWQ
         59EVuHUz42UG21CXjFDamGTBdhG4OaHzeXgS+ssrGxvIHjEYBPxPY8Ij1Pl4t9p+MxUZ
         hUu3WxPBiQMB9gr7h+8kJJXPsyqp1IybQ8L0bT+LW5G17rfgV3+SOoJ16tKJnHf9X3GE
         86RK5DO0T1hKjbM6HJF6efkuNUaeFkvfnMZp4sSrxJOMiRWlYqryAo/DYdSBg4SpWt7F
         QH4+62EKY0159fYTzf9Y1/MqgZfKo9E2e7P4JzpyC+hHAGT1V7GO0cyUEQvNZT5TB4ul
         YNjQ==
X-Gm-Message-State: AOAM530LLCzONH+Xn7/PA1MhB2fzYRZzcelPDVGwicNM6cBrY4JTTw9V
        Y9dfYlbo3QAId7PiovECwuFjRYBrAiueWQCHhL3GeYOy1bMlyg9XOEYgzPEJ5m3sVQSov7Nj/S4
        hMGMRpQ334aejn8FGXIW04dMK+NnFdCfowkbwl9opwfQKZTd+5+5qQxEpjCgLeM/BhQII2Z779i
        LewfK4gyd+fWg=
X-Google-Smtp-Source: ABdhPJxtTDmy/GlTIyOHtSfqTwPQxLQCcFwEQyMGPqNajBooiBUuGea09h/o4QgW7L+cmbrCcj2A007GUpaJ55SzBg==
Sender: "howardchung via sendgmr" 
        <howardchung@howardchung-p920.tpe.corp.google.com>
X-Received: from howardchung-p920.tpe.corp.google.com ([2401:fa00:1:10:f693:9fff:fef4:4e45])
 (user=howardchung job=sendgmr) by 2002:a25:2643:: with SMTP id
 m64mr66305216ybm.221.1609149913965; Mon, 28 Dec 2020 02:05:13 -0800 (PST)
Date:   Mon, 28 Dec 2020 18:04:57 +0800
In-Reply-To: <20201228180429.Bluez.v2.1.Ie32770d0eed2e7739ce9d17d920766fb6aee8583@changeid>
Message-Id: <20201228180429.Bluez.v2.3.Idca009971ca95228a3fa7232ef648f18ff64d185@changeid>
Mime-Version: 1.0
References: <20201228180429.Bluez.v2.1.Ie32770d0eed2e7739ce9d17d920766fb6aee8583@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [Bluez PATCH v2 3/4] btmgmt: Add command set-sysconfig
From:   Howard Chung <howardchung@google.com>
To:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        luiz.dentz@gmail.com
Cc:     mcchou@chromium.org, mmandlik@chromium.org, apusaka@chromium.org,
        Howard Chung <howardchung@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Add command set-sysconfig in btmgmt

Example usage:
[mgmt]# set-sysconfig -h
Parameters:
        -v <type:length:value>...
e.g.:
        set-sysconfig -v 001a:2:1234 001f:1:00
[mgmt]# set-sysconfig -v 8:2:abcd 1:02:0100 0016:2:0600

Reviewed-by: apusaka@chromium.org
---

Changes in v2:
- Replace hard tabs with soft tabs in commit messages

 tools/btmgmt.c | 109 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/tools/btmgmt.c b/tools/btmgmt.c
index c766de862a12..4cc94efe3f1a 100644
--- a/tools/btmgmt.c
+++ b/tools/btmgmt.c
@@ -1799,6 +1799,113 @@ static void cmd_read_sysconfig(int argc, char **argv)
 	}
 }
 
+static bool parse_mgmt_tlv(const char *input, uint16_t *type, uint8_t *length,
+								uint8_t *value)
+{
+	int i, value_starting_pos;
+
+	if (sscanf(input, "%4hx:%1hhu:%n", type, length,
+						&value_starting_pos) < 2) {
+		return false;
+	}
+
+	input += value_starting_pos;
+
+	if (*length * 2 != strlen(input))
+		return false;
+
+	for (i = 0; i < *length; i++) {
+		if (!sscanf(input + i * 2, "%2hhx", &value[i]))
+			return false;
+	}
+
+	return true;
+}
+
+static void set_sysconfig_rsp(uint8_t status, uint16_t len, const void *param,
+								void *user_data)
+{
+	if (status != MGMT_STATUS_SUCCESS) {
+		error("Could not set default system configuration with status "
+				"0x%02x (%s)", status, mgmt_errstr(status));
+		return bt_shell_noninteractive_quit(EXIT_FAILURE);
+	}
+
+	print("Set default system configuration success");
+
+	return bt_shell_noninteractive_quit(EXIT_SUCCESS);
+}
+
+static bool set_sysconfig(int argc, char **argv)
+{
+	struct mgmt_tlv_list *tlv_list = NULL;
+	int i;
+	uint16_t index, type;
+	uint8_t length;
+	uint8_t value[256] = {};
+	bool success = false;
+
+	index = mgmt_index;
+	if (index == MGMT_INDEX_NONE)
+		index = 0;
+
+	tlv_list = mgmt_tlv_list_new();
+	if (!tlv_list) {
+		error("tlv_list failed to init");
+		goto failed;
+	}
+
+	for (i = 0; i < argc; i++) {
+		if (!parse_mgmt_tlv(argv[i], &type, &length, value)) {
+			error("failed to parse");
+			goto failed;
+		}
+
+		if (!mgmt_tlv_add(tlv_list, type, length, value)) {
+			error("failed to add");
+			goto failed;
+		}
+	}
+
+	if (!mgmt_send_tlv(mgmt, MGMT_OP_SET_DEF_SYSTEM_CONFIG, index,
+				tlv_list, set_sysconfig_rsp, NULL, NULL)) {
+		error("Failed to send \"Set Default System Configuration\""
+								" command");
+		goto failed;
+	}
+
+	success = true;
+
+failed:
+	if (tlv_list)
+		mgmt_tlv_list_free(tlv_list);
+
+	return success;
+}
+
+static void set_sysconfig_usage(void)
+{
+	bt_shell_usage();
+	print("Parameters:\n\t-v <type:length:value>...\n"
+		"e.g.:\n\tset-sysconfig -v 001a:2:1234 001f:1:00");
+}
+
+static void cmd_set_sysconfig(int argc, char **argv)
+{
+	bool success = false;
+
+	if (strcasecmp(argv[1], "-v") == 0 && argc > 2) {
+		argc -= 2;
+		argv += 2;
+		success = set_sysconfig(argc, argv);
+	}
+
+	if (!success) {
+		set_sysconfig_usage();
+		bt_shell_noninteractive_quit(EXIT_FAILURE);
+	}
+}
+
 static void auto_power_enable_rsp(uint8_t status, uint16_t len,
 					const void *param, void *user_data)
 {
@@ -5079,6 +5186,8 @@ static const struct bt_shell_menu main_menu = {
 		cmd_exp_debug,		"Set debug feature"		},
 	{ "read-sysconfig",	NULL,
 		cmd_read_sysconfig,	"Read System Configuration"	},
+	{ "set-sysconfig",	"<-v|-h> [options...]",
+		cmd_set_sysconfig,	"Set System Configuration"	},
 	{} },
 };
 
-- 
2.29.2.729.g45daf8777d-goog

