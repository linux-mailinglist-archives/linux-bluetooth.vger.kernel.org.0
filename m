Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1972AA2ED
	for <lists+linux-bluetooth@lfdr.de>; Sat,  7 Nov 2020 08:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgKGHD2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 7 Nov 2020 02:03:28 -0500
Received: from mga17.intel.com ([192.55.52.151]:45622 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725985AbgKGHD2 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 7 Nov 2020 02:03:28 -0500
IronPort-SDR: wyasE71KPo0eUcG4AqHbzY0ugW5CLsYQDU5JP+XXUDgNG6t4u310LAcBTjpinmXS2Ztwp7dF1Q
 drDXn0tZvzwA==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="149485512"
X-IronPort-AV: E=Sophos;i="5.77,458,1596524400"; 
   d="scan'208";a="149485512"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 23:03:28 -0800
IronPort-SDR: c5se3co84ifBSvm+gv09c1avxfVwsZnS8Xy9hA98/4ar+xuSxSnAXzdTGsqwgtQ5Ik5mnVEpBp
 mGa+ZOp92kpA==
X-IronPort-AV: E=Sophos;i="5.77,458,1596524400"; 
   d="scan'208";a="359032011"
Received: from ralassax-mobl.amr.corp.intel.com (HELO ingas-nuc1.intel.com) ([10.209.101.141])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 23:03:27 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     luiz.von.dentz@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [RFC PATCH BlueZ 02/10] emulator/hciemu: Create ELL based version of hciemu
Date:   Fri,  6 Nov 2020 23:03:04 -0800
Message-Id: <20201107070312.8561-3-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201107070312.8561-1-inga.stotland@intel.com>
References: <20201107070312.8561-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This adds a separate implementtion of hciemu code, hciemu-ell.c,
that uses ELL library primitives.
---
 emulator/hciemu-ell.c | 564 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 564 insertions(+)
 create mode 100644 emulator/hciemu-ell.c

diff --git a/emulator/hciemu-ell.c b/emulator/hciemu-ell.c
new file mode 100644
index 000000000..40342e99b
--- /dev/null
+++ b/emulator/hciemu-ell.c
@@ -0,0 +1,564 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ *
+ *  BlueZ - Bluetooth protocol stack for Linux
+ *
+ *  Copyright (C) 2012-2014, 2020  Intel Corporation. All rights reserved.
+ *
+ *
+ */
+
+#ifdef HAVE_CONFIG_H
+#include <config.h>
+#endif
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stdbool.h>
+#include <errno.h>
+#include <sys/socket.h>
+
+#include <ell/ell.h>
+
+#include "lib/bluetooth.h"
+#include "lib/hci.h"
+
+#include "monitor/bt.h"
+#include "emulator/btdev.h"
+#include "emulator/bthost.h"
+#include "src/shared/util.h"
+#include "src/shared/queue.h"
+#include "emulator/hciemu.h"
+
+struct hciemu {
+	int ref_count;
+	enum btdev_type btdev_type;
+	struct bthost *host_stack;
+	struct btdev *master_dev;
+	struct btdev *client_dev;
+	struct l_io *host_io;
+	struct l_io *master_io;
+	struct l_io *client_io;
+	struct queue *post_command_hooks;
+	char bdaddr_str[18];
+
+	hciemu_debug_func_t debug_callback;
+	hciemu_destroy_func_t debug_destroy;
+	void *debug_data;
+};
+
+struct hciemu_command_hook {
+	hciemu_command_func_t function;
+	void *user_data;
+};
+
+static void destroy_command_hook(void *data)
+{
+	struct hciemu_command_hook *hook = data;
+
+	free(hook);
+}
+
+struct run_data {
+	uint16_t opcode;
+	const void *data;
+	uint8_t len;
+};
+
+static void run_command_hook(void *data, void *user_data)
+{
+	struct hciemu_command_hook *hook = data;
+	struct run_data *run_data = user_data;
+
+	if (hook->function)
+		hook->function(run_data->opcode, run_data->data,
+					run_data->len, hook->user_data);
+}
+
+static void master_command_callback(uint16_t opcode,
+				const void *data, uint8_t len,
+				btdev_callback callback, void *user_data)
+{
+	struct hciemu *hciemu = user_data;
+	struct run_data run_data = { .opcode = opcode,
+						.data = data, .len = len };
+
+	btdev_command_default(callback);
+
+	queue_foreach(hciemu->post_command_hooks, run_command_hook, &run_data);
+}
+
+static void client_command_callback(uint16_t opcode,
+				const void *data, uint8_t len,
+				btdev_callback callback, void *user_data)
+{
+	btdev_command_default(callback);
+}
+
+static void writev_callback(const struct iovec *iov, int iovlen,
+								void *user_data)
+{
+	struct l_io *io = user_data;
+	ssize_t written;
+	int fd;
+
+	fd = l_io_get_fd(io);
+
+	written = writev(fd, iov, iovlen);
+	if (written < 0)
+		return;
+}
+
+static bool receive_bthost(struct l_io *io, void *user_data)
+{
+	struct bthost *bthost = user_data;
+	unsigned char buf[4096];
+	ssize_t len;
+	int fd;
+
+	fd = l_io_get_fd(io);
+
+	len = read(fd, buf, sizeof(buf));
+	if (len < 0)
+		return false;
+
+	bthost_receive_h4(bthost, buf, len);
+
+	return true;
+}
+
+static struct l_io *create_io_bthost(int fd, struct bthost *bthost)
+{
+	struct l_io *io;
+
+	io = l_io_new(fd);
+
+	l_io_set_close_on_destroy(io, true);
+
+	bthost_set_send_handler(bthost, writev_callback, io);
+
+	l_io_set_read_handler(io, receive_bthost, bthost, NULL);
+
+	return io;
+}
+
+static bool receive_btdev(struct l_io *io, void *user_data)
+
+{
+	struct btdev *btdev = user_data;
+	unsigned char buf[4096];
+	ssize_t len;
+	int fd;
+
+	fd = l_io_get_fd(io);
+
+	len = read(fd, buf, sizeof(buf));
+	if (len < 0) {
+		if (errno == EAGAIN || errno == EINTR)
+			return true;
+
+		return false;
+	}
+
+	if (len < 1)
+		return false;
+
+	switch (buf[0]) {
+	case BT_H4_CMD_PKT:
+	case BT_H4_ACL_PKT:
+	case BT_H4_SCO_PKT:
+		btdev_receive_h4(btdev, buf, len);
+		break;
+	}
+
+	return true;
+}
+
+static struct l_io *create_io_btdev(int fd, struct btdev *btdev)
+{
+	struct l_io *io;
+
+	io = l_io_new(fd);
+
+	l_io_set_close_on_destroy(io, true);
+
+	btdev_set_send_handler(btdev, writev_callback, io);
+
+	l_io_set_read_handler(io, receive_btdev, btdev, NULL);
+
+	return io;
+}
+
+static bool create_vhci(struct hciemu *hciemu)
+{
+	struct btdev *btdev;
+	uint8_t create_req[2];
+	ssize_t written;
+	int fd;
+
+	btdev = btdev_create(hciemu->btdev_type, 0x00);
+	if (!btdev)
+		return false;
+
+	btdev_set_command_handler(btdev, master_command_callback, hciemu);
+
+	fd = open("/dev/vhci", O_RDWR | O_NONBLOCK | O_CLOEXEC);
+	if (fd < 0) {
+		perror("Opening /dev/vhci failed");
+		btdev_destroy(btdev);
+		return false;
+	}
+
+	create_req[0] = HCI_VENDOR_PKT;
+	create_req[1] = HCI_PRIMARY;
+
+	written = write(fd, create_req, sizeof(create_req));
+	if (written < 0) {
+		close(fd);
+		btdev_destroy(btdev);
+		return false;
+	}
+
+	hciemu->master_dev = btdev;
+
+	hciemu->master_io = create_io_btdev(fd, btdev);
+
+	return true;
+}
+
+struct bthost *hciemu_client_get_host(struct hciemu *hciemu)
+{
+	if (!hciemu)
+		return NULL;
+
+	return hciemu->host_stack;
+}
+
+static bool create_stack(struct hciemu *hciemu)
+{
+	struct btdev *btdev;
+	struct bthost *bthost;
+	int sv[2];
+
+	btdev = btdev_create(hciemu->btdev_type, 0x00);
+	if (!btdev)
+		return false;
+
+	bthost = bthost_create();
+	if (!bthost) {
+		btdev_destroy(btdev);
+		return false;
+	}
+
+	btdev_set_command_handler(btdev, client_command_callback, hciemu);
+
+	if (socketpair(AF_UNIX, SOCK_SEQPACKET | SOCK_NONBLOCK | SOCK_CLOEXEC,
+								0, sv) < 0) {
+		bthost_destroy(bthost);
+		btdev_destroy(btdev);
+		return false;
+	}
+
+	hciemu->client_dev = btdev;
+	hciemu->host_stack = bthost;
+
+	hciemu->client_io = create_io_btdev(sv[0], btdev);
+	hciemu->host_io = create_io_bthost(sv[1], bthost);
+
+	return true;
+}
+
+static void start_stack(void *user_data)
+{
+	struct hciemu *hciemu = user_data;
+
+	bthost_start(hciemu->host_stack);
+}
+
+struct hciemu *hciemu_new(enum hciemu_type type)
+{
+	struct hciemu *hciemu;
+
+	hciemu = new0(struct hciemu, 1);
+	if (!hciemu)
+		return NULL;
+
+	switch (type) {
+	case HCIEMU_TYPE_BREDRLE:
+		hciemu->btdev_type = BTDEV_TYPE_BREDRLE;
+		break;
+	case HCIEMU_TYPE_BREDR:
+		hciemu->btdev_type = BTDEV_TYPE_BREDR;
+		break;
+	case HCIEMU_TYPE_LE:
+		hciemu->btdev_type = BTDEV_TYPE_LE;
+		break;
+	case HCIEMU_TYPE_LEGACY:
+		hciemu->btdev_type = BTDEV_TYPE_BREDR20;
+		break;
+	case HCIEMU_TYPE_BREDRLE50:
+		hciemu->btdev_type = BTDEV_TYPE_BREDRLE50;
+		break;
+	case HCIEMU_TYPE_BREDRLE52:
+		hciemu->btdev_type = BTDEV_TYPE_BREDRLE52;
+		break;
+	default:
+		return NULL;
+	}
+
+	hciemu->post_command_hooks = queue_new();
+	if (!hciemu->post_command_hooks) {
+		free(hciemu);
+		return NULL;
+	}
+
+	if (!create_vhci(hciemu)) {
+		queue_destroy(hciemu->post_command_hooks, NULL);
+		free(hciemu);
+		return NULL;
+	}
+
+	if (!create_stack(hciemu)) {
+		l_io_destroy(hciemu->master_io);
+		btdev_destroy(hciemu->master_dev);
+		queue_destroy(hciemu->post_command_hooks, NULL);
+		free(hciemu);
+		return NULL;
+	}
+
+	l_idle_oneshot(start_stack, hciemu, NULL);
+
+	return hciemu_ref(hciemu);
+}
+
+struct hciemu *hciemu_ref(struct hciemu *hciemu)
+{
+	if (!hciemu)
+		return NULL;
+
+	__sync_fetch_and_add(&hciemu->ref_count, 1);
+
+	return hciemu;
+}
+
+void hciemu_unref(struct hciemu *hciemu)
+{
+	if (!hciemu)
+		return;
+
+	if (__sync_sub_and_fetch(&hciemu->ref_count, 1))
+		return;
+
+	queue_destroy(hciemu->post_command_hooks, destroy_command_hook);
+
+	l_io_destroy(hciemu->host_io);
+	l_io_destroy(hciemu->client_io);
+	l_io_destroy(hciemu->master_io);
+
+	bthost_destroy(hciemu->host_stack);
+	btdev_destroy(hciemu->client_dev);
+	btdev_destroy(hciemu->master_dev);
+
+	free(hciemu);
+}
+
+static void bthost_debug(const char *str, void *user_data)
+{
+	struct hciemu *hciemu = user_data;
+
+	util_debug(hciemu->debug_callback, hciemu->debug_data,
+					"bthost: %s", str);
+}
+
+static void btdev_master_debug(const char *str, void *user_data)
+{
+	struct hciemu *hciemu = user_data;
+
+	util_debug(hciemu->debug_callback, hciemu->debug_data,
+					"btdev: %s", str);
+}
+
+static void btdev_client_debug(const char *str, void *user_data)
+{
+	struct hciemu *hciemu = user_data;
+
+	util_debug(hciemu->debug_callback, hciemu->debug_data,
+					"btdev[bthost]: %s", str);
+}
+
+bool hciemu_set_debug(struct hciemu *hciemu, hciemu_debug_func_t callback,
+			void *user_data, hciemu_destroy_func_t destroy)
+{
+	if (!hciemu)
+		return false;
+
+	if (hciemu->debug_destroy)
+		hciemu->debug_destroy(hciemu->debug_data);
+
+	hciemu->debug_callback = callback;
+	hciemu->debug_destroy = destroy;
+	hciemu->debug_data = user_data;
+
+	btdev_set_debug(hciemu->master_dev, btdev_master_debug, hciemu, NULL);
+	btdev_set_debug(hciemu->client_dev, btdev_client_debug, hciemu, NULL);
+	bthost_set_debug(hciemu->host_stack, bthost_debug, hciemu, NULL);
+
+	return true;
+}
+
+const char *hciemu_get_address(struct hciemu *hciemu)
+{
+	const uint8_t *addr;
+
+	if (!hciemu || !hciemu->master_dev)
+		return NULL;
+
+	addr = btdev_get_bdaddr(hciemu->master_dev);
+	sprintf(hciemu->bdaddr_str, "%2.2X:%2.2X:%2.2X:%2.2X:%2.2X:%2.2X",
+			addr[5], addr[4], addr[3], addr[2], addr[1], addr[0]);
+	return hciemu->bdaddr_str;
+}
+
+uint8_t *hciemu_get_features(struct hciemu *hciemu)
+{
+	if (!hciemu || !hciemu->master_dev)
+		return NULL;
+
+	return btdev_get_features(hciemu->master_dev);
+}
+
+const uint8_t *hciemu_get_master_bdaddr(struct hciemu *hciemu)
+{
+	if (!hciemu || !hciemu->master_dev)
+		return NULL;
+
+	return btdev_get_bdaddr(hciemu->master_dev);
+}
+
+const uint8_t *hciemu_get_client_bdaddr(struct hciemu *hciemu)
+{
+	if (!hciemu || !hciemu->client_dev)
+		return NULL;
+
+	return btdev_get_bdaddr(hciemu->client_dev);
+}
+
+uint8_t hciemu_get_master_scan_enable(struct hciemu *hciemu)
+{
+	if (!hciemu || !hciemu->master_dev)
+		return 0;
+
+	return btdev_get_scan_enable(hciemu->master_dev);
+}
+
+uint8_t hciemu_get_master_le_scan_enable(struct hciemu *hciemu)
+{
+	if (!hciemu || !hciemu->master_dev)
+		return 0;
+
+	return btdev_get_le_scan_enable(hciemu->master_dev);
+}
+
+void hciemu_set_master_le_states(struct hciemu *hciemu,
+						const uint8_t *le_states)
+{
+	if (!hciemu || !hciemu->master_dev)
+		return;
+
+	btdev_set_le_states(hciemu->master_dev, le_states);
+}
+
+bool hciemu_add_master_post_command_hook(struct hciemu *hciemu,
+			hciemu_command_func_t function, void *user_data)
+{
+	struct hciemu_command_hook *hook;
+
+	if (!hciemu)
+		return false;
+
+	hook = new0(struct hciemu_command_hook, 1);
+	if (!hook)
+		return false;
+
+	hook->function = function;
+	hook->user_data = user_data;
+
+	if (!queue_push_tail(hciemu->post_command_hooks, hook)) {
+		free(hook);
+		return false;
+	}
+
+	return true;
+}
+
+bool hciemu_clear_master_post_command_hooks(struct hciemu *hciemu)
+{
+	if (!hciemu)
+		return false;
+
+	queue_remove_all(hciemu->post_command_hooks,
+					NULL, NULL, destroy_command_hook);
+	return true;
+}
+
+int hciemu_add_hook(struct hciemu *hciemu, enum hciemu_hook_type type,
+				uint16_t opcode, hciemu_hook_func_t function,
+				void *user_data)
+{
+	enum btdev_hook_type hook_type;
+
+	if (!hciemu)
+		return -1;
+
+	switch (type) {
+	case HCIEMU_HOOK_PRE_CMD:
+		hook_type = BTDEV_HOOK_PRE_CMD;
+		break;
+	case HCIEMU_HOOK_POST_CMD:
+		hook_type = BTDEV_HOOK_POST_CMD;
+		break;
+	case HCIEMU_HOOK_PRE_EVT:
+		hook_type = BTDEV_HOOK_PRE_EVT;
+		break;
+	case HCIEMU_HOOK_POST_EVT:
+		hook_type = BTDEV_HOOK_POST_EVT;
+		break;
+	default:
+		return -1;
+	}
+
+	return btdev_add_hook(hciemu->master_dev, hook_type, opcode, function,
+								user_data);
+}
+
+bool hciemu_del_hook(struct hciemu *hciemu, enum hciemu_hook_type type,
+								uint16_t opcode)
+{
+	enum btdev_hook_type hook_type;
+
+	if (!hciemu)
+		return false;
+
+	switch (type) {
+	case HCIEMU_HOOK_PRE_CMD:
+		hook_type = BTDEV_HOOK_PRE_CMD;
+		break;
+	case HCIEMU_HOOK_POST_CMD:
+		hook_type = BTDEV_HOOK_POST_CMD;
+		break;
+	case HCIEMU_HOOK_PRE_EVT:
+		hook_type = BTDEV_HOOK_PRE_EVT;
+		break;
+	case HCIEMU_HOOK_POST_EVT:
+		hook_type = BTDEV_HOOK_POST_EVT;
+		break;
+	default:
+		return false;
+	}
+
+	return btdev_del_hook(hciemu->master_dev, hook_type, opcode);
+}
-- 
2.26.2

