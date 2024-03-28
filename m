Return-Path: <linux-bluetooth+bounces-2813-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8E288D5E8
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Mar 2024 06:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2D7129FF8D
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Mar 2024 05:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AC8125C9;
	Wed, 27 Mar 2024 05:37:47 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 7D451171AB
	for <linux-bluetooth@vger.kernel.org>; Wed, 27 Mar 2024 05:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711517867; cv=none; b=dKk1Mq6a711smx2TbzKNYhtDqFeG16F1lKgtGF6uTp4y+CQJa6MY+4a/wloxILvHXa0lTL3OSacc5X/Qks8FwxJK32sTpvp4zjyk88/AscwMAH5ueQVpXX9oawFxWo5uK35EjHmjqyeBV2KdO06KrZwzXGvCQiXcpS/IaAnUeRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711517867; c=relaxed/simple;
	bh=gtm8BGORa9SgzNXPmiKv0BKdinWaLzMbYu6W/Z+O5WM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=P9iUP99AhLwUK+RMU8b+p9pjWRBECCAmj6UJJhYILITYETThFLGpHtbGkakUCK4ElvxzSA8tohyHhdFQ19w6FM3VGx6DvZk4JXuKhew2JJqMMOCxWAWTOhe3TlwkHxn1dQl/wLq2/NXHtvbF/C3Acds2+ki5M3rpzk3mKFdXt7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [103.163.180.46])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 0A5556048941B;
	Wed, 27 Mar 2024 13:37:21 +0800 (CST)
X-MD-Sfrom: youwan@nfschina.com
X-MD-SrcIP: 103.163.180.46
From: Youwan Wang <youwan@nfschina.com>
To: linux-bluetooth@vger.kernel.org
Cc: Youwan Wang <youwan@nfschina.com>
Subject: [BlueZ,v1] obexd: Fix "Size" use g_dbus_emit_property_changed_full() to emit
Date: Wed, 27 Mar 2024 13:37:12 +0800
Message-Id: <20240327053712.578023-1-youwan@nfschina.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the comment for g_dbus_emit_property_changed()
/*
 * Note that when multiple properties for a given object path are changed
 * in the same mainloop iteration, they will be grouped with the last
 * property changed. If this behaviour is undesired, use
 * g_dbus_emit_property_changed_full() with the
 * G_DBUS_PROPERTY_CHANGED_FLAG_FLUSH flag, causing the signal to ignore
 * any grouping.
 */

When receiving a "small file" through Bluetooth, When using Blueman to
transfer files to the configured directory, "small files" in the cache
will not be moved to the configured directory. Debugging found that the
three properties "Size" "Transferred" and "complete" were reported at once
through the g_dbus_emit_property_changed function, but the "Size" property
did not have a value, it appears that there are the following errors
"UnicodeDecodeError: 'utf-8' codec can't decode byte 0xb5 in position 0:
invalid start byte" in Blueman log.
So let the "Size" property use g_dbus_emit_property_changed_full to
single emit, if use g_dbus_emit_property_changed（grouped）to emit,
there is a possibility that "Size" property value has been freed

The following is the issue log

dbus-monitor log:

signal time=1710900297.140618 sender=:1.50 -> destination=(null)
serial=59 path=/org/bluez/obex/server/session4/transfer3;
interface=org.freedesktop.DBus.Properties; member=PropertiesChanged

   string "org.bluez.obex.Transfer1"
   array [
      dict entry(
         string "Status"
         variant             string "complete"
      )
      dict entry(
         string "Transferred"
         variant             uint64 0
      )
   ]
   array [
      string "Size"
   ]
method call time=1710900297.141361 sender=:1.39 -> destination=:1.50
serial=417 path=/org/bluez/obex/server/session4/transfer3;
 interface=org.freedesktop.DBus.Properties; member=Get

   string "org.bluez.obex.Transfer1"
   string "Size"
error time=1710900297.141596 sender=:1.50 -> destination=:1.39
error_name=org.freedesktop.DBus.Error.InvalidArgs reply_serial=417

   string "No such property 'Size'"

blueman log

blueman.desktop[2368]: blueman-applet 09.42.04 DEBUG
Transfer:25 do_g_properties_changed: /org/bluez/obex/server/session2/
transfer1 Transferred 0
blueman.desktop[2368]: blueman-applet 09.42.04 DEBUG
Base:74 do_g_properties_changed: /org/bluez/obex/server/session2
{'Source': 'xxx', 'Destination': 'xxx', 'Root': 'xxx/.cache/obexd'}
blueman.desktop[2368]: blueman-applet 09.42.04 ERROR
TransferService:97 _authorize_push: Failed to get StatusIcon
blueman.desktop[2368]: blueman-applet 09.42.15 INFO
Notification:239 do_g_signal: accept
blueman.desktop[2368]: blueman-applet 09.42.15 INFO
TransferService:57 on_action : Action accept
blueman.desktop[2368]: blueman-applet 09.42.15 INFO
Notification:239 do_g_signal: 3
blueman.desktop[2368]: blueman-applet 09.42.15 DEBUG
Notification:247 do_g_signal: The notification was closed by a call
to CloseNotification.
blueman.desktop[2368]:UnicodeDecodeError: 'utf-8' codec can't decode byte
0xb5 in position 0: invalid start byte
blueman.desktop[2368]: blueman-applet 09.42.15 INFO
Manager:73 _on_object_removed: /org/bluez/obex/server/session2/transfer1
blueman.desktop[2368]: blueman-applet 09.42.15 INFO
Manager:80 _on_object_removed: /org/bluez/obex/server/session2

