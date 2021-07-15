Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C143C956C
	for <lists+linux-bluetooth@lfdr.de>; Thu, 15 Jul 2021 03:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhGOBOP (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 14 Jul 2021 21:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbhGOBOO (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 14 Jul 2021 21:14:14 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5542C06175F
        for <linux-bluetooth@vger.kernel.org>; Wed, 14 Jul 2021 18:11:21 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id g24so2727954pji.4
        for <linux-bluetooth@vger.kernel.org>; Wed, 14 Jul 2021 18:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yvRXjtRW0X2D7VCEPXK4g068csIQXSJBZzw2PP1+Br8=;
        b=jqPDsCM9TGg8GQuhIq1MuskPkDLx8k2p6FibOQshpaSjOzo1dU6srKT9HIO4Oj4Toh
         xVZOfeK9kJmdE8wy6l9Xxi1g55zy15VhFsTl8KUzPriE4RbU+rOTMEuwU67kAWORA+wv
         bBJxQIFOoTYJsKNISbEgo3ZZouNIXvZJ9+Dg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yvRXjtRW0X2D7VCEPXK4g068csIQXSJBZzw2PP1+Br8=;
        b=t3WAPd47TVOHyvjixnZB/6psAd8AuqFqSoc9DQY8zf+m60cSifMB8so9TK+QPm/+Jz
         MTzpWKehNzxNmc5ScjEnovYBNUlf+RXo4q0xq04RHOmb/YfFGRPX90m5VXEZwftsMS3k
         kFDAs+TvT9t+bMCKpzwSOPVkX87JQekMNU3/7QNAemrYdbjj1Pf/Pa9GZwtBDvDVSN8A
         TI6vX2uf4F+Nus9VHSVUVjQuEIlsWe7MjtgxUQriAQ0uY6aBWEkACKaln58o9eFzci42
         8SE0fsTvrvcrtCRC96ZYw2QBwXhcsVis9ENvX5/Vft+0fKtcY4iJ1BlDnppXEjiqkiiF
         1jGQ==
X-Gm-Message-State: AOAM531sh1NFkplSqwmKFbuPfKxEZpNsqCtXduc2cdU+CqB1PATwfVWl
        Tz8BCxb/J18hUkRoPAWd6sFCFC0sHUp7Ag==
X-Google-Smtp-Source: ABdhPJz5LaDB+F7eV82Z3xLOsF/4g8kt3G2a06siunbts2E+T0E0o3Zp1rfNTMpNpe1P8t6azKLpJQ==
X-Received: by 2002:a17:90a:4295:: with SMTP id p21mr631558pjg.149.1626311480919;
        Wed, 14 Jul 2021 18:11:20 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:20b7:5dcc:d530:a8df])
        by smtp.gmail.com with UTF8SMTPSA id g9sm4196291pfr.133.2021.07.14.18.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 18:11:20 -0700 (PDT)
From:   Miao-chen Chou <mcchou@chromium.org>
To:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>
Cc:     Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Alain Michaud <alainm@chromium.org>,
        Howard Chung <howardchung@google.com>,
        Miao-chen Chou <mcchou@chromium.org>
Subject: [BlueZ PATCH v3 2/4] error: BR/EDR and LE connection failure reasons
Date:   Wed, 14 Jul 2021 18:09:52 -0700
Message-Id: <20210714180917.BlueZ.v3.2.If79c3f0720cc893be1770c6853fe2fbe626f2caa@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210715010951.963176-1-mcchou@chromium.org>
References: <20210715010951.963176-1-mcchou@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The source of Connect() failures can be divided into the following
three.
- bluetoothd's device interface state transition and profile state
  transition
- Kernel's L2CAP layer state transition
- Potential HCI error codes returned by the remote device

- Separate error-code.txt into its own commit

Reviewed-by: Alain Michaud <alainm@chromium.org>
Reviewed-by: Howard Chung <howardchung@google.com>
---

(no changes since v2)

Changes in v2:
- Add error-code.txt
- Remove BtdError from return string

 src/error.c | 111 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 src/error.h |  52 ++++++++++++++++++++++++
 2 files changed, 163 insertions(+)

