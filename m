Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21A345BC3EB
	for <lists+linux-bluetooth@lfdr.de>; Mon, 19 Sep 2022 10:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbiISIGI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 19 Sep 2022 04:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbiISIFw (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 19 Sep 2022 04:05:52 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93090B7F6
        for <linux-bluetooth@vger.kernel.org>; Mon, 19 Sep 2022 01:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663574750; x=1695110750;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DMlFZNTR0plVopfNR7Y3JDodYK3vB1kCsQPfd/fJ2qw=;
  b=gD6j+4ZNrLnJOk4UobWgIY2xhChHBkPJ4LPpEiWY5AgBVoGdbHm7vx7c
   rJcIIiEmWHNhYcnZJLwzlRm5fU2g9Qn+YNxiOq5XK18TC3Gprcq/RCw8H
   aqFB7ODbwol+bWBvKkwVMBYn/KfYQPJ98QmbSMEGu98Mx5DNaiHXUX7xk
   axysOw2cqFAzP9g6fvHUkGzy1cK7SkZ59RfX4mZkoSH4pJ89BbbTNSQhv
   6jVW+cg/1RK3AD4d0btvi4GHKPyCJ1UWku4TysWQA3I0cl+VOPAWn/WQc
   y0WyUUWKWW66IK/Fpu5/FIL48n5KLGLOexuu0iezmqg9kIFRhpgKNre8J
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="279718267"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; 
   d="scan'208";a="279718267"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 01:05:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; 
   d="scan'208";a="947113933"
Received: from bsblt022.iind.intel.com ([10.224.186.21])
  by fmsmga005.fm.intel.com with ESMTP; 19 Sep 2022 01:05:48 -0700
From:   Sathish Narasimman <sathish.narasimman@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Sathish Narasimman <sathish.narasimman@intel.com>
Subject: [PATCH BlueZ v3 1/3] shared/vcp: Add initial code for handling VCP
Date:   Mon, 19 Sep 2022 13:37:20 +0530
Message-Id: <20220919080722.562080-1-sathish.narasimman@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This adds initial code for Volume Control Profile.
---
 Makefile.am      |    1 +
 src/shared/vcp.c | 1104 ++++++++++++++++++++++++++++++++++++++++++++++
 src/shared/vcp.h |   58 +++
 3 files changed, 1163 insertions(+)
 create mode 100644 src/shared/vcp.c
 create mode 100644 src/shared/vcp.h

diff --git a/Makefile.am b/Makefile.am
index 960bf21bc726..27715c73d76f 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -231,6 +231,7 @@ shared_sources = src/shared/io.h src/shared/timeout.h \
 			src/shared/gap.h src/shared/gap.c \
 			src/shared/log.h src/shared/log.c \
 			src/shared/bap.h src/shared/bap.c src/shared/ascs.h \
+			src/shared/vcp.c src/shared/vcp.h \
 			src/shared/lc3.h src/shared/tty.h
 
 if READLINE
diff --git a/src/shared/vcp.c b/src/shared/vcp.c
new file mode 100644
index 000000000000..944483c60622
--- /dev/null
+++ b/src/shared/vcp.c
@@ -0,0 +1,1104 @@
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
+
+#include "src/shared/queue.h"
+#include "src/shared/util.h"
+#include "src/shared/timeout.h"
+#include "src/shared/att.h"
+#include "src/shared/gatt-db.h"
+#include "src/shared/gatt-server.h"
+#include "src/shared/gatt-client.h"
+#include "src/shared/vcp.h"
+#include "src/log.h"
+
+#define VCP_STEP_SIZE 1
+
+/* Apllication Error Code */
+#define BT_ATT_ERROR_INVALID_CHANGE_COUNTER	0x80
+#define BT_ATT_ERROR_OPCODE_NOT_SUPPORTED	0x81
+
+struct bt_vcp_db {
+	struct gatt_db *db;
+	struct bt_vcs *vcs;
+};
+
+typedef void (*vcp_func_t)(struct bt_vcp *vcp, bool success, uint8_t att_ecode,
+					const uint8_t *value, uint16_t length,
+					void *user_data);
+
+struct bt_vcp_pending {
+	unsigned int id;
+	struct bt_vcp *vcp;
+	vcp_func_t func;
+	void *user_data;
+};
+
+struct bt_vcs_param {
+	uint8_t	op;
+	uint8_t	change_counter;
+} __packed;
+
+struct bt_vcs_ab_vol {
+	uint8_t	change_counter;
+	uint8_t	vol_set;
+} __packed;
+
+struct bt_vcp_cb {
+	unsigned int id;
+	bt_vcp_func_t attached;
+	bt_vcp_func_t detached;
+	void *user_data;
+};
+
+typedef void (*vcp_notify_t)(struct bt_vcp *vcp, uint16_t value_handle,
+				const uint8_t *value, uint16_t length,
+				void *user_data);
+
+struct bt_vcp_notify {
+	unsigned int id;
+	struct bt_vcp *vcp;
+	vcp_notify_t func;
+	void *user_data;
+};
+
+struct bt_vcp {
+	int ref_count;
+	struct bt_vcp_db *ldb;
+	struct bt_vcp_db *rdb;
+	struct bt_gatt_client *client;
+	struct bt_att *att;
+	unsigned int vstate_id;
+	unsigned int vflag_id;
+
+	struct queue *pending;
+
+	void *debug_data;
+	void *user_data;
+};
+
+#define RESET_VOLUME_SETTING 0x00
+#define USERSET_VOLUME_SETTING 0x01
+
+/* Contains local bt_vcp_db */
+struct vol_state {
+	uint8_t	vol_set;
+	uint8_t	mute;
+	uint8_t counter;
+} __packed;
+
+struct bt_vcs {
+	struct bt_vcp_db *vdb;
+	struct vol_state *vstate;
+	uint8_t vol_flag;
+	struct gatt_db_attribute *service;
+	struct gatt_db_attribute *vs;
+	struct gatt_db_attribute *vs_ccc;
+	struct gatt_db_attribute *vol_cp;
+	struct gatt_db_attribute *vf;
+	struct gatt_db_attribute *vf_ccc;
+};
+
+static struct queue *vcp_db;
+static struct queue *vcp_cbs;
+static struct queue *sessions;
+
+static void *iov_pull_mem(struct iovec *iov, size_t len)
+{
+	void *data = iov->iov_base;
+
+	if (iov->iov_len < len)
+		return NULL;
+
+	iov->iov_base += len;
+	iov->iov_len -= len;
+
+	return data;
+}
+
+static struct bt_vcp_db *vcp_get_vdb(struct bt_vcp *vcp)
+{
+	if (!vcp)
+		return NULL;
+
+	if (vcp->ldb)
+		return vcp->ldb;
+
+	return NULL;
+}
+
+static struct vol_state *vdb_get_vstate(struct bt_vcp_db *vdb)
+{
+	if (!vdb->vcs)
+		return NULL;
+
+	if (vdb->vcs->vstate)
+		return vdb->vcs->vstate;
+
+	return NULL;
+}
+
+static struct bt_vcs *vcp_get_vcs(struct bt_vcp *vcp)
+{
+	if (!vcp)
+		return NULL;
+
+	if (vcp->rdb->vcs)
+		return vcp->rdb->vcs;
+
+	vcp->rdb->vcs = new0(struct bt_vcs, 1);
+	vcp->rdb->vcs->vdb = vcp->rdb;
+
+	return vcp->rdb->vcs;
+}
+
+static void vcp_detached(void *data, void *user_data)
+{
+	struct bt_vcp_cb *cb = data;
+	struct bt_vcp *vcp = user_data;
+
+	cb->detached(vcp, cb->user_data);
+}
+
+void bt_vcp_detach(struct bt_vcp *vcp)
+{
+	if (!queue_remove(sessions, vcp))
+		return;
+
+	bt_gatt_client_unref(vcp->client);
+	vcp->client = NULL;
+
+	queue_foreach(vcp_cbs, vcp_detached, vcp);
+}
+
+static void vcp_db_free(void *data)
+{
+	struct bt_vcp_db *vdb = data;
+
+	if (!vdb)
+		return;
+
+	gatt_db_unref(vdb->db);
+
+	free(vdb->vcs);
+	free(vdb);
+}
+
+static void vcp_free(void *data)
+{
+	struct bt_vcp *vcp = data;
+
+	bt_vcp_detach(vcp);
+
+	vcp_db_free(vcp->rdb);
+
+	queue_destroy(vcp->pending, NULL);
+
+	free(vcp);
+}
+bool bt_vcp_set_user_data(struct bt_vcp *vcp, void *user_data)
+{
+	if (!vcp)
+		return false;
+
+	vcp->user_data = user_data;
+
+	return true;
+}
+
+static bool vcp_db_match(const void *data, const void *match_data)
+{
+	const struct bt_vcp_db *vdb = data;
+	const struct gatt_db *db = match_data;
+
+	return (vdb->db == db);
+}
+
+struct bt_att *bt_vcp_get_att(struct bt_vcp *vcp)
+{
+	if (!vcp)
+		return NULL;
+
+	if (vcp->att)
+		return vcp->att;
+
+	return bt_gatt_client_get_att(vcp->client);
+}
+
+struct bt_vcp *bt_vcp_ref(struct bt_vcp *vcp)
+{
+	if (!vcp)
+		return NULL;
+
+	__sync_fetch_and_add(&vcp->ref_count, 1);
+
+	return vcp;
+}
+
+void bt_vcp_unref(struct bt_vcp *vcp)
+{
+	if (!vcp)
+		return;
+
+	if (__sync_sub_and_fetch(&vcp->ref_count, 1))
+		return;
+
+	vcp_free(vcp);
+}
+
+static void vcp_disconnected(int err, void *user_data)
+{
+	struct bt_vcp *vcp = user_data;
+
+	DBG("vcp %p disconnected err %d", vcp, err);
+
+	bt_vcp_detach(vcp);
+}
+
+static struct bt_vcp *vcp_get_session(struct bt_att *att, struct gatt_db *db)
+{
+	const struct queue_entry *entry;
+	struct bt_vcp *vcp;
+
+	for (entry = queue_get_entries(sessions); entry; entry = entry->next) {
+		struct bt_vcp *vcp = entry->data;
+
+		if (att == bt_vcp_get_att(vcp))
+			return vcp;
+	}
+
+	vcp = bt_vcp_new(db, NULL);
+	vcp->att = att;
+
+	bt_att_register_disconnect(att, vcp_disconnected, vcp, NULL);
+
+	bt_vcp_attach(vcp, NULL);
+
+	return vcp;
+
+}
+
+static uint8_t vcs_rel_vol_down(struct bt_vcs *vcs, struct bt_vcp *vcp,
+				struct iovec *iov)
+{
+	struct bt_vcp_db *vdb;
+	struct vol_state *vstate;
+	uint8_t	*change_counter;
+
+	DBG("");
+
+	vdb = vcp_get_vdb(vcp);
+	if (!vdb) {
+		DBG("error: VDB not availalbe");
+		return 0;
+	}
+
+	vstate = vdb_get_vstate(vdb);
+	if (!vstate) {
+		DBG("error: VSTATE not availalbe");
+		return 0;
+	}
+
+	change_counter = iov_pull_mem(iov, sizeof(*change_counter));
+	if (!change_counter)
+		return 0;
+
+	if (*change_counter != vstate->counter) {
+		DBG("Change Counter Mismatch Volume not decremented!");
+		return BT_ATT_ERROR_INVALID_CHANGE_COUNTER;
+	}
+
+	vstate->vol_set = MAX((vstate->vol_set - VCP_STEP_SIZE), 0);
+	vstate->counter = -~vstate->counter; /*Increment Change Counter*/
+
+	gatt_db_attribute_notify(vdb->vcs->vs, (void *)vstate,
+				 sizeof(struct vol_state),
+				 bt_vcp_get_att(vcp));
+	return 0;
+}
+
+static uint8_t vcs_rel_vol_up(struct bt_vcs *vcs, struct bt_vcp *vcp,
+				struct iovec *iov)
+{
+	struct bt_vcp_db *vdb;
+	struct vol_state *vstate;
+	uint8_t	*change_counter;
+
+	DBG("");
+
+	vdb = vcp_get_vdb(vcp);
+	if (!vdb) {
+		DBG("error: VDB not availalbe");
+		return 0;
+	}
+
+	vstate = vdb_get_vstate(vdb);
+	if (!vstate) {
+		DBG("error: VCP database not availalbe!!!!");
+		return 0;
+	}
+
+	change_counter = iov_pull_mem(iov, sizeof(*change_counter));
+	if (!change_counter)
+		return 0;
+
+	if (*change_counter != vstate->counter) {
+		DBG("Change Counter Mismatch Volume not decremented!");
+		return BT_ATT_ERROR_INVALID_CHANGE_COUNTER;
+	}
+
+	vstate->vol_set = MIN((vstate->vol_set + VCP_STEP_SIZE), 255);
+	vstate->counter = -~vstate->counter; /*Increment Change Counter*/
+
+	gatt_db_attribute_notify(vdb->vcs->vs, (void *)vstate,
+				 sizeof(struct vol_state),
+				 bt_vcp_get_att(vcp));
+	return 0;
+}
+
+static uint8_t vcs_unmute_rel_vol_down(struct bt_vcs *vcs, struct bt_vcp *vcp,
+				struct iovec *iov)
+{
+	struct bt_vcp_db *vdb;
+	struct vol_state *vstate;
+	uint8_t	*change_counter;
+
+	DBG("");
+
+	vdb = vcp_get_vdb(vcp);
+	if (!vdb) {
+		DBG("error: VDB not availalbe");
+		return 0;
+	}
+
+	vstate = vdb_get_vstate(vdb);
+	if (!vstate) {
+		DBG("error: VCP database not availalbe!!!!");
+		return 0;
+	}
+
+	change_counter = iov_pull_mem(iov, sizeof(*change_counter));
+	if (!change_counter)
+		return 0;
+
+	if (*change_counter != vstate->counter) {
+		DBG("Change Counter Mismatch Volume not decremented!");
+		return BT_ATT_ERROR_INVALID_CHANGE_COUNTER;
+	}
+
+	vstate->mute = 0x00;
+	vstate->vol_set = MAX((vstate->vol_set - VCP_STEP_SIZE), 0);
+	vstate->counter = -~vstate->counter; /*Increment Change Counter*/
+
+	gatt_db_attribute_notify(vdb->vcs->vs, (void *)vstate,
+				 sizeof(struct vol_state),
+				 bt_vcp_get_att(vcp));
+	return 0;
+}
+
+static uint8_t vcs_unmute_rel_vol_up(struct bt_vcs *vcs, struct bt_vcp *vcp,
+				struct iovec *iov)
+{
+	struct bt_vcp_db *vdb;
+	struct vol_state *vstate;
+	uint8_t	*change_counter;
+
+	DBG("");
+
+	vdb = vcp_get_vdb(vcp);
+	if (!vdb) {
+		DBG("error: VDB not availalbe");
+		return 0;
+	}
+
+	vstate = vdb_get_vstate(vdb);
+	if (!vstate) {
+		DBG("error: VSTATE not availalbe");
+		return 0;
+	}
+
+	change_counter = iov_pull_mem(iov, sizeof(*change_counter));
+	if (!change_counter)
+		return 0;
+
+	if (*change_counter != vstate->counter) {
+		DBG("Change Counter Mismatch Volume not decremented!");
+		return BT_ATT_ERROR_INVALID_CHANGE_COUNTER;
+	}
+
+	vstate->mute = 0x00;
+	vstate->vol_set = MIN((vstate->vol_set + VCP_STEP_SIZE), 255);
+	vstate->counter = -~vstate->counter; /*Increment Change Counter*/
+
+	gatt_db_attribute_notify(vdb->vcs->vs, (void *)vstate,
+				 sizeof(struct vol_state),
+				 bt_vcp_get_att(vcp));
+	return 0;
+}
+
+static uint8_t vcs_set_absolute_vol(struct bt_vcs *vcs, struct bt_vcp *vcp,
+				struct iovec *iov)
+{
+	struct bt_vcp_db *vdb;
+	struct vol_state *vstate;
+	struct bt_vcs_ab_vol *req;
+
+	DBG("");
+
+	vdb = vcp_get_vdb(vcp);
+	if (!vdb) {
+		DBG("error: VDB not availalbe");
+		return 0;
+	}
+
+	vstate = vdb_get_vstate(vdb);
+	if (!vstate) {
+		DBG("error: VSTATE not availalbe");
+		return 0;
+	}
+
+	req = iov_pull_mem(iov, sizeof(*req));
+	if (!req)
+		return 0;
+
+	if (req->change_counter != vstate->counter) {
+		DBG("Change Counter Mismatch Volume not decremented!");
+		return BT_ATT_ERROR_INVALID_CHANGE_COUNTER;
+	}
+
+	vstate->vol_set = req->vol_set;
+	vstate->counter = -~vstate->counter; /*Increment Change Counter*/
+
+	gatt_db_attribute_notify(vdb->vcs->vs, (void *)vstate,
+				 sizeof(struct vol_state),
+				 bt_vcp_get_att(vcp));
+	return 0;
+}
+
+static uint8_t vcs_unmute(struct bt_vcs *vcs, struct bt_vcp *vcp,
+				struct iovec *iov)
+{
+	struct bt_vcp_db *vdb;
+	struct vol_state *vstate;
+	uint8_t	*change_counter;
+
+	DBG("");
+
+	vdb = vcp_get_vdb(vcp);
+	if (!vdb) {
+		DBG("error: VDB not availalbe");
+		return 0;
+	}
+
+	vstate = vdb_get_vstate(vdb);
+	if (!vstate) {
+		DBG("error: VSTATE not availalbe");
+		return 0;
+	}
+
+	change_counter = iov_pull_mem(iov, sizeof(*change_counter));
+	if (!change_counter)
+		return 0;
+
+	if (*change_counter != vstate->counter) {
+		DBG("Change Counter Mismatch Volume not decremented!");
+		return BT_ATT_ERROR_INVALID_CHANGE_COUNTER;
+	}
+
+	vstate->mute = 0x00;
+	vstate->counter = -~vstate->counter; /*Increment Change Counter*/
+
+	gatt_db_attribute_notify(vdb->vcs->vs, (void *)vstate,
+				 sizeof(struct vol_state),
+				 bt_vcp_get_att(vcp));
+	return 0;
+}
+
+static uint8_t vcs_mute(struct bt_vcs *vcs, struct bt_vcp *vcp,
+				struct iovec *iov)
+{
+	struct bt_vcp_db *vdb;
+	struct vol_state *vstate;
+	uint8_t	*change_counter;
+
+	DBG("");
+
+	vdb = vcp_get_vdb(vcp);
+	if (!vdb) {
+		DBG("error: VDB not availalbe");
+		return 0;
+	}
+
+	vstate = vdb_get_vstate(vdb);
+	if (!vstate) {
+		DBG("error: VSTATE not availalbe");
+		return 0;
+	}
+
+	change_counter = iov_pull_mem(iov, sizeof(*change_counter));
+	if (!change_counter)
+		return 0;
+
+	if (*change_counter != vstate->counter) {
+		DBG("Change Counter Mismatch Volume not decremented!");
+		return BT_ATT_ERROR_INVALID_CHANGE_COUNTER;
+	}
+
+	vstate->mute = 0x01;
+	vstate->counter = -~vstate->counter; /*Increment Change Counter*/
+
+	return 0;
+}
+
+#define	BT_VCS_REL_VOL_DOWN		0x00
+#define	BT_VCS_REL_VOL_UP		0x01
+#define	BT_VCS_UNMUTE_REL_VOL_DOWN	0x02
+#define	BT_VCS_UNMUTE_REL_VOL_UP	0x03
+#define	BT_VCS_SET_ABSOLUTE_VOL		0x04
+#define	BT_VCS_UNMUTE			0x05
+#define	BT_VCS_MUTE			0x06
+
+#define VCS_OP(_str, _op, _size, _func) \
+	{ \
+		.str = _str, \
+		.op = _op, \
+		.size = _size, \
+		.func = _func, \
+	}
+
+struct vcs_op_handler {
+	const char *str;
+	uint8_t	op;
+	size_t	size;
+	uint8_t	(*func)(struct bt_vcs *vcs, struct bt_vcp *vcp,
+			struct iovec *iov);
+} vcp_handlers[] = {
+	VCS_OP("Relative Volume Down", BT_VCS_REL_VOL_DOWN,
+		sizeof(uint8_t), vcs_rel_vol_down),
+	VCS_OP("Relative Volume Up", BT_VCS_REL_VOL_UP,
+		sizeof(uint8_t), vcs_rel_vol_up),
+	VCS_OP("Unmute - Relative Volume Down", BT_VCS_UNMUTE_REL_VOL_DOWN,
+		sizeof(uint8_t), vcs_unmute_rel_vol_down),
+	VCS_OP("Unmute - Relative Volume Up", BT_VCS_UNMUTE_REL_VOL_UP,
+		sizeof(uint8_t), vcs_unmute_rel_vol_up),
+	VCS_OP("Set Absolute Volume", BT_VCS_SET_ABSOLUTE_VOL,
+		sizeof(struct bt_vcs_ab_vol), vcs_set_absolute_vol),
+	VCS_OP("UnMute", BT_VCS_UNMUTE,
+		sizeof(uint8_t), vcs_unmute),
+	VCS_OP("Mute", BT_VCS_MUTE,
+		sizeof(uint8_t), vcs_mute),
+	{}
+};
+
+static void vcs_cp_write(struct gatt_db_attribute *attrib,
+				unsigned int id, uint16_t offset,
+				const uint8_t *value, size_t len,
+				uint8_t opcode, struct bt_att *att,
+				void *user_data)
+{
+	struct bt_vcs *vcs = user_data;
+	struct bt_vcp *vcp = vcp_get_session(att, vcs->vdb->db);
+	struct iovec iov = {
+		.iov_base = (void *) value,
+		.iov_len = len,
+	};
+	uint8_t	*vcp_op;
+	struct vcs_op_handler *handler;
+	uint8_t ret = BT_ATT_ERROR_REQUEST_NOT_SUPPORTED;
+
+	DBG("");
+	if (offset) {
+		DBG("invalid offset %d", offset);
+		ret = BT_ATT_ERROR_INVALID_OFFSET;
+		goto respond;
+	}
+
+	if (len < sizeof(*vcp_op)) {
+		DBG("invalid len %ld < %ld sizeof(*param)", len,
+							sizeof(*vcp_op));
+		ret = BT_ATT_ERROR_INVALID_ATTRIBUTE_VALUE_LEN;
+		goto respond;
+	}
+
+	vcp_op = iov_pull_mem(&iov, sizeof(*vcp_op));
+
+	DBG("vcp_op: %x", *vcp_op);
+
+	for (handler = vcp_handlers; handler && handler->str; handler++) {
+		if (handler->op != *vcp_op)
+			continue;
+
+		if (iov.iov_len < handler->size) {
+			DBG("invalid len %ld < %ld handler->size", len,
+			    handler->size);
+			ret = BT_ATT_ERROR_OPCODE_NOT_SUPPORTED;
+			goto respond;
+		}
+
+		break;
+	}
+
+	if (handler && handler->str) {
+		DBG("%s", handler->str);
+
+		ret = handler->func(vcs, vcp, &iov);
+	} else {
+		DBG("Unknown opcode 0x%02x", *vcp_op);
+		ret = BT_ATT_ERROR_OPCODE_NOT_SUPPORTED;
+	}
+
+respond:
+	gatt_db_attribute_write_result(attrib, id, ret);
+}
+
+static void vcs_state_read(struct gatt_db_attribute *attrib,
+				unsigned int id, uint16_t offset,
+				uint8_t opcode, struct bt_att *att,
+				void *user_data)
+{
+	struct bt_vcs *vcs = user_data;
+	struct iovec iov;
+
+	DBG("");
+
+	iov.iov_base = vcs->vstate;
+	iov.iov_len = sizeof(*vcs->vstate);
+
+	gatt_db_attribute_read_result(attrib, id, 0, iov.iov_base,
+							iov.iov_len);
+}
+
+static void vcs_flag_read(struct gatt_db_attribute *attrib,
+				unsigned int id, uint16_t offset,
+				uint8_t opcode, struct bt_att *att,
+				void *user_data)
+{
+	struct bt_vcs *vcs = user_data;
+	struct iovec iov;
+
+	DBG("vf: %x", vcs->vol_flag);
+
+	iov.iov_base = &vcs->vol_flag;
+	iov.iov_len = sizeof(vcs->vol_flag);
+
+	gatt_db_attribute_read_result(attrib, id, 0, iov.iov_base,
+							iov.iov_len);
+}
+
+static struct bt_vcs *vcs_new(struct gatt_db *db)
+{
+	struct bt_vcs *vcs;
+	struct vol_state *vstate;
+	bt_uuid_t uuid;
+
+	if (!db)
+		return NULL;
+
+	vcs = new0(struct bt_vcs, 1);
+
+	vstate = new0(struct vol_state, 1);
+
+	vcs->vstate = vstate;
+	vcs->vol_flag = USERSET_VOLUME_SETTING;
+
+	/* Populate DB with VCS attributes */
+	bt_uuid16_create(&uuid, VCS_UUID);
+	vcs->service = gatt_db_add_service(db, &uuid, true, 9);
+
+	bt_uuid16_create(&uuid, VOL_STATE_CHRC_UUID);
+	vcs->vs = gatt_db_service_add_characteristic(vcs->service,
+					&uuid,
+					BT_ATT_PERM_READ,
+					BT_GATT_CHRC_PROP_READ |
+					BT_GATT_CHRC_PROP_NOTIFY,
+					vcs_state_read, NULL,
+					vcs);
+
+	vcs->vs_ccc = gatt_db_service_add_ccc(vcs->service,
+					BT_ATT_PERM_READ | BT_ATT_PERM_WRITE);
+
+	bt_uuid16_create(&uuid, VOL_CP_CHRC_UUID);
+	vcs->vol_cp = gatt_db_service_add_characteristic(vcs->service,
+					&uuid,
+					BT_ATT_PERM_WRITE,
+					BT_GATT_CHRC_PROP_WRITE,
+					NULL, vcs_cp_write,
+					vcs);
+
+	bt_uuid16_create(&uuid, VOL_FLAG_CHRC_UUID);
+	vcs->vf = gatt_db_service_add_characteristic(vcs->service,
+					&uuid,
+					BT_ATT_PERM_READ,
+					BT_GATT_CHRC_PROP_READ |
+					BT_GATT_CHRC_PROP_NOTIFY,
+					vcs_flag_read, NULL,
+					vcs);
+
+	vcs->vf_ccc = gatt_db_service_add_ccc(vcs->service,
+					BT_ATT_PERM_READ | BT_ATT_PERM_WRITE);
+
+
+	gatt_db_service_set_active(vcs->service, true);
+
+	return vcs;
+}
+
+static struct bt_vcp_db *vcp_db_new(struct gatt_db *db)
+{
+	struct bt_vcp_db *vdb;
+
+	if (!db)
+		return NULL;
+
+	vdb = new0(struct bt_vcp_db, 1);
+	vdb->db = gatt_db_ref(db);
+
+	if (!vcp_db)
+		vcp_db = queue_new();
+
+	vdb->vcs = vcs_new(db);
+	vdb->vcs->vdb = vdb;
+
+	queue_push_tail(vcp_db, vdb);
+
+	return vdb;
+}
+
+static struct bt_vcp_db *vcp_get_db(struct gatt_db *db)
+{
+	struct bt_vcp_db *vdb;
+
+	vdb = queue_find(vcp_db, vcp_db_match, db);
+	if (vdb)
+		return vdb;
+
+	return vcp_db_new(db);
+}
+
+void bt_vcp_add_db(struct gatt_db *db)
+{
+	vcp_db_new(db);
+}
+
+unsigned int bt_vcp_register(bt_vcp_func_t attached, bt_vcp_func_t detached,
+							void *user_data)
+{
+	struct bt_vcp_cb *cb;
+	static unsigned int id;
+
+	if (!attached && !detached)
+		return 0;
+
+	if (!vcp_cbs)
+		vcp_cbs = queue_new();
+
+	cb = new0(struct bt_vcp_cb, 1);
+	cb->id = ++id ? id : ++id;
+	cb->attached = attached;
+	cb->detached = detached;
+	cb->user_data = user_data;
+
+	queue_push_tail(vcp_cbs, cb);
+
+	return cb->id;
+}
+
+static bool match_id(const void *data, const void *match_data)
+{
+	const struct bt_vcp_cb *cb = data;
+	unsigned int id = PTR_TO_UINT(match_data);
+
+	return (cb->id == id);
+}
+
+bool bt_vcp_unregister(unsigned int id)
+{
+	struct bt_vcp_cb *cb;
+
+	cb = queue_remove_if(vcp_cbs, match_id, UINT_TO_PTR(id));
+	if (!cb)
+		return false;
+
+	free(cb);
+
+	return true;
+}
+
+struct bt_vcp *bt_vcp_new(struct gatt_db *ldb, struct gatt_db *rdb)
+{
+	struct bt_vcp *vcp;
+	struct bt_vcp_db *vdb;
+
+	if (!ldb)
+		return NULL;
+
+	vdb = vcp_get_db(ldb);
+	if (!vdb)
+		return NULL;
+
+	vcp = new0(struct bt_vcp, 1);
+	vcp->ldb = vdb;
+	vcp->pending = queue_new();
+
+	if (!rdb)
+		goto done;
+
+	vdb = new0(struct bt_vcp_db, 1);
+	vdb->db = gatt_db_ref(rdb);
+
+	vcp->rdb = vdb;
+
+done:
+	bt_vcp_ref(vcp);
+
+	return vcp;
+}
+
+static void vcp_vstate_register(uint16_t att_ecode, void *user_data)
+{
+	DBG("");
+	if (att_ecode)
+		DBG("VCS register failed: 0x%04x", att_ecode);
+}
+
+static void vcp_vflag_register(uint16_t att_ecode, void *user_data)
+{
+	DBG("");
+	if (att_ecode)
+		DBG("VCS register failed: 0x%04x", att_ecode);
+}
+
+static void vcp_vstate_notify(uint16_t value_handle, const uint8_t *value,
+				uint16_t length, void *user_data)
+{
+	struct vol_state vstate;
+
+	memcpy(&vstate, value, sizeof(struct vol_state));
+
+	DBG("Vol Settings 0x%x", vstate.vol_set);
+	DBG("Mute Status 0x%x", vstate.mute);
+	DBG("Vol Counter 0x%x", vstate.counter);
+}
+
+static void vcp_vflag_notify(uint16_t value_handle, const uint8_t *value,
+				uint16_t length, void *user_data)
+{
+	uint8_t vflag;
+
+	memcpy(&vflag, value, sizeof(vflag));
+
+	DBG("Vol Flag 0x%x", vflag);
+}
+
+static void read_vol_flag(struct bt_vcp *vcp, bool success, uint8_t att_ecode,
+				const uint8_t *value, uint16_t length,
+				void *user_data)
+{
+	uint8_t *vol_flag;
+	struct iovec iov = {
+		.iov_base = (void *) value,
+		.iov_len = length,
+	};
+
+	if (!success) {
+		DBG("Unable to read VCP Vol State: error 0x%02x", att_ecode);
+		return;
+	}
+
+	vol_flag = iov_pull_mem(&iov, sizeof(*vol_flag));
+	if (!vol_flag) {
+		DBG("Unable to get Vol State");
+		return;
+	}
+
+	DBG("Vol Flag:%x", *vol_flag);
+}
+
+static void read_vol_state(struct bt_vcp *vcp, bool success, uint8_t att_ecode,
+				const uint8_t *value, uint16_t length,
+				void *user_data)
+{
+	struct vol_state *vs;
+	struct iovec iov = {
+		.iov_base = (void *) value,
+		.iov_len = length,
+	};
+
+	if (!success) {
+		DBG("Unable to read VCP Vol State: error 0x%02x", att_ecode);
+		return;
+	}
+
+	vs = iov_pull_mem(&iov, sizeof(*vs));
+	if (!vs) {
+		DBG("Unable to get Vol State");
+		return;
+	}
+
+	DBG("Vol Set:%x", vs->vol_set);
+	DBG("Vol Mute:%x", vs->mute);
+	DBG("Vol Counter:%x", vs->counter);
+
+}
+
+static void vcp_pending_destroy(void *data)
+{
+	struct bt_vcp_pending *pending = data;
+	struct bt_vcp *vcp = pending->vcp;
+
+	if (queue_remove_if(vcp->pending, NULL, pending))
+		free(pending);
+}
+
+static void vcp_pending_complete(bool success, uint8_t att_ecode,
+				const uint8_t *value, uint16_t length,
+				void *user_data)
+{
+	struct bt_vcp_pending *pending = user_data;
+
+	if (pending->func)
+		pending->func(pending->vcp, success, att_ecode, value, length,
+						pending->user_data);
+}
+
+static void vcp_read_value(struct bt_vcp *vcp, uint16_t value_handle,
+				vcp_func_t func, void *user_data)
+{
+	struct bt_vcp_pending *pending;
+
+	pending = new0(struct bt_vcp_pending, 1);
+	pending->vcp = vcp;
+	pending->func = func;
+	pending->user_data = user_data;
+
+	pending->id = bt_gatt_client_read_value(vcp->client, value_handle,
+						vcp_pending_complete, pending,
+						vcp_pending_destroy);
+	if (!pending->id) {
+		DBG("Unable to send Read request");
+		free(pending);
+		return;
+	}
+
+	queue_push_tail(vcp->pending, pending);
+}
+
+static void foreach_vcs_char(struct gatt_db_attribute *attr, void *user_data)
+{
+	struct bt_vcp *vcp = user_data;
+	uint16_t value_handle;
+	bt_uuid_t uuid, uuid_vstate, uuid_cp, uuid_vflag;
+	struct bt_vcs *vcs;
+
+	DBG("");
+	if (!gatt_db_attribute_get_char_data(attr, NULL, &value_handle,
+						NULL, NULL, &uuid))
+		return;
+
+	bt_uuid16_create(&uuid_vstate, VOL_STATE_CHRC_UUID);
+	bt_uuid16_create(&uuid_cp, VOL_CP_CHRC_UUID);
+	bt_uuid16_create(&uuid_vflag, VOL_FLAG_CHRC_UUID);
+
+	if (!bt_uuid_cmp(&uuid, &uuid_vstate)) {
+		DBG("VCS Volume state found: handle 0x%04x", value_handle);
+
+		vcs = vcp_get_vcs(vcp);
+		if (!vcs || vcs->vs)
+			return;
+
+		vcs->vs = attr;
+
+		vcp_read_value(vcp, value_handle, read_vol_state, vcp);
+		vcp->vstate_id = bt_gatt_client_register_notify(vcp->client,
+						value_handle,
+						vcp_vstate_register,
+						vcp_vstate_notify, vcp, NULL);
+
+		return;
+	}
+
+	if (!bt_uuid_cmp(&uuid, &uuid_cp)) {
+		DBG("VCS Volume CP found: handle 0x%04x", value_handle);
+
+		vcs = vcp_get_vcs(vcp);
+		if (!vcs || vcs->vol_cp)
+			return;
+
+		vcs->vol_cp = attr;
+
+		return;
+	}
+
+	if (!bt_uuid_cmp(&uuid, &uuid_vflag)) {
+		DBG("VCS Vol Flaf found: handle 0x%04x", value_handle);
+
+		vcs = vcp_get_vcs(vcp);
+		if (!vcs || vcs->vf)
+			return;
+
+		vcs->vf = attr;
+
+		vcp_read_value(vcp, value_handle, read_vol_flag, vcp);
+		vcp->vflag_id = bt_gatt_client_register_notify(vcp->client,
+						value_handle,
+						vcp_vflag_register,
+						vcp_vflag_notify, vcp, NULL);
+	}
+
+}
+
+static void foreach_vcs_service(struct gatt_db_attribute *attr,
+						void *user_data)
+{
+	struct bt_vcp *vcp = user_data;
+	struct bt_vcs *vcs = vcp_get_vcs(vcp);
+
+	DBG("");
+	vcs->service = attr;
+
+	gatt_db_service_set_claimed(attr, true);
+
+	gatt_db_service_foreach_char(attr, foreach_vcs_char, vcp);
+}
+
+bool bt_vcp_attach(struct bt_vcp *vcp, struct bt_gatt_client *client)
+{
+	bt_uuid_t uuid;
+
+	if (!sessions)
+		sessions = queue_new();
+
+	queue_push_tail(sessions, vcp);
+
+	if (!client)
+		return true;
+
+	if (vcp->client)
+		return false;
+
+	vcp->client = bt_gatt_client_clone(client);
+	if (!vcp->client)
+		return false;
+
+	bt_uuid16_create(&uuid, VCS_UUID);
+	gatt_db_foreach_service(vcp->ldb->db, &uuid, foreach_vcs_service, vcp);
+
+	return true;
+}
+
diff --git a/src/shared/vcp.h b/src/shared/vcp.h
new file mode 100644
index 000000000000..456ad8041162
--- /dev/null
+++ b/src/shared/vcp.h
@@ -0,0 +1,58 @@
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
+#include "src/shared/io.h"
+
+#ifndef __packed
+#define __packed __attribute__((packed))
+#endif
+
+#define BT_VCP_RENDERER			0x01
+#define	BT_VCP_CONTROLLER		0x02
+
+#define BT_VCP_RELATIVE_VOL_DOWN	0x00
+#define BT_VCP_RELATIVE_VOL_UP		0x01
+#define BT_VCP_UNMUTE_RELATIVE_VOL_DOWN	0x02
+#define BT_VCP_UNMUTE_RELATIVE_VOL_UP	0x03
+#define BT_VCP_SET_ABOSULTE_VOL		0x04
+#define BT_VCP_UNMUTE			0x05
+#define BT_VCP_MUTE			0x06
+
+#ifndef MAX
+#define MAX(a, b) ((a) > (b) ? (a) : (b))
+#endif
+
+#ifndef MIN
+#define MIN(a, b) ((a) < (b) ? (a) : (b))
+#endif
+
+struct bt_vcp;
+
+typedef void (*bt_vcp_func_t)(struct bt_vcp *vcp, void *user_data);
+
+struct bt_vcp *bt_vcp_ref(struct bt_vcp *vcp);
+void bt_vcp_unref(struct bt_vcp *vcp);
+
+void bt_vcp_add_db(struct gatt_db *db);
+
+bool bt_vcp_attach(struct bt_vcp *vcp, struct bt_gatt_client *client);
+void bt_vcp_detach(struct bt_vcp *vcp);
+
+struct bt_att *bt_vcp_get_att(struct bt_vcp *vcp);
+
+bool bt_vcp_set_user_data(struct bt_vcp *vcp, void *user_data);
+
+/* Session related function */
+unsigned int bt_vcp_register(bt_vcp_func_t added, bt_vcp_func_t removed,
+							void *user_data);
+bool bt_vcp_unregister(unsigned int id);
+struct bt_vcp *bt_vcp_new(struct gatt_db *ldb, struct gatt_db *rdb);
-- 
2.25.1

