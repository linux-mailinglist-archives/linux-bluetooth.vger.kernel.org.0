Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC642D37F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 29 May 2019 03:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbfE2Bwx (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 28 May 2019 21:52:53 -0400
Received: from mga04.intel.com ([192.55.52.120]:44549 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725828AbfE2Bwx (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 28 May 2019 21:52:53 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 May 2019 18:52:52 -0700
X-ExtLoop1: 1
Received: from ingas-nuc1.sea.intel.com ([10.255.231.189])
  by orsmga007.jf.intel.com with ESMTP; 28 May 2019 18:52:52 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 1/2] build: Add support for systemd bluetooth-mesh service
Date:   Tue, 28 May 2019 18:52:50 -0700
Message-Id: <20190529015251.15805-2-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529015251.15805-1-inga.stotland@intel.com>
References: <20190529015251.15805-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This adds support for installing systemd bluetooth-mesh service unit
and dbus service file that references this systemd unit.
---
 Makefile.am                    |  2 +-
 Makefile.mesh                  | 14 ++++++++++++--
 mesh/bluetooth-mesh.service.in | 13 +++++++++++++
 mesh/org.bluez.mesh.service    |  5 +++++
 4 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 mesh/bluetooth-mesh.service.in
 create mode 100644 mesh/org.bluez.mesh.service

diff --git a/Makefile.am b/Makefile.am
index f84a1faba..3f398dc5a 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -560,7 +560,7 @@ SED_PROCESS = $(AM_V_GEN)$(MKDIR_P) $(dir $@) && \
 		$(SED) -e 's,@pkglibexecdir\@,$(pkglibexecdir),g' \
 		< $< > $@
 
-%.service: %.service.in Makefile
+%.service: %.service.in Makefile Makefile.mesh
 	$(SED_PROCESS)
 
 %.1: %.txt
diff --git a/Makefile.mesh b/Makefile.mesh
index d494287ab..9cd6e73d6 100644
--- a/Makefile.mesh
+++ b/Makefile.mesh
@@ -4,6 +4,11 @@ if DATAFILES
 dbus_DATA += mesh/bluetooth-mesh.conf
 endif
 
+if SYSTEMD
+systemdsystemunit_DATA += mesh/bluetooth-mesh.service
+dbussystembus_DATA += mesh/org.bluez.mesh.service
+endif
+
 mesh_sources = mesh/mesh.h mesh/mesh.c \
 				mesh/net-keys.h mesh/net-keys.c \
 				mesh/mesh-io.h mesh/mesh-io.c \
@@ -32,7 +37,12 @@ libexec_PROGRAMS += mesh/bluetooth-meshd
 
 mesh_bluetooth_meshd_SOURCES = $(mesh_sources) mesh/main.c
 mesh_bluetooth_meshd_LDADD = src/libshared-ell.la $(ell_ldadd) -ljson-c
-mesh_bluetooth_meshd_DEPENDENCIES = $(ell_dependencies) src/libshared-ell.la
+mesh_bluetooth_meshd_DEPENDENCIES = $(ell_dependencies) src/libshared-ell.la \
+				mesh/bluetooth-mesh.service
+
+EXTRA_DIST += mesh/bluetooth-mesh.conf mesh/bluetooth-mesh.service.in \
+		mesh/org.bluez.mesh.service
+
+CLEANFILES += mesh/bluetooth-mesh.service
 
-EXTRA_DIST += mesh/bluetooth-mesh.conf
 endif
diff --git a/mesh/bluetooth-mesh.service.in b/mesh/bluetooth-mesh.service.in
new file mode 100644
index 000000000..6e239b618
--- /dev/null
+++ b/mesh/bluetooth-mesh.service.in
@@ -0,0 +1,13 @@
+[Unit]
+Description=Bluetooth mesh service
+ConditionPathIsDirectory=/sys/class/bluetooth
+
+[Service]
+Type=dbus
+BusName=org.bluez.mesh
+ExecStart=@pkglibexecdir@/bluetooth-meshd
+NotifyAccess=main
+LimitNPROC=1
+ProtectHome=true
+ProtectSystem=full
+
diff --git a/mesh/org.bluez.mesh.service b/mesh/org.bluez.mesh.service
new file mode 100644
index 000000000..a61c44455
--- /dev/null
+++ b/mesh/org.bluez.mesh.service
@@ -0,0 +1,5 @@
+[D-BUS Service]
+Name=org.bluez.mesh
+Exec=/bin/false
+User=root
+SystemdService=dbus-org.bluez.mesh.service
-- 
2.21.0

