Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AED4346C7D7
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Dec 2021 23:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242402AbhLGW7p (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Dec 2021 17:59:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242406AbhLGW7p (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Dec 2021 17:59:45 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11312C061574
        for <linux-bluetooth@vger.kernel.org>; Tue,  7 Dec 2021 14:56:14 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id y12so1771299eda.12
        for <linux-bluetooth@vger.kernel.org>; Tue, 07 Dec 2021 14:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kDtncV0X18jLkh0djRbT0CuZQuqr8VeMjw0GoDi905E=;
        b=SmZ7NVB3n9e3GvG/yRZlLFIbryI37phuIs2NUxPrMv+dZ73gSjN9FscE0a2cZQz/XT
         RM81MIFFbf8XZ1XVVPcXgicRxchKSY65FV8qyGQkEyYyE2OrVmOA1KPy8/nvClTIlJUS
         U+rtx9U0AH+hwuawwU1GRRQbITnFmFrdqiGgtg75GYUrYAEszExYY9AhCxf0ubg7PRjk
         eocq94shSUAwNdMQboVgrado6BoGYh/sUSHuH9tSyiCQ5lCIznqKm/d0x+PeLg7cs+SJ
         6dMVMCSV33k4fNfT4oNMhuHm0iGtgMZ7IxiPod9ccnFFlYA6/nV4/Zp7RSqh85GGSlU9
         9dSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kDtncV0X18jLkh0djRbT0CuZQuqr8VeMjw0GoDi905E=;
        b=p7/okRmno5k6H3F0utyBAVKfXu0dD6PhfyNJSS8iU0/EJ9NxFhFvuMallWFOx2uaCj
         bNqdmE2AOxgvKOLYb0KpeqNG6Mmv30UhMZn3JpdOtmPsuDhX/0EXK30dMlPYWpryLfXN
         8UYvKGORGo8V2d4kM28faATUpw41UzYfqQ56x11r4mVp+8XQTb9UdWV0aw4+hVWqC5B0
         OuzgEDs+f5e80qkjPVsCUb4wNSPnct0eqBIY2DhJd4zPKNyA0C4DCY4gQ6dGzuvOO55E
         jXKPkLEvAzFsi6MvZsQDX3Fk3nbyvTPcZROpv7Gm2ydAzCL0QbDPpgT17joMbsWM4Wci
         zLuA==
X-Gm-Message-State: AOAM533fXMSuxf3xI8N5nQEmQ5l77TZTw691Kmac3If8SZ/NnfrWnDoM
        pcSmuXibCOJmgj3rYMJowA/BY/9VlIc=
X-Google-Smtp-Source: ABdhPJxkPDL8RwUEnSP1ujHHocHB8yCik+tT0SwzLgFGPU0MCUAyVdGzCcLEFBm8PNQeHRM60aMRzQ==
X-Received: by 2002:a05:6402:42d5:: with SMTP id i21mr13502005edc.373.1638917772616;
        Tue, 07 Dec 2021 14:56:12 -0800 (PST)
Received: from aspire.cbl.vpn (net-188-217-49-100.cust.vodafonedsl.it. [188.217.49.100])
        by smtp.gmail.com with ESMTPSA id ho30sm489468ejc.30.2021.12.07.14.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 14:56:12 -0800 (PST)
From:   Daniele Biagetti <dbiagio79@gmail.com>
X-Google-Original-From: Daniele Biagetti <daniele.biagetti@cblelectronics.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Daniele Biagetti <daniele.biagetti@cblelectronics.com>
Subject: [PATCH BlueZ 5/6] tools/mesh-gatt: Add generic level model support
Date:   Tue,  7 Dec 2021 23:56:03 +0100
Message-Id: <20211207225604.35156-6-daniele.biagetti@cblelectronics.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207225604.35156-1-daniele.biagetti@cblelectronics.com>
References: <20211207225604.35156-1-daniele.biagetti@cblelectronics.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

---
 Makefile.tools                  |   4 +-
 tools/mesh-gatt/level-model.c   | 288 ++++++++++++++++++++++++++++++++
 tools/mesh-gatt/level-model.h   |  21 +++
 tools/mesh-gatt/local_node.json |   6 +-
 tools/meshctl.c                 |   4 +
 5 files changed, 321 insertions(+), 2 deletions(-)
 create mode 100644 tools/mesh-gatt/level-model.c
 create mode 100644 tools/mesh-gatt/level-model.h

diff --git a/Makefile.tools b/Makefile.tools
index c7bdff83f..c0d2e27de 100644
--- a/Makefile.tools
+++ b/Makefile.tools
@@ -331,7 +331,9 @@ tools_meshctl_SOURCES = tools/meshctl.c \
 				tools/mesh-gatt/config-client.c \
 				tools/mesh-gatt/config-server.c \
 				tools/mesh-gatt/onoff-model.h \
-				tools/mesh-gatt/onoff-model.c
+				tools/mesh-gatt/onoff-model.c \
+				tools/mesh-gatt/level-model.h \
+				tools/mesh-gatt/level-model.c
 tools_meshctl_LDADD = gdbus/libgdbus-internal.la src/libshared-glib.la \
 				lib/libbluetooth-internal.la \
 				$(GLIB_LIBS) $(DBUS_LIBS) -ljson-c -lreadline
diff --git a/tools/mesh-gatt/level-model.c b/tools/mesh-gatt/level-model.c
new file mode 100644
index 000000000..6feb89d5d
--- /dev/null
+++ b/tools/mesh-gatt/level-model.c
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ *
+ *  BlueZ - Bluetooth protocol stack for Linux
+ *
+ *  Copyright (C) 2017  Intel Corporation. All rights reserved.
+ *
+ *
+ */
+
+#ifdef HAVE_CONFIG_H
+#include <config.h>
+#endif
+
+#include <stdio.h>
+#include <errno.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <stdbool.h>
+#include <inttypes.h>
+#include <stdbool.h>
+#include <sys/uio.h>
+#include <wordexp.h>
+#include <readline/readline.h>
+#include <readline/history.h>
+#include <glib.h>
+
+#include "src/shared/shell.h"
+#include "src/shared/util.h"
+
+#include "tools/mesh-gatt/mesh-net.h"
+#include "tools/mesh-gatt/keys.h"
+#include "tools/mesh-gatt/net.h"
+#include "tools/mesh-gatt/node.h"
+#include "tools/mesh-gatt/prov-db.h"
+#include "tools/mesh-gatt/util.h"
+#include "tools/mesh-gatt/level-model.h"
+
+static uint8_t trans_id;
+static uint16_t level_app_idx = APP_IDX_INVALID;
+static int client_bind(uint16_t app_idx, int action)
+{
+        if (action == ACTION_ADD) {
+                if (level_app_idx != APP_IDX_INVALID) {
+                        return MESH_STATUS_INSUFF_RESOURCES;
+                } else {
+                        level_app_idx = app_idx;
+                        bt_shell_printf("Level client model: new binding"
+                                        " %4.4x\n", app_idx);
+                }
+        } else {
+                if (level_app_idx == app_idx)
+                        level_app_idx = APP_IDX_INVALID;
+        }
+        return MESH_STATUS_SUCCESS;
+}
+static void print_remaining_time(uint8_t remaining_time)
+{
+        uint8_t step = (remaining_time & 0xc0) >> 6;
+        uint8_t count = remaining_time & 0x3f;
+        int secs = 0, msecs = 0, minutes = 0, hours = 0;
+        switch (step) {
+        case 0:
+                msecs = 100 * count;
+                secs = msecs / 1000;
+                msecs -= (secs * 1000);
+                break;
+        case 1:
+                secs = 1 * count;
+                minutes = secs / 60;
+                secs -= (minutes * 60);
+                break;
+        case 2:
+                secs = 10 * count;
+                minutes = secs / 60;
+                secs -= (minutes * 60);
+                break;
+        case 3:
+                minutes = 10 * count;
+                hours = minutes / 60;
+                minutes -= (hours * 60);
+                break;
+        default:
+                break;
+        }
+        bt_shell_printf("\n\t\tRemaining time: %d hrs %d mins %d secs %d"
+                        " msecs\n", hours, minutes, secs, msecs);
+}
+static bool client_msg_recvd(uint16_t src, uint8_t *data,
+                             uint16_t len, void *user_data)
+{
+        uint32_t opcode;
+        int n;
+        uint8_t *p;
+        int16_t lev;
+        char s[128];
+
+        if (mesh_opcode_get(data, len, &opcode, &n)) {
+                len -= n;
+                data += n;
+        } else
+                return false;
+
+        switch (opcode) {
+        default:
+                return false;
+        case OP_GENERIC_LEVEL_STATUS:
+                bt_shell_printf("Level Model Message received (%d) opcode %x\n",
+                                len, opcode);
+                print_byte_array("\t",data, len);
+
+                if (len != 2 && len != 4 && len != 5)
+                        break;
+                lev = 0;
+                p = (uint8_t *)&lev;
+#if __BYTE_ORDER == __LITTLE_ENDIAN
+                p[0] = data[0];
+                p[1] = data[1];
+#elif __BYTE_ORDER == __BIG_ENDIAN
+                p[1] = data[0];
+                p[0] = data[1];
+#else
+#error "Unknown byte order"
+#error Processor endianness unknown!
+#endif
+                sprintf(s, "Node %4.4x: Level Status present = %d",
+                                src, lev);
+                if (len >= 4) {
+                        lev = (int16_t)(((uint16_t)data[3] << 8) |  (uint16_t)data[2]);
+                        sprintf(s, ", target = %d",
+                                        lev);
+                }
+                bt_shell_printf("%s\n", s);
+                if(len == 5){
+                        print_remaining_time(data[4]);
+                }
+                break;
+        }
+        return true;
+}
+static uint32_t target;
+static int32_t parms[8];
+static uint32_t read_input_parameters(int argc, char *argv[])
+{
+        uint32_t i;
+        if (!argc)
+                return 0;
+        --argc;
+        ++argv;
+        if (!argc || argv[0][0] == '\0')
+                return 0;
+        for (i = 0; i < sizeof(parms)/sizeof(parms[0]) && i < (unsigned) argc;
+             i++) {
+                if(sscanf(argv[i], "%d", &parms[i]) <= 0)
+                        break;
+        }
+        return i;
+}
+static void cmd_set_node(int argc, char *argv[])
+{
+        uint32_t dst;
+        char *end;
+        dst = strtol(argv[1], &end, 16);
+        if (end != (argv[1] + 4)) {
+                bt_shell_printf("Bad unicast address %s: "
+                                "expected format 4 digit hex\n", argv[1]);
+                target = UNASSIGNED_ADDRESS;
+                return bt_shell_noninteractive_quit(EXIT_FAILURE);
+        } else {
+                bt_shell_printf("Controlling Level for node %4.4x\n", dst);
+                target = dst;
+                set_menu_prompt("Level", argv[1]);
+                return bt_shell_noninteractive_quit(EXIT_SUCCESS);
+        }
+}
+static bool send_cmd(uint8_t *buf, uint16_t len)
+{
+        struct mesh_node *node = node_get_local_node();
+        uint8_t ttl;
+        if(!node)
+                return false;
+        ttl = node_get_default_ttl(node);
+        return net_access_layer_send(ttl, node_get_primary(node),
+                                     target, level_app_idx, buf, len);
+}
+static void cmd_get_status(int argc, char *argv[])
+{
+        uint16_t n;
+        uint8_t msg[32];
+        struct mesh_node *node;
+        if (IS_UNASSIGNED(target)) {
+                bt_shell_printf("Destination not set\n");
+                return bt_shell_noninteractive_quit(EXIT_FAILURE);
+        }
+        node = node_find_by_addr(target);
+
+        if (!node){
+                bt_shell_printf("Warning: node %4.4x not found in database\n",target);
+        }
+
+        n = mesh_opcode_set(OP_GENERIC_LEVEL_GET, msg);
+        if (!send_cmd(msg, n)) {
+                bt_shell_printf("Failed to send \"GENERIC LEVEL GET\"\n");
+                return bt_shell_noninteractive_quit(EXIT_FAILURE);
+        }
+        return bt_shell_noninteractive_quit(EXIT_SUCCESS);
+}
+static void cmd_set(int argc, char *argv[])
+{
+        uint16_t n;
+        uint8_t msg[32];
+        struct mesh_node *node;
+        uint8_t *p;
+        int np;
+        uint32_t opcode;
+        int16_t level;
+
+        if (IS_UNASSIGNED(target)) {
+                bt_shell_printf("Destination not set\n");
+                return bt_shell_noninteractive_quit(EXIT_FAILURE);
+        }
+        node = node_find_by_addr(target);
+
+        if (!node){
+                bt_shell_printf("Warning: node %4.4x not found in database\n",target);
+        }
+
+        np = read_input_parameters(argc, argv);
+        if ((np != 1) && (np != 2) &&
+                        parms[0] < -32768 && parms[0] > 32767 &&
+                        parms[1] != 0 && parms[1] != 1) {
+                bt_shell_printf("Bad arguments: Expecting an integer "
+                                "-32768 to 32767 and an optional 0 or 1 as unack\n");
+                return bt_shell_noninteractive_quit(EXIT_FAILURE);
+        }
+
+        if( (np==2) && parms[1] ){
+                opcode = OP_GENERIC_LEVEL_SET_UNACK;
+        }else{
+                opcode = OP_GENERIC_LEVEL_SET;
+        }
+
+        n = mesh_opcode_set(opcode, msg);
+        level = (int16_t)parms[0];
+        p = (uint8_t *)&level;
+#if __BYTE_ORDER == __LITTLE_ENDIAN
+        msg[n++] = p[0];
+        msg[n++] = p[1];
+#elif __BYTE_ORDER == __BIG_ENDIAN
+        msg[n++] = p[1];
+        msg[n++] = p[0];
+#else
+#error "Unknown byte order"
+#error Processor endianness unknown!
+#endif
+        msg[n++] = trans_id++;
+        if (!send_cmd(msg, n)) {
+                bt_shell_printf("Failed to send \"GENERIC LEVEL SET\"\n");
+                return bt_shell_noninteractive_quit(EXIT_FAILURE);
+        }
+        return bt_shell_noninteractive_quit(EXIT_SUCCESS);
+}
+static const struct bt_shell_menu level_menu = {
+        .name = "level",
+        .desc = "Level Model Submenu",
+        .entries = {
+                {"target",		"<unicast>",			cmd_set_node,
+                 "Set node to configure"},
+                {"get",			NULL,				cmd_get_status,
+                 "Get Level status"},
+                {"level",		"<-32768/+32767> [unack]",	cmd_set,
+                 "Send \"SET Level\" command"},
+                {} },
+};
+static struct mesh_model_ops client_cbs = {
+        client_msg_recvd,
+        client_bind,
+        NULL,
+        NULL
+};
+bool level_client_init(uint8_t ele)
+{
+        if (!node_local_model_register(ele, GENERIC_LEVEL_CLIENT_MODEL_ID,
+                                       &client_cbs, NULL))
+                return false;
+        bt_shell_add_submenu(&level_menu);
+        return true;
+}
diff --git a/tools/mesh-gatt/level-model.h b/tools/mesh-gatt/level-model.h
new file mode 100644
index 000000000..1c8b5f72e
--- /dev/null
+++ b/tools/mesh-gatt/level-model.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/*
+ *
+ *  BlueZ - Bluetooth protocol stack for Linux
+ *
+ *  Copyright (C) 2017  Intel Corporation. All rights reserved.
+ *
+ *
+ */
+#define GENERIC_LEVEL_SERVER_MODEL_ID	0x1002
+#define GENERIC_LEVEL_CLIENT_MODEL_ID	0x1003
+#define OP_GENERIC_LEVEL_GET			0x8205
+#define OP_GENERIC_LEVEL_SET			0x8206
+#define OP_GENERIC_LEVEL_SET_UNACK		0x8207
+#define OP_GENERIC_LEVEL_STATUS			0x8208
+#define OP_GENERIC_DELTA_SET			0x8209
+#define OP_GENERIC_DELTA_SET_UNACK		0x820A
+#define OP_GENERIC_MOVE_SET			0x820B
+#define OP_GENERIC_MOVE_SET_UNACK		0x820C
+void level_set_node(const char *args);
+bool level_client_init(uint8_t ele);
diff --git a/tools/mesh-gatt/local_node.json b/tools/mesh-gatt/local_node.json
index 5ffa7ada1..462cd815d 100644
--- a/tools/mesh-gatt/local_node.json
+++ b/tools/mesh-gatt/local_node.json
@@ -36,7 +36,7 @@
             {
                 "elementIndex": 0,
                 "location": "0001",
-                "models": ["0000", "0001", "1001"]
+                "models": ["0000", "0001", "1001", "1003"]
             }
         ]
     },
@@ -52,6 +52,10 @@
                {
                  "modelId": "1001",
                  "bind": [1]
+                },
+                {
+                 "modelId": "1003",
+                 "bind": [1]
                 }
             ]
           }
diff --git a/tools/meshctl.c b/tools/meshctl.c
index 18e20c40d..69f8d412f 100644
--- a/tools/meshctl.c
+++ b/tools/meshctl.c
@@ -48,6 +48,7 @@
 #include "mesh-gatt/util.h"
 #include "mesh-gatt/prov-db.h"
 #include "mesh-gatt/onoff-model.h"
+#include "mesh-gatt/level-model.h"
 
 /* String display constants */
 #define COLORED_NEW	COLOR_GREEN "NEW" COLOR_OFF
@@ -1999,6 +2000,9 @@ int main(int argc, char *argv[])
 	if (!onoff_client_init(PRIMARY_ELEMENT_IDX))
 		g_printerr("Failed to initialize mesh generic On/Off client\n");
 
+	if (!level_client_init(PRIMARY_ELEMENT_IDX))
+		g_printerr("Failed to initialize mesh generic level client\n");
+
 	status = bt_shell_run();
 
 	g_dbus_client_unref(client);
-- 
2.25.1

