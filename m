Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12A22132223
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Jan 2020 10:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbgAGJTA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Jan 2020 04:19:00 -0500
Received: from mail-lj1-f177.google.com ([209.85.208.177]:36800 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgAGJTA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Jan 2020 04:19:00 -0500
Received: by mail-lj1-f177.google.com with SMTP id r19so53937405ljg.3
        for <linux-bluetooth@vger.kernel.org>; Tue, 07 Jan 2020 01:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codecoup-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ry/gJgQdQCM11SeNBLFMsml232wTK8cdnnRJ5LnErfw=;
        b=R1o7+Qmnb8iQmSm/BLI9UdvuQ69fEKcmRNLnUyTK0OA7gXSCCvpVrdaw0xiAtjBZ2c
         98fSZD0ynpFBjIWiLavHa62OFxKiBkOf1mVomjrfwUl2eMpGm444l/HvMAo4tOMlRnC6
         PCzAZxfAVPySr3i8YiPcWVNPphoiiEOL+DLLSCT0l/R6kaaVWsCb0o14GRVeqdWk5hQC
         Wtz60Mxd5Hu+iG2l+9HD0YmYcpTSlGIaDuZ/ePLhPH25Qtp2QwI3qvsODgdL32T1PVvz
         RTzQarBoqbXiptD4NUrlTe4XISGUte1kOR12cvYgEMDRm8cRaZqPCmFMVjMak1VHsYcA
         fpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ry/gJgQdQCM11SeNBLFMsml232wTK8cdnnRJ5LnErfw=;
        b=W3/rPqhFacad54cCWs6CyMGjdeFnwYBIVLUFM/GOPWICFvqa75p7xw2/sXedJNWD9M
         S2IS+EfISGOd3J1VBzAT4WVGg0X8nPsF55tiNMcdlveXqJKPrricuF4pnhHHngtuvaaR
         Q1ZbehFGkf9nQjNS7spgWKOJqrxOjumuWAo/tbDm1p1CCoQkeuCJUGTEe9Rn1DZiPimB
         r+T6KKbRe2RB8cC8KBoDQMFoyqBb+zjUOKTbu2GXd6j1SihY7HTIGIhWJXOCe/YGI3IU
         TBQ7LE6thXJ79JYl6Ti5y0ybjbVNPtChXRYMK7WCGxfSmQKY9HTNwqCg/1DE3n6OTJ1s
         Tb3Q==
X-Gm-Message-State: APjAAAW7mZLa8BABU56OgXctW7/raB/gFcNVaduZFuW8COOTDwQOu+zN
        h2/TYxAKedKMDBeZxC5k6Jva//Iwokk=
X-Google-Smtp-Source: APXvYqzjwMqGrLNdvuJUMx3R2+/UV2TULakYqv0GxY726WjnJBlJucbTAUA4tkCUKGwarz+CQjZy3Q==
X-Received: by 2002:a2e:a37c:: with SMTP id i28mr63364879ljn.118.1578388738231;
        Tue, 07 Jan 2020 01:18:58 -0800 (PST)
Received: from tp480.int.codecoup.pl ([95.143.243.62])
        by smtp.gmail.com with ESMTPSA id d24sm30345292lfb.94.2020.01.07.01.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 01:18:57 -0800 (PST)
From:   Szymon Czapracki <szymon.czapracki@codecoup.pl>
To:     linux-bluetooth@vger.kernel.org
Cc:     Szymon Czapracki <szymon.czapracki@codecoup.pl>
Subject: [PATCH 4/8] monitor: Decode LE Periodic Advertising Sync Transfer command
Date:   Tue,  7 Jan 2020 10:18:29 +0100
Message-Id: <20200107091833.14921-4-szymon.czapracki@codecoup.pl>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107091833.14921-1-szymon.czapracki@codecoup.pl>
References: <20200107091833.14921-1-szymon.czapracki@codecoup.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

< HCI Command: LE Periodic Advertising Sync Transfer (0x08|0x005a) plen 6
        Connection handle: 1
        Service data: 0x0001
        Sync handle: 1
> HCI Event: Command Status (0x0f) plen 4
      LE Periodic Advertising Sync Transfer (0x08|0x005a) ncmd 1
        Status: Unknown HCI Command (0x01)

Change-Id: I9009c6c2299cc5e56bb94ddd46e8accbacbcc800
---
 monitor/bt.h     |  7 +++++++
 monitor/packet.c | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/monitor/bt.h b/monitor/bt.h
index bb373b528..efaf80f55 100644
--- a/monitor/bt.h
+++ b/monitor/bt.h
@@ -2467,6 +2467,13 @@ struct bt_hci_cmd_set_periodic_adv_rec_enable {
 	uint8_t  enable;
 } __attribute__ ((packed));
 
+#define BT_HCI_CMD_PERIODIC_SYNC_TRANS	0x205a
+struct bt_hci_cmd_periodic_sync_trans {
+	uint16_t handle;
+	uint16_t service_data;
+	uint16_t sync_handle;
+} __attribute__ ((packed));
+
 #define BT_HCI_EVT_INQUIRY_COMPLETE		0x01
 struct bt_hci_evt_inquiry_complete {
 	uint8_t  status;
diff --git a/monitor/packet.c b/monitor/packet.c
index c1e449a68..06fd72537 100644
--- a/monitor/packet.c
+++ b/monitor/packet.c
@@ -4025,6 +4025,13 @@ static void status_rsp(const void *data, uint8_t size)
 	print_status(status);
 }
 
+static void status_handle_rsp(const void *data, uint8_t size)
+{
+	uint8_t status = *((const uint8_t *) data);
+	print_status(status);
+	print_field("Connection handle: %d", get_u8(data + 1));
+}
+
 static void status_bdaddr_rsp(const void *data, uint8_t size)
 {
 	uint8_t status = *((const uint8_t *) data);
@@ -7598,6 +7605,15 @@ static void le_periodic_adv_rec_enable(const void *data, uint8_t size)
 	print_enable("Reporting", cmd->enable);
 }
 
+static void le_periodic_adv_sync_trans(const void *data, uint8_t size)
+{
+	const struct bt_hci_cmd_periodic_sync_trans *cmd = data;
+
+	print_field("Connection handle: %d", cmd->handle);
+	print_field("Service data: 0x%4.4x", cmd->service_data);
+	print_field("Sync handle: %d", cmd->sync_handle);
+}
+
 struct opcode_data {
 	uint16_t opcode;
 	int bit;
@@ -8394,6 +8410,9 @@ static const struct opcode_data opcode_table[] = {
 	{ 0x2059, 325, "LE Periodic Advertising Receive Enable",
 				le_periodic_adv_rec_enable, 3, true,
 				status_rsp, 1, true },
+	{ 0x205a, 326, "LE Periodic Advertising Sync Transfer",
+				le_periodic_adv_sync_trans, 6, true,
+				status_handle_rsp, 3, true },
 	{ }
 };
 
-- 
2.24.1

