Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3AC82A33B9
	for <lists+linux-bluetooth@lfdr.de>; Mon,  2 Nov 2020 20:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgKBTMk (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 2 Nov 2020 14:12:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgKBTMj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 2 Nov 2020 14:12:39 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9072DC0617A6
        for <linux-bluetooth@vger.kernel.org>; Mon,  2 Nov 2020 11:12:39 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id c20so11959662pfr.8
        for <linux-bluetooth@vger.kernel.org>; Mon, 02 Nov 2020 11:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Y7gtfVrPuzt8dCsXuLb6bKQr3QEbKfNBjjypNUaqPo4=;
        b=G6/spdxviYtr8/qPQwltWT5gZ3sRIPUIpG+7xvSTyXfCCf8+0KjkwvlnjyLsvlIYZn
         vcSO7z7WoDyhBzrA5mI54t4+Oo2ThPQr5c0rwMyToY+tY7WX6F+wmro4gyMvRN7LqYHf
         5I+IApOyaT0UnLFYRrMuDhjQq6ZuxoETe+GVPzp6Ahs0U0WWYJqNKAiatJBDko9WEZAv
         FnyOmYE5D8wQu7wV5AFaoEJJ8TkminlFZn+Gz3aj5Y0DjWpKx8KbVVXruOjiEAksZmFg
         S5/rDEZ4mpugcQu3Y2PswmB43c1r90D7e8qTV56Xdw08FSdBamszlr8MO1JkJZ1WkblU
         +nRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y7gtfVrPuzt8dCsXuLb6bKQr3QEbKfNBjjypNUaqPo4=;
        b=ThhvuPt5KYSwQ2XQYYH1+jY6DzjVn+Zks6zIG8j0wwEWR1C9BQXpc62FEkJfGeID2s
         IzNWfGnxuhNbfP7mRvr4UWkve8zfV0uI89w2sBtRCWdVwa7rM4a+Otp1dtcBETEPPRcv
         IM1YkDacgLMTkExhSLI7x02tjodYFGckIMe67tCUPSkuoLgPbTgzz+mXn6F6Ra8d4dFY
         6NpMcb4wAcFl0VaH9eXlXGhxGEKmcdZX4dHdtzNP8eCxSYkGrWKoL6i+D5lYvhffLzda
         6W5v7wlQU/jFmyU1jSstHgGgBnKV1vRxEyoPS28/JM8DsagXKNy6OFCe1lmuaB6tgNLp
         PtSg==
X-Gm-Message-State: AOAM530b4pfHLpeMN3DKNXr8IG/qNqgDX0fn1Pn68DnBbfIqbXqZ1lDB
        GACusZspigLOaYn9yEjxXPN4rUFyWhoj0Q==
X-Google-Smtp-Source: ABdhPJy1G9tg+mYVT3yJG0stAopuktMvaqUyCaOPA2J5REYpOEL3X4j7le5JcazGX1l8u0nTc0MIEw==
X-Received: by 2002:a17:90a:5906:: with SMTP id k6mr13743739pji.173.1604344358881;
        Mon, 02 Nov 2020 11:12:38 -0800 (PST)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id z10sm14589716pff.218.2020.11.02.11.12.38
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 11:12:38 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 05/11] emulator/bthost: Add support for LE CIS Request
Date:   Mon,  2 Nov 2020 11:12:26 -0800
Message-Id: <20201102191232.1848737-5-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201102191232.1848737-1-luiz.dentz@gmail.com>
References: <20201102191232.1848737-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This enables bthost to act as acceptor of LE CIS Request.
---
 emulator/bthost.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/emulator/bthost.c b/emulator/bthost.c
index f5b09bc4f..32676e179 100644
--- a/emulator/bthost.c
+++ b/emulator/bthost.c
@@ -1269,6 +1269,21 @@ static void evt_le_ltk_request(struct bthost *bthost, const void *data,
 								sizeof(cp));
 }
 
+static void evt_le_cis_req(struct bthost *bthost, const void *data, uint8_t len)
+{
+	const struct bt_hci_evt_le_cis_req *ev = data;
+	struct bt_hci_cmd_le_accept_cis cmd;
+
+	if (len < sizeof(*ev))
+		return;
+
+	memset(&cmd, 0, sizeof(cmd));
+
+	cmd.handle = ev->cis_handle;
+
+	send_command(bthost, BT_HCI_CMD_LE_ACCEPT_CIS, &cmd, sizeof(cmd));
+}
+
 static void evt_le_meta_event(struct bthost *bthost, const void *data,
 								uint8_t len)
 {
@@ -1297,6 +1312,9 @@ static void evt_le_meta_event(struct bthost *bthost, const void *data,
 	case BT_HCI_EVT_LE_ENHANCED_CONN_COMPLETE:
 		evt_le_ext_conn_complete(bthost, evt_data, len - 1);
 		break;
+	case BT_HCI_EVT_LE_CIS_REQ:
+		evt_le_cis_req(bthost, evt_data, len - 1);
+		break;
 	default:
 		util_debug(bthost->debug_callback, bthost->debug_data,
 				"Unsupported LE Meta event 0x%2.2x", *event);
-- 
2.26.2

