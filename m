Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B63BD2E3690
	for <lists+linux-bluetooth@lfdr.de>; Mon, 28 Dec 2020 12:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727373AbgL1LfO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 28 Dec 2020 06:35:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727341AbgL1LfO (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 28 Dec 2020 06:35:14 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F37C061796
        for <linux-bluetooth@vger.kernel.org>; Mon, 28 Dec 2020 03:34:33 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id e74so17882056ybh.19
        for <linux-bluetooth@vger.kernel.org>; Mon, 28 Dec 2020 03:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=lXQ0LpCr8+V+7Lii7uhFuJpkcYXzYIJ/ONcFeoVEIR4=;
        b=myFfZUu8s8GYQLY65kKyMRa28LeNcv0Q7GATY8BEH92poZljuTlD1gSciltE5ZaZo6
         qxzqYmLU9xAfy1ygBQ75TV8vZ9QMsjGnJ9TYxyL92Bhu98/AqJ0c/ZfA78xhRH5Gh4IN
         I3rkJmoqnMPW7Yys2+cvIkzhO5XQ+csFg3wK4ZmHxRwr1lUFYXDevqMuGIKqhoFyZ04L
         8eIJA0r727eACaDKSquc94v5QWkJJpvV9KALmHOhUjvbaJSiCgLibQnC7pc7ISqbLCCz
         aS7QV3imUCKXPLyBy3zkaqpuVIti6HK9cbAhZRZNL2auEAl/Z4ti799nNPQ+mc0XxyS9
         da4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=lXQ0LpCr8+V+7Lii7uhFuJpkcYXzYIJ/ONcFeoVEIR4=;
        b=PMyqhc6MJVvGtxYuryiWjb9DY1n+I4149fwxs8gUbA8bi6TUDnhmpI3WXUp2q57yUn
         CvAh/UMi5jFEXhBZkCEnsuouaKoAfv4KhEa2ijh+ybiBGR5fubULphEQ7ol3C6i3T9QB
         EtZZqmRwHBjPhNl3kuKg8d4sW2XiVGd+SsyPVO721KnV30e5L9Fpk9Rx23Yow3phz27o
         AspqlJKnyb6ZHfrqZzvFNnW6gdU9fZ/C8JwSvDRlSbb+oTG1jCIwr9F6T0qT5cenbweq
         hkpZMTj25KqS1j36lrxTpO1nqzLGqWT8751kUXefqLIMblCUozqXLOcZiPn7AcJffWA2
         U0kQ==
X-Gm-Message-State: AOAM533J9DvYKkyosstSNLmTivrkB+BKePNHmy4rxpSZ1Cc9MHzpUR7E
        xRaiTTlchde4qeYJhl8+3ODwdqQ/yNCNucjL8Y1Xtpcs4vfwBTHFbmx+7TqINu7kEgjLTyUnAWk
        Cb+CzPnoOcDAJe9JJLly3E69mj3JuGMz4ma6rFY8jlef9sb+l5rCW/XsI6OBQTFGZCuKFigSG/z
        fRNEaN2ygLvAs=
X-Google-Smtp-Source: ABdhPJxuObMKa+iif9y93CVtystxym1ahJPO2A167er9xTEh8x+4kpTGAZQfQtxD8ogXvIH2wTOG7MB/TMY8w7P6NA==
Sender: "howardchung via sendgmr" 
        <howardchung@howardchung-p920.tpe.corp.google.com>
X-Received: from howardchung-p920.tpe.corp.google.com ([2401:fa00:1:10:f693:9fff:fef4:4e45])
 (user=howardchung job=sendgmr) by 2002:a25:8249:: with SMTP id
 d9mr60901214ybn.41.1609155272939; Mon, 28 Dec 2020 03:34:32 -0800 (PST)
Date:   Mon, 28 Dec 2020 19:34:19 +0800
In-Reply-To: <20201228193351.Bluez.v3.1.Ie32770d0eed2e7739ce9d17d920766fb6aee8583@changeid>
Message-Id: <20201228193351.Bluez.v3.3.Idca009971ca95228a3fa7232ef648f18ff64d185@changeid>
Mime-Version: 1.0
References: <20201228193351.Bluez.v3.1.Ie32770d0eed2e7739ce9d17d920766fb6aee8583@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [Bluez PATCH v3 3/4] btmgmt: Add command set-sysconfig
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

(no changes since v2)

Changes in v2:
- Replace hard tabs with soft tabs in commit messages

 tools/btmgmt.c | 109 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/tools/btmgmt.c b/tools/btmgmt.c
index 7d83d3ee6bd5..850268b4c322 100644
--- a/tools/btmgmt.c
+++ b/tools/btmgmt.c
@@ -1798,6 +1798,113 @@ static void cmd_read_sysconfig(int argc, char **argv)
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
@@ -5078,6 +5185,8 @@ static const struct bt_shell_menu main_menu = {
 		cmd_exp_debug,		"Set debug feature"		},
 	{ "read-sysconfig",	NULL,
 		cmd_read_sysconfig,	"Read System Configuration"	},
+	{ "set-sysconfig",	"<-v|-h> [options...]",
+		cmd_set_sysconfig,	"Set System Configuration"	},
 	{} },
 };
 
-- 
2.29.2.729.g45daf8777d-goog

