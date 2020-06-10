Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81D6C1F573F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 10 Jun 2020 17:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbgFJPGA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 10 Jun 2020 11:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgFJPF7 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 10 Jun 2020 11:05:59 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CAFAC03E96B
        for <linux-bluetooth@vger.kernel.org>; Wed, 10 Jun 2020 08:05:59 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id k186so2411400ybc.19
        for <linux-bluetooth@vger.kernel.org>; Wed, 10 Jun 2020 08:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=DFAugfN6wid2Iaw64Qa5wmgkAZMD2ptZtMQ6f6/Mx5k=;
        b=bNGhbEar8k6GzFFMv4elDtAvcB+/KK1rmqsogGa3ZjOTKs5fjArrzgqi+nVyTP6Rq2
         +C+FRG08BQRKpmkcXoabmPJfDVRM3pyzalMMfAAYrusI65VBF9W0+BYEZVifnG6Fhx8j
         O2fMhJkgkAzMhcAQ6djYLKp650DrQgN8tsy6DpKvgVLr6T4rgxOmlfci9rskWDPUYvAP
         Rla62cC8u9XqBuXj9Zrw9PJLJV6MyY972x22sHT78ViasP32iDn5NFVfJRUCWgKLB8Nv
         pXCAxmDXlr5MEYi83JgWKkltIlor6UeQZMoOJf2ARi/vfwV9hOpn9hLyrZVUBRiCLUn/
         l3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=DFAugfN6wid2Iaw64Qa5wmgkAZMD2ptZtMQ6f6/Mx5k=;
        b=EbttL1R0EzGQfezjB9iXVDOWcFvCIqrEix/RHjvatdQ9uyOXORmd65i55WXU/TTV+f
         DcLXLJnsAGXMTepqJcfPdxWEwFeI5Tg/+GLzijpJT8wOT3KPFv43pcvJ9lJDmkVUV5eH
         KkBr/Q8IcFEy1KNb45H96S1GtD6JOq7M/Wp0I4AU3opGUp0gDL76eSstu5MEbX7nOYuc
         4lOWTwcS29Fc9XY6vEbqACck8HXKPrhN9YX6VukSI5buOsDuSrrd2Rh5niiWUnQVm3ud
         ILaZcMI8Ob4uvr0Cak9Q5F7E9b5tFqJiHohimW/VsVDH2eobmBSLTorNiQozNHBHfBqd
         4NQw==
X-Gm-Message-State: AOAM531zD4jYNy+cnxO3OUBY29n9tN0HU61tOdjlvMBJzi8Q+7ciVss3
        TWKzERsjmZ1uuPe6G5qWZ5m9z/gm3K6DNpUB/l3+jNAoUqEZNqmJ6h9oKGXo+oN1rEFZJLNLWv+
        gopViq8/BpAhFuSpG9Yw0EIRoWT3A5GuFIzqW06dDiCuPeI7EfTgp3r2VovPOkZELR4FGjDH7b2
        tP
X-Google-Smtp-Source: ABdhPJzkkpzDnQeVmQexa7JL44T3LJVo/aM5dHT+SrkwDxJoSHmQHosoU1SoZI1XNEKL83XCcQztMCZuAcBB
X-Received: by 2002:a25:d354:: with SMTP id e81mr6591544ybf.398.1591801558180;
 Wed, 10 Jun 2020 08:05:58 -0700 (PDT)
Date:   Wed, 10 Jun 2020 23:05:44 +0800
Message-Id: <20200610230524.Bluez.v1.1.I1322f6745fa50365c1c88de3e2c50c9c5962c094@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
Subject: [Bluez PATCH v1 1/2] device: add device_remove_bonding function
From:   Archie Pusaka <apusaka@google.com>
To:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     Archie Pusaka <apusaka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Archie Pusaka <apusaka@chromium.org>

This patch splits the "bonding removal" function in device.c,
because we need to remove bonding information when receiving
"virtual cable unplug" in HID profile.
---

 src/device.c | 25 +++++++++++++++----------
 src/device.h |  1 +
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/src/device.c b/src/device.c
index 7b0eb256e..9fb0e018c 100644
--- a/src/device.c
+++ b/src/device.c
@@ -4162,6 +4162,17 @@ static void delete_folder_tree(const char *dirname)
 	rmdir(dirname);
 }
 
+void device_remove_bonding(struct btd_device *device, uint8_t bdaddr_type)
+{
+	if (bdaddr_type == BDADDR_BREDR)
+		device->bredr_state.bonded = false;
+	else
+		device->le_state.bonded = false;
+
+	btd_adapter_remove_bonding(device->adapter, &device->bdaddr,
+							bdaddr_type);
+}
+
 static void device_remove_stored(struct btd_device *device)
 {
 	char device_addr[18];
@@ -4170,17 +4181,11 @@ static void device_remove_stored(struct btd_device *device)
 	char *data;
 	gsize length = 0;
 
-	if (device->bredr_state.bonded) {
-		device->bredr_state.bonded = false;
-		btd_adapter_remove_bonding(device->adapter, &device->bdaddr,
-								BDADDR_BREDR);
-	}
+	if (device->bredr_state.bonded)
+		device_remove_bonding(device, BDADDR_BREDR);
 
-	if (device->le_state.bonded) {
-		device->le_state.bonded = false;
-		btd_adapter_remove_bonding(device->adapter, &device->bdaddr,
-							device->bdaddr_type);
-	}
+	if (device->le_state.bonded)
+		device_remove_bonding(device, device->bdaddr_type);
 
 	device->bredr_state.paired = false;
 	device->le_state.paired = false;
diff --git a/src/device.h b/src/device.h
index 06b100499..907c7c5c4 100644
--- a/src/device.h
+++ b/src/device.h
@@ -49,6 +49,7 @@ uint16_t btd_device_get_vendor(struct btd_device *device);
 uint16_t btd_device_get_vendor_src(struct btd_device *device);
 uint16_t btd_device_get_product(struct btd_device *device);
 uint16_t btd_device_get_version(struct btd_device *device);
+void device_remove_bonding(struct btd_device *device, uint8_t bdaddr_type);
 void device_remove(struct btd_device *device, gboolean remove_stored);
 int device_address_cmp(gconstpointer a, gconstpointer b);
 int device_bdaddr_cmp(gconstpointer a, gconstpointer b);
-- 
2.27.0.278.ge193c7cf3a9-goog

