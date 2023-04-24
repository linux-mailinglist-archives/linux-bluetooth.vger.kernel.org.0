Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43B916D2BFF
	for <lists+linux-bluetooth@lfdr.de>; Sat,  1 Apr 2023 02:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbjDAARA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 31 Mar 2023 20:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjDAAQ7 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 31 Mar 2023 20:16:59 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCCA418831
        for <linux-bluetooth@vger.kernel.org>; Fri, 31 Mar 2023 17:16:57 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id u10so22854358plz.7
        for <linux-bluetooth@vger.kernel.org>; Fri, 31 Mar 2023 17:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680308217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E4Np4iouivwzm0y/qWdmNxwHrYrzttupXKnEfFyspE8=;
        b=kQ02HhrOgJ0R8awT4MyklivedIVGJokI/QoFAi1frZ1hi6E2jwLysmbNAJpt+gvseY
         i2FdTU0WiPc6uBTfEiKeqM5kN16f17u0ytqrdYW8qBOYsxxTjxRtgzMYq4Eeg44VhdhB
         0uWS8SYbY+EZlsgFUlAycXAdoEbhoO9et+D8D/BbkE2GPHR792wBF1vG0zQIuyuR0/Y7
         wSGGSIR70EJGCP6xbZlO/ymyKP+6qTJHsvul7fh2qgY6SFEwUvG3uwaNLAgF6lOOjHfK
         sHtUOdMu4ne5q6D9Fb2OeWOiwANligE6jF3Miw5ZA3Bvc2Ifpb2QAPidRIyqbtI40s2J
         nfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680308217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4Np4iouivwzm0y/qWdmNxwHrYrzttupXKnEfFyspE8=;
        b=zoTuV4XE22G8HeqYPZmYVk2cdJXFWPugeOYbO20RF2Gjcf34EurRo1l2k/kjd+BOMH
         DPkI4E0dH0WoYPpEN2oJR3Z/0sY+ALaV3R5iT/jOgkl0eWVExx8xvJeLEDShIsqrq5lS
         /ZY5qQc6eQWY9c6InEYeNuFz+fDd9a9w0zZlkpibJwzoRJoS5SvOCyFVwxToRyy4J1z7
         zvsfuI3TyPuXcQzOZI0Mpus78U/B30ty/axJhRsZzSEGbwD33S9awUJpc0eKMwOWEVJx
         Zd7MCjiw1jLSz5BTdFB0DO2VN/ELD+6yRDHYADBM/ZznROwNXRyYLNswa/g0aUxqFBdj
         VczQ==
X-Gm-Message-State: AAQBX9ekg9yRHzazX028ZM3ABleyzswLjT/tWx2x/qKT5BrkGbm6XHGv
        pJcBw6e8khRbYPSWvW3QhN5Xnu83/cUzlcwW
X-Google-Smtp-Source: AKy350aR0uFzIro2Dh4tFaZyu7e1VVXmB/rY8E8CujOKtbNVetN+g1uYEIf1eqOdDkG/MHebgfwbYg==
X-Received: by 2002:a17:902:d2d2:b0:1a0:6ed9:f9d0 with SMTP id n18-20020a170902d2d200b001a06ed9f9d0mr36852479plc.68.1680308216958;
        Fri, 31 Mar 2023 17:16:56 -0700 (PDT)
Received: from fedora.. (c-67-170-58-107.hsd1.wa.comcast.net. [67.170.58.107])
        by smtp.googlemail.com with ESMTPSA id f19-20020a170902e99300b0019acd3151d0sm2109677plb.114.2023.03.31.17.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 17:16:56 -0700 (PDT)