diff --git a/src/error.c b/src/error.c
index 89517075e..eeac39456 100644
--- a/src/error.c
+++ b/src/error.c
@@ -27,6 +27,7 @@
 #include <config.h>
 #endif
 
+#include <stdio.h>
 #include "gdbus/gdbus.h"
 
 #include "error.h"
@@ -43,6 +44,12 @@ DBusMessage *btd_error_invalid_args_str(DBusMessage *msg, const char *str)
 					"%s", str);
 }
 
+DBusMessage *btd_error_invalid_args_err(DBusMessage *msg, uint16_t err)
+{
+	return g_dbus_create_error(msg, ERROR_INTERFACE ".InvalidArguments",
+					"0x%04X", err);
+}
+
 DBusMessage *btd_error_busy(DBusMessage *msg)
 {
 	return g_dbus_create_error(msg, ERROR_INTERFACE ".InProgress",
@@ -79,12 +86,24 @@ DBusMessage *btd_error_in_progress(DBusMessage *msg)
 					"In Progress");
 }
 
+DBusMessage *btd_error_in_progress_err(DBusMessage *msg, uint16_t err)
+{
+	return g_dbus_create_error(msg, ERROR_INTERFACE ".InProgress", "0x%04X",
+					err);
+}
+
 DBusMessage *btd_error_not_available(DBusMessage *msg)
 {
 	return g_dbus_create_error(msg, ERROR_INTERFACE ".NotAvailable",
 					"Operation currently not available");
 }
 
+DBusMessage *btd_error_not_available_err(DBusMessage *msg, uint16_t err)
+{
+	return g_dbus_create_error(msg, ERROR_INTERFACE ".NotAvailable",
+					"0x%04X", err);
+}
+
 DBusMessage *btd_error_does_not_exist(DBusMessage *msg)
 {
 	return g_dbus_create_error(msg, ERROR_INTERFACE ".DoesNotExist",
@@ -121,8 +140,100 @@ DBusMessage *btd_error_not_ready(DBusMessage *msg)
 					"Resource Not Ready");
 }
 
+DBusMessage *btd_error_not_ready_err(DBusMessage *msg, uint16_t err)
+{
+	return g_dbus_create_error(msg, ERROR_INTERFACE ".NotReady", "0x%04X",
+					err);
+}
+
 DBusMessage *btd_error_failed(DBusMessage *msg, const char *str)
 {
 	return g_dbus_create_error(msg, ERROR_INTERFACE
 					".Failed", "%s", str);
 }
