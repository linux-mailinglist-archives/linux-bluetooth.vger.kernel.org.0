Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60164F09EB
	for <lists+linux-bluetooth@lfdr.de>; Tue,  5 Nov 2019 23:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730449AbfKEW6r (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 5 Nov 2019 17:58:47 -0500
Received: from mga12.intel.com ([192.55.52.136]:61237 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729895AbfKEW6r (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 5 Nov 2019 17:58:47 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Nov 2019 14:58:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; 
   d="scan'208";a="214056220"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.252.204.206])
  by orsmga002.jf.intel.com with ESMTP; 05 Nov 2019 14:58:46 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com
Subject: [PATCH BlueZ] unit: Fixed Mesh Crypto unit test build for LTO
Date:   Tue,  5 Nov 2019 14:58:27 -0800
Message-Id: <20191105225827.20207-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Was erroneously compiling and linking explicit unit test versions of the
ELL source dependancies while also linking with the library made from
same sources. The created Link Time Optimization (LTO) problems when
calling exit(), as there were two copies of the constructors and
destructors from ell/log.c.
---
 Makefile.am | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index 84c9712c9..8d419fb30 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -524,10 +524,8 @@ if MESH
 unit_tests += unit/test-mesh-crypto
 unit_test_mesh_crypto_CPPFLAGS = $(ell_cflags)
 unit_test_mesh_crypto_SOURCES = unit/test-mesh-crypto.c \
-				mesh/crypto.h ell/internal ell/ell.h \
-				$(ell_sources)
-unit_test_mesh_crypto_LDADD = src/libshared-ell.la \
-			$(ell_ldadd)
+				mesh/crypto.h ell/internal ell/ell.h
+unit_test_mesh_crypto_LDADD = $(ell_ldadd)
 endif
 
 if MAINTAINER_MODE
-- 
2.21.0

