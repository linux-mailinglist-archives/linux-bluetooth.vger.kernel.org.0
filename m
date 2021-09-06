Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 782BF401787
	for <lists+linux-bluetooth@lfdr.de>; Mon,  6 Sep 2021 10:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240631AbhIFIG3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 6 Sep 2021 04:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240622AbhIFIG3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 6 Sep 2021 04:06:29 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F100C061575
        for <linux-bluetooth@vger.kernel.org>; Mon,  6 Sep 2021 01:05:25 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id k9-20020a05620a138900b003d59b580010so9925626qki.18
        for <linux-bluetooth@vger.kernel.org>; Mon, 06 Sep 2021 01:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=1X27jyJEhy/2kFxjNizJsG/qiS0KQzcaw5NG9pZxT9A=;
        b=AU18YjwCiudh6EgvRocUBxXHIwrL7/ppuV1xBLBm2j/QKuD4chXbLa6vyJKH2SLFVv
         PNxePBlIOkyFCb+qvXnH0iZXfnfHXAQEk+aNbgo3MCabyj8UK43xTRKf62VV2Ag6eZVt
         z8mRdimjS1EgNq+Zh3NbCQ9FE7w1r9wcObKpsDcFLmsc28lsYXwPQeItfHuEaC/Vrf0f
         jUhoSQcp5VAoMvsoHV6mKF+uI7vtXbV5CBuUufdf14bAwvWrZ5tu4lxmGQ3ekiZK1q/c
         K5x8g6+CwXiWlvfOxeNNiLu9PappeEswlwkfEwa7eX3n+FHq77x1Ih4qxHCXAYmYGd8m
         zJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=1X27jyJEhy/2kFxjNizJsG/qiS0KQzcaw5NG9pZxT9A=;
        b=FDqy6eFEm4py3+l2fnDDi8snt6ICV3f2c3/lJSYu6lYzfscRa1Z4fP9zhWFNIlT8Nq
         4M4aU9fvkxRRxSnauIS5NFVsFvHHBFdFPOU5HeuNhrFH+ZkZJwcq8/k0mUw5HgC8c6th
         UsAzrBm1yO9Srbn3pDhskxkaFHgQgEMLUDGeXacH0M0a71YJGRFaginMoFZqLeBTiVw1
         3CM0UxCMyh6RMOJgsU0h0XA0mJQnzMqd1aWpBwMWFhiptfkfN10uNOn0UvAkQ5aC9JNS
         ccE4vckGjDSBEUZjDYTG1niB8DtcLE2Bywvbgeg0AmB3maAxAX004pyuIaMiBCTYnFEb
         6Wjw==
X-Gm-Message-State: AOAM533h5azIpdY/f313IT449HR+WJApZjVQfW/vP+lf0soMIf6raCJd
        NYgCTWukQXfDkC5nCUb51h4vfyKZCDcdMn4h5r9A0wfnAEfcQ00kyhJfqQb6tp9RqOvSG7+bRxI
        rirBY5ptINx9ZgH8DWu07MAoIJmjPe1uGYrpvvwCjPfT/19trN7WLjAvt86JGftc5cKIAIJz8Gb
        LI
X-Google-Smtp-Source: ABdhPJx7ZyMbc35Td6tMEYAkzV47OC9yLvcbYlLF5XquSyYqUFmNTjw750A33vEVZQ10TRSuvIGGuGhxU7ke
X-Received: from apusaka-p920.tpe.corp.google.com ([2401:fa00:1:10:3b13:95ba:12e5:7134])
 (user=apusaka job=sendgmr) by 2002:a0c:e04a:: with SMTP id
 y10mr10591124qvk.14.1630915524274; Mon, 06 Sep 2021 01:05:24 -0700 (PDT)
Date:   Mon,  6 Sep 2021 16:04:45 +0800
In-Reply-To: <20210906080450.1771211-1-apusaka@google.com>
Message-Id: <20210906160340.Bluez.v4.7.I50be9be1265bc743325cfdb9fa0bdbce9671a304@changeid>
Mime-Version: 1.0
References: <20210906080450.1771211-1-apusaka@google.com>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [Bluez PATCH v4 07/12] profiles: Inclusive language changes
From:   Archie Pusaka <apusaka@google.com>
To:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     CrosBT Upstreaming <chromeos-bluetooth-upstreaming@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Archie Pusaka <apusaka@chromium.org>

BT core spec 5.3 promotes the usage of inclusive languages.
This CL replaces some terms with the more appropriate counterparts,
such as "central" and "peripheral".
---

Changes in v4:
* Fix line over 80 columns

Changes in v2:
* Merging several patches from the same directory into one

 profiles/audio/avctp.c | 10 +++++-----
 profiles/audio/avctp.h |  2 +-
 profiles/health/mcap.c | 20 ++++++++++----------
 profiles/health/mcap.h |  2 +-
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/profiles/audio/avctp.c b/profiles/audio/avctp.c
index 9f717f35bb..702ded1366 100644
--- a/profiles/audio/avctp.c
+++ b/profiles/audio/avctp.c
@@ -1614,7 +1614,7 @@ static void avctp_confirm_cb(GIOChannel *chan, gpointer data)
 	return;
 }
 
