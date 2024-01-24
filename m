Return-Path: <linux-bluetooth+bounces-1297-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCE483ADFB
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Jan 2024 17:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A5B51F2492A
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Jan 2024 16:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCFD7E58C;
	Wed, 24 Jan 2024 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ktD4za5+"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5877E568
	for <linux-bluetooth@vger.kernel.org>; Wed, 24 Jan 2024 16:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706112484; cv=none; b=Th5+oT/UaOhydi8sTdbPQyfrB+OmxeX016fgv/SIhe6bjLIiPWeq+PMsNB8JyzQQdz0Q0kR8EOkVEVV/uPPtcNpfjaXu/i/6DpQ6Vw/lGhJdIAXnmWAgHGxNnYho8Z+z2JYkJLXnYKNqwrC7zL/aor7bkKQmT8xMoZgFCTdRveY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706112484; c=relaxed/simple;
	bh=MakOcaBw3YSuN3nn/DHr0vOxRiZjIEdQeSW/80o/hfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nmiCMkzD25d5U2yRaWQYSUjNnq4ig3LBGDdteflvweQV5as4qOge8NgdnBb4thlx5gYDhJdN6yaxsWz27RsQI5B/URctQkXNxFrOAMGuvzesAcT8mKYCf6wZzgOrciNWaooUeP/uvg3sZJpKXI6ulROdooAuVZgWrnidwhBXNUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ktD4za5+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36767C43390;
	Wed, 24 Jan 2024 16:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706112484;
	bh=MakOcaBw3YSuN3nn/DHr0vOxRiZjIEdQeSW/80o/hfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ktD4za5+LF3DvKmR3ttp0gyNxO1tNCYboArG0uoA1vzE5D+RQImefE2vqgQE0GB+O
	 FoBm9DolF9KGppVuMiC5tDdzZguOSElzyXAoMHYP17tcWMH2jfMdb974FqWzjPVzGh
	 SCuGsK5S30mJDiaIo/zsaLOMeNEGT5AMJmj0ovRneZPIMvfqyt4v4CNKgiZSgsis4X
	 OOXMkt4mPQCJyntYR4NVIwEbP0wLzUVIHoYHd1dgXXtlF5mh8SDq17JwPAEMaLkDqw
	 Wq6tNmifNE9td/ZClswRucF2d9YfpXz00h4h7pzMsNbBBwb3hghPa1K2+vwvRFgyXF
	 i1/QbpmNWUODA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2190CC48260;
	Wed, 24 Jan 2024 16:08:04 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Wed, 24 Jan 2024 16:07:58 +0000
Subject: [PATCH BlueZ v2 2/8] obexd: factor out external plugin support
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240124-rm-ext-plugins-v2-2-5244906f05ff@gmail.com>
References: <20240124-rm-ext-plugins-v2-0-5244906f05ff@gmail.com>
In-Reply-To: <20240124-rm-ext-plugins-v2-0-5244906f05ff@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Emil Velikov <emil.velikov@collabora.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706112482; l=5642;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=pGvGwURoyXDGW5FladnamFTHwTNZsaHX3sUoMvQj5ac=;
 b=ELogNpQv7uztXa6PHbi8d4EtukomGUD5kdH4WM19I9qSFtW8FeynmhkA8o5RgXBkGv7i8Lyno
 5NMcpUsEgqzC7vJh2kHEW23EXS4lYFfxnNBsX49+RU4cbn3FgJxqHmI
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.velikov@collabora.com>

As a whole all plugins should be built-in, otherwise they would be using
internal, undocumented, unversioned, unstable API.

Flesh out the external plugin support into a few pre-processor blocks
and simplify the normal path.

Hide the internal API (omit export-dynamic) when built without external
plugins.
---
 Makefile.obexd     |  2 ++
 obexd/src/obexd.h  |  2 +-
 obexd/src/plugin.c | 93 ++++++++++++++++++++++++++++++++++++------------------
 obexd/src/plugin.h |  4 +++
 4 files changed, 70 insertions(+), 31 deletions(-)

diff --git a/Makefile.obexd b/Makefile.obexd
index 5d1a4ff65..9175de2a4 100644
--- a/Makefile.obexd
+++ b/Makefile.obexd
@@ -86,7 +86,9 @@ obexd_src_obexd_LDADD = lib/libbluetooth-internal.la \
 			$(ICAL_LIBS) $(DBUS_LIBS) $(LIBEBOOK_LIBS) \
 			$(LIBEDATASERVER_LIBS) $(GLIB_LIBS) -ldl
 
+if EXTERNAL_PLUGINS
 obexd_src_obexd_LDFLAGS = $(AM_LDFLAGS) -Wl,--export-dynamic
+endif
 
 obexd_src_obexd_CPPFLAGS = $(AM_CPPFLAGS) $(GLIB_CFLAGS) $(DBUS_CFLAGS) \
 				$(ICAL_CFLAGS) -DOBEX_PLUGIN_BUILTIN \
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
index a3eb24753..212299fa5 100644
--- a/obexd/src/plugin.c
+++ b/obexd/src/plugin.c
@@ -37,11 +37,14 @@
 static GSList *plugins = NULL;
 
 struct obex_plugin {
+#if EXTERNAL_PLUGINS
 	void *handle;
+#endif
 	const struct obex_plugin_desc *desc;
 };
 
