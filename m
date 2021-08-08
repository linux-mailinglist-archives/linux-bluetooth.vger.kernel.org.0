Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 571E93E3AD6
	for <lists+linux-bluetooth@lfdr.de>; Sun,  8 Aug 2021 16:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbhHHOgT (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 8 Aug 2021 10:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbhHHOgS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 8 Aug 2021 10:36:18 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646DCC061760
        for <linux-bluetooth@vger.kernel.org>; Sun,  8 Aug 2021 07:35:59 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id CEF6A3E80D;
        Sun,  8 Aug 2021 16:35:57 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Sonny Sasaka <sonnysasaka@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH BlueZ] audio/transport: Only store volume when also emitting DBus prop change
Date:   Sun,  8 Aug 2021 16:35:55 +0200
Message-Id: <20210808143555.100258-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

By setting a2dp->volume early in set_volume() the resulting call to
media_transport_update_volume() when an AVRCP reply is received will
likely see the same volume received (unless the peer rounded it to
another value) and bail on equality, before emitting a DBus property
change.  This results in DBus clients not being made aware of the change
unless the peer is an audio source (that receives a notification about
changed volume, instead of a command to _set_ a new volume), where
set_volume() immediately raises the DBus signal.

This issue is observed when playing back audio to headphones through an
AbsoluteVolume-enabled audio server like PulseAudio, which does not
receive the "Volume" change (while the peer does change volume) when
setting this property externally using ie. dbus-send.
---
 profiles/audio/transport.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/profiles/audio/transport.c b/profiles/audio/transport.c
index 8248014ae..d158fc97a 100644
--- a/profiles/audio/transport.c
+++ b/profiles/audio/transport.c
@@ -659,14 +659,14 @@ static void set_volume(const GDBusPropertyTable *property,
 	if (a2dp->volume == volume)
 		return;
 
-	a2dp->volume = volume;
-
 	notify = transport->source_watch ? true : false;
-	if (notify)
+	if (notify) {
+		a2dp->volume = volume;
 		g_dbus_emit_property_changed(btd_get_dbus_connection(),
 						transport->path,
 						MEDIA_TRANSPORT_INTERFACE,
 						"Volume");
+	}
 
 	avrcp_set_volume(transport->device, volume, notify);
 	return;
-- 
2.32.0

