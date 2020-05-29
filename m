Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A06B11E81FD
	for <lists+linux-bluetooth@lfdr.de>; Fri, 29 May 2020 17:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbgE2PjB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 29 May 2020 11:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbgE2PjB (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 29 May 2020 11:39:01 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D04C03E969
        for <linux-bluetooth@vger.kernel.org>; Fri, 29 May 2020 08:39:01 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id b13so1709397vsm.13
        for <linux-bluetooth@vger.kernel.org>; Fri, 29 May 2020 08:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=evPFsobzfzYzocLyRTYkoU44BUB/i3M66ha4jpOsv98=;
        b=fzc+V212HNu/lhR6QZb2tLDGwoL0EU7/RF2hXcN7ATUAN24Ty6cMOUE1LW6ESq7ij4
         TsQe6wRjn3XGpD6Z9T5hP18JF1ns5WZfSnLaachaihs9xiZHD51qosOP0pQQM05sK4nj
         8cszuBkg0AqBmGXVIuObP4NBDfOMYbitTz26A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=evPFsobzfzYzocLyRTYkoU44BUB/i3M66ha4jpOsv98=;
        b=EHz1nvonUFibZfw8rWnqVP94dy3FoDQUKZWnZtcRPXt+dYwuNjV4Czso5H59OwwRzF
         qtsuTBDqL8Pxi0wfmkoAEMos0+DpgdzJP/CLJA8qn4gSY0bZamL6vaVbqL5atFmJRjIf
         fmSv6yu+Vdc2sEyyWSXkQgM0QLBLYUZA/uAHj7d76c3KeUS/GOVCG2E5P+dyycaSWeHW
         eqe3rWL73olfpVe2yH3PlZ39bAB/axT3YOkvF1GHxIcpSrOanngwCO8OsrphvdWAtHtp
         1O9ysNbPBUWbgom5mUTbKfrIK8aSmVvifC2a5P3LI6N1+Z6zXdiluXNTW10iYROVdbyh
         +U3Q==
X-Gm-Message-State: AOAM530H7/D8uqejeMSukZHvswximCO3tBedsZP9+EsKyNyBjJtH0JBJ
        gjNvLjCfY9I1jcBXq0IqGJ8MiAUlBh0=
X-Google-Smtp-Source: ABdhPJyfZc5APUxdnlBX0XgU14If7jwjWDMvHFBFAmTSZaTCKiHGRaO1abr6fd4RjzD3uo+v82fb3Q==
X-Received: by 2002:a67:f8c6:: with SMTP id c6mr6259106vsp.158.1590766739862;
        Fri, 29 May 2020 08:38:59 -0700 (PDT)
Received: from alain.c.googlers.com.com (252.177.243.35.bc.googleusercontent.com. [35.243.177.252])
        by smtp.gmail.com with ESMTPSA id o2sm1309494vkl.27.2020.05.29.08.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 08:38:59 -0700 (PDT)
From:   Alain Michaud <alainm@chromium.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Alain Michaud <alainm@chromium.org>
Subject: [BlueZ PATCH v3 2/4] adapter:set default system configuration if available
Date:   Fri, 29 May 2020 15:38:13 +0000
Message-Id: <20200529153814.213125-3-alainm@chromium.org>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
In-Reply-To: <20200529153814.213125-1-alainm@chromium.org>
References: <20200529153814.213125-1-alainm@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This change loads any specified system configuration if provided and
supported by the kernel.

---

Changes in v3: None
Changes in v2: None

 src/adapter.c | 251 ++++++++++++++++++++++++++++++++++++++++++++++++++
 src/hcid.h    |  39 ++++++++
 2 files changed, 290 insertions(+)

diff --git a/src/adapter.c b/src/adapter.c
index 972d88772..da3777cba 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -120,6 +120,8 @@ static bool kernel_conn_control = false;
 
 static bool kernel_blocked_keys_supported = false;
 
+static bool kernel_set_system_params = false;
+
 static GList *adapter_list = NULL;
 static unsigned int adapter_remaining = 0;
 static bool powering_down = false;
@@ -4157,6 +4159,250 @@ static void probe_devices(void *user_data)
 	device_probe_profiles(device, btd_device_get_uuids(device));
 }
 
