Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFD1C10A0C7
	for <lists+linux-bluetooth@lfdr.de>; Tue, 26 Nov 2019 15:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728198AbfKZOyR (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 26 Nov 2019 09:54:17 -0500
Received: from mail-lf1-f45.google.com ([209.85.167.45]:39605 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728138AbfKZOyR (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 26 Nov 2019 09:54:17 -0500
Received: by mail-lf1-f45.google.com with SMTP id f18so14317666lfj.6
        for <linux-bluetooth@vger.kernel.org>; Tue, 26 Nov 2019 06:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kZFIlMqsNKni5o4rVyOHJFp8JYtLlYP/ROGlBRhyiTU=;
        b=IdrKj3f1NeUI6afaVcQKyFjAMYvtlHa0e3z3yRPknnFh4tyGxbj0Dle6T/vfJGMTqY
         rR3vdWjPhA+5XFEjd+WZgb37VBZ5ArzF8QV6P/vE3nO2R03d1B9BiJGwdXQZiPnRrPpm
         2ZUo+jkPZsV0jwJs+2AcBQCq77AiQC4ZTt/FI9kusxaADfspAsNyfUBWBm/gpllmwpTg
         TaS94g4g4V0U+8MWRv+fZ6lckomWL7q+GUvbOqDKCmNFUQFUHjoYF1Rb2lvk/OoEv6qT
         fD+cOB5nkQQTu/I8lkwcz7g0tKbqlqewtxv8FTQ+qUVl/hEQzatGozqt0WkLmIJ+psA4
         TTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kZFIlMqsNKni5o4rVyOHJFp8JYtLlYP/ROGlBRhyiTU=;
        b=r5WFAggpXnrBwHqXFWmrYipgtE578NAc2r28PAhzahSBzSrPXcW/LZNG8xw2acFBmM
         TJaQmM1vVbkhXsI5XJumn7o7RAfu2/srVl75taPQf1e82uv7It6rOkdVm+ctmBLfqmWQ
         xk1wMjAy3tk+hxUrHvtMLKsUOi/RHdVdkj2C4fRmR+Hy4ym6xjyOCnhZOc/uERV9P0ON
         +YqDCwanR44jN/17Yxma5GvRFYVX0NEIc/eLKxxakg5VOLeBtRJ1Kdmylq3vv80VLvKD
         p0JPd/y7MxwxopiK0A/5Hi4lGvQC7GBfXXETgyoU6a09crli/tRYp3LC7k1llipD6kFC
         JJRA==
X-Gm-Message-State: APjAAAVM7UsRaM7eks3SbrMPAe3cn7+pqxGqorBWOjxC3DRZrNVKTFtE
        69tV5vvPdBnwXOzGqmpDWZOMBnsi7hvBqA==
X-Google-Smtp-Source: APXvYqyPW06YUorubU7YOyKJIAHtvnSZGVETciiZs9LFVepX8kndT7vHygOvqdrMMAiTTzjXziL7nw==
X-Received: by 2002:ac2:5388:: with SMTP id g8mr14580639lfh.43.1574780052454;
        Tue, 26 Nov 2019 06:54:12 -0800 (PST)
Received: from mlowasrzechonek2133.silvair.lan ([217.153.94.18])
        by smtp.gmail.com with ESMTPSA id d26sm6607954ljo.54.2019.11.26.06.54.11
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 06:54:11 -0800 (PST)
From:   =?UTF-8?q?Micha=C5=82=20Lowas-Rzechonek?= 
        <michal.lowas-rzechonek@silvair.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v3 3/3] mesh: Inform application about model subscriptions
Date:   Tue, 26 Nov 2019 15:54:01 +0100
Message-Id: <20191126145401.25129-4-michal.lowas-rzechonek@silvair.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191126145401.25129-1-michal.lowas-rzechonek@silvair.com>
References: <20191126145401.25129-1-michal.lowas-rzechonek@silvair.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

---
 doc/mesh-api.txt | 15 ++++++++
 mesh/model.c     | 93 ++++++++++++++++++++++++++++++++++++++++++++++--
 test/test-join   | 13 +++++++
 test/test-mesh   | 25 +++++++------
 4 files changed, 133 insertions(+), 13 deletions(-)

diff --git a/doc/mesh-api.txt b/doc/mesh-api.txt
index 23a958771..30b7452e2 100644
--- a/doc/mesh-api.txt
+++ b/doc/mesh-api.txt
@@ -100,6 +100,14 @@ Methods:
 					A 16-bit Company ID as defined by the
 					Bluetooth SIG
 
+				array{variant} Subscriptions
+
+					Addresses the model is subscribed to.
+
+					Each address is provided either as
+					uint16 for group addresses, or
+					as array{byte} for virtual labels.
+
 		PossibleErrors:
 			org.bluez.mesh.Error.InvalidArguments
 			org.bluez.mesh.Error.NotFound,
@@ -841,6 +849,13 @@ Methods:
 			A 16-bit Bluetooth-assigned Company Identifier of the
 			vendor as defined by Bluetooth SIG
 
+		array{variant} Subscriptions
+
+			Addresses the model is subscribed to.
+
+			Each address is provided either as uint16 for group
+			addresses, or as array{byte} for virtual labels.
+
 Properties:
 	uint8 Index [read-only]
 
diff --git a/mesh/model.c b/mesh/model.c
index a0c683691..57a63c59e 100644
--- a/mesh/model.c
+++ b/mesh/model.c
@@ -295,6 +295,70 @@ static void config_update_model_bindings(struct mesh_node *node,
 	l_dbus_send(dbus, msg);
 }
 
+static void append_dict_subs_array(struct l_dbus_message_builder *builder,
+						struct l_queue *subs,
+						struct l_queue *virts,
+						const char *key)
+{
+	const struct l_queue_entry *entry;
+
+	l_dbus_message_builder_enter_dict(builder, "sv");
+	l_dbus_message_builder_append_basic(builder, 's', key);
+	l_dbus_message_builder_enter_variant(builder, "av");
+	l_dbus_message_builder_enter_array(builder, "v");
+
+	if (!subs)
+		goto virts;
+
+	for (entry = l_queue_get_entries(subs); entry; entry = entry->next) {
+		uint16_t grp = L_PTR_TO_UINT(entry->data);
+
+		l_dbus_message_builder_enter_variant(builder, "q");
+		l_dbus_message_builder_append_basic(builder, 'q', &grp);
+		l_dbus_message_builder_leave_variant(builder);
+	}
+
+virts:
+	if (!virts)
+		goto done;
+
+	for (entry = l_queue_get_entries(virts); entry; entry = entry->next) {
+		const struct mesh_virtual *virt = entry->data;
+
+		l_dbus_message_builder_enter_variant(builder, "ay");
+		dbus_append_byte_array(builder, virt->label,
+							sizeof(virt->label));
+		l_dbus_message_builder_leave_variant(builder);
+
+	}
+
+done:
+	l_dbus_message_builder_leave_array(builder);
+	l_dbus_message_builder_leave_variant(builder);
+	l_dbus_message_builder_leave_dict(builder);
+}
+
+static void config_update_model_subscriptions(struct mesh_node *node,
+							struct mesh_model *mod)
+{
+	struct l_dbus *dbus = dbus_get_bus();
+	struct l_dbus_message *msg;
+	struct l_dbus_message_builder *builder;
+
+	msg = create_config_update_msg(node, mod->ele_idx, mod->id,
+								&builder);
+	if (!msg)
+		return;
+
+	append_dict_subs_array(builder, mod->subs, mod->virtuals,
+							"Subscriptions");
+
+	l_dbus_message_builder_leave_array(builder);
+	l_dbus_message_builder_finalize(builder);
+	l_dbus_message_builder_destroy(builder);
+	l_dbus_send(dbus, msg);
+}
+
 static void forward_model(void *a, void *b)
 {
 	struct mesh_model *mod = a;
@@ -1381,7 +1445,16 @@ int mesh_model_sub_add(struct mesh_node *node, uint16_t addr, uint32_t id,
 	if (!mod)
 		return status;
 
-	return add_sub(node_get_net(node), mod, group, b_virt, dst);
+	status = add_sub(node_get_net(node), mod, group, b_virt, dst);
+
+	if (status != MESH_STATUS_SUCCESS)
+		return status;
+
+	if (!mod->cbs)
+		/* External models */
+		config_update_model_subscriptions(node, mod);
+
+	return MESH_STATUS_SUCCESS;
 }
 
 int mesh_model_sub_ovr(struct mesh_node *node, uint16_t addr, uint32_t id,
@@ -1417,7 +1490,7 @@ int mesh_model_sub_ovr(struct mesh_node *node, uint16_t addr, uint32_t id,
 		}
 	}
 
-	status = mesh_model_sub_add(node, addr, id, group, b_virt, dst);
+	status = add_sub(node_get_net(node), mod, group, b_virt, dst);
 
 	if (status != MESH_STATUS_SUCCESS) {
 		/* Adding new group failed, so revert to old lists */
@@ -1440,6 +1513,10 @@ int mesh_model_sub_ovr(struct mesh_node *node, uint16_t addr, uint32_t id,
 		l_queue_destroy(virtuals, unref_virt);
 	}
 
+	if (!mod->cbs)
+		/* External models */
+		config_update_model_subscriptions(node, mod);
+
 	return status;
 }
 
@@ -1475,6 +1552,10 @@ int mesh_model_sub_del(struct mesh_node *node, uint16_t addr, uint32_t id,
 	if (l_queue_remove(mod->subs, L_UINT_TO_PTR(grp)))
 		mesh_net_dst_unreg(node_get_net(node), grp);
 
+	if (!mod->cbs)
+		/* External models */
+		config_update_model_subscriptions(node, mod);
+
 	return MESH_STATUS_SUCCESS;
 }
 
@@ -1497,6 +1578,10 @@ int mesh_model_sub_del_all(struct mesh_node *node, uint16_t addr, uint32_t id)
 	l_queue_clear(mod->subs, NULL);
 	l_queue_clear(mod->virtuals, unref_virt);
 
+	if (!mod->cbs)
+		/* External models */
+		config_update_model_subscriptions(node, mod);
+
 	return MESH_STATUS_SUCCESS;
 }
 
@@ -1691,6 +1776,10 @@ void model_build_config(void *model, void *msg_builder)
 								&period);
 	}
 
