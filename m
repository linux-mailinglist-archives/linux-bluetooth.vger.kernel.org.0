Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71EFD44D637
	for <lists+linux-bluetooth@lfdr.de>; Thu, 11 Nov 2021 12:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233245AbhKKL6B (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 11 Nov 2021 06:58:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233315AbhKKL57 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 11 Nov 2021 06:57:59 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E0AC061766
        for <linux-bluetooth@vger.kernel.org>; Thu, 11 Nov 2021 03:55:10 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id v20-20020a25fc14000000b005c2109e5ad1so8848573ybd.9
        for <linux-bluetooth@vger.kernel.org>; Thu, 11 Nov 2021 03:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=9WP+pDgjCCoJy9/bLFKkqPqZ8WB0dJl7RMRcW4E1w7Q=;
        b=FgpAYglVMGsOPJMGkXgLHHRwKHCTLQpDJsIEA6AdGThtD96ch2tq0sVeTCJU+J6p48
         SZvUCOvLk9qNdodw90VwifkaRBAlchLml9fnZ6kVcYydDaD2nFy/vbZ0TpXe7W5M8dzt
         PhsdYxrotFq/OYrGWqDc7b//mGLJiznXFmE3+6EJZoSJzr9Mh0kimOeYOdVzM8lEWdo/
         ki3c2aODhla58W+w3omfFHxnqcYYXc/JkLpRNsmxpJx2akJFsCSIyvje/SR/Na8UpK0d
         H2x/XIZVMHJxDtTcn/osepjTdS0EI8uxikhIgyZNhKbTP5CI1QXxQwuQXShN9RMfCY84
         eb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=9WP+pDgjCCoJy9/bLFKkqPqZ8WB0dJl7RMRcW4E1w7Q=;
        b=N2S+vOIZUnnWwp/xI0KDXwiZziUjWBvIexeXucxBc6Qsb02rpO+q2vdqQWckQ2wDbQ
         kg6NHDAdsAO7qHjck0Rn64X6hxahQGvEVTT6k1gYWf4y0z/mGtF2xLVryyw9hbFM2cHQ
         DBZUpEJOvlAOItyw3zBqrZG6k2GBvLJMT+sBhdUJ92VW/5fmHEaJlIxjE0CJaYWdcKye
         UAKhhV54a9z9kcMhbgWsQT0I0DLuvwDvjOt8fEmr3mp8pPlDUpjApX0BHXF9LxcYY8Hn
         8nEV0aSjb9Upe+Z5FaPQCx+pm3eEiF0HCAGD5lGqfP5GS3DP6J1GUh8IbYpJgtEy6fX+
         uqAQ==
X-Gm-Message-State: AOAM531VbZruCKH3qsCIxF5sD9TNKFNdQyS79R5E9zbL/hTVN8dgsrD3
        cbkI4MGh4XdKM8OrKazeueGrS7otofZiEIJxcrn5VURbeSGXrPqIzL8wMC6BVExHO9PASOnWbkp
        06LoZB6FGvaQ+UW8m4/xVuSCiP7CLazpdIItqZKfvqqjKlcJg8oMgZNLHaDw6xTkyliHdDWyn5I
        h1
X-Google-Smtp-Source: ABdhPJwnmc0HF115/GltUFyuvP2120iMqZn+brP/Qj8ZFhJM8FOSuxZoL9FrFkGsjZ4Z1hHjJPOxTV4PFFWa
X-Received: from apusaka-p920.tpe.corp.google.com ([2401:fa00:1:10:b87e:3eb:e17e:1273])
 (user=apusaka job=sendgmr) by 2002:a25:f443:: with SMTP id
 p3mr7686044ybe.162.1636631709311; Thu, 11 Nov 2021 03:55:09 -0800 (PST)
Date:   Thu, 11 Nov 2021 19:54:53 +0800
In-Reply-To: <20211111195423.Bluez.1.I9fc087b25433a9347b2d8c8ff7a25fadf448ef49@changeid>
Message-Id: <20211111195423.Bluez.2.I08d192861aa6b2025fbc575a7e0caffaa6170ed5@changeid>
Mime-Version: 1.0
References: <20211111195423.Bluez.1.I9fc087b25433a9347b2d8c8ff7a25fadf448ef49@changeid>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [Bluez PATCH 2/3] device: Save remote name request attempts into
 cache file
From:   Archie Pusaka <apusaka@google.com>
To:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>
Cc:     CrosBT Upstreaming <chromeos-bluetooth-upstreaming@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>,
        Sonny Sasaka <sonnysasaka@chromium.org>,
        Miao-chen Chou <mcchou@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Archie Pusaka <apusaka@chromium.org>

Since a peer device is potentially removed if not discovered for more
than 30 seconds, we would lost the remote name request activity when
the device is rediscovered. This could end up with a remote name
request much sooner than we intend it to be.

Therefore, put the RNR record into a cache file, so we can recover it
when the peer device is rediscovered.

Reviewed-by: Sonny Sasaka <sonnysasaka@chromium.org>
Reviewed-by: Miao-chen Chou <mcchou@chromium.org>
---

 src/device.c | 96 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/src/device.c b/src/device.c
index 699faeba3b..fa6e3abc37 100644
--- a/src/device.c
+++ b/src/device.c
@@ -568,6 +568,63 @@ void device_store_cached_name(struct btd_device *dev, const char *name)
 	g_key_file_free(key_file);
 }
 
