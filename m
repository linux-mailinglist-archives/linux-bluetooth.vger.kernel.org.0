Return-Path: <linux-bluetooth+bounces-8487-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 145FF9C024B
	for <lists+linux-bluetooth@lfdr.de>; Thu,  7 Nov 2024 11:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C81CE283894
	for <lists+linux-bluetooth@lfdr.de>; Thu,  7 Nov 2024 10:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1A41EBFFA;
	Thu,  7 Nov 2024 10:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o5kT0hYY"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2781E9083
	for <linux-bluetooth@vger.kernel.org>; Thu,  7 Nov 2024 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730975214; cv=none; b=Oqv1qIVeGGdveXfzY4Rd7dZS5hy8xE3Ny9+ASx1oqqPiLjobK348imrht9kIdxnCvJPw9AeRMRpGiJBsyubFWcJd26NIBmeW2zv4vsoKO2s4pMruwfR/clhWUkzduwWKQ/ytJeYAuGfOF9m+4qLhPa5iIcsiSV8QFfi1HT5qeIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730975214; c=relaxed/simple;
	bh=VT4q4C1x60QPt7JBu0uwbFnsZDAvT9gavFOHNAcZM8o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O+awBg796tF+7dQmu4VMVyUsvZx0yBIuCFNHqR5AcXu0u0FRg0Z9crOzZlwAaPNbHQLw65D11Xa1u8GtpqeSCUBntf8CJoTWyBPC9RjdRmFBnnGBRMLXV4SJ5eveqzhn17npW7zUXwNtXQI9+BW1oj2deXI8vi2xKJEsFq13wrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o5kT0hYY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A77DjRo013243
	for <linux-bluetooth@vger.kernel.org>; Thu, 7 Nov 2024 10:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U0IrQDChLltqkgsiHLGIPB
	mUGzfB54eKwuI69P+0AVE=; b=o5kT0hYY6ewSB/t22BqYn5SdVwZqpv/Z4717M7
	+kHqjkAKMzObE6A3iyQI7Jcs8WAUltbGV9W8gb2jkOc+aarVW5mOI1IzYyW1Hu2d
	Ncty7TBau86BBFPYjOB3doVjD0YlS1BxN59Pe5rN061mbkewpzngY+Bs85zRHxxS
	ywLKru+md/IJu5V13OcOBnJ8LSlS07XJsBFN+jt5fSvhJ/asuFv/5z01qUkcaZGW
	pV9Mut8+Zpi+3cqy82nqY6ROTCbUVGF53JtFzD7wmJJO5YClhzdH0yi4okKi+2lO
	wFgQrs6SP+tqJldJo3rzTmdfDGcRkMY19IVtUW1Rf8yD9vJQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qp2rwxwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-bluetooth@vger.kernel.org>; Thu, 07 Nov 2024 10:26:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A7AQoZv021882
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-bluetooth@vger.kernel.org>; Thu, 7 Nov 2024 10:26:50 GMT
Received: from hu-dgangire-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 7 Nov 2024 02:26:48 -0800
From: <quic_dgangire@quicinc.com>
To: <linux-bluetooth@vger.kernel.org>
CC: <quic_mohamull@quicinc.com>, <quic_hbandi@quicinc.com>,
        <quic_anubhavg@quicinc.com>
Subject: [PATCH BlueZ v6] obexd: Add system bus support for obexd
Date: Thu, 7 Nov 2024 15:56:28 +0530
Message-ID: <20241107102628.537015-1-quic_dgangire@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hkJ44M0H9vvNrEaAPWcZNUb8RE7K43nN
X-Proofpoint-ORIG-GUID: hkJ44M0H9vvNrEaAPWcZNUb8RE7K43nN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070080

From: Damodar Reddy GangiReddy <quic_dgangire@quicinc.com>

Currently obexd uses session bus.
Distros  where session bus is not supported and still obex profiles
are required in that case use system bus instead of session bus
which can be configured at run time.

