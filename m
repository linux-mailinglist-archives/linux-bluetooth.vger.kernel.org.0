Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F18B34E122
	for <lists+linux-bluetooth@lfdr.de>; Tue, 30 Mar 2021 08:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhC3GYE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 30 Mar 2021 02:24:04 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:51930 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbhC3GXm (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 30 Mar 2021 02:23:42 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 12U6MtND2002725, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs01.realtek.com.tw[172.21.6.94])
        by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 12U6MtND2002725
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 30 Mar 2021 14:22:56 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 30 Mar 2021 14:22:56 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 30 Mar 2021 14:22:56 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::3e:4af:7c30:e8de]) by
 RTEXMBS04.realtek.com.tw ([fe80::3e:4af:7c30:e8de%6]) with mapi id
 15.01.2106.013; Tue, 30 Mar 2021 14:22:56 +0800
From:   Hilda Wu <hildawu@realtek.com>
To:     "marcel@holtmann.org" <marcel@holtmann.org>
CC:     "johan.hedberg@gmail.com" <johan.hedberg@gmail.com>,
        "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "tientzu@chromium.org" <tientzu@chromium.org>,
        Max Chou <max.chou@realtek.com>,
        "alex_lu@realsil.com.cn" <alex_lu@realsil.com.cn>,
        KidmanLee <kidman@realtek.com>
Subject: RE: [PATCH v2] Bluetooth: hci_h5: btrtl: Add quirk for keep power in suspend/resume
Thread-Topic: [PATCH v2] Bluetooth: hci_h5: btrtl: Add quirk for keep power in
 suspend/resume
Thread-Index: AQHXGkweeRHfSZQtYkSuBseYvZFeA6qcEeag
Date:   Tue, 30 Mar 2021 06:22:56 +0000
Message-ID: <5ff14b573c134c3aa6f254c07df0116e@realtek.com>
References: <20210316100657.16499-1-hildawu@realtek.com>
In-Reply-To: <20210316100657.16499-1-hildawu@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.132.158]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Maintainers,

About this commit, do you have any further comments/suggestions on this?
If you have any questions or concerns, please kindly let me know.
Thank you.

Regards,
Hilda

-----Original Message-----
From: Hilda Wu <hildawu@realtek.com> 
Sent: Tuesday, March 16, 2021 6:07 PM
To: marcel@holtmann.org
Cc: johan.hedberg@gmail.com; luiz.dentz@gmail.com; davem@davemloft.net; kuba@kernel.org; linux-bluetooth@vger.kernel.org; linux-kernel@vger.kernel.org; netdev@vger.kernel.org; tientzu@chromium.org; Max Chou <max.chou@realtek.com>; alex_lu@realsil.com.cn; KidmanLee <kidman@realtek.com>
Subject: [PATCH v2] Bluetooth: hci_h5: btrtl: Add quirk for keep power in suspend/resume

From: hildawu <hildawu@realtek.com>

RTL8822C devices support BT wakeup Host. Add a quirk for these specific devices did not power off during suspend and resume.
By this change, if the Host support that received BT device signal then it can be wakeup.

Signed-off-by: hildawu <hildawu@realtek.com>
---
Changes in v2:
- Add missing struct member
- Modify title for fit length
---
---
 drivers/bluetooth/btrtl.c   | 36 ------------------------------------
 drivers/bluetooth/btrtl.h   | 36 ++++++++++++++++++++++++++++++++++++
 drivers/bluetooth/hci_h5.c  | 35 ++++++++++++++++++++++++-----------
 include/net/bluetooth/hci.h |  9 +++++++++
 4 files changed, 69 insertions(+), 47 deletions(-)

diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c index e7fe5fb22753..94d1e7885aee 100644
--- a/drivers/bluetooth/btrtl.c
+++ b/drivers/bluetooth/btrtl.c
@@ -38,42 +38,6 @@
 	.hci_ver = (hciv), \
 	.hci_bus = (bus)
 
