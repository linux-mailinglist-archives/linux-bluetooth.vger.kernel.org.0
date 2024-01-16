Return-Path: <linux-bluetooth+bounces-1119-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5414982F06B
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jan 2024 15:19:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEA52B2225D
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jan 2024 14:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09A81BF58;
	Tue, 16 Jan 2024 14:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jz3yhLJs"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BDF1BDF0
	for <linux-bluetooth@vger.kernel.org>; Tue, 16 Jan 2024 14:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACBF2C43390;
	Tue, 16 Jan 2024 14:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705414737;
	bh=ha6/xN0vDoCkzTPZDV0gYF+DTD/uMmlFVR7i6CjtNZI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Jz3yhLJs27OQGf6VP1pj/eBgzvIJ0vZUkN1SvCVkwhPYg4AOxce/hogSu40L6XMWf
	 1xtMQjZjfAnluL3embJMNfLzKjPjqqzwwDopGHb1SYvuP01lSRS61vWOF4SlPfmepX
	 kS0eK+ClqSPS8AA1b2ykbIUvVBFqJgS32eLuvpyMOGS9MI0fkwGRaseLg7bfjVCtYQ
	 wP3CYnrTt/qwT0Bj6Dr0JLUauWSW4+tdZnP1H+ShUlcnT3U/egTs4IGhveaEZgcLAu
	 vAU6CDlSdBfHmb0jB6zuCSm0YRHjeM2yX+kjAwS6l+IM4CHRntgOqStkuEBSJffF9y
	 /QVPfK6K20W7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B4DC47077;
	Tue, 16 Jan 2024 14:18:57 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Tue, 16 Jan 2024 14:18:53 +0000
Subject: [PATCH BlueZ 1/8] obexd: remove support for external plugins
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240116-rm-ext-plugins-v1-1-62990fb07369@gmail.com>
References: <20240116-rm-ext-plugins-v1-0-62990fb07369@gmail.com>
In-Reply-To: <20240116-rm-ext-plugins-v1-0-62990fb07369@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Emil Velikov <emil.velikov@collabora.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705414735; l=5476;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=hQDl9d6cvK0EoFOThXZCDoMQdkPJWiUTgNVx33TDR4c=;
 b=H6ArQ/2X9ppuwdcI5Q/Ew8AQzhv9zulNEsUTtHg8L0tnpZH31cmTrmnkM7G3yXnoxN4KBUf/l
 BO0slbHoQbFACjisY8n9xPk6VycGk5sJ2bxz1BALawPRhITxM0Vk++0
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.velikov@collabora.com>

A while ago all the plugins were converted to built-in, although the
external machinery remained - remove it.

In practise, this means we no longer need to export obexd internal API
(fix coming in later patch). AFACIT supporting third-party plugins was
never a supported use-case.

Glancing around - no Linux distros seem to ship plugins, these days.
---
 Makefile.obexd     |  6 +----
 obexd/src/obexd.h  |  2 +-
 obexd/src/plugin.c | 73 +++++-------------------------------------------------
 obexd/src/plugin.h |  9 -------
 4 files changed, 8 insertions(+), 82 deletions(-)

diff --git a/Makefile.obexd b/Makefile.obexd
index 5d1a4ff65..2774f3aec 100644
--- a/Makefile.obexd
+++ b/Makefile.obexd
@@ -11,8 +11,6 @@ EXTRA_DIST += obexd/src/obex.service.in obexd/src/org.bluez.obex.service
 
 if OBEX
 
-obex_plugindir = $(libdir)/obex/plugins
-
 obexd_builtin_modules =
 obexd_builtin_sources =
 obexd_builtin_nodist =
@@ -89,9 +87,7 @@ obexd_src_obexd_LDADD = lib/libbluetooth-internal.la \
 obexd_src_obexd_LDFLAGS = $(AM_LDFLAGS) -Wl,--export-dynamic
 
 obexd_src_obexd_CPPFLAGS = $(AM_CPPFLAGS) $(GLIB_CFLAGS) $(DBUS_CFLAGS) \
-				$(ICAL_CFLAGS) -DOBEX_PLUGIN_BUILTIN \
-				-DPLUGINDIR=\""$(obex_plugindir)"\" \
-				-D_FILE_OFFSET_BITS=64 \
+				$(ICAL_CFLAGS) -D_FILE_OFFSET_BITS=64 \
 				-I$(builddir)/lib -I$(builddir)/obexd/src
 
 obexd_src_obexd_CFLAGS = $(AM_CFLAGS) -fPIC
diff --git a/obexd/src/obexd.h b/obexd/src/obexd.h
index fe312a65b..af5265da5 100644
--- a/obexd/src/obexd.h
+++ b/obexd/src/obexd.h
@@ -18,7 +18,7 @@
 #define OBEX_MAS	(1 << 8)
 #define OBEX_MNS	(1 << 9)
 
