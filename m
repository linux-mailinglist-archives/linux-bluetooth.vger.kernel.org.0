Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC47DFC968
	for <lists+linux-bluetooth@lfdr.de>; Thu, 14 Nov 2019 16:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfKNPBW (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 14 Nov 2019 10:01:22 -0500
Received: from mx2.suse.de ([195.135.220.15]:36532 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726263AbfKNPBW (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 14 Nov 2019 10:01:22 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 934BBB031;
        Thu, 14 Nov 2019 15:01:20 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     ytkim@qca.qualcomm.com, marcel@holtmann.org,
        johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] btusb: fix PM leak in error case of setup
Date:   Thu, 14 Nov 2019 16:01:18 +0100
Message-Id: <20191114150118.5237-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

If setup() fails a reference for runtime PM has already
been taken. Proper use of the error handling in btusb_open()is needed.
You cannot just return.

Fixes: ace31982585a3 ("Bluetooth: btusb: Add setup callback for chip
init on USB")
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/bluetooth/btusb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index a9c35ebb30f8..0b5e4c135f78 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -1200,7 +1200,7 @@ static int btusb_open(struct hci_dev *hdev)
 	if (data->setup_on_usb) {
 		err = data->setup_on_usb(hdev);
 		if (err < 0)
-			return err;
+			goto setup_fail;
 	}
 
 	data->intf->needs_remote_wakeup = 1;
@@ -1239,6 +1239,7 @@ static int btusb_open(struct hci_dev *hdev)
 
 failed:
 	clear_bit(BTUSB_INTR_RUNNING, &data->flags);
+setup_fail:
 	usb_autopm_put_interface(data->intf);
 	return err;
 }
-- 
2.16.4