-enum btrtl_chip_id {
-	CHIP_ID_8723A,
-	CHIP_ID_8723B,
-	CHIP_ID_8821A,
-	CHIP_ID_8761A,
-	CHIP_ID_8822B = 8,
-	CHIP_ID_8723D,
-	CHIP_ID_8821C,
-	CHIP_ID_8822C = 13,
-	CHIP_ID_8761B,
-	CHIP_ID_8852A = 18,
-};
-
-struct id_table {
-	__u16 match_flags;
-	__u16 lmp_subver;
-	__u16 hci_rev;
-	__u8 hci_ver;
-	__u8 hci_bus;
-	bool config_needed;
-	bool has_rom_version;
-	char *fw_name;
-	char *cfg_name;
-};
-
-struct btrtl_device_info {
-	const struct id_table *ic_info;
-	u8 rom_version;
-	u8 *fw_data;
-	int fw_len;
-	u8 *cfg_data;
-	int cfg_len;
-	bool drop_fw;
-	int project_id;
-};
-
 static const struct id_table ic_id_table[] = {
 	/* 8723A */
 	{ IC_INFO(RTL_ROM_LMP_8723A, 0xb, 0x6, HCI_USB), diff --git a/drivers/bluetooth/btrtl.h b/drivers/bluetooth/btrtl.h index 2a582682136d..713768b38e21 100644
--- a/drivers/bluetooth/btrtl.h
+++ b/drivers/bluetooth/btrtl.h
@@ -12,6 +12,42 @@
 #define rtl_dev_info(dev, fmt, ...) bt_dev_info(dev, "RTL: " fmt, ##__VA_ARGS__)  #define rtl_dev_dbg(dev, fmt, ...) bt_dev_dbg(dev, "RTL: " fmt, ##__VA_ARGS__)
 
+enum btrtl_chip_id {
+	CHIP_ID_8723A,
+	CHIP_ID_8723B,
+	CHIP_ID_8821A,
+	CHIP_ID_8761A,
+	CHIP_ID_8822B = 8,
+	CHIP_ID_8723D,
+	CHIP_ID_8821C,
+	CHIP_ID_8822C = 13,
+	CHIP_ID_8761B,
+	CHIP_ID_8852A = 18,
+};
+
+struct id_table {
+	__u16 match_flags;
+	__u16 lmp_subver;
+	__u16 hci_rev;
+	__u8 hci_ver;
+	__u8 hci_bus;
+	bool config_needed;
+	bool has_rom_version;
+	char *fw_name;
+	char *cfg_name;
+};
+
+struct btrtl_device_info {
+	const struct id_table *ic_info;
+	u8 rom_version;
+	u8 *fw_data;
+	int fw_len;
+	u8 *cfg_data;
+	int cfg_len;
+	bool drop_fw;
+	int project_id;
+};
+
 struct btrtl_device_info;
 
 struct rtl_download_cmd {
diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c index 27e96681d583..1ca4ff89ea14 100644
--- a/drivers/bluetooth/hci_h5.c
+++ b/drivers/bluetooth/hci_h5.c
@@ -909,7 +909,15 @@ static int h5_btrtl_setup(struct h5 *h5)
 	/* Enable controller to do both LE scan and BR/EDR inquiry
 	 * simultaneously.
 	 */
-	set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &h5->hu->hdev->quirks);
+	switch (btrtl_dev->project_id) {
+	case CHIP_ID_8822C:
+	case CHIP_ID_8852A:
+		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &h5->hu->hdev->quirks);
+		set_bit(HCI_QUIRK_DEVICES_WAKEUP_SUPPORTED, &h5->hu->hdev->quirks);
+		break;
+	default:
+		break;
+	}
 
 out_free:
 	btrtl_free(btrtl_dev);
@@ -945,8 +953,11 @@ static void h5_btrtl_close(struct h5 *h5)  static int h5_btrtl_suspend(struct h5 *h5)  {
 	serdev_device_set_flow_control(h5->hu->serdev, false);
-	gpiod_set_value_cansleep(h5->device_wake_gpio, 0);
-	gpiod_set_value_cansleep(h5->enable_gpio, 0);
+
+	if (!test_bit(HCI_QUIRK_DEVICES_WAKEUP_SUPPORTED, &h5->hu->hdev->quirks)) {
+		gpiod_set_value_cansleep(h5->device_wake_gpio, 0);
+		gpiod_set_value_cansleep(h5->enable_gpio, 0);
+	}
 	return 0;
 }
 
@@ -972,17 +983,19 @@ static void h5_btrtl_reprobe_worker(struct work_struct *work)
 
 static int h5_btrtl_resume(struct h5 *h5)  {
-	struct h5_btrtl_reprobe *reprobe;
+	if (!test_bit(HCI_QUIRK_DEVICES_WAKEUP_SUPPORTED, &h5->hu->hdev->quirks)) {
+		struct h5_btrtl_reprobe *reprobe;
 
-	reprobe = kzalloc(sizeof(*reprobe), GFP_KERNEL);
-	if (!reprobe)
-		return -ENOMEM;
+		reprobe = kzalloc(sizeof(*reprobe), GFP_KERNEL);
+		if (!reprobe)
+			return -ENOMEM;
 
-	__module_get(THIS_MODULE);
+		__module_get(THIS_MODULE);
 
-	INIT_WORK(&reprobe->work, h5_btrtl_reprobe_worker);
-	reprobe->dev = get_device(&h5->hu->serdev->dev);
-	queue_work(system_long_wq, &reprobe->work);
+		INIT_WORK(&reprobe->work, h5_btrtl_reprobe_worker);
+		reprobe->dev = get_device(&h5->hu->serdev->dev);
+		queue_work(system_long_wq, &reprobe->work);
+	}
 	return 0;
 }
 
diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h index ea4ae551c426..1e4c2a97ab8d 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -246,6 +246,15 @@ enum {
 	 * HCI after resume.
 	 */
 	HCI_QUIRK_NO_SUSPEND_NOTIFIER,
+
+	/* When this quirk is set, the controller does not power off
+	 * during suspend and resume. This mechanism lets BT devices wake
+	 * the Host up if the Host and chips support.
+	 *
+	 * This quirk can be set before hci_register_dev is called or
+	 * during the hdev->setup vendor callback.
+	 */
+	HCI_QUIRK_DEVICES_WAKEUP_SUPPORTED,
 };
 
 /* HCI device flags */
--
2.17.1

