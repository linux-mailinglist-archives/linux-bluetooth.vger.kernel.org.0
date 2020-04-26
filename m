Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1631B941F
	for <lists+linux-bluetooth@lfdr.de>; Sun, 26 Apr 2020 23:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgDZVCP (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 26 Apr 2020 17:02:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:33426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725996AbgDZVCP (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 26 Apr 2020 17:02:15 -0400
Received: from pali.im (pali.im [31.31.79.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F178320700
        for <linux-bluetooth@vger.kernel.org>; Sun, 26 Apr 2020 21:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587934935;
        bh=TjO0H2HDzlHnC88Oif0p9ELRNOWtjJmgg35GDPNQP88=;
        h=From:To:Subject:Date:From;
        b=picvcPUrb5MNSLoW3wOchmS3SxBMDD9BRHfnUt33kXmLE5WAN7Cgpme+Obim+hotU
         jc22rxqNVJz96rtqwoIaLbxcKRipFt0T3faMHeKPi6M+hqkPB7x9cWDNgvWLX32s9R
         Q9zz0CXnvtel+yJaq9iNTqTpMSTCBNpeUkAc+v48=
Received: by pali.im (Postfix)
        id BD8F2B71; Sun, 26 Apr 2020 23:02:12 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH] device: Fix calling DisconnectProfile DBus call with disconnected profile UUID
Date:   Sun, 26 Apr 2020 23:02:02 +0200
Message-Id: <20200426210202.700-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

When DisconnectProfile is called with disconnected UUID, bluetooth daemon
often returned error "Operation already in progress". This change fixed it
and no error message is returned for this case.
---
 src/device.c  | 5 +++++
 src/service.c | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/src/device.c b/src/device.c
index 149c45160..229579378 100644
--- a/src/device.c
+++ b/src/device.c
@@ -2054,6 +2054,9 @@ static DBusMessage *disconnect_profile(DBusConnection *conn, DBusMessage *msg,
 	if (dev->disconnect)
 		return btd_error_in_progress(msg);
 
+	if (btd_service_get_state(service) == BTD_SERVICE_STATE_DISCONNECTED)
+		return dbus_message_new_method_return(msg);
+
 	dev->disconnect = dbus_message_ref(msg);
 
 	err = btd_service_disconnect(service);
@@ -2065,6 +2068,8 @@ static DBusMessage *disconnect_profile(DBusConnection *conn, DBusMessage *msg,
 
 	if (err == -ENOTSUP)
 		return btd_error_not_supported(msg);
+	else if (err == -EALREADY)
+		return dbus_message_new_method_return(msg);
 
 	return btd_error_failed(msg, strerror(-err));
 }
diff --git a/src/service.c b/src/service.c
index c14ee0aca..e4d747a6e 100644
--- a/src/service.c
+++ b/src/service.c
@@ -281,8 +281,9 @@ int btd_service_disconnect(struct btd_service *service)
 	case BTD_SERVICE_STATE_UNAVAILABLE:
 		return -EINVAL;
 	case BTD_SERVICE_STATE_DISCONNECTED:
-	case BTD_SERVICE_STATE_DISCONNECTING:
 		return -EALREADY;
+	case BTD_SERVICE_STATE_DISCONNECTING:
+		return 0;
 	case BTD_SERVICE_STATE_CONNECTING:
 	case BTD_SERVICE_STATE_CONNECTED:
 		break;
-- 
2.20.1