+static void device_store_cached_name_resolve_attempts(struct btd_device *dev)
+{
+	char filename[PATH_MAX];
+	char d_addr[18];
+	GKeyFile *key_file;
+	GError *gerr = NULL;
+	char *data;
+	char *data_old;
+	gsize length = 0;
+	gsize length_old = 0;
+	uint64_t earliest_allowed;
+	unsigned int num_failures;
+
+	if (device_address_is_private(dev)) {
+		DBG("Can't store name resolve for private addressed device %s",
+								dev->path);
+		return;
+	}
+
+	ba2str(&dev->bdaddr, d_addr);
+	snprintf(filename, PATH_MAX, STORAGEDIR "/%s/cache/%s",
+			btd_adapter_get_storage_dir(dev->adapter), d_addr);
+	create_file(filename, 0600);
+
+	key_file = g_key_file_new();
+	if (!g_key_file_load_from_file(key_file, filename, 0, &gerr)) {
+		error("Unable to load key file from %s: (%s)", filename,
+								gerr->message);
+		g_error_free(gerr);
+	}
+
+	earliest_allowed = (uint64_t) dev->name_resolve_earliest_allow_time;
+	num_failures = dev->name_resolve_fail_count;
+
+	data_old = g_key_file_to_data(key_file, &length_old, NULL);
+
+	g_key_file_set_uint64(key_file, "NameResolve", "EarliestAllowed",
+							earliest_allowed);
+	g_key_file_set_integer(key_file, "NameResolve", "NumFailures",
+							num_failures);
+
+	data = g_key_file_to_data(key_file, &length, NULL);
+
+	if ((length != length_old) || (memcmp(data, data_old, length))) {
+		if (!g_file_set_contents(filename, data, length, &gerr)) {
+			error("Unable set contents for %s: (%s)", filename,
+								gerr->message);
+			g_error_free(gerr);
+		}
+	}
+
+	g_free(data);
+	g_free(data_old);
+
+	g_key_file_free(key_file);
+}
+
 static void browse_request_free(struct browse_req *req)
 {
 	struct btd_device *device = req->device;
@@ -3277,6 +3334,36 @@ failed:
 	return str;
 }
 
+static void load_cached_name_resolve_attempts(struct btd_device *device,
+					const char *local, const char *peer)
+{
+	char filename[PATH_MAX];
+	GKeyFile *key_file;
+	uint64_t earliest_allowed;
+	unsigned int num_failures;
+
+	if (device_address_is_private(device))
+		return;
+
+	snprintf(filename, PATH_MAX, STORAGEDIR "/%s/cache/%s", local, peer);
+
+	key_file = g_key_file_new();
+
+	if (!g_key_file_load_from_file(key_file, filename, 0, NULL))
+		goto failed;
+
+	earliest_allowed = g_key_file_get_uint64(key_file, "NameResolve",
+						"EarliestAllowed", NULL);
+	num_failures = g_key_file_get_uint64(key_file, "NameResolve",
+						"NumFailures", NULL);
+
+	device->name_resolve_earliest_allow_time = earliest_allowed;
+	device->name_resolve_fail_count = (uint8_t) num_failures;
+
+failed:
+	g_key_file_free(key_file);
+}
+
 static struct csrk_info *load_csrk(GKeyFile *key_file, const char *group)
 {
 	struct csrk_info *csrk;
@@ -4284,6 +4371,7 @@ struct btd_device *device_create(struct btd_adapter *adapter,
 	struct btd_device *device;
 	char dst[18];
 	char *str;
+	const char *storage_dir;
 
 	ba2str(bdaddr, dst);
 	DBG("dst %s", dst);
@@ -4299,13 +4387,15 @@ struct btd_device *device_create(struct btd_adapter *adapter,
 	else
 		device->le = true;
 
-	str = load_cached_name(device, btd_adapter_get_storage_dir(adapter),
-									dst);
+	storage_dir = btd_adapter_get_storage_dir(adapter);
+	str = load_cached_name(device, storage_dir, dst);
 	if (str) {
 		strcpy(device->name, str);
 		g_free(str);
 	}
 
+	load_cached_name_resolve_attempts(device, storage_dir, dst);
+
 	return device;
 }
 
@@ -4382,6 +4472,8 @@ void device_name_resolve_fail(struct btd_device *device)
 	device->name_resolve_fail_count++;
 	device->name_resolve_earliest_allow_time = time(NULL) +
 		NAME_RESOLVE_RETRY_DELAY * device->name_resolve_fail_count;
+
+	device_store_cached_name_resolve_attempts(device);
 }
 
 void device_set_class(struct btd_device *device, uint32_t class)
-- 
2.34.0.rc0.344.g81b53c2807-goog

