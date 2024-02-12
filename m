Return-Path: <linux-bluetooth+bounces-1757-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD64085118B
	for <lists+linux-bluetooth@lfdr.de>; Mon, 12 Feb 2024 11:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96BBEB25827
	for <lists+linux-bluetooth@lfdr.de>; Mon, 12 Feb 2024 10:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66EC03B195;
	Mon, 12 Feb 2024 10:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0U3vEjA"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609C23AC0C
	for <linux-bluetooth@vger.kernel.org>; Mon, 12 Feb 2024 10:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707735035; cv=none; b=FJGIp5Z+favTCW/o5xpONXkTmngqzVMVzP6Q9oxie9t70y7eb5w57ooRIxod5extUJCWw6MSBzKcfqZ3KeoE+nOkeg4lUyQKHMil7jU1UqZ6y/U6AmV1aDlonnOQL4QV8yNwfEWmTlNQiStdj6yLa6YrX7OxS9K95hmyvxogKaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707735035; c=relaxed/simple;
	bh=mTUS3SLWvGyqyymXIMdJMOmF3VwB+FUVcYVGHpdHHeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qERYSAtdts8LPlxXM1AaqGfHF7ius1QNHa0bT8x7HUOOCbcOT40+YkXhuYLae1jr75KlG+KIoudmmxGJwZzlV/tCN9JBzFX3pmtFsW8+DejJMgUna2HalCgyWPykQn5lqkgVDZlfn5S9GnlrAQ+H9jK3Ft/G17hqS7QrAsjwdbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0U3vEjA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707735033; x=1739271033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mTUS3SLWvGyqyymXIMdJMOmF3VwB+FUVcYVGHpdHHeQ=;
  b=O0U3vEjAwLtJE3aT095BlZKsHgwlx2FJXem0ErSHQJmboPnlSqutgjif
   pKnClb360aF6bM5xFgAEhAWoaI/6sTSH0czUgFiui1CWVENDlHdYWc2CD
   aOe8cbZAY1TAIJVGN4zjol9x/4JiRmSCiKRpBNM3zduG9VzdDEjRnLgZ9
   EByf9gK3F8PSzHzIwycS1urSU/46bJLZ/Obkv/MRQk2WnbrJLx3J1zoOF
   t2pbynsJTUGwm9zHigPcM74e+Cg/PoKOF91vmUQ0SagBiXu2SpOxAypU1
   B1m7nopB7dX7b+/GT+5RJCl+FswFFeNe0qD5gJbUmddqL+nbB7H7FRhAm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1609243"
X-IronPort-AV: E=Sophos;i="6.05,263,1701158400"; 
   d="scan'208";a="1609243"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 02:50:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,263,1701158400"; 
   d="scan'208";a="33347579"
Received: from weba0535.iind.intel.com ([10.224.186.30])
  by orviesa002.jf.intel.com with ESMTP; 12 Feb 2024 02:50:32 -0800
From: Ajay KV <ajay.k.v@intel.com>
To: linux-bluetooth@vger.kernel.org
Cc: ravishankar.sriv@intel.com,
	kiran.k@intel.com,
	Ajay KV <ajay.k.v@intel.com>
Subject: [PATCH BlueZ 3/3] shared/ccp: Add initial code for Call Control Profile for Client Role.
Date: Mon, 12 Feb 2024 18:17:26 +0200
Message-Id: <20240212161726.3097145-3-ajay.k.v@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240212161726.3097145-1-ajay.k.v@intel.com>
References: <20240212161726.3097145-1-ajay.k.v@intel.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 Makefile.am      |    1 +
 src/shared/ccp.c | 1147 ++++++++++++++++++++++++++++++++++++++++++++++
 src/shared/ccp.h |   45 ++
 3 files changed, 1193 insertions(+)
 create mode 100644 src/shared/ccp.c
 create mode 100644 src/shared/ccp.h

diff --git a/Makefile.am b/Makefile.am
index 2b1b9acdf825..fdffdc478a16 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -230,6 +230,7 @@ shared_sources = src/shared/io.h src/shared/timeout.h \
 			src/shared/micp.c src/shared/micp.h \
 			src/shared/csip.c src/shared/csip.h \
 			src/shared/bass.h src/shared/bass.c \
+			src/shared/ccp.h src/shared/ccp.c \
 			src/shared/lc3.h src/shared/tty.h
 
 if READLINE
