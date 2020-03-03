Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80E8017699E
	for <lists+linux-bluetooth@lfdr.de>; Tue,  3 Mar 2020 01:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbgCCA42 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 2 Mar 2020 19:56:28 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:38975 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbgCCA41 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 2 Mar 2020 19:56:27 -0500
Received: by mail-pj1-f65.google.com with SMTP id o5so543520pjs.4
        for <linux-bluetooth@vger.kernel.org>; Mon, 02 Mar 2020 16:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OvAGpz21+4FyNePX3GSsm+nejfZp66/gGkaljN/wdMc=;
        b=aMo7CUIzB8ERMBU7spTngN7X+cdb0BBKH1ExLs20r8GMjHLKnlaZHoMA3zec0YWX9I
         RKd4Hqkb48EpAlJUggC/aeyob4XImOJZMHbMhwfHaAXBtr82dPA+tCQyNTJ3AR1dPFFI
         BIFqNC419n6xj8FeWjACdrSo/LpG5iKMNU+OlSpzF9gt4Yt7G0Qsb8wGradVFkFDBBQN
         ZjdyHJQolBIIh8r28i0Ikny9UFLbCInhQOttTInY2gfkfVoBUawcD6XeZcDTRvPoOQzv
         1eDCNMwtLf9r81yXYR7sIxob2JIOxz1YIWZQeo42Qqpu2DErohIrJE0k0dVEMSfWFelL
         58JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OvAGpz21+4FyNePX3GSsm+nejfZp66/gGkaljN/wdMc=;
        b=GDfvPqQkqRMQ+S1TViDzW8vy229eeMPBj0G0AMmsBgGMtozI6m0Z0vsTDGJigquQM8
         8+RHc9XXf6fpSiRmOtdNup+2qR8lP91xfyIZoG/wF6Aba/8cYWeuH/TcL6y46NW0vfCw
         vH/E0G9ve83ZXg/2zsfuUMKtOnz6GZrOb79ZByYzYC8qOUS1ru8CeN4Jo8nrqtK0IknB
         oF/a9O3miisl9T34dk+MApieCTLLzU7CzSgahKJ7ArL/QmIS+11nwOMQl//VPVEpUxpy
         MnVOTfqsj8kETH8Jz4adG5xgDe4uN4sgR8MkEIPqxiYewHsqALAac0RV8bFub3bUOLxS
         kLkQ==
X-Gm-Message-State: ANhLgQ05xFjpCyoh8QmzQoweTD1jGCIcZFGhAoqpm5BT/XRp2Wz7eGYL
        jAnEJSOB/NIo8ZMvaicFlwUK/eAMmbM=
X-Google-Smtp-Source: ADFU+vtvUJI9AJt4odDNqvEN06VprVIQO0Qwzsh2zzxwzGFtjh4JKIDedkP/fvQOAT+oht9MrhZIIA==
X-Received: by 2002:a17:90b:3011:: with SMTP id hg17mr1267844pjb.90.1583196984595;
        Mon, 02 Mar 2020 16:56:24 -0800 (PST)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id b21sm23218500pfp.0.2020.03.02.16.56.23
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 16:56:24 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v3 1/5] Bluetooth: L2CAP: Add definitions for Enhanced Credit Based Mode
Date:   Mon,  2 Mar 2020 16:56:19 -0800
Message-Id: <20200303005623.18917-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This introduces the definitions for the new L2CAP mode called Enhanced
Credit Based Mode.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
v3: Move patch adding BT_MODE to last so others that don't expose any API to
userspace can be applied first.
v2: Make BT_MODE conditional to enable_ecred.

 include/net/bluetooth/l2cap.h | 39 +++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
index 093aedebdf0c..3e6544e53516 100644
--- a/include/net/bluetooth/l2cap.h
+++ b/include/net/bluetooth/l2cap.h
@@ -119,6 +119,10 @@ struct l2cap_conninfo {
 #define L2CAP_LE_CONN_REQ	0x14
 #define L2CAP_LE_CONN_RSP	0x15
 #define L2CAP_LE_CREDITS	0x16
+#define L2CAP_ECRED_CONN_REQ	0x17
+#define L2CAP_ECRED_CONN_RSP	0x18
+#define L2CAP_ECRED_RECONF_REQ	0x19
+#define L2CAP_ECRED_RECONF_RSP	0x1a
 
 /* L2CAP extended feature mask */
 #define L2CAP_FEAT_FLOWCTL	0x00000001
@@ -359,6 +363,7 @@ struct l2cap_conf_rfc {
  * ever be used in the BR/EDR configuration phase.
  */
 #define L2CAP_MODE_LE_FLOWCTL	0x80
+#define L2CAP_MODE_EXT_FLOWCTL	0x81
 
 struct l2cap_conf_efs {
 	__u8	id;
@@ -483,6 +488,39 @@ struct l2cap_le_credits {
 	__le16     credits;
 } __packed;
 
+#define L2CAP_ECRED_MIN_MTU		64
+#define L2CAP_ECRED_MIN_MPS		64
+
+struct l2cap_ecred_conn_req {
+	__le16 psm;
+	__le16 mtu;
+	__le16 mps;
+	__le16 credits;
+	__le16 scid[0];
+} __packed;
+
+struct l2cap_ecred_conn_rsp {
+	__le16 mtu;
+	__le16 mps;
+	__le16 credits;
+	__le16 result;
+	__le16 dcid[0];
+};
+
+struct l2cap_ecred_reconf_req {
+	__le16 mtu;
+	__le16 mps;
+	__le16 scid[0];
+} __packed;
+
+#define L2CAP_RECONF_SUCCESS		0x0000
+#define L2CAP_RECONF_INVALID_MTU	0x0001
+#define L2CAP_RECONF_INVALID_MPS	0x0002
+
+struct l2cap_ecred_reconf_rsp {
+	__le16 result;
+} __packed;
+
 /* ----- L2CAP channels and connections ----- */
 struct l2cap_seq_list {
 	__u16	head;
@@ -724,6 +762,7 @@ enum {
 	FLAG_EFS_ENABLE,
 	FLAG_DEFER_SETUP,
 	FLAG_LE_CONN_REQ_SENT,
+	FLAG_ECRED_CONN_REQ_SENT,
 	FLAG_PENDING_SECURITY,
 	FLAG_HOLD_HCI_CONN,
 };
-- 
2.21.1

