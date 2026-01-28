Return-Path: <linux-bluetooth+bounces-18597-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HJOMs86emlB4wEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18597-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 17:35:27 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64172A5D8F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 17:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A66E32A7316
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 15:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1650E30FC12;
	Wed, 28 Jan 2026 15:56:11 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8052A30CD9E
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 15:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769615770; cv=none; b=YNxaeE3FRWf/OK9Wm8oFTuITgeVPZp8nN7v8fcwauQE3ibHzks+g80suAHIvCp9EDyGu5Stx/Pp49+b/tYAWM70vDz7Yh6+iGkti9us8E/mGGNR2ZBoJno0zAUpsxYrmC8R9c8eSkzM0sdXrykbcuHhklYYF+UKJDEwZ44udJ/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769615770; c=relaxed/simple;
	bh=Mml07chawyRV6m8ANqGHpubpwZY3vgsQcZ1A3gx9Dhc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RiPrHPhuxv4LUGUo/65db9acdLlDmqTO29/x5kf34PsE7/BAEtsHz5pCxElUMOw3qOBjTIw4rAEL664AHKowg1hdmgzir8753I10KW7FxaB562Lft9LJ3QY0Eg06UWfluPPSrK7idJ38E/0SQKYLggCuBgXDswvR/5Jb3GcEP/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB13B4400A
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 15:55:59 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v6 12/20] build: Add option to allow disabling bluetoothd
Date: Wed, 28 Jan 2026 16:11:50 +0100
Message-ID: <20260128155548.2025252-13-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128155548.2025252-1-hadess@hadess.net>
References: <20260128155548.2025252-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieefjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeevhfffgffgjeekueeihfdtffefuefgkefhieehfeevhedtvdejfeevvdfffeefveenucffohhmrghinhepshgvrhhvihgtvgdrihhnnecukfhppedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemlegsvdelmegtugefieemieekfhgumegttdelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemlegsvdelmegtugefieemieekfhgumegttdelfedphhgvlhhopeholhhimhhpihgtpdhmrghilhhfrhhomhephhgruggvshhssehhrgguvghsshdrnhgvthdpqhhiugepveeuudefueeggedttdetpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-State: clean
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_FROM(0.00)[bounces-18597-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[hadess.net];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NEQ_ENVFROM(0.00)[hadess@hadess.net,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hadess.net:mid,meson.build:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 64172A5D8F
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
index 644c17a8e4c0..092364df1f49 100644
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


