Return-Path: <linux-bluetooth+bounces-1328-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D49B83B5B8
	for <lists+linux-bluetooth@lfdr.de>; Thu, 25 Jan 2024 00:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 015CCB2400D
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Jan 2024 23:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E647137C49;
	Wed, 24 Jan 2024 23:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dS++qjCJ"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0573B13666A
	for <linux-bluetooth@vger.kernel.org>; Wed, 24 Jan 2024 23:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706139867; cv=none; b=m1kpieNoKPn+sqIP8ECXXQ1b2Eisq03j6gVaMvLmfO8kjvp1KWmEIeMOUIRkdGj8yThBrNFd/+IF2tbRMUipn0dwvGq0XFciX/e8/CJRIggVHnaptirZwiJIEEFKa/QE8pyOhTafO2uf6HzlAUNMuzg8DDg68DfX6CeHHozNg5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706139867; c=relaxed/simple;
	bh=egRzPvAAn5fsZb8GyFjjj6XvqI/5ax2IAHO4XlPq0F4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hQ2K7aRW83rgwrT8joWTRMyVkaUciPRu9dhyUctXkV00Q5DBFXefQXllhLIPuprT6oRGr4VyJxbmhnxwQKF8XaCP9gje4pGj1wkdpEDYthFTxJMP1enZKVYw1qd6ZRFZohhLL1aoyanZZEZh7iklSJHz2duNRgLcn3XSExGejMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dS++qjCJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FB10C433B2;
	Wed, 24 Jan 2024 23:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706139866;
	bh=egRzPvAAn5fsZb8GyFjjj6XvqI/5ax2IAHO4XlPq0F4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dS++qjCJZOATh96dndmIFJtlmCQqnp5sTheAkFmp2Nwqb+iLgJ1MCcaHEVXTuOrJl
	 hOZ5pN+I5pcpzv2Xv6WefyuBT9tNcNB9m4FaeXKJKX1chzGLOdTpav01zTH6LU2hgc
	 EyFmoZ+CnEzgqJLHy4lFQgZScqB2fWPbLkxFoZqB6bcSVmmgbfGSySpa7mFwz7dMOE
	 Mu2ZR+jJN8LjF4GQhPmjFAV4nAdz3lus0s4xE+WzT8wGsv6FCBoFpx2FkP00MQU1dX
	 DN7ZeH6xvQhxDl/obvm3iiQ5qcy+NUMFaV4DNr4S4EPzKzfDNzqeAVNlmtudc7QGJS
	 GfktiRxzKJEJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD2FC46CD2;
	Wed, 24 Jan 2024 23:44:26 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Wed, 24 Jan 2024 23:44:01 +0000
Subject: [PATCH BlueZ 7/9] obex: remove unused mas/messages-tracker impl
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240124-disto-patches-v1-7-97e0eb5625a3@gmail.com>
References: <20240124-disto-patches-v1-0-97e0eb5625a3@gmail.com>
In-Reply-To: <20240124-disto-patches-v1-0-97e0eb5625a3@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Emil Velikov <emil.velikov@collabora.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706139864; l=8063;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=jQe/lFTSKdtDkClg+0iy9yWYeYhpYU0PJHv9DcVITWQ=;
 b=vB5YBLuRAOwPN7DYRWO5hFvQKmE38vJnq8aEYBMf4efFIH71alQZmTXx22HZvc17xoCma8GaH
 js5ysW0wEOUDIZfQDzGEm620xXEwVF/ZZB0W9n1h0vfka5GtTS395U8
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.velikov@collabora.com>

Currently we have a "dummy" and a "tracker" implementation. The latter
was seemingly never wired into the build... Unless the git history was
rewritten and details were lost.

Remove the file - it's not shipped in the tarball, so even if anyone
want to use it they cannot.
---
 obexd/plugins/messages-tracker.c | 332 ---------------------------------------
 1 file changed, 332 deletions(-)