After fix, The following log

dbus-monitor log:

signal time=1711000976.672383 sender=:1.724 -> destination=(null)
serial=18 path=/org/bluez/obex/server/session1/transfer0;
interface=org.freedesktop.DBus.Properties; member=PropertiesChanged

   string "org.bluez.obex.Transfer1"
   array [
      dict entry(
         string "Size"
         variant             uint64 50
      )
   ]
   array [
   ]
signal time=1711000976.672483 sender=:1.724 -> destination=(null)
serial=19 path=/org/bluez/obex/server/session1/transfer0;
interface=org.freedesktop.DBus.Properties; member=PropertiesChanged

   string "org.bluez.obex.Transfer1"
   array [
      dict entry(
         string "Status"
         variant             string "complete"
      )
      dict entry(
         string "Transferred"
         variant             uint64 0
      )
   ]
   array [
   ]

blueman log

blueman.desktop[2368]: blueman-applet 14.13.29 DEBUG
Transfer:25 do_g_properties_changed: /org/bluez/obex/server/session2/
transfer1 Transferred 0
blueman.desktop[2368]: blueman-applet 14.13.29 DEBUG
Base:74 do_g_properties_changed: /org/bluez/obex/server/session2
{'Source': 'xxx', 'Destination': 'xxx', 'Root': 'xxx'}
blueman.desktop[2368]: blueman-applet 14.13.29 ERROR
TransferService:97 _authorize_push: Failed to get StatusIcon
blueman.desktop[2368]: blueman-applet 14.13.36 INFO
Notification:239 do_g_signal: accept
blueman.desktop[2368]: blueman-applet 14.13.36 INFO
TransferService:57 on_action : Action accept
blueman.desktop[2368]: blueman-applet 14.13.36 INFO
Notification:239 do_g_signal: 3
blueman.desktop[2368]: blueman-applet 14.13.36 DEBUG
Notification:247 do_g_signal: The notification was closed by a call to
CloseNotification.
blueman.desktop[2368]: blueman-applet 14.13.36 DEBUG
Transfer:25 do_g_properties_changed: /org/bluez/obex/server/session2/
transfer1 Size 50
blueman.desktop[2368]: blueman-applet 14.13.36 DEBUG
Transfer:25 do_g_properties_changed: /org/bluez/obex/server/session2/
transfer1 Status complete
blueman.desktop[2368]: blueman-applet 14.13.36 INFO
Manager:86 _on_transfer_completed: /org/bluez/obex/server/session2/
transfer1 True
blueman.desktop[2368]: blueman-applet 14.13.36 INFO
TransferService:275 _on_transfer_completed: Destination file exists,
renaming to: xxx.txt
blueman.desktop[2368]: blueman-applet 14.13.36 ERROR
TransferService:256 _notify_kwargs: No statusicon found
blueman.desktop[2368]: blueman-applet 14.13.36 INFO
TransferService:241 _add_open : adding action
blueman.desktop[2368]: blueman-applet 14.13.36 DEBUG
Transfer:25 do_g_properties_changed: /org/bluez/obex/server/session2/
transfer1 Transferred 0
blueman.desktop[2368]: blueman-applet 14.13.36 INFO
Manager:73 _on_object_removed: /org/bluez/obex/server/session2/transfer1
blueman.desktop[2368]: blueman-applet 14.13.36 INFO
Manager:80 _on_object_removed: /org/bluez/obex/server/session2

Signed-off-by: Youwan Wang <youwan@nfschina.com>
---
 obexd/src/manager.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/obexd/src/manager.c b/obexd/src/manager.c
index c393911a7..3c0c2a7cc 100644
--- a/obexd/src/manager.c
+++ b/obexd/src/manager.c
@@ -528,8 +528,13 @@ void manager_emit_transfer_property(struct obex_transfer *transfer,
 	if (transfer->path == NULL)
 		return;
 
-	g_dbus_emit_property_changed(connection, transfer->path,
-					TRANSFER_INTERFACE, name);
+	if (strcasecmp("Size", name) == 0)
+		g_dbus_emit_property_changed_full(connection, transfer->path,
+					TRANSFER_INTERFACE, name,
+					G_DBUS_PROPERTY_CHANGED_FLAG_FLUSH);
+	else
+		g_dbus_emit_property_changed(connection, transfer->path,
+						TRANSFER_INTERFACE, name);
 }
 
 void manager_emit_transfer_started(struct obex_transfer *transfer)
-- 
2.25.1