-static GIOChannel *avctp_server_socket(const bdaddr_t *src, gboolean master,
+static GIOChannel *avctp_server_socket(const bdaddr_t *src, gboolean central,
 						uint8_t mode, uint16_t psm)
 {
 	GError *err = NULL;
@@ -1625,7 +1625,7 @@ static GIOChannel *avctp_server_socket(const bdaddr_t *src, gboolean master,
 				BT_IO_OPT_SOURCE_BDADDR, src,
 				BT_IO_OPT_PSM, psm,
 				BT_IO_OPT_SEC_LEVEL, BT_IO_SEC_MEDIUM,
-				BT_IO_OPT_CENTRAL, master,
+				BT_IO_OPT_CENTRAL, central,
 				BT_IO_OPT_MODE, mode,
 				BT_IO_OPT_INVALID);
 	if (!io) {
@@ -1636,20 +1636,20 @@ static GIOChannel *avctp_server_socket(const bdaddr_t *src, gboolean master,
 	return io;
 }
 
-int avctp_register(struct btd_adapter *adapter, gboolean master)
+int avctp_register(struct btd_adapter *adapter, gboolean central)
 {
 	struct avctp_server *server;
 	const bdaddr_t *src = btd_adapter_get_address(adapter);
 
 	server = g_new0(struct avctp_server, 1);
 
-	server->control_io = avctp_server_socket(src, master, BT_IO_MODE_BASIC,
+	server->control_io = avctp_server_socket(src, central, BT_IO_MODE_BASIC,
 							AVCTP_CONTROL_PSM);
 	if (!server->control_io) {
 		g_free(server);
 		return -1;
 	}
-	server->browsing_io = avctp_server_socket(src, master, BT_IO_MODE_ERTM,
+	server->browsing_io = avctp_server_socket(src, central, BT_IO_MODE_ERTM,
 							AVCTP_BROWSING_PSM);
 	if (!server->browsing_io) {
 		if (server->control_io) {
diff --git a/profiles/audio/avctp.h b/profiles/audio/avctp.h
index 23e3732cde..ca5ff9126d 100644
--- a/profiles/audio/avctp.h
+++ b/profiles/audio/avctp.h
@@ -145,7 +145,7 @@ unsigned int avctp_add_state_cb(struct btd_device *dev, avctp_state_cb cb,
 							void *user_data);
 gboolean avctp_remove_state_cb(unsigned int id);
 
-int avctp_register(struct btd_adapter *adapter, gboolean master);
+int avctp_register(struct btd_adapter *adapter, gboolean central);
 void avctp_unregister(struct btd_adapter *adapter);
 
 struct avctp *avctp_connect(struct btd_device *device);
diff --git a/profiles/health/mcap.c b/profiles/health/mcap.c
index be13af37a0..5161ef77c8 100644
--- a/profiles/health/mcap.c
+++ b/profiles/health/mcap.c
@@ -52,15 +52,15 @@
 struct mcap_csp {
 	uint64_t	base_tmstamp;	/* CSP base timestamp */
 	struct timespec	base_time;	/* CSP base time when timestamp set */
-	guint		local_caps;	/* CSP-Master: have got remote caps */
-	guint		remote_caps;	/* CSP-Slave: remote master got caps */
-	guint		rem_req_acc;	/* CSP-Slave: accuracy required by master */
-	guint		ind_expected;	/* CSP-Master: indication expected */
-	uint8_t		csp_req;	/* CSP-Master: Request control flag */
-	guint		ind_timer;	/* CSP-Slave: indication timer */
-	guint		set_timer;	/* CSP-Slave: delayed set timer */
-	void		*set_data;	/* CSP-Slave: delayed set data */
-	void		*csp_priv_data;	/* CSP-Master: In-flight request data */
+	guint		local_caps;	/* CSP-Cent.: have got remote caps */
+	guint		remote_caps;	/* CSP-Perip: remote central got caps */
+	guint		rem_req_acc;	/* CSP-Perip: accuracy req by central */
+	guint		ind_expected;	/* CSP-Cent.: indication expected */
+	uint8_t		csp_req;	/* CSP-Cent.: Request control flag */
+	guint		ind_timer;	/* CSP-Perip: indication timer */
+	guint		set_timer;	/* CSP-Perip: delayed set timer */
+	void		*set_data;	/* CSP-Perip: delayed set data */
+	void		*csp_priv_data;	/* CSP-Cent.: In-flight request data */
 };
 
 struct mcap_sync_cap_cbdata {
@@ -3139,7 +3139,7 @@ void mcap_sync_set_req(struct mcap_mcl *mcl, uint8_t update, uint32_t btclock,
 		g_set_error(err,
 			MCAP_CSP_ERROR,
 			MCAP_ERROR_RESOURCE_UNAVAILABLE,
-			"Did not get CSP caps from slave yet");
+			"Did not get CSP caps from peripheral yet");
 		return;
 	}
 
diff --git a/profiles/health/mcap.h b/profiles/health/mcap.h
index 5a94c8b63b..00f3fa8510 100644
--- a/profiles/health/mcap.h
+++ b/profiles/health/mcap.h
@@ -270,7 +270,7 @@ struct mcap_instance {
 	mcap_mcl_event_cb	mcl_reconnected_cb;	/* Old MCL has been reconnected */
 	mcap_mcl_event_cb	mcl_disconnected_cb;	/* MCL disconnected */
 	mcap_mcl_event_cb	mcl_uncached_cb;	/* MCL has been removed from MCAP cache */
-	mcap_info_ind_event_cb	mcl_sync_infoind_cb;	/* (CSP Master) Received info indication */
+	mcap_info_ind_event_cb	mcl_sync_infoind_cb;	/* (CSP Central) Received info indication */
 	gpointer		user_data;		/* Data to be provided in callbacks */
 	int			ref;			/* Reference counter */
 
-- 
2.33.0.153.gba50c8fa24-goog

