Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10E532B9D11
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Nov 2020 22:45:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbgKSVno (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 19 Nov 2020 16:43:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgKSVnn (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 19 Nov 2020 16:43:43 -0500
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C30CC0613CF
        for <linux-bluetooth@vger.kernel.org>; Thu, 19 Nov 2020 13:43:42 -0800 (PST)
Received: by mail-pl1-x64a.google.com with SMTP id n10so4783799plk.14
        for <linux-bluetooth@vger.kernel.org>; Thu, 19 Nov 2020 13:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=MP+147hIF5+adw6+zJKHqKFG85P2AAI1VMVHbymWYnI=;
        b=liYEDK+uv1Ff3wcpJuOYyFui3L7pxR76ULmVh1+0Ndrn3C6e0NI0FdwsDV07YIZxIh
         /vghs0Dl9dVJE0pYm9okxkhai2Ac5289HvjDlZhm+jHor53i/AZ3PDBeDbv5k1S16KOx
         aw82ByRfYCJCcsZpFnsA2mn/t8x7PiPN4/XebwJaLrvaTGVROB3QcW7B3VhOI+shECUY
         +8VOlGDyv1cH76z3+SseRNxy+w6jzZi/P4/alf9CEhsrwcEu0VUsY7Zco/8cWDVKQD3g
         fTbcwYFeosS2zqIwd1rZwmlv4QATWCS/794wF8kTC+wgm52O3WrF0IF2tgbvfB+sUPpz
         TIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=MP+147hIF5+adw6+zJKHqKFG85P2AAI1VMVHbymWYnI=;
        b=ksikGvS6Xtkna6plS8jTC8rXL/L/pwWm5LAopID51p7b8BpKwRxcc4SCfrqnt5X2Gu
         c/Wg0vQwjKuSThPXBDjjBfmXlcHkewIGj3BOReSMy+Wx5H8/lpiZdqIqIW4vAT/xQPie
         d5gbO1DBtY/IVTjYGvFcesgnfsQTR2WR2Fot/wgjK2httQBM7NcmLnZkUa+D2XX7uwb8
         lt/nwd3e5dLqXaWWUwGTUYA8KquIIR3sfAjVnr2fEzn1Gyf89L/0wo0XG7SnpUYZFFFE
         mK7YJaAVnetZas3FBAfyth/KB8zCW+w/5jIMKFwSFQV9bcsJXIyL4gW7HkS9CwEf8kgV
         KqXA==
X-Gm-Message-State: AOAM530NHKfMaDP0kKPVjCYVbkLLi7v/drBsNXuOmY5rZnVBlh64iO/h
        F1K6y0QHCSgwtZIfhiMSnRusg+GVY4aYRdIlUoh1IjJf69Uw4j4r+HmC3PI1fN6m7z6oli0C8r8
        piBqEn6ajbgBJVUovb7NsIHsEI2W4Birt5LyApr/17mgsd+y9Pkc6JMLaTWRwghCwVkSavqqwgg
        ==
X-Google-Smtp-Source: ABdhPJy9MN4Jy+u3Ax/blHgYnGr6bZwRuHLKrGM5irA0oo3m9xZTWOqaDGwprOSGuH3Kajz32B0dhYyMJrw=
Sender: "pavelm via sendgmr" <pavelm@pavelm.c.googlers.com>
X-Received: from pavelm.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:67e])
 (user=pavelm job=sendgmr) by 2002:a17:90a:7101:: with SMTP id
 h1mr1761750pjk.26.1605822221458; Thu, 19 Nov 2020 13:43:41 -0800 (PST)
Date:   Thu, 19 Nov 2020 21:43:37 +0000
Message-Id: <20201119214337.3886160-1-pavelm@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH] Fix duplicate free for GATT service includes
From:   Pavel Maltsev <pavelm@google.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Pavel Maltsev <pavelm@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Objects in the service->includes queue are obtained via
dbus_message_iter_get_basic call and according to the
contract for the value is that it is returned by the reference
and should not be freed thus we should make a copy.

This will fix the issue when the GATT service app is disconnected
(reproduced with gatt-service included in bluez), bluetoothd is crashing:

bluetoothd: src/gatt-database.c:gatt_db_service_removed() Local GATT service removed
bluetoothd: src/adapter.c:adapter_service_remove() /org/bluez/hci0
bluetoothd: src/adapter.c:remove_uuid() sending remove uuid command for index 0
bluetoothd: src/sdpd-service.c:remove_record_from_server() Removing record with handle 0x10006
bluetoothd: src/gatt-database.c:proxy_removed_cb() Proxy removed - removing service: /service1
munmap_chunk(): invalid pointer
---
 src/gatt-database.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/src/gatt-database.c b/src/gatt-database.c
index 6694a0174..90cc4bade 100644
--- a/src/gatt-database.c
+++ b/src/gatt-database.c
@@ -1999,6 +1999,7 @@ static bool parse_includes(GDBusProxy *proxy, struct external_service *service)
 	DBusMessageIter iter;
 	DBusMessageIter array;
 	char *obj;
+	char *includes;
 	int type;
 
 	/* Includes property is optional */
@@ -2017,7 +2018,11 @@ static bool parse_includes(GDBusProxy *proxy, struct external_service *service)
 
 		dbus_message_iter_get_basic(&array, &obj);
 
-		if (!queue_push_tail(service->includes, obj)) {
+		includes = g_strdup(obj);
+		if (!includes)
+			return false;
+
+		if (!queue_push_tail(service->includes, includes)) {
 			error("Failed to add Includes path in queue\n");
 			return false;
 		}
-- 
2.29.2.299.gdc1121823c-goog

