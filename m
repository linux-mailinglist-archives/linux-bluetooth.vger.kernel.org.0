Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F32298C37
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Oct 2020 12:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1773964AbgJZLsK (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 26 Oct 2020 07:48:10 -0400
Received: from mail-pj1-f74.google.com ([209.85.216.74]:44553 "EHLO
        mail-pj1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1772606AbgJZLsK (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 26 Oct 2020 07:48:10 -0400
Received: by mail-pj1-f74.google.com with SMTP id f20so3732082pjq.9
        for <linux-bluetooth@vger.kernel.org>; Mon, 26 Oct 2020 04:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=Oy3acskM4JnalDODjbblRfauZKk5aBifOWSD7ZAGNFc=;
        b=se8qbcuwUSQWCnklwvty+DKDwhsicOcbNKbIU5WoHr/nOjj4xVQpmkNwNMWjlkrpIa
         0HWx4AGOt9gOKhEHZWf+jlCH8MNPI6FpomAim1ah8QL7jbGHDZksF4IGOZ8M7g6PUbjo
         jEtpi6f3Lxz738k0cPbsFKAB7ws42n8UybKDtRMuZd58DsHVSTE8vAVjp1/GkCWbTTOl
         i7SlGywaZVOhP2mCtDVBJTqKi4WbdC4Q6XQzDTteKJxmptD7zrkcZ1u7MOtghXGFVJwR
         GHBkn+yD5RdYiBw2bZ3u8MLmHwUx2FHhl7hKLQr+P0nltwDo8MRdQ5/HmwRzNTfQs9YU
         fw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=Oy3acskM4JnalDODjbblRfauZKk5aBifOWSD7ZAGNFc=;
        b=E7Cs7oZU5CrkYFtw4i+cv4PgKFuk8SRnziWKf0n5QjnmLkZL7aWZUT/BJ33WBqyw97
         LNEdSVm+2jgkgUjeZym+bgdi6AfotYB7X+r37CrX6lwcrjVwkbrArgel5TDsil8D2qGg
         VfUECV1uPrP0WuHvMeCh8YAC6d8Sc0Liel2iyKGPV4xpWLi8JE7rSizFSP3DId2GC1hG
         Xy4+yjjVUCczN/jMgZ3yJtm/wYkPaFblHsz1fhAwh9pg58X194sdE7lgwsMEa85edKpa
         kFzcad7eA6gEvmpEzIhMGjyT5OccQPKGvEPICo79JCJmS/rHXEjFcFA5Fq1hT4vizFiM
         fxBA==
X-Gm-Message-State: AOAM531HQfOvJvKykcbTseds2duPcWPkCaSloioB4xS+Tb8PK1P95SrU
        eh1/3Ha/L5TRi8HNM0RoFpLYjhfVVPqGgRyphStSsAdzlbfKp0NPXPorVbcVXAQOI0M/VAqFDHJ
        ZLEXLvVNucTb9qYA+8/OKqKWLJaqDiotl8vK0vOZZvmRsMupXhQhthsagAwDyaQb46bxjj6mRE9
        A56LQL98tkDKQ=
X-Google-Smtp-Source: ABdhPJwU9m7B4NJbDau9PqQTmtJWD7H1HGxIBCXAYX2+v85eEVguyUx0VGHb4oRw6X6BUG1f4c2Fl1wKD9U62KWCsg==
Sender: "howardchung via sendgmr" 
        <howardchung@howardchung-p920.tpe.corp.google.com>
X-Received: from howardchung-p920.tpe.corp.google.com ([2401:fa00:1:10:f693:9fff:fef4:4e45])
 (user=howardchung job=sendgmr) by 2002:a17:902:10a:b029:d2:6379:ab8a with
 SMTP id 10-20020a170902010ab02900d26379ab8amr13927563plb.66.1603712887601;
 Mon, 26 Oct 2020 04:48:07 -0700 (PDT)
Date:   Mon, 26 Oct 2020 19:48:02 +0800
Message-Id: <20201026194757.BlueZ.v4.1.I2fa28644a012f69c4665977e5816bcf8a51963f5@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
Subject: [BlueZ PATCH v4] core: Add support of variable length params in mgmt_config
From:   Howard Chung <howardchung@google.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     mcchou@chromium.org, alainm@chromium.org, mmandlik@chromium.org,
        apusaka@chromium.org, luiz.dentz@gmail.com,
        Howard Chung <howardchung@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This adds support of variable length parameters in mgmt_config.
Also fixed the endian issue.

Reviewed-by: Miao-chen Chou <mcchou@chromium.org>
---

Changes in v4:
- fix type of buf_len

Changes in v3:
- use iovec to fill buffer

Changes in v2:
- fix multiple line dereference issue

 src/adapter.c     | 300 +++++++++++++++++++++-------------------------
 src/main.c        |  35 +++++-
 src/shared/mgmt.c |  42 +++++++
 src/shared/mgmt.h |   4 +
 4 files changed, 213 insertions(+), 168 deletions(-)

diff --git a/src/adapter.c b/src/adapter.c
index c0053000ac19..561737bebd33 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -4163,269 +4163,237 @@ static void probe_devices(void *user_data)
 	device_probe_profiles(device, btd_device_get_uuids(device));
 }
 
+static void set_mgmt_tlv(struct iovec *iov, uint16_t type, uint8_t length,
+								void *value)
+{
+	struct mgmt_tlv *entry;
+	size_t iov_size;
+
+	iov_size = sizeof(struct mgmt_tlv) + length;
+	iov->iov_base = g_malloc(iov_size);
+	iov->iov_len = iov_size;
+
+	entry = (struct mgmt_tlv *)iov->iov_base;
+	entry->type = htobs(type);
+	entry->length = length;
+	memcpy(entry->value, value, length);
+}
+
 static void load_default_system_params(struct btd_adapter *adapter)
 {
-	struct {
-		struct mgmt_tlv entry;
-		union {
-			uint16_t u16;
-		};
-	} __packed *params;
-	uint16_t i = 0;
-	size_t len = 0;
+	struct iovec iovs[main_opts.default_params.num_entries];
+	int cnt = 0, i;
 	unsigned int err;
 
 	if (!main_opts.default_params.num_entries ||
 	    !btd_has_kernel_features(KERNEL_SET_SYSTEM_CONFIG))
 		return;
 
-	params = malloc0(sizeof(*params) *
-			main_opts.default_params.num_entries);
-
-	len = sizeof(params->entry) * main_opts.default_params.num_entries;
-
 	if (main_opts.default_params.br_page_scan_type != 0xFFFF) {
-		params[i].entry.type = 0x0000;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 = main_opts.default_params.br_page_scan_type;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0000,
+			sizeof(main_opts.default_params.br_page_scan_type),
+			&main_opts.default_params.br_page_scan_type);
+		cnt++;
 	}
 
 	if (main_opts.default_params.br_page_scan_interval) {
-		params[i].entry.type = 0x0001;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 = main_opts.default_params.br_page_scan_interval;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0001,
+			sizeof(main_opts.default_params.br_page_scan_interval),
+			&main_opts.default_params.br_page_scan_interval);
+		cnt++;
 	}
 
 	if (main_opts.default_params.br_page_scan_win) {
-		params[i].entry.type = 0x0002;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 = main_opts.default_params.br_page_scan_win;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0002,
+			sizeof(main_opts.default_params.br_page_scan_win),
+			&main_opts.default_params.br_page_scan_win);
+		cnt++;
 	}
 
 	if (main_opts.default_params.br_scan_type != 0xFFFF) {
-		params[i].entry.type = 0x0003;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 = main_opts.default_params.br_scan_type;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0003,
+			sizeof(main_opts.default_params.br_scan_type),
+			&main_opts.default_params.br_scan_type);
+		cnt++;
 	}
 
 	if (main_opts.default_params.br_scan_interval) {
-		params[i].entry.type = 0x0004;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 = main_opts.default_params.br_scan_interval;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0004,
+			sizeof(main_opts.default_params.br_scan_interval),
+			&main_opts.default_params.br_scan_interval);
+		cnt++;
 	}
 
 	if (main_opts.default_params.br_scan_win) {
-		params[i].entry.type = 0x0005;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 = main_opts.default_params.br_scan_win;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0005,
+			sizeof(main_opts.default_params.br_scan_win),
+			&main_opts.default_params.br_scan_win);
+		cnt++;
 	}
 
 	if (main_opts.default_params.br_link_supervision_timeout) {
-		params[i].entry.type = 0x0006;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 =
-			main_opts.default_params.br_link_supervision_timeout;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0006,
+			sizeof(main_opts.default_params.br_link_supervision_timeout),
+			&main_opts.default_params.br_link_supervision_timeout);
+		cnt++;
 	}
 
 	if (main_opts.default_params.br_page_timeout) {
-		params[i].entry.type = 0x0007;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 = main_opts.default_params.br_page_timeout;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0007,
+			sizeof(main_opts.default_params.br_page_timeout),
+			&main_opts.default_params.br_page_timeout);
+		cnt++;
 	}
 
 	if (main_opts.default_params.br_min_sniff_interval) {
-		params[i].entry.type = 0x0008;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 = main_opts.default_params.br_min_sniff_interval;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0008,
+			sizeof(main_opts.default_params.br_min_sniff_interval),
+			&main_opts.default_params.br_min_sniff_interval);
+		cnt++;
 	}
 
 	if (main_opts.default_params.br_max_sniff_interval) {
-		params[i].entry.type = 0x0009;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 = main_opts.default_params.br_max_sniff_interval;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0009,
+			sizeof(main_opts.default_params.br_max_sniff_interval),
+			&main_opts.default_params.br_max_sniff_interval);
+		cnt++;
 	}
 
 	if (main_opts.default_params.le_min_adv_interval) {
-		params[i].entry.type = 0x000a;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 = main_opts.default_params.le_min_adv_interval;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x000a,
+			sizeof(main_opts.default_params.le_min_adv_interval),
+			&main_opts.default_params.le_min_adv_interval);
+		cnt++;
 	}
 
 	if (main_opts.default_params.le_max_adv_interval) {
-		params[i].entry.type = 0x000b;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 = main_opts.default_params.le_max_adv_interval;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x000b,
+			sizeof(main_opts.default_params.le_max_adv_interval),
+			&main_opts.default_params.le_max_adv_interval);
+		cnt++;
 	}
 
 	if (main_opts.default_params.le_multi_adv_rotation_interval) {
-		params[i].entry.type = 0x000c;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 =
-			main_opts.default_params.le_multi_adv_rotation_interval;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x000c,
+			sizeof(main_opts.default_params.le_multi_adv_rotation_interval),
+			&main_opts.default_params.le_multi_adv_rotation_interval);
+		cnt++;
 	}
 
 	if (main_opts.default_params.le_scan_interval_autoconnect) {
-		params[i].entry.type = 0x000d;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 =
-			main_opts.default_params.le_scan_interval_autoconnect;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x000d,
+			sizeof(main_opts.default_params.le_scan_interval_autoconnect),
+			&main_opts.default_params.le_scan_interval_autoconnect);
+		cnt++;
 	}
 
 	if (main_opts.default_params.le_scan_win_autoconnect) {
-		params[i].entry.type = 0x000e;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 =
-			main_opts.default_params.le_scan_win_autoconnect;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x000e,
+			sizeof(main_opts.default_params.le_scan_win_autoconnect),
+			&main_opts.default_params.le_scan_win_autoconnect);
+		cnt++;
 	}
 
 	if (main_opts.default_params.le_scan_interval_suspend) {
-		params[i].entry.type = 0x000f;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 =
-			main_opts.default_params.le_scan_interval_suspend;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x000f,
+			sizeof(main_opts.default_params.le_scan_interval_suspend),
+			&main_opts.default_params.le_scan_interval_suspend);
+		cnt++;
 	}
 
 	if (main_opts.default_params.le_scan_win_suspend) {
-		params[i].entry.type = 0x0010;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 = main_opts.default_params.le_scan_win_suspend;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0010,
+			sizeof(main_opts.default_params.le_scan_win_suspend),
+			&main_opts.default_params.le_scan_win_suspend);
+		cnt++;
 	}
 
 	if (main_opts.default_params.le_scan_interval_discovery) {
-		params[i].entry.type = 0x0011;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 =
-			main_opts.default_params.le_scan_interval_discovery;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0011,
+			sizeof(main_opts.default_params.le_scan_interval_discovery),
+			&main_opts.default_params.le_scan_interval_discovery);
+		cnt++;
 	}
 
 	if (main_opts.default_params.le_scan_win_discovery) {
-		params[i].entry.type = 0x0012;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 =
-			main_opts.default_params.le_scan_win_discovery;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0012,
+			sizeof(main_opts.default_params.le_scan_win_discovery),
+			&main_opts.default_params.le_scan_win_discovery);
+		cnt++;
 	}
 
 	if (main_opts.default_params.le_scan_interval_adv_monitor) {
-		params[i].entry.type = 0x0013;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 =
-			main_opts.default_params.le_scan_interval_adv_monitor;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0013,
+			sizeof(main_opts.default_params.le_scan_interval_adv_monitor),
+			&main_opts.default_params.le_scan_interval_adv_monitor);
+		cnt++;
 	}
 
 	if (main_opts.default_params.le_scan_win_adv_monitor) {
-		params[i].entry.type = 0x0014;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 =
-			main_opts.default_params.le_scan_win_adv_monitor;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0014,
+			sizeof(main_opts.default_params.le_scan_win_adv_monitor),
+			&main_opts.default_params.le_scan_win_adv_monitor);
+		cnt++;
 	}
 
 	if (main_opts.default_params.le_scan_interval_connect) {
-		params[i].entry.type = 0x0015;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 =
-			main_opts.default_params.le_scan_interval_connect;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0015,
+			sizeof(main_opts.default_params.le_scan_interval_connect),
+			&main_opts.default_params.le_scan_interval_connect);
+		cnt++;
 	}
 
 	if (main_opts.default_params.le_scan_win_connect) {
-		params[i].entry.type = 0x0016;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 = main_opts.default_params.le_scan_win_connect;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0016,
+			sizeof(main_opts.default_params.le_scan_win_connect),
+			&main_opts.default_params.le_scan_win_connect);
+		cnt++;
 	}
 
 	if (main_opts.default_params.le_min_conn_interval) {
-		params[i].entry.type = 0x0017;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 = main_opts.default_params.le_min_conn_interval;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0017,
+			sizeof(main_opts.default_params.le_min_conn_interval),
+			&main_opts.default_params.le_min_conn_interval);
+		cnt++;
 	}
 
 	if (main_opts.default_params.le_max_conn_interval) {
-		params[i].entry.type = 0x0018;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 = main_opts.default_params.le_max_conn_interval;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0018,
+			sizeof(main_opts.default_params.le_max_conn_interval),
+			&main_opts.default_params.le_max_conn_interval);
+		cnt++;
 	}
 
 	if (main_opts.default_params.le_conn_latency) {
-		params[i].entry.type = 0x0019;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 = main_opts.default_params.le_conn_latency;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x0019,
+			sizeof(main_opts.default_params.le_conn_latency),
+			&main_opts.default_params.le_conn_latency);
+		cnt++;
 	}
 
 	if (main_opts.default_params.le_conn_lsto) {
-		params[i].entry.type = 0x001a;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 = main_opts.default_params.le_conn_lsto;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x001a,
+			sizeof(main_opts.default_params.le_conn_lsto),
+			&main_opts.default_params.le_conn_lsto);
+		cnt++;
 	}
 
 	if (main_opts.default_params.le_autoconnect_timeout) {
-		params[i].entry.type = 0x001b;
-		params[i].entry.length = sizeof(params[i].u16);
-		params[i].u16 = main_opts.default_params.le_autoconnect_timeout;
-		++i;
-		len += sizeof(params[i].u16);
+		set_mgmt_tlv(iovs + cnt, 0x001b,
+			sizeof(main_opts.default_params.le_autoconnect_timeout),
+			&main_opts.default_params.le_autoconnect_timeout);
+		cnt++;
 	}
 
