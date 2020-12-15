Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03AAC2DAAA5
	for <lists+linux-bluetooth@lfdr.de>; Tue, 15 Dec 2020 11:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgLOKLv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 15 Dec 2020 05:11:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727106AbgLOKLm (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 15 Dec 2020 05:11:42 -0500
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA0C9C0617A7
        for <linux-bluetooth@vger.kernel.org>; Tue, 15 Dec 2020 02:11:01 -0800 (PST)
Received: by mail-pg1-x54a.google.com with SMTP id g24so13781777pgh.14
        for <linux-bluetooth@vger.kernel.org>; Tue, 15 Dec 2020 02:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=Z5rgqdUpLFe1Tt9GAbm9e0jGCeMmeJ2XtTKDuzylehU=;
        b=ViCJxoFZ+t4oBmkKGGiFvr3s/vxaBZhZ5WcqALfU8wAzhkfsB4M5ibdLTcbca/yGZj
         mubpAG6JShbie0CWXq0ItesMGLyqp08GC0QCe/sadYoJpTpsBKa845r+4c72SG/2F2cx
         g4O7gtA8vXEuF8MIEO4gn5Xv/ydJpbjfGDNYTzbIFkM8MVisi53RcalpP5wh+ZLEgsiq
         SjtY87OGT8bOV4RKPhYXUN2/lWXOGF0iRQrci4LknK8Y+WP6FRIAxnMej7Zi8TLJAzDr
         4IG3ApXlrzDn62rfg961kv9ml0oEzd/p9XlyiTIMdn2FDKTKJ2b8lYlUdfcDj1thsYz1
         JL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Z5rgqdUpLFe1Tt9GAbm9e0jGCeMmeJ2XtTKDuzylehU=;
        b=ZvdQACJZThFwquXZaOXMi1QES68/GFx5tvcRrUdd2SnQil4iTmiOxoScj7ytz22x4V
         VYXee7bH06EhQny3qjtUUbZYwKXGyvqihs5/UQE9CXgelBluFwmOTUxhqHEFefToZ8SJ
         EqZ6gxeVOOQMhGwZK9W6YICcDo/EdnhZlkezQzgncQIogMPfsjZrQaW8C6yR4ptInnJu
         Rz92A8NYpJj3z1Lnp0aoIFh+75i8hGR0ou3aAUrxwA8TnC2w2oTNsQ6aJtPSb3jXE2OH
         Og+sRfEWgZ5vLehNY+ePXcTH3tqXVDswElDNgcY3CGUyx+/qF7WE4R9KJNDkpQwVmYQn
         P8iQ==
X-Gm-Message-State: AOAM5328bZbJDoONgjKjXIo96AQfYtUrXfhkU/AsGZLkNUCBh6mcILjZ
        R3VpgehXcRft58akcIPFUsp05jh6EAJy3EQhzxplDIDS5K/hpmaUN6jd6o6NqNJtFnNV9ZzQMle
        qu2cq4J33se1tugwcMRxkMXHDouB5BYRZ3E0CwBcMtqU0cuUKg3jE5Hs80syYkWLv9sdYmfKW7f
        Xg
X-Google-Smtp-Source: ABdhPJwvscs853yZH9ZNF0fhxZHOkoUG7jmUggQ5EkJ2WOthhuW0pB2Lup+IuWApNW42MYzVSP/T7Gqk0nw1
Sender: "apusaka via sendgmr" <apusaka@apusaka-p920.tpe.corp.google.com>
X-Received: from apusaka-p920.tpe.corp.google.com ([2401:fa00:1:b:f693:9fff:fef4:2347])
 (user=apusaka job=sendgmr) by 2002:a17:902:123:b029:dc:27b:3c62 with SMTP id
 32-20020a1709020123b02900dc027b3c62mr1937339plb.16.1608027061189; Tue, 15 Dec
 2020 02:11:01 -0800 (PST)
Date:   Tue, 15 Dec 2020 18:10:38 +0800
In-Reply-To: <20201215181024.Bluez.v2.1.Iab784797733f28413e9de4f0d7fc0d4e1a00d9ef@changeid>
Message-Id: <20201215181024.Bluez.v2.2.I90bb4b25451e7f726fc2c8771cfe642b16312ce3@changeid>
Mime-Version: 1.0
References: <20201215181024.Bluez.v2.1.Iab784797733f28413e9de4f0d7fc0d4e1a00d9ef@changeid>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [Bluez PATCH v2 2/2] lib/mgmt: Adding Add Adv Patterns Monitor RSSI opcode
From:   Archie Pusaka <apusaka@google.com>
To:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     CrosBT Upstreaming <chromeos-bluetooth-upstreaming@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>,
        Manish Mandlik <mmandlik@chromium.org>,
        Miao-chen Chou <mcchou@chromium.org>,
        Yun-Hao Chung <howardchung@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Archie Pusaka <apusaka@chromium.org>

The new op is to utilize RSSI in advertisement monitor

Reviewed-by: Manish Mandlik <mmandlik@chromium.org>
Reviewed-by: Miao-chen Chou <mcchou@chromium.org>
Reviewed-by: Yun-Hao Chung <howardchung@google.com>
---

Changes in v2:
* Remove the trailing period on the commit title

 lib/mgmt.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/lib/mgmt.h b/lib/mgmt.h
index f37f7e6540..1b8fcc0e10 100644
--- a/lib/mgmt.h
+++ b/lib/mgmt.h
@@ -738,6 +738,21 @@ struct mgmt_rp_add_ext_adv_data {
 	uint8_t	instance;
 } __packed;
 
+struct mgmt_adv_rssi_thresholds {
+	int8_t   high_threshold;
+	uint16_t high_threshold_timeout;
+	int8_t   low_threshold;
+	uint16_t low_threshold_timeout;
+	uint8_t  sampling_period;
+} __packed;
+
+#define MGMT_OP_ADD_ADV_PATTERNS_MONITOR_RSSI	0x0056
+struct mgmt_cp_add_adv_patterns_monitor_rssi {
+	uint8_t pattern_count;
+	struct mgmt_adv_rssi_thresholds rssi;
+	struct mgmt_adv_pattern patterns[0];
+} __packed;
+
 #define MGMT_EV_CMD_COMPLETE		0x0001
 struct mgmt_ev_cmd_complete {
 	uint16_t opcode;
-- 
2.29.2.684.gfbc64c5ab5-goog

