Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 370F75F69AC
	for <lists+linux-bluetooth@lfdr.de>; Thu,  6 Oct 2022 16:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbiJFOfm (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 6 Oct 2022 10:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbiJFOfj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 6 Oct 2022 10:35:39 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A70D8320A
        for <linux-bluetooth@vger.kernel.org>; Thu,  6 Oct 2022 07:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665066936; x=1696602936;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=59MeVCuNwVwxBh9vrd4M6LR82MZKmCTIH3ypYURMu7I=;
  b=hkvPXdwASoIcaqI6QHVNAnLtVJnq2praqDBwH6ec8MWDlnOoxpGhmIUN
   K0Wrff/2WQ9QjSexKHMzL34Bai/HU/Bcx1uwg7NuTo61MXQhonQL4oGVg
   WbYKP9maCD3fCvNXjH5hwV0iJyOV7ZvdcRBPBDnqNM7aHurnq7445FQ4n
   zVa2RLjM6h2J5Kxse41JQNQRS3VcmxNQXjTdkEMKGtiZALWiKWwUkbm8W
   RJ5p+/fNTVvD4OwH/IWxUQCGO3wcDmdwwM09kWSuLmzIFlDHCq49vkkjX
   O7sr2wx8R+oQJQIfC4duvDt4bO3x9JDS/rmWA08+duRKf/YMlGtLGUasP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="301059123"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; 
   d="scan'208";a="301059123"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2022 07:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="693373563"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; 
   d="scan'208";a="693373563"
Received: from bsbdt.iind.intel.com ([10.224.186.26])
  by fmsmga004.fm.intel.com with ESMTP; 06 Oct 2022 07:35:31 -0700
From:   Abhay Maheta <abhay.maheshbhai.maheta@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Abhay Maheta <abhay.maheshbhai.maheta@intel.com>
Subject: [PATCH BlueZ 3/4] profiles: Add initial code for mcp plugin
Date:   Thu,  6 Oct 2022 20:03:42 +0530
Message-Id: <20221006143343.199055-4-abhay.maheshbhai.maheta@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221006143343.199055-1-abhay.maheshbhai.maheta@intel.com>
References: <20221006143343.199055-1-abhay.maheshbhai.maheta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This adds initial code for mcp plugin which handles Media Control Profile
and Generic Media Control Service for Client Role.
---
 Makefile.plugins     |   5 +
 configure.ac         |   4 +
 profiles/audio/mcp.c | 429 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 438 insertions(+)
 create mode 100644 profiles/audio/mcp.c

diff --git a/Makefile.plugins b/Makefile.plugins
index a3654980f..20cac384e 100644
--- a/Makefile.plugins
+++ b/Makefile.plugins
@@ -122,6 +122,11 @@ builtin_modules += bap
 builtin_sources += profiles/audio/bap.c
 endif
 
+if MCP
+builtin_modules += mcp
+builtin_sources += profiles/audio/mcp.c
+endif
+
 if VCP
 builtin_modules += vcp
 builtin_sources += profiles/audio/vcp.c
diff --git a/configure.ac b/configure.ac
index 79645e691..363a222a7 100644
--- a/configure.ac
+++ b/configure.ac
@@ -199,6 +199,10 @@ AC_ARG_ENABLE(bap, AS_HELP_STRING([--disable-bap],
 		[disable BAP profile]), [enable_bap=${enableval}])
 AM_CONDITIONAL(BAP, test "${enable_bap}" != "no")
 
+AC_ARG_ENABLE(mcp, AS_HELP_STRING([--disable-mcp],
+        [disable MCP profile]), [enable_mcp=${enableval}])
+AM_CONDITIONAL(MCP, test "${enable_mcp}" != "no")
+
 AC_ARG_ENABLE(vcp, AS_HELP_STRING([--disable-vcp],
 		[disable VCP profile]), [enable_vcp=${enableval}])
 AM_CONDITIONAL(VCP, test "${enable_vcp}" != "no")
diff --git a/profiles/audio/mcp.c b/profiles/audio/mcp.c
new file mode 100644
index 000000000..0a8d83198
--- /dev/null
+++ b/profiles/audio/mcp.c
@@ -0,0 +1,429 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *
+ *  BlueZ - Bluetooth protocol stack for Linux
+ *
+ *  Copyright (C) 2020  Intel Corporation. All rights reserved.
+ *
+ *
+ */
+#ifdef HAVE_CONFIG_H
+#include <config.h>
+#endif
+
+#define _GNU_SOURCE
+
+#include <ctype.h>
+#include <stdbool.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <errno.h>
+
+#include <glib.h>
+
+#include "gdbus/gdbus.h"
+
+#include "lib/bluetooth.h"
+#include "lib/hci.h"
+#include "lib/sdp.h"
+#include "lib/uuid.h"
+
+#include "src/dbus-common.h"
+#include "src/shared/util.h"
+#include "src/shared/att.h"
+#include "src/shared/queue.h"
+#include "src/shared/gatt-db.h"
+#include "src/shared/gatt-client.h"
+#include "src/shared/gatt-server.h"
+#include "src/shared/mcp.h"
+#include "src/shared/mcs.h"
+
+#include "btio/btio.h"
+#include "src/plugin.h"
+#include "src/adapter.h"
+#include "src/gatt-database.h"
+#include "src/device.h"
+#include "src/profile.h"
+#include "src/service.h"
+#include "src/log.h"
+#include "src/error.h"
+#include "player.h"
+
+#define GMCS_UUID_STR "00001849-0000-1000-8000-00805f9b34fb"
+
+struct mcp_data {
+	struct btd_device *device;
+	struct btd_service *service;
+	struct bt_mcp *mcp;
+	unsigned int state_id;
+
+	struct media_player *mp;
+};
+
+static void mcp_debug(const char *str, void *user_data)
+{
+	DBG_IDX(0xffff, "%s", str);
+}
+
+static char *name2utf8(const uint8_t *name, uint16_t len)
+{
+	char utf8_name[HCI_MAX_NAME_LENGTH + 2];
+	int i;
+
+	if (g_utf8_validate((const char *) name, len, NULL))
+		return g_strndup((char *) name, len);
+
+	len = MIN(len, sizeof(utf8_name) - 1);
+
+	memset(utf8_name, 0, sizeof(utf8_name));
+	strncpy(utf8_name, (char *) name, len);
+
+	/* Assume ASCII, and replace all non-ASCII with spaces */
+	for (i = 0; utf8_name[i] != '\0'; i++) {
+		if (!isascii(utf8_name[i]))
+			utf8_name[i] = ' ';
+	}
+
+	/* Remove leading and trailing whitespace characters */
+	g_strstrip(utf8_name);
+
+	return g_strdup(utf8_name);
+}
+
+static const char *mcp_status_val_to_string(uint8_t status)
+{
+	switch (status) {
+	case BT_MCS_STATUS_PLAYING:
+		return "playing";
+	case BT_MCS_STATUS_PAUSED:
+		return "paused";
+	case BT_MCS_STATUS_INACTIVE:
+		return "stopped";
+	case BT_MCS_STATUS_SEEKING:
+		/* TODO: find a way for fwd/rvs seeking, probably by storing
+		 * control point operation sent before
+		 */
+		return "forward-seek";
+	default:
+		return "error";
+	}
+}
+
+static struct mcp_data *mcp_data_new(struct btd_device *device)
+{
+	struct mcp_data *data;
+
+	data = new0(struct mcp_data, 1);
+	data->device = device;
+
+	return data;
+}
+
+static void cb_player_name(struct bt_mcp *mcp,  const uint8_t *value,
+					uint16_t length)
+{
+	char *name;
+	struct media_player *mp = bt_mcp_get_user_data(mcp);
+
+	name = name2utf8(value, length);
+	DBG("Media Player Name %s", (const char *)name);
+
+	media_player_set_name(mp, name);
+
+	g_free(name);
+}
+
+void cb_track_changed(struct bt_mcp *mcp)
+{
+	DBG("Track Changed");
+	/* Since track changed has happened
+	 * track title notification is expected
+	 */
+}
+
+void cb_track_title(struct bt_mcp *mcp, const uint8_t *value,
+					uint16_t length)
+{
+	char *name;
+	uint16_t len;
+	struct media_player *mp = bt_mcp_get_user_data(mcp);
+
+	name = name2utf8(value, length);
+	len = strlen(name);
+
+	DBG("Track Title %s", (const char *)name);
+
+	media_player_set_metadata(mp, NULL, "Title", name, len);
+	media_player_metadata_changed(mp);
+
+	g_free(name);
+}
+
+void cb_track_duration(struct bt_mcp *mcp, int32_t duration)
+{
+	struct media_player *mp = bt_mcp_get_user_data(mcp);
+	unsigned char buf[10];
+
+	/* MCP defines duration is int32 but api takes it as uint32 */
+	sprintf(buf, "%d", duration);
+	media_player_set_metadata(mp, NULL, "Duration", buf, sizeof(buf));
+	media_player_metadata_changed(mp);
+}
+
+void cb_track_position(struct bt_mcp *mcp, int32_t duration)
+{
+	struct media_player *mp = bt_mcp_get_user_data(mcp);
+
+	/* MCP defines duration is int32 but api takes it as uint32 */
+	media_player_set_position(mp, duration);
+}
+
+void cb_media_state(struct bt_mcp *mcp, uint8_t status)
+{
+	struct media_player *mp = bt_mcp_get_user_data(mcp);
+
+	media_player_set_status(mp, mcp_status_val_to_string(status));
+}
+
+static const struct bt_mcp_event_callback cbs = {
+	.player_name			= &cb_player_name,
+	.track_changed			= &cb_track_changed,
+	.track_title			= &cb_track_title,
+	.track_duration			= &cb_track_duration,
+	.track_position			= &cb_track_position,
+	.playback_speed			= NULL,
+	.seeking_speed			= NULL,
+	.play_order				= NULL,
+	.play_order_supported	= NULL,
+	.media_state			= &cb_media_state,
+	.content_control_id		= NULL,
+};
+
+static int ct_play(struct media_player *mp, void *user_data)
+{
+	struct bt_mcp *mcp = user_data;
+
+	return bt_mcp_play(mcp);
+}
+
+static int ct_pause(struct media_player *mp, void *user_data)
+{
+	struct bt_mcp *mcp = user_data;
+
+	return bt_mcp_pause(mcp);
+}
+
+static int ct_stop(struct media_player *mp, void *user_data)
+{
+	struct bt_mcp *mcp = user_data;
+
+	return bt_mcp_stop(mcp);
+}
+
+static const struct media_player_callback ct_cbs = {
+	.set_setting	= NULL,
+	.play		= &ct_play,
+	.pause		= &ct_pause,
+	.stop		= &ct_stop,
+	.next		= NULL,
+	.previous	= NULL,
+	.fast_forward	= NULL,
+	.rewind		= NULL,
+	.press		= NULL,
+	.hold		= NULL,
+	.release	= NULL,
+	.list_items	= NULL,
+	.change_folder	= NULL,
+	.search		= NULL,
+	.play_item	= NULL,
+	.add_to_nowplaying = NULL,
+	.total_items = NULL,
+};
+
+static int mcp_probe(struct btd_service *service)
+{
+	struct btd_device *device = btd_service_get_device(service);
+	struct btd_adapter *adapter = device_get_adapter(device);
+	struct btd_gatt_database *database = btd_adapter_get_database(adapter);
+	struct mcp_data *data = btd_service_get_user_data(service);
+	char addr[18];
+
+	ba2str(device_get_address(device), addr);
+	DBG("%s", addr);
+
+	/* Ignore, if we were probed for this device already */
+	if (data) {
+		error("Profile probed twice for the same device!");
+		return -EINVAL;
+	}
+
+	data = mcp_data_new(device);
+	data->service = service;
+
+	data->mcp = bt_mcp_new(btd_gatt_database_get_db(database),
+					btd_device_get_gatt_db(device));
+
+    bt_mcp_set_debug(data->mcp, mcp_debug, NULL, NULL);
+	btd_service_set_user_data(service, data);
+
+	return 0;
+}
+
+static void mcp_data_free(struct mcp_data *data)
+{
+	DBG("");
+
+	if (data->service) {
+		btd_service_set_user_data(data->service, NULL);
+		bt_mcp_set_user_data(data->mcp, NULL);
+	}
+
+    if (data->mp) {
+        media_player_destroy(data->mp);
+        data->mp = NULL;
+    }
+
+	bt_mcp_unref(data->mcp);
+	free(data);
+}
+
+static void mcp_data_remove(struct mcp_data *data)
+{
+	DBG("data %p", data);
+
+	mcp_data_free(data);
+}
+
+static void mcp_remove(struct btd_service *service)
+{
+	struct btd_device *device = btd_service_get_device(service);
+	struct mcp_data *data;
+	char addr[18];
+
+	ba2str(device_get_address(device), addr);
+	DBG("%s", addr);
+
+	data = btd_service_get_user_data(service);
+	if (!data) {
+		error("MCP service not handled by profile");
+		return;
+	}
+
+	mcp_data_remove(data);
+}
+
+static int mcp_accept(struct btd_service *service)
+{
+	struct btd_device *device = btd_service_get_device(service);
+	struct bt_gatt_client *client = btd_device_get_gatt_client(device);
+	struct mcp_data *data = btd_service_get_user_data(service);
+	char addr[18];
+
+	ba2str(device_get_address(device), addr);
+	DBG("%s", addr);
+
+	bt_mcp_attach(data->mcp, client);
+
+	data->mp = media_player_controller_create(device_get_path(device), 0);
+	if (data->mp == NULL) {
+		DBG("Unable to create Media Player");
+		return -EINVAL;
+	}
+
+	media_player_set_callbacks(data->mp, &ct_cbs, data->mcp);
+
+	bt_mcp_set_user_data(data->mcp, data->mp);
+	bt_mcp_set_event_callbacks(data->mcp, &cbs, data->mp);
+	btd_service_connecting_complete(service, 0);
+
+	return 0;
+}
+
+static int mcp_connect(struct btd_service *service)
+{
+	struct btd_device *device = btd_service_get_device(service);
+	char addr[18];
+
+	ba2str(device_get_address(device), addr);
+	DBG("%s", addr);
+
+	return 0;
+}
+
+static int mcp_disconnect(struct btd_service *service)
+{
+	struct btd_device *device = btd_service_get_device(service);
+	struct mcp_data *data = btd_service_get_user_data(service);
+	char addr[18];
+
+	ba2str(device_get_address(device), addr);
+	DBG("%s", addr);
+
+    if (data->mp) {
+        media_player_destroy(data->mp);
+        data->mp = NULL;
+    }
+
+	bt_mcp_detach(data->mcp);
+
+	btd_service_disconnecting_complete(service, 0);
+
+	return 0;
+}
+
+static int media_control_server_probe(struct btd_profile *p,
+						struct btd_adapter *adapter)
+{
+	struct btd_gatt_database *database = btd_adapter_get_database(adapter);
+	bt_mcp_register(btd_gatt_database_get_db(database));
+	return 0;
+}
+
+static void media_control_server_remove(struct btd_profile *p,
+						struct btd_adapter *adapter)
+{
+
+}
+
+static struct btd_profile mcp_profile = {
+	.name			= "mcp",
+	.priority		= BTD_PROFILE_PRIORITY_MEDIUM,
+	.remote_uuid	= GMCS_UUID_STR,
+	.device_probe	= mcp_probe,
+	.device_remove	= mcp_remove,
+	.accept			= mcp_accept,
+	.connect		= mcp_connect,
+	.disconnect		= mcp_disconnect,
+
+	.adapter_probe	= media_control_server_probe,
+	.adapter_remove = media_control_server_remove,
+};
+
+static int mcp_init(void)
+{
+	DBG("");
+
+	if (!(g_dbus_get_flags() & G_DBUS_FLAG_ENABLE_EXPERIMENTAL)) {
+        warn("D-Bus experimental not enabled");
+        return -ENOTSUP;
+	}
+
+    btd_profile_register(&mcp_profile);
+	return 0;
+}
+
+static void mcp_exit(void)
+{
+	DBG("");
+
+	if (g_dbus_get_flags() & G_DBUS_FLAG_ENABLE_EXPERIMENTAL) {
+		btd_profile_unregister(&mcp_profile);
+	}
+}
+
+BLUETOOTH_PLUGIN_DEFINE(mcp, VERSION, BLUETOOTH_PLUGIN_PRIORITY_DEFAULT,
+							mcp_init, mcp_exit)
-- 
2.25.1