-	err = mgmt_send(adapter->mgmt, MGMT_OP_SET_DEF_SYSTEM_CONFIG,
-			adapter->dev_id, len, params, NULL, NULL, NULL);
+	err = mgmt_sendv(adapter->mgmt, MGMT_OP_SET_DEF_SYSTEM_CONFIG,
+			adapter->dev_id, cnt, iovs, NULL, NULL, NULL);
 	if (!err)
 		btd_error(adapter->dev_id,
 				"Failed to set default system config for hci%u",
 				adapter->dev_id);
 
-	free(params);
+	for (i = 0; i < cnt; i++)
+		g_free(iovs[i].iov_base);
 }
 
 static void load_devices(struct btd_adapter *adapter)
diff --git a/src/main.c b/src/main.c
index 77be776686a8..b83f7bffb485 100644
--- a/src/main.c
+++ b/src/main.c
@@ -305,120 +305,149 @@ static void parse_controller_config(GKeyFile *config)
 {
 	static const struct {
 		const char * const val_name;
-		uint16_t * const val;
+		void * const val;
+		const size_t size;
 		const uint16_t min;
 		const uint16_t max;
 	} params[] = {
 		{ "BRPageScanType",
 		  &main_opts.default_params.br_page_scan_type,
+		  sizeof(main_opts.default_params.br_page_scan_type),
 		  0,
 		  1},
 		{ "BRPageScanInterval",
 		  &main_opts.default_params.br_page_scan_interval,
+		  sizeof(main_opts.default_params.br_page_scan_interval),
 		  0x0012,
 		  0x1000},
 		{ "BRPageScanWindow",
 		  &main_opts.default_params.br_page_scan_win,
+		  sizeof(main_opts.default_params.br_page_scan_win),
 		  0x0011,
 		  0x1000},
 		{ "BRInquiryScanType",
 		  &main_opts.default_params.br_scan_type,
+		  sizeof(main_opts.default_params.br_scan_type),
 		  0,
 		  1},
 		{ "BRInquiryScanInterval",
 		  &main_opts.default_params.br_scan_interval,
+		  sizeof(main_opts.default_params.br_scan_interval),
 		  0x0012,
 		  0x1000},
 		{ "BRInquiryScanWindow",
 		  &main_opts.default_params.br_scan_win,
+		  sizeof(main_opts.default_params.br_scan_win),
 		  0x0011,
 		  0x1000},
 		{ "BRLinkSupervisionTimeout",
 		  &main_opts.default_params.br_link_supervision_timeout,
+		  sizeof(main_opts.default_params.br_link_supervision_timeout),
 		  0x0001,
 		  0xFFFF},
 		{ "BRPageTimeout",
 		  &main_opts.default_params.br_page_timeout,
+		  sizeof(main_opts.default_params.br_page_scan_win),
 		  0x0001,
 		  0xFFFF},
 		{ "BRMinSniffInterval",
 		  &main_opts.default_params.br_min_sniff_interval,
+		  sizeof(main_opts.default_params.br_min_sniff_interval),
 		  0x0001,
 		  0xFFFE},
 		{ "BRMaxSniffInterval",
 		  &main_opts.default_params.br_max_sniff_interval,
+		  sizeof(main_opts.default_params.br_max_sniff_interval),
 		  0x0001,
 		  0xFFFE},
 		{ "LEMinAdvertisementInterval",
 		  &main_opts.default_params.le_min_adv_interval,
+		  sizeof(main_opts.default_params.le_min_adv_interval),
 		  0x0020,
 		  0x4000},
 		{ "LEMaxAdvertisementInterval",
 		  &main_opts.default_params.le_max_adv_interval,
+		  sizeof(main_opts.default_params.le_max_adv_interval),
 		  0x0020,
 		  0x4000},
 		{ "LEMultiAdvertisementRotationInterval",
 		  &main_opts.default_params.le_multi_adv_rotation_interval,
+		  sizeof(main_opts.default_params.le_multi_adv_rotation_interval),
 		  0x0001,
 		  0xFFFF},
 		{ "LEScanIntervalAutoConnect",
 		  &main_opts.default_params.le_scan_interval_autoconnect,
+		  sizeof(main_opts.default_params.le_scan_interval_autoconnect),
 		  0x0004,
 		  0x4000},
 		{ "LEScanWindowAutoConnect",
 		  &main_opts.default_params.le_scan_win_autoconnect,
+		  sizeof(main_opts.default_params.le_scan_win_autoconnect),
 		  0x0004,
 		  0x4000},
 		{ "LEScanIntervalSuspend",
 		  &main_opts.default_params.le_scan_interval_suspend,
+		  sizeof(main_opts.default_params.le_scan_interval_suspend),
 		  0x0004,
 		  0x4000},
 		{ "LEScanWindowSuspend",
 		  &main_opts.default_params.le_scan_win_suspend,
+		  sizeof(main_opts.default_params.le_scan_win_suspend),
 		  0x0004,
 		  0x4000},
 		{ "LEScanIntervalDiscovery",
 		  &main_opts.default_params.le_scan_interval_discovery,
+		  sizeof(main_opts.default_params.le_scan_interval_discovery),
 		  0x0004,
 		  0x4000},
 		{ "LEScanWindowDiscovery",
 		  &main_opts.default_params.le_scan_win_discovery,
+		  sizeof(main_opts.default_params.le_scan_win_discovery),
 		  0x0004,
 		  0x4000},
 		{ "LEScanIntervalAdvMonitor",
 		  &main_opts.default_params.le_scan_interval_adv_monitor,
+		  sizeof(main_opts.default_params.le_scan_interval_adv_monitor),
 		  0x0004,
 		  0x4000},
 		{ "LEScanWindowAdvMonitor",
 		  &main_opts.default_params.le_scan_win_adv_monitor,
+		  sizeof(main_opts.default_params.le_scan_win_adv_monitor),
 		  0x0004,
 		  0x4000},
 		{ "LEScanIntervalConnect",
 		  &main_opts.default_params.le_scan_interval_connect,
+		  sizeof(main_opts.default_params.le_scan_interval_connect),
 		  0x0004,
 		  0x4000},
 		{ "LEScanWindowConnect",
 		  &main_opts.default_params.le_scan_win_connect,
+		  sizeof(main_opts.default_params.le_scan_win_connect),
 		  0x0004,
 		  0x4000},
 		{ "LEMinConnectionInterval",
 		  &main_opts.default_params.le_min_conn_interval,
+		  sizeof(main_opts.default_params.le_min_conn_interval),
 		  0x0006,
 		  0x0C80},
 		{ "LEMaxConnectionInterval",
 		  &main_opts.default_params.le_max_conn_interval,
+		  sizeof(main_opts.default_params.le_max_conn_interval),
 		  0x0006,
 		  0x0C80},
 		{ "LEConnectionLatency",
 		  &main_opts.default_params.le_conn_latency,
+		  sizeof(main_opts.default_params.le_conn_latency),
 		  0x0000,
 		  0x01F3},
 		{ "LEConnectionSupervisionTimeout",
 		  &main_opts.default_params.le_conn_lsto,
+		  sizeof(main_opts.default_params.le_conn_lsto),
 		  0x000A,
 		  0x0C80},
 		{ "LEAutoconnecttimeout",
 		  &main_opts.default_params.le_autoconnect_timeout,
+		  sizeof(main_opts.default_params.le_autoconnect_timeout),
 		  0x0001,
 		  0x4000},
 	};
@@ -439,7 +468,9 @@ static void parse_controller_config(GKeyFile *config)
 
 			val = MAX(val, params[i].min);
 			val = MIN(val, params[i].max);
-			*params[i].val = val;
+
+			val = htobl(val);
+			memcpy(params[i].val, &val, params[i].size);
 			++main_opts.default_params.num_entries;
 		}
 	}
