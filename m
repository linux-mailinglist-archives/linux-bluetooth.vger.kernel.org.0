Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0A151EDC0F
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Jun 2020 06:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgFDEFz (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 4 Jun 2020 00:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgFDEFy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 4 Jun 2020 00:05:54 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BA2AC03E96D
        for <linux-bluetooth@vger.kernel.org>; Wed,  3 Jun 2020 21:05:54 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id q16so1618312plr.2
        for <linux-bluetooth@vger.kernel.org>; Wed, 03 Jun 2020 21:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=BU6ReF+CfuG1LTcepLVvODsTNk13vMQXVhPfvRTtwpU=;
        b=gAS9QwEPbm1XfGhdu+25w0d8AYeYGso/wq0qpJNDr5q5nYqBLoAXJ8JlF6FEb3Dziw
         DF9HlGThPZZZpuH0wd6CtiIcts0obs7EO91P0l79LdMp+ZwZFOUdzBFMfh/6XkWL8dGS
         gCoqy4mhXfXdutRF1ntD1Pw/m4y9DQprzFBjybSUOVCYz5ivGa4foNmzL35S1gj+2EMi
         riRXHzix0JJPxY9xGkVBfqYN4zxPCAK/DbzeIsVeOhhCJoTmiTz7rIVShV5UdL0wO8gz
         t4PiA1nx9g8s05qKRUKvdSS1eoZovCc23uXk4Qil3XYTSnhAwTIbmgdih10arIEdIBQx
         6XLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BU6ReF+CfuG1LTcepLVvODsTNk13vMQXVhPfvRTtwpU=;
        b=l4MGbZyGLRVUlFzAe1NN426zb/IsDfwq3PZ3JF7TOpCqEE4BLjniYeBDc+fHlTci1K
         NwyxwOlF/+6D5cuvA8laIUIGExu1X07vw4IihALRg/TFr+pkYsR8R26nbqqxHrV/aPlv
         /0Q+o8s+PcINYkF8zkdyVcAQBoXyac9PF7jX/G+bfAAKkFJaC1gvdoICXvVOypi8eGuX
         59JKv2eKh41DvIS7iB+CxBEk6g9Q8ncJh0Y+NKy4/teldSHpJhi5CG31Y34/YInLoxlG
         nSQa+L4C7NBDjjygnhnEPBZvyXI604iuGwH4s09n3Smn73cmawIaXMWh0fe13UV6nlDV
         gk9g==
X-Gm-Message-State: AOAM531pxjQpgkVxfzkqb+IxBfP9zNwulB3Gkk4quq9k6QHhPN3StBE+
        U/DDuoO4L5ZSH5S5lVw1FlZeU0Ck9mY=
X-Google-Smtp-Source: ABdhPJxwtxJYkpDm7IvHuIK56uWwJ1m5h1AA0S5etB3MEQgKiN/oFcBeMW6R5P3qJVmZgnHb4X8olQ==
X-Received: by 2002:a17:90a:b949:: with SMTP id f9mr3421630pjw.79.1591243553969;
        Wed, 03 Jun 2020 21:05:53 -0700 (PDT)
Received: from nsathish-Latitude-7480.iind.intel.com ([134.134.137.77])
        by smtp.gmail.com with ESMTPSA id w190sm3098898pfw.35.2020.06.03.21.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 21:05:53 -0700 (PDT)
From:   Sathish Narasimman <nsathish41@gmail.com>
X-Google-Original-From: Sathish Narasimman <sathish.narasimman@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Sathish Narasimman <sathish.narasimman@intel.com>
Subject: [PATCH v2 7/7] Bluetooth: Enable RPA Timeout
Date:   Thu,  4 Jun 2020 09:39:16 +0530
Message-Id: <20200604040916.13495-1-sathish.narasimman@intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Enable RPA timeout during bluetooth initialization.
The RPA timeout value is used from hdev, which initialized from
debug_fs

Signed-off-by: Sathish Narasimman <sathish.narasimman@intel.com>
---
 include/net/bluetooth/hci.h | 2 ++
 net/bluetooth/hci_core.c    | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 1165dfea56a9..12005fbe6e09 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -1637,6 +1637,8 @@ struct hci_rp_le_read_resolv_list_size {
 
 #define HCI_OP_LE_SET_ADDR_RESOLV_ENABLE 0x202d
 
+#define HCI_OP_LE_SET_RPA_TIMEOUT	0x202e
+
 #define HCI_OP_LE_READ_MAX_DATA_LEN	0x202f
 struct hci_rp_le_read_max_data_len {
 	__u8	status;
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index f4ceda1f1454..67e1434c3f31 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -763,6 +763,14 @@ static int hci_init3_req(struct hci_request *req, unsigned long opt)
 			hci_req_add(req, HCI_OP_LE_CLEAR_RESOLV_LIST, 0, NULL);
 		}
 
+		if (hdev->commands[35] & 0x40) {
+			__le16 rpa_timeout = cpu_to_le16(hdev->rpa_timeout);
+
+			/* Set RPA timeout */
+			hci_req_add(req, HCI_OP_LE_SET_RPA_TIMEOUT, 2,
+				    &rpa_timeout);
+		}
+
 		if (hdev->le_features[0] & HCI_LE_DATA_LEN_EXT) {
 			/* Read LE Maximum Data Length */
 			hci_req_add(req, HCI_OP_LE_READ_MAX_DATA_LEN, 0, NULL);
-- 
2.17.1

