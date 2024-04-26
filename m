Return-Path: <linux-bluetooth+bounces-4109-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 655188B3847
	for <lists+linux-bluetooth@lfdr.de>; Fri, 26 Apr 2024 15:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 198B7283AA5
	for <lists+linux-bluetooth@lfdr.de>; Fri, 26 Apr 2024 13:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4A71474A1;
	Fri, 26 Apr 2024 13:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="llrEkyHh"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D161F146D5A
	for <linux-bluetooth@vger.kernel.org>; Fri, 26 Apr 2024 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714137832; cv=none; b=XaCskO7UtUby16lnvar/xZuB8ogK+6bsidT6AQwlWhcPIzLclDDqTCCnX2njtmJffZuGdmjURWUziwvHWf3o+RHXWd91bp+cICyYLJkTJndHOmLlNYDOgX5y2oTzgnMdWIv6/0quu8UieBEeJnVab1BT6dYRlGoQzyyY82VYpxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714137832; c=relaxed/simple;
	bh=JCEMbbhrBwxO38ivJV2Hu+xMSiT1Kw4gBXX683tGnCU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type; b=d9RM2BQ9b5aaMZW1AOzGPyD1L4ben5cyz05+iVCeKrda4sBfmQ7b+Km94CvaB7JutfgNXmognOFalAnplPReUb9aqEho/kihQBD5EjYnsLd7piIxMpmy+vSPPHDO/eMLHRH6wlU2CEqV833HN8/qnppvRks/mcV1Alacjtrw9+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=llrEkyHh; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714137828;
	bh=JCEMbbhrBwxO38ivJV2Hu+xMSiT1Kw4gBXX683tGnCU=;
	h=From:To:Subject:Date:From;
	b=llrEkyHhAWnNfLfC2Jp5aEJMcyqveY2AJ+ATc8UV8Xn4EqviNrzDfNkSzyz/QZYYK
	 GCxePH/LjzS66SWeFMq6J/3OC922fiNiqTUVDGwFSa4mh9XY8x9P4cDLQ8Erx04tgZ
	 lNhH7ZqVmY8MCgxprWhvc46i6REs1qMeBuOOPKUEYHdskgaoS+TrrBHmlhcm5NyE2w
	 izluJ+lWza6UP+mjl7iqAQUikZj/H9fC6wUQjTlWkgHpSpFoNOgDU1reFLoN4z6MUP
	 wOqUUO1dkwCsfUx59YUhYSQY0d71vNZDoUFXJzTjKVWe/YEVv4VXIAI2TGYpgtnYNw
	 XjaBgHHD6L4Qg==
Received: from fdanis-XPS-13-9370.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: fdanis)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DA5A137813A4
	for <linux-bluetooth@vger.kernel.org>; Fri, 26 Apr 2024 13:23:47 +0000 (UTC)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= <frederic.danis@collabora.com>
To: linux-bluetooth@vger.kernel.org
Subject: [RFC PATCH BlueZ] plugins: Add new plugin to manage wake policy
Date: Fri, 26 Apr 2024 15:23:42 +0200
Message-Id: <20240426132342.732682-1-frederic.danis@collabora.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

By default all class of devices providing the correct service (HID, HoG)
are allowed to wake up the host.
This plugin allows to choose which class of devices are allowed or not to
do it.

E.g. only the Peripheral class, or more specifically the Peripheral
Joystick and Gamepad devices, could be allowed but not the other type of
devices like e.g. the headsets.
For the first case, all Major classes in /etc/bluetooth/wake-policy.conf
except Peripheral should be uncommented and set to 'false', while for the
second case Peripheral should also be uncommented and set to '01;02'.
---

I send this as an RFC as I'm not sure creating a wake policy plugin is the
correct way to get it merged upstream.

Could it be better to move the device_set_wake_support() call from
profiles/input/{device,hog}.c files to src/device.c:device_svc_resolved()
which could perform Service and Class of Device checks?

Any advice much appreciated.

 Makefile.plugins         |   4 +
 plugins/wake-policy.c    | 180 +++++++++++++++++++++++++++++++++++++++
 plugins/wake-policy.conf |  21 +++++
 src/device.c             |   2 +-
 src/device.h             |   1 +
 5 files changed, 207 insertions(+), 1 deletion(-)
 create mode 100644 plugins/wake-policy.c
 create mode 100644 plugins/wake-policy.conf