An Command line option has been added to achieve it.
{ "system-bus", 's', 0, G_OPTION_ARG_NONE, &option_system_bus,
"Use System bus "}

we can use option obexd -s to use system bus.

---
 Makefile.am             |  6 +++++-
 obexd/client/ftp.c      |  3 ++-
 obexd/client/map.c      |  3 ++-
 obexd/client/opp.c      |  3 ++-
 obexd/client/pbap.c     |  3 ++-
 obexd/client/session.c  |  3 ++-
 obexd/client/sync.c     |  3 ++-
 obexd/plugins/pcsuite.c |  2 +-
 obexd/src/main.c        | 25 +++++++++++++++++++++++++
 obexd/src/manager.c     |  2 +-
 obexd/src/obex.conf     | 28 ++++++++++++++++++++++++++++
 obexd/src/obexd.h       |  5 +++++
 12 files changed, 77 insertions(+), 9 deletions(-)
 create mode 100644 obexd/src/obex.conf

diff --git a/Makefile.am b/Makefile.am
index f639f7f8b..297d0774c 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -39,6 +39,10 @@ if DATAFILES
 dbusdir = $(DBUS_CONFDIR)/dbus-1/system.d
 dbus_DATA = src/bluetooth.conf
 
+if OBEX
+dbus_DATA += obexd/src/obex.conf
+endif
+
 conf_DATA = src/main.conf
 conf_DATA += profiles/input/input.conf
 conf_DATA += profiles/network/network.conf
@@ -421,7 +425,7 @@ manual_pages += doc/org.bluez.obex.Client.5 doc/org.bluez.obex.Session.5 \
 
 EXTRA_DIST += src/genbuiltin src/bluetooth.conf \
 			src/main.conf profiles/network/network.conf \
-			profiles/input/input.conf
+			profiles/input/input.conf obexd/src/obex.conf
 
 test_scripts =
 unit_tests =
diff --git a/obexd/client/ftp.c b/obexd/client/ftp.c
index 160e0636a..b61f5bb87 100644
--- a/obexd/client/ftp.c
+++ b/obexd/client/ftp.c
@@ -19,6 +19,7 @@
 #include "gdbus/gdbus.h"
 
 #include "obexd/src/log.h"
+#include "obexd/src/obexd.h"
 #include "transfer.h"
 #include "session.h"
 #include "driver.h"
@@ -463,7 +464,7 @@ int ftp_init(void)
 
 	DBG("");
 
-	conn = dbus_bus_get(DBUS_BUS_SESSION, NULL);
+	conn = obex_get_dbus_connection();
 	if (!conn)
 		return -EIO;
 
diff --git a/obexd/client/map.c b/obexd/client/map.c
index 513dcaf14..29b0ed96e 100644
--- a/obexd/client/map.c
+++ b/obexd/client/map.c
@@ -27,6 +27,7 @@
 #include "gdbus/gdbus.h"
 
 #include "obexd/src/log.h"
+#include "obexd/src/obexd.h"
 #include "obexd/src/map_ap.h"
 #include "map-event.h"
 
@@ -2063,7 +2064,7 @@ int map_init(void)
 
 	DBG("");
 
-	conn = dbus_bus_get(DBUS_BUS_SESSION, NULL);
+	conn = obex_get_dbus_connection();
 	if (!conn)
 		return -EIO;
 
diff --git a/obexd/client/opp.c b/obexd/client/opp.c
index 90d0c0c8e..c22e919ba 100644
--- a/obexd/client/opp.c
+++ b/obexd/client/opp.c
@@ -17,6 +17,7 @@
 #include "gdbus/gdbus.h"
 
 #include "obexd/src/log.h"
+#include "obexd/src/obexd.h"
 
 #include "transfer.h"
 #include "session.h"
@@ -178,7 +179,7 @@ int opp_init(void)
 
 	DBG("");
 
