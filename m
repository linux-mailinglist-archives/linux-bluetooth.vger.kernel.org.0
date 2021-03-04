Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6E832D3AC
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Mar 2021 13:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237637AbhCDMxI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 4 Mar 2021 07:53:08 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:60967 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237581AbhCDMwu (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 4 Mar 2021 07:52:50 -0500
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 1EFBA3BAE16
        for <linux-bluetooth@vger.kernel.org>; Thu,  4 Mar 2021 12:50:03 +0000 (UTC)
X-Originating-IP: 78.199.60.242
Received: from classic.redhat.com (unknown [78.199.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id BF756FF805
        for <linux-bluetooth@vger.kernel.org>; Thu,  4 Mar 2021 12:48:51 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 1/3] build: Add warnings for non-literal strings
Date:   Thu,  4 Mar 2021 13:48:49 +0100
Message-Id: <20210304124851.219154-1-hadess@hadess.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

---
 acinclude.m4 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/acinclude.m4 b/acinclude.m4
index 529848357..6ae34b8ae 100644
--- a/acinclude.m4
+++ b/acinclude.m4
@@ -21,7 +21,7 @@ AC_DEFUN([COMPILER_FLAGS], [
 		with_cflags="$with_cflags -Wredundant-decls"
 		with_cflags="$with_cflags -Wcast-align"
 		with_cflags="$with_cflags -Wswitch-enum"
-		with_cflags="$with_cflags -Wformat -Wformat-security"
+		with_cflags="$with_cflags -Wformat -Wformat-security -Wformat-nonliteral"
 		with_cflags="$with_cflags -DG_DISABLE_DEPRECATED"
 		with_cflags="$with_cflags -DGLIB_VERSION_MIN_REQUIRED=GLIB_VERSION_2_28"
 		with_cflags="$with_cflags -DGLIB_VERSION_MAX_ALLOWED=GLIB_VERSION_2_32"
-- 
2.29.2

