Return-Path: <linux-bluetooth+bounces-30-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB71D7E5AFF
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Nov 2023 17:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A55A92813D3
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Nov 2023 16:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5732F3158E;
	Wed,  8 Nov 2023 16:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49EB30D0C
	for <linux-bluetooth@vger.kernel.org>; Wed,  8 Nov 2023 16:20:03 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4285EC6
	for <linux-bluetooth@vger.kernel.org>; Wed,  8 Nov 2023 08:20:03 -0800 (PST)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4SQVfh6DMlz9sT1;
	Wed,  8 Nov 2023 17:19:56 +0100 (CET)
From: =?UTF-8?q?Jonas=20Dre=C3=9Fler?= <verdre@v0yd.nl>
To: linux-bluetooth@vger.kernel.org
Cc: =?UTF-8?q?Jonas=20Dre=C3=9Fler?= <verdre@v0yd.nl>
Subject: [PATCH BlueZ] client: Invalidate scan filter on "scan" command
Date: Wed,  8 Nov 2023 17:19:49 +0100
Message-ID: <20231108161949.11276-1-verdre@v0yd.nl>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "scan bredr" and "scan le" commands are broken right now because the
transport filter gets set, but not actually invalidated.

Invalidate the filter with `filter.set = false` so that it actually gets
updated when set_discovery_filter() is called afterwards.
---
 client/main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/client/main.c b/client/main.c
index 88b5d5d0c..51d08a67a 100644
--- a/client/main.c
+++ b/client/main.c
@@ -1325,9 +1325,14 @@ static void cmd_scan(int argc, char *argv[])
 		return bt_shell_noninteractive_quit(EXIT_FAILURE);
 
 	if (enable == TRUE) {
-		if (strcmp(mode, "")) {
+		if (!g_strcmp0(mode, "")) {
+			g_free(filter.transport);
+			filter.transport = NULL;
+			filter.set = false;
+		} else {
 			g_free(filter.transport);
 			filter.transport = g_strdup(mode);
+			filter.set = false;
 		}
 
 		set_discovery_filter(false);
-- 
2.41.0