+
+DBusMessage *btd_error_failed_err(DBusMessage *msg, uint16_t err)
+{
+	return g_dbus_create_error(msg, ERROR_INTERFACE ".Failed", "0x%04X",
+					err);
+}
+
+uint16_t btd_error_bredr_conn_from_errno(int errno_code)
+{
+	switch (-errno_code) {
+	case EALREADY:
+	case EISCONN:
+		return BTD_ERR_BREDR_CONN_ALREADY_CONNECTED;
+	case EHOSTDOWN:
+		return BTD_ERR_BREDR_CONN_PAGE_TIMEOUT;
+	case ENOPROTOOPT:
+		return BTD_ERR_BREDR_CONN_PROFILE_UNAVAILABLE;
+	case EIO:
+		return BTD_ERR_BREDR_CONN_CREATE_SOCKET;
+	case EINVAL:
+		return BTD_ERR_BREDR_CONN_INVALID_ARGUMENTS;
+	case EHOSTUNREACH:
+		return BTD_ERR_BREDR_CONN_ADAPTER_NOT_POWERED;
+	case EOPNOTSUPP:
+	case EPROTONOSUPPORT:
+		return BTD_ERR_BREDR_CONN_NOT_SUPPORTED;
+	case EBADFD:
+		return BTD_ERR_BREDR_CONN_BAD_SOCKET;
+	case ENOMEM:
+		return BTD_ERR_BREDR_CONN_MEMORY_ALLOC;
+	case EBUSY:
+		return BTD_ERR_BREDR_CONN_BUSY;
+	case EMLINK:
+		return BTD_ERR_BREDR_CONN_CNCR_CONNECT_LIMIT;
+	case ETIMEDOUT:
+		return BTD_ERR_BREDR_CONN_TIMEOUT;
+	case ECONNREFUSED:
+		return BTD_ERR_BREDR_CONN_REFUSED;
+	case ECONNRESET:
+		return BTD_ERR_BREDR_CONN_ABORT_BY_REMOTE;
+	case ECONNABORTED:
+		return BTD_ERR_BREDR_CONN_ABORT_BY_LOCAL;
+	case EPROTO:
+		return BTD_ERR_BREDR_CONN_PROTO_ERROR;
+	default:
+		return BTD_ERR_BREDR_CONN_UNKNOWN;
+	}
+}
+
+uint16_t btd_error_le_conn_from_errno(int errno_code)
+{
+	switch (-errno_code) {
+	case EINVAL:
+		return BTD_ERR_LE_CONN_INVALID_ARGUMENTS;
+	case EHOSTUNREACH:
+		return BTD_ERR_LE_CONN_ADAPTER_NOT_POWERED;
+	case EOPNOTSUPP:
+	case EPROTONOSUPPORT:
+		return BTD_ERR_LE_CONN_NOT_SUPPORTED;
+	case EALREADY:
+	case EISCONN:
+		return BTD_ERR_LE_CONN_ALREADY_CONNECTED;
+	case EBADFD:
+		return BTD_ERR_LE_CONN_BAD_SOCKET;
+	case ENOMEM:
+		return BTD_ERR_LE_CONN_MEMORY_ALLOC;
+	case EBUSY:
+		return BTD_ERR_LE_CONN_BUSY;
+	case ECONNREFUSED:
+		return BTD_ERR_LE_CONN_REFUSED;
+	case EIO:
+		return BTD_ERR_LE_CONN_CREATE_SOCKET;
+	case ETIMEDOUT:
+		return BTD_ERR_LE_CONN_TIMEOUT;
+	case EMLINK:
+		return BTD_ERR_LE_CONN_SYNC_CONNECT_LIMIT;
+	case ECONNRESET:
+		return BTD_ERR_LE_CONN_ABORT_BY_REMOTE;
+	case ECONNABORTED:
+		return BTD_ERR_LE_CONN_ABORT_BY_LOCAL;
+	case EPROTO:
+		return BTD_ERR_LE_CONN_PROTO_ERROR;
+	default:
+		return BTD_ERR_LE_CONN_UNKNOWN;
+	}
+}
diff --git a/src/error.h b/src/error.h
index 7c8cad066..74d433aca 100644
--- a/src/error.h
+++ b/src/error.h
@@ -24,22 +24,74 @@
  */
 
 #include <dbus/dbus.h>
+#include <stdint.h>
 
 #define ERROR_INTERFACE "org.bluez.Error"
 
