Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0271B1877B4
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Mar 2020 03:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgCQCLq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 16 Mar 2020 22:11:46 -0400
Received: from mail-pg1-f170.google.com ([209.85.215.170]:35133 "EHLO
        mail-pg1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgCQCLq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 16 Mar 2020 22:11:46 -0400
Received: by mail-pg1-f170.google.com with SMTP id 7so10844799pgr.2
        for <linux-bluetooth@vger.kernel.org>; Mon, 16 Mar 2020 19:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wEvrdFG/fcec4DLX1Pc2qnhYtgjNouUVXq0mlIFaa5E=;
        b=JRh9vI15HgA69tBJowRokifbKVGY3O37DSch2SN7MByjdgxJ8/YwO51hKbjLNyKlbj
         EBjtI7zBapLBHwRpZfZBJgiz59APJDAtHdhUsJ7ATewwRIGC3v5YEjY1w9ffHa0l6jDY
         xMDkTpGHPYNQeBkis4IDWncC+3ibrIE19mHgRdLC92l7LZTUjjlb2M773mu0GHqRZhnG
         YJm/eqOEZEqWai35+pJqyB74t+gLurQAkMCnaGNkHsO3M5e5iAj6BGcjlnDzzyQ01EXX
         goNPsewHGrfYfRyeKxylHUd8VigklLQy0lC4ENGW6PdVHQd06zDGA0kIHpbkBYrGIBqA
         yWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wEvrdFG/fcec4DLX1Pc2qnhYtgjNouUVXq0mlIFaa5E=;
        b=NfLpATn1N/9+tU2/0iPItFy6MW9eXgq/s+nLNFffh7SAdOZvJaCCEoOXY5fR8RV+DZ
         DOZHnkV+Y8hoYJoxS19Un+sHbQ4iNw77oDQx9ep9WFhnEKn8Sq4QDDPnHJtc49OBjKP9
         KcTeU7rdUNpfo/IwbA4erkw/IXMJL68OlAjwWODxctuiq1/P4MVksRqiTL4GqdoMq+9/
         2tIeAcK4e4LzGne4lOcWpeKeOXG1XIH7V5yRNxX/CecVJyn9JJqDrZnpnFd80WcyOquF
         w0TCMQs5GHP1DfOE+TFXnVCG51A7U/MdMDvKlsR46ZRP7IsBPSFeBecD8UtLYo0qIQ8D
         Vz0Q==
X-Gm-Message-State: ANhLgQ3CrR9x3ySoUIudQCKkNbKLa3Vf6F48vFLEZB4SAi1zNK6mxa/J
        07YSX1/VSvOBEVyjnaf33o2ancXWvJ0=
X-Google-Smtp-Source: ADFU+vuElRMv0Nt+vDNZcvkSxo/xAlHaKqf0/cA5eoFSPoQ0in3rTsELxxJVgW8tv+VEsOD5URRw7g==
X-Received: by 2002:a63:f141:: with SMTP id o1mr2636407pgk.92.1584411104623;
        Mon, 16 Mar 2020 19:11:44 -0700 (PDT)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id f19sm700769pgf.33.2020.03.16.19.11.43
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 19:11:44 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 2/6] btio: Add mode to for Enhanced Credit Mode
Date:   Mon, 16 Mar 2020 19:11:37 -0700
Message-Id: <20200317021141.16398-2-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200317021141.16398-1-luiz.dentz@gmail.com>
References: <20200317021141.16398-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This adds BT_IO_MODE_EXT_FLOWCTL which directly maps to
L2CAP_MODE_EXT_FLOWCTL.
---
 btio/btio.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++------
 btio/btio.h |  3 ++-
 2 files changed, 55 insertions(+), 7 deletions(-)

diff --git a/btio/btio.c b/btio/btio.c
index db37b99da..e7b4db16b 100644
--- a/btio/btio.c
+++ b/btio/btio.c
@@ -630,18 +630,34 @@ static gboolean set_le_imtu(int sock, uint16_t imtu, GError **err)
 	return TRUE;
 }
 
