Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A657137B12
	for <lists+linux-bluetooth@lfdr.de>; Sat, 11 Jan 2020 03:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728029AbgAKCWX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 10 Jan 2020 21:22:23 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42094 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727944AbgAKCWX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 10 Jan 2020 21:22:23 -0500
Received: by mail-pg1-f196.google.com with SMTP id s64so1847927pgb.9
        for <linux-bluetooth@vger.kernel.org>; Fri, 10 Jan 2020 18:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Kothjr31QuHUwbkEnDdy6Q1G0iwsXYSo06OtgPFx2ns=;
        b=QYJ51l2n6X3Q7wfqEvpQDj4dYZLepyGDv0bJQkkRHwDSc0EaRxTd3tbLjioQtsOYMz
         6QGq7LmMI5wSlglZUOfwNfTn/K7mYDRDg/t31gQQA5P7+XQgBMvRjS4QPG6A/DHJRL5R
         fQOPh0yAsAOZogHVPoGzICmyv2es56R+FJdY31uZ1u+ZGAp/9+kQ5ocm5yYValUee8IJ
         iWOfo7ILCbn4D4jHWMm070XlxnPH0pYbllwlBjKYQ10lFJLKn331PWdlSYhqxoSsIgSR
         FhtzhU0HhYfpia+xZzeWlevrMAHwddA5BNVu9TRpi/5gfq9mCyWPuUSo6Se/9Hs5fSdW
         haeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kothjr31QuHUwbkEnDdy6Q1G0iwsXYSo06OtgPFx2ns=;
        b=TaAVsjLoTu+p755tp5bd8uZIRdbCvLbK1x1z7XaE1bXm76I+i1Y3njupwON4MDX+9j
         BosMQx3ZiOZ8QmfxkZMAUZYia8Z2kZwGdP5wg0ytV6M0wyPVQy8J7yZe6jXq6bTN2XEh
         lpvUftuSY5HlvR5w8dDHdZDaXvJFb49TNq8YJbDvpDcQtoMi6NO41c/NRvLFDtPJX00p
         uwVd3bXVR9N8wcNqf/ItYRJ1qc38++0YImOYK0Yb1K6grWV+qtlKySNukcEOf6mZqKo9
         mJHDWes0Xd+zCNQguu6+vcEeQgeIUJ92lB+xF2Pkd6V8H+eytPKgx2TcFtSpoA3dAwa6
         DeKQ==
X-Gm-Message-State: APjAAAXKMXyrJY0RISSh/eaUNdyIElHhJF3lO0mYRaeiRYzsQe6htsNe
        Ne7VUyg3VSiXeX1OVcnlfkuYGGZuuMI=
X-Google-Smtp-Source: APXvYqwIm9pWR/rqa7OsqMSr0vCVq6WH5esMY1Y1LpRJ1cetxd37cI2ARj+nMqsYOTZD+9NxxO7elw==
X-Received: by 2002:a63:78cf:: with SMTP id t198mr7992484pgc.287.1578709342187;
        Fri, 10 Jan 2020 18:22:22 -0800 (PST)
Received: from vudentzs-t460s.amr.corp.intel.com ([2601:1c0:6800:1640::3287])
        by smtp.gmail.com with ESMTPSA id g22sm4158906pgk.85.2020.01.10.18.22.21
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 18:22:21 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 03/10] Bluetooth: L2CAP: Add definitions for Enhanced Credit Based Mode
Date:   Fri, 10 Jan 2020 18:22:09 -0800
Message-Id: <20200111022216.30842-4-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200111022216.30842-1-luiz.dentz@gmail.com>
References: <20200111022216.30842-1-luiz.dentz@gmail.com>
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
 include/net/bluetooth/l2cap.h | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
index 093aedebdf0c..2a38e1f93c45 100644
--- a/include/net/bluetooth/l2cap.h
+++ b/include/net/bluetooth/l2cap.h
@@ -119,6 +119,11 @@ struct l2cap_conninfo {
 #define L2CAP_LE_CONN_REQ	0x14
 #define L2CAP_LE_CONN_RSP	0x15
 #define L2CAP_LE_CREDITS	0x16
+#define L2CAP_ECRED_CONN_REQ	0x17
+#define L2CAP_ECRED_CONN_RSP	0x18
+#define L2CAP_ECRED_RECONF_REQ	0x19
+#define L2CAP_ECRED_RECONF_RSP	0x1a
+
 
 /* L2CAP extended feature mask */
 #define L2CAP_FEAT_FLOWCTL	0x00000001
@@ -360,6 +365,9 @@ struct l2cap_conf_rfc {
  */
 #define L2CAP_MODE_LE_FLOWCTL	0x80
 
+/* This is essentially L2CAP_MODE_LE_FLOWCTL but works with BR/EDR */
+#define L2CAP_MODE_ECRED	0x81
+
 struct l2cap_conf_efs {
 	__u8	id;
 	__u8	stype;
@@ -483,6 +491,39 @@ struct l2cap_le_credits {
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
@@ -724,6 +765,7 @@ enum {
 	FLAG_EFS_ENABLE,
 	FLAG_DEFER_SETUP,
 	FLAG_LE_CONN_REQ_SENT,
+	FLAG_ECRED_CONN_REQ_SENT,
 	FLAG_PENDING_SECURITY,
 	FLAG_HOLD_HCI_CONN,
 };
@@ -923,6 +965,7 @@ void l2cap_cleanup_sockets(void);
 bool l2cap_is_socket(struct socket *sock);
 
 void __l2cap_le_connect_rsp_defer(struct l2cap_chan *chan);
+void __l2cap_ecred_conn_rsp_defer(struct l2cap_chan *chan);
 void __l2cap_connect_rsp_defer(struct l2cap_chan *chan);
 
 int l2cap_add_psm(struct l2cap_chan *chan, bdaddr_t *src, __le16 psm);
-- 
2.21.0

