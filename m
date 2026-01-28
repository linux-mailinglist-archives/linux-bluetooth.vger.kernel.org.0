Return-Path: <linux-bluetooth+bounces-18625-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id modqEKSKemnd7gEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18625-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 23:16:04 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FE7A9752
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 23:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0416301E7E5
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 22:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D100825782D;
	Wed, 28 Jan 2026 22:15:57 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B338D2BE7BA
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 22:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769638557; cv=none; b=o5gnbSI4gNpWWefryCZV9P9J5cv1sPADkj4UP2g82NHt7jXjwURmaJyfD0igZ0AEaT+oVt41PglTmogKFdkl2P8TMdRRkwt3wGm46wp2JoGlrVk0H42rgeKkEYCsBMpa7GxownJeeT16Oiprvkm8mBeXMmsjcggjVcFiOozhvAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769638557; c=relaxed/simple;
	bh=Bcmb6bAc+0dEy0x/RKsH/kNtWiX7FibkaIZ5fz3fsdE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dlbw7GhTb/1eHy1TLUrXM4BeyHF4MLnFm5HtNSNIh4nGUhg85/nC3e6Oii1J7OxZIBoYgwz7PUAHKs0DF5lOp5Aj0C+RR0Jnr5/5tdhpdJy66V24YhKQO4iseLXrepsN7Aga+UeqWMi+9N2hvDM39w9NJ4yXwNzgPFgxC/qj8CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDE9E44406
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 22:15:46 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v7 08/16] build: Add option to allow disabling bluetoothd
Date: Wed, 28 Jan 2026 23:11:58 +0100
Message-ID: <20260128221536.2319084-9-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128221536.2319084-1-hadess@hadess.net>
References: <20260128221536.2319084-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieeggeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeevhfffgffgjeekueeihfdtffefuefgkefhieehfeevhedtvdejfeevvdfffeefveenucffohhmrghinhepshgvrhhvihgtvgdrihhnnecukfhppedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemlegsvdelmegtugefieemieekfhgumegttdelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemlegsvdelmegtugefieemieekfhgumegttdelfedphhgvlhhopeholhhimhhpihgtpdhmrghilhhfrhhomhephhgruggvshhssehhrgguvghsshdrnhgvthdpqhhiugepueffgfelgfeggeegtdeipdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-State: clean
X-GND-Score: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_FROM(0.00)[bounces-18625-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[hadess.net];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NEQ_ENVFROM(0.00)[hadess@hadess.net,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E5FE7A9752
X-Rspamd-Action: no action

This makes it possible to build, for example, just the library, or the
command-line client, without also building and installing bluetoothd.
---
 doc/meson.build   |   3 +-
 meson.build       |   8 ++-
 meson_options.txt |   1 +
 src/meson.build   | 164 +++++++++++++++++++++++-----------------------
 4 files changed, 92 insertions(+), 84 deletions(-)

diff --git a/doc/meson.build b/doc/meson.build
index d587c03aa0c6..db13911c2e73 100644
--- a/doc/meson.build
+++ b/doc/meson.build
@@ -143,7 +143,8 @@ bluetoothd_rst = configure_file(
   output: 'bluetoothd.rst',
   configuration: man_conf
 )
-if get_option('manpages').enabled()
+
+if get_option('daemon').enabled() and get_option('manpages').enabled()
   custom_target(
     input: bluetoothd_rst,
     output: 'bluetoothd.8',
diff --git a/meson.build b/meson.build
index 099ad5e0dd49..2d4203a02a0b 100644
--- a/meson.build
+++ b/meson.build
@@ -281,8 +281,12 @@ endif
 # Fix permissions on install
 install = find_program('install')
 sh = find_program('sh')
-meson.add_install_script(sh, '-c', 'install -dm755 ${DESTDIR}/' + configdir)
-meson.add_install_script(sh, '-c', 'install -dm700 ${DESTDIR}/' + storagedir)
+if get_option('daemon').enabled()
+  meson.add_install_script(sh, '-c', 'install -dm755 ${DESTDIR}/' + configdir)
+endif
+if get_option('daemon').enabled() or get_option('mesh').enabled()
+  meson.add_install_script(sh, '-c', 'install -dm700 ${DESTDIR}/' + storagedir)
+endif
 if get_option('mesh').enabled()
   meson.add_install_script(sh, '-c', 'install -dm700 ${DESTDIR}/' + meshstoragedir)
 endif
diff --git a/meson_options.txt b/meson_options.txt
index b72080f87813..aad131212886 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -6,6 +6,7 @@ option('tests', type: 'feature', value: 'auto', description: 'Enable testing too
 option('tools', type: 'feature', value: 'enabled', description: 'Enable Bluetooth tools')
 option('monitor', type: 'feature', value: 'enabled', description: 'Enable Bluetooth monitor')
 option('client', type: 'feature', value: 'enabled', description: 'Enable command line client')
+option('daemon', type: 'feature', value: 'enabled', description: 'Enable bluetoothd daemon')
 option('systemd', type: 'feature', value: 'enabled', description: 'Install systemd service files')
 option('logind', type: 'feature', value: 'enabled', description: 'Enable logind integration in obexd')
 option('udev', type: 'feature', value: 'enabled', description: 'Enable udev device support')
diff --git a/src/meson.build b/src/meson.build
index bf2155e13d89..22d142d1ceb6 100644
--- a/src/meson.build
+++ b/src/meson.build
@@ -1,88 +1,90 @@
 subdir('shared')
 
-if get_option('datafiles').enabled()
-  install_data('bluetooth.conf',
-    install_dir: dbusconfdir / 'dbus-1/system.d'
-  )
-  install_data('main.conf',
-    install_dir: configdir
-  )
-endif
+if get_option('daemon').enabled()
+  if get_option('datafiles').enabled()
+    install_data('bluetooth.conf',
+      install_dir: dbusconfdir / 'dbus-1/system.d'
+    )
+    install_data('main.conf',
+      install_dir: configdir
+    )
+  endif
 
-if systemd_dep.found()
-  configure_file(
-    input: 'bluetooth.service.in',
-    output: 'bluetooth.service',
-    install: true,
-    install_dir: systemdsystemunitdir,
-    configuration: service_conf
+  if systemd_dep.found()
+    configure_file(
+      input: 'bluetooth.service.in',
+      output: 'bluetooth.service',
+      install: true,
+      install_dir: systemdsystemunitdir,
+      configuration: service_conf
+    )
+
+    install_data('org.bluez.service',
+      install_dir: dbussystembusdir
+    )
+  endif
+
+  genbuiltin = find_program('genbuiltin')
+  builtin_h = custom_target('src-builtin.h',
+    output: 'builtin.h',
+    capture: true,
+    command: [ genbuiltin, builtin_modules ]
   )
 
-  install_data('org.bluez.service',
-    install_dir: dbussystembusdir
+  executable('bluetoothd',
+    sources: [ builtin_sources,
+      attrib_sources,
+      btio_sources,
+      builtin_h,
+      'main.c',
+      'log.c',
+      'backtrace.c',
+      'rfkill.c',
+      'sdpd-server.c',
+      'sdpd-request.c',
+      'sdpd-service.c',
+      'sdpd-database.c',
+      'gatt-database.c',
+      'sdp-xml.c',
+      'sdp-client.c',
+      'textfile.c',
+      'uuid-helper.c',
+      'plugin.c',
+      'storage.c',
+      'advertising.c',
+      'agent.c',
+      'bearer.c',
+      'error.c',
+      'adapter.c',
+      'profile.c',
+      'service.c',
+      'gatt-client.c',
+      'device.c',
+      'dbus-common.c',
+      'eir.c',
+      'adv_monitor.c',
+      'battery.c',
+      'settings.c',
+      'set.c' ],
+    dependencies: [
+      libbluetooth_internal_dep,
+      libgdbus_internal_dep,
+      libshared_glib_dep,
+      backtrace_dep,
+      glib_dep,
+      dbus_dep,
+      udevlib_dep,
+      builtin_deps
+    ],
+    override_options: [ 'b_lundef=false' ],
+    c_args: [
+      '-DBLUETOOTH_PLUGIN_BUILTIN',
+      '-DPLUGINDIR="@0@"'.format(plugindir),
+      '-DSTORAGEDIR="@0@"'.format(storagedir),
+      '-DCONFIGDIR="@0@"'.format(configdir)
+    ],
+    link_args: [ '-Wl,--gc-sections', external_plugins_link_args ],
+    install: true,
+    install_dir: pkglibexecdir
   )
 endif
-
-genbuiltin = find_program('genbuiltin')
-builtin_h = custom_target('src-builtin.h',
-  output: 'builtin.h',
-  capture: true,
-  command: [ genbuiltin, builtin_modules ]
-)
-
-executable('bluetoothd',
-  sources: [ builtin_sources,
-    attrib_sources,
-    btio_sources,
-    builtin_h,
-    'main.c',
-    'log.c',
-    'backtrace.c',
-    'rfkill.c',
-    'sdpd-server.c',
-    'sdpd-request.c',
-    'sdpd-service.c',
-    'sdpd-database.c',
-    'gatt-database.c',
-    'sdp-xml.c',
-    'sdp-client.c',
-    'textfile.c',
-    'uuid-helper.c',
-    'plugin.c',
-    'storage.c',
-    'advertising.c',
-    'agent.c',
-    'bearer.c',
-    'error.c',
-    'adapter.c',
-    'profile.c',
-    'service.c',
-    'gatt-client.c',
-    'device.c',
-    'dbus-common.c',
-    'eir.c',
-    'adv_monitor.c',
-    'battery.c',
-    'settings.c',
-    'set.c' ],
-  dependencies: [
-    libbluetooth_internal_dep,
-    libgdbus_internal_dep,
-    libshared_glib_dep,
-    backtrace_dep,
-    glib_dep,
-    dbus_dep,
-    udevlib_dep,
-    builtin_deps
-  ],
-  override_options: [ 'b_lundef=false' ],
-  c_args: [
-    '-DBLUETOOTH_PLUGIN_BUILTIN',
-    '-DPLUGINDIR="@0@"'.format(plugindir),
-    '-DSTORAGEDIR="@0@"'.format(storagedir),
-    '-DCONFIGDIR="@0@"'.format(configdir)
-  ],
-  link_args: [ '-Wl,--gc-sections', external_plugins_link_args ],
-  install: true,
-  install_dir: pkglibexecdir
-)
-- 
2.52.0