From:   Inga Stotland <inga.stotland@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@gmail.com, Inga Stotland <inga.stotland@gmail.com>
Subject: [PATCH BlueZ v2] mesh: Tighten IO and fix out-of-bounds array access
Date:   Fri, 31 Mar 2023 17:16:02 -0700
Message-Id: <20230401001602.4161-1-inga.stotland@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This fixes the out-of-bounds array access in mesh-io-mgmt.c caught
by address sanitizer. Similar fixes were applied earlier to
generic and unit IOs. With this patch, the common code is factored
into a centralized location.
---
 mesh/mesh-io-api.h     |  7 +++++
 mesh/mesh-io-generic.c | 70 ++++++------------------------------------
 mesh/mesh-io-mgmt.c    | 56 ++++-----------------------------
 mesh/mesh-io-unit.c    | 30 ------------------
 mesh/mesh-io.c         | 45 ++++++++++++++++-----------
 mesh/mesh-io.h         |  2 --
 6 files changed, 50 insertions(+), 160 deletions(-)

diff --git a/mesh/mesh-io-api.h b/mesh/mesh-io-api.h
index 21c505cd0..ae51cbc55 100644
--- a/mesh/mesh-io-api.h
+++ b/mesh/mesh-io-api.h
@@ -34,6 +34,13 @@ struct mesh_io_api {
 	mesh_io_tx_cancel_t	cancel;
 };
 