+static void load_default_system_params(struct btd_adapter *adapter)
+{
+	/* note: for now all params are 2 bytes, if varying size params are
+	 * added, calculating the right size of buffer will be necessary first.
+	 */
+	struct controller_params_tlv {
+		uint16_t parameter_type;
+		uint8_t length;
+		uint16_t value;
+	} __packed;
+
+	struct controller_params_tlv *params = NULL;
+	uint16_t i = 0;
+	size_t cp_size;
+
+	if (!main_opts.default_params.num_set_params ||
+		!kernel_set_system_params)
+		return;
+
+	cp_size = sizeof(struct controller_params_tlv) *
+				main_opts.default_params.num_set_params;
+	params = g_try_malloc0(cp_size);
+	if (!params)
+		return;
+
+	if (main_opts.default_params.br_page_scan_type != 0xFFFF) {
+		params[i].parameter_type = 0x0000;
+		params[i].length = sizeof(params[i].value);
+		params[i].value = main_opts.default_params.br_page_scan_type;
+		++i;
+	}
+
+	if (main_opts.default_params.br_page_scan_interval) {
+		params[i].parameter_type = 0x0001;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+				main_opts.default_params.br_page_scan_interval;
+		++i;
+	}
+
+	if (main_opts.default_params.br_page_scan_window) {
+		params[i].parameter_type = 0x0002;
+		params[i].length = sizeof(params[i].value);
+		params[i].value = main_opts.default_params.br_page_scan_window;
+		++i;
+	}
+
+	if (main_opts.default_params.br_inquiry_scan_type != 0xFFFF) {
+		params[i].parameter_type = 0x0003;
+		params[i].length = sizeof(params[i].value);
+		params[i].value = main_opts.default_params.br_inquiry_scan_type;
+		++i;
+	}
+
+	if (main_opts.default_params.br_inquiry_scan_interval) {
+		params[i].parameter_type = 0x0004;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+			main_opts.default_params.br_inquiry_scan_interval;
+		++i;
+	}
+
+	if (main_opts.default_params.br_inquiry_scan_window) {
+		params[i].parameter_type = 0x0005;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+				main_opts.default_params.br_inquiry_scan_window;
+		++i;
+	}
+
+	if (main_opts.default_params.br_link_supervision_timeout) {
+		params[i].parameter_type = 0x0006;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+			main_opts.default_params.br_link_supervision_timeout;
+		++i;
+	}
+
+	if (main_opts.default_params.br_page_timeout) {
+		params[i].parameter_type = 0x0007;
+		params[i].length = sizeof(params[i].value);
+		params[i].value = main_opts.default_params.br_page_timeout;
+		++i;
+	}
+
+	if (main_opts.default_params.br_min_sniff_interval) {
+		params[i].parameter_type = 0x0008;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+				main_opts.default_params.br_min_sniff_interval;
+		++i;
+	}
+
+	if (main_opts.default_params.br_max_sniff_interval) {
+		params[i].parameter_type = 0x0009;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+				main_opts.default_params.br_max_sniff_interval;
+		++i;
+	}
+
+	if (main_opts.default_params.le_min_adv_interval) {
+		params[i].parameter_type = 0x000a;
+		params[i].length = sizeof(params[i].value);
+		params[i].value = main_opts.default_params.le_min_adv_interval;
+		++i;
+	}
+
+	if (main_opts.default_params.le_max_adv_interval) {
+		params[i].parameter_type = 0x000b;
+		params[i].length = sizeof(params[i].value);
+		params[i].value = main_opts.default_params.le_max_adv_interval;
+		++i;
+	}
+
+	if (main_opts.default_params.le_multi_adv_rotation_interval) {
+		params[i].parameter_type = 0x000c;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+			main_opts.default_params.le_multi_adv_rotation_interval;
+		++i;
+	}
+
+	if (main_opts.default_params.le_scan_interval_autoconnect) {
+		params[i].parameter_type = 0x000d;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+			main_opts.default_params.le_scan_interval_autoconnect;
+		++i;
+	}
+
+	if (main_opts.default_params.le_scan_window_autoconnect) {
+		params[i].parameter_type = 0x000e;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+			main_opts.default_params.le_scan_window_autoconnect;
+		++i;
+	}
+
+	if (main_opts.default_params.le_scan_interval_suspend) {
+		params[i].parameter_type = 0x000f;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+			main_opts.default_params.le_scan_interval_suspend;
+		++i;
+	}
+
+	if (main_opts.default_params.le_scan_window_suspend) {
+		params[i].parameter_type = 0x0010;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+			main_opts.default_params.le_scan_window_suspend;
+		++i;
+	}
+
+	if (main_opts.default_params.le_scan_interval_discovery) {
+		params[i].parameter_type = 0x0011;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+			main_opts.default_params.le_scan_interval_discovery;
+		++i;
+	}
+
+	if (main_opts.default_params.le_scan_window_discovery) {
+		params[i].parameter_type = 0x0012;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+			main_opts.default_params.le_scan_window_discovery;
+		++i;
+	}
+
+	if (main_opts.default_params.le_scan_interval_adv_monitor) {
+		params[i].parameter_type = 0x0013;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+			main_opts.default_params.le_scan_interval_adv_monitor;
+		++i;
+	}
+
+	if (main_opts.default_params.le_scan_window_adv_monitor) {
+		params[i].parameter_type = 0x0014;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+			main_opts.default_params.le_scan_window_adv_monitor;
+		++i;
+	}
+
+	if (main_opts.default_params.le_scan_interval_connect) {
+		params[i].parameter_type = 0x0015;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+			main_opts.default_params.le_scan_interval_connect;
+		++i;
+	}
+
+	if (main_opts.default_params.le_scan_window_connect) {
+		params[i].parameter_type = 0x0016;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+				main_opts.default_params.le_scan_window_connect;
+		++i;
+	}
+
+	if (main_opts.default_params.le_min_connection_interval) {
+		params[i].parameter_type = 0x0017;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+			main_opts.default_params.le_min_connection_interval;
+		++i;
+	}
+
+	if (main_opts.default_params.le_max_connection_interval) {
+		params[i].parameter_type = 0x0018;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+			main_opts.default_params.le_max_connection_interval;
+		++i;
+	}
+
+	if (main_opts.default_params.le_connection_latency) {
+		params[i].parameter_type = 0x0019;
+		params[i].length = sizeof(params[i].value);
+		params[i].value =
+			main_opts.default_params.le_connection_latency;
+		++i;
+	}
+
+	if (main_opts.default_params.le_connection_lsto) {
+		params[i].parameter_type = 0x001a;
+		params[i].length = sizeof(params[i].value);
+		params[i].value = main_opts.default_params.le_connection_lsto;
+		++i;
+	}
+
+	mgmt_send(adapter->mgmt, MGMT_OP_SET_DEFAULT_SYSTEM_PARAMETERS,
+			adapter->dev_id, cp_size, params, NULL, NULL, NULL);
+
+	btd_error(adapter->dev_id,
+				"Failed to set default system params for hci%u",
+				adapter->dev_id);
+
+	g_free(params);
+}
+
 static void load_devices(struct btd_adapter *adapter)
 {
 	char dirname[PATH_MAX];
@@ -8265,6 +8511,7 @@ load:
 	load_drivers(adapter);
 	btd_profile_foreach(probe_profile, adapter);
 	clear_blocked(adapter);
+	load_default_system_params(adapter);
 	load_devices(adapter);
 
 	/* restore Service Changed CCC value for bonded devices */
@@ -9158,6 +9405,10 @@ static void read_commands_complete(uint8_t status, uint16_t length,
 			DBG("kernel supports the set_blocked_keys op");
 			kernel_blocked_keys_supported = true;
 			break;
+		case MGMT_OP_SET_DEFAULT_SYSTEM_PARAMETERS:
+			DBG("kernel supports set system params");
+			kernel_set_system_params = true;
+			break;
 		default:
 			break;
 		}
diff --git a/src/hcid.h b/src/hcid.h
index 1bf93784d..e6d966c58 100644
--- a/src/hcid.h
+++ b/src/hcid.h
@@ -49,6 +49,45 @@ struct main_opts {
 	uint32_t	discovto;
 	uint8_t		privacy;
 
+	struct {
+		uint16_t	num_set_params;
+
+		uint16_t	br_page_scan_type;
+		uint16_t	br_page_scan_interval;
+		uint16_t	br_page_scan_window;
+
+		uint16_t	br_inquiry_scan_type;
+		uint16_t	br_inquiry_scan_interval;
+		uint16_t	br_inquiry_scan_window;
+
+		uint16_t	br_link_supervision_timeout;
+		uint16_t	br_page_timeout;
+
+		uint16_t	br_min_sniff_interval;
+		uint16_t	br_max_sniff_interval;
+
+		uint16_t	le_min_adv_interval;
+		uint16_t	le_max_adv_interval;
+		uint16_t	le_multi_adv_rotation_interval;
+
+		uint16_t	le_scan_interval_autoconnect;
+		uint16_t	le_scan_window_autoconnect;
+		uint16_t	le_scan_interval_suspend;
+		uint16_t	le_scan_window_suspend;
+		uint16_t	le_scan_interval_discovery;
+		uint16_t	le_scan_window_discovery;
+		uint16_t	le_scan_interval_adv_monitor;
+		uint16_t	le_scan_window_adv_monitor;
+		uint16_t	le_scan_interval_connect;
+		uint16_t	le_scan_window_connect;
+
+		uint16_t	le_min_connection_interval;
+		uint16_t	le_max_connection_interval;
+		uint16_t	le_connection_latency;
+		uint16_t	le_connection_lsto;
+	} default_params;
+
+
 	gboolean	reverse_discovery;
 	gboolean	name_resolv;
 	gboolean	debug_keys;
-- 
2.27.0.rc0.183.gde8f92d652-goog

