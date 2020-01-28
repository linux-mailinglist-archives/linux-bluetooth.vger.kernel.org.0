Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75D4914C262
	for <lists+linux-bluetooth@lfdr.de>; Tue, 28 Jan 2020 22:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgA1Vxy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 28 Jan 2020 16:53:54 -0500
Received: from mga05.intel.com ([192.55.52.43]:36649 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726211AbgA1Vxy (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 28 Jan 2020 16:53:54 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Jan 2020 13:53:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,375,1574150400"; 
   d="scan'208";a="246856319"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.255.84.27])
  by orsmga002.jf.intel.com with ESMTP; 28 Jan 2020 13:53:52 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com,
        rafal.gajda@silvair.com
Subject: [PATCH BlueZ v3 5/5] mesh: Add NVM storage of Replay Protection
Date:   Tue, 28 Jan 2020 13:53:10 -0800
Message-Id: <20200128215310.8205-6-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200128215310.8205-1-brian.gix@intel.com>
References: <20200128215310.8205-1-brian.gix@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Mesh specification requires that Replay Protection be preserved
across node restarts.  This adds that storage in
<node_uuid>/rpl/<iv_index>/<src>

Realtime access remains in an l_queue structure, and stored as
messages are processed.
---
 Makefile.mesh |   1 +
 mesh/net.c    |  21 ++--
 mesh/rpl.c    | 277 ++++++++++++++++++++++++++++++++++++++++++++++++++
 mesh/rpl.h    |  30 ++++++
 4 files changed, 322 insertions(+), 7 deletions(-)
 create mode 100644 mesh/rpl.c
 create mode 100644 mesh/rpl.h

diff --git a/Makefile.mesh b/Makefile.mesh
index 401122029..10573b304 100644
--- a/Makefile.mesh
+++ b/Makefile.mesh
@@ -32,6 +32,7 @@ mesh_sources = mesh/mesh.h mesh/mesh.c \
 				mesh/manager.h mesh/manager.c \
 				mesh/pb-adv.h mesh/pb-adv.c \
 				mesh/keyring.h mesh/keyring.c \
+				mesh/rpl.h mesh/rpl.c \
 				mesh/mesh-defs.h
 pkglibexec_PROGRAMS += mesh/bluetooth-meshd
 
diff --git a/mesh/net.c b/mesh/net.c
index 9567d947e..19f3b87b7 100644
--- a/mesh/net.c
+++ b/mesh/net.c
@@ -36,6 +36,7 @@
 #include "mesh/mesh-config.h"
 #include "mesh/model.h"
 #include "mesh/appkey.h"
+#include "mesh/rpl.h"
 
 #define abs_diff(a, b) ((a) > (b) ? (a) - (b) : (b) - (a))
 
@@ -256,12 +257,6 @@ struct net_beacon_data {
 	bool processed;
 };
 
-struct mesh_rpl {
-	uint32_t iv_index;
-	uint32_t seq;
-	uint16_t src;
-};
-
 #define FAST_CACHE_SIZE 8
 static struct l_queue *fast_cache;
 static struct l_queue *nets;
@@ -2714,6 +2709,9 @@ static void update_iv_ivu_state(struct mesh_net *net, uint32_t iv_index,
 		struct mesh_config *cfg = node_config_get(net->node);
 
 		mesh_config_write_iv_index(cfg, iv_index, ivu);
+
+		/* Cleanup Replay Protection List NVM */
+		rpl_init(net->node, iv_index);
 	}
 
 	net->iv_index = iv_index;