diff --git a/src/shared/mgmt.c b/src/shared/mgmt.c
index b327b4088c6f..64c4f266d1db 100644
--- a/src/shared/mgmt.c
+++ b/src/shared/mgmt.c
@@ -558,6 +558,48 @@ static struct mgmt_request *create_request(uint16_t opcode, uint16_t index,
 	return request;
 }
 
+unsigned int mgmt_sendv(struct mgmt *mgmt, uint16_t opcode, uint16_t index,
+				int count, void *iovecs,
+				mgmt_request_func_t callback,
+				void *user_data, mgmt_destroy_func_t destroy)
+{
+	FILE *ptr = NULL;
+	int fd;
+	ssize_t buf_len;
+	uint8_t *buf = NULL;
+	unsigned int ret = 0;
+
+	ptr = tmpfile();
+
+	if (!ptr)
+		goto done;
+
+	fd = fileno(ptr);
+	buf_len = writev(fd, (struct iovec *)iovecs, count);
+
+	if (buf_len < 0)
+		goto done;
+
+	buf = malloc(buf_len);
+
+	if (!buf)
+		goto done;
+
+	rewind(ptr);
+	if (fread(buf, 1, buf_len, ptr) < buf_len)
+		goto done;
+
+	ret = mgmt_send(mgmt, opcode, index, buf_len, buf, callback, user_data,
+								destroy);
+
+done:
+	if (ptr)
+		fclose(ptr);
+	if (buf)
+		free(buf);
+	return ret;
+}
+
 unsigned int mgmt_send(struct mgmt *mgmt, uint16_t opcode, uint16_t index,
 				uint16_t length, const void *param,
 				mgmt_request_func_t callback,
diff --git a/src/shared/mgmt.h b/src/shared/mgmt.h
index 6608faa7ed0f..87158ebc3774 100644
--- a/src/shared/mgmt.h
+++ b/src/shared/mgmt.h
@@ -33,6 +33,10 @@ bool mgmt_set_close_on_unref(struct mgmt *mgmt, bool do_close);
 typedef void (*mgmt_request_func_t)(uint8_t status, uint16_t length,
 					const void *param, void *user_data);
 
+unsigned int mgmt_sendv(struct mgmt *mgmt, uint16_t opcode, uint16_t index,
+				int count, void *iovecs,
+				mgmt_request_func_t callback,
+				void *user_data, mgmt_destroy_func_t destroy);
 unsigned int mgmt_send(struct mgmt *mgmt, uint16_t opcode, uint16_t index,
 				uint16_t length, const void *param,
 				mgmt_request_func_t callback,
-- 
2.29.0.rc1.297.gfa9743e501-goog

