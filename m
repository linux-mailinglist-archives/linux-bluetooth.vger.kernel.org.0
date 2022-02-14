Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1084B5C89
	for <lists+linux-bluetooth@lfdr.de>; Mon, 14 Feb 2022 22:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbiBNVWB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 14 Feb 2022 16:22:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbiBNVWA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 14 Feb 2022 16:22:00 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFAD13C3AF
        for <linux-bluetooth@vger.kernel.org>; Mon, 14 Feb 2022 13:21:47 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id bg19-20020a05600c3c9300b0034565e837b6so284986wmb.1
        for <linux-bluetooth@vger.kernel.org>; Mon, 14 Feb 2022 13:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=czU4KvI4lXJSxrKb/51SS0JWPjlFZMvrp1DMM8ov2WU=;
        b=fPF13fv2zDAvVhfQ0wc6Hop6P8kdtXmu3W2K4SOk91iP/heL1Ui0yNnL/ZMsGAvGRS
         GWwgVv5A7RN0r74bEPYIDlJbl7NK3r6uD2BhUqUATjKEQdAAdtOevBr8mBOZf2wNsCxm
         CGGw7sEUJnr/lEhn44qxmF74IOLoGczBWLtDxiUG9Fl5zvih7fXpW73cZM9uLrpOgIwR
         hrQ7tr/90WvgXabgCn+073A2NJVPVt1sd4dc2TY8JS1FPQsGy7zEkgvHW47Cee0j/zy2
         E79gV8d5SMGRMik+ZrDVLDhdw53GMDlRnWrKK0xp842sOZrm+ldIjftv6jbJNWVbhdon
         Z0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=czU4KvI4lXJSxrKb/51SS0JWPjlFZMvrp1DMM8ov2WU=;
        b=aEh6+gUmN6H1YkXnQMnAGWScoGoXc/6wIbnXj/rE394jEsYzEX2mBSqvyIKdJxSFMN
         mTuJjJJhrXlczqFjKJWvhGjBY2CSmhj6PY0KwK8OTwOTcvQlmBwIVF6k0A5XZe2stKLD
         /fK3N4BXLMSVy9/khosicYbfDZz39J4oa1Nm3USGVFEaVtN+SJhVhS07CUsGUhvSqY42
         7zkdkOxagskgnmelWEvXrl4f8snqdTOcC0UuHYjZg8ITTd2Xunrq1co896iRm1vh3gBS
         Q/euGXiNPP1fOVglKhOHuH63sxlR4WAoQenONPkbAeSKw1MbEVFR6epr+bmRbfGn8jb1
         nFiA==
X-Gm-Message-State: AOAM532wxOyU8VTZnScr4MQI05v2jJsFUkGNbNX5G4iFB0fQjcVTwgeh
        X27lIT2ggLdmWcvpUZ5HKMeLdejrV6A=
