Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC5E2AFCF3
	for <lists+linux-bluetooth@lfdr.de>; Thu, 12 Nov 2020 02:49:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728538AbgKLBdD (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 11 Nov 2020 20:33:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727717AbgKKXE3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 11 Nov 2020 18:04:29 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEFE3C0613D4
        for <linux-bluetooth@vger.kernel.org>; Wed, 11 Nov 2020 15:04:27 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id k7so1769465plk.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 11 Nov 2020 15:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/NU9/FITTUdHKeN53pXqdgB7hSm/j9midMBE9WhKgys=;
        b=eX3DTz4VJLP7UqJCkn5OEgH2DYlbSV0woYXfCgxKQamIDgNpfRnV2E0QCXeIri1ZyB
         PmybxEw0V5X60aGxO+csnzNK0QucLBzOf89VdMb/9O4nxMm1fCeDzPD/FUI8vEdI61dl
         VhAJRLTz0rr2Liu1GDExNHv2aN9NuW66ZnkViyF1YeBZWwbK0FdGZuBHHnENdK3oZ0hB
         d6u5hT7uZjpcAdmpi9cQ0yFuRRQ4INUNsCOhIiAPqb03zwrCS7hZMZUHST4uPb4Q8N3Q
         0IrxnMuIfZHnF6C7kbAbYB4BnBf+Be2vDCjfuX+8alCSdw4cb7mJ4+AieaWtzZxbMdO5
         h/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/NU9/FITTUdHKeN53pXqdgB7hSm/j9midMBE9WhKgys=;
        b=WlD5zwv19mSjdPZa3HAvGC+mBJmYE7JAyqQXW3yV9k9nfwMPSghKofsokA8zuHauT5
         H58kihVDCj7rlr/ckh3zJU6Kfn5LVON6kbLA/PGdLQ2B2UjHZhZqebKZ78igpp32MKj8
         LKoz3PMxUawrqbjprH0IBEVDS1u134C6hsohmraOglxMbuSkApE51HF4aoPUiIVMUjLc
         IACaBag9eMKoNLxu+WnFh6CCn/pnVbtkJXMtwQpVqcUzu484brqqWjHHGXgeg7Bo0V3g
         Bes93lPTYXjciuentHD7tOC3pzyNB1S9tlTeq0ORvc6UiQpAPMxtCHI0eBFaSdfrm7QF
         vYhg==
X-Gm-Message-State: AOAM532ugisbzFl75WRrL7Jl70aQXa70QHJeF8kh9H9KITNl6wWg2pLL
        M9s/YIZFsErZVt/X0RDaHqBLy5isF4P6jA==
X-Google-Smtp-Source: ABdhPJzVz/Flfea7VY0ZI+ASbkCPSBsBT9zUqpJRXlbpqfEUXjWu4KEKH1OBt8oR4K9HHcM+/iTwKg==
X-Received: by 2002:a17:902:bc8c:b029:d6:ff09:12e9 with SMTP id bb12-20020a170902bc8cb02900d6ff0912e9mr23569213plb.18.1605135867062;
        Wed, 11 Nov 2020 15:04:27 -0800 (PST)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id n27sm3867767pfq.59.2020.11.11.15.04.26
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 15:04:26 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 02/10] bthost: Fix running request callbacks for remote requests
Date:   Wed, 11 Nov 2020 15:04:13 -0800
Message-Id: <20201111230421.3364932-3-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201111230421.3364932-1-luiz.dentz@gmail.com>
References: <20201111230421.3364932-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Ident are only unique per request/response pair so if a remote request
is initiated we shall not attempt to run the callback even if the ident
matches.
---
 emulator/bthost.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/emulator/bthost.c b/emulator/bthost.c
index 32676e179..f29bda06e 100644
--- a/emulator/bthost.c
+++ b/emulator/bthost.c
@@ -1678,6 +1678,19 @@ static void handle_pending_l2reqs(struct bthost *bthost, struct btconn *conn,
 	}
 }
 
+static bool l2cap_rsp(uint8_t code)
+{
+	switch (code) {
+	case BT_L2CAP_PDU_CMD_REJECT:
+	case BT_L2CAP_PDU_CONN_RSP:
+	case BT_L2CAP_PDU_CONFIG_RSP:
+	case BT_L2CAP_PDU_INFO_RSP:
+		return true;
+	}
+
+	return false;
+}
+
 static void l2cap_sig(struct bthost *bthost, struct btconn *conn,
 						const void *data, uint16_t len)
 {
@@ -1741,7 +1754,8 @@ static void l2cap_sig(struct bthost *bthost, struct btconn *conn,
 		ret = false;
 	}
 
-	handle_pending_l2reqs(bthost, conn, hdr->ident, hdr->code,
+	if (l2cap_rsp(hdr->code))
+		handle_pending_l2reqs(bthost, conn, hdr->ident, hdr->code,
 						data + sizeof(*hdr), hdr_len);
 
 	if (ret)
@@ -1898,6 +1912,19 @@ static bool l2cap_ecred_conn_rsp(struct bthost *bthost, struct btconn *conn,
 	return true;
 }
 
+static bool l2cap_le_rsp(uint8_t code)
+{
+	switch (code) {
+	case BT_L2CAP_PDU_CMD_REJECT:
+	case BT_L2CAP_PDU_CONN_PARAM_RSP:
+	case BT_L2CAP_PDU_LE_CONN_RSP:
+	case BT_L2CAP_PDU_ECRED_CONN_RSP:
+		return true;
+	}
+
+	return false;
+}
+
 static void l2cap_le_sig(struct bthost *bthost, struct btconn *conn,
 						const void *data, uint16_t len)
 {
@@ -1960,7 +1987,8 @@ static void l2cap_le_sig(struct bthost *bthost, struct btconn *conn,
 		ret = false;
 	}
 
-	handle_pending_l2reqs(bthost, conn, hdr->ident, hdr->code,
+	if (l2cap_le_rsp(hdr->code))
+		handle_pending_l2reqs(bthost, conn, hdr->ident, hdr->code,
 						data + sizeof(*hdr), hdr_len);
 
 	if (ret)
-- 
2.26.2

