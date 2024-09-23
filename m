Return-Path: <linux-bluetooth+bounces-7304-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 439049798AF
	for <lists+linux-bluetooth@lfdr.de>; Sun, 15 Sep 2024 22:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08B07281BE4
	for <lists+linux-bluetooth@lfdr.de>; Sun, 15 Sep 2024 20:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090FF1C9EDD;
	Sun, 15 Sep 2024 20:23:27 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D6BEAE7
	for <linux-bluetooth@vger.kernel.org>; Sun, 15 Sep 2024 20:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.189.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726431806; cv=none; b=ROWBGJcYcABUy3r5iYVH862uQ93suBiJZODT8JS7kzpAofLDNqxuZtghAwOYNskiQWDI9eNdHFy4KOJDil/zfUXN2v7zqUdTh8kEplmfOsWATpJ3HcBgX4vL/wE/KOp4ZzFOa/gtAeYyWc++oXwgisfwOEwBwCZAos8ZZ5F9y4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726431806; c=relaxed/simple;
	bh=zhBE9/5q3FUPTdaIzsFG3qe/Wg0grmrIuif2mcU49us=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OieBjh65hlWXm7Wj1zJuUksyk9efv3XuMdblvjB3JAJTSYA9tGo0wEOKlELeN7mtoSTIhlYuCb3xSqNXmPd6m9515FxiWKDIh/0EUX2zrhKaZs0vgrgIhbobCeYrDsUZMZeAGH2vCjt93u0Q/anHLircbOKI46ubz3WDLdgquDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iodev.co.uk; spf=pass smtp.mailfrom=iodev.co.uk; arc=none smtp.client-ip=46.30.189.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iodev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iodev.co.uk
Received: from localhost (91-118-7-60.static.upcbusiness.at [91.118.7.60])
	by iodev.co.uk (Postfix) with ESMTPSA id E4751346335;
	Sun, 15 Sep 2024 22:23:22 +0200 (CEST)
From: Ismael Luceno <ismael@iodev.co.uk>
To: linux-bluetooth@vger.kernel.org
Cc: Ismael Luceno <ismael@iodev.co.uk>
Subject: [PATCH] Fix missing inclusion of <limits.h>
Date: Sun, 15 Sep 2024 22:23:20 +0200
Message-ID: <20240915202320.8181-2-ismael@iodev.co.uk>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Needed for PATH_MAX.

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---
 android/ipc-tester.c      | 1 +
 android/system-emulator.c | 1 +
 android/tester-main.c     | 1 +
 client/mgmt.c             | 1 +
 emulator/serial.c         | 1 +
 emulator/vhci.c           | 1 +
 monitor/att.c             | 2 +-
 peripheral/efivars.c      | 1 +
 profiles/audio/a2dp.c     | 1 +
 src/adapter.c             | 1 +
 src/device.c              | 1 +
 src/gatt-database.c       | 1 +
 src/main.c                | 1 +
 src/rfkill.c              | 1 +
 src/storage.c             | 1 +
 src/textfile.c            | 1 +
 tools/bluemoon.c          | 1 +
 tools/hciattach.c         | 1 +
 tools/hciattach_ath3k.c   | 1 +
 tools/hciattach_intel.c   | 1 +
 tools/hciattach_st.c      | 1 +
 tools/hciattach_ti.c      | 1 +
 tools/test-runner.c       | 1 +
 23 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/android/ipc-tester.c b/android/ipc-tester.c
index 780e1dc4ce1c..68e2ad10e747 100644
--- a/android/ipc-tester.c
+++ b/android/ipc-tester.c
@@ -17,6 +17,7 @@
 #include <unistd.h>
 #include <errno.h>
 #include <poll.h>
+#include <limits.h>
 
 #include <sys/socket.h>
 #include <sys/types.h>
diff --git a/android/system-emulator.c b/android/system-emulator.c
index bf1499df0957..50bb088d3188 100644
--- a/android/system-emulator.c
+++ b/android/system-emulator.c
@@ -19,6 +19,7 @@
 #include <stdlib.h>
 #include <signal.h>
 #include <string.h>
+#include <limits.h>
 #include <libgen.h>
 #include <poll.h>
 #include <sys/wait.h>
