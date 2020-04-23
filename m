Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 554331B69DD
	for <lists+linux-bluetooth@lfdr.de>; Fri, 24 Apr 2020 01:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbgDWXdI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 23 Apr 2020 19:33:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:37350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726060AbgDWXdI (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 23 Apr 2020 19:33:08 -0400
Received: from pali.im (pali.im [31.31.79.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 03F6E20784
        for <linux-bluetooth@vger.kernel.org>; Thu, 23 Apr 2020 23:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587684788;
        bh=MZI3kqXetRqYZNmF/nAtn3E2oorqBiw+Aq+t9Y6NEEA=;
        h=From:To:Subject:Date:From;
        b=vWr239aIdvbZ+OyFhHB3pgmetnwIRLhjHSEZpg7KTicCZXmSCgH9ljXjFiO1WGHLJ
         1Zr0Pm1ncilplWu/oTYvp83LTc/LWQ2sRGgT5Ng2hHZXbA9jI2mc1yhhhrMoWlZso+
         qIWMvlm2+4A/2BCEajaMwpJHBEmFj0cL3APDm8qA=
Received: by pali.im (Postfix)
        id C29E07E0; Fri, 24 Apr 2020 01:33:05 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH] device: Return error when ConnectProfile DBus method fails
Date:   Fri, 24 Apr 2020 01:32:43 +0200
Message-Id: <20200423233243.14937-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Without this patch ConnectProfile DBus method does not return failure if
profile connection failed and some other profile was already connected.
This is not correct behavior as ConnectProfile DBus method should always
return error when specified profile failed to connect. This patch fixes
this it.
---
 src/device.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/src/device.c b/src/device.c
index a8d95346a..7ab30705f 100644
--- a/src/device.c
+++ b/src/device.c
@@ -1584,6 +1584,7 @@ static void device_profile_connected(struct btd_device *dev,
 					struct btd_profile *profile, int err)
 {
 	struct btd_service *pending;
+	bool report_error;
 	GSList *l;
 
 	DBG("%s %s (%d)", profile->name, strerror(-err), -err);
@@ -1632,9 +1633,16 @@ done:
 
 	DBG("returning response to %s", dbus_message_get_sender(dev->connect));
 
-	l = find_service_with_state(dev->services, BTD_SERVICE_STATE_CONNECTED);
+	if (err && dbus_message_is_method_call(dev->connect, DEVICE_INTERFACE,
+					"ConnectProfile"))
+		report_error = true;
+	else if (err && !find_service_with_state(dev->services,
+					BTD_SERVICE_STATE_CONNECTED))
+		report_error = true;
+	else
+		report_error = false;
 
-	if (err && l == NULL) {
+	if (report_error) {
 		/* Fallback to LE bearer if supported */
 		if (err == -EHOSTDOWN && dev->le && !dev->le_state.connected) {
 			err = device_connect_le(dev);
-- 
2.20.1

