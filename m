Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0F92A73B1
	for <lists+linux-bluetooth@lfdr.de>; Thu,  5 Nov 2020 01:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732661AbgKEAY2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 4 Nov 2020 19:24:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732656AbgKEAY0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 4 Nov 2020 19:24:26 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC8EC0613CF
        for <linux-bluetooth@vger.kernel.org>; Wed,  4 Nov 2020 16:24:24 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id 133so48817pfx.11
        for <linux-bluetooth@vger.kernel.org>; Wed, 04 Nov 2020 16:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G1039XuaJxx9CrTyLd/jowS0nRTYMEXBJ14B8CPT+hA=;
        b=kjGiHj+1CIU6uw2bKs6oBqEL3aG59J9u1fRzdjr8/QfZFRF6jhl34cW63s+dfllPPT
         Rw/6k9VroUB4mxwSZiXDr7xCYCK3g55/jzl+0QynlOiB7ZxycrhBwkpfB7Mli8akAEJp
         +Kmhl6wCmMOlorklL4HCot+M2kTQrFsk6n/y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G1039XuaJxx9CrTyLd/jowS0nRTYMEXBJ14B8CPT+hA=;
        b=iXiegOabyZBdGJdW+NONC0uxm4wKzI9+exVn2lZf0uYAJIkkx8kP2bjA+uX65fkSGo
         kBQvMi9tRyz3PemI0lXiUXSKyA2QzgjljiqVwgA9DD+TiqxkO5Vd9eF7oE5K8OqYDaqm
         bZqJ3uEHSDwOFoKo/1/woEqplXO1HjfuV6lw+bCmrysmE6yQEQGDa7LXSeSjzoqTDPCE
         qnRZxPDCP6SnAFLZT0VEOD4hErJbZpaUV/oWmPJ+5FKeOi4RGVExwTBK/TBoIJGsJ1C3
         eHRWZBRobQmAKa3vKYxU6c7sJZ2DzsX8TM3K74jNXA3GbMs/OqcSimBzUua3nssyu77o
         77NQ==
X-Gm-Message-State: AOAM531ibMeBDtedH7Hf/FmuVGzbzkIjVTdgcrlvkJWmTDPEQ2DhToZ/
        IQdATz8n6htMcoq+c4FqDYk6a5kSzFSYNw==
X-Google-Smtp-Source: ABdhPJzwmGSr7HM47llfSBacn8bil8lbK72NYcJO/aL5GmxfTCVjOLn3j5ihQsGOo4VIYco+5ELdXw==
X-Received: by 2002:a63:2ec7:: with SMTP id u190mr491766pgu.21.1604535863757;
        Wed, 04 Nov 2020 16:24:23 -0800 (PST)
Received: from sonnysasaka-chrome.mtv.corp.google.com ([2620:15c:202:201:4a0f:cfff:fe66:e60c])
        by smtp.gmail.com with ESMTPSA id e6sm3567052pgn.9.2020.11.04.16.24.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2020 16:24:23 -0800 (PST)
From:   Sonny Sasaka <sonnysasaka@chromium.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Sonny Sasaka <sonnysasaka@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>
Subject: [PATCH BlueZ] gatt-client: Do not continue service discovery if disconnected
Date:   Wed,  4 Nov 2020 16:24:12 -0800
Message-Id: <20201105002412.37720-1-sonnysasaka@chromium.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

If device is disconnected, discovery_complete_op should not continue
processing since this can lead to a crash because the GATT-related
objects may already be freed.

Sample crash stack trace:
0  gatt_db_service_get_handles (service=0x1751130, service=0x1751130, end_handle=0x7ffcd600806e, start_handle=0x7ffcd600806c) at src/shared/gatt-db.c:569
1  gatt_db_attribute_get_service_data (attrib=<optimized out>, start_handle=0x7ffcd600806c, end_handle=0x7ffcd600806e, primary=0x0, uuid=0x0) at src/shared/gatt-db.c:1657
2  0x00000000004983a8 in discovery_op_complete (op=op@entry=0x173b320, success=<optimized out>, err=err@entry=10 '\n') at src/shared/gatt-client.c:406
3  0x000000000049a548 in discover_descs_cb (success=<optimized out>, att_ecode=<optimized out>, result=<optimized out>, user_data=0x173b320) at src/shared/gatt-client.c:915
4  0x00000000004a1d87 in discovery_op_complete (op=0x1748450, success=<optimized out>, ecode=<optimized out>) at src/shared/gatt-helpers.c:615
5  0x00000000004a2379 in discover_descs_cb (opcode=<optimized out>, pdu=0x174d551, length=<optimized out>, user_data=0x1748450) at src/shared/gatt-helpers.c:1465
6  0x00000000004966db in handle_rsp (pdu_len=4, pdu=<optimized out>, opcode=<optimized out>, chan=0x17483c0) at src/shared/att.c:814
7  can_read_data (io=<optimized out>, user_data=0x17483c0) at src/shared/att.c:1011
8  0x00000000004a0853 in watch_callback (channel=<optimized out>, cond=<optimized out>, user_data=<optimized out>) at src/shared/io-glib.c:157
9  0x00007fb3f2d7fe87 in g_main_context_dispatch () from /usr/lib64/libglib-2.0.so.0
10 0x00007fb3f2d80230 in ?? () from /usr/lib64/libglib-2.0.so.0
11 0x00007fb3f2d80542 in g_main_loop_run () from /usr/lib64/libglib-2.0.so.0
12 0x00000000004a0e25 in mainloop_run () at src/shared/mainloop-glib.c:66
13 0x00000000004a11f2 in mainloop_run_with_signal (func=func@entry=0x43f200 <signal_callback>, user_data=user_data@entry=0x0) at src/shared/mainloop-notify.c:188
14 0x000000000040c72e in main (argc=<optimized out>, argv=<optimized out>) at src/main.c:959