diff --git a/obexd/plugins/messages-tracker.c b/obexd/plugins/messages-tracker.c
deleted file mode 100644
index 4ce9f221d..000000000
--- a/obexd/plugins/messages-tracker.c
+++ /dev/null
@@ -1,332 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *
- *  OBEX Server
- *
- *  Copyright (C) 2010-2011  Nokia Corporation
- *
- *
- */
-
-#ifdef HAVE_CONFIG_H
-#include <config.h>
-#endif
-
-#include <errno.h>
-#include <glib.h>
-#include <string.h>
-
-#include "messages.h"
-
-struct message_folder {
-	char *name;
-	GSList *subfolders;
-	char *query;
-};
-
-struct session {
-	char *cwd;
-	struct message_folder *folder;
-	char *name;
-	uint16_t max;
-	uint16_t offset;
-	void *user_data;
-	void (*folder_list_cb)(void *session, int err, uint16_t size,
-					const char *name, void *user_data);
-};
-
-static struct message_folder *folder_tree = NULL;
-
-static struct message_folder *get_folder(const char *folder)
-{
-	GSList *folders = folder_tree->subfolders;
-	struct message_folder *last = NULL;
-	char **path;
-	int i;
-
-	if (g_strcmp0(folder, "/") == 0)
-		return folder_tree;
-
-	path = g_strsplit(folder, "/", 0);
-
-	for (i = 1; path[i] != NULL; i++) {
-		gboolean match_found = FALSE;
-		GSList *l;
-
-		for (l = folders; l != NULL; l = g_slist_next(l)) {
-			struct message_folder *folder = l->data;
-
-			if (g_strcmp0(folder->name, path[i]) == 0) {
-				match_found = TRUE;
-				last = l->data;
-				folders = folder->subfolders;
-				break;
-			}
-		}
-
-		if (!match_found) {
-			g_strfreev(path);
-			return NULL;
-		}
-	}
-
-	g_strfreev(path);
-
-	return last;
-}
-
-static struct message_folder *create_folder(const char *name, const char *query)
-{
-	struct message_folder *folder = g_new0(struct message_folder, 1);
-
-	folder->name = g_strdup(name);
-	folder->query = g_strdup(query);
-
-	return folder;
-}
-
-static void destroy_folder_tree(void *root)
-{
-	struct message_folder *folder = root;
-	GSList *tmp, *next;
-
-	if (folder == NULL)
-		return;
-
-	g_free(folder->name);
-	g_free(folder->query);
-
-	tmp = folder->subfolders;
-	while (tmp != NULL) {
-		next = g_slist_next(tmp);
-		destroy_folder_tree(tmp->data);
-		tmp = next;
-	}
-
-	g_slist_free(folder->subfolders);
-	g_free(folder);
-}
-
-static void create_folder_tree(void)
-{
-	struct message_folder *parent, *child;
-
-	folder_tree = create_folder("/", "FILTER (!BOUND(?msg))");
-
-	parent = create_folder("telecom", "FILTER (!BOUND(?msg))");
-	folder_tree->subfolders = g_slist_append(folder_tree->subfolders,
-								parent);
-
-	child = create_folder("msg", "FILTER (!BOUND(?msg))");
-	parent->subfolders = g_slist_append(parent->subfolders, child);
-
-	parent = child;
-
-	child = create_folder("inbox", "?msg nmo:isSent \"false\" ; "
-				"nmo:isDeleted \"false\" ; "
-				"nmo:isDraft \"false\". ");
-	parent->subfolders = g_slist_append(parent->subfolders, child);
-
-	child = create_folder("sent", "?msg nmo:isDeleted \"false\" ; "
-				"nmo:isSent \"true\" . ");
-	parent->subfolders = g_slist_append(parent->subfolders, child);
-
-	child = create_folder("deleted", "?msg nmo:isDeleted \"true\" . ");
-	parent->subfolders = g_slist_append(parent->subfolders, child);
-}
-
-int messages_init(void)
-{
-	create_folder_tree();
-
-	return 0;
-}
-
-void messages_exit(void)
-{
-	destroy_folder_tree(folder_tree);
-}
-
-int messages_connect(void **s)
-{
-	struct session *session = g_new0(struct session, 1);
-
-	session->cwd = g_strdup("/");
-	session->folder = folder_tree;
-
-	*s = session;
-
-	return 0;
-}
-
-void messages_disconnect(void *s)
-{
-	struct session *session = s;
-
-	g_free(session->cwd);
-	g_free(session);
-}
-
-int messages_set_notification_registration(void *session,
-		void (*send_event)(void *session,
-			const struct messages_event *event, void *user_data),
-		void *user_data)
-{
-	return -ENOSYS;
-}
-
-int messages_set_folder(void *s, const char *name, gboolean cdup)
-{
-	struct session *session = s;
-	char *newrel = NULL;
-	char *newabs;
-	char *tmp;
-
-	if (name && (strchr(name, '/') || strcmp(name, "..") == 0))
-		return -EBADR;
-
-	if (cdup) {
-		if (session->cwd[0] == 0)
-			return -ENOENT;
-
-		newrel = g_path_get_dirname(session->cwd);
-
-		/* We use empty string for indication of the root directory */
-		if (newrel[0] == '.' && newrel[1] == 0)
-			newrel[0] = 0;
-	}
-
-	tmp = newrel;
-	if (!cdup && (!name || name[0] == 0))
-		newrel = g_strdup("");
-	else
-		newrel = g_build_filename(newrel ? newrel : session->cwd, name,
-									NULL);
-	g_free(tmp);
-
-	if (newrel[0] != '/')
-		newabs = g_build_filename("/", newrel, NULL);
-	else
-		newabs = g_strdup(newrel);
-
-	session->folder = get_folder(newabs);
-	if (session->folder == NULL) {
-		g_free(newrel);
-		g_free(newabs);
-
-		return -ENOENT;
-	}
-
-	g_free(newrel);
-	g_free(session->cwd);
-	session->cwd = newabs;
-
-	return 0;
-}
-
-static gboolean async_get_folder_listing(void *s)
-{
-	struct session *session = s;
-	gboolean count = FALSE;
-	int folder_count = 0;
-	char *path = NULL;
-	struct message_folder *folder;
-	GSList *dir;
-
-	if (session->name && strchr(session->name, '/') != NULL)
-		goto done;
-
-	path = g_build_filename(session->cwd, session->name, NULL);
-
-	if (path == NULL || strlen(path) == 0)
-		goto done;
-
-	folder = get_folder(path);
-
-	if (folder == NULL)
-		goto done;
-
-	if (session->max == 0) {
-		session->max = 0xffff;
-		session->offset = 0;
-		count = TRUE;
-	}
-
-	for (dir = folder->subfolders; dir &&
-				(folder_count - session->offset) < session->max;
-				folder_count++, dir = g_slist_next(dir)) {
-		struct message_folder *dir_data = dir->data;
-
-		if (count == FALSE && session->offset <= folder_count)
-			session->folder_list_cb(session, -EAGAIN, 0,
-					dir_data->name, session->user_data);
-	}
-
- done:
-	session->folder_list_cb(session, 0, folder_count, NULL,
-							session->user_data);
-
-	g_free(path);
-	g_free(session->name);
-
-	return FALSE;
-}
-
-int messages_get_folder_listing(void *s, const char *name,
-					uint16_t max, uint16_t offset,
-					messages_folder_listing_cb callback,
-					void *user_data)
-{
-	struct session *session = s;
-	session->name = g_strdup(name);
-	session->max = max;
-	session->offset = offset;
-	session->folder_list_cb = callback;
-	session->user_data = user_data;
-
-	g_idle_add_full(G_PRIORITY_DEFAULT_IDLE, async_get_folder_listing,
-						session, NULL);
-
-	return 0;
-}
-
-int messages_get_messages_listing(void *session, const char *name,
-				uint16_t max, uint16_t offset,
-				uint8_t subject_len,
-				const struct messages_filter *filter,
-				messages_get_messages_listing_cb callback,
-				void *user_data)
-{
-	return -ENOSYS;
-}
-
-int messages_get_message(void *session, const char *handle,
-				unsigned long flags,
-				messages_get_message_cb callback,
-				void *user_data)
-{
-	return -ENOSYS;
-}
-
-int messages_update_inbox(void *session, messages_status_cb callback,
-							void *user_data)
-{
-	return -ENOSYS;
-}
-
-int messages_set_read(void *session, const char *handle, uint8_t value,
-				messages_status_cb callback, void *user_data)
-{
-	return -ENOSYS;
-}
-
-int messages_set_delete(void *session, const char *handle, uint8_t value,
-					messages_status_cb callback,
-					void *user_data)
-{
-	return -ENOSYS;
-}
-
-void messages_abort(void *session)
-{
-}

-- 
2.43.0


