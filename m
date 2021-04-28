Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B28136D225
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Apr 2021 08:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234587AbhD1GXE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 28 Apr 2021 02:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbhD1GXD (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 28 Apr 2021 02:23:03 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF81BC061574
        for <linux-bluetooth@vger.kernel.org>; Tue, 27 Apr 2021 23:22:17 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id o16so18616961plg.5
        for <linux-bluetooth@vger.kernel.org>; Tue, 27 Apr 2021 23:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vu4Z0KzeydnLpFhPoobK9nuBu5f6pJsJrN2DPTzUCeY=;
        b=IGQ3dt80jDDDPY4cSzUlBUb8PAFHivPdjVwGpf83gFs7rD5MiFty9jvHO3KEU3bJno
         cS+UAHBKqUNd3L9/aZCQ4+gb7Pmk3jjDEvD//aV3LX2bxZIuZBb+f8y4xfUzNwWZ7ZfN
         FuJdnwsSm2EyRrwdelSbLya1I54EBMAfO4s7NtkBUxjNR4kJ/pA3RHpC6woeHQD+wQtN
         69iAQiRtg5U6CnR9Nv4nCQt8qNTTrbg86fMEvMjT84rAZHehvkIsVOeWh7dqCNkiip0y
         +6tMO6gIuSZKaYb7vMV1mekFBLbL+BOvZiXa5EK4h4QijkcFKo3uiaSzMGxwwXDdjPPN
         xQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vu4Z0KzeydnLpFhPoobK9nuBu5f6pJsJrN2DPTzUCeY=;
        b=U+S5XzEcgn+rA7DB7dkh5SM+0zg4+/j7kGOAUbVtaDmk6ZUA0/c+PZqgaIlZtR6IWW
         hGK1DdXPwfGm+pYx1JGH2BaJQZlfGG8cfu1n9LbLYoOz/DuuLyMWXTV1082m8+TXFP4B
         BWK9SrhvnDf7Qq/QAhr0EMsIRiGN8eReqqHYfBAjNpNN9LTQ9SLIDiu7SEP40VXnjvMF
         BaCRiroKzVU/GYycPvk/cVzv7boKUrDAPYeAhy9AvlUxSUIQs8X/LVXJIRfXxcVOkb99
         PPrf0ECva8d+FkL781vIwLGnHFVGzGyIJgzpjiDNtPnRaUP+RbHCC12OXzJJsqwljFhk
         pvnw==
X-Gm-Message-State: AOAM533PfxSvdhGJ2UF2VwGEgtbWex2VGkf6QwwwMTBjV6siMn4yBGVx
        qsn5Dk1SdByUCcUBlYj2XzXq9RN/oI4=
X-Google-Smtp-Source: ABdhPJzJonuwU+C7ic4uiSNpvG69whr3dEvVrNu2oEVjCpiog5bk5Y7PE/gb3yQkpq+8z5gsdT0ilA==
X-Received: by 2002:a17:90a:fa8f:: with SMTP id cu15mr24514584pjb.216.1619590936954;
        Tue, 27 Apr 2021 23:22:16 -0700 (PDT)
Received: from han1-XPS-13-9350.hsd1.or.comcast.net ([2601:1c0:6a01:d830:6e5:bd32:3019:cc30])
        by smtp.gmail.com with ESMTPSA id w140sm4226065pfc.176.2021.04.27.23.22.15
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 23:22:15 -0700 (PDT)
From:   Tedd Ho-Jeong An <hj.tedd.an@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [BlueZ v2] monitor: Update manpage
Date:   Tue, 27 Apr 2021 23:22:14 -0700
Message-Id: <20210428062214.335567-1-hj.tedd.an@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Tedd Ho-Jeong An <tedd.an@intel.com>

This patch updates the manpage for btmon written in rst format.
---
 Makefile.am       |  26 ++++---
 Makefile.tools    |   4 ++
 configure.ac      |   4 ++
 doc/btmon.txt     |  35 ----------
 monitor/btmon.rst | 172 ++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 197 insertions(+), 44 deletions(-)
 delete mode 100644 doc/btmon.txt
 create mode 100644 monitor/btmon.rst

diff --git a/Makefile.am b/Makefile.am
index f98243f72..759110cbd 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -60,6 +60,11 @@ else
 build_plugindir = $(plugindir)
 endif
 
+if MANPAGES
+man_MANS =
+endif
+
+manual_pages = monitor/btmon.1
 
 plugin_LTLIBRARIES =
 
@@ -579,13 +584,7 @@ if LIBRARY
 pkgconfig_DATA = lib/bluez.pc
 endif
 
-manual_pages = doc/btmon.1
-
-if MANPAGES
-dist_noinst_MANS += $(manual_pages)
-endif
-
-EXTRA_DIST += $(manual_pages:.1=.txt)
+EXTRA_DIST += $(manual_pages:.1=.rst)
 
 DISTCHECK_CONFIGURE_FLAGS = --disable-datafiles --enable-library \
 						--enable-health \
@@ -607,11 +606,20 @@ SED_PROCESS = $(AM_V_GEN)$(MKDIR_P) $(dir $@) && \
 		$(SED) -e 's,@pkglibexecdir\@,$(pkglibexecdir),g' \
 		< $< > $@
 
+if RUN_RST2MAN
+RST2MAN_PROCESS = $(AM_V_GEN)$(MKDIR_P) $(dir $@) && \
+			$(RST2MAN) --strict --no-raw \
+			--no-generator --no-datestamp $< $@
+else
+RST2MAN_PROCESS = $(AM_V_GEN)test -f $@ || \
+		{ echo "Generated manual page $@ does not exist"; false; }
+endif
+
 %.service: %.service.in Makefile
 	$(SED_PROCESS)
 
-%.1: %.txt
-	$(AM_V_GEN)a2x --doctype manpage --format manpage $(srcdir)/$<
+%.1: %.rst Makefile
+	$(RST2MAN_PROCESS)
 
 src/builtin.h: src/genbuiltin $(builtin_sources)
 	$(AM_V_GEN)$(srcdir)/src/genbuiltin $(builtin_modules) > $@
diff --git a/Makefile.tools b/Makefile.tools
index 57e858290..9b452aa74 100644
--- a/Makefile.tools
+++ b/Makefile.tools
@@ -49,6 +49,10 @@ monitor_btmon_SOURCES = monitor/main.c monitor/bt.h \
 				monitor/tty.h
 monitor_btmon_LDADD = lib/libbluetooth-internal.la \
 				src/libshared-mainloop.la $(UDEV_LIBS) -ldl
+
+if MANPAGES
+man_MANS += monitor/btmon.1
+endif
 endif
 
 if LOGGER
diff --git a/configure.ac b/configure.ac
index dbd98c9ad..d7e4766e4 100644
--- a/configure.ac
+++ b/configure.ac
@@ -326,7 +326,11 @@ AM_CONDITIONAL(DATAFILES, test "${enable_datafiles}" != "no")
 AC_ARG_ENABLE(manpages, AC_HELP_STRING([--enable-manpages],
 			[enable building of manual pages]),
 					[enable_manpages=${enableval}])
+if (test "${enable_manpages}" != "no"); then
+	AC_CHECK_PROGS(RST2MAN, [rst2man rst2man.py], "no")
+fi
 AM_CONDITIONAL(MANPAGES, test "${enable_manpages}" = "yes")
+AM_CONDITIONAL(RUN_RST2MAN, test "${enable_manpages}" = "yes" && test "${RST2MAN}" != "no")
 
 AC_ARG_ENABLE(testing, AC_HELP_STRING([--enable-testing],
 			[enable testing tools]),
diff --git a/doc/btmon.txt b/doc/btmon.txt
deleted file mode 100644
index 7a7fc537b..000000000
--- a/doc/btmon.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-BTMON(1)
-========
-:doctype: manpage
-
-
-NAME
-----
-btmon - Bluetooth monitor
-
-
-SYNOPSIS
---------
-*btmon* ['OPTIONS']
-
-
-DESCRIPTION
------------
-The btmon(1) command provides access to the Bluetooth subsystem monitor
-infrastructure for reading HCI traces.
-
-
-AUTHOR
-------
-btmon was originally written by Marcel Holtmann.
-
-
-RESOURCES
----------
-See <http://www.bluez.org/>
-
-
-COPYING
--------
-Free use of this software is granted under ther terms of the GNU Lesser
-General Public Licenses (LGPL).
diff --git a/monitor/btmon.rst b/monitor/btmon.rst
new file mode 100644
index 000000000..29d275eb3
--- /dev/null
+++ b/monitor/btmon.rst
@@ -0,0 +1,172 @@
+=====
+btmon
+=====
+
+-----------------
+Bluetooth monitor
+-----------------
+
+:Authors: - Marcel Holtmann <marcel@holtmann.org>
+          - Tedd Ho-Jeong An <tedd.an@intel.com>
+:Copyright: Free use of this software is granted under ther terms of the GNU
+            Lesser General Public Licenses (LGPL).
+:Version: BlueZ
+:Date: April 2021
+:Manual section: 1
+:Manual group: Linux System Administration
+
+SYNOPSYS
+========
+
+**btmon** [*OPTIONS* ...]
+
+DESCRIPTION
+===========
+
+The  btmon(1) command  provides  access  to the Bluetooth subsystem monitor
+infrastructure for reading HCI traces.
+
+OPTIONS
+=======
+
+-r FILE, --read FILE        Read traces in btsnoop format from *FILE*.
+-w FILE, --write FILE       Save traces in btsnoop format to *FILE*.
+-a FILE, --analyze FILE     Analyze traces in btsnoop format from *FILE*.
+                            It displays the devices found in the *FILE* with
+                            its packets by type.
+-s SOCKET, --server SOCKET  Start monitor server socket.
+-p PRIORITY, --priority PRIORITY  Show only priority or lower for user log.
+
+.. list-table::
+   :header-rows: 1
+   :widths: auto
+   :stub-columns: 1
+
+   * - *PRIORITY*
+     - NAME
+
+   * - **3**
+     - Error
+
+   * - **4**
+     - Warning
+
+   * - **6**
+     - Information (Default)
+
+   * - **7**
+     - Debug. **debug** can be used.
+
+-i NUM, --index NUM         Show only specified controller. *hciNUM* is also
+                            acceptable. This is useful to capture the traces
+                            from the specific controller when the multiple
+                            controllers are presented.
+
+-d TTY, --tty TTY           Read data from *TTY*.
+
+-B SPEED, --rate SPEED      Set TTY speed. The default *SPEED* is 115300
+
+-V COMPID, --vendor COMPID  Set the default company identifier. The *COMPID* is
+                            a unique number assigned by the Bluetooth SIG to
+                            a member company and can be found/searched from the
+                            Bluetooth SIG webpage.
+
+                            For example, Intel is 2 and Realtek is 93.
+
+-M, --mgmt                  Open channel for mgmt events.
+
+-t, --time                  Show a time instead of time offset.
+
+-T, --date                  Show a time and date information instead of
+                            time offset.
+
+-S, --sco                   Dump SCO traffic in raw hex format.
+
+-A, --a2dp                  Dump A2DP stream traffic in a raw hex format.
+
+-E IP, --ellisys IP         Send Ellisys HCI Injection.
+
+-P, --no-pager              Disable pager usage while reading the log file.
+
+-J OPTIONS, --jlink OPTIONS     Read data from RTT.  Each options are comma(,)
+                                seprated without spaces.
+
+.. list-table::
+   :header-rows: 1
+   :widths: auto
+   :stub-columns: 1
+
+   * - *OPTIONS*
+     - Description
+
+   * - **DEVICE**
+     - Required. Set the target device.
+
+   * - **SERIALNO**
+     - (Optional) Set the USB serial number. Default is **0**.
+
+   * - **INTERFACE**
+     - (Optional) Target interface. Default is **swd**.
+
+   * - **SPEED**
+     - (Optional) Set target interface speed in kHz. Default is **1000**.
+
+-R OPTIONS, --rtt OPTIONS   RTT control block parameters. Each options are
+                            comma(,) seprated without spaces.
+
+.. list-table::
+   :header-rows: 1
+   :widths: auto
+   :stub-columns: 1
+
+   * - *OPTIONS*
+     - Description
+
+   * - **ADDRESS**
+     - (Optional) Address of RTT buffer. Default is **0x00**
+
+   * - **AREA**
+     - (Optional) Size of range to search in RTT buffer. Default is **0**
+
+   * - **NAME**
+     - (Optional) Buffer name. Default is **btmonitor**
+
+-C WIDTH, --columns WIDTH   Output width if not a terminal
+
+-c MODE, --color MODE       Set output color. The possible *MODE* values are:
+                            **auto|always|never**.
+
+                            Default value is **auto**
+
+-v, --version               Show version
+
+-h, --help                  Show help options
+
+EXAMPLES
+========
+
+Capture the traces from hci0 to hcidump.log file
+------------------------------------------------
+
+.. code-block:: bash
+
+   $ btmon -i hci0 -w hcidump.log
+
+Open the trace file
+-------------------
+
+.. code-block:: bash
+
+   $ btmon -r hcidump.log
+
+
+RESOURCES
+=========
+
+http://www.bluez.org
+
+REPORTING BUGS
+==============
+
+linux-bluetooth@vger.kernel.org
+
-- 
2.25.1