+struct mesh_io_reg {
+	mesh_io_recv_func_t cb;
+	void *user_data;
+	uint8_t len;
+	uint8_t filter[];
+};
+
 struct mesh_io {
 	int				index;
 	int				favored_index;
diff --git a/mesh/mesh-io-generic.c b/mesh/mesh-io-generic.c
index 827128ec8..93a56275b 100644
--- a/mesh/mesh-io-generic.c
+++ b/mesh/mesh-io-generic.c
@@ -33,7 +33,6 @@ struct mesh_io_private {
 	struct mesh_io *io;
 	struct bt_hci *hci;
 	struct l_timeout *tx_timeout;
-	struct l_queue *rx_regs;
 	struct l_queue *tx_pkts;
 	struct tx_pkt *tx;
 	uint16_t interval;
@@ -41,13 +40,6 @@ struct mesh_io_private {
 	bool active;
 };
 
-struct pvt_rx_reg {
-	mesh_io_recv_func_t cb;
-	void *user_data;
-	uint8_t len;
-	uint8_t filter[0];
-};
-
 struct process_data {
 	struct mesh_io_private		*pvt;
 	const uint8_t			*data;
@@ -87,7 +79,7 @@ static uint32_t instant_remaining_ms(uint32_t instant)
 
 static void process_rx_callbacks(void *v_reg, void *v_rx)
 {
-	struct pvt_rx_reg *rx_reg = v_reg;
+	struct mesh_io_reg *rx_reg = v_reg;
 	struct process_data *rx = v_rx;
 
 	if (!memcmp(rx->data, rx_reg->filter, rx_reg->len))
@@ -108,7 +100,7 @@ static void process_rx(struct mesh_io_private *pvt, int8_t rssi,
 		.info.rssi = rssi,
 	};
 
-	l_queue_foreach(pvt->rx_regs, process_rx_callbacks, &rx);
+	l_queue_foreach(pvt->io->rx_regs, process_rx_callbacks, &rx);
 }
 
 static void event_adv_report(struct mesh_io *io, const void *buf, uint8_t size)
@@ -354,7 +346,7 @@ static bool find_by_pattern(const void *a, const void *b)
 
 static bool find_active(const void *a, const void *b)
 {
-	const struct pvt_rx_reg *rx_reg = a;
+	const struct mesh_io_reg *rx_reg = a;
 
 	/* Mesh specific AD types do *not* require active scanning,
 	 * so do not turn on Active Scanning on their account.
@@ -370,10 +362,10 @@ static void restart_scan(struct mesh_io_private *pvt)
 {
 	struct bt_hci_cmd_le_set_scan_enable cmd;
 
-	if (l_queue_isempty(pvt->rx_regs))
+	if (l_queue_isempty(pvt->io->rx_regs))
 		return;
 
-	pvt->active = l_queue_find(pvt->rx_regs, find_active, NULL);
+	pvt->active = l_queue_find(pvt->io->rx_regs, find_active, NULL);
 	cmd.enable = 0x00;	/* Disable scanning */
 	cmd.filter_dup = 0x00;	/* Report duplicates */
 	bt_hci_send(pvt->hci, BT_HCI_CMD_LE_SET_SCAN_ENABLE,
@@ -417,7 +409,6 @@ static bool dev_init(struct mesh_io *io, void *opts, void *user_data)
 
 	io->pvt = l_new(struct mesh_io_private, 1);
 
-	io->pvt->rx_regs = l_queue_new();
 	io->pvt->tx_pkts = l_queue_new();
 
 	io->pvt->io = io;
@@ -436,7 +427,6 @@ static bool dev_destroy(struct mesh_io *io)
 
 	bt_hci_unref(pvt->hci);
 	l_timeout_remove(pvt->tx_timeout);
-	l_queue_destroy(pvt->rx_regs, l_free);
 	l_queue_remove_if(pvt->tx_pkts, simple_match, pvt->tx);
 	l_queue_destroy(pvt->tx_pkts, l_free);
 	l_free(pvt->tx);
@@ -726,7 +716,7 @@ static bool send_tx(struct mesh_io *io, struct mesh_io_send_info *info,
 		l_queue_push_tail(pvt->tx_pkts, tx);
 	}
 
-    /* If not already sending, schedule the tx worker */
+	/* If not already sending, schedule the tx worker */
 	if (!pvt->tx) {
 		l_timeout_remove(pvt->tx_timeout);
 		pvt->tx_timeout = NULL;
@@ -780,46 +770,18 @@ static bool tx_cancel(struct mesh_io *io, const uint8_t *data, uint8_t len)
 	return true;
 }
 
-static bool find_by_filter(const void *a, const void *b)
-{
-	const struct pvt_rx_reg *rx_reg_old = a;
-	const struct pvt_rx_reg *rx_reg = b;
-
-	if (rx_reg_old->len != rx_reg->len)
-		return false;
-
-	return !memcmp(rx_reg_old->filter, rx_reg->filter, rx_reg->len);
-}
-
 static bool recv_register(struct mesh_io *io, const uint8_t *filter,
 			uint8_t len, mesh_io_recv_func_t cb, void *user_data)
 {
 	struct bt_hci_cmd_le_set_scan_enable cmd;
 	struct mesh_io_private *pvt = io->pvt;
-	struct pvt_rx_reg *rx_reg, *rx_reg_old;
 	bool already_scanning;
 	bool active = false;
 
-	if (!cb || !filter || !len)
-		return false;
-
-	rx_reg = l_malloc(sizeof(*rx_reg) + len);
-
-	memcpy(rx_reg->filter, filter, len);
-	rx_reg->len = len;
-	rx_reg->cb = cb;
-	rx_reg->user_data = user_data;
-
-	rx_reg_old = l_queue_remove_if(pvt->rx_regs, find_by_filter, rx_reg);
-
-	l_free(rx_reg_old);
-
-	already_scanning = !l_queue_isempty(pvt->rx_regs);
-
-	l_queue_push_head(pvt->rx_regs, rx_reg);
+	already_scanning = !l_queue_isempty(io->rx_regs);
 
 	/* Look for any AD types requiring Active Scanning */
-	if (l_queue_find(pvt->rx_regs, find_active, NULL))
+	if (l_queue_find(io->rx_regs, find_active, NULL))
 		active = true;
 
 	if (!already_scanning || pvt->active != active) {
@@ -839,25 +801,13 @@ static bool recv_deregister(struct mesh_io *io, const uint8_t *filter,
 {
 	struct bt_hci_cmd_le_set_scan_enable cmd = {0, 0};
 	struct mesh_io_private *pvt = io->pvt;
-	struct pvt_rx_reg *rx_reg, *rx_reg_tmp;
 	bool active = false;
 
-	rx_reg_tmp = l_malloc(sizeof(*rx_reg_tmp) + len);
-	memcpy(&rx_reg_tmp->filter, filter, len);
-	rx_reg_tmp->len = len;
-
-	rx_reg = l_queue_remove_if(pvt->rx_regs, find_by_filter, rx_reg_tmp);
-
-	if (rx_reg)
-		l_free(rx_reg);
-
-	l_free(rx_reg_tmp);
-
 	/* Look for any AD types requiring Active Scanning */
-	if (l_queue_find(pvt->rx_regs, find_active, NULL))
+	if (l_queue_find(io->rx_regs, find_active, NULL))
 		active = true;
 
-	if (l_queue_isempty(pvt->rx_regs)) {
+	if (l_queue_isempty(io->rx_regs)) {
 		bt_hci_send(pvt->hci, BT_HCI_CMD_LE_SET_SCAN_ENABLE,
 					&cmd, sizeof(cmd), NULL, NULL, NULL);
 
diff --git a/mesh/mesh-io-mgmt.c b/mesh/mesh-io-mgmt.c
index 5f51f3a1f..5f0eb206b 100644
--- a/mesh/mesh-io-mgmt.c
+++ b/mesh/mesh-io-mgmt.c
@@ -37,7 +37,6 @@ struct mesh_io_private {
 	struct l_timeout *tx_timeout;
 	struct l_timeout *dup_timeout;
 	struct l_queue *dup_filters;
-	struct l_queue *rx_regs;
 	struct l_queue *tx_pkts;
 	struct tx_pkt *tx;
 	unsigned int tx_id;
@@ -49,13 +48,6 @@ struct mesh_io_private {
 	bool active;
 };
 
-struct pvt_rx_reg {
-	mesh_io_recv_func_t cb;
-	void *user_data;
-	uint8_t len;
-	uint8_t filter[0];
-};
-
 struct process_data {
 	struct mesh_io_private		*pvt;
 	const uint8_t			*data;
@@ -198,7 +190,7 @@ static bool filter_dups(const uint8_t *addr, const uint8_t *adv,
 
 static void process_rx_callbacks(void *v_reg, void *v_rx)
 {
-	struct pvt_rx_reg *rx_reg = v_reg;
+	struct mesh_io_reg *rx_reg = v_reg;
 	struct process_data *rx = v_rx;
 
 	if (!memcmp(rx->data, rx_reg->filter, rx_reg->len))
@@ -224,7 +216,7 @@ static void process_rx(uint16_t index, struct mesh_io_private *pvt, int8_t rssi,
 		return;
 
 	print_packet("RX", data, len);
-	l_queue_foreach(pvt->rx_regs, process_rx_callbacks, &rx);
+	l_queue_foreach(pvt->io->rx_regs, process_rx_callbacks, &rx);
 }
 
 static void send_cmplt(uint16_t index, uint16_t length,
@@ -303,7 +295,7 @@ static bool find_by_pattern(const void *a, const void *b)
 
 static bool find_active(const void *a, const void *b)
 {
-	const struct pvt_rx_reg *rx_reg = a;
+	const struct mesh_io_reg *rx_reg = a;
 
 	/* Mesh specific AD types do *not* require active scanning,
 	 * so do not turn on Active Scanning on their account.
@@ -447,7 +439,6 @@ static bool dev_init(struct mesh_io *io, void *opts, void *user_data)
 				read_info_cb, L_UINT_TO_PTR(index), NULL);
 
 	pvt->dup_filters = l_queue_new();
-	pvt->rx_regs = l_queue_new();
 	pvt->tx_pkts = l_queue_new();
 
 	pvt->io = io;
@@ -456,14 +447,6 @@ static bool dev_init(struct mesh_io *io, void *opts, void *user_data)
 	return true;
 }
 
-static void free_rx_reg(void *user_data)
-{
-	struct pvt_rx_reg *rx_reg = user_data;
-
-	l_free(rx_reg);
-}
-
-
 static bool dev_destroy(struct mesh_io *io)
 {
 	unsigned char param[] = { 0x00 };
@@ -479,7 +462,6 @@ static bool dev_destroy(struct mesh_io *io)
 	l_timeout_remove(pvt->tx_timeout);
 	l_timeout_remove(pvt->dup_timeout);
 	l_queue_destroy(pvt->dup_filters, l_free);
-	l_queue_destroy(pvt->rx_regs, free_rx_reg);
 	l_queue_destroy(pvt->tx_pkts, l_free);
 	io->pvt = NULL;
 	l_free(pvt);
@@ -751,37 +733,16 @@ static bool tx_cancel(struct mesh_io *io, const uint8_t *data, uint8_t len)
 	return true;
 }
 
-static bool find_by_filter(const void *a, const void *b)
-{
-	const struct pvt_rx_reg *rx_reg = a;
-	const uint8_t *filter = b;
-
-	return !memcmp(rx_reg->filter, filter, rx_reg->len);
-}
-
 static bool recv_register(struct mesh_io *io, const uint8_t *filter,
 			uint8_t len, mesh_io_recv_func_t cb, void *user_data)
 {
-	struct pvt_rx_reg *rx_reg;
 	bool active = false;
 
-	if (!cb || !filter || !len || io->pvt != pvt)
+	if (io->pvt != pvt)
 		return false;
 
-	rx_reg = l_queue_remove_if(pvt->rx_regs, find_by_filter, filter);
-
-	free_rx_reg(rx_reg);
-	rx_reg = l_malloc(sizeof(*rx_reg) + len);
-
-	memcpy(rx_reg->filter, filter, len);
-	rx_reg->len = len;
-	rx_reg->cb = cb;
-	rx_reg->user_data = user_data;
-
-	l_queue_push_head(pvt->rx_regs, rx_reg);
-
 	/* Look for any AD types requiring Active Scanning */
-	if (l_queue_find(pvt->rx_regs, find_active, NULL))
+	if (l_queue_find(io->rx_regs, find_active, NULL))
 		active = true;
 
 	if (pvt->active != active) {
@@ -795,18 +756,13 @@ static bool recv_register(struct mesh_io *io, const uint8_t *filter,
 static bool recv_deregister(struct mesh_io *io, const uint8_t *filter,
 								uint8_t len)
 {
-	struct pvt_rx_reg *rx_reg;
 	bool active = false;
 
 	if (io->pvt != pvt)
 		return false;
 
-	rx_reg = l_queue_remove_if(pvt->rx_regs, find_by_filter, filter);
-
-	free_rx_reg(rx_reg);
-
 	/* Look for any AD types requiring Active Scanning */
-	if (l_queue_find(pvt->rx_regs, find_active, NULL))
+	if (l_queue_find(io->rx_regs, find_active, NULL))
 		active = true;
 
 	if (active != pvt->active) {
diff --git a/mesh/mesh-io-unit.c b/mesh/mesh-io-unit.c
index f4f619803..a9fa53308 100644
--- a/mesh/mesh-io-unit.c
+++ b/mesh/mesh-io-unit.c
@@ -485,39 +485,9 @@ static bool tx_cancel(struct mesh_io *io, const uint8_t *data, uint8_t len)
 	return true;
 }
 
-static bool find_by_filter(const void *a, const void *b)
-{
-	const struct pvt_rx_reg *rx_reg_old = a;
-	const struct pvt_rx_reg *rx_reg = b;
-
-	if (rx_reg_old->len != rx_reg->len)
-		return false;
-
-	return !memcmp(rx_reg_old->filter, rx_reg->filter, rx_reg->len);
-}
-
 static bool recv_register(struct mesh_io *io, const uint8_t *filter,
 			uint8_t len, mesh_io_recv_func_t cb, void *user_data)
 {
-	struct mesh_io_private *pvt = io->pvt;
-	struct pvt_rx_reg *rx_reg, *rx_reg_old;
-
-	if (!cb || !filter || !len)
-		return false;
-
-	rx_reg = l_malloc(sizeof(*rx_reg) + len);
-
-	memcpy(rx_reg->filter, filter, len);
-	rx_reg->len = len;
-	rx_reg->cb = cb;
-	rx_reg->user_data = user_data;
-
-	rx_reg_old = l_queue_remove_if(pvt->rx_regs, find_by_filter, rx_reg);
-
-	l_free(rx_reg_old);
-
-	l_queue_push_head(pvt->rx_regs, rx_reg);
-
 	return true;
 }
 
diff --git a/mesh/mesh-io.c b/mesh/mesh-io.c
index 3e68dc090..48e3f4226 100644
--- a/mesh/mesh-io.c
+++ b/mesh/mesh-io.c
@@ -28,13 +28,6 @@
 #include "mesh/mesh-io-generic.h"
 #include "mesh/mesh-io-unit.h"
 
-struct mesh_io_reg {
-	mesh_io_recv_func_t cb;
-	void *user_data;
-	uint8_t len;
-	uint8_t filter[];
-} packed;
-
 struct loop_data {
 	uint16_t len;
 	uint8_t data[];
@@ -104,7 +97,6 @@ static void ctl_alert(int index, bool up, bool pwr, bool mesh, void *user_data)
 
 	if (mesh && type != MESH_IO_TYPE_GENERIC)
 		api = io_api(MESH_IO_TYPE_MGMT);
-
 	else if (!pwr)
 		api = io_api(MESH_IO_TYPE_GENERIC);
 
@@ -130,6 +122,23 @@ static void free_io(struct mesh_io *io)
 	}
 }
 
+static struct mesh_io_reg *find_by_filter(struct l_queue *rx_regs,
+					const uint8_t *filter, uint8_t len)
+{
+	const struct l_queue_entry *entry;
+
+	entry = l_queue_get_entries(rx_regs);
+
+	for (; entry; entry = entry->next) {
+		struct mesh_io_reg *rx_reg = entry->data;
+
+		if (rx_reg->len == len && !memcmp(rx_reg->filter, filter, len))
+			return rx_reg;
+	}
+
+	return NULL;
+}
+
 struct mesh_io *mesh_io_new(enum mesh_io_type type, void *opts,
 				mesh_io_ready_func_t cb, void *user_data)
 {
@@ -194,14 +203,20 @@ bool mesh_io_register_recv_cb(struct mesh_io *io, const uint8_t *filter,
 	if (io == NULL)
 		io = default_io;
 
-	if (io != default_io)
+	if (io != default_io || !cb || !filter || !len)
 		return false;
 
+	rx_reg = find_by_filter(io->rx_regs, filter, len);
+
+	l_free(rx_reg);
+	l_queue_remove(io->rx_regs, rx_reg);
+
 	rx_reg = l_malloc(sizeof(struct mesh_io_reg) + len);
 	rx_reg->cb = cb;
 	rx_reg->len = len;
 	rx_reg->user_data = user_data;
 	memcpy(rx_reg->filter, filter, len);
+
 	l_queue_push_head(io->rx_regs, rx_reg);
 
 	if (io && io->api && io->api->reg)
@@ -210,14 +225,6 @@ bool mesh_io_register_recv_cb(struct mesh_io *io, const uint8_t *filter,
 	return false;
 }
 
-static bool by_filter(const void *a, const void *b)
-{
-	const struct mesh_io_reg *rx_reg = a;
-	const uint8_t *filter = b;
-
-	return rx_reg->filter[0] == filter[0];
-}
-
 bool mesh_io_deregister_recv_cb(struct mesh_io *io, const uint8_t *filter,
 								uint8_t len)
 {
@@ -226,7 +233,9 @@ bool mesh_io_deregister_recv_cb(struct mesh_io *io, const uint8_t *filter,
 	if (io != default_io)
 		return false;
 
-	rx_reg = l_queue_remove_if(io->rx_regs, by_filter, filter);
+	rx_reg = find_by_filter(io->rx_regs,  filter, len);
+
+	l_queue_remove(io->rx_regs, rx_reg);
 	l_free(rx_reg);
 
 	if (io && io->api && io->api->dereg)
diff --git a/mesh/mesh-io.h b/mesh/mesh-io.h
index 9dd946cdf..f7711e786 100644
--- a/mesh/mesh-io.h
+++ b/mesh/mesh-io.h
@@ -8,8 +8,6 @@
  *
  */
 
-struct mesh_io;
-
 #define MESH_IO_TX_COUNT_UNLIMITED	0
 
 enum mesh_io_type {
-- 
2.39.2

