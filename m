Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 064B17518A6
	for <lists+linux-bluetooth@lfdr.de>; Thu, 13 Jul 2023 08:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233770AbjGMGMC (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 13 Jul 2023 02:12:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233014AbjGMGMB (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 13 Jul 2023 02:12:01 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918EA1980;
        Wed, 12 Jul 2023 23:11:59 -0700 (PDT)
X-UUID: 296a8398214411eeb20a276fd37b9834-20230713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=HSDOINx/Sn+NIa1MmmE5ByGnQg5Uyj5+1bhbNXL8Rno=;
        b=rlME+XFhRmMrPW/wLQ0oZj+uhrpMB4r8RJdDLOGpZxo1b2qyOco4tnRYqEXjtVLj8GM8ZHmj5zT+VwoVDghhKXZ5uWUYaI1OPOzNpUPBAZnMiannj6SOUveI8ZFYsVQ8zSQtyed3tyuHI+cJCV3evKjpIPG50gxBe6QfLwWQ3tE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:1623c677-8a17-408b-9e45-e79646facf68,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:176cd25,CLOUDID:e0a12e0e-c22b-45ab-8a43-3004e9216b56,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
        NO,DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 296a8398214411eeb20a276fd37b9834-20230713
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
        (envelope-from <chris.lu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 470992365; Thu, 13 Jul 2023 14:11:53 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 13 Jul 2023 14:11:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 13 Jul 2023 14:11:51 +0800
From:   Chris Lu <chris.lu@mediatek.com>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Von Dentz <luiz.dentz@gmail.com>
CC:     Sean Wang <sean.wang@mediatek.com>,
        Aaron Hou <aaron.hou@mediatek.com>,
        Steve Lee <steve.lee@mediatek.com>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v5] Bluetooth: btmtk: Fix kernel crash when processing coredump
Date:   Thu, 13 Jul 2023 14:11:12 +0800
Message-ID: <20230713061111.25232-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

There may be a potential kernel crash risk if 'skb->len - MTK_COREDUMP_END_LEN'
value is less than 0 when doing memcmp in btmtk_process_coredump().
Check the value is valid before doing memcmp.

[  215.021695] Unable to handle kernel paging request at virtual address ffffff939fffd3c5
[  215.021781] Mem abort info:
[  215.021805]   ESR = 0x96000005
[  215.021833]   EC = 0x25: DABT (current EL), IL = 32 bits
[  215.021861]   SET = 0, FnV = 0
[  215.021875]   EA = 0, S1PTW = 0
[  215.021886] Data abort info:
[  215.021899]   ISV = 0, ISS = 0x00000005
[  215.021912]   CM = 0, WnR = 0
[  215.021929] swapper pgtable: 4k pages, 39-bit VAs, pgdp=00000000410de000
[  215.021943] [ffffff939fffd3c5] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
[  215.021979] Internal error: Oops: 96000005 [#1] PREEMPT SMP
[  215.022496] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.10.186 #3 (HASH:ad23 4)
[  215.022511] Hardware name: MediaTek Tomato board (DT)
[  215.022530] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO BTYPE=--)
[  215.022556] pc : __pi_memcmp+0xd0/0x1b8
[  215.022579] lr : btmtk_process_coredump+0xb0/0x5f8 [btmtk]
[  215.022593] sp : ffffffc010003d40
[  215.022607] x29: ffffffc010003d40 x28: 0000000000000006
[  215.022633] x27: ffffffda696350c0 x26: 0000000000000002
[  215.022659] x25: 00000000000003ff x24: ffffff9360cca804
[  215.022685] x23: 0000000000000000 x22: ffffff9365638500
[  215.022710] x21: ffffff9365638700 x20: 0000000000000000
[  215.022736] x19: ffffff936002e000 x18: 0000000000000000
[  215.022761] x17: 0000000000000180 x16: ffffffda6881b8b4
[  215.022787] x15: 0000000000000001 x14: 0000000000002d00
[  215.022812] x13: 0000000000060000 x12: 0000000000000181
[  215.022837] x11: 0000000000000006 x10: fffffffffffffffd
[  215.022862] x9 : 0000000000000006 x8 : 0000000000000003
[  215.022887] x7 : 0000000000000000 x6 : 0000000000000000
[  215.022913] x5 : ffffff93656387b8 x4 : 0000000000000000
[  215.022938] x3 : ffffffc010003c18 x2 : 0000000000000006
[  215.022963] x1 : ffffffda09d4124a x0 : ffffff939fffd3c5
[  215.022989] Call trace:
[  215.023012]  __pi_memcmp+0xd0/0x1b8
[  215.023053]  btusb_recv_acl_mtk+0x64/0x90 [btusb (HASH:dc6b 5)]
[  215.023087]  btusb_recv_bulk+0x118/0x170 [btusb (HASH:dc6b 5)]
[  215.023121]  btusb_bulk_complete+0x8c/0x148 [btusb (HASH:dc6b 5)]
[  215.023144]  __usb_hcd_giveback_urb+0xbc/0x148
[  215.023164]  usb_giveback_urb_bh+0xb4/0x190
[  215.023184]  tasklet_action_common+0x98/0x1a0
[  215.023201]  tasklet_action+0x2c/0x38
[  215.023220]  __do_softirq+0xe0/0x38c
[  215.023241]  invoke_softirq+0x34/0x6c
[  215.023258]  irq_exit+0x6c/0xb0
[  215.023279]  __handle_domain_irq+0x98/0xd4
[  215.023296]  gic_handle_irq+0x5c/0x11c
[  215.023313]  el1_irq+0xd0/0x180
[  215.023332]  cpuidle_enter_state+0xac/0x338
[  215.023349]  cpuidle_enter+0x40/0x70
[  215.023366]  do_idle+0x150/0x278
[  215.023384]  cpu_startup_entry+0x2c/0x58
[  215.023401]  rest_init+0xdc/0xec
[  215.023419]  arch_call_rest_init+0x18/0x24
[  215.023435]  start_kernel+0x334/0x400
[  215.023460] Code: 91002129 eb09010a 9a89810b cb0b0042 (38401403)
[  215.023478] ---[ end trace 28668fd20c7a90cd ]

Fixes: 2822cd0173ad ("Bluetooth: btusb: mediatek: add MediaTek devcoredump support")
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 12 ++++++------
 drivers/bluetooth/btmtk.h |  1 +
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 786f775196ae..aaabb732082c 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -395,12 +395,12 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
 
 		/* Mediatek coredump data would be more than MTK_COREDUMP_NUM */
 		if (data->cd_info.cnt > MTK_COREDUMP_NUM &&
-		    skb->len > sizeof(MTK_COREDUMP_END) &&
-		    !memcmp((char *)&skb->data[skb->len - sizeof(MTK_COREDUMP_END)],
-			    MTK_COREDUMP_END, sizeof(MTK_COREDUMP_END) - 1)) {
-			bt_dev_info(hdev, "Mediatek coredump end");
-			hci_devcd_complete(hdev);
-		}
+		    skb->len > MTK_COREDUMP_END_LEN)
+			if (!memcmp((char *)&skb->data[skb->len - MTK_COREDUMP_END_LEN],
+				    MTK_COREDUMP_END, MTK_COREDUMP_END_LEN - 1)) {
+				bt_dev_info(hdev, "Mediatek coredump end");
+				hci_devcd_complete(hdev);
+			}
 
 		break;
 	}
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 68309dfe076a..56f5502baadf 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -24,6 +24,7 @@
 
 #define MTK_COREDUMP_SIZE		(1024 * 1000)
 #define MTK_COREDUMP_END		"coredump end"
+#define MTK_COREDUMP_END_LEN		(sizeof(MTK_COREDUMP_END))
 #define MTK_COREDUMP_NUM		255
 
 enum {
-- 
2.18.0

