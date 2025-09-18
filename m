Return-Path: <linux-bluetooth+bounces-14459-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD344B1BEB5
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 Aug 2025 04:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DFCF18A4DD2
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 Aug 2025 02:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA71219E975;
	Wed,  6 Aug 2025 02:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qtmlabs.xyz header.i=@qtmlabs.xyz header.b="mMra1WQL"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from s1.g1.infrastructure.qtmlabs.xyz (s1.g1.infrastructure.qtmlabs.xyz [107.172.1.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB37C2AD32
	for <linux-bluetooth@vger.kernel.org>; Wed,  6 Aug 2025 02:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=107.172.1.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754446974; cv=none; b=kXxwWj56kfQzVu+klc7mqE5cVgcrTKJJ0/NoRw3HPT245LBlpN5/VtwOUO+7x4ljPNHvMxPnYoUDdgaSQQUR5bO4fg8hJZuqIa0Rs62tztYd65jUhVzLHTQmKwjVOAEgtaAPQlZbj0osAUaOOdydjeVfjo9Kje+pXthNRDgNdyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754446974; c=relaxed/simple;
	bh=SL9F0RwB1J1SalCW/YAf1wy2LLfxgbysm1t3rCTZMoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tHW8vc4z6674lEF5sp32aRlIJhjYeOAPmCOWXc7/bPjG/VyC1911h+zEc8wGadMmuwRGkzEL1rZJLgRkWeCbmskK10goU9TH7AmAjaLE66b+kUZ7mp8a0+gfC6KrqzsTiUGD1wgW4q/iXFs9oOfOHxlaMkrkfgmarxehS1F75ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qtmlabs.xyz; spf=pass smtp.mailfrom=qtmlabs.xyz; dkim=pass (2048-bit key) header.d=qtmlabs.xyz header.i=@qtmlabs.xyz header.b=mMra1WQL; arc=none smtp.client-ip=107.172.1.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qtmlabs.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qtmlabs.xyz
From: Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qtmlabs.xyz; s=dkim;
	t=1754446971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=455dEShP6QASV+lOsNBmYqkUrbWS/7PwvY3+RlT7Eg4=;
	b=mMra1WQLJiiRF+lZl2+s6MjWJQbBJ3jo1PAYMqi4YRnvvdlOnmLliAuAOJPLbjxkP4XqwK
	hDNc0/c1nz7C/3dWDMticPeV8dn5XUuFw+y0QpdGM/rGqoudAR3NMERkHpGHiTafrfcdmP
	E+vm+g657cgmfssCfkMlSR2Z2z6jJRGB6bZDZPyCmF4XJ/ff+2Y1CQmqreUyxeqbYtLj9E
	eLm3NVaeQNLntqcH8QRqjy9wAJ3bF/GAIECxCpHhgVYHboUI8uv/xlzCkJn+q4dyGQylGh
	JAt958XMwkxTThFbNx52VWW2gAKoFjinqYpxmErR1d7kLA96FoK63fKUk+Iq8A==
Authentication-Results: s1.g1.infrastructure.qtmlabs.xyz;
	auth=pass smtp.mailfrom=myrrhperiwinkle@qtmlabs.xyz
Date: Wed, 06 Aug 2025 09:22:46 +0700
Subject: [PATCH bluez v4 1/2] audio: Don't initialize media transport
 volume from media player
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250806-audio-no-reuse-media-player-volume-v4-1-a59d9a4848c1@qtmlabs.xyz>
References: <20250806-audio-no-reuse-media-player-volume-v4-0-a59d9a4848c1@qtmlabs.xyz>
In-Reply-To: <20250806-audio-no-reuse-media-player-volume-v4-0-a59d9a4848c1@qtmlabs.xyz>
To: Linux Bluetooth <linux-bluetooth@vger.kernel.org>
Cc: Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Spamd-Bar: -------

Media player objects may be shared between devices. As a result,
a device without support for hardware volume that is connected after one
that does may end up being erroneously considered hardware
volume-capable.

fa7828bdd ("transport: Fix not being able to initialize volume properly")
introduced btd_device_{get,set}_volume that is used as an alternative in
case no media player objects are present. Therefore, we can remove
media_player_get_device_volume and instead use btd_device_get_volume to
determine the initial volume.
---
 profiles/audio/avrcp.c |  2 +-
 profiles/audio/media.c | 33 +--------------------------------
 profiles/audio/media.h |  1 -
 3 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
index e2797112fcd580c3fc56793f933e00b1c61e5205..ec07522e6a34eb1dc5f6f413f48f1087a609df9a 100644
--- a/profiles/audio/avrcp.c
+++ b/profiles/audio/avrcp.c
@@ -4284,7 +4284,7 @@ static void target_init(struct avrcp *session)
 		target->player = player;
 		player->sessions = g_slist_prepend(player->sessions, session);
 
-		init_volume = media_player_get_device_volume(session->dev);
+		init_volume = btd_device_get_volume(session->dev);
 		media_transport_update_device_volume(session->dev, init_volume);
 	}
 
diff --git a/profiles/audio/media.c b/profiles/audio/media.c
index 8e62dca17070edbc5101677c6eebd3707492c824..55f1482d1d9ce52e104481bab3ede373f47aee0c 100644
--- a/profiles/audio/media.c
+++ b/profiles/audio/media.c
@@ -499,37 +499,6 @@ struct a2dp_config_data {
 	a2dp_endpoint_config_t cb;
 };
 
-int8_t media_player_get_device_volume(struct btd_device *device)
-{
-#ifdef HAVE_AVRCP
-	struct avrcp_player *target_player;
-	struct media_adapter *adapter;
-	GSList *l;
-
-	if (!device)
-		return -1;
-
-	target_player = avrcp_get_target_player_by_device(device);
-	if (!target_player)
-		goto done;
-
-	adapter = find_adapter(device);
-	if (!adapter)
-		goto done;
-
-	for (l = adapter->players; l; l = l->next) {
-		struct media_player *mp = l->data;
-
-		if (mp->player == target_player)
-			return mp->volume;
-	}
-
-done:
-#endif /* HAVE_AVRCP */
-	/* If media_player doesn't exists use device_volume */
-	return btd_device_get_volume(device);
-}
-
 static gboolean set_configuration(struct media_endpoint *endpoint,
 					uint8_t *configuration, size_t size,
 					media_endpoint_cb_t cb,
@@ -556,7 +525,7 @@ static gboolean set_configuration(struct media_endpoint *endpoint,
 	if (transport == NULL)
 		return FALSE;
 
-	init_volume = media_player_get_device_volume(device);
+	init_volume = btd_device_get_volume(device);
 	media_transport_update_volume(transport, init_volume);
 
 	msg = dbus_message_new_method_call(endpoint->sender, endpoint->path,
diff --git a/profiles/audio/media.h b/profiles/audio/media.h
index 2b2e8e1572874d5f71abb28fdd5b92fa2d9efe83..d3954abd6de505a69cab3fcffc217d236a52d3e5 100644
--- a/profiles/audio/media.h
+++ b/profiles/audio/media.h
@@ -23,6 +23,5 @@ uint8_t media_endpoint_get_codec(struct media_endpoint *endpoint);
 struct btd_adapter *media_endpoint_get_btd_adapter(
 					struct media_endpoint *endpoint);
 bool media_endpoint_is_broadcast(struct media_endpoint *endpoint);
-int8_t media_player_get_device_volume(struct btd_device *device);
 
 const struct media_endpoint *media_endpoint_get_asha(void);

-- 
2.50.1