@@ -3771,8 +3769,11 @@ bool net_msg_in_replay_cache(struct mesh_net *net, uint16_t idx,
 	if (!net || !net->node)
 		return true;
 
-	if (!net->replay_cache)
+	if (!net->replay_cache) {
 		net->replay_cache = l_queue_new();
+		rpl_init(net->node, net->iv_index);
+		rpl_get_list(net->node, net->replay_cache);
+	}
 
 	l_debug("Test Replay src: %4.4x seq: %6.6x iv: %8.8x",
 						src, seq, iv_index);
@@ -3784,6 +3785,7 @@ bool net_msg_in_replay_cache(struct mesh_net *net, uint16_t idx,
 		if (iv_index > rpe->iv_index) {
 			rpe->seq = seq;
 			rpe->iv_index = iv_index;
+			rpl_put_entry(net->node, src, iv_index, seq);
 			return false;
 		}
 
@@ -3799,6 +3801,8 @@ bool net_msg_in_replay_cache(struct mesh_net *net, uint16_t idx,
 
 		rpe->seq = seq;
 
+		rpl_put_entry(net->node, src, iv_index, seq);
+
 		return false;
 	}
 
@@ -3813,6 +3817,9 @@ bool net_msg_in_replay_cache(struct mesh_net *net, uint16_t idx,
 			return true;
 	}
 
+	if (!rpl_put_entry(net->node, src, iv_index, seq))
+		return true;
+
 	rpe = l_new(struct mesh_rpl, 1);
 	rpe->src = src;
 	rpe->seq = seq;
diff --git a/mesh/rpl.c b/mesh/rpl.c
new file mode 100644
index 000000000..27cce4e53
--- /dev/null
+++ b/mesh/rpl.c
@@ -0,0 +1,277 @@
+/*
+ *
+ *  BlueZ - Bluetooth protocol stack for Linux
+ *
+ *  Copyright (C) 2020  Intel Corporation. All rights reserved.
+ *
+ *
+ *  This library is free software; you can redistribute it and/or
+ *  modify it under the terms of the GNU Lesser General Public
+ *  License as published by the Free Software Foundation; either
+ *  version 2.1 of the License, or (at your option) any later version.
+ *
+ *  This library is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  Lesser General Public License for more details.
+ *
+ */
+
+#ifdef HAVE_CONFIG_H
+#include <config.h>
+#endif
+
+#define _GNU_SOURCE
+#include <fcntl.h>
+#include <limits.h>
+#include <stdio.h>
+#include <unistd.h>
+#include <dirent.h>
+
+#include <sys/stat.h>
+
+#include <ell/ell.h>
+
+#include "mesh/mesh-defs.h"
+
+#include "mesh/node.h"
+#include "mesh/net.h"
+#include "mesh/util.h"
+#include "mesh/rpl.h"
+
+const char *rpl_dir = "/rpl";
+
+bool rpl_put_entry(struct mesh_node *node, uint16_t src, uint32_t iv_index,
+								uint32_t seq)
+{
+	const char *node_path;
+	char src_file[PATH_MAX];
+	char seq_txt[7];
+	bool result = false;
+	int fd;
+
+	if (!node || !IS_UNICAST(src))
+		return false;
+
+	node_path = node_get_storage_dir(node);
+
+	if (strlen(node_path) + strlen(rpl_dir) + 15 >= PATH_MAX)
+		return false;
+
+	snprintf(src_file, PATH_MAX, "%s%s/%8.8x/%4.4x", node_path, rpl_dir,
+								iv_index, src);
+
+	fd = open(src_file, O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);
+	if (fd >= 0) {
+		snprintf(seq_txt, 7, "%6.6x", seq);
+		if (write(fd, seq_txt, 6) == 6)
+			result = true;
+
+		close(fd);
+	}
+
+	if (!result)
+		return false;
+
+	/* Delete RPL entry from old iv_index (if it exists) */
+	iv_index--;
+	snprintf(src_file, PATH_MAX, "%s%s/%8.8x/%4.4x", node_path, rpl_dir,
+								iv_index, src);
+	remove(src_file);
+
+
+	return result;
+}
+
+void rpl_del_entry(struct mesh_node *node, uint16_t src)
+{
+	const char *node_path;
+	char rpl_path[PATH_MAX];
+	struct dirent *entry;
+	DIR *dir;
+
+	if (!node || !IS_UNICAST(src))
+		return;
+
+	node_path = node_get_storage_dir(node);
+
+	if (strlen(node_path) + strlen(rpl_dir) + 15 >= PATH_MAX)
+		return;
+
+	snprintf(rpl_path, PATH_MAX, "%s%s", node_path, rpl_dir);
+	dir = opendir(rpl_path);
+
+	if (!dir)
+		return;
+
+	/* Remove all instances of src address */
+	while ((entry = readdir(dir)) != NULL) {
+		if (entry->d_type == DT_DIR) {
+			snprintf(rpl_path, PATH_MAX, "%s/%4.4x",
+							entry->d_name, src);
+			remove(rpl_path);
+		}
+	}
+
+	closedir(dir);
+}
+
+static bool match_src(const void *a, const void *b)
+{
+	const struct mesh_rpl *rpl = a;
+	uint16_t src = L_PTR_TO_UINT(b);
+
+	return rpl->src == src;
+}
+
+static void get_entries(const char *iv_path, struct l_queue *rpl_list)
+{
+	struct mesh_rpl *rpl;
+	struct dirent *entry;
+	DIR *dir;
+	int fd;
+	const char *iv_txt;
+	char src_path[PATH_MAX];
+	char seq_txt[7];
+	uint32_t iv_index, seq;
+	uint16_t src;
+
+	dir = opendir(iv_path);
+
+	if (!dir)
+		return;
+
+	iv_txt = basename(iv_path);
+	sscanf(iv_txt, "%08x", &iv_index);
+
+	memset(seq_txt, 0, sizeof(seq_txt));
+
+	while ((entry = readdir(dir)) != NULL) {
+		/* RPL sequences are stored in src files under iv_index */
+		if (entry->d_type == DT_REG) {
+			snprintf(src_path, PATH_MAX, "%s/%s", iv_path,
+								entry->d_name);
+			fd = open(src_path, O_RDONLY);
+
+			if (fd < 0)
+				continue;
+
+			if(read(fd, seq_txt, 6) == 6) {
+				sscanf(entry->d_name, "%04hx", &src);
+				sscanf(seq_txt, "%06x", &seq);
+
+				rpl = l_queue_find(rpl_list, match_src,
+							L_UINT_TO_PTR(src));
+
+				if (rpl) {
+					/* Replace older entries */
+					if (rpl->iv_index < iv_index) {
+						rpl->iv_index = iv_index;
+						rpl->seq = seq;
+					}
+				} else if (seq <= SEQ_MASK && IS_UNICAST(src)) {
+					rpl = l_new(struct mesh_rpl, 1);
+					rpl->src = src;
+					rpl->iv_index = iv_index;
+					rpl->seq = seq;
+
+					l_queue_push_head(rpl_list, rpl);
+				}
+			}
+
+			close(fd);
+		}
+	}
+
+	closedir(dir);
+}
+
+bool rpl_get_list(struct mesh_node *node, struct l_queue *rpl_list)
+{
+	const char *node_path;
+	struct dirent *entry;
+	char *rpl_path;
+	size_t len;
+	DIR *dir;
+
+	if (!node || !rpl_list)
+		return false;
+
+	node_path = node_get_storage_dir(node);
+
+	len = strlen(node_path) + strlen(rpl_dir) + 1;
+
+	if (len + 14 > PATH_MAX)
+		return false;
+
+	rpl_path = l_malloc(len);
+	snprintf(rpl_path, PATH_MAX, "%s%s", node_path, rpl_dir);
+
+	dir = opendir(rpl_path);
+
+	if (!dir) {
+		l_error("Failed to read RPL dir: %s", rpl_path);
+		l_free(rpl_path);
+		return false;
+	}
+
+	while ((entry = readdir(dir)) != NULL) {
+		/* RPL sequences are stored in files under iv_indexs */
+		if (entry->d_type == DT_DIR && entry->d_name[0] != '.') {
+			snprintf(rpl_path, PATH_MAX, "%s%s/%s",
+					node_path, rpl_dir, entry->d_name);
+			get_entries(rpl_path, rpl_list);
+		}
+	}
+
+	l_free(rpl_path);
+	closedir(dir);
+
+	return true;
+}
+
+void rpl_init(struct mesh_node *node, uint32_t cur)
+{
+	uint32_t old = cur - 1;
+	const char *node_path;
+	struct dirent *entry;
+	char rpl_path[PATH_MAX];
+	DIR *dir;
+
+	if (!node)
+		return;
+
+	node_path = node_get_storage_dir(node);
+
+	if (strlen(node_path) + strlen(rpl_dir) + 10 >= PATH_MAX)
+		return;
+
+	/* Make sure rpl_path exists */
+	snprintf(rpl_path, PATH_MAX, "%s%s", node_path, rpl_dir);
+	mkdir(rpl_path, 0755);
+
+	/* Cleanup any stale trees */
+	dir = opendir(rpl_path);
+	if (!dir)
+		return;
+
+	while ((entry = readdir(dir)) != NULL) {
+		if (entry->d_type == DT_DIR) {
+			const char *iv_txt = basename(entry->d_name);
+			uint32_t iv_index = 0;
+
+			/* Delete all invalid iv_index trees */
+			sscanf(iv_txt, "%08x", &iv_index);
+			if (iv_index != cur && iv_index != old)
+				del_path(entry->d_name);
+		}
+	}
+
+	closedir(dir);
+
+	/* Make sure all currently considered iv_index directories exist */
+	snprintf(rpl_path, PATH_MAX, "%s%s/%8.8x", node_path, rpl_dir, old);
+	mkdir(rpl_path, 0755);
+	snprintf(rpl_path, PATH_MAX, "%s%s/%8.8x", node_path, rpl_dir, cur);
+	mkdir(rpl_path, 0755);
+}
diff --git a/mesh/rpl.h b/mesh/rpl.h
new file mode 100644
index 000000000..17d2e3f05
--- /dev/null
+++ b/mesh/rpl.h
@@ -0,0 +1,30 @@
+/*
+ *
+ *  BlueZ - Bluetooth protocol stack for Linux
+ *
+ *  Copyright (C) 2020  Intel Corporation. All rights reserved.
+ *
+ *
+ *  This library is free software; you can redistribute it and/or
+ *  modify it under the terms of the GNU Lesser General Public
+ *  License as published by the Free Software Foundation; either
+ *  version 2.1 of the License, or (at your option) any later version.
+ *
+ *  This library is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  Lesser General Public License for more details.
+ *
+ */
+
+struct mesh_rpl {
+	uint32_t iv_index;
+	uint32_t seq;
+	uint16_t src;
+};
+
+bool rpl_put_entry(struct mesh_node *node, uint16_t src, uint32_t iv_index,
+								uint32_t seq);
+void rpl_del_entry(struct mesh_node *node, uint16_t src);
+bool rpl_get_list(struct mesh_node *node, struct l_queue *rpl_list);
+void rpl_init(struct mesh_node *node, uint32_t iv_index);
-- 
2.21.1

