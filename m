Return-Path: <linux-bluetooth+bounces-7387-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D6D97CC98
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Sep 2024 18:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F349285ED9
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Sep 2024 16:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D52E1A01B0;
	Thu, 19 Sep 2024 16:43:13 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0184C3B1B5
	for <linux-bluetooth@vger.kernel.org>; Thu, 19 Sep 2024 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.189.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726764192; cv=none; b=FrJIIpOKdk9feUDNI5tw/46g+9mRPLw04Z8lhjyidNWo3uDIX4lEGhoN1Y0tcWDSeNn/339I+GJiPtJ4IEE8TbCsYFtHiAA7c8HCyrjULaY3sHdjMiq2EZb+KP2NsAWeeAZ2F5NqlQX197qCLJleaDOZKXtt9kNbvFVAxQeghtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726764192; c=relaxed/simple;
	bh=jTI7SKA9LIPcYsw6Y7nZjNKjIy3yQXtWEMAN1Y7B1dA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=suHrQYzIyMgfhDvWhkC1eDeZ+eHNC5VyRZzqYBxf7JHhRAo7wsmJKXB30jnGctvpLzrwzFxPRFo4/jmb7XwyiWQP+bMeJ/qwYYls087kVnDXPsRk04EHCLW1Ny3grjgwnbe8xiDo9RxLA75I/jyXzaztzo7k26iHy/OTQqCn6Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iodev.co.uk; spf=pass smtp.mailfrom=iodev.co.uk; arc=none smtp.client-ip=46.30.189.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iodev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iodev.co.uk
Received: from localhost (unknown [83.68.141.146])
	by iodev.co.uk (Postfix) with ESMTPSA id 6DEAE349BCC;
	Thu, 19 Sep 2024 18:43:08 +0200 (CEST)
From: Ismael Luceno <ismael@iodev.co.uk>
To: linux-bluetooth@vger.kernel.org
Cc: Ismael Luceno <ismael@iodev.co.uk>
Subject: [PATCH v4] Replace the usage of non-standard GNU-basename with strrchr
Date: Thu, 19 Sep 2024 18:43:02 +0200
Message-ID: <20240919164306.9664-2-ismael@iodev.co.uk>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes build against musl libc, since it doesn't provide a GNU-compatible
implementation of basename.

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---

Notes:
    Changes since v3:
    - Fixed whitespace error
    
    Changes since v2:
    - Fixed style complaint from checkpatch.pl
    
    Changes since v1:
    - Fixed missing parameter at mesh/rpl.c:150

 mesh/mesh-config-json.c | 4 +++-
 mesh/rpl.c              | 4 +++-
 tools/hex2hcd.c         | 7 ++++++-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/mesh/mesh-config-json.c b/mesh/mesh-config-json.c
index a17a48b6d11f..49b9d01a7ef4 100644
--- a/mesh/mesh-config-json.c
+++ b/mesh/mesh-config-json.c
@@ -2708,7 +2708,9 @@ void mesh_config_destroy_nvm(struct mesh_config *cfg)
 	if (!hex2str(cfg->uuid, 16, uuid, sizeof(uuid)))
 		return;
 
-	node_name = basename(node_dir);
+	node_name = strrchr(node_dir, '/');
+	if (!node_name++)
+		node_name = node_dir;
 
 	/* Make sure path name of node follows expected guidelines */
 	if (strcmp(node_name, uuid))
diff --git a/mesh/rpl.c b/mesh/rpl.c
index 2fa17d72f6cb..1c58703eae4e 100644
--- a/mesh/rpl.c
+++ b/mesh/rpl.c
@@ -147,7 +147,9 @@ static void get_entries(const char *iv_path, struct l_queue *rpl_list)
 	if (!dir)
 		return;
 
-	iv_txt = basename(iv_path);
+	iv_txt = strrchr(iv_path, '/');
+	if (!iv_txt++)
+		iv_txt = iv_path;
 	if (sscanf(iv_txt, "%08x", &iv_index) != 1) {
 		closedir(dir);
 		return;
diff --git a/tools/hex2hcd.c b/tools/hex2hcd.c
index 452ab2beb572..093486a051ab 100644
--- a/tools/hex2hcd.c
+++ b/tools/hex2hcd.c
@@ -303,7 +303,12 @@ static void ver_parse_entry(const char *pathname)
 	}
 
 	if (S_ISREG(st.st_mode)) {
-		ver_parse_file(basename(pathname));
+		const char *bname;
+
+		bname = strrchr(pathname, '/');
+		if (!bname++)
+			bname = pathname;
+		ver_parse_file(bname);
 		goto done;
 	}
 
-- 
2.46.0


