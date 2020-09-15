Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEB9269A1A
	for <lists+linux-bluetooth@lfdr.de>; Tue, 15 Sep 2020 02:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgIOAF2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 14 Sep 2020 20:05:28 -0400
Received: from mga09.intel.com ([134.134.136.24]:37102 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726117AbgIOAF0 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 14 Sep 2020 20:05:26 -0400
IronPort-SDR: uydYAy0+YbpINgppLvy5ywHMXPCIs9jz2HGmmSIMw4j1GE//pV9fswls8/LJaVcIkO4ravJ0so
 FCcHQCqu0gkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="160112028"
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; 
   d="scan'208";a="160112028"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2020 17:05:24 -0700
IronPort-SDR: o8IiZDfnpY7sSpDRsVDELJrnlq/i5yLD5UUsn2VtqlcWS2d9l279kbAKW+T67z9QOSKHEzv7sd
 3CNSK1t1rc3A==
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; 
   d="scan'208";a="507333141"
Received: from azvasil-mobl.amr.corp.intel.com (HELO han1-mobl3.jf.intel.com) ([10.254.127.225])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2020 17:05:23 -0700
From:   tedd.an@linux.intel.com
To:     linux-bluetooth@vger.kernel.org
Cc:     Tedd Ho-Jeong An <tedd.an@intel.com>
Subject: [BlueZ v3 06/17] gdbus: Add SPDX License Identifier
Date:   Mon, 14 Sep 2020 17:04:46 -0700
Message-Id: <20200915000457.22988-7-tedd.an@linux.intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200915000457.22988-1-tedd.an@linux.intel.com>
References: <20200915000457.22988-1-tedd.an@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Tedd Ho-Jeong An <tedd.an@intel.com>

This patch adds SPDX License Identifier and removes the license text.

-------------------------------------
       License            COUNT
-------------------------------------
 GPL-2.0-or-later     :      6

License: GPL-2.0-or-later
   gdbus/mainloop.c
   gdbus/object.c
   gdbus/polkit.c
   gdbus/client.c
   gdbus/watch.c
   gdbus/gdbus.h
---
 gdbus/client.c   | 15 +--------------
 gdbus/gdbus.h    | 15 +--------------
 gdbus/mainloop.c | 15 +--------------
 gdbus/object.c   | 15 +--------------
 gdbus/polkit.c   | 15 +--------------
 gdbus/watch.c    | 15 +--------------
 6 files changed, 6 insertions(+), 84 deletions(-)

diff --git a/gdbus/client.c b/gdbus/client.c
index 84e076994..3b7faa4e4 100644
--- a/gdbus/client.c
+++ b/gdbus/client.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *
  *  D-Bus helper library
@@ -5,20 +6,6 @@
  *  Copyright (C) 2004-2011  Marcel Holtmann <marcel@holtmann.org>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifdef HAVE_CONFIG_H
diff --git a/gdbus/gdbus.h b/gdbus/gdbus.h
index 9bdff9eba..28b802296 100644
--- a/gdbus/gdbus.h
+++ b/gdbus/gdbus.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *
  *  D-Bus helper library
@@ -5,20 +6,6 @@
  *  Copyright (C) 2004-2011  Marcel Holtmann <marcel@holtmann.org>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifndef __GDBUS_H
diff --git a/gdbus/mainloop.c b/gdbus/mainloop.c
index b90a8447c..a04ebb19b 100644
--- a/gdbus/mainloop.c
+++ b/gdbus/mainloop.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *
  *  D-Bus helper library
@@ -5,20 +6,6 @@
  *  Copyright (C) 2004-2011  Marcel Holtmann <marcel@holtmann.org>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifdef HAVE_CONFIG_H
diff --git a/gdbus/object.c b/gdbus/object.c
index 49b578087..50a8b4ff1 100644
--- a/gdbus/object.c
+++ b/gdbus/object.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *
  *  D-Bus helper library
@@ -5,20 +6,6 @@
  *  Copyright (C) 2004-2011  Marcel Holtmann <marcel@holtmann.org>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifdef HAVE_CONFIG_H
diff --git a/gdbus/polkit.c b/gdbus/polkit.c
index 9e95fa384..80e024fad 100644
--- a/gdbus/polkit.c
+++ b/gdbus/polkit.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *
  *  D-Bus helper library
@@ -5,20 +6,6 @@
  *  Copyright (C) 2004-2011  Marcel Holtmann <marcel@holtmann.org>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifdef HAVE_CONFIG_H
diff --git a/gdbus/watch.c b/gdbus/watch.c
index 447e48671..25f367613 100644
--- a/gdbus/watch.c
+++ b/gdbus/watch.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *
  *  D-Bus helper library
@@ -5,20 +6,6 @@
  *  Copyright (C) 2004-2011  Marcel Holtmann <marcel@holtmann.org>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifdef HAVE_CONFIG_H
-- 
2.25.4

