Return-Path: <linux-bluetooth+bounces-1116-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E83DE82F029
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jan 2024 15:01:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71A7A283D52
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jan 2024 14:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A561C2A0;
	Tue, 16 Jan 2024 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="giWoigIy"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0581BDFF
	for <linux-bluetooth@vger.kernel.org>; Tue, 16 Jan 2024 14:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E480C4167D;
	Tue, 16 Jan 2024 14:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705413640;
	bh=KaNZfKSdUM++NRak2Yp5k80sRWCqzIDfSojhCSsSEDY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=giWoigIyVVKsxXEbA7S4GbJatCIwF4IfVQjvWReJELyvaQZx5zPG2pJqXGjrtt/qm
	 VIiYCGVtDd5DHXhSINcTQfEJ93K619rvq5mfJphLUFt24vfAE4O0eLsJ91QLUSL3V4
	 vzGXAotr7aO/PkClPsseyc0dimq2uXegWopYMA4zntWbZd6Ma5AoOfev29/L9LrHu5
	 h1X5c8yzaITRJq+GoHIq7cS0OhazlhQ+ptpvhTFqo2M4sg7agEw8ALxoYScin2CMN0
	 m5LZp4LUcRiQWTHMj/k7U6zLpVFnKL6Ksc26cR9Op+XSl0Spk3e4gyJ3GUBRiloObo
	 xusnwhRREnzNA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C420C47DA9;
	Tue, 16 Jan 2024 14:00:40 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Tue, 16 Jan 2024 14:00:44 +0000
Subject: [PATCH BlueZ 19/20] obexd: const annotate misc immutable data
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240116-const-v1-19-17c87978f40b@gmail.com>
References: <20240116-const-v1-0-17c87978f40b@gmail.com>
In-Reply-To: <20240116-const-v1-0-17c87978f40b@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Emil Velikov <emil.velikov@collabora.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705413636; l=3937;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=LrDZdJSOkuXg0aaks0vIhPZwBeRbl04SybrYFVckFXg=;
 b=OUeSwrfDljmljB/eO09WAXjnvynxultMG2EumZa87b/P/KGASR+i3PHVEx+aWJScKZHtVxPs0
 q3cHc5NWn0ZDMg6x5xSGZg1R1Tbsosir7IRxgaoQX2ytqXNK9LM/X4h
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.velikov@collabora.com>

---
 obexd/client/manager.c          | 6 +++---
 obexd/client/map.c              | 4 ++--
 obexd/client/mns.c              | 4 ++--
 obexd/plugins/phonebook-ebook.c | 2 +-
 obexd/src/main.c                | 2 +-
 obexd/src/obex.c                | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/obexd/client/manager.c b/obexd/client/manager.c
index 75f1bfb04..ad1fbb04a 100644
--- a/obexd/client/manager.c
+++ b/obexd/client/manager.c
@@ -241,7 +241,7 @@ static const GDBusMethodTable client_methods[] = {
 
 static DBusConnection *conn = NULL;
 
-static struct obc_module {
+static const struct obc_module {
 	const char *name;
 	int (*init) (void);
 	void (*exit) (void);
@@ -258,7 +258,7 @@ static struct obc_module {
 int client_manager_init(void)
 {
 	DBusError derr;
-	struct obc_module *module;
+	const struct obc_module *module;
 
 	dbus_error_init(&derr);
 
@@ -289,7 +289,7 @@ int client_manager_init(void)
 
 void client_manager_exit(void)
 {
-	struct obc_module *module;
+	const struct obc_module *module;
 
 	if (conn == NULL)
 		return;
diff --git a/obexd/client/map.c b/obexd/client/map.c
index 74828cddb..513dcaf14 100644
--- a/obexd/client/map.c
+++ b/obexd/client/map.c
@@ -1060,7 +1060,7 @@ static void parse_protected(struct map_msg *msg, const char *value)
 						MAP_MSG_INTERFACE, "Protected");
 }
 
-static struct map_msg_parser {
+static const struct map_msg_parser {
 	const char *name;
 	void (*func) (struct map_msg *msg, const char *value);
 } msg_parsers[] = {
@@ -1120,7 +1120,7 @@ static void msg_element(GMarkupParseContext *ctxt, const char *element,
 								&msg->path);
 
 	for (i = 0, key = names[i]; key; key = names[++i]) {
-		struct map_msg_parser *parser;
+		const struct map_msg_parser *parser;
 
 		for (parser = msg_parsers; parser && parser->name; parser++) {
 			if (strcasecmp(key, parser->name) == 0) {
diff --git a/obexd/client/mns.c b/obexd/client/mns.c
index 702cf0367..c7f86afdc 100644
--- a/obexd/client/mns.c
+++ b/obexd/client/mns.c
@@ -233,7 +233,7 @@ static void parse_event_report_priority(struct map_event *event,
 	event->priority = g_strdup(value);
 }
 
-static struct map_event_report_parser {
+static const struct map_event_report_parser {
 	const char *name;
 	void (*func) (struct map_event *event, const char *value);
 } event_report_parsers[] = {
@@ -262,7 +262,7 @@ static void event_report_element(GMarkupParseContext *ctxt,
 		return;
 
 	for (i = 0, key = names[i]; key; key = names[++i]) {
-		struct map_event_report_parser *parser;
+		const struct map_event_report_parser *parser;
 
 		for (parser = event_report_parsers; parser && parser->name;
 								parser++) {
diff --git a/obexd/plugins/phonebook-ebook.c b/obexd/plugins/phonebook-ebook.c
index 29ec9d213..e509dd29a 100644
--- a/obexd/plugins/phonebook-ebook.c
+++ b/obexd/plugins/phonebook-ebook.c
@@ -55,7 +55,7 @@ struct query_context {
 	gboolean canceled;
 };
 
-static char *attribute_mask[] = {
+static const char *attribute_mask[] = {
 /* 0 */		"VERSION",
 		"FN",
 		"N",
diff --git a/obexd/src/main.c b/obexd/src/main.c
index d950883f0..151574afa 100644
--- a/obexd/src/main.c
+++ b/obexd/src/main.c
@@ -138,7 +138,7 @@ static gboolean parse_debug(const char *key, const char *value,
 	return TRUE;
 }
 
-static GOptionEntry options[] = {
+static const GOptionEntry options[] = {
 	{ "debug", 'd', G_OPTION_FLAG_OPTIONAL_ARG,
 				G_OPTION_ARG_CALLBACK, parse_debug,
 				"Enable debug information output", "DEBUG" },
diff --git a/obexd/src/obex.c b/obexd/src/obex.c
index 526861f40..98d6245a4 100644
--- a/obexd/src/obex.c
+++ b/obexd/src/obex.c
@@ -55,7 +55,7 @@ struct auth_header {
 } __attribute__ ((packed));
 
 /* Possible commands */
-static struct {
+static const struct {
 	int cmd;
 	const char *name;
 } obex_command[] = {

-- 
2.43.0