diff --git a/android/tester-main.c b/android/tester-main.c
index 317c1de06463..361c519ef5a3 100644
--- a/android/tester-main.c
+++ b/android/tester-main.c
@@ -7,6 +7,7 @@
 #define _GNU_SOURCE
 #include <stdbool.h>
 #include <unistd.h>
+#include <limits.h>
 #include <libgen.h>
 
 #include <sys/un.h>
diff --git a/client/mgmt.c b/client/mgmt.c
index 44bf4d2019ea..fba409f823ef 100644
--- a/client/mgmt.c
+++ b/client/mgmt.c
@@ -17,6 +17,7 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <string.h>
+#include <limits.h>
 #include <sys/types.h>
 #include <sys/param.h>
 #include <sys/socket.h>
diff --git a/emulator/serial.c b/emulator/serial.c
index c9e6d7cd67c8..b74556b13547 100644
--- a/emulator/serial.c
+++ b/emulator/serial.c
@@ -21,6 +21,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <fcntl.h>
+#include <limits.h>
 #include <sys/param.h>
 #include <sys/epoll.h>
 #include <sys/uio.h>
diff --git a/emulator/vhci.c b/emulator/vhci.c
index 355ab63897dc..cab35354549e 100644
--- a/emulator/vhci.c
+++ b/emulator/vhci.c
@@ -23,6 +23,7 @@
 #include <fcntl.h>
 #include <unistd.h>
 #include <dirent.h>
+#include <limits.h>
 
 #include "lib/bluetooth.h"
 #include "lib/hci.h"
diff --git a/monitor/att.c b/monitor/att.c
index 73a61658454f..3f41c2bd096f 100644
--- a/monitor/att.c
+++ b/monitor/att.c
@@ -22,7 +22,7 @@
 #include <inttypes.h>
 #include <stdbool.h>
 #include <errno.h>
-#include <linux/limits.h>
+#include <limits.h>
 #include <sys/stat.h>
 
 #include <glib.h>
diff --git a/peripheral/efivars.c b/peripheral/efivars.c
index 987572b63968..d4e724e2ded6 100644
--- a/peripheral/efivars.c
+++ b/peripheral/efivars.c
@@ -20,6 +20,7 @@
 #include <string.h>
 #include <stdlib.h>
 #include <stdint.h>
+#include <limits.h>
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <sys/param.h>
diff --git a/profiles/audio/a2dp.c b/profiles/audio/a2dp.c
index a6489a76311d..d6c97e7bfde1 100644
--- a/profiles/audio/a2dp.c
+++ b/profiles/audio/a2dp.c
@@ -19,6 +19,7 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <errno.h>
+#include <limits.h>
 
 #include <dbus/dbus.h>
 #include <glib.h>
diff --git a/src/adapter.c b/src/adapter.c
index d6c05819627a..916cf8b6bd11 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -24,6 +24,7 @@
 #include <sys/file.h>
 #include <sys/stat.h>
 #include <dirent.h>
+#include <limits.h>
 
 #include <glib.h>
 #include <dbus/dbus.h>
diff --git a/src/device.c b/src/device.c
index 0f18c8c7f54e..20566c918fa5 100644
--- a/src/device.c
+++ b/src/device.c
@@ -22,6 +22,7 @@
 #include <errno.h>
 #include <dirent.h>
 #include <time.h>
+#include <limits.h>
 #include <sys/stat.h>
 
 #include <glib.h>
diff --git a/src/gatt-database.c b/src/gatt-database.c
index 6c84b085ca29..a86e528fd0e2 100644
--- a/src/gatt-database.c
+++ b/src/gatt-database.c
@@ -16,6 +16,7 @@
 #include <stdlib.h>
 #include <errno.h>
 #include <unistd.h>
+#include <limits.h>
 
 #include "lib/bluetooth.h"
 #include "lib/sdp.h"
diff --git a/src/main.c b/src/main.c
index 62453bffaf57..69ae1b1e374d 100644
--- a/src/main.c
+++ b/src/main.c
@@ -22,6 +22,7 @@
 #include <string.h>
 #include <signal.h>
 #include <stdbool.h>
+#include <limits.h>
 #include <sys/signalfd.h>
 #include <sys/types.h>
 #include <sys/stat.h>
