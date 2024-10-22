Return-Path: <linux-bluetooth+bounces-8084-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 267739AB075
	for <lists+linux-bluetooth@lfdr.de>; Tue, 22 Oct 2024 16:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93BF4B21ED3
	for <lists+linux-bluetooth@lfdr.de>; Tue, 22 Oct 2024 14:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644451A01DD;
	Tue, 22 Oct 2024 14:11:23 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722C919F471
	for <linux-bluetooth@vger.kernel.org>; Tue, 22 Oct 2024 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729606283; cv=none; b=f6h0jO/e4h3qwAjUmFo/7a8VlzImRSe6bS082WJJMI8kvzVgdABlEaMj3teLwv69rIKScns7beDjAs5+B57VRkXH+HN7oAjPuYvqEqEivRL18gnx+bwU6AL1384rXZmdal0KIgx1fY7io6307z7ooMoJjnBlDI0F+SAUugAHGY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729606283; c=relaxed/simple;
	bh=wWA/M+qQ+CdbyhZDTYQSa/woqJEvSmt7Is5V992jisg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i70VFFUaXdcGJIiYstAyGNlNBCJdVFkire4bMn7NKVav3NgQVVI08wh9th9z9i7JOj3x70Rve+ToOBOxfxtZUetJKQurtWVrSWlu9ZqqB3/flV6kF9zL/Yjj0JllvMi26sGliW7pOlihm1KEccmoSuGBFvtkEFQVS1diqMXk/Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2ED0240008;
	Tue, 22 Oct 2024 14:11:19 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Cc: Bastien Nocera <hadess@hadess.net>
Subject: [BlueZ v3 4/7] client: Install submenus before contacting bluez daemon
Date: Tue, 22 Oct 2024 16:10:35 +0200
Message-ID: <20241022141118.150143-5-hadess@hadess.net>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241022141118.150143-1-hadess@hadess.net>
References: <20241022141118.150143-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net

So that the submenus are installed even if bluez isn't available.
---
 client/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/client/main.c b/client/main.c
index 17af62000f6d..f60bef1a6d3a 100644
--- a/client/main.c
+++ b/client/main.c
@@ -3187,6 +3187,10 @@ int main(int argc, char *argv[])
 	bt_shell_add_submenu(&advertise_monitor_menu);
 	bt_shell_add_submenu(&scan_menu);
 	bt_shell_add_submenu(&gatt_menu);
+	admin_add_submenu();
+	player_add_submenu();
+	mgmt_add_submenu();
+	assistant_add_submenu();
 	bt_shell_set_prompt(PROMPT_OFF, NULL);
 
 	if (agent_option)
@@ -3203,13 +3207,9 @@ int main(int argc, char *argv[])
 		bt_shell_set_env("AUTO_REGISTER_ENDPOINT",
 					(void *)endpoint_option);
 
-	admin_add_submenu();
 	admin_enable_submenu();
-	player_add_submenu();
 	player_enable_submenu();
-	mgmt_add_submenu();
 	mgmt_enable_submenu();
-	assistant_add_submenu();
 	assistant_enable_submenu();
 
 	client = g_dbus_client_new(dbus_conn, "org.bluez", "/org/bluez");
-- 
2.47.0