+	if (l_queue_length(mod->subs) || l_queue_length(mod->virtuals))
+		append_dict_subs_array(builder, mod->subs, mod->virtuals,
+							"Subscriptions");
+
 	l_dbus_message_builder_leave_array(builder);
 	l_dbus_message_builder_leave_struct(builder);
 }
diff --git a/test/test-join b/test/test-join
index fb7b0d640..6dfb2e8c3 100644
--- a/test/test-join
+++ b/test/test-join
@@ -327,6 +327,19 @@ class Model():
 			print('Model publication period ', end='')
 			print(self.pub_period, end='')
 			print(' ms')
+		if 'Subscriptions' in config:
+			self.print_subscriptions(config.get('Subscriptions'))
+
+	def print_subscriptions(self, subscriptions):
+		print('Model subscriptions ', end='')
+		for sub in subscriptions:
+			if isinstance(sub, int):
+				print('%04x' % sub, end=' ')
+
+			if isinstance(sub, list):
+				label = uuid.UUID(bytes=b''.join(sub))
+				print(label, end=' ')
+		print()
 
 class OnOffServer(Model):
 	def __init__(self, model_id):
diff --git a/test/test-mesh b/test/test-mesh
index c67bb65fb..5777fcebc 100755
--- a/test/test-mesh
+++ b/test/test-mesh
@@ -128,6 +128,7 @@ import dbus.exceptions
 
 from threading import Timer
 import time
+import uuid
 
 try:
   from gi.repository import GLib
@@ -628,17 +629,19 @@ class Model():
 			print('Model publication period ', end='')
 			print(self.pub_period, end='')
 			print(' ms')
-
-	def print_bindings(self):
-		print(set_cyan('Model'), set_cyan('%03x' % self.model_id),
-						set_cyan('is bound to: '))
-
-		if len(self.bindings) == 0:
-			print(set_cyan('** None **'))
-			return
-
-		for b in self.bindings:
-			print(set_green('%03x' % b) + ' ')
+		if 'Subscriptions' in config:
+			print('Model subscriptions ', end='')
+			self.print_subscriptions(config.get('Subscriptions'))
+			print()
+
+	def print_subscriptions(self, subscriptions):
+		for sub in subscriptions:
+			if isinstance(sub, int):
+				print('%04x' % sub, end=' ')
+
+			if isinstance(sub, list):
+				label = uuid.UUID(bytes=b''.join(sub))
+				print(label, end=' ')
 
 ########################
 # On Off Server Model
-- 
2.19.1

