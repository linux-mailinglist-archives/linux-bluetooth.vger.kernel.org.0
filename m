Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8179737EEFE
	for <lists+linux-bluetooth@lfdr.de>; Thu, 13 May 2021 01:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237662AbhELWld (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 12 May 2021 18:41:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25288 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1392199AbhELVgw (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 12 May 2021 17:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620855343;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=ECiZex0mV5Oxaxt6S04kmD8mU2S1vLa1Q2/gouDDESI=;
        b=jExmYDJiYjCAK5JWKk5+o+z2TuqMecET5MOd2GVYt4u3B3btdqhICmifa++p8ZoMvvCvaT
        voD3jFmBxjNWOOh/k63Yb7iswxMj5GDZjE/Y/mSmgogV7lNOFyp0l4q62L5yHbR2sYg4xN
        XYbf54Cfiune3umeEHPP/J0InAlF3tk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-nHaG0abqMEePbTVuzjrcpQ-1; Wed, 12 May 2021 17:35:41 -0400
X-MC-Unique: nHaG0abqMEePbTVuzjrcpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE042801817
        for <linux-bluetooth@vger.kernel.org>; Wed, 12 May 2021 21:35:40 +0000 (UTC)
Received: from ivy-bridge (ovpn-112-130.rdu2.redhat.com [10.10.112.130])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8739719D9F
        for <linux-bluetooth@vger.kernel.org>; Wed, 12 May 2021 21:35:40 +0000 (UTC)
Date:   Wed, 12 May 2021 17:36:07 -0400
From:   Steve Grubb <sgrubb@redhat.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [Bluez PATCH 2/6] Fix leaks in obex
Message-ID: <20210512173607.31b2b63d@ivy-bridge>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org


In filesystem, g_file_get_contents allocates fresh memory. Use it
instead of making a new copy of it. That saves having to free buf
later.

Destination was missed on an error path as is mld.

Signed-off-by: Steve Grubb <sgrubb@redhat.com>
---
 obexd/plugins/filesystem.c     | 2 +-
 obexd/plugins/ftp.c            | 8 ++++++--
 obexd/plugins/messages-dummy.c | 1 +
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/obexd/plugins/filesystem.c b/obexd/plugins/filesystem.c
index 09bff8ad0..44e3cf3d2 100644
--- a/obexd/plugins/filesystem.c
+++ b/obexd/plugins/filesystem.c
@@ -415,7 +415,7 @@ static void *capability_open(const char *name, int oflag, mode_t mode,
 			goto fail;
 		}
 
-		object->buffer = g_string_new(buf);
+		object->buffer = buf;
 
 		if (size)
 			*size = object->buffer->len;
diff --git a/obexd/plugins/ftp.c b/obexd/plugins/ftp.c
index 259bfcae2..4b04bab06 100644
--- a/obexd/plugins/ftp.c
+++ b/obexd/plugins/ftp.c
@@ -386,8 +386,10 @@ static int ftp_copy(struct ftp_session *ftp, const char *name,
 	ret = verify_path(destdir);
 	g_free(destdir);
 
-	if (ret < 0)
+	if (ret < 0) {
+		g_free(destination);
 		return ret;
+	}
 
 	source = g_build_filename(ftp->folder, name, NULL);
 
@@ -424,8 +426,10 @@ static int ftp_move(struct ftp_session *ftp, const char *name,
 	ret = verify_path(destdir);
 	g_free(destdir);
 
-	if (ret < 0)
+	if (ret < 0) {
+		g_free(destination);
 		return ret;
+	}
 
 	source = g_build_filename(ftp->folder, name, NULL);
 
diff --git a/obexd/plugins/messages-dummy.c b/obexd/plugins/messages-dummy.c
index 34199fa05..e37b52df6 100644
--- a/obexd/plugins/messages-dummy.c
+++ b/obexd/plugins/messages-dummy.c
@@ -488,6 +488,7 @@ int messages_get_messages_listing(void *session, const char *name,
 			int err = -errno;
 			DBG("fopen(): %d, %s", -err, strerror(-err));
 			g_free(path);
+			g_free(mld);
 			return -EBADR;
 		}
 	}
-- 
2.31.1

