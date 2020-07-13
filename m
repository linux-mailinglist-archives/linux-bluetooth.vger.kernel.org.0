Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1B021D096
	for <lists+linux-bluetooth@lfdr.de>; Mon, 13 Jul 2020 09:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgGMHpu (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 13 Jul 2020 03:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbgGMHps (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 13 Jul 2020 03:45:48 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73964C061794
        for <linux-bluetooth@vger.kernel.org>; Mon, 13 Jul 2020 00:45:48 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 1so5637849pfn.9
        for <linux-bluetooth@vger.kernel.org>; Mon, 13 Jul 2020 00:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+xSpopuz70JG6iQfzM5HgibXAJUo1c/P7qmmEsvws9s=;
        b=Kc5iLI/iQywUAZzcS/x0aAofjXobkcKggku2JP87VotyNaCUPk2Py7OWxK8E9eVaxa
         CahAMnsRsqRjstEh9jYRglZqFJ7nQJNIVORRbfGSzjOG/UdG8t6tQqFc39Acu563iNdX
         74kCvC+jQYgz/0vCK77oVtwe7UbVamVpsCR9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+xSpopuz70JG6iQfzM5HgibXAJUo1c/P7qmmEsvws9s=;
        b=tCfpOzvkXhRJeAztnorglS5UQ2f1DYY4XMqXlce5hfRUVKXtjAqThuF0LxgFl2Qjuc
         5Xjr/eIB5vDy+RlCsAVIt4v2y99Owl6qzAeCS4g8VsByUp8VYLNlnvu3DmQLwERtjFNy
         m/5p1AfQCyZFQ36ndAC3M2R06fr1Q6jedrrUHnRJRcHm5WZhmQTedueXuWYVc+h9+dqA
         730o6Ha8bLmqZ+AsADvI1ONeqIYg7RqRuZDBRwNQn5C+xGvElDfOBzYjno6d8p5WtvHx
         6mAWdV3rZ+I3bawmRjwDXDoOu0bFmY6GnatO4E/0NS5WzHkntmVPpV+j3wdJCDPbouuC
         FuNg==
X-Gm-Message-State: AOAM532lKvpps67rk7f97t07WRcOYCCuOMw96ZN1ze0kYC+gcwFBoBSV
        Z5Vo1gx1xXi9nUIDaab0QKllUDtyVXBTCw==
X-Google-Smtp-Source: ABdhPJzW69Vm+lK8/pCwW1u4QfMsHRO3SS16AexP6hozF17c7XNzQfwn82/Bxo+zSG+hxNagRn79rQ==
X-Received: by 2002:a65:4bc8:: with SMTP id p8mr67352267pgr.418.1594626347737;
        Mon, 13 Jul 2020 00:45:47 -0700 (PDT)
Received: from josephsih-z840.tpe.corp.google.com ([2401:fa00:1:10:de4a:3eff:fe7d:ff5f])
        by smtp.gmail.com with ESMTPSA id g8sm12691498pgr.70.2020.07.13.00.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 00:45:46 -0700 (PDT)
From:   Joseph Hwang <josephsih@chromium.org>
To:     linux-bluetooth@vger.kernel.org, marcel@holtmann.org,
        luiz.dentz@gmail.com
Cc:     chromeos-bluetooth-upstreaming@chromium.org, josephsih@google.com,
        Joseph Hwang <josephsih@chromium.org>, alainm@chromium.org,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] Bluetooth: btusb: add Realtek 8822CE to usb_device_id table
Date:   Mon, 13 Jul 2020 15:45:29 +0800
Message-Id: <20200713154512.v2.1.I63705bf6abab9cb79c14f7959a59b201af2b8827@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch adds the Realtek 8822CE controller to the usb_device_id
table to support the wideband speech capability.

Reviewed-by: alainm@chromium.org
Signed-off-by: Joseph Hwang <josephsih@chromium.org>
---

Changes in v2:
- Fixed the commit subject and message body.

 drivers/bluetooth/btusb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index faa863dd5d0a33..aa0bc9942afda9 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -359,6 +359,10 @@ static const struct usb_device_id blacklist_table[] = {
 	{ USB_VENDOR_AND_INTERFACE_INFO(0x8087, 0xe0, 0x01, 0x01),
 	  .driver_info = BTUSB_IGNORE },
 
+	/* Realtek 8822CE Bluetooth devices */
+	{ USB_DEVICE(0x0bda, 0xb00c), .driver_info = BTUSB_REALTEK |
+						     BTUSB_WIDEBAND_SPEECH },
+
 	/* Realtek Bluetooth devices */
 	{ USB_VENDOR_AND_INTERFACE_INFO(0x0bda, 0xe0, 0x01, 0x01),
 	  .driver_info = BTUSB_REALTEK },
-- 
2.27.0.383.g050319c2ae-goog