-	conn = dbus_bus_get(DBUS_BUS_SESSION, NULL);
+	conn = obex_get_dbus_connection();
 	if (!conn)
 		return -EIO;
 
diff --git a/obexd/client/pbap.c b/obexd/client/pbap.c
index 2d2aa9508..bc3fdcf9f 100644
--- a/obexd/client/pbap.c
+++ b/obexd/client/pbap.c
@@ -27,6 +27,7 @@
 #include "gdbus/gdbus.h"
 
 #include "obexd/src/log.h"
+#include "obexd/src/obexd.h"
 
 #include "transfer.h"
 #include "session.h"
@@ -1303,7 +1304,7 @@ int pbap_init(void)
 
 	DBG("");
 
-	conn = dbus_bus_get(DBUS_BUS_SESSION, NULL);
+	conn = obex_get_dbus_connection();
 	if (!conn)
 		return -EIO;
 
diff --git a/obexd/client/session.c b/obexd/client/session.c
index 13a834e14..2770b9261 100644
--- a/obexd/client/session.c
+++ b/obexd/client/session.c
@@ -27,6 +27,7 @@
 #include "gobex/gobex.h"
 
 #include "obexd/src/log.h"
+#include "obexd/src/obexd.h"
 #include "transfer.h"
 #include "session.h"
 #include "driver.h"
@@ -591,7 +592,7 @@ struct obc_session *obc_session_create(const char *source,
 	if (driver == NULL)
 		return NULL;
 
-	conn = dbus_bus_get(DBUS_BUS_SESSION, NULL);
+	conn = obex_get_dbus_connection();
 	if (conn == NULL)
 		return NULL;
 
diff --git a/obexd/client/sync.c b/obexd/client/sync.c
index 92faf4434..fe70b9135 100644
--- a/obexd/client/sync.c
+++ b/obexd/client/sync.c
@@ -21,6 +21,7 @@
 #include "gdbus/gdbus.h"
 
 #include "obexd/src/log.h"
+#include "obexd/src/obexd.h"
 
 #include "transfer.h"
 #include "session.h"
@@ -224,7 +225,7 @@ int sync_init(void)
 
 	DBG("");
 
-	conn = dbus_bus_get(DBUS_BUS_SESSION, NULL);
+	conn = obex_get_dbus_connection();
 	if (!conn)
 		return -EIO;
 
diff --git a/obexd/plugins/pcsuite.c b/obexd/plugins/pcsuite.c
index 07c444ff2..1755ffbbb 100644
--- a/obexd/plugins/pcsuite.c
+++ b/obexd/plugins/pcsuite.c
@@ -322,7 +322,7 @@ static gboolean send_backup_dbus_message(const char *oper,
 
 	file_size = size ? *size : 0;
 
-	conn = g_dbus_setup_bus(DBUS_BUS_SESSION, NULL, NULL);
+	conn = obex_setup_dbus_connection(NULL, NULL);
 
 	if (conn == NULL)
 		return FALSE;
diff --git a/obexd/src/main.c b/obexd/src/main.c
index 151574afa..f0b85672e 100644
--- a/obexd/src/main.c
+++ b/obexd/src/main.c
@@ -41,6 +41,8 @@
 #define DEFAULT_CAP_FILE CONFIGDIR "/capability.xml"
 
 static GMainLoop *main_loop = NULL;
+static DBusConnection *connection;
+
 
 static gboolean signal_handler(GIOChannel *channel, GIOCondition cond,
 							gpointer user_data)
@@ -126,6 +128,7 @@ static char *option_noplugin = NULL;
 
 static gboolean option_autoaccept = FALSE;
 static gboolean option_symlinks = FALSE;
+static gboolean option_system_bus = FALSE;
 
 static gboolean parse_debug(const char *key, const char *value,
 				gpointer user_data, GError **error)
@@ -164,6 +167,8 @@ static const GOptionEntry options[] = {
 				"scripts", "FILE" },
 	{ "auto-accept", 'a', 0, G_OPTION_ARG_NONE, &option_autoaccept,
 				"Automatically accept push requests" },
+	{ "system-bus", 's', 0, G_OPTION_ARG_NONE, &option_system_bus,
+				"Use System bus "},
 	{ NULL },
 };
 
@@ -227,6 +232,26 @@ static gboolean root_folder_setup(char *root, char *root_setup)
 	return is_dir(root);
 }
 