diff --git a/Makefile.plugins b/Makefile.plugins
index 4aa2c9c92..fbd4e4155 100644
--- a/Makefile.plugins
+++ b/Makefile.plugins
@@ -11,6 +11,10 @@ builtin_sources += plugins/autopair.c
 builtin_modules += policy
 builtin_sources += plugins/policy.c
 
+builtin_modules += wake_policy
+builtin_sources += plugins/wake-policy.c
+EXTRA_DIST += plugins/wake-policy.conf
+
 if ADMIN
 builtin_modules += admin
 builtin_sources += plugins/admin.c
diff --git a/plugins/wake-policy.c b/plugins/wake-policy.c
new file mode 100644
index 000000000..34e77c615
--- /dev/null
+++ b/plugins/wake-policy.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *
+ *  BlueZ - Bluetooth protocol stack for Linux
+ *
+ *  Copyright (C) 2024 Frédéric Danis <frederic.danis@collabora.com>
+ *
+ *
+ */
+
+#ifdef HAVE_CONFIG_H
+#include <config.h>
+#endif
+
+#include <stdbool.h>
+
+#include <glib.h>
+
+#include "bluetooth/bluetooth.h"
+
+#include "src/plugin.h"
+#include "src/adapter.h"
+#include "src/device.h"
+#include "src/log.h"
+#include "src/textfile.h"
+
+static GKeyFile * key_file;
+
+static gboolean is_allowed_to_wake(const char *major, guint minor)
+{
+	guint *minor_list;
+	gsize length;
+	gboolean allowed = false;
+	GError *gerr = NULL;
+
+	if (!g_key_file_has_key(key_file, "WakeAllowed", major, NULL))
+		return true;
+
+	allowed = g_key_file_get_boolean(key_file, "WakeAllowed", major, &gerr);
+	if (!gerr)
+		return allowed;
+
+	g_error_free(gerr);
+	gerr = NULL;
+
+	minor_list = (guint *)g_key_file_get_integer_list(key_file,
+						"WakeAllowed",
+						major, &length, &gerr);
+	if (gerr) {
+		DBG("Failed to get allowed minor list for %s", major);
+		return false;
+	}
+
+	for (gsize i = 0; i < length; i++) {
+		if (minor_list[i] == minor) {
+			allowed = true;
+			break;
+		}
+	}
+
+	return allowed;
+}
+
+static const struct {
+	uint8_t val;
+	const char *str;
+} major_class_table[] = {
+	{ 0x00, "Miscellaneous"	},
+	{ 0x01, "Computer"	},
+	{ 0x02, "Phone"		},
+	{ 0x03, "LAN/Network"	},
+	{ 0x04, "Audio/Video"	},
+	{ 0x05, "Peripheral"	},
+	{ 0x06, "Imaging"	},
+	{ 0x07, "Wearable"	},
+	{ 0x08, "Toy"		},
+	{ 0x09, "Health"	},
+	{ 0x1f, "Uncategorized"	},
+	{ }
+};
+
+static gboolean is_class_allowed_to_wake(uint32_t class)
+{
+	uint8_t major = (class & 0x1f00) >> 8;
+	uint8_t minor = (class & 0x00fc) >> 2;
+
+	if ((major >= 0x01 && major <= 0x09) || major == 0x1f)
+		return is_allowed_to_wake(major_class_table[major].str, minor);
+
+	return true;
+}
+
+static void wake_policy_device_resolved(struct btd_adapter *adapter,
+				     struct btd_device *device)
+{
+	char *filename;
+	GKeyFile *device_key_file;
+	GError *gerr = NULL;
+
+	if (key_file == NULL)
+		return;
+
+	// Does device support to wake the host?
+	if (!device_get_wake_support(device))
+		return;
+
+	// Check if WakeAllowed has already been stored,
+	// if yes do not change it
+	filename = btd_device_get_storage_path(device, "info");
+	device_key_file = g_key_file_new();
+	if (!g_key_file_load_from_file(device_key_file, filename, 0, &gerr)) {
+		error("Unable to load key file from %s: (%s)", filename,
+							gerr->message);
+		g_clear_error(&gerr);
+	} else {
+		if (g_key_file_has_key(device_key_file, "General",
+					"WakeAllowed", NULL)) {
+			DBG("%s WakeAllowed already stored",
+				device_get_path(device));
+			return;
+		}
+	}
+	g_key_file_free(device_key_file);
+	g_free(filename);
+
+	// Check if Class of Device is allowed to wake up the host
+	if (!is_class_allowed_to_wake(btd_device_get_class(device))) {
+		DBG("%s Force WakeAllowed to false", device_get_path(device));
+		device_set_wake_override(device, false);
+		device_set_wake_allowed(device, false, -1U);
+	}
+}
+
+static int wake_policy_probe(struct btd_adapter *adapter)
+{
+	GError *gerr = NULL;
+
+	DBG("");
+	key_file = g_key_file_new();
+	if (!g_key_file_load_from_file(key_file,
+					CONFIGDIR "/wake-policy.conf",
+					0,
+					&gerr)) {
+		error("Unable to load key file from %s: (%s)",
+			CONFIGDIR "/wake-policy.conf",
+			gerr->message);
+		g_clear_error(&gerr);
+		g_key_file_free(key_file);
+		key_file = NULL;
+	}
+
+	return 0;
+}
+
+static void wake_policy_remove(struct btd_adapter *adapter)
+{
+	DBG("");
+	if (key_file)
+		g_key_file_free(key_file);
+}
+
+static struct btd_adapter_driver wake_policy_driver = {
+	.name	= "wake-policy",
+	.probe	= wake_policy_probe,
+	.remove	= wake_policy_remove,
+	.device_resolved = wake_policy_device_resolved,
+};
+
+static int wake_policy_init(void)
+{
+	return btd_register_adapter_driver(&wake_policy_driver);
+}
+
+static void wake_policy_exit(void)
+{
+	btd_unregister_adapter_driver(&wake_policy_driver);
+}
+
+BLUETOOTH_PLUGIN_DEFINE(wake_policy, VERSION, BLUETOOTH_PLUGIN_PRIORITY_LOW,
+			wake_policy_init, wake_policy_exit)
diff --git a/plugins/wake-policy.conf b/plugins/wake-policy.conf
new file mode 100644
index 000000000..e6220bad1
--- /dev/null
+++ b/plugins/wake-policy.conf
@@ -0,0 +1,21 @@
+[WakeAllowed]
+# By default each Class of Devices providing the correct service (HID, HoG) is
+# allowed to wake up the host.
+# The following values are used to control the default WakeAllowed value based
+# on the Class of Device.
+# It is still possible for the user to override the WakeAllowed value per
+# device afterwards.
+#
+# Possible values for each Major Class:
+# true,false,<Minor Class allowed list (integer separated by ;)>
+
+#Computer=true
+#Phone=true
+#LAN/Network=true
+#Audio/Video=true
+#Peripheral=true
+#Imaging=true
+#Wearable=true
+#Toy=true
+#Health=true
+#Uncategorized=true
diff --git a/src/device.c b/src/device.c
index 1d4b8ab36..d970745f5 100644
--- a/src/device.c
+++ b/src/device.c
@@ -1500,7 +1500,7 @@ dev_property_advertising_data_exist(const GDBusPropertyTable *property,
 	return bt_ad_has_data(device->ad, NULL);
 }
 
-static bool device_get_wake_support(struct btd_device *device)
+bool device_get_wake_support(struct btd_device *device)
 {
 	return device->wake_support;
 }
diff --git a/src/device.h b/src/device.h
index 5722ca9ca..f8c744baf 100644
--- a/src/device.h
+++ b/src/device.h
@@ -149,6 +149,7 @@ void device_set_wake_support(struct btd_device *device, bool wake_support);
 void device_set_wake_override(struct btd_device *device, bool wake_override);
 void device_set_wake_allowed(struct btd_device *device, bool wake_allowed,
 			     guint32 id);
+bool device_get_wake_support(struct btd_device *device);
 void device_set_refresh_discovery(struct btd_device *dev, bool refresh);
 
 typedef void (*disconnect_watch) (struct btd_device *device, gboolean removal,
-- 
2.34.1