Reviewed-By: Archie Pusaka <apusaka@chromium.org>

---
 src/device.c             |  3 +++
 src/shared/gatt-client.c | 20 ++++++++++++++++++++
 src/shared/gatt-client.h |  2 ++
 3 files changed, 25 insertions(+)

diff --git a/src/device.c b/src/device.c
index a5ef46730..9dad746eb 100644
--- a/src/device.c
+++ b/src/device.c
@@ -586,6 +586,9 @@ static void gatt_client_cleanup(struct btd_device *device)
 		device->gatt_ready_id = 0;
 	}
 
+	/* Make sure that service discovery is stopped if any is in progress */
+	bt_gatt_client_reset_in_discovery(device->client);
+
 	bt_gatt_client_unref(device->client);
 	device->client = NULL;
 }
diff --git a/src/shared/gatt-client.c b/src/shared/gatt-client.c
index 8becf1c6c..2ba6efe9a 100644
--- a/src/shared/gatt-client.c
+++ b/src/shared/gatt-client.c
@@ -104,6 +104,9 @@ struct bt_gatt_client {
 
 	struct bt_gatt_request *discovery_req;
 	unsigned int mtu_req_id;
+
+	/* Whether there is a service discovery operation ongoing */
+	bool in_discovery;
 };
 
 struct request {
@@ -381,6 +384,12 @@ static void discovery_op_complete(struct discovery_op *op, bool success,
 {
 	const struct queue_entry *svc;
 
+	/* Service discovery may be reset due to disconnection */
+	if (!op->client->in_discovery)
+		return;
+
+	op->client->in_discovery = false;
+
 	op->success = success;
 
 	/* Read database hash if discovery has been successful */
@@ -1857,6 +1866,9 @@ static void process_service_changed(struct bt_gatt_client *client,
 {
 	struct discovery_op *op;
 
+	if (client->in_discovery)
+		goto fail;
+
 	op = discovery_op_create(client, start_handle, end_handle,
 						service_changed_complete,
 						service_changed_failure);
@@ -1869,6 +1881,7 @@ static void process_service_changed(struct bt_gatt_client *client,
 						discovery_op_ref(op),
 						discovery_op_unref);
 	if (client->discovery_req) {
+		client->in_discovery = true;
 		client->in_svc_chngd = true;
 		return;
 	}
@@ -2057,6 +2070,7 @@ static bool gatt_client_init(struct bt_gatt_client *client, uint16_t mtu)
 		return false;
 	}
 
+	client->in_discovery = true;
 	client->in_init = true;
 
 	return true;
@@ -2080,6 +2094,7 @@ discover:
 	}
 
 done:
+	client->in_discovery = true;
 	client->in_init = true;
 	return true;
 }
@@ -3694,3 +3709,8 @@ int bt_gatt_client_get_security(struct bt_gatt_client *client)
 
 	return bt_att_get_security(client->att, NULL);
 }
+
+void bt_gatt_client_reset_in_discovery(struct bt_gatt_client *client)
+{
+	client->in_discovery = false;
+}
diff --git a/src/shared/gatt-client.h b/src/shared/gatt-client.h
index dc5102394..dcd8e5cf6 100644
--- a/src/shared/gatt-client.h
+++ b/src/shared/gatt-client.h
@@ -126,3 +126,5 @@ bool bt_gatt_client_unregister_notify(struct bt_gatt_client *client,
 
 bool bt_gatt_client_set_security(struct bt_gatt_client *client, int level);
 int bt_gatt_client_get_security(struct bt_gatt_client *client);
+
+void bt_gatt_client_reset_in_discovery(struct bt_gatt_client *client);
-- 
2.26.2

