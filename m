Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E922F783DC9
	for <lists+linux-bluetooth@lfdr.de>; Tue, 22 Aug 2023 12:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233252AbjHVKUo (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 22 Aug 2023 06:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233922AbjHVKUn (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 22 Aug 2023 06:20:43 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FDE2CE3
        for <linux-bluetooth@vger.kernel.org>; Tue, 22 Aug 2023 03:20:36 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D77A720004
        for <linux-bluetooth@vger.kernel.org>; Tue, 22 Aug 2023 10:20:34 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH] Bluetooth: btusb: Fix quirks table naming
Date:   Tue, 22 Aug 2023 12:20:24 +0200
Message-ID: <20230822102033.1169580-1-hadess@hadess.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The quirks table was named "blacklist_table" which isn't a good
description for that table as devices detected using it weren't ignored
by the driver.

Rename the table to match what it actually does.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/bluetooth/btusb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 764d176e9735..a1be66ef175c 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -175,7 +175,7 @@ static const struct usb_device_id btusb_table[] = {
 
 MODULE_DEVICE_TABLE(usb, btusb_table);
 
-static const struct usb_device_id blacklist_table[] = {
+static const struct usb_device_id quirks_table[] = {
 	/* CSR BlueCore devices */
 	{ USB_DEVICE(0x0a12, 0x0001), .driver_info = BTUSB_CSR },
 
@@ -4113,7 +4113,7 @@ static int btusb_probe(struct usb_interface *intf,
 	if (!id->driver_info) {
 		const struct usb_device_id *match;
 
-		match = usb_match_id(intf, blacklist_table);
+		match = usb_match_id(intf, quirks_table);
 		if (match)
 			id = match;
 	}
-- 
2.41.0