-static gboolean add_plugin(void *handle, const struct obex_plugin_desc *desc)
+#if EXTERNAL_PLUGINS
+static gboolean add_external_plugin(void *handle, const struct obex_plugin_desc *desc)
 {
 	struct obex_plugin *plugin;
 
@@ -65,6 +68,26 @@ static gboolean add_plugin(void *handle, const struct obex_plugin_desc *desc)
 
 	return TRUE;
 }
+#endif
+
+static void add_plugin(const struct obex_plugin_desc *desc)
+{
+	struct obex_plugin *plugin;
+
+	plugin = g_try_new0(struct obex_plugin, 1);
+	if (plugin == NULL)
+		return;
+
+	plugin->desc = desc;
+
+	if (desc->init() < 0) {
+		g_free(plugin);
+		return;
+	}
+
+	plugins = g_slist_append(plugins, plugin);
+	DBG("Plugin %s loaded", desc->name);
+}
 
 static gboolean check_plugin(const struct obex_plugin_desc *desc,
 				char **patterns, char **excludes)
@@ -93,42 +116,23 @@ static gboolean check_plugin(const struct obex_plugin_desc *desc,
 }
 
 
-#include "builtin.h"
-
-gboolean plugin_init(const char *pattern, const char *exclude)
+static void external_plugin_init(char **patterns, char **excludes)
 {
-	char **patterns = NULL;
-	char **excludes = NULL;
+#if EXTERNAL_PLUGINS
 	GDir *dir;
 	const char *file;
-	unsigned int i;
 
-	if (strlen(PLUGINDIR) == 0)
-		return FALSE;
-
-	if (pattern)
-		patterns = g_strsplit_set(pattern, ":, ", -1);
-
-	if (exclude)
-		excludes = g_strsplit_set(exclude, ":, ", -1);
-
-	DBG("Loading builtin plugins");
-
-	for (i = 0; __obex_builtin[i]; i++) {
-		if (check_plugin(__obex_builtin[i],
-					patterns, excludes) == FALSE)
-			continue;
+	warn("Using external plugins is not officially supported.\n");
+	warn("Consider upstreaming your plugins into the BlueZ project.");
 
-		add_plugin(NULL,  __obex_builtin[i]);
-	}
+	if (strlen(PLUGINDIR) == 0)
+		return;
 
 	DBG("Loading plugins %s", PLUGINDIR);
 
 	dir = g_dir_open(PLUGINDIR, 0, NULL);
 	if (!dir) {
-		g_strfreev(patterns);
-		g_strfreev(excludes);
-		return FALSE;
+		return;
 	}
 
 	while ((file = g_dir_read_name(dir)) != NULL) {
@@ -164,15 +168,42 @@ gboolean plugin_init(const char *pattern, const char *exclude)
 			continue;
 		}
 
-		if (add_plugin(handle, desc) == FALSE)
+		if (add_external_plugin(handle, desc) == FALSE)
 			dlclose(handle);
 	}
 
 	g_dir_close(dir);
+#endif
+}
+
+#include "builtin.h"
+
+void plugin_init(const char *pattern, const char *exclude)
+{
+	char **patterns = NULL;
+	char **excludes = NULL;
+	unsigned int i;
+
+	if (pattern)
+		patterns = g_strsplit_set(pattern, ":, ", -1);
+
+	if (exclude)
+		excludes = g_strsplit_set(exclude, ":, ", -1);
+
+	DBG("Loading builtin plugins");
+
+	for (i = 0; __obex_builtin[i]; i++) {
+		if (check_plugin(__obex_builtin[i],
+					patterns, excludes) == FALSE)
+			continue;
+
+		add_plugin(__obex_builtin[i]);
+	}
+
+	external_plugin_init(patterns, excludes);
+
 	g_strfreev(patterns);
 	g_strfreev(excludes);
-
-	return TRUE;
 }
 
 void plugin_cleanup(void)
@@ -187,8 +218,10 @@ void plugin_cleanup(void)
 		if (plugin->desc->exit)
 			plugin->desc->exit();
 
+#if EXTERNAL_PLUGINS
 		if (plugin->handle != NULL)
 			dlclose(plugin->handle);
+#endif
 
 		g_free(plugin);
 	}
diff --git a/obexd/src/plugin.h b/obexd/src/plugin.h
index a91746cbc..e1756b9bf 100644
--- a/obexd/src/plugin.h
+++ b/obexd/src/plugin.h
@@ -20,10 +20,14 @@ struct obex_plugin_desc {
 			#name, init, exit \
 		};
 #else
+#if EXTERNAL_PLUGINS
 #define OBEX_PLUGIN_DEFINE(name,init,exit) \
 		extern struct obex_plugin_desc obex_plugin_desc \
 				__attribute__ ((visibility("default"))); \
 		const struct obex_plugin_desc obex_plugin_desc = { \
 			#name, init, exit \
 		};
+#else
+#error "Requested non built-in plugin, while external plugins is disabled"
+#endif
 #endif

-- 
2.43.0


