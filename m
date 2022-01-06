Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9C4486B8C
	for <lists+linux-bluetooth@lfdr.de>; Thu,  6 Jan 2022 22:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244090AbiAFVDZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 6 Jan 2022 16:03:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244079AbiAFVDY (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 6 Jan 2022 16:03:24 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F81AC061245
        for <linux-bluetooth@vger.kernel.org>; Thu,  6 Jan 2022 13:03:24 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id t32so3647437pgm.7
        for <linux-bluetooth@vger.kernel.org>; Thu, 06 Jan 2022 13:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JIesEZdQqRmILE9nHDFF/JUI9WFj+g2mHhq8J6Fe1RI=;
        b=hu733lx+xMCC6jfcXLWo/PGYivyGHfr8dnsMlA5EBHyJoeedzIpc1g9zFesum7Klq4
         gXaBTkJ+6ezcElL9FlpA4Ll1MgtTVssNxqzARikfKSuW4gmNupsiZFiwMStlRnPVfZCh
         s7ACH+oWPWiXN8770Z+JkYDfEsdDM6sVs7JwjxxKbM/dZBejXB3vPA+9xb7ziQBS+m7a
         eww0jUxcEGU+VhHsxJkS8OqcbKAi85devEEIPy5Kzn++NLOxA7breIO4j+i/j6L9IzKk
         DJo8xQLMNGE/BZCd9fp2E5196548+YyiyvlYhLtwlWDsDE6S7FdqRZgjrRtgsOiTmkcp
         5HOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JIesEZdQqRmILE9nHDFF/JUI9WFj+g2mHhq8J6Fe1RI=;
        b=mDYhEwW/9FoUPi62znmdDcZhYAgzU6zf1Eou6KrHokt8Wmj7pFQdMAuU9/FVzxOBLI
         X5YAK/bO6Rn7S/yIfEit7QmN8xtN+9ImCgvJXP1jAYjzPDT59BqX73fwTb6Fm1MoXHiN
         ux0YI4WJhDWCsHQJBGQH3uNcKAdEgKAxpOi3h6yiM5uQiqWFCfd02xMYtYOeRwniQ2Kh
         p1JoBDeub9qao5gDFvjijU52w8hlTnkinKnevuatxf/qbH+1hHjQYJtYNe6iUXYnbib2
         Ns0hN1JkjMbTFW8wqOb1RfafYTWotpOLNRwQ70M5EGk82KC58vQJ7VzVQpG2HL4GWJVV
         /j5g==
X-Gm-Message-State: AOAM5331+uvW0b1fgpeZ8TABfJDAC3qBAqp1cLQoKIbvR1doSDeBn5K5
        KNoD9Yvz9XSVbFlkJSUxhe2MLdI72l4=
X-Google-Smtp-Source: ABdhPJxsFI/OatmUrLbvBfI/6FFLcj/rc2y1Dyc4wAdXGDPHVv/WNFj2L1Z/FxovHxbiXyPmquAv7w==
X-Received: by 2002:a63:bd02:: with SMTP id a2mr8076831pgf.351.1641503002584;
        Thu, 06 Jan 2022 13:03:22 -0800 (PST)
Received: from lvondent-mobl4.. (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id s25sm3091853pfg.208.2022.01.06.13.03.22
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 13:03:22 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ 4/4] build: Replace use of g_memdup with util_memdup
Date:   Thu,  6 Jan 2022 13:03:19 -0800
Message-Id: <20220106210319.3620823-4-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106210319.3620823-1-luiz.dentz@gmail.com>
References: <20220106210319.3620823-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This replaces the uses of g_memdup with util_memdup since the former has
been deprecated:

  warning: ‘g_memdup’ is deprecated: Use 'g_memdup2' instead
  [-Wdeprecated-declarations]

g_memdup2 requires bumping glib version which would likely have its
own problems thus why util_memdup was introduced.
---
 Makefile.am                | 10 ++---
 Makefile.obexd             |  1 +
 Makefile.tools             | 11 ++++--
 android/a2dp.c             |  9 +++--
 android/avctp.c            |  5 ++-
 android/avrcp-lib.c        |  2 +-
 android/gatt.c             |  5 ++-
 android/hidhost.c          |  3 +-
 android/tester-main.c      | 77 +++++++++++++++++++++-----------------
 attrib/gatt.c              | 12 +++---
 client/gatt.c              |  2 +-
 gobex/gobex-header.c       |  7 ++--
 gobex/gobex-packet.c       |  5 ++-
 obexd/src/obex.c           |  5 ++-
 plugins/neard.c            |  9 +++--
 plugins/policy.c           |  7 ++--
 profiles/audio/avctp.c     |  9 +++--
 profiles/audio/avrcp.c     | 10 ++---
 profiles/battery/bas.c     |  4 +-
 profiles/battery/battery.c |  4 +-
 profiles/deviceinfo/dis.c  |  4 +-
 profiles/input/hog-lib.c   | 12 +++---
 profiles/scanparam/scpp.c  |  4 +-
 src/eir.c                  |  8 ++--
 tools/gatt-service.c       | 15 ++++----
 tools/mesh-gatt/gatt.c     |  5 ++-
 unit/test-avctp.c          |  4 +-
 unit/test-avdtp.c          |  6 +--
 unit/test-avrcp.c          | 10 ++---
 unit/test-gatt.c           |  4 +-
 unit/test-hfp.c            | 11 +++---
 unit/test-hog.c            | 26 ++++++-------
 unit/test-sdp.c            | 10 +++--
 unit/test-uhid.c           |  2 +-
 34 files changed, 172 insertions(+), 146 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index a26ba9bc7..e391d7ae8 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -506,23 +506,23 @@ unit_tests += unit/test-gobex-header unit/test-gobex-packet unit/test-gobex \
 
 unit_test_gobex_SOURCES = $(gobex_sources) unit/util.c unit/util.h \
 						unit/test-gobex.c
-unit_test_gobex_LDADD = $(GLIB_LIBS)
+unit_test_gobex_LDADD = src/libshared-glib.la $(GLIB_LIBS)
 
 unit_test_gobex_packet_SOURCES = $(gobex_sources) unit/util.c unit/util.h \
 						unit/test-gobex-packet.c
-unit_test_gobex_packet_LDADD = $(GLIB_LIBS)
+unit_test_gobex_packet_LDADD = src/libshared-glib.la $(GLIB_LIBS)
 
 unit_test_gobex_header_SOURCES = $(gobex_sources) unit/util.c unit/util.h \
 						unit/test-gobex-header.c
-unit_test_gobex_header_LDADD = $(GLIB_LIBS)
+unit_test_gobex_header_LDADD = src/libshared-glib.la $(GLIB_LIBS)
 
 unit_test_gobex_transfer_SOURCES = $(gobex_sources) unit/util.c unit/util.h \
 						unit/test-gobex-transfer.c
-unit_test_gobex_transfer_LDADD = $(GLIB_LIBS)
+unit_test_gobex_transfer_LDADD = src/libshared-glib.la $(GLIB_LIBS)
 
 unit_test_gobex_apparam_SOURCES = $(gobex_sources) unit/util.c unit/util.h \
 						unit/test-gobex-apparam.c
-unit_test_gobex_apparam_LDADD = $(GLIB_LIBS)
+unit_test_gobex_apparam_LDADD = src/libshared-glib.la $(GLIB_LIBS)
 endif
 
 unit_tests += unit/test-lib
diff --git a/Makefile.obexd b/Makefile.obexd
index 37a133455..5d1a4ff65 100644
--- a/Makefile.obexd
+++ b/Makefile.obexd
@@ -82,6 +82,7 @@ obexd_src_obexd_SOURCES = $(btio_sources) $(gobex_sources) \
 			obexd/src/map_ap.h
 obexd_src_obexd_LDADD = lib/libbluetooth-internal.la \
 			gdbus/libgdbus-internal.la \
+			src/libshared-glib.la \
 			$(ICAL_LIBS) $(DBUS_LIBS) $(LIBEBOOK_LIBS) \
 			$(LIBEDATASERVER_LIBS) $(GLIB_LIBS) -ldl
 
diff --git a/Makefile.tools b/Makefile.tools
index 0f0331b64..51199b20a 100644
--- a/Makefile.tools
+++ b/Makefile.tools
@@ -302,7 +302,8 @@ tools_mpris_proxy_SOURCES = tools/mpris-proxy.c
 tools_mpris_proxy_LDADD = gdbus/libgdbus-internal.la $(GLIB_LIBS) $(DBUS_LIBS)
 
 tools_gatt_service_SOURCES = tools/gatt-service.c
-tools_gatt_service_LDADD = $(GLIB_LIBS) $(DBUS_LIBS) gdbus/libgdbus-internal.la
+tools_gatt_service_LDADD = gdbus/libgdbus-internal.la \
+			   src/libshared-mainloop.la $(GLIB_LIBS) $(DBUS_LIBS)
 
 profiles_iap_iapd_SOURCES = profiles/iap/main.c
 profiles_iap_iapd_LDADD = gdbus/libgdbus-internal.la $(GLIB_LIBS) $(DBUS_LIBS)
@@ -448,11 +449,12 @@ noinst_PROGRAMS += tools/btmgmt tools/obex-client-tool tools/obex-server-tool \
 tools_obex_client_tool_SOURCES = $(gobex_sources) $(btio_sources) \
 						tools/obex-client-tool.c
 tools_obex_client_tool_LDADD = lib/libbluetooth-internal.la \
-						$(GLIB_LIBS) -lreadline
+			       src/libshared-glib.la $(GLIB_LIBS) -lreadline
 
 tools_obex_server_tool_SOURCES = $(gobex_sources) $(btio_sources) \
 						tools/obex-server-tool.c
-tools_obex_server_tool_LDADD = lib/libbluetooth-internal.la $(GLIB_LIBS)
+tools_obex_server_tool_LDADD = lib/libbluetooth-internal.la \
+			       src/libshared-glib.la $(GLIB_LIBS)
 
 tools_bluetooth_player_SOURCES = tools/bluetooth-player.c
 tools_bluetooth_player_LDADD = gdbus/libgdbus-internal.la \
@@ -461,7 +463,8 @@ tools_bluetooth_player_LDADD = gdbus/libgdbus-internal.la \
 
 tools_obexctl_SOURCES = tools/obexctl.c
 tools_obexctl_LDADD = gdbus/libgdbus-internal.la src/libshared-glib.la \
-				$(GLIB_LIBS) $(DBUS_LIBS) -lreadline
+			src/libshared-glib.la $(GLIB_LIBS) $(DBUS_LIBS) \
+			-lreadline
 
 tools_btmgmt_SOURCES = tools/btmgmt.c src/uuid-helper.c client/display.c
 tools_btmgmt_LDADD = lib/libbluetooth-internal.la src/libshared-mainloop.la \
diff --git a/android/a2dp.c b/android/a2dp.c
index 029107cf5..ee607a32d 100644
--- a/android/a2dp.c
+++ b/android/a2dp.c
@@ -26,6 +26,7 @@
 #include "lib/sdp_lib.h"
 #include "profiles/audio/a2dp-codecs.h"
 #include "src/shared/queue.h"
+#include "src/shared/util.h"
 #include "src/log.h"
 #include "hal-msg.h"
 #include "ipc-common.h"
@@ -428,7 +429,7 @@ static struct a2dp_preset *sbc_select_range(void *caps, uint8_t caps_len,
 
 	p = g_new0(struct a2dp_preset, 1);
 	p->len = conf_len;
-	p->data = g_memdup(conf, p->len);
+	p->data = util_memdup(conf, p->len);
 
 	return p;
 }
@@ -448,7 +449,7 @@ static struct a2dp_preset *aac_select_range(void *caps, uint8_t caps_len,
 
 	p = g_new0(struct a2dp_preset, 1);
 	p->len = conf_len;
-	p->data = g_memdup(conf, p->len);
+	p->data = util_memdup(conf, p->len);
 
 	return p;
 }
@@ -1036,7 +1037,7 @@ static gboolean sep_setconf_ind(struct avdtp *session,
 
 		preset = g_new0(struct a2dp_preset, 1);
 		preset->len = cap->length - sizeof(*codec);
-		preset->data = g_memdup(codec->data, preset->len);
+		preset->data = util_memdup(codec->data, preset->len);
 
 		if (check_config(endpoint, preset) < 0) {
 			preset_free(preset);
@@ -1365,7 +1366,7 @@ static GSList *parse_presets(const struct audio_preset *p, uint8_t count,
 
 		preset = g_new0(struct a2dp_preset, 1);
 		preset->len = p->len;
-		preset->data = g_memdup(p->data, preset->len);
+		preset->data = util_memdup(p->data, preset->len);
 		l = g_slist_append(l, preset);
 
 		len -= preset->len;
diff --git a/android/avctp.c b/android/avctp.c
index 14ebbc391..37b4cec4f 100644
--- a/android/avctp.c
+++ b/android/avctp.c
@@ -31,6 +31,7 @@
 #include <glib.h>
 
 #include "lib/sdp.h"
+#include "src/shared/util.h"
 #include "src/log.h"
 #include "avctp.h"
 
@@ -1177,7 +1178,7 @@ static int avctp_send_req(struct avctp *session, uint8_t code, uint8_t subunit,
 
 	for (i = 0; i < iov_cnt; i++) {
 		pdu[i].iov_len = iov[i].iov_len;
-		pdu[i].iov_base = g_memdup(iov[i].iov_base, iov[i].iov_len);
+		pdu[i].iov_base = util_memdup(iov[i].iov_base, iov[i].iov_len);
 	}
 
 	req = g_new0(struct avctp_control_req, 1);
@@ -1218,7 +1219,7 @@ int avctp_send_browsing_req(struct avctp *session,
 
 	for (i = 0; i < iov_cnt; i++) {
 		pdu[i].iov_len = iov[i].iov_len;
-		pdu[i].iov_base = g_memdup(iov[i].iov_base, iov[i].iov_len);
+		pdu[i].iov_base = util_memdup(iov[i].iov_base, iov[i].iov_len);
 	}
 
 	req = g_new0(struct avctp_browsing_req, 1);
diff --git a/android/avrcp-lib.c b/android/avrcp-lib.c
index 2007d09d2..b342692cb 100644
--- a/android/avrcp-lib.c
+++ b/android/avrcp-lib.c
@@ -2620,7 +2620,7 @@ static char *parse_folder_list(uint8_t *params, uint16_t params_len,
 			return NULL;
 		}
 
-		folders[count] = g_memdup(&params[i], len);
+		folders[count] = util_memdup(&params[i], len);
 		i += len;
 	}
 
diff --git a/android/gatt.c b/android/gatt.c
index a8a0c488b..e8ba5aabb 100644
--- a/android/gatt.c
+++ b/android/gatt.c
@@ -1338,7 +1338,8 @@ static void discover_primary_cb(uint8_t status, GSList *services,
 		}
 
 		bt_uuid_to_uuid128(&uuid, &u128);
-		new_uuid = g_memdup(&u128.value.u128, sizeof(u128.value.u128));
+		new_uuid = util_memdup(&u128.value.u128,
+					sizeof(u128.value.u128));
 
 		uuids = g_slist_prepend(uuids, new_uuid);
 	}
@@ -6633,7 +6634,7 @@ static uint8_t write_prep_request(const uint8_t *cmd, uint16_t cmd_len,
 
 	queue_push_tail(dev->pending_requests, data);
 
-	data->value = g_memdup(value, vlen);
+	data->value = util_memdup(value, vlen);
 	data->length = vlen;
 
 	if (!gatt_db_attribute_write(attrib, offset, value, vlen, cmd[0],
diff --git a/android/hidhost.c b/android/hidhost.c
index 016382e17..b4e5c527f 100644
--- a/android/hidhost.c
+++ b/android/hidhost.c
@@ -689,7 +689,8 @@ static void hid_sdp_search_cb(sdp_list_t *recs, int err, gpointer data)
 				goto fail;
 
 			dev->rd_size = data->unitSize;
-			dev->rd_data = g_memdup(data->val.str, data->unitSize);
+			dev->rd_data = util_memdup(data->val.str,
+							data->unitSize);
 		}
 	}
 
diff --git a/android/tester-main.c b/android/tester-main.c
index ff5ecdf83..317c1de06 100644
--- a/android/tester-main.c
+++ b/android/tester-main.c
@@ -1253,7 +1253,8 @@ static bt_property_t *copy_properties(int num_properties,
 	for (i = 0; i < num_properties; i++) {
 		props[i].type = properties[i].type;
 		props[i].len = properties[i].len;
-		props[i].val = g_memdup(properties[i].val, properties[i].len);
+		props[i].val = util_memdup(properties[i].val,
+						properties[i].len);
 	}
 
 	return props;
@@ -1268,7 +1269,8 @@ static bt_property_t *repack_properties(int num_properties,
 	for (i = 0; i < num_properties; i++) {
 		props[i].type = properties[i]->type;
 		props[i].len = properties[i]->len;
-		props[i].val = g_memdup(properties[i]->val, properties[i]->len);
+		props[i].val = util_memdup(properties[i]->val,
+						properties[i]->len);
 	}
 
 	return props;
@@ -1281,7 +1283,7 @@ static bt_property_t *create_property(bt_property_type_t type, void *val,
 
 	prop->type = type;
 	prop->len = len;
-	prop->val = g_memdup(val, len);
+	prop->val = util_memdup(val, len);
 
 	return prop;
 }
@@ -1615,7 +1617,7 @@ static void gattc_search_result_cb(int conn_id, btgatt_srvc_id_t *srvc_id)
 
 	step->callback = CB_GATTC_SEARCH_RESULT;
 	step->callback_result.conn_id = conn_id;
-	step->callback_result.service = g_memdup(srvc_id, sizeof(*srvc_id));
+	step->callback_result.service = util_memdup(srvc_id, sizeof(*srvc_id));
 
 	schedule_callback_verification(step);
 }
@@ -1639,8 +1641,8 @@ static void gattc_get_characteristic_cb(int conn_id, int status,
 	step->callback = CB_GATTC_GET_CHARACTERISTIC;
 	step->callback_result.status = status;
 	step->callback_result.conn_id = conn_id;
-	step->callback_result.service = g_memdup(srvc_id, sizeof(*srvc_id));
-	step->callback_result.characteristic = g_memdup(char_id,
+	step->callback_result.service = util_memdup(srvc_id, sizeof(*srvc_id));
+	step->callback_result.characteristic = util_memdup(char_id,
 							sizeof(*char_id));
 	step->callback_result.char_prop = char_prop;
 
@@ -1656,10 +1658,10 @@ static void gattc_get_descriptor_cb(int conn_id, int status,
 	step->callback = CB_GATTC_GET_DESCRIPTOR;
 	step->callback_result.status = status;
 	step->callback_result.conn_id = conn_id;
-	step->callback_result.service = g_memdup(srvc_id, sizeof(*srvc_id));
-	step->callback_result.characteristic = g_memdup(char_id,
+	step->callback_result.service = util_memdup(srvc_id, sizeof(*srvc_id));
+	step->callback_result.characteristic = util_memdup(char_id,
 							sizeof(*char_id));
-	step->callback_result.descriptor = g_memdup(descr_id,
+	step->callback_result.descriptor = util_memdup(descr_id,
 							sizeof(*descr_id));
 
 	schedule_callback_verification(step);
@@ -1673,8 +1675,8 @@ static void gattc_get_included_service_cb(int conn_id, int status,
 	step->callback = CB_GATTC_GET_INCLUDED_SERVICE;
 	step->callback_result.status = status;
 	step->callback_result.conn_id = conn_id;
-	step->callback_result.service = g_memdup(srvc_id, sizeof(*srvc_id));
-	step->callback_result.included = g_memdup(incl_srvc_id,
+	step->callback_result.service = util_memdup(srvc_id, sizeof(*srvc_id));
+	step->callback_result.included = util_memdup(incl_srvc_id,
 							sizeof(*srvc_id));
 
 	schedule_callback_verification(step);
@@ -1688,7 +1690,8 @@ static void gattc_read_characteristic_cb(int conn_id, int status,
 	step->callback = CB_GATTC_READ_CHARACTERISTIC;
 	step->callback_result.status = status;
 	step->callback_result.conn_id = conn_id;
-	step->callback_result.read_params = g_memdup(p_data, sizeof(*p_data));
+	step->callback_result.read_params = util_memdup(p_data,
+							sizeof(*p_data));
 
 	schedule_callback_verification(step);
 }
@@ -1701,7 +1704,8 @@ static void gattc_read_descriptor_cb(int conn_id, int status,
 	step->callback = CB_GATTC_READ_DESCRIPTOR;
 	step->callback_result.status = status;
 	step->callback_result.conn_id = conn_id;
-	step->callback_result.read_params = g_memdup(p_data, sizeof(*p_data));
+	step->callback_result.read_params = util_memdup(p_data,
+							sizeof(*p_data));
 
 	schedule_callback_verification(step);
 }
@@ -1714,7 +1718,8 @@ static void gattc_write_characteristic_cb(int conn_id, int status,
 	step->callback = CB_GATTC_WRITE_CHARACTERISTIC;
 	step->callback_result.status = status;
 	step->callback_result.conn_id = conn_id;
-	step->callback_result.write_params = g_memdup(p_data, sizeof(*p_data));
+	step->callback_result.write_params = util_memdup(p_data,
+							sizeof(*p_data));
 
 	schedule_callback_verification(step);
 }
@@ -1727,7 +1732,8 @@ static void gattc_write_descriptor_cb(int conn_id, int status,
 	step->callback = CB_GATTC_WRITE_DESCRIPTOR;
 	step->callback_result.status = status;
 	step->callback_result.conn_id = conn_id;
-	step->callback_result.write_params = g_memdup(p_data, sizeof(*p_data));
+	step->callback_result.write_params = util_memdup(p_data,
+							sizeof(*p_data));
 
 	schedule_callback_verification(step);
 }
@@ -1742,8 +1748,8 @@ static void gattc_register_for_notification_cb(int conn_id, int registered,
 	step->callback = CB_GATTC_REGISTER_FOR_NOTIFICATION;
 	step->callback_result.status = status;
 	step->callback_result.conn_id = conn_id;
-	step->callback_result.service = g_memdup(srvc_id, sizeof(*srvc_id));
-	step->callback_result.characteristic = g_memdup(char_id,
+	step->callback_result.service = util_memdup(srvc_id, sizeof(*srvc_id));
+	step->callback_result.characteristic = util_memdup(char_id,
 							sizeof(*char_id));
 	step->callback_result.notification_registered = registered;
 
@@ -1756,7 +1762,8 @@ static void gattc_notif_cb(int conn_id, btgatt_notify_params_t *p_data)
 
 	step->callback = CB_GATTC_NOTIFY;
 	step->callback_result.conn_id = conn_id;
-	step->callback_result.notify_params = g_memdup(p_data, sizeof(*p_data));
+	step->callback_result.notify_params = util_memdup(p_data,
+							sizeof(*p_data));
 
 	schedule_callback_verification(step);
 }
@@ -1827,8 +1834,8 @@ static void gatts_service_added_cb(int status, int server_if,
 
 	step->callback_result.status = status;
 	step->callback_result.gatt_app_id = server_if;
-	step->callback_result.service = g_memdup(srvc_id, sizeof(*srvc_id));
-	step->callback_result.srvc_handle = g_memdup(&srvc_handle,
+	step->callback_result.service = util_memdup(srvc_id, sizeof(*srvc_id));
+	step->callback_result.srvc_handle = util_memdup(&srvc_handle,
 							sizeof(srvc_handle));
 
 	schedule_callback_verification(step);
@@ -1844,9 +1851,9 @@ static void gatts_included_service_added_cb(int status, int server_if,
 
 	step->callback_result.status = status;
 	step->callback_result.gatt_app_id = server_if;
-	step->callback_result.srvc_handle = g_memdup(&srvc_handle,
+	step->callback_result.srvc_handle = util_memdup(&srvc_handle,
 							sizeof(srvc_handle));
-	step->callback_result.inc_srvc_handle = g_memdup(&inc_srvc_handle,
+	step->callback_result.inc_srvc_handle = util_memdup(&inc_srvc_handle,
 						sizeof(inc_srvc_handle));
 
 	schedule_callback_verification(step);
@@ -1863,10 +1870,10 @@ static void gatts_characteristic_added_cb(int status, int server_if,
 
 	step->callback_result.status = status;
 	step->callback_result.gatt_app_id = server_if;
-	step->callback_result.srvc_handle = g_memdup(&srvc_handle,
+	step->callback_result.srvc_handle = util_memdup(&srvc_handle,
 							sizeof(srvc_handle));
-	step->callback_result.uuid = g_memdup(uuid, sizeof(*uuid));
-	step->callback_result.char_handle = g_memdup(&char_handle,
+	step->callback_result.uuid = util_memdup(uuid, sizeof(*uuid));
+	step->callback_result.char_handle = util_memdup(&char_handle,
 							sizeof(char_handle));
 
 	schedule_callback_verification(step);
@@ -1883,10 +1890,10 @@ static void gatts_descriptor_added_cb(int status, int server_if,
 
 	step->callback_result.status = status;
 	step->callback_result.gatt_app_id = server_if;
-	step->callback_result.srvc_handle = g_memdup(&srvc_handle,
+	step->callback_result.srvc_handle = util_memdup(&srvc_handle,
 							sizeof(srvc_handle));
-	step->callback_result.uuid = g_memdup(uuid, sizeof(*uuid));
-	step->callback_result.desc_handle = g_memdup(&desc_handle,
+	step->callback_result.uuid = util_memdup(uuid, sizeof(*uuid));
+	step->callback_result.desc_handle = util_memdup(&desc_handle,
 							sizeof(desc_handle));
 
 	schedule_callback_verification(step);
@@ -1900,7 +1907,7 @@ static void gatts_service_started_cb(int status, int server_if, int srvc_handle)
 
 	step->callback_result.status = status;
 	step->callback_result.gatt_app_id = server_if;
-	step->callback_result.srvc_handle = g_memdup(&srvc_handle,
+	step->callback_result.srvc_handle = util_memdup(&srvc_handle,
 							sizeof(srvc_handle));
 
 	schedule_callback_verification(step);
@@ -1914,7 +1921,7 @@ static void gatts_service_stopped_cb(int status, int server_if, int srvc_handle)
 
 	step->callback_result.status = status;
 	step->callback_result.gatt_app_id = server_if;
-	step->callback_result.srvc_handle = g_memdup(&srvc_handle,
+	step->callback_result.srvc_handle = util_memdup(&srvc_handle,
 							sizeof(srvc_handle));
 
 	schedule_callback_verification(step);
@@ -1928,7 +1935,7 @@ static void gatts_service_deleted_cb(int status, int server_if, int srvc_handle)
 
 	step->callback_result.status = status;
 	step->callback_result.gatt_app_id = server_if;
-	step->callback_result.srvc_handle = g_memdup(&srvc_handle,
+	step->callback_result.srvc_handle = util_memdup(&srvc_handle,
 							sizeof(srvc_handle));
 
 	schedule_callback_verification(step);
@@ -1945,7 +1952,7 @@ static void gatts_request_read_cb(int conn_id, int trans_id, bt_bdaddr_t *bda,
 
 	step->callback_result.conn_id = conn_id;
 	step->callback_result.trans_id = trans_id;
-	step->callback_result.attr_handle = g_memdup(&attr_handle,
+	step->callback_result.attr_handle = util_memdup(&attr_handle,
 							sizeof(attr_handle));
 	step->callback_result.offset = offset;
 	step->callback_result.is_long = is_long;
@@ -1974,13 +1981,13 @@ static void gatts_request_write_cb(int conn_id, int trans_id, bt_bdaddr_t *bda,
 
 	step->callback_result.conn_id = conn_id;
 	step->callback_result.trans_id = trans_id;
-	step->callback_result.attr_handle = g_memdup(&attr_handle,
+	step->callback_result.attr_handle = util_memdup(&attr_handle,
 							sizeof(attr_handle));
 	step->callback_result.offset = offset;
 	step->callback_result.length = length;
 	step->callback_result.need_rsp = need_rsp;
 	step->callback_result.is_prep = is_prep;
-	step->callback_result.value = g_memdup(&value, length);
+	step->callback_result.value = util_memdup(&value, length);
 
 	/* Utilize property verification mechanism for bdaddr */
 	props[0] = create_property(BT_PROPERTY_BDADDR, bda, sizeof(*bda));
@@ -2169,7 +2176,7 @@ static btmce_mas_instance_t *copy_mas_instances(int num_instances,
 		inst[i].id = instances[i].id;
 		inst[i].scn = instances[i].scn;
 		inst[i].msg_types = instances[i].msg_types;
-		inst[i].p_name = g_memdup(instances[i].p_name,
+		inst[i].p_name = util_memdup(instances[i].p_name,
 						strlen(instances[i].p_name));
 	}
 
diff --git a/attrib/gatt.c b/attrib/gatt.c
index 46b2ca381..b496dd1eb 100644
--- a/attrib/gatt.c
+++ b/attrib/gatt.c
@@ -135,7 +135,7 @@ static void discover_char_unref(void *data)
 
 	g_slist_free_full(dc->characteristics, g_free);
 	g_attrib_unref(dc->attrib);
-	g_free(dc->uuid);
+	free(dc->uuid);
 	g_free(dc);
 }
 
@@ -157,7 +157,7 @@ static void discover_desc_unref(void *data)
 
 	g_slist_free_full(dd->descriptors, g_free);
 	g_attrib_unref(dd->attrib);
-	g_free(dd->uuid);
+	free(dd->uuid);
 	g_free(dd);
 }
 
@@ -696,7 +696,7 @@ guint gatt_discover_char(GAttrib *attrib, uint16_t start, uint16_t end,
 	dc->user_data = user_data;
 	dc->end = end;
 	dc->start = start;
-	dc->uuid = g_memdup(uuid, sizeof(bt_uuid_t));
+	dc->uuid = util_memdup(uuid, sizeof(bt_uuid_t));
 
 	dc->id = g_attrib_send(attrib, 0, buf, plen, char_discovered_cb,
 				discover_char_ref(dc), discover_char_unref);
@@ -905,7 +905,7 @@ static void prepare_write_cb(guint8 status, const guint8 *rpdu, guint16 rlen,
 	if (long_write->offset == long_write->vlen) {
 		execute_write(long_write->attrib, ATT_WRITE_ALL_PREP_WRITES,
 				long_write->func, long_write->user_data);
-		g_free(long_write->value);
+		free(long_write->value);
 		g_free(long_write);
 
 		return;
@@ -964,7 +964,7 @@ guint gatt_write_char(GAttrib *attrib, uint16_t handle, const uint8_t *value,
 	long_write->func = func;
 	long_write->user_data = user_data;
 	long_write->handle = handle;
-	long_write->value = g_memdup(value, vlen);
+	long_write->value = util_memdup(value, vlen);
 	long_write->vlen = vlen;
 
 	return prepare_write(long_write);
@@ -1130,7 +1130,7 @@ guint gatt_discover_desc(GAttrib *attrib, uint16_t start, uint16_t end,
 	dd->user_data = user_data;
 	dd->start = start;
 	dd->end = end;
-	dd->uuid = g_memdup(uuid, sizeof(bt_uuid_t));
+	dd->uuid = util_memdup(uuid, sizeof(bt_uuid_t));
 
 	dd->id = g_attrib_send(attrib, 0, buf, plen, desc_discovered_cb,
 				discover_desc_ref(dd), discover_desc_unref);
diff --git a/client/gatt.c b/client/gatt.c
index 11f70dc4f..13872c794 100644
--- a/client/gatt.c
+++ b/client/gatt.c
@@ -811,7 +811,7 @@ static uint8_t *str2bytearray(char *arg, size_t *val_len)
 
 	*val_len = i;
 
-	return g_memdup(value, i);
+	return util_memdup(value, i);
 }
 
 void gatt_write_attribute(GDBusProxy *proxy, int argc, char *argv[])
diff --git a/gobex/gobex-header.c b/gobex/gobex-header.c
index 011d33d1a..002ba8861 100644
--- a/gobex/gobex-header.c
+++ b/gobex/gobex-header.c
@@ -15,6 +15,7 @@
 
 #include "gobex-header.h"
 #include "gobex-debug.h"
+#include "src/shared/util.h"
 
 /* Header types */
 #define G_OBEX_HDR_ENC_UNICODE	(0 << 6)
@@ -222,7 +223,7 @@ GObexHeader *g_obex_header_decode(const void *data, gsize len,
 
 		switch (data_policy) {
 		case G_OBEX_DATA_COPY:
-			header->v.data = g_memdup(ptr, header->vlen);
+			header->v.data = util_memdup(ptr, header->vlen);
 			break;
 		case G_OBEX_DATA_REF:
 			header->extdata = TRUE;
@@ -282,7 +283,7 @@ void g_obex_header_free(GObexHeader *header)
 		break;
 	case G_OBEX_HDR_ENC_BYTES:
 		if (!header->extdata)
-			g_free(header->v.data);
+			free(header->v.data);
 		break;
 	case G_OBEX_HDR_ENC_UINT8:
 	case G_OBEX_HDR_ENC_UINT32:
@@ -410,7 +411,7 @@ GObexHeader *g_obex_header_new_bytes(guint8 id, const void *data, gsize len)
 	header->id = id;
 	header->vlen = len;
 	header->hlen = len + 3;
-	header->v.data = g_memdup(data, len);
+	header->v.data = util_memdup(data, len);
 
 	return header;
 }
diff --git a/gobex/gobex-packet.c b/gobex/gobex-packet.c
index 11937a5a5..8ae78b0f6 100644
--- a/gobex/gobex-packet.c
+++ b/gobex/gobex-packet.c
@@ -17,6 +17,7 @@
 #include "gobex-defs.h"
 #include "gobex-packet.h"
 #include "gobex-debug.h"
+#include "src/shared/util.h"
 
 #define FINAL_BIT 0x80
 
@@ -201,7 +202,7 @@ gboolean g_obex_packet_set_data(GObexPacket *pkt, const void *data, gsize len,
 
 	switch (data_policy) {
 	case G_OBEX_DATA_COPY:
-		pkt->data.buf = g_memdup(data, len);
+		pkt->data.buf = util_memdup(data, len);
 		break;
 	case G_OBEX_DATA_REF:
 		pkt->data.buf_ref = data;
@@ -259,7 +260,7 @@ void g_obex_packet_free(GObexPacket *pkt)
 	switch (pkt->data_policy) {
 	case G_OBEX_DATA_INHERIT:
 	case G_OBEX_DATA_COPY:
-		g_free(pkt->data.buf);
+		free(pkt->data.buf);
 		break;
 	case G_OBEX_DATA_REF:
 		break;
diff --git a/obexd/src/obex.c b/obexd/src/obex.c
index 9f992ec18..3a68fd66c 100644
--- a/obexd/src/obex.c
+++ b/obexd/src/obex.c
@@ -40,6 +40,7 @@
 #include "mimetype.h"
 #include "service.h"
 #include "transport.h"
+#include "src/shared/util.h"
 
 typedef struct {
 	uint8_t  version;
@@ -145,7 +146,7 @@ static void os_reset_session(struct obex_session *os)
 		os->path = NULL;
 	}
 	if (os->apparam) {
-		g_free(os->apparam);
+		free(os->apparam);
 		os->apparam = NULL;
 		os->apparam_len = 0;
 	}
@@ -594,7 +595,7 @@ static void parse_apparam(struct obex_session *os, GObexPacket *req)
 	if (!g_obex_header_get_bytes(hdr, &apparam, &len))
 		return;
 
-	os->apparam = g_memdup(apparam, len);
+	os->apparam = util_memdup(apparam, len);
 	os->apparam_len = len;
 	DBG("APPARAM");
 }
diff --git a/plugins/neard.c b/plugins/neard.c
index e07b51106..a75527148 100644
--- a/plugins/neard.c
+++ b/plugins/neard.c
@@ -30,6 +30,7 @@
 #include "src/eir.h"
 #include "src/agent.h"
 #include "src/btd.h"
+#include "src/shared/util.h"
 
 #define NEARD_NAME "org.neard"
 #define NEARD_PATH "/"
@@ -71,7 +72,7 @@ static void free_oob_params(struct oob_params *params)
 	g_free(params->name);
 	g_free(params->hash);
 	g_free(params->randomizer);
-	g_free(params->pin);
+	free(params->pin);
 }
 
 static DBusMessage *error_reply(DBusMessage *msg, int error)
@@ -407,10 +408,10 @@ static int process_nokia_long (void *data, size_t size, uint8_t marker,
 		remote->name = g_strndup((char *)n->name, n->name_len);
 
 	if (marker == 0x01) {
-		remote->pin = g_memdup(n->authentication, 4);
+		remote->pin = util_memdup(n->authentication, 4);
 		remote->pin_len = 4;
 	} else if (marker == 0x02) {
-		remote->pin = g_memdup(n->authentication, 16);
+		remote->pin = util_memdup(n->authentication, 16);
 		remote->pin_len = 16;
 	}
 
@@ -439,7 +440,7 @@ static int process_nokia_short (void *data, size_t size,
 	if (n->name_len > 0)
 		remote->name = g_strndup((char *)n->name, n->name_len);
 
-	remote->pin = g_memdup(n->authentication, 4);
+	remote->pin = util_memdup(n->authentication, 4);
 	remote->pin_len = 4;
 
 	return 0;
diff --git a/plugins/policy.c b/plugins/policy.c
index 051db82e1..48f5db7d3 100644
--- a/plugins/policy.c
+++ b/plugins/policy.c
@@ -32,6 +32,7 @@
 #include "src/profile.h"
 #include "src/btd.h"
 #include "src/shared/timeout.h"
+#include "src/shared/util.h"
 
 #define CONTROL_CONNECT_TIMEOUT 2
 #define SOURCE_RETRY_TIMEOUT 2
@@ -855,7 +856,7 @@ static int policy_init(void)
 		reconnect_attempts = default_attempts;
 		reconnect_intervals_len = sizeof(default_intervals) /
 						sizeof(*reconnect_intervals);
-		reconnect_intervals = g_memdup(default_intervals,
+		reconnect_intervals = util_memdup(default_intervals,
 						sizeof(default_intervals));
 		goto done;
 	}
@@ -886,7 +887,7 @@ static int policy_init(void)
 		g_clear_error(&gerr);
 		reconnect_intervals_len = sizeof(default_intervals) /
 						sizeof(*reconnect_intervals);
-		reconnect_intervals = g_memdup(default_intervals,
+		reconnect_intervals = util_memdup(default_intervals,
 						sizeof(default_intervals));
 	}
 
@@ -919,7 +920,7 @@ static void policy_exit(void)
 	if (reconnect_uuids)
 		g_strfreev(reconnect_uuids);
 
-	g_free(reconnect_intervals);
+	free(reconnect_intervals);
 
 	g_slist_free_full(reconnects, reconnect_destroy);
 
diff --git a/profiles/audio/avctp.c b/profiles/audio/avctp.c
index 64d1a8504..6f64f162b 100644
--- a/profiles/audio/avctp.c
+++ b/profiles/audio/avctp.c
@@ -40,6 +40,7 @@
 #include "src/log.h"
 #include "src/error.h"
 #include "src/shared/timeout.h"
+#include "src/shared/util.h"
 
 #include "avctp.h"
 #include "avrcp.h"
@@ -760,7 +761,7 @@ static void control_req_destroy(void *data)
 						NULL, 0, req->user_data);
 
 done:
-	g_free(req->operands);
+	free(req->operands);
 	g_free(req);
 }
 
@@ -776,7 +777,7 @@ static void browsing_req_destroy(void *data)
 	req->func(session, NULL, 0, req->user_data);
 
 done:
-	g_free(req->operands);
+	free(req->operands);
 	g_free(req);
 }
 
@@ -1727,7 +1728,7 @@ static int avctp_send_req(struct avctp *session, uint8_t code,
 	req->subunit = subunit;
 	req->op = opcode;
 	req->func = func;
-	req->operands = g_memdup(operands, operand_count);
+	req->operands = util_memdup(operands, operand_count);
 	req->operand_count = operand_count;
 	req->user_data = user_data;
 
@@ -1765,7 +1766,7 @@ int avctp_send_browsing_req(struct avctp *session,
 
 	req = g_new0(struct avctp_browsing_req, 1);
 	req->func = func;
-	req->operands = g_memdup(operands, operand_count);
+	req->operands = util_memdup(operands, operand_count);
 	req->operand_count = operand_count;
 	req->user_data = user_data;
 
diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
index 7c280203c..d4e19ffc0 100644
--- a/profiles/audio/avrcp.c
+++ b/profiles/audio/avrcp.c
@@ -1298,7 +1298,7 @@ static uint8_t avrcp_handle_get_current_player_value(struct avrcp *session,
 	 * Save a copy of requested settings because we can override them
 	 * while responding
 	 */
-	settings = g_memdup(&pdu->params[1], pdu->params[0]);
+	settings = util_memdup(&pdu->params[1], pdu->params[0]);
 	len = 0;
 
 	/*
@@ -1323,7 +1323,7 @@ static uint8_t avrcp_handle_get_current_player_value(struct avrcp *session,
 		pdu->params[++len] = val;
 	}
 
-	g_free(settings);
+	free(settings);
 
 	if (len) {
 		pdu->params[0] = len / 2;
@@ -2801,7 +2801,7 @@ static gboolean avrcp_set_browsed_player_rsp(struct avctp *conn,
 			break;
 		}
 
-		folders[count] = g_memdup(&pdu->params[i], len);
+		folders[count] = util_memdup(&pdu->params[i], len);
 		i += len;
 	}
 
@@ -2888,7 +2888,7 @@ static void avrcp_player_parse_features(struct avrcp_player *player,
 {
 	struct media_player *mp = player->user_data;
 
-	player->features = g_memdup(features, 16);
+	player->features = util_memdup(features, 16);
 
 	if (features[7] & 0x08) {
 		media_player_set_browsable(mp, true);
@@ -3622,7 +3622,7 @@ static void player_destroy(gpointer data)
 	g_slist_free(player->sessions);
 	g_free(player->path);
 	g_free(player->change_path);
-	g_free(player->features);
+	free(player->features);
 	g_free(player);
 }
 
diff --git a/profiles/battery/bas.c b/profiles/battery/bas.c
index 3c6173b61..16ff22e19 100644
--- a/profiles/battery/bas.c
+++ b/profiles/battery/bas.c
@@ -62,7 +62,7 @@ static void bas_free(struct bt_bas *bas)
 {
 	bt_bas_detach(bas);
 
-	g_free(bas->primary);
+	free(bas->primary);
 	queue_destroy(bas->gatt_op, (void *) destroy_gatt_req);
 	free(bas);
 }
@@ -75,7 +75,7 @@ struct bt_bas *bt_bas_new(void *primary)
 	bas->gatt_op = queue_new();
 
 	if (primary)
-		bas->primary = g_memdup(primary, sizeof(*bas->primary));
+		bas->primary = util_memdup(primary, sizeof(*bas->primary));
 
 	return bt_bas_ref(bas);
 }
diff --git a/profiles/battery/battery.c b/profiles/battery/battery.c
index 176d127f6..02d024d92 100644
--- a/profiles/battery/battery.c
+++ b/profiles/battery/battery.c
@@ -66,7 +66,7 @@ static void batt_free(struct batt *batt)
 	gatt_db_unref(batt->db);
 	bt_gatt_client_unref(batt->client);
 	btd_device_unref(batt->device);
-	g_free (batt->initial_value);
+	free(batt->initial_value);
 	if (batt->battery)
 		btd_battery_unregister(batt->battery);
 	g_free(batt);
@@ -159,7 +159,7 @@ static void read_initial_battery_level_cb(bool success,
 	if (!length)
 		return;
 
-	batt->initial_value = g_memdup(value, length);
+	batt->initial_value = util_memdup(value, length);
 
 	/* request notify */
 	batt->batt_level_cb_id =
diff --git a/profiles/deviceinfo/dis.c b/profiles/deviceinfo/dis.c
index 87fa63306..f660179ed 100644
--- a/profiles/deviceinfo/dis.c
+++ b/profiles/deviceinfo/dis.c
@@ -72,7 +72,7 @@ static void dis_free(struct bt_dis *dis)
 {
 	bt_dis_detach(dis);
 
-	g_free(dis->primary);
+	free(dis->primary);
 	queue_destroy(dis->gatt_op, (void *) destroy_gatt_req);
 	g_free(dis);
 }
@@ -143,7 +143,7 @@ struct bt_dis *bt_dis_new_primary(void *primary)
 	dis->gatt_op = queue_new();
 
 	if (primary)
-		dis->primary = g_memdup(primary, sizeof(*dis->primary));
+		dis->primary = util_memdup(primary, sizeof(*dis->primary));
 
 	return bt_dis_ref(dis);
 }
diff --git a/profiles/input/hog-lib.c b/profiles/input/hog-lib.c
index 3bbe42370..d37caa1f1 100644
--- a/profiles/input/hog-lib.c
+++ b/profiles/input/hog-lib.c
@@ -527,9 +527,9 @@ static void report_read_cb(guint8 status, const guint8 *pdu, guint16 len,
 	}
 
 	if (report->value)
-		g_free(report->value);
+		free(report->value);
 
-	report->value = g_memdup(pdu, len);
+	report->value = util_memdup(pdu, len);
 	report->len = len;
 }
 
@@ -1217,7 +1217,7 @@ static void report_free(void *data)
 {
 	struct report *report = data;
 
-	g_free(report->value);
+	free(report->value);
 	g_free(report);
 }
 
@@ -1241,7 +1241,7 @@ static void hog_free(void *data)
 	bt_uhid_unref(hog->uhid);
 	g_slist_free_full(hog->reports, report_free);
 	g_free(hog->name);
-	g_free(hog->primary);
+	free(hog->primary);
 	queue_destroy(hog->gatt_op, (void *) destroy_gatt_req);
 	if (hog->gatt_db)
 		gatt_db_unref(hog->gatt_db);
@@ -1609,7 +1609,7 @@ static void hog_attach_hog(struct bt_hog *hog, struct gatt_primary *primary)
 	struct bt_hog *instance;
 
 	if (!hog->primary) {
-		hog->primary = g_memdup(primary, sizeof(*primary));
+		hog->primary = util_memdup(primary, sizeof(*primary));
 		discover_char(hog, hog->attrib, primary->range.start,
 						primary->range.end, NULL,
 						char_discovered_cb, hog);
@@ -1623,7 +1623,7 @@ static void hog_attach_hog(struct bt_hog *hog, struct gatt_primary *primary)
 	if (!instance)
 		return;
 
-	instance->primary = g_memdup(primary, sizeof(*primary));
+	instance->primary = util_memdup(primary, sizeof(*primary));
 	find_included(instance, hog->attrib, primary->range.start,
 			primary->range.end, find_included_cb, instance);
 
diff --git a/profiles/scanparam/scpp.c b/profiles/scanparam/scpp.c
index da38a6aaa..4be8b26cc 100644
--- a/profiles/scanparam/scpp.c
+++ b/profiles/scanparam/scpp.c
@@ -91,7 +91,7 @@ static void scpp_free(struct bt_scpp *scan)
 {
 	bt_scpp_detach(scan);
 
-	g_free(scan->primary);
+	free(scan->primary);
 	queue_destroy(scan->gatt_op, NULL); /* cleared in bt_scpp_detach */
 	g_free(scan);
 }
@@ -110,7 +110,7 @@ struct bt_scpp *bt_scpp_new(void *primary)
 	scan->gatt_op = queue_new();
 
 	if (primary)
-		scan->primary = g_memdup(primary, sizeof(*scan->primary));
+		scan->primary = util_memdup(primary, sizeof(*scan->primary));
 
 	return bt_scpp_ref(scan);
 }
diff --git a/src/eir.c b/src/eir.c
index 0f5d14fcd..2f9ee036f 100644
--- a/src/eir.c
+++ b/src/eir.c
@@ -53,9 +53,9 @@ void eir_data_free(struct eir_data *eir)
 	eir->services = NULL;
 	g_free(eir->name);
 	eir->name = NULL;
-	g_free(eir->hash);
+	free(eir->hash);
 	eir->hash = NULL;
-	g_free(eir->randomizer);
+	free(eir->randomizer);
 	eir->randomizer = NULL;
 	g_slist_free_full(eir->msd_list, g_free);
 	eir->msd_list = NULL;
@@ -323,13 +323,13 @@ void eir_parse(struct eir_data *eir, const uint8_t *eir_data, uint8_t eir_len)
 		case EIR_SSP_HASH:
 			if (data_len < 16)
 				break;
-			eir->hash = g_memdup(data, 16);
+			eir->hash = util_memdup(data, 16);
 			break;
 
 		case EIR_SSP_RANDOMIZER:
 			if (data_len < 16)
 				break;
-			eir->randomizer = g_memdup(data, 16);
+			eir->randomizer = util_memdup(data, 16);
 			break;
 
 		case EIR_DEVICE_ID:
diff --git a/tools/gatt-service.c b/tools/gatt-service.c
index 631c4f249..ed6b06f1e 100644
--- a/tools/gatt-service.c
+++ b/tools/gatt-service.c
@@ -26,6 +26,7 @@
 #include "gdbus/gdbus.h"
 
 #include "src/error.h"
+#include "src/shared/util.h"
 
 #define GATT_MGR_IFACE			"org.bluez.GattManager1"
 #define GATT_SERVICE_IFACE		"org.bluez.GattService1"
@@ -126,8 +127,8 @@ static gboolean desc_get_value(const GDBusPropertyTable *property,
 
 static void desc_write(struct descriptor *desc, const uint8_t *value, int len)
 {
-	g_free(desc->value);
-	desc->value = g_memdup(value, len);
+	free(desc->value);
+	desc->value = util_memdup(value, len);
 	desc->vlen = len;
 
 	g_dbus_emit_property_changed(connection, desc->path,
@@ -264,8 +265,8 @@ static gboolean chr_get_props(const GDBusPropertyTable *property,
 
 static void chr_write(struct characteristic *chr, const uint8_t *value, int len)
 {
-	g_free(chr->value);
-	chr->value = g_memdup(value, len);
+	free(chr->value);
+	chr->value = util_memdup(value, len);
 	chr->vlen = len;
 
 	g_dbus_emit_property_changed(connection, chr->path, GATT_CHR_IFACE,
@@ -388,7 +389,7 @@ static void chr_iface_destroy(gpointer user_data)
 
 	g_free(chr->uuid);
 	g_free(chr->service);
-	g_free(chr->value);
+	free(chr->value);
 	g_free(chr->path);
 	g_free(chr);
 }
@@ -398,7 +399,7 @@ static void desc_iface_destroy(gpointer user_data)
 	struct descriptor *desc = user_data;
 
 	g_free(desc->uuid);
-	g_free(desc->value);
+	free(desc->value);
 	g_free(desc->path);
 	g_free(desc);
 }
@@ -592,7 +593,7 @@ static gboolean register_characteristic(const char *chr_uuid,
 
 	chr = g_new0(struct characteristic, 1);
 	chr->uuid = g_strdup(chr_uuid);
-	chr->value = g_memdup(value, vlen);
+	chr->value = util_memdup(value, vlen);
 	chr->vlen = vlen;
 	chr->props = props;
 	chr->service = g_strdup(service_path);
diff --git a/tools/mesh-gatt/gatt.c b/tools/mesh-gatt/gatt.c
index c8a8123fb..ab9743cd1 100644
--- a/tools/mesh-gatt/gatt.c
+++ b/tools/mesh-gatt/gatt.c
@@ -24,6 +24,7 @@
 
 #include "src/shared/io.h"
 #include "src/shared/shell.h"
+#include "src/shared/util.h"
 #include "gdbus/gdbus.h"
 #include "lib/bluetooth.h"
 #include "lib/uuid.h"
@@ -86,7 +87,7 @@ static void write_data_free(void *user_data)
 {
 	struct write_data *data = user_data;
 
-	g_free(data->gatt_data);
+	free(data->gatt_data);
 	free(data);
 }
 
@@ -338,7 +339,7 @@ bool mesh_gatt_write(GDBusProxy *proxy, uint8_t *buf, uint16_t len,
 	/* TODO: should keep in queue in case we need to cancel write? */
 
 	data->gatt_len = len;
-	data->gatt_data = g_memdup(buf, len);
+	data->gatt_data = util_memdup(buf, len);
 	data->gatt_data[0] &= GATT_TYPE_MASK;
 	data->iov.iov_base = data->gatt_data;
 	data->iov.iov_len = len;
diff --git a/unit/test-avctp.c b/unit/test-avctp.c
index fa7db59c8..25fd3abc2 100644
--- a/unit/test-avctp.c
+++ b/unit/test-avctp.c
@@ -53,7 +53,7 @@ struct context {
 #define raw_pdu(args...)					\
 	{							\
 		.valid = true,					\
-		.data = g_memdup(data(args), sizeof(data(args))), \
+		.data = util_memdup(data(args), sizeof(data(args))), \
 		.size = sizeof(data(args)),			\
 	}
 
@@ -64,7 +64,7 @@ struct context {
 		};							\
 		static struct test_data data;				\
 		data.test_name = g_strdup(name);			\
-		data.pdu_list = g_memdup(pdus, sizeof(pdus));		\
+		data.pdu_list = util_memdup(pdus, sizeof(pdus));	\
 		tester_add(name, &data, NULL, function, NULL);		\
 	} while (0)
 
diff --git a/unit/test-avdtp.c b/unit/test-avdtp.c
index 4e8a68c6b..2e49def43 100644
--- a/unit/test-avdtp.c
+++ b/unit/test-avdtp.c
@@ -48,7 +48,7 @@ struct test_data {
 #define raw_pdu(args...) \
 	{							\
 		.valid = true,					\
-		.data = g_memdup(data(args), sizeof(data(args))), \
+		.data = util_memdup(data(args), sizeof(data(args))), \
 		.size = sizeof(data(args)),			\
 	}
 
@@ -56,7 +56,7 @@ struct test_data {
 	{							\
 		.valid = true,					\
 		.fragmented = true,				\
-		.data = g_memdup(data(args), sizeof(data(args))), \
+		.data = util_memdup(data(args), sizeof(data(args))), \
 		.size = sizeof(data(args)),			\
 	}
 
@@ -67,7 +67,7 @@ struct test_data {
 		};							\
 		static struct test_data data;				\
 		data.test_name = g_strdup(name);			\
-		data.pdu_list = g_memdup(pdus, sizeof(pdus));		\
+		data.pdu_list = util_memdup(pdus, sizeof(pdus));	\
 		tester_add(name, &data, NULL, function, NULL);	\
 	} while (0)
 
diff --git a/unit/test-avrcp.c b/unit/test-avrcp.c
index 34a70377d..b637a8a1b 100644
--- a/unit/test-avrcp.c
+++ b/unit/test-avrcp.c
@@ -61,7 +61,7 @@ struct context {
 #define raw_pdu(args...)					\
 	{							\
 		.valid = true,					\
-		.data = g_memdup(data(args), sizeof(data(args))), \
+		.data = util_memdup(data(args), sizeof(data(args))), \
 		.size = sizeof(data(args)),			\
 	}
 
@@ -69,7 +69,7 @@ struct context {
 	{							\
 		.valid = true,					\
 		.browse = true,					\
-		.data = g_memdup(data(args), sizeof(data(args))), \
+		.data = util_memdup(data(args), sizeof(data(args))), \
 		.size = sizeof(data(args)),			\
 	}
 
@@ -77,7 +77,7 @@ struct context {
 	{							\
 		.valid = true,					\
 		.fragmented = true,				\
-		.data = g_memdup(data(args), sizeof(data(args))), \
+		.data = util_memdup(data(args), sizeof(data(args))), \
 		.size = sizeof(data(args)),			\
 	}
 
@@ -85,7 +85,7 @@ struct context {
 	{							\
 		.valid = true,					\
 		.continuing = true,				\
-		.data = g_memdup(data(args), sizeof(data(args))), \
+		.data = util_memdup(data(args), sizeof(data(args))), \
 		.size = sizeof(data(args)),			\
 	}
 
@@ -96,7 +96,7 @@ struct context {
 		};							\
 		static struct test_data data;				\
 		data.test_name = g_strdup(name);			\
-		data.pdu_list = g_memdup(pdus, sizeof(pdus));		\
+		data.pdu_list = util_memdup(pdus, sizeof(pdus));	\
 		tester_add(name, &data, NULL, function, NULL);		\
 	} while (0)
 
diff --git a/unit/test-gatt.c b/unit/test-gatt.c
index 6a47268e6..f92d860c4 100644
--- a/unit/test-gatt.c
+++ b/unit/test-gatt.c
@@ -73,7 +73,7 @@ struct context {
 #define raw_pdu(args...)					\
 	{							\
 		.valid = true,					\
-		.data = g_memdup(data(args), sizeof(data(args))), \
+		.data = util_memdup(data(args), sizeof(data(args))), \
 		.size = sizeof(data(args)),			\
 	}
 
@@ -94,7 +94,7 @@ struct context {
 		data.uuid = bt_uuid;					\
 		data.step = test_step;					\
 		data.source_db = db;					\
-		data.pdu_list = g_memdup(pdus, sizeof(pdus));		\
+		data.pdu_list = util_memdup(pdus, sizeof(pdus));	\
 		tester_add(name, &data, NULL, function, NULL);		\
 	} while (0)
 
diff --git a/unit/test-hfp.c b/unit/test-hfp.c
index f504724d7..b4af99d53 100644
--- a/unit/test-hfp.c
+++ b/unit/test-hfp.c
@@ -17,6 +17,7 @@
 #include <glib.h>
 #include "src/shared/hfp.h"
 #include "src/shared/tester.h"
+#include "src/shared/util.h"
 
 struct context {
 	guint watch_id;
@@ -50,7 +51,7 @@ struct test_data {
 #define raw_pdu(args...)					\
 	{							\
 		.valid = true,					\
-		.data = g_memdup(data(args), sizeof(data(args))), \
+		.data = util_memdup(data(args), sizeof(data(args))), \
 		.size = sizeof(data(args)),			\
 	}
 
@@ -62,7 +63,7 @@ struct test_data {
 #define type_pdu(cmd_type, args...)				\
 	{							\
 		.valid = true,					\
-		.data = g_memdup(data(args), sizeof(data(args))), \
+		.data = util_memdup(data(args), sizeof(data(args))), \
 		.size = sizeof(data(args)),			\
 		.type = cmd_type,				\
 	}
@@ -70,7 +71,7 @@ struct test_data {
 #define frg_pdu(args...)					\
 	{							\
 		.valid = true,					\
-		.data = g_memdup(data(args), sizeof(data(args))), \
+		.data = util_memdup(data(args), sizeof(data(args))), \
 		.size = sizeof(data(args)),			\
 		.fragmented = true,				\
 	}
@@ -82,7 +83,7 @@ struct test_data {
 		};							\
 		static struct test_data data;				\
 		data.test_name = g_strdup(name);			\
-		data.pdu_list = g_memdup(pdus, sizeof(pdus));		\
+		data.pdu_list = util_memdup(pdus, sizeof(pdus));	\
 		data.result_func = result_function;			\
 		tester_add(name, &data, NULL, function, NULL);		\
 		data.test_handler = test_handler;			\
@@ -96,7 +97,7 @@ struct test_data {
 		};							\
 		static struct test_data data;				\
 		data.test_name = g_strdup(name);			\
-		data.pdu_list = g_memdup(pdus, sizeof(pdus));		\
+		data.pdu_list = util_memdup(pdus, sizeof(pdus));	\
 		data.hf_result_func = result_func;			\
 		data.response_func = response_function;			\
 		tester_add(name, &data, NULL, function, NULL);		\
diff --git a/unit/test-hog.c b/unit/test-hog.c
index 116a5cb07..067497de4 100644
--- a/unit/test-hog.c
+++ b/unit/test-hog.c
@@ -59,24 +59,24 @@ struct context {
 #define raw_pdu(args...)					\
 {								\
 	.valid = true,						\
-	.data = g_memdup(data(args), sizeof(data(args))),	\
+	.data = util_memdup(data(args), sizeof(data(args))),	\
 	.size = sizeof(data(args)),				\
 }
 
-#define false_pdu()	\
-{						\
-		.valid = false, \
+#define false_pdu()						\
+{								\
+		.valid = false,					\
 }
 
-#define define_test(name, function, args...)      \
-	do {    \
-		const struct test_pdu pdus[] = {			\
-			args, { }					\
-		};		\
-		static struct test_data data;      \
-		data.test_name = g_strdup(name);   \
-		data.pdu_list = g_memdup(pdus, sizeof(pdus));		\
-		tester_add(name, &data, NULL, function, NULL);     \
+#define define_test(name, function, args...)			\
+	do {							\
+		const struct test_pdu pdus[] = {		\
+			args, { }				\
+		};						\
+		static struct test_data data;			\
+		data.test_name = g_strdup(name);		\
+		data.pdu_list = util_memdup(pdus, sizeof(pdus));\
+		tester_add(name, &data, NULL, function, NULL);	\
 	} while (0)
 
 static gboolean context_quit(gpointer user_data)
diff --git a/unit/test-sdp.c b/unit/test-sdp.c
index 8f95fcb71..5c04a71eb 100644
--- a/unit/test-sdp.c
+++ b/unit/test-sdp.c
@@ -47,14 +47,16 @@ struct test_data {
 #define raw_pdu(args...) \
 	{							\
 		.valid = true,					\
-		.raw_data = g_memdup(raw_data(args), sizeof(raw_data(args))), \
+		.raw_data = util_memdup(raw_data(args),		\
+					sizeof(raw_data(args))), \
 		.raw_size = sizeof(raw_data(args)),		\
 	}
 
 #define raw_pdu_cont(cont, args...) \
 	{							\
 		.valid = true,					\
-		.raw_data = g_memdup(raw_data(args), sizeof(raw_data(args))), \
+		.raw_data = util_memdup(raw_data(args),		\
+					sizeof(raw_data(args))), \
 		.raw_size = sizeof(raw_data(args)),		\
 		.cont_len = cont,				\
 	}
@@ -66,7 +68,7 @@ struct test_data {
 		};							\
 		static struct test_data data;				\
 		data.mtu = _mtu;					\
-		data.pdu_list = g_memdup(pdus, sizeof(pdus));		\
+		data.pdu_list = util_memdup(pdus, sizeof(pdus));	\
 		tester_add(name, &data, NULL, test_sdp, NULL);		\
 	} while (0)
 
@@ -92,7 +94,7 @@ struct test_data_de {
 #define define_test_de_attr(name, input, exp) \
 	do {								\
 		static struct test_data_de data;			\
-		data.input_data = g_memdup(input, sizeof(input));	\
+		data.input_data = util_memdup(input, sizeof(input));	\
 		data.input_size = sizeof(input);			\
 		data.expected = exp;					\
 		tester_add("/sdp/DE/ATTR/" name, &data,	NULL,		\
diff --git a/unit/test-uhid.c b/unit/test-uhid.c
index 001d39a3d..8a8eef855 100644
--- a/unit/test-uhid.c
+++ b/unit/test-uhid.c
@@ -61,7 +61,7 @@ struct context {
 		};							\
 		static struct test_data data;				\
 		data.test_name = g_strdup(name);			\
-		data.pdu_list = g_memdup(pdus, sizeof(pdus));		\
+		data.pdu_list = util_memdup(pdus, sizeof(pdus));	\
 		tester_add(name, &data, NULL, function, NULL);		\
 	} while (0)
 
-- 
2.33.1

