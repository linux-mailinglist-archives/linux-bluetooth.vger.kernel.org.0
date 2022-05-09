Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA6651FDB3
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 May 2022 15:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235303AbiEINRa (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 9 May 2022 09:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234316AbiEINR3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 9 May 2022 09:17:29 -0400
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB0081B1F60
        for <linux-bluetooth@vger.kernel.org>; Mon,  9 May 2022 06:13:34 -0700 (PDT)
X-QQ-mid: bizesmtp78t1652102006tia3f2ix
Received: from localhost.localdomain ( [113.57.152.160])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Mon, 09 May 2022 21:12:52 +0800 (CST)
X-QQ-SSF: 00400000002000B0D000B00A0000000
X-QQ-FEAT: RKCwGdK8Yficw090mszTO6r6yITclOhvVTCgkfv5o6awD7CH0w4w7wTGBbb+v
        yEEbdom/jfdkkiOow505z0xD2ACkcERpku6bWRVHKfwgsKkqJG4YRtexmaWzVwqCaF1Rlrs
        Spi2pqrg5WSJk1FZ07L0PH8sEUGxuX89l7RllEhej6YzlXwJBKjZixpkGX4w47K9pqXIaiD
        rYdawYduxUA6Z+75WJP8svqnbSceTEnZaz52pUdUo6yaBpXKcl5SgbQ8wnfbFHkR04l45tf
        JHE2nEDcCE0J0RFWErbX+xZBBCgzxOYiUBO7KKzSI5GVHkxKlPp+DXxG/1NIL3YB/LnyLB9
        zSnazwJ
X-QQ-GoodBg: 2
From:   wangyouwan <wangyouwan@uniontech.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     wangyouwan <wangyouwan@uniontech.com>
Subject: [PATCH] =?UTF-8?q?device:=20Fix=20the=20problem=20that=20pairing?= =?UTF-8?q?=20has=20failed=20due=20to=20the=20error=20of=E3=80=80Already?= =?UTF-8?q?=20Paired=20(0x13)?=
Date:   Mon,  9 May 2022 21:12:39 +0800
Message-Id: <20220509131239.12189-1-wangyouwan@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign9
X-QQ-Bgrelay: 1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

After connect the Bluetooth mouse, open two Bluetoothctl at the same time,
when remove the mouse, quickly go to power off,
try to paired the mouse again when I was power on,
found that the error 0x13 was always reported.
try to connect directly,can connect successfully.
but use the info command to query the information of the mouse
and find that the pairing status of the mouse is No.
so I try to delete the paired information in the kernel
through the "* cancel_pairing()" interface.

Signed-off-by: wangyouwan <wangyouwan@uniontech.com>
---
 src/device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/src/device.c b/src/device.c
index 6da5c380b..cd150ec3e 100644
--- a/src/device.c
+++ b/src/device.c
@@ -3107,7 +3107,12 @@ static DBusMessage *cancel_pairing(DBusConnection *conn, DBusMessage *msg,
 	DBG("");
 
 	if (!req)
+	{
+		btd_adapter_remove_bonding(device->adapter, &device->bdaddr,
+						device->bdaddr_type);
+
 		return btd_error_does_not_exist(msg);
+	}
 
 	device_cancel_bonding(device, MGMT_STATUS_CANCELLED);
 
-- 
2.20.1



