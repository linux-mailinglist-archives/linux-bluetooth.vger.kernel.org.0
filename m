Return-Path: <linux-bluetooth+bounces-9869-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB63A190AA
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 Jan 2025 12:33:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 921161646D9
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 Jan 2025 11:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1D6211A33;
	Wed, 22 Jan 2025 11:33:07 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8043C653
	for <linux-bluetooth@vger.kernel.org>; Wed, 22 Jan 2025 11:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737545586; cv=none; b=UI+fWeU5K1klSEn8lGiWzXgYGk42IT/tO657fHv/nm7gMBJBexnuEKeQtRhGXIOBkU0E2QSniVNqHMZ41ZhTlx0Fn3OGyiUjHkqos/T5xp7yR8apBG4lzFAw/Ox4yZZaEP+RMSA1A51F9BCg7YPJ9ZYrIlzqkg2djW/43A+hLwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737545586; c=relaxed/simple;
	bh=adwv1cpkz69yCoZ/bwxSSLYFSoDU4xBjiuO34UsKFnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VY7yMfc4Z5Q+t96o1nPTubmUxxMqA4lvDDgVf8Q3TxmJJCdAlprF5B3lYQ8DF09zu3VhE8EvHGtx0lyz80HZxSWrxeQ7pNXUfhnqGPqs/ptEyMEzwiMof7jyTkIIS1UrR5q6vPrfO31uKKwLqDGIySO6m44m/vhzZTL/96ldls0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E1831BF207;
	Wed, 22 Jan 2025 11:32:56 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Cc: Bastien Nocera <hadess@hadess.net>
Subject: [PATCH BlueZ v2 1/2] client: Add client-side error decoding
Date: Wed, 22 Jan 2025 12:31:57 +0100
Message-ID: <20250122113256.1107629-2-hadess@hadess.net>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250122113256.1107629-1-hadess@hadess.net>
References: <20250122113256.1107629-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net

The D-Bus errors returned in a number of cases aren't in human-readable
form, but instead exist as "codes" (listed in src/error.h).

This new function will allow us to convert those to human-readable form.
---
 Makefile.tools |  2 ++
 client/error.c | 36 ++++++++++++++++++++++++++++++++++++
 client/error.h | 11 +++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 client/error.c
 create mode 100644 client/error.h

diff --git a/Makefile.tools b/Makefile.tools
index 0dca43327fdd..41b4b4f0545f 100644
--- a/Makefile.tools
+++ b/Makefile.tools
@@ -10,6 +10,8 @@ client_bluetoothctl_SOURCES = client/main.c \
 					client/advertising.c \
 					client/adv_monitor.h \
 					client/adv_monitor.c \
+					client/error.h \
+					client/error.c \
 					client/gatt.h client/gatt.c \
 					client/admin.h client/admin.c \
 					client/player.h client/player.c \
diff --git a/client/error.c b/client/error.c
new file mode 100644
index 000000000000..975e4030dfc0
--- /dev/null
+++ b/client/error.c
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *
+ *  BlueZ - Bluetooth protocol stack for Linux
+ *
+ *  Copyright (C) 2025 Bastien Nocera <hadess@hadess.net>
+ *
+ *
+ */
+
+#include <stddef.h>
+#include <glib.h>
+#include "error.h"
+
+struct {
+	const char *error_code;
+	const char *str;
+} error_codes[] = {
+	{ "br-connection-profile-unavailable", "Exhausted the list of BR/EDR profiles to connect to" },
+	{ "br-connection-busy", "Cannot connect, connection busy" },
+	{ "br-connection-adapter-not-powered", "Cannot connect, adapter is not powered" },
+};
+
+const char *error_code_to_str(const char *error_code)
+{
+	unsigned int i;
+
+	if (error_code == NULL)
+		return NULL;
+
+	for (i = 0; i < G_N_ELEMENTS(error_codes); i++) {
+		if (g_str_equal(error_codes[i].error_code, error_code))
+			return error_codes[i].str;
+	}
+	return error_code;
+}
diff --git a/client/error.h b/client/error.h
new file mode 100644
index 000000000000..402117f3305b
--- /dev/null
+++ b/client/error.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *
+ *  BlueZ - Bluetooth protocol stack for Linux
+ *
+ *  Copyright (C) 2025 Bastien Nocera <hadess@hadess.net>
+ *
+ *
+ */
+
+const char *error_code_to_str(const char *error_code);
-- 
2.47.1


