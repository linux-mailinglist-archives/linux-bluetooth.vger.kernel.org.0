Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73D776FE8B0
	for <lists+linux-bluetooth@lfdr.de>; Thu, 11 May 2023 02:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236284AbjEKAaj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 10 May 2023 20:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235579AbjEKAah (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 10 May 2023 20:30:37 -0400
Received: from out-56.mta1.migadu.com (out-56.mta1.migadu.com [95.215.58.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 055381BE9
        for <linux-bluetooth@vger.kernel.org>; Wed, 10 May 2023 17:30:34 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ayaya.dev; s=key1;
        t=1683764592;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=/8sy2kY4/g0x4D4nPXyzPG63+I6YAM4Ar+nfcmTS1KE=;
        b=vePx4ftw3B+0fBQHK+5V44pKQMdWEgPVHfKL+GIq9VCWZAfRbBp+OX25DgwCHkYL0q2TfW
        KWfKwISzZ+UqncYlDFbG+sGwtbD+q4ERvuUSIT8JB0AFeadR/WmSv90ZK+w2GLOBwnUeyf
        DsDrVp//VU64XPnvxFh5V/Kldx9BvF8=
From:   psykose <alice@ayaya.dev>
To:     linux-bluetooth@vger.kernel.org
Cc:     alice@ayaya.dev
Subject: [PATCH BlueZ 1/3] build: set _FILE_OFFSET_BITS and _TIME_BITS to 64 universally
Date:   Thu, 11 May 2023 02:22:50 +0200
Message-Id: <20230511002252.30868-1-alice@ayaya.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

these are required to make glibc set off_t and time_t to 64-bit wide
types on 32-bit platforms, for large-file-support and 2k38 proofing.

Signed-off-by: psykose <alice@ayaya.dev>
---
 Makefile.am    | 1 +
 Makefile.obexd | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile.am b/Makefile.am
index 48f0cefa7..97825a720 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -27,6 +27,7 @@ pkginclude_HEADERS =
 AM_CFLAGS = $(MISC_CFLAGS) $(WARNING_CFLAGS) $(UDEV_CFLAGS) $(LIBEBOOK_CFLAGS) \
 				$(LIBEDATASERVER_CFLAGS) $(ell_cflags)
 AM_LDFLAGS = $(MISC_LDFLAGS)
+AM_CPPFLAGS += -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64
 
 confdir = $(sysconfdir)/bluetooth
 statedir = $(localstatedir)/lib/bluetooth
diff --git a/Makefile.obexd b/Makefile.obexd
index 5d1a4ff65..f4abbb3e5 100644
--- a/Makefile.obexd
+++ b/Makefile.obexd
@@ -91,7 +91,6 @@ obexd_src_obexd_LDFLAGS = $(AM_LDFLAGS) -Wl,--export-dynamic
 obexd_src_obexd_CPPFLAGS = $(AM_CPPFLAGS) $(GLIB_CFLAGS) $(DBUS_CFLAGS) \
 				$(ICAL_CFLAGS) -DOBEX_PLUGIN_BUILTIN \
 				-DPLUGINDIR=\""$(obex_plugindir)"\" \
-				-D_FILE_OFFSET_BITS=64 \
 				-I$(builddir)/lib -I$(builddir)/obexd/src
 
 obexd_src_obexd_CFLAGS = $(AM_CFLAGS) -fPIC
-- 
2.40.1