diff --git a/src/rfkill.c b/src/rfkill.c
index 8a0e48f01c4f..88cad1c9e19d 100644
--- a/src/rfkill.c
+++ b/src/rfkill.c
@@ -20,6 +20,7 @@
 #include <stdint.h>
 #include <stdlib.h>
 #include <string.h>
+#include <limits.h>
 
 #include <glib.h>
 
diff --git a/src/storage.c b/src/storage.c
index 6e69be978b46..187ba156ce6c 100644
--- a/src/storage.c
+++ b/src/storage.c
@@ -21,6 +21,7 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <time.h>
+#include <limits.h>
 #include <sys/file.h>
 #include <sys/stat.h>
 
diff --git a/src/textfile.c b/src/textfile.c
index a5b9e73a6421..313098f38c6e 100644
--- a/src/textfile.c
+++ b/src/textfile.c
@@ -21,6 +21,7 @@
 #include <stdlib.h>
 #include <stdarg.h>
 #include <string.h>
+#include <limits.h>
 #include <sys/file.h>
 #include <sys/stat.h>
 #include <sys/mman.h>
diff --git a/tools/bluemoon.c b/tools/bluemoon.c
index f50107a2a7e3..9aaf6428da42 100644
--- a/tools/bluemoon.c
+++ b/tools/bluemoon.c
@@ -18,6 +18,7 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <string.h>
+#include <limits.h>
 #include <getopt.h>
 #include <sys/stat.h>
 #include <sys/param.h>
diff --git a/tools/hciattach.c b/tools/hciattach.c
index 276a4e56ef9d..adf79baf6ebd 100644
--- a/tools/hciattach.c
+++ b/tools/hciattach.c
@@ -26,6 +26,7 @@
 #include <termios.h>
 #include <time.h>
 #include <poll.h>
+#include <limits.h>
 #include <sys/time.h>
 #include <sys/param.h>
 #include <sys/ioctl.h>
diff --git a/tools/hciattach_ath3k.c b/tools/hciattach_ath3k.c
index d119155bb53b..8922b480f629 100644
--- a/tools/hciattach_ath3k.c
+++ b/tools/hciattach_ath3k.c
@@ -16,6 +16,7 @@
 #include <string.h>
 #include <ctype.h>
 #include <time.h>
+#include <limits.h>
 #include <sys/stat.h>
 #include <sys/time.h>
 #include <sys/types.h>
diff --git a/tools/hciattach_intel.c b/tools/hciattach_intel.c
index e243b3d07c5e..b68678991bf9 100644
--- a/tools/hciattach_intel.c
+++ b/tools/hciattach_intel.c
@@ -19,6 +19,7 @@
 #include <string.h>
 #include <errno.h>
 #include <fcntl.h>
+#include <limits.h>
 #include <sys/param.h>
 #include <sys/ioctl.h>
 #include <time.h>
diff --git a/tools/hciattach_st.c b/tools/hciattach_st.c
index 4a7186aa6633..def761305944 100644
--- a/tools/hciattach_st.c
+++ b/tools/hciattach_st.c
@@ -12,6 +12,7 @@
 #include <config.h>
 #endif
 
+#include <limits.h>
 #include <stdio.h>
 #include <errno.h>
 #include <fcntl.h>
diff --git a/tools/hciattach_ti.c b/tools/hciattach_ti.c
index 24efceaa1ae5..c0a0025ff888 100644
--- a/tools/hciattach_ti.c
+++ b/tools/hciattach_ti.c
@@ -14,6 +14,7 @@
 #endif
 
 #define _GNU_SOURCE
+#include <limits.h>
 #include <stdio.h>
 #include <errno.h>
 #include <unistd.h>
diff --git a/tools/test-runner.c b/tools/test-runner.c
index de0f2260480c..f0dbb4c481bb 100644
--- a/tools/test-runner.c
+++ b/tools/test-runner.c
@@ -23,6 +23,7 @@
 #include <string.h>
 #include <getopt.h>
 #include <poll.h>
+#include <limits.h>
 #include <sys/wait.h>
 #include <sys/stat.h>
 #include <sys/types.h>
-- 
2.46.0