+static gboolean set_le_mode(int sock, uint8_t mode, GError **err)
+{
+	if (setsockopt(sock, SOL_BLUETOOTH, BT_MODE, &mode,
+						sizeof(mode)) < 0) {
+		ERROR_FAILED(err, "setsockopt(BT_MODE)", errno);
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
 static gboolean l2cap_set(int sock, uint8_t src_type, int sec_level,
 				uint16_t imtu, uint16_t omtu, uint8_t mode,
 				int master, int flushable, uint32_t priority,
 				GError **err)
 {
 	if (imtu || omtu || mode) {
-		gboolean ret;
+		gboolean ret = FALSE;
 
 		if (src_type == BDADDR_BREDR)
 			ret = set_l2opts(sock, imtu, omtu, mode, err);
-		else
-			ret = set_le_imtu(sock, imtu, err);
+		else {
+			if (imtu)
+				ret = set_le_imtu(sock, imtu, err);
+
+			if (ret && mode)
+				ret = set_le_mode(sock, mode, err);
+		}
 
 		if (!ret)
 			return ret;
@@ -980,6 +996,30 @@ static int get_phy(int sock, uint32_t *phy)
 	return 0;
 }
 
+static int get_le_imtu(int sock, uint16_t *mtu)
+{
+	socklen_t len;
+
+	len = sizeof(*mtu);
+
+	if (getsockopt(sock, SOL_BLUETOOTH, BT_RCVMTU, mtu, &len) < 0)
+		return -errno;
+
+	return 0;
+}
+
+static int get_le_mode(int sock, uint8_t *mode)
+{
+	socklen_t len;
+
+	len = sizeof(*mode);
+
+	if (getsockopt(sock, SOL_BLUETOOTH, BT_MODE, mode, &len) < 0)
+		return -errno;
+
+	return 0;
+}
+
 static gboolean l2cap_get(int sock, GError **err, BtIOOption opt1,
 								va_list args)
 {
@@ -999,10 +1039,11 @@ static gboolean l2cap_get(int sock, GError **err, BtIOOption opt1,
 	memset(&l2o, 0, sizeof(l2o));
 
 	if (src.l2_bdaddr_type != BDADDR_BREDR) {
-		len = sizeof(l2o.imtu);
-		if (getsockopt(sock, SOL_BLUETOOTH, BT_RCVMTU,
-						&l2o.imtu, &len) == 0)
+		if (get_le_imtu(sock, &l2o.imtu) == 0) {
+			/* Older kernels may not support BT_MODE */
+			get_le_mode(sock, &l2o.mode);
 			goto parse_opts;
+		}
 
 		/* Non-LE CoC enabled kernels will return one of these
 		 * in which case we need to fall back to L2CAP_OPTIONS.
@@ -1644,6 +1685,12 @@ GIOChannel *bt_io_connect(BtIOConnect connect, gpointer user_data,
 
 	sock = g_io_channel_unix_get_fd(io);
 
+	/* Use DEFER_SETUP when connecting using Ext-Flowctl */
+	if (opts.mode == BT_IO_MODE_EXT_FLOWCTL && opts.defer) {
+		setsockopt(sock, SOL_BLUETOOTH, BT_DEFER_SETUP, &opts.defer,
+							sizeof(opts.defer));
+	}
+
 	switch (opts.type) {
 	case BT_IO_L2CAP:
 		err = l2cap_connect(sock, &opts.dst, opts.dst_type,
diff --git a/btio/btio.h b/btio/btio.h
index 41a017acb..5ebfb85c6 100644
--- a/btio/btio.h
+++ b/btio/btio.h
@@ -71,7 +71,8 @@ typedef enum {
 	BT_IO_MODE_RETRANS,
 	BT_IO_MODE_FLOWCTL,
 	BT_IO_MODE_ERTM,
-	BT_IO_MODE_STREAMING
+	BT_IO_MODE_STREAMING,
+	BT_IO_MODE_EXT_FLOWCTL = 0x81
 } BtIOMode;
 
 typedef void (*BtIOConfirm)(GIOChannel *io, gpointer user_data);
-- 
2.21.1