diff --git a/src/shared/ccp.c b/src/shared/ccp.c
new file mode 100644
index 000000000000..9089779603bf
--- /dev/null
+++ b/src/shared/ccp.c
@@ -0,0 +1,1147 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ *
+ *  BlueZ - Bluetooth protocol stack for Linux
+ *
+ *  Copyright (C) 2022  Intel Corporation. All rights reserved.
+ *
+ */
+
+#define _GNU_SOURCE
+#include <inttypes.h>
+#include <string.h>
+#include <stdlib.h>
+#include <stdbool.h>
+#include <unistd.h>
+#include <errno.h>
+
+#include "lib/bluetooth.h"
+#include "lib/uuid.h"
+#include "lib/hci.h"
+
+#include "src/shared/queue.h"
+#include "src/shared/util.h"
+#include "src/shared/timeout.h"
+#include "src/shared/att.h"
+#include "src/shared/gatt-db.h"
+#include "src/shared/gatt-server.h"
+#include "src/shared/gatt-client.h"
+#include "src/shared/ccp.h"
+
+#define DBG(_ccp, fmt, arg...) \
+	ccp_debug(_ccp, "%s:%s() " fmt, __FILE__, __func__, ## arg)
+
+struct bt_ccp_db {
+	struct gatt_db *db;
+	struct bt_ccs *ccs;
+};
+
+struct bt_ccp_pending {
+	unsigned int id;
+	struct bt_ccp *ccp;
+	bt_gatt_client_read_callback_t func;
+	void *user_data;
+};
+
+struct event_callback {
+	const struct bt_ccp_event_callback *cbs;
+	void *user_data;
+};
+
+struct bt_ccp {
+	int ref_count;
+	struct bt_gatt_client *client;
+	struct bt_ccp_db *ldb;
+	struct bt_ccp_db *rdb;
+
+	unsigned int bearer_name_id;
+	unsigned int bearer_uci_id;
+	unsigned int bearer_technology_id;
+	unsigned int bearer_uri_schemes_list_id;
+	unsigned int signal_strength_id;
+	unsigned int signal_reporting_intrvl_id;
+	unsigned int current_call_list_id;
+	unsigned int ccid_id;
+	unsigned int status_flag_id;
+	unsigned int target_bearer_uri_id;
+	unsigned int call_state_id;
+	unsigned int call_control_pt_id;
+	unsigned int call_control_opt_opcode_id;
+	unsigned int termination_reason_id;
+	unsigned int incoming_call_id;
+	unsigned int friendly_name_id;
+
+	struct event_callback *cb;
+	struct queue *pending;
+
+	bt_ccp_debug_func_t debug_func;
+	bt_ccp_destroy_func_t debug_destroy;
+	void *debug_data;
+	void *user_data;
+};
+
+struct bt_ccs {
+	struct bt_ccp_db *mdb;
+	struct gatt_db_attribute *service;
+	struct gatt_db_attribute *bearer_name;
+	struct gatt_db_attribute *bearer_name_ccc;
+	struct gatt_db_attribute *bearer_uci;
+	struct gatt_db_attribute *bearer_technology;
+	struct gatt_db_attribute *bearer_technology_ccc;
+	struct gatt_db_attribute *bearer_uri_schemes_list;
+	struct gatt_db_attribute *signal_strength;
+	struct gatt_db_attribute *signal_strength_ccc;
+	struct gatt_db_attribute *signal_reporting_intrvl;
+	struct gatt_db_attribute *current_call_list;
+	struct gatt_db_attribute *current_call_list_ccc;
+	struct gatt_db_attribute *ccid;
+	struct gatt_db_attribute *status_flag;
+	struct gatt_db_attribute *status_flag_ccc;
+	struct gatt_db_attribute *target_bearer_uri;
+	struct gatt_db_attribute *call_state;
+	struct gatt_db_attribute *call_state_ccc;
+	struct gatt_db_attribute *call_ctrl_point;
+	struct gatt_db_attribute *call_ctrl_point_ccc;
+	struct gatt_db_attribute *call_ctrl_opt_opcode;
+	struct gatt_db_attribute *termination_reason;
+	struct gatt_db_attribute *termination_reason_ccc;
+	struct gatt_db_attribute *incoming_call;
+	struct gatt_db_attribute *incoming_call_ccc;
+	struct gatt_db_attribute *friendly_name;
+	struct gatt_db_attribute *friendly_name_ccc;
+};
+
+static struct queue *ccp_db;
+
+static void ccp_debug(struct bt_ccp *ccp, const char *format, ...)
+{
+	va_list ap;
+
+	if (!ccp || !format || !ccp->debug_func)
+		return;
+
+	va_start(ap, format);
+	util_debug_va(ccp->debug_func, ccp->debug_data, format, ap);
+	va_end(ap);
+}
+
+static bool ccp_db_match(const void *data, const void *match_data)
+{
+	const struct bt_ccp_db *mdb = data;
+	const struct gatt_db *db = match_data;
+
+	return (mdb->db == db);
+}
+
+static void ccp_db_free(void *data)
+{
+	struct bt_ccp_db *bdb = data;
+
+	if (!bdb)
+		return;
+
+	gatt_db_unref(bdb->db);
+
+	free(bdb->ccs);
+	free(bdb);
+}
+
+static void ccp_free(void *data)
+{
+	struct bt_ccp *ccp = data;
+
+	DBG(ccp, "");
+
+	bt_ccp_detach(ccp);
+	ccp_db_free(ccp->rdb);
+	queue_destroy(ccp->pending, NULL);
+
+	free(ccp);
+}
+
+struct bt_ccp *bt_ccp_ref(struct bt_ccp *ccp)
+{
+	if (!ccp)
+		return NULL;
+
+	__sync_fetch_and_add(&ccp->ref_count, 1);
+
+	return ccp;
+}
+
+void bt_ccp_unref(struct bt_ccp *ccp)
+{
+	if (!ccp)
+		return;
+
+	if (__sync_sub_and_fetch(&ccp->ref_count, 1))
+		return;
+
+	ccp_free(ccp);
+}
+
+bool bt_ccp_set_user_data(struct bt_ccp *ccp, void *user_data)
+{
+	if (!ccp)
+		return false;
+
+	ccp->user_data = user_data;
+
+	return true;
+}
+
+void *bt_ccp_get_user_data(struct bt_ccp *ccp)
+{
+	if (!ccp)
+		return NULL;
+
+	return ccp->user_data;
+}
+
+bool bt_ccp_set_debug(struct bt_ccp *ccp, bt_ccp_debug_func_t func,
+      void *user_data, bt_ccp_destroy_func_t destroy)
+{
+	if (!ccp)
+		return false;
+
+	if (ccp->debug_destroy)
+		ccp->debug_destroy(ccp->debug_data);
+
+	ccp->debug_func = func;
+	ccp->debug_destroy = destroy;
+	ccp->debug_data = user_data;
+
+	return true;
+}
+
+static void ccs_call_state_read(struct gatt_db_attribute *attrib,
+				unsigned int id, uint16_t offset,
+				uint8_t opcode, struct bt_att *att,
+				void *user_data)
+{
+	int call_state = 0;
+	struct iovec iov;
+
+	iov.iov_base = &call_state;
+	iov.iov_len = sizeof(int);
+
+	gatt_db_attribute_read_result(attrib, id, 0, iov.iov_base,
+							iov.iov_len);
+}
+
+static void ccs_call_state_write(struct gatt_db_attribute *attrib,
+				unsigned int id, uint16_t offset,
+				const uint8_t *value, size_t len,
+				uint8_t opcode, struct bt_att *att,
+				void *user_data)
+{
+	gatt_db_attribute_write_result(attrib, id,
+				BT_ATT_ERROR_INSUFFICIENT_RESOURCES);
+}
+
+static struct bt_ccs *ccs_new(struct gatt_db *db)
+{
+	struct bt_ccs *ccs;
+	bt_uuid_t uuid;
+
+	if (!db)
+		return NULL;
+
+	ccs = new0(struct bt_ccs, 1);
+
+	/* Populate DB with ccs attributes */
+	bt_uuid16_create(&uuid, GTBS_UUID);
+	ccs->service = gatt_db_add_service(db, &uuid, true, 42);
+
+	bt_uuid16_create(&uuid, BEARER_PROVIDER_NAME_CHRC_UUID);
+	ccs->bearer_name = gatt_db_service_add_characteristic(ccs->service,
+      &uuid, BT_ATT_PERM_READ,
+      BT_GATT_CHRC_PROP_READ | BT_GATT_CHRC_PROP_NOTIFY,
+      ccs_call_state_read, NULL, ccs);
+
+	ccs->bearer_name_ccc = gatt_db_service_add_ccc(ccs->service,
+					BT_ATT_PERM_READ | BT_ATT_PERM_WRITE);
+
+	bt_uuid16_create(&uuid, BEARER_UCI_CHRC_UUID);
+	ccs->bearer_uci = gatt_db_service_add_characteristic(ccs->service,
+			&uuid, BT_ATT_PERM_READ,
+			BT_GATT_CHRC_PROP_READ, ccs_call_state_read,
+			NULL, ccs);
+
+	bt_uuid16_create(&uuid, BEARER_TECH_CHRC_UUID);
+	ccs->bearer_technology = gatt_db_service_add_characteristic(ccs->service,
+			&uuid, BT_ATT_PERM_READ,
+			BT_GATT_CHRC_PROP_READ | BT_GATT_CHRC_PROP_NOTIFY,
+			ccs_call_state_read, NULL,
+			ccs);
+
+	ccs->bearer_technology_ccc = gatt_db_service_add_ccc(ccs->service,
+					BT_ATT_PERM_READ | BT_ATT_PERM_WRITE);
+
+	bt_uuid16_create(&uuid, BEARER_URI_SCHEME_CHRC_UUID);
+	ccs->bearer_uri_schemes_list = gatt_db_service_add_characteristic(ccs->service,
+			&uuid, BT_ATT_PERM_READ,
+			BT_GATT_CHRC_PROP_READ,
+			ccs_call_state_read, NULL,
+			ccs);
+
+	bt_uuid16_create(&uuid, BEARER_SIGNAL_STR_CHRC_UUID);
+	ccs->signal_strength = gatt_db_service_add_characteristic(ccs->service,
+			&uuid, BT_ATT_PERM_READ,
+			BT_GATT_CHRC_PROP_READ | BT_GATT_CHRC_PROP_NOTIFY,
+			ccs_call_state_read, NULL,
+			ccs);
+
+	ccs->signal_strength_ccc = gatt_db_service_add_ccc(ccs->service,
+					BT_ATT_PERM_READ | BT_ATT_PERM_WRITE);
+
+	bt_uuid16_create(&uuid, BEARER_SIGNAL_INTRVL_CHRC_UUID);
+	ccs->signal_reporting_intrvl = gatt_db_service_add_characteristic(ccs->service,
+			&uuid, BT_ATT_PERM_READ | BT_ATT_PERM_WRITE,
+			BT_GATT_CHRC_PROP_READ | BT_GATT_CHRC_PROP_WRITE |
+			BT_GATT_CHRC_PROP_WRITE_WITHOUT_RESP,
+			ccs_call_state_read, ccs_call_state_write,
+			ccs);
+
+	bt_uuid16_create(&uuid, CURR_CALL_LIST_CHRC_UUID);
+	ccs->current_call_list = gatt_db_service_add_characteristic(ccs->service,
+			&uuid, BT_ATT_PERM_READ,
+			BT_GATT_CHRC_PROP_READ | BT_GATT_CHRC_PROP_NOTIFY,
+			ccs_call_state_read, NULL,
+			ccs);
+
+	ccs->current_call_list_ccc = gatt_db_service_add_ccc(ccs->service,
+					BT_ATT_PERM_READ | BT_ATT_PERM_WRITE);
+
+	bt_uuid16_create(&uuid, BEARER_CCID_CHRC_UUID);
+	ccs->ccid = gatt_db_service_add_characteristic(ccs->service,
+			&uuid, BT_ATT_PERM_READ,
+			BT_GATT_CHRC_PROP_READ,
+			ccs_call_state_read, NULL,
+			ccs);
+
+	bt_uuid16_create(&uuid, CALL_STATUS_FLAG_CHRC_UUID);
+	ccs->status_flag = gatt_db_service_add_characteristic(ccs->service,
+			&uuid, BT_ATT_PERM_READ,
+			BT_GATT_CHRC_PROP_READ | BT_GATT_CHRC_PROP_NOTIFY,
+			ccs_call_state_read, NULL,
+			ccs);
+
+	ccs->status_flag_ccc = gatt_db_service_add_ccc(ccs->service,
+					BT_ATT_PERM_READ | BT_ATT_PERM_WRITE);
+
+	bt_uuid16_create(&uuid, INCOM_CALL_TARGET_URI_CHRC_UUID);
+	ccs->target_bearer_uri = gatt_db_service_add_characteristic(ccs->service,
+			&uuid, BT_ATT_PERM_READ,
+			BT_GATT_CHRC_PROP_READ,
+			ccs_call_state_read, NULL,
+			ccs);
+
+	bt_uuid16_create(&uuid, CALL_STATE_CHRC_UUID);
+	ccs->call_ctrl_point = gatt_db_service_add_characteristic(ccs->service,
+			&uuid, BT_ATT_PERM_READ,
+			BT_GATT_CHRC_PROP_READ | BT_GATT_CHRC_PROP_NOTIFY,
+			ccs_call_state_read, NULL,
+			ccs);
+
+	ccs->call_ctrl_point_ccc = gatt_db_service_add_ccc(ccs->service,
+					BT_ATT_PERM_READ | BT_ATT_PERM_WRITE);
+
+	bt_uuid16_create(&uuid, CALL_CTRL_POINT_CHRC_UUID);
+	ccs->call_ctrl_opt_opcode = gatt_db_service_add_characteristic(ccs->service,
+			&uuid, BT_ATT_PERM_WRITE,
+			BT_GATT_CHRC_PROP_WRITE | BT_GATT_CHRC_PROP_WRITE_WITHOUT_RESP |
+			BT_GATT_CHRC_PROP_NOTIFY,
+			NULL, ccs_call_state_write,
+			ccs);
+
+	bt_uuid16_create(&uuid, CALL_CTRL_POINT_OPT_OPCODE_CHRC_UUID);
+	ccs->call_ctrl_opt_opcode = gatt_db_service_add_characteristic(ccs->service,
+			&uuid, BT_ATT_PERM_READ,
+			BT_GATT_CHRC_PROP_READ,
+			ccs_call_state_read, NULL,
+			ccs);
+
+	bt_uuid16_create(&uuid, TERMINATION_REASON_CHRC_UUID);
+	ccs->termination_reason = gatt_db_service_add_characteristic(ccs->service,
+			&uuid, BT_ATT_PERM_READ,
+			BT_GATT_CHRC_PROP_READ | BT_GATT_CHRC_PROP_NOTIFY,
+			ccs_call_state_read, NULL,
+			ccs);
+
+	bt_uuid16_create(&uuid, INCOMING_CALL_CHRC_UUID);
+	ccs->incoming_call = gatt_db_service_add_characteristic(ccs->service,
+			&uuid, BT_ATT_PERM_NONE,
+			BT_GATT_CHRC_PROP_NOTIFY,
+			NULL, NULL,
+			ccs);
+
+	ccs->incoming_call_ccc = gatt_db_service_add_ccc(ccs->service,
+					BT_ATT_PERM_READ | BT_ATT_PERM_WRITE);
+
+	bt_uuid16_create(&uuid, CALL_FRIENDLY_NAME_CHRC_UUID);
+	ccs->friendly_name = gatt_db_service_add_characteristic(ccs->service,
+			&uuid, BT_ATT_PERM_READ,
+			BT_GATT_CHRC_PROP_READ | BT_GATT_CHRC_PROP_NOTIFY,
+			ccs_call_state_read, NULL,
+			ccs);
+
+	ccs->friendly_name_ccc = gatt_db_service_add_ccc(ccs->service,
+					BT_ATT_PERM_READ | BT_ATT_PERM_WRITE);
+
+	gatt_db_service_set_active(ccs->service, false);
+
+	return ccs;
+}
+
+static struct bt_ccs *ccp_get_ccs(struct bt_ccp *ccp)
+{
+	if (!ccp)
+		return NULL;
+
+	if (ccp->rdb->ccs)
+		return ccp->rdb->ccs;
+
+	ccp->rdb->ccs = new0(struct bt_ccs, 1);
+	ccp->rdb->ccs->mdb = ccp->rdb;
+
+	return ccp->rdb->ccs;
+}
+
+static void ccp_pending_destroy(void *data)
+{
+	struct bt_ccp_pending *pending = data;
+	struct bt_ccp *ccp = pending->ccp;
+
+	queue_remove_if(ccp->pending, NULL, pending);
+}
+
+static void ccp_pending_complete(bool success, uint8_t att_ecode,
+				const uint8_t *value, uint16_t length,
+				void *user_data)
+{
+	struct bt_ccp_pending *pending = user_data;
+
+	if (pending->func)
+		pending->func(success, att_ecode, value, length,
+						pending->user_data);
+}
+
+static void ccp_read_value(struct bt_ccp *ccp, uint16_t value_handle,
+				bt_gatt_client_read_callback_t func,
+				void *user_data)
+{
+	struct bt_ccp_pending *pending;
+
+	pending = new0(struct bt_ccp_pending, 1);
+	pending->ccp = ccp;
+	pending->func = func;
+	pending->user_data = user_data;
+
+	pending->id = bt_gatt_client_read_value(ccp->client, value_handle,
+						ccp_pending_complete, pending,
+						ccp_pending_destroy);
+	if (!pending->id) {
+		DBG(ccp, "Unable to send Read request");
+		free(pending);
+		return;
+	}
+
+	queue_push_tail(ccp->pending, pending);
+}
+
+static void read_call_back(bool success, uint8_t att_ecode,
+				const uint8_t *value, uint16_t length,
+				void *user_data)
+{
+	struct bt_ccp *ccp = user_data;
+
+	DBG(ccp, "");
+
+	if (!success) {
+		DBG(ccp, "Unable to read call state: error 0x%02x",
+				att_ecode);
+		return;
+	}
+}
+
+static void ccp_cb_register(uint16_t att_ecode, void *user_data)
+{
+	struct bt_ccp *ccp = user_data;
+
+	if (att_ecode)
+		DBG(ccp, "ccp cb notification failed: 0x%04x",
+					att_ecode);
+
+	/* TODO: generic handler for non-mandatory CCP call backs */
+}
+
+static void ccp_cb_notify(uint16_t value_handle, const uint8_t *value,
+					uint16_t length, void *user_data)
+{
+	 /* TODO: generic handler for non-mandatory CCP notifications */
+}
+
+static void ccp_cb_status_flag_register(uint16_t att_ecode, void *user_data)
+{
+	struct bt_ccp *ccp = user_data;
+
+	if (att_ecode)
+		DBG(ccp, "ccp cb notification failed: 0x%04x", att_ecode);
+}
+
+static void ccp_cb_status_flag_notify(uint16_t value_handle, const uint8_t *value,
+					uint16_t length, void *user_data)
+{
+	struct bt_ccp *ccp = user_data;
+
+  DBG(ccp, "");
+
+	if (!length)
+		return;
+}
+
+static void ccp_cb_terminate_register(uint16_t att_ecode, void *user_data)
+{
+	struct bt_ccp *ccp = user_data;
+
+	if (att_ecode)
+		DBG(ccp, "ccp cb notification failed: 0x%04x",
+					att_ecode);
+}
+
+static void ccp_cb_terminate_notify(uint16_t value_handle, const uint8_t *value,
+					uint16_t length, void *user_data)
+{
+	struct bt_ccp *ccp = user_data;
+
+  DBG(ccp, "");
+
+	if (!length)
+		return;
+
+	/* TODO: update call state in Local context */
+}
+
+static void ccp_cb_bearer_name_register(uint16_t att_ecode, void *user_data)
+{
+	struct bt_ccp *ccp = user_data;
+
+	DBG(ccp, "");
+
+	if (att_ecode)
+		DBG(ccp, "ccp cb notification failed: 0x%04x",
+					att_ecode);
+}
+
+static void ccp_cb_bearer_name_notify(uint16_t value_handle, const uint8_t *value,
+					uint16_t length, void *user_data)
+{
+	struct bt_ccp *ccp = user_data;
+
+	DBG(ccp, "");
+
+	if (!length)
+		return;
+
+	/* TODO: update call details in Local context */
+}
+
+static void ccp_cb_call_list_register(uint16_t att_ecode, void *user_data)
+{
+	struct bt_ccp *ccp = user_data;
+
+	DBG(ccp, "");
+
+	if (att_ecode)
+		DBG(ccp, "ccp cb notification failed: 0x%04x", att_ecode);
+}
+
+static void ccp_cb_call_list_notify(uint16_t value_handle, const uint8_t *value,
+					uint16_t length, void *user_data)
+{
+	struct bt_ccp *ccp = user_data;
+
+	DBG(ccp, "");
+
+	if (!length)
+		return;
+
+	 /* TODO: update call list in Local context */
+}
+
+static void ccp_cb_call_state_register(uint16_t att_ecode, void *user_data)
+{
+	struct bt_ccp *ccp = user_data;
+
+	DBG(ccp, "");
+
+	if (att_ecode)
+		DBG(ccp, "ccp cb notification failed: 0x%04x",
+					att_ecode);
+}
+
+static void ccp_cb_call_state_notify(uint16_t value_handle, const uint8_t *value,
+					uint16_t length, void *user_data)
+{
+	struct bt_ccp *ccp = user_data;
+
+	DBG(ccp, "");
+
+	if (!length)
+		return;
+
+	/* TODO: update call state in Local context */
+}
+
+static void ccp_cb_incom_call_register(uint16_t att_ecode, void *user_data)
+{
+	struct bt_ccp *ccp = user_data;
+
+	DBG(ccp, "");
+
+	if (att_ecode)
+		DBG(ccp, "ccp cb notification failed: 0x%04x",
+					att_ecode);
+}
+
+static void ccp_cb_incom_call_notify(uint16_t value_handle, const uint8_t *value,
+					uint16_t length, void *user_data)
+{
+	struct bt_ccp *ccp = user_data;
+
+	DBG(ccp, "");
+
+	if (!length)
+		return;
+
+	/* TODO: Handle incoming call notofiation, Answer/reject etc */
+}
+
+static void bt_ccp_incom_call_attach(struct bt_ccp *ccp)
+{
+	uint16_t value_handle;
+	struct bt_ccs *ccs = ccp_get_ccs(ccp);
+
+	DBG(ccp, "");
+
+	if (!gatt_db_attribute_get_char_data(ccs->incoming_call, NULL, &value_handle,
+						NULL, NULL, NULL))
+		return;
+
+	ccp_read_value(ccp, value_handle, read_call_back, ccp);
+
+	ccp->incoming_call_id = bt_gatt_client_register_notify(ccp->client,
+				value_handle, ccp_cb_incom_call_register,
+				ccp_cb_incom_call_notify, ccp, NULL);
+}
+
+static void bt_ccp_call_state_attach(struct bt_ccp *ccp)
+{
+	uint16_t value_handle;
+	struct bt_ccs *ccs = ccp_get_ccs(ccp);
+
+	DBG(ccp, "");
+
+	if (!gatt_db_attribute_get_char_data(ccs->call_state, NULL, &value_handle,
+						NULL, NULL, NULL))
+		return;
+
+	ccp_read_value(ccp, value_handle, read_call_back, ccp);
+
+	ccp->call_state_id = bt_gatt_client_register_notify(ccp->client,
+				value_handle, ccp_cb_call_state_register,
+				ccp_cb_call_state_notify, ccp, NULL);
+}
+
+static void bt_ccp_call_list_attach(struct bt_ccp *ccp)
+{
+	uint16_t value_handle;
+	struct bt_ccs *ccs = ccp_get_ccs(ccp);
+
+	DBG(ccp, "");
+
+	if (!gatt_db_attribute_get_char_data(ccs->current_call_list, NULL, &value_handle,
+						NULL, NULL, NULL))
+		return;
+
+	ccp_read_value(ccp, value_handle, read_call_back, ccp);
+
+	ccp->current_call_list_id = bt_gatt_client_register_notify(ccp->client,
+				value_handle, ccp_cb_call_list_register,
+				ccp_cb_call_list_notify, ccp, NULL);
+}
+
+static void bt_ccp_name_attach(struct bt_ccp *ccp)
+{
+	uint16_t value_handle;
+	struct bt_ccs *ccs = ccp_get_ccs(ccp);
+
+	DBG(ccp, "");
+
+	if (!gatt_db_attribute_get_char_data(ccs->bearer_name, NULL, &value_handle,
+						NULL, NULL, NULL))
+		return;
+
+	ccp_read_value(ccp, value_handle, read_call_back, ccp);
+
+	ccp->bearer_name_id = bt_gatt_client_register_notify(ccp->client,
+				value_handle, ccp_cb_bearer_name_register,
+				ccp_cb_bearer_name_notify, ccp, NULL);
+}
+
+static void bt_ccp_term_reason_attach(struct bt_ccp *ccp)
+{
+	uint16_t value_handle;
+	struct bt_ccs *ccs = ccp_get_ccs(ccp);
+
+	DBG(ccp, "");
+
+	if (!gatt_db_attribute_get_char_data(ccs->termination_reason, NULL, &value_handle,
+						NULL, NULL, NULL))
+		return;
+
+	ccp_read_value(ccp, value_handle, read_call_back, ccp);
+
+	ccp->termination_reason_id = bt_gatt_client_register_notify(ccp->client,
+				value_handle, ccp_cb_terminate_register,
+				ccp_cb_terminate_notify, ccp, NULL);
+}
+
+static void bt_ccp_status_attach(struct bt_ccp *ccp)
+{
+	uint16_t value_handle;
+	struct bt_ccs *ccs = ccp_get_ccs(ccp);
+
+	DBG(ccp, "");
+
+	if (!gatt_db_attribute_get_char_data(ccs->status_flag, NULL, &value_handle,
+						NULL, NULL, NULL))
+		return;
+
+	ccp_read_value(ccp, value_handle, read_call_back, ccp);
+
+	ccp->status_flag_id = bt_gatt_client_register_notify(ccp->client,
+				value_handle, ccp_cb_status_flag_register,
+				ccp_cb_status_flag_notify, ccp, NULL);
+}
+
+static void bt_ccp_uci_attach(struct bt_ccp *ccp)
+{
+	uint16_t value_handle;
+	struct bt_ccs *ccs = ccp_get_ccs(ccp);
+
+	DBG(ccp, "");
+
+	if (!gatt_db_attribute_get_char_data(ccs->bearer_uci, NULL, &value_handle,
+						NULL, NULL, NULL))
+		return;
+
+	ccp_read_value(ccp, value_handle, read_call_back, ccp);
+
+	ccp->bearer_uci_id = bt_gatt_client_register_notify(ccp->client,
+				value_handle, ccp_cb_register,
+				ccp_cb_notify, ccp, NULL);
+}
+
+static void bt_ccp_technology_attach(struct bt_ccp *ccp)
+{
+	uint16_t value_handle;
+	struct bt_ccs *ccs = ccp_get_ccs(ccp);
+
+	DBG(ccp, "");
+
+	if (!gatt_db_attribute_get_char_data(ccs->bearer_technology, NULL, &value_handle,
+						NULL, NULL, NULL))
+		return;
+
+	ccp_read_value(ccp, value_handle, read_call_back, ccp);
+
+	ccp->bearer_technology_id = bt_gatt_client_register_notify(ccp->client,
+				value_handle, ccp_cb_register,
+				ccp_cb_notify, ccp, NULL);
+}
+static void bt_ccp_strength_attach(struct bt_ccp *ccp)
+{
+	uint16_t value_handle;
+	struct bt_ccs *ccs = ccp_get_ccs(ccp);
+
+	DBG(ccp, "");
+
+	if (!gatt_db_attribute_get_char_data(ccs->signal_strength, NULL, &value_handle,
+						NULL, NULL, NULL))
+		return;
+
+	ccp_read_value(ccp, value_handle, read_call_back, ccp);
+
+	ccp->signal_strength_id = bt_gatt_client_register_notify(ccp->client,
+				value_handle, ccp_cb_register,
+				ccp_cb_notify, ccp, NULL);
+}
+
+static void bt_ccp_ccid_attach(struct bt_ccp *ccp)
+{
+	uint16_t value_handle;
+	struct bt_ccs *ccs = ccp_get_ccs(ccp);
+
+	DBG(ccp, "");
+
+	if (!gatt_db_attribute_get_char_data(ccs->ccid, NULL, &value_handle,
+						NULL, NULL, NULL))
+		return;
+
+	ccp_read_value(ccp, value_handle, read_call_back, ccp);
+
+	ccp->ccid_id = bt_gatt_client_register_notify(ccp->client,
+				value_handle, ccp_cb_register,
+				ccp_cb_notify, ccp, NULL);
+}
+static void bt_ccp_tar_uri_attach(struct bt_ccp *ccp)
+{
+	uint16_t value_handle;
+	struct bt_ccs *ccs = ccp_get_ccs(ccp);
+
+	DBG(ccp, "");
+
+	if (!gatt_db_attribute_get_char_data(ccs->target_bearer_uri, NULL, &value_handle,
+						NULL, NULL, NULL))
+		return;
+
+	ccp_read_value(ccp, value_handle, read_call_back, ccp);
+
+	ccp->target_bearer_uri_id = bt_gatt_client_register_notify(ccp->client,
+				value_handle, ccp_cb_register,
+				ccp_cb_notify, ccp, NULL);
+}
+
+static void bt_ccp_ctrl_point_attach(struct bt_ccp *ccp)
+{
+	uint16_t value_handle;
+	struct bt_ccs *ccs = ccp_get_ccs(ccp);
+
+	DBG(ccp, "");
+
+	if (!gatt_db_attribute_get_char_data(ccs->call_ctrl_point, NULL, &value_handle,
+						NULL, NULL, NULL))
+		return;
+
+	ccp_read_value(ccp, value_handle, read_call_back, ccp);
+
+	ccp->call_control_pt_id = bt_gatt_client_register_notify(ccp->client,
+				value_handle, ccp_cb_register,
+				ccp_cb_notify, ccp, NULL);
+}
+
+static void bt_ccp_ctrl_opcode_attach(struct bt_ccp *ccp)
+{
+	uint16_t value_handle;
+	struct bt_ccs *ccs = ccp_get_ccs(ccp);
+
+  DBG(ccp, "");
+
+	if (!gatt_db_attribute_get_char_data(ccs->call_ctrl_opt_opcode, NULL, &value_handle,
+						NULL, NULL, NULL))
+		return;
+
+	ccp_read_value(ccp, value_handle, read_call_back, ccp);
+
+	ccp->call_control_opt_opcode_id = bt_gatt_client_register_notify(ccp->client,
+				value_handle, ccp_cb_register,
+				ccp_cb_notify, ccp, NULL);
+}
+
+static void bt_ccp_friendly_name_attach(struct bt_ccp *ccp)
+{
+	uint16_t value_handle;
+	struct bt_ccs *ccs = ccp_get_ccs(ccp);
+
+	DBG(ccp, "");
+
+	if (!gatt_db_attribute_get_char_data(ccs->friendly_name, NULL, &value_handle,
+						NULL, NULL, NULL))
+		return;
+
+	ccp_read_value(ccp, value_handle, read_call_back, ccp);
+
+	ccp->friendly_name_id = bt_gatt_client_register_notify(ccp->client,
+				value_handle, ccp_cb_register,
+				ccp_cb_notify, ccp, NULL);
+}
+
+static void bt_ccp_signal_intrvl_attach(struct bt_ccp *ccp)
+{
+	uint16_t value_handle;
+	struct bt_ccs *ccs = ccp_get_ccs(ccp);
+
+	DBG(ccp, "");
+
+	if (!gatt_db_attribute_get_char_data(ccs->signal_reporting_intrvl, NULL, &value_handle,
+						NULL, NULL, NULL))
+		return;
+
+	ccp_read_value(ccp, value_handle, read_call_back, ccp);
+
+	ccp->signal_reporting_intrvl_id = bt_gatt_client_register_notify(ccp->client,
+				value_handle, ccp_cb_register,
+				ccp_cb_notify, ccp, NULL);
+}
+
+static void bt_ccp_uri_list_attach(struct bt_ccp *ccp)
+{
+	uint16_t value_handle;
+	struct bt_ccs *ccs = ccp_get_ccs(ccp);
+
+	DBG(ccp, "");
+
+	if (!gatt_db_attribute_get_char_data(ccs->bearer_uri_schemes_list, NULL, &value_handle,
+						NULL, NULL, NULL))
+		return;
+
+	ccp_read_value(ccp, value_handle, read_call_back, ccp);
+
+	ccp->bearer_uri_schemes_list_id = bt_gatt_client_register_notify(ccp->client,
+				value_handle, ccp_cb_register,
+				ccp_cb_notify, ccp, NULL);
+}
+
+static void foreach_ccs_char(struct gatt_db_attribute *attr, void *user_data)
+{
+	struct bt_ccp *ccp = user_data;
+	struct bt_ccs *ccs;
+	uint16_t value_handle;
+	bt_uuid_t uuid;
+
+	if (!gatt_db_attribute_get_char_data(attr, NULL, &value_handle,
+						NULL, NULL, &uuid))
+		return;
+
+	ccs = ccp_get_ccs(ccp);
+	if (!ccs || ccs->call_state)
+		return;
+
+	if (bt_uuid16_cmp(&uuid, BEARER_PROVIDER_NAME_CHRC_UUID)) {
+		DBG(ccp, "Found Bearer Name, handle 0x%04x", value_handle);
+
+		ccs->bearer_name = attr;
+		bt_ccp_name_attach(ccp);
+	}
+
+	if (bt_uuid16_cmp(&uuid, BEARER_UCI_CHRC_UUID)) {
+		DBG(ccp, "Found Bearer Uci, handle 0x%04x", value_handle);
+
+		ccs->bearer_uci = attr;
+		bt_ccp_uci_attach(ccp);
+	}
+
+	if (bt_uuid16_cmp(&uuid, BEARER_TECH_CHRC_UUID)) {
+		DBG(ccp, "Found Bearer Technology, handle 0x%04x", value_handle);
+
+		ccs->bearer_technology = attr;
+		bt_ccp_technology_attach(ccp);
+	}
+
+	if (bt_uuid16_cmp(&uuid, BEARER_SIGNAL_STR_CHRC_UUID)) {
+		DBG(ccp, "Found Signal Strength, handle 0x%04x", value_handle);
+
+		ccs->signal_strength = attr;
+		bt_ccp_strength_attach(ccp);
+	}
+
+	if (bt_uuid16_cmp(&uuid, BEARER_SIGNAL_INTRVL_CHRC_UUID)) {
+		DBG(ccp, "Found Signal Interval, handle 0x%04x", value_handle);
+
+		ccs->signal_reporting_intrvl = attr;
+		bt_ccp_signal_intrvl_attach(ccp);
+	}
+
+	if (bt_uuid16_cmp(&uuid, CALL_STATUS_FLAG_CHRC_UUID)) {
+		DBG(ccp, "Found Status Flag, handle 0x%04x", value_handle);
+
+		ccs->status_flag = attr;
+		bt_ccp_status_attach(ccp);
+	}
+
+	if (bt_uuid16_cmp(&uuid, BEARER_URI_SCHEME_CHRC_UUID)) {
+		DBG(ccp, "Found URI Scheme, handle 0x%04x", value_handle);
+
+		ccs->bearer_uri_schemes_list = attr;
+		bt_ccp_uri_list_attach(ccp);
+	}
+
+	if (bt_uuid16_cmp(&uuid, CURR_CALL_LIST_CHRC_UUID)) {
+		DBG(ccp, "Found Call List, handle 0x%04x", value_handle);
+
+		ccs->current_call_list = attr;
+		bt_ccp_call_list_attach(ccp);
+	}
+
+	if (bt_uuid16_cmp(&uuid, BEARER_CCID_CHRC_UUID)) {
+		DBG(ccp, "Found CCID, handle 0x%04x", value_handle);
+
+		ccs->ccid = attr;
+		bt_ccp_ccid_attach(ccp);
+	}
+
+	if (bt_uuid16_cmp(&uuid, INCOM_CALL_TARGET_URI_CHRC_UUID)) {
+		DBG(ccp, "Found Bearer Uri, handle 0x%04x", value_handle);
+
+		ccs->target_bearer_uri = attr;
+		bt_ccp_tar_uri_attach(ccp);
+	}
+
+	if (bt_uuid16_cmp(&uuid, CALL_CTRL_POINT_CHRC_UUID)) {
+		DBG(ccp, "Found Control Point, handle 0x%04x", value_handle);
+
+		ccs->call_ctrl_point = attr;
+		bt_ccp_ctrl_point_attach(ccp);
+	}
+
+	if (bt_uuid16_cmp(&uuid, CALL_CTRL_POINT_OPT_OPCODE_CHRC_UUID)) {
+		DBG(ccp, "Found Control opcode, handle 0x%04x", value_handle);
+
+		ccs->call_ctrl_opt_opcode = attr;
+		bt_ccp_ctrl_opcode_attach(ccp);
+	}
+
+	if (bt_uuid16_cmp(&uuid, TERMINATION_REASON_CHRC_UUID)) {
+		DBG(ccp, "Found Termination Reason, handle 0x%04x", value_handle);
+
+		ccs->termination_reason = attr;
+		bt_ccp_term_reason_attach(ccp);
+	}
+
+	if (bt_uuid16_cmp(&uuid, INCOMING_CALL_CHRC_UUID)) {
+		DBG(ccp, "Found Incoming call, handle 0x%04x", value_handle);
+
+		ccs->incoming_call = attr;
+		bt_ccp_incom_call_attach(ccp);
+	}
+
+	if (bt_uuid16_cmp(&uuid, CALL_FRIENDLY_NAME_CHRC_UUID)) {
+		DBG(ccp, "Found Friendly name, handle 0x%04x", value_handle);
+
+		ccs->friendly_name = attr;
+		bt_ccp_friendly_name_attach(ccp);
+	}
+}
+
+void bt_ccp_set_event_callbacks(struct bt_ccp *ccp,
+				const struct bt_ccp_event_callback *cbs,
+				void *user_data)
+{
+	struct event_callback *cb;
+
+	if (ccp->cb)
+		free(ccp->cb);
+
+	cb = new0(struct event_callback, 1);
+	cb->cbs = cbs;
+	cb->user_data = user_data;
+
+	ccp->cb = cb;
+}
+
+static void foreach_ccs_service(struct gatt_db_attribute *attr,
+						void *user_data)
+{
+	struct bt_ccp *ccp = user_data;
+	struct bt_ccs *ccs = ccp_get_ccs(ccp);
+
+	ccs->service = attr;
+
+	gatt_db_service_foreach_char(attr, foreach_ccs_char, ccp);
+}
+
+static struct bt_ccp_db *ccp_db_new(struct gatt_db *db)
+{
+	struct bt_ccp_db *mdb;
+
+	if (!db)
+		return NULL;
+
+	mdb = new0(struct bt_ccp_db, 1);
+	mdb->db = gatt_db_ref(db);
+
+	if (!ccp_db)
+		ccp_db = queue_new();
+
+	queue_push_tail(ccp_db, mdb);
+
+	mdb->ccs = ccs_new(db);
+	return mdb;
+}
+
+static struct bt_ccp_db *ccp_get_db(struct gatt_db *db)
+{
+	struct bt_ccp_db *mdb;
+
+	mdb = queue_find(ccp_db, ccp_db_match, db);
+	if (mdb)
+		return mdb;
+
+	return ccp_db_new(db);
+}
+
+struct bt_ccp *bt_ccp_new(struct gatt_db *ldb, struct gatt_db *rdb)
+{
+	struct bt_ccp *ccp;
+	struct bt_ccp_db *mdb;
+
+	if (!ldb)
+		return NULL;
+
+	mdb = ccp_get_db(ldb);
+	if (!mdb)
+		return NULL;
+
+	ccp = new0(struct bt_ccp, 1);
+	ccp->ldb = mdb;
+	ccp->pending = queue_new();
+
+	if (!rdb)
+		goto done;
+
+	mdb = new0(struct bt_ccp_db, 1);
+	mdb->db = gatt_db_ref(rdb);
+
+	ccp->rdb = mdb;
+
+done:
+	bt_ccp_ref(ccp);
+
+	return ccp;
+}
+
+void bt_ccp_register(struct gatt_db *db)
+{
+	ccp_db_new(db);
+}
+
+bool bt_ccp_attach(struct bt_ccp *ccp, struct bt_gatt_client *client)
+{
+	bt_uuid_t uuid;
+
+	DBG(ccp, "ccp %p", ccp);
+
+	ccp->client = bt_gatt_client_clone(client);
+	if (!ccp->client)
+		return false;
+
+	if (ccp->rdb->ccs) {
+		bt_ccp_call_state_attach(ccp);
+		return true;
+	}
+
+	bt_uuid16_create(&uuid, GTBS_UUID);
+	gatt_db_foreach_service(ccp->rdb->db, &uuid, foreach_ccs_service, ccp);
+
+	return true;
+}
+
+void bt_ccp_detach(struct bt_ccp *ccp)
+{
+	DBG(ccp, "%p", ccp);
+
+	bt_gatt_client_unref(ccp->client);
+	ccp->client = NULL;
+}
diff --git a/src/shared/ccp.h b/src/shared/ccp.h
new file mode 100644
index 000000000000..809986c2601a
--- /dev/null
+++ b/src/shared/ccp.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/*
+ *
+ *  BlueZ - Bluetooth protocol stack for Linux
+ *
+ *  Copyright (C) 2020  Intel Corporation. All rights reserved.
+ *
+ */
+
+#include <stdbool.h>
+#include <inttypes.h>
+
+#ifndef __packed
+#define __packed __attribute__((packed))
+#endif
+
+struct bt_ccp;
+struct bt_ccp_db;
+struct bt_ccp_session_info;
+
+typedef void (*bt_ccp_debug_func_t)(const char *str, void *user_data);
+typedef void (*bt_ccp_destroy_func_t)(void *user_data);
+
+struct bt_ccp_event_callback {
+	void (*call_state)(struct bt_ccp *ccp,  const uint8_t *value,
+					uint16_t length);
+};
+
+void bt_ccp_set_event_callbacks(struct bt_ccp *ccp,
+				const struct bt_ccp_event_callback *cbs,
+				void *user_data);
+
+bool bt_ccp_set_debug(struct bt_ccp *ccp, bt_ccp_debug_func_t cb,
+			void *user_data, bt_ccp_destroy_func_t destroy);
+
+void bt_ccp_register(struct gatt_db *db);
+bool bt_ccp_attach(struct bt_ccp *ccp, struct bt_gatt_client *client);
+void bt_ccp_detach(struct bt_ccp *ccp);
+
+struct bt_ccp *bt_ccp_new(struct gatt_db *ldb, struct gatt_db *rdb);
+struct bt_ccp *bt_ccp_ref(struct bt_ccp *ccp);
+void bt_ccp_unref(struct bt_ccp *ccp);
+
+bool bt_ccp_set_user_data(struct bt_ccp *ccp, void *user_data);
+void *bt_ccp_get_user_data(struct bt_ccp *ccp);
-- 
2.34.1