-gboolean plugin_init(const char *pattern, const char *exclude);
+void plugin_init(const char *pattern, const char *exclude);
 void plugin_cleanup(void);
 
 gboolean manager_init(void);
diff --git a/obexd/src/plugin.c b/obexd/src/plugin.c
index 0df9d5258..185adac78 100644
--- a/obexd/src/plugin.c
+++ b/obexd/src/plugin.c
@@ -37,33 +37,29 @@
 static GSList *plugins = NULL;
 
 struct obex_plugin {
-	void *handle;
 	struct obex_plugin_desc *desc;
 };
 
-static gboolean add_plugin(void *handle, struct obex_plugin_desc *desc)
+static void add_plugin(struct obex_plugin_desc *desc)
 {
 	struct obex_plugin *plugin;
 
 	if (desc->init == NULL)
-		return FALSE;
+		return;
 
 	plugin = g_try_new0(struct obex_plugin, 1);
 	if (plugin == NULL)
-		return FALSE;
+		return;
 
-	plugin->handle = handle;
 	plugin->desc = desc;
 
 	if (desc->init() < 0) {
 		g_free(plugin);
-		return FALSE;
+		return;
 	}
 
 	plugins = g_slist_append(plugins, plugin);
 	DBG("Plugin %s loaded", desc->name);
-
-	return TRUE;
 }
 
 static gboolean check_plugin(struct obex_plugin_desc *desc,
@@ -95,17 +91,12 @@ static gboolean check_plugin(struct obex_plugin_desc *desc,
 
 #include "builtin.h"
 
-gboolean plugin_init(const char *pattern, const char *exclude)
+void plugin_init(const char *pattern, const char *exclude)
 {
 	char **patterns = NULL;
 	char **excludes = NULL;
-	GDir *dir;
-	const char *file;
 	unsigned int i;
 
-	if (strlen(PLUGINDIR) == 0)
-		return FALSE;
-
 	if (pattern)
 		patterns = g_strsplit_set(pattern, ":, ", -1);
 
@@ -119,60 +110,11 @@ gboolean plugin_init(const char *pattern, const char *exclude)
 					patterns, excludes) == FALSE)
 			continue;
 
-		add_plugin(NULL,  __obex_builtin[i]);
+		add_plugin(__obex_builtin[i]);
 	}
 
-	DBG("Loading plugins %s", PLUGINDIR);
-
-	dir = g_dir_open(PLUGINDIR, 0, NULL);
-	if (!dir) {
-		g_strfreev(patterns);
-		g_strfreev(excludes);
-		return FALSE;
-	}
-
-	while ((file = g_dir_read_name(dir)) != NULL) {
-		struct obex_plugin_desc *desc;
-		void *handle;
-		char *filename;
-
-		if (g_str_has_prefix(file, "lib") == TRUE ||
-				g_str_has_suffix(file, ".so") == FALSE)
-			continue;
-
-		filename = g_build_filename(PLUGINDIR, file, NULL);
-
-		handle = dlopen(filename, PLUGINFLAG);
-		if (handle == NULL) {
-			error("Can't load plugin %s: %s", filename,
-								dlerror());
-			g_free(filename);
-			continue;
-		}
-
-		g_free(filename);
-
-		desc = dlsym(handle, "obex_plugin_desc");
-		if (desc == NULL) {
-			error("Can't load plugin description: %s", dlerror());
-			dlclose(handle);
-			continue;
-		}
-
-		if (check_plugin(desc, patterns, excludes) == FALSE) {
-			dlclose(handle);
-			continue;
-		}
-
-		if (add_plugin(handle, desc) == FALSE)
-			dlclose(handle);
-	}
-
-	g_dir_close(dir);
 	g_strfreev(patterns);
 	g_strfreev(excludes);
-
-	return TRUE;
 }
 
 void plugin_cleanup(void)
@@ -187,9 +129,6 @@ void plugin_cleanup(void)
 		if (plugin->desc->exit)
 			plugin->desc->exit();
 
-		if (plugin->handle != NULL)
-			dlclose(plugin->handle);
-
 		g_free(plugin);
 	}
 
diff --git a/obexd/src/plugin.h b/obexd/src/plugin.h
index 703878460..2df66c79b 100644
--- a/obexd/src/plugin.h
+++ b/obexd/src/plugin.h
@@ -14,16 +14,7 @@ struct obex_plugin_desc {
 	void (*exit) (void);
 };
 
-#ifdef OBEX_PLUGIN_BUILTIN
 #define OBEX_PLUGIN_DEFINE(name, init, exit) \
 		struct obex_plugin_desc __obex_builtin_ ## name = { \
 			#name, init, exit \
 		};
-#else
-#define OBEX_PLUGIN_DEFINE(name,init,exit) \
-		extern struct obex_plugin_desc obex_plugin_desc \
-				__attribute__ ((visibility("default"))); \
-		struct obex_plugin_desc obex_plugin_desc = { \
-			#name, init, exit \
-		};
-#endif

-- 
2.43.0