+DBusConnection *obex_get_dbus_connection(void)
+{
+	if (!connection)
+		connection = dbus_bus_get(option_system_bus ?
+				DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, NULL);
+
+	return connection;
+}
+
+DBusConnection *obex_setup_dbus_connection(const char *name,
+					DBusError *error)
+{
+	DBusConnection *connection =
+		g_dbus_setup_bus(option_system_bus ?
+				DBUS_BUS_SYSTEM : DBUS_BUS_SESSION,
+				name, error);
+
+	return connection;
+}
+
 int main(int argc, char *argv[])
 {
 	GOptionContext *context;
diff --git a/obexd/src/manager.c b/obexd/src/manager.c
index 3c0c2a7cc..5a6fd9b4b 100644
--- a/obexd/src/manager.c
+++ b/obexd/src/manager.c
@@ -488,7 +488,7 @@ gboolean manager_init(void)
 
 	dbus_error_init(&err);
 
-	connection = g_dbus_setup_bus(DBUS_BUS_SESSION, OBEXD_SERVICE, &err);
+	connection = obex_setup_dbus_connection(OBEXD_SERVICE, &err);
 	if (connection == NULL) {
 		if (dbus_error_is_set(&err) == TRUE) {
 			fprintf(stderr, "%s\n", err.message);
diff --git a/obexd/src/obex.conf b/obexd/src/obex.conf
new file mode 100644
index 000000000..114bdb882
--- /dev/null
+++ b/obexd/src/obex.conf
@@ -0,0 +1,28 @@
+<!-- This configuration file specifies the required security policies
+     for Bluetooth core daemon to work. -->
+
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+<busconfig>
+
+  <!-- ../system.conf have denied everything, so we just punch some holes -->
+
+  <policy user="root">
+    <allow own="org.bluez.obex"/>
+    <allow send_destination="org.bluez.obex"/>
+    <allow send_interface="org.bluez.obex.Agent1"/>
+    <allow send_interface="org.bluez.obex.Client1"/>
+    <allow send_interface="org.bluez.obex.Session1"/>
+    <allow send_interface="org.bluez.obex.Transfer1"/>
+    <allow send_interface="org.bluez.obex.ObjectPush1"/>
+    <allow send_interface="org.bluez.obex.PhonebookAccess1"/>
+    <allow send_interface="org.bluez.obex.Synchronization1"/>
+    <allow send_interface="org.bluez.obex.MessageAccess1"/>
+    <allow send_interface="org.bluez.obex.Message1"/>
+  </policy>
+
+  <policy context="default">
+    <allow send_destination="org.bluez.obex"/>
+  </policy>
+
+</busconfig>
diff --git a/obexd/src/obexd.h b/obexd/src/obexd.h
index af5265da5..5e5edc4de 100644
--- a/obexd/src/obexd.h
+++ b/obexd/src/obexd.h
@@ -8,6 +8,8 @@
  *
  */
 
+#include <dbus/dbus.h>
+
 #define OBEX_OPP	(1 << 1)
 #define OBEX_FTP	(1 << 2)
 #define OBEX_BIP	(1 << 3)
@@ -28,3 +30,6 @@ gboolean obex_option_auto_accept(void);
 const char *obex_option_root_folder(void);
 gboolean obex_option_symlinks(void);
 const char *obex_option_capability(void);
+DBusConnection *obex_get_dbus_connection(void);
+DBusConnection *obex_setup_dbus_connection(const char *name,
+					DBusError *error);
-- 
2.34.1