X-Google-Smtp-Source: ABdhPJxsq/u4sA5j3ien37B5Od4yo91wyoJR+1m5aQ4nHbD8zwIy1f9I2zvJ1A64cYfAuV2fx1JRJg==
X-Received: by 2002:a05:600c:1e25:: with SMTP id ay37mr351178wmb.119.1644869843823;
        Mon, 14 Feb 2022 12:17:23 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr. [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
        by smtp.gmail.com with ESMTPSA id x5sm23784626wrv.63.2022.02.14.12.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 12:17:23 -0800 (PST)
From:   Fabrice Fontaine <fontaine.fabrice@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: [PATCH BlueZ v3] fix build with glibc < 2.25
Date:   Mon, 14 Feb 2022 21:17:39 +0100
Message-Id: <20220214201739.3996569-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

getrandom and sys/random.h are only available since glibc 2.25:
https://www.gnu.org/software/gnulib/manual/html_node/sys_002frandom_002eh.html
resulting in the following build failures since version 5.63 and
https://git.kernel.org/pub/scm/bluetooth/bluez.git/log/?qt=grep&q=getrandom:

plugins/autopair.c:20:24: fatal error: sys/random.h: No such file or directory
 #include <sys/random.h>
                        ^

To fix this build failure, add util_getrandom and a fallback (borrowed
from pipewire and licensed under MIT):
https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/master/src/pipewire/utils.c

Fixes:
 - http://autobuild.buildroot.org/results/6b8870d12e0804d6154230a7322c49416c1dc0e2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Luiz Augusto von Dentz):
 - Move code to util_getrandom

Changes v1 -> v2 (after review of Marcel Holtmann):
 - Add a getrandom fallback in src/missing.h instead of adding ifdef

 configure.ac           |  4 +++-
 emulator/le.c          |  3 +--
 emulator/phy.c         |  3 +--
 peripheral/main.c      |  4 ++--
 plugins/autopair.c     |  4 ++--
 profiles/health/hdp.c  |  4 ++--
 profiles/health/mcap.c |  6 +++---
 src/shared/util.c      | 25 +++++++++++++++++++++++++
 src/shared/util.h      |  2 ++
 tools/btgatt-server.c  |  3 +--
 10 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/configure.ac b/configure.ac
index 07d068a4d..441bd5f29 100644
--- a/configure.ac
+++ b/configure.ac
@@ -54,6 +54,8 @@ AC_ARG_ENABLE(threads, AS_HELP_STRING([--enable-threads],
 
 AC_CHECK_FUNCS(explicit_bzero)
 
+AC_CHECK_FUNCS(getrandom)
+
 AC_CHECK_FUNCS(rawmemchr)
 
 AC_CHECK_FUNC(signalfd, dummy=yes,
@@ -68,7 +70,7 @@ AC_CHECK_LIB(pthread, pthread_create, dummy=yes,
 AC_CHECK_LIB(dl, dlopen, dummy=yes,
 			AC_MSG_ERROR(dynamic linking loader is required))
 
-AC_CHECK_HEADERS(linux/types.h linux/if_alg.h linux/uinput.h linux/uhid.h)
+AC_CHECK_HEADERS(linux/types.h linux/if_alg.h linux/uinput.h linux/uhid.h sys/random.h)
 
 PKG_CHECK_MODULES(GLIB, glib-2.0 >= 2.28, dummy=yes,
 				AC_MSG_ERROR(GLib >= 2.28 is required))
diff --git a/emulator/le.c b/emulator/le.c
index f8f313f2c..7656a657c 100644
--- a/emulator/le.c
+++ b/emulator/le.c
@@ -20,7 +20,6 @@
 #include <sys/socket.h>
 #include <sys/un.h>
 #include <sys/uio.h>
-#include <sys/random.h>
 #include <time.h>
 
 #include "lib/bluetooth.h"
@@ -509,7 +508,7 @@ static unsigned int get_adv_delay(void)
 	/* The advertising delay is a pseudo-random value with a range
 	 * of 0 ms to 10 ms generated for each advertising event.
 	 */
-	if (getrandom(&val, sizeof(val), 0) < 0) {
+	if (util_getrandom(&val, sizeof(val), 0) < 0) {
 		/* If it fails to get the random number, use a static value */
 		val = 5;
 	}
diff --git a/emulator/phy.c b/emulator/phy.c
index 44cace438..7de85fb05 100644
--- a/emulator/phy.c
+++ b/emulator/phy.c
@@ -19,7 +19,6 @@
 #include <stdlib.h>
 #include <string.h>
 #include <sys/socket.h>
-#include <sys/random.h>
 #include <netinet/in.h>
 #include <netinet/ip.h>
 #include <time.h>
@@ -174,7 +173,7 @@ struct bt_phy *bt_phy_new(void)
 	mainloop_add_fd(phy->rx_fd, EPOLLIN, phy_rx_callback, phy, NULL);
 
 	if (!get_random_bytes(&phy->id, sizeof(phy->id))) {
-		if (getrandom(&phy->id, sizeof(phy->id), 0) < 0) {
+		if (util_getrandom(&phy->id, sizeof(phy->id), 0) < 0) {
 			mainloop_remove_fd(phy->rx_fd);
 			close(phy->tx_fd);
 			close(phy->rx_fd);
diff --git a/peripheral/main.c b/peripheral/main.c
index 91adb45fc..b82d7caf6 100644
--- a/peripheral/main.c
+++ b/peripheral/main.c
@@ -25,13 +25,13 @@
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <sys/mount.h>
-#include <sys/random.h>
 
 #ifndef WAIT_ANY
 #define WAIT_ANY (-1)
 #endif
 
 #include "src/shared/mainloop.h"
+#include "src/shared/util.h"
 #include "peripheral/efivars.h"
 #include "peripheral/attach.h"
 #include "peripheral/gap.h"
@@ -192,7 +192,7 @@ int main(int argc, char *argv[])
 							addr, 6) < 0) {
 			printf("Generating new persistent static address\n");
 
-			if (getrandom(addr, sizeof(addr), 0) < 0) {
+			if (util_getrandom(addr, sizeof(addr), 0) < 0) {
 				perror("Failed to get random static address");
 				return EXIT_FAILURE;
 			}
diff --git a/plugins/autopair.c b/plugins/autopair.c
index a75ecebe4..0b09e893f 100644
--- a/plugins/autopair.c
+++ b/plugins/autopair.c
@@ -17,7 +17,6 @@
 #include <fcntl.h>
 #include <unistd.h>
 #include <errno.h>
-#include <sys/random.h>
 
 #include <glib.h>
 
@@ -29,6 +28,7 @@
 #include "src/device.h"
 #include "src/log.h"
 #include "src/storage.h"
+#include "src/shared/util.h"
 
 /*
  * Plugin to handle automatic pairing of devices with reduced user
@@ -131,7 +131,7 @@ static ssize_t autopair_pincb(struct btd_adapter *adapter,
 			if (attempt >= 4)
 				return 0;
 
-			if (getrandom(&val, sizeof(val), 0) < 0) {
+			if (util_getrandom(&val, sizeof(val), 0) < 0) {
 				error("Failed to get a random pincode");
 				return 0;
 			}
diff --git a/profiles/health/hdp.c b/profiles/health/hdp.c
index 9d9d1e824..b6590cd3a 100644
--- a/profiles/health/hdp.c
+++ b/profiles/health/hdp.c
@@ -16,7 +16,6 @@
 #include <stdint.h>
 #include <stdbool.h>
 #include <unistd.h>
-#include <sys/random.h>
 
 #include <glib.h>
 
@@ -33,6 +32,7 @@
 #include "src/device.h"
 #include "src/sdpd.h"
 #include "src/shared/timeout.h"
+#include "src/shared/util.h"
 #include "btio/btio.h"
 
 #include "hdp_types.h"
@@ -1490,7 +1490,7 @@ static void *generate_echo_packet(void)
 	if (!buf)
 		return NULL;
 
-	if (getrandom(buf, HDP_ECHO_LEN, 0) < 0) {
+	if (util_getrandom(buf, HDP_ECHO_LEN, 0) < 0) {
 		g_free(buf);
 		return NULL;
 	}
diff --git a/profiles/health/mcap.c b/profiles/health/mcap.c
index aad0a08a3..5d2bac3d9 100644
--- a/profiles/health/mcap.c
+++ b/profiles/health/mcap.c
@@ -19,7 +19,6 @@
 #include <errno.h>
 #include <unistd.h>
 #include <time.h>
-#include <sys/random.h>
 
 #include <glib.h>
 
@@ -28,6 +27,7 @@
 #include "btio/btio.h"
 #include "src/log.h"
 #include "src/shared/timeout.h"
+#include "src/shared/util.h"
 
 #include "mcap.h"
 
@@ -1905,7 +1905,7 @@ gboolean mcap_create_mcl(struct mcap_instance *mi,
 		mcl->state = MCL_IDLE;
 		bacpy(&mcl->addr, addr);
 		set_default_cb(mcl);
-		if (getrandom(&val, sizeof(val), 0) < 0) {
+		if (util_getrandom(&val, sizeof(val), 0) < 0) {
 			mcap_instance_unref(mcl->mi);
 			g_free(mcl);
 			return FALSE;
@@ -2049,7 +2049,7 @@ static void connect_mcl_event_cb(GIOChannel *chan, GError *gerr,
 		mcl->mi = mcap_instance_ref(mi);
 		bacpy(&mcl->addr, &dst);
 		set_default_cb(mcl);
-		if (getrandom(&val, sizeof(val), 0) < 0) {
+		if (util_getrandom(&val, sizeof(val), 0) < 0) {
 			mcap_instance_unref(mcl->mi);
 			g_free(mcl);
 			goto drop;
diff --git a/src/shared/util.c b/src/shared/util.c
index 6e1c83057..33196bf8b 100644
--- a/src/shared/util.c
+++ b/src/shared/util.c
@@ -13,6 +13,7 @@
 #endif
 
 #define _GNU_SOURCE
+#include <fcntl.h>
 #include <stdio.h>
 #include <ctype.h>
 #include <stdbool.h>
@@ -23,6 +24,10 @@
 #include <limits.h>
 #include <string.h>
 
+#ifdef HAVE_SYS_RANDOM_H
+#include <sys/random.h>
+#endif
+
 #include "src/shared/util.h"
 
 void *util_malloc(size_t size)
@@ -138,6 +143,26 @@ unsigned char util_get_dt(const char *parent, const char *name)
 	return DT_UNKNOWN;
 }
 
+/* Helper for getting a random in case getrandom unavailable (glibc < 2.25) */
+ssize_t util_getrandom(void *buf, size_t buflen, unsigned int flags)
+{
+#ifdef HAVE_GETRANDOM
+	return getrandom(buf, buflen, flags);
+#else
+	int fd;
+	ssize_t bytes;
+
+	fd = open("/dev/urandom", O_CLOEXEC);
+	if (fd < 0)
+		return -1;
+
+	bytes = read(fd, buf, buflen);
+	close(fd);
+
+	return bytes;
+#endif
+}
+
 /* Helpers for bitfield operations */
 
 /* Find unique id in range from 1 to max but no bigger than 64. */
diff --git a/src/shared/util.h b/src/shared/util.h
index 8ef6132c4..c01eccf8a 100644
--- a/src/shared/util.h
+++ b/src/shared/util.h
@@ -103,6 +103,8 @@ void util_hexdump(const char dir, const unsigned char *buf, size_t len,
 
 unsigned char util_get_dt(const char *parent, const char *name);
 
+ssize_t util_getrandom(void *buf, size_t buflen, unsigned int flags);
+
 uint8_t util_get_uid(uint64_t *bitmap, uint8_t max);
 void util_clear_uid(uint64_t *bitmap, uint8_t id);
 
diff --git a/tools/btgatt-server.c b/tools/btgatt-server.c
index 15d49a464..4a5d2b720 100644
--- a/tools/btgatt-server.c
+++ b/tools/btgatt-server.c
@@ -20,7 +20,6 @@
 #include <getopt.h>
 #include <unistd.h>
 #include <errno.h>
-#include <sys/random.h>
 
 #include "lib/bluetooth.h"
 #include "lib/hci.h"
@@ -287,7 +286,7 @@ static bool hr_msrmt_cb(void *user_data)
 	uint32_t cur_ee;
 	uint32_t val;
 
-	if (getrandom(&val, sizeof(val), 0) < 0)
+	if (util_getrandom(&val, sizeof(val), 0) < 0)
 		return false;
 
 	pdu[0] = 0x06;
-- 
2.34.1

