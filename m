Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8EAC573890
	for <lists+linux-bluetooth@lfdr.de>; Wed, 13 Jul 2022 16:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235627AbiGMOSM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 13 Jul 2022 10:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbiGMOSL (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 13 Jul 2022 10:18:11 -0400
X-Greylist: delayed 668 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 13 Jul 2022 07:18:08 PDT
Received: from erc.thregr.org (erc.thregr.org [IPv6:2001:41c9:1:41f::63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0BA9255B5
        for <linux-bluetooth@vger.kernel.org>; Wed, 13 Jul 2022 07:18:08 -0700 (PDT)
Received: from [37.162.93.81] (helo=localhost)
        by erc.thregr.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        id 1oBd15-003L3L-2g (envelope-from <wavexx@thregr.org>);
        Wed, 13 Jul 2022 16:07:04 +0200
From:   Yuri D'Elia <wavexx@thregr.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Yuri D'Elia <wavexx@thregr.org>
Subject: [PATCH] Bluetooth: btusb: Set HCI_QUIRK_BROKEN_ENHANCED_SETUP_SYNC_CONN for MTK
Date:   Wed, 13 Jul 2022 16:06:31 +0200
Message-Id: <20220713140631.79775-1-wavexx@thregr.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This sets HCI_QUIRK_BROKEN_ENHANCED_SETUP_SYNC_CONN for MTK controllers
since SCO appear to not work when using HCI_OP_ENHANCED_SETUP_SYNC_CONN.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=215576
---
 drivers/bluetooth/btusb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index e25fcd49db..d5da862fab 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3795,6 +3795,7 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->manufacturer = 70;
 		hdev->cmd_timeout = btusb_mtk_cmd_timeout;
 		hdev->set_bdaddr = btmtk_set_bdaddr;
+		set_bit(HCI_QUIRK_BROKEN_ENHANCED_SETUP_SYNC_CONN, &hdev->quirks);
 		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
 		data->recv_acl = btusb_recv_acl_mtk;
 	}
-- 
2.36.1