+/* BR/EDR connection failure reasons
+ * BT_ERR_* should be used as one of the parameters to btd_error_*_err().
+ */
+#define BTD_ERR_BREDR_CONN_ALREADY_CONNECTED	0x0001
+#define BTD_ERR_BREDR_CONN_PAGE_TIMEOUT		0x0002
+#define BTD_ERR_BREDR_CONN_PROFILE_UNAVAILABLE	0x0003
+#define BTD_ERR_BREDR_CONN_SDP_SEARCH		0x0004
+#define BTD_ERR_BREDR_CONN_CREATE_SOCKET	0x0005
+#define BTD_ERR_BREDR_CONN_INVALID_ARGUMENTS	0x0006
+#define BTD_ERR_BREDR_CONN_ADAPTER_NOT_POWERED	0x0007
+#define BTD_ERR_BREDR_CONN_NOT_SUPPORTED	0x0008
+#define BTD_ERR_BREDR_CONN_BAD_SOCKET		0x0009
+#define BTD_ERR_BREDR_CONN_MEMORY_ALLOC		0x000A
+#define BTD_ERR_BREDR_CONN_BUSY			0x000B
+#define BTD_ERR_BREDR_CONN_CNCR_CONNECT_LIMIT	0x000C
+#define BTD_ERR_BREDR_CONN_TIMEOUT		0x000D
+#define BTD_ERR_BREDR_CONN_REFUSED		0x000E
+#define BTD_ERR_BREDR_CONN_ABORT_BY_REMOTE	0x000F
+#define BTD_ERR_BREDR_CONN_ABORT_BY_LOCAL	0x0010
+#define BTD_ERR_BREDR_CONN_PROTO_ERROR		0x0011
+#define BTD_ERR_BREDR_CONN_CANCELED		0x0012
+#define BTD_ERR_BREDR_CONN_UNKNOWN		0x0013
+
+/* LE connection failure reasons
+ * BT_ERR_* should be used as one of the parameters to btd_error_*_err().
+ */
+#define BTD_ERR_LE_CONN_INVALID_ARGUMENTS	0x0101
+#define BTD_ERR_LE_CONN_ADAPTER_NOT_POWERED	0x0102
+#define BTD_ERR_LE_CONN_NOT_SUPPORTED		0x0103
+#define BTD_ERR_LE_CONN_ALREADY_CONNECTED	0x0104
+#define BTD_ERR_LE_CONN_BAD_SOCKET		0x0105
+#define BTD_ERR_LE_CONN_MEMORY_ALLOC		0x0106
+#define BTD_ERR_LE_CONN_BUSY			0x0107
+#define BTD_ERR_LE_CONN_REFUSED			0x0108
+#define BTD_ERR_LE_CONN_CREATE_SOCKET		0x0109
+#define BTD_ERR_LE_CONN_TIMEOUT			0x010A
+#define BTD_ERR_LE_CONN_SYNC_CONNECT_LIMIT	0x010B
+#define BTD_ERR_LE_CONN_ABORT_BY_REMOTE		0x010C
+#define BTD_ERR_LE_CONN_ABORT_BY_LOCAL		0x010D
+#define BTD_ERR_LE_CONN_PROTO_ERROR		0x010E
+#define BTD_ERR_LE_CONN_GATT_BROWSE		0x010F
+#define BTD_ERR_LE_CONN_UNKNOWN			0x0110
+
 DBusMessage *btd_error_invalid_args(DBusMessage *msg);
 DBusMessage *btd_error_invalid_args_str(DBusMessage *msg, const char *str);
+DBusMessage *btd_error_invalid_args_err(DBusMessage *msg, uint16_t err);
 DBusMessage *btd_error_busy(DBusMessage *msg);
 DBusMessage *btd_error_already_exists(DBusMessage *msg);
 DBusMessage *btd_error_not_supported(DBusMessage *msg);
 DBusMessage *btd_error_not_connected(DBusMessage *msg);
 DBusMessage *btd_error_already_connected(DBusMessage *msg);
 DBusMessage *btd_error_not_available(DBusMessage *msg);
+DBusMessage *btd_error_not_available_err(DBusMessage *msg, uint16_t err);
 DBusMessage *btd_error_in_progress(DBusMessage *msg);
+DBusMessage *btd_error_in_progress_err(DBusMessage *msg, uint16_t err);
 DBusMessage *btd_error_does_not_exist(DBusMessage *msg);
 DBusMessage *btd_error_not_authorized(DBusMessage *msg);
 DBusMessage *btd_error_not_permitted(DBusMessage *msg, const char *str);
 DBusMessage *btd_error_no_such_adapter(DBusMessage *msg);
 DBusMessage *btd_error_agent_not_available(DBusMessage *msg);
 DBusMessage *btd_error_not_ready(DBusMessage *msg);
+DBusMessage *btd_error_not_ready_err(DBusMessage *msg, uint16_t err);
 DBusMessage *btd_error_failed(DBusMessage *msg, const char *str);
+DBusMessage *btd_error_failed_err(DBusMessage *msg, uint16_t err);
+
+uint16_t btd_error_bredr_conn_from_errno(int errno_code);
+uint16_t btd_error_le_conn_from_errno(int errno_code);
-- 
2.32.0.93.g670b81a890-goog

