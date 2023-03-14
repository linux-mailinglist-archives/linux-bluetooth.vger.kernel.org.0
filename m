Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5925F6B9968
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 Mar 2023 16:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbjCNPfJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 14 Mar 2023 11:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231866AbjCNPes (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 14 Mar 2023 11:34:48 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2048.outbound.protection.outlook.com [40.107.22.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A942EAB892;
        Tue, 14 Mar 2023 08:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehzID3mJM9tKUK1qKn7poeeukrllOs2VMZrCRgO8mY31dmWIb6kMx5A7+Scj+l3z3+i8Sp1m1sifkr8ObJxxElemGh5u+AAjCAcRjd7hxQrKgH3JXOQhJmzKRkexRtun3LCHTcGATISSoJ+Im3e7Z+fdlFSu+o9QUt/+YValpKLTRbsLN2Vrre+IqXF/ytkpYafiH/7RyDPK20XdquGMiBg+lFWxpRUTFLuhFcMFEwpISJOIAyjHYoB+hL+FNWWF9YSf/wF5P1XCB7rFMGYcPbydebZB1L75AyZB9GQDiq9RQ6zxrekAXrmRc6Nvg+oqj+dMda+1Mej++s76WCwg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkTWpTfgeji1TWFoF05GWIqOtVaL7gnnHJiVuBiL4rI=;
 b=XhECvDWWjtf2TVKVvI4bAJSkx+MAPSxss7LBV9bL6iJG34hSd/Wfyapz379jvgHoy+sg4IoQEjWVIQ56jg85IWaNwm26FrGqPVXSrJJrKhWJlYkTvrAxRdZpR22NECxXd3usMSg8q1E7YWgb5qY3m83aoQYGuxMtBGKgplt5eLNsfJVxgY/ae6ydqjRuFMUzUx54McGcL74rR33gZK19XtcPF1L3OHmLi5CBScKRBEb/bx9cPcY6Rmbw94IqQue9j32kVkketPoYcwne0Xzb3gU5g6+ADTpKjpCw4OxNhMebyZapHEor2rYklC5sjXv0o0cpIk8fqQZknen05D2wew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkTWpTfgeji1TWFoF05GWIqOtVaL7gnnHJiVuBiL4rI=;
 b=Dv68TZMqrDJ9Kq0fN9K/YSyv74nLYhuiFG39YT4h/m3+lSpRGDICDEQLk8LrS6rvtJ6EqenFQ0DuohzKB9bgsnuSur+4BDnLbjyO/Jf5KmrWHuj5rnCG0WQ+sitt95Oy5oOOV12OM8Ma4CZosQa3kpXHwCa9oAUCv1St+kFd/s4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8603.eurprd04.prod.outlook.com (2603:10a6:20b:43a::10)
 by DU0PR04MB9495.eurprd04.prod.outlook.com (2603:10a6:10:32f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 15:33:12 +0000
Received: from AM9PR04MB8603.eurprd04.prod.outlook.com
 ([fe80::45d2:ce51:a1c4:8762]) by AM9PR04MB8603.eurprd04.prod.outlook.com
 ([fe80::45d2:ce51:a1c4:8762%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 15:33:11 +0000
From:   Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, marcel@holtmann.org,
        johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        alok.a.tiwari@oracle.com, hdanton@sina.com,
        ilpo.jarvinen@linux.intel.com, leon@kernel.org,
        simon.horman@corigine.com
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-serial@vger.kernel.org, amitkumar.karwar@nxp.com,
        rohit.fule@nxp.com, sherry.sun@nxp.com, neeraj.sanjaykale@nxp.com
Subject: [PATCH v11 4/4] Bluetooth: NXP: Add protocol support for NXP Bluetooth chipsets
Date:   Tue, 14 Mar 2023 21:02:13 +0530
Message-Id: <20230314153213.170045-5-neeraj.sanjaykale@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230314153213.170045-1-neeraj.sanjaykale@nxp.com>
References: <20230314153213.170045-1-neeraj.sanjaykale@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To AM9PR04MB8603.eurprd04.prod.outlook.com
 (2603:10a6:20b:43a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8603:EE_|DU0PR04MB9495:EE_
X-MS-Office365-Filtering-Correlation-Id: c56dbf81-0391-4a88-d085-08db24a16b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 54ZtRmvgkOinW4yByB8fp272UYe9yBTc1qeeufFElxJJ2lemVWi/pRWJavGpqfNYuc8HDtKXBba0oG/+lR4mqoWoDi2V5HZxbSdoTLbr1+Cd3c7d0RNwaDy/bRvu7Ml4xNWh3rz78Su600tijEkcpbUCXvFFnAag1Re7gqF/UhrsbJlvxqWkVYeOu/zW6FW0cm83X7Gn9uDF5+WTfqzEX9Y71Ahx5nOZkoI1cqSPOCdrIilVBcJvREIy2Tp121i9GYtX1LK9WTJIcUJE1pHJpEHfZ9ANxdCWH2j8W3Ph//rLZQpiByrH4kn7tCdetLCpUnOZTVaqUoEeln+BWjcW/dP3vEUCEFWqu87+Txxrb3bNIWA5aBwjTDhYPw0/uUR45kBtuYyVfwm7HU5QQUpqNgUQK6SoE+B6K7Pjm8lc3H33PAV4SBUvG/5n0hdvItLtbuIxoeqpLRLsginfhuPGfG384PfrclDAjuqICo1mN2a7wYrjRiEDPv1AsfUbGvZ9plcY9GP8Q+V506Sj9pOdMkAy1OzoWSd9aYHkuVDDr+vvSleA/Xlm6OL1I+MLHHw8nS+Q27SeB5iMve4/7AKzFrXcRard5KDwnOEShSGGNRHGvulnidPeSLIBzhRcASf/a8o63SXkcybF/CxzfP+tjiAkEaMuxgy1KhtYlXk19fzeRqs+x4LxOlz/2R2ra+pK8pnAUf3pO7LgFcYpNT1ZEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8603.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199018)(2906002)(66899018)(41300700001)(83380400001)(30864003)(36756003)(5660300002)(7416002)(66946007)(8676002)(66556008)(38350700002)(38100700002)(921005)(66476007)(86362001)(4326008)(316002)(8936002)(66574015)(478600001)(186003)(26005)(2616005)(1076003)(6512007)(52116002)(6506007)(6486002)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTFwUUhTOHhuRjBXZjQ1bjNUTlpTZWdsOWRQZmtvMzZJMzZjeDd1N0dXYkxk?=
 =?utf-8?B?NithcDY4bEY1eEN4dEpHTnllL1MwWEU3R0JYbEZlcmdicWNNZXpNSEtTcTFW?=
 =?utf-8?B?SjFTSlBiVmpvMXJQclBMbnBvaENWZDBSaXRZb1ppc1ZRRUpPaUlZeHVMZzQ0?=
 =?utf-8?B?ZlJiV1k2N0Yya2xUcnBtQ1N5ZEhUUWlvKysrY2VNMHVMWGVwcHFqUHI4eTY4?=
 =?utf-8?B?MjJtTkRreitnNUNvU1IxN2VVV2ExT1JXdTJ5anpCSTBxQ1BuQnJEdnU2NlV1?=
 =?utf-8?B?aUZYNVYwN2ZnUWdOdkM2QkZwT0NTVXkrMzBVTTVnRjh0TERsMTlDRm5JM3BP?=
 =?utf-8?B?OHdpQzJYT1hmS0hFTHM5Z2ROM3U2WnJQWlRJTVhoQUpjeEh0c29sZVpqVmkz?=
 =?utf-8?B?eEVHTXZ4SXd5TTNLd2FRdU1ONVYvZUxRSHpPS3NXV01MN1Ayd3JNMDJkZE43?=
 =?utf-8?B?UDNqSy93eG9nOHhIcTluS1VreSt5ZDBxRzgxdklWS1Q4a3ZpdndCcmErMlZi?=
 =?utf-8?B?ZnJ1U1BZRGJRNXc2NTBGV3g3S2l6aWJlU2dia0NrTlVLMmNqa24ydzJhckJP?=
 =?utf-8?B?enBIckdpT2tldU9QR2dBKzhVYXd4RzlkZG1OQzFVR2dsdUVFbXAyK24zTW1I?=
 =?utf-8?B?NW9BUjU2TmNTbzZQM3ZuN3loVzNOSUVSZWR1aWVGeEV3dUZCRVFMZlUrWHhP?=
 =?utf-8?B?YkY2Y0QvMVFWY3lsMytyMW9SU0xaRnB1MmcwOXNpR1djcUc5RGdHeWUzRE5B?=
 =?utf-8?B?VGRoMFN0QU45WCtkYU0zaTg0SUczMXpzZ3FvRGNRNzI2N1V2Qzc0cnF3d0lG?=
 =?utf-8?B?RmFEWkFQUHRBejlzUHA1REhWaEp2TFRFeElDb2dEM1hHOTdaN2NWVnN2SmRs?=
 =?utf-8?B?TXZGVklDOEtDYWdkajlqS3VBbmtjWWlwbkFaUVFIem56dUdjZUZzbmVTNHZY?=
 =?utf-8?B?UVM4cm9OY1BucXV6VjZ4clFtaDhWVVdzUmExQWFkWENwa2FXOWlReWkvMzVG?=
 =?utf-8?B?VHhRUVJpTVMrVS8wNlk4TUxLOEYwa1l5dzdaYU1LN0xDWmN1cy9rRHBXenpI?=
 =?utf-8?B?UndaNW44WlYrRVp4M2JqcWVSQVhxS05YR2JIQkc5aWZ3QjNzb3BqUlZKVXg0?=
 =?utf-8?B?K1hBdmNCVnJjRjA0ZThwdlJ1VDFvRDV5NFBadHBKdG5sM2pMdVZJQjUvaTBO?=
 =?utf-8?B?cmpiVDFNYmJjVjRMRDN1Y1dlc2U3N0tmbzlDU2FBN3JYdTVxUXJERHFLWHBp?=
 =?utf-8?B?Ymcya0JIMm5TVk5xZFhhMEM1YWJlQktyS2k3OEo2Zk53eDBTaHhjRDhRVGdF?=
 =?utf-8?B?azk5Z2w0dDhwNTZXeEdRR0FrVGZsN1lDMzdzQyszUGFQaDdDbzVMY21UMk5D?=
 =?utf-8?B?TG5SME9WWW1tREdVUElnVG9kMkpYdnBaQjJTRDdRSUNIMFBjQVNhZUI0dExI?=
 =?utf-8?B?VzBKbk9HbDVTNk1CWjBNYk5UNWhEMnhsVnd1MW1Oa2RoLzRsWUlYbElUVU14?=
 =?utf-8?B?Ti9FR0RUR04vYTZtME4xblh1cWtOS1BYUllDOHBzODRpczRGM25VMDAzU2to?=
 =?utf-8?B?MEtqb1h0anFaQ2hEWlFzbGY0UXFBUDRnL3Z5SVd3RWQ5czRTRFhiMHB2RkNK?=
 =?utf-8?B?bXFZQ2FJVXRRV1hxZDVBU29oN01pRkVGY1ZydTRZMjFNWC9GeHpUM1pvTFZp?=
 =?utf-8?B?OXFtWGVLRnhzcnc0T093K1BJalZHUWwwTTVVZzh3akt2REtuVGJTY0tvRXox?=
 =?utf-8?B?eVZhRlgrYkJVZlRMMWJ3Qk9KNjNTOUFlQkRIVEZsNy9uVUpzeVNVME9LWGg0?=
 =?utf-8?B?Mk1zanNhalVJOEZuTFQ1OGg4OC8xcGFaczE3N3h2VWgyaDZBOXB3T01lNU9S?=
 =?utf-8?B?TzhDVzJ2d0JjcDMzNzdXZXdDSXhXVDRaNDZEZ2ZwK0ZHeWFqUDBWSUVYQkRw?=
 =?utf-8?B?WCtlYTlHcHh4RXlGWDdndEhHQ0NYOXZkYTk0RVpRNDRRaSt6T0twZVdHVFg4?=
 =?utf-8?B?aDRnbktCU01lQVZSNW9ON0dENjZocWcrcWlJV3dzUUI1Y2tsY3BXTmExdHg3?=
 =?utf-8?B?MFRKLytiZXZyWHcxRWNVZE91UDc0K0tPYkJ1YTRvbkxmWXo2NkVLRU5UbnNB?=
 =?utf-8?B?N3NYUEZiOG9ENWpWRHpYRG0wZStZSVJBRTltVlJqcnJJc280R05zQWJNNldL?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c56dbf81-0391-4a88-d085-08db24a16b69
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8603.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 15:33:11.9280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOhioMXby4hfhfa6/PRHOOlFOfk48+B3MOhWa2DJFnAxBXbQ5jvFx1IRKemCv0rBCTXEa1cWPVhB5+jZmTPvll6zYlHHlOGDIF9T/t0Mv2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9495
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This adds a driver based on serdev driver for the NXP BT serial protocol
based on running H:4, which can enable the built-in Bluetooth device
inside an NXP BT chip.

This driver has Power Save feature that will put the chip into sleep state
whenever there is no activity for 2000ms, and will be woken up when any
activity is to be initiated over UART.

This driver enables the power save feature by default by sending the vendor
specific commands to the chip during setup.

During setup, the driver checks if a FW is already running on the chip
by waiting for the bootloader signature, and downloads device specific FW
file into the chip over UART if bootloader signature is received..

Signed-off-by: Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v2: Removed conf file support and added static data for each chip based
on compatibility devices mentioned in DT bindings. Handled potential
memory leaks and null pointer dereference issues, simplified FW download
feature, handled byte-order and few cosmetic changes. (Ilpo Järvinen,
Alok Tiwari, Hillf Danton)
v3: Added conf file support necessary to support different vendor modules,
moved .h file contents to .c, cosmetic changes. (Luiz Augusto von Dentz,
Rob Herring, Leon Romanovsky)
v4: Removed conf file support, optimized driver data, add logic to select
FW name based on chip signature (Greg KH, Ilpo Järvinen, Sherry Sun)
v5: Replaced bt_dev_info() with bt_dev_dbg(), handled user-space cmd
parsing in nxp_enqueue() in a better way. (Greg KH, Luiz Augusto von Dentz)
v6: Add support for fw-init-baudrate parameter from device tree,
modified logic to detect FW download is needed or FW is running. (Greg
KH, Sherry Sun)
v7: Renamed variables, improved FW download functions, include ps_data
into btnxpuart_dev. (Ilpo Järvinen)
v8: Move bootloader signature handling to a separate function. Add
select CRC32 to Kconfig file. (Ilpo Järvinen)
v9: Change datatype of FW download command CRC to __be32. (Ilpo Järvinen)
v10: Remove version string from MODULE_DESCRIPTION() (Ilpo Järvinen)
v11: Renamed goto labels, fix potential memory leak. (Simon Horman)
---
 MAINTAINERS                   |    1 +
 drivers/bluetooth/Kconfig     |   12 +
 drivers/bluetooth/Makefile    |    1 +
 drivers/bluetooth/btnxpuart.c | 1285 +++++++++++++++++++++++++++++++++
 4 files changed, 1299 insertions(+)
 create mode 100644 drivers/bluetooth/btnxpuart.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 030ec6fe89df..fdb9b0788c89 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22840,6 +22840,7 @@ M:	Amitkumar Karwar <amitkumar.karwar@nxp.com>
 M:	Neeraj Kale <neeraj.sanjaykale@nxp.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/bluetooth/nxp,88w8987-bt.yaml
+F:	drivers/bluetooth/btnxpuart.c
 
 THE REST
 M:	Linus Torvalds <torvalds@linux-foundation.org>
diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index 5a1a7bec3c42..0703bdd44140 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -465,4 +465,16 @@ config BT_VIRTIO
 	  Say Y here to compile support for HCI over Virtio into the
 	  kernel or say M to compile as a module.
 
+config BT_NXPUART
+	tristate "NXP protocol support"
+	depends on SERIAL_DEV_BUS
+	select CRC32
+	help
+	  NXP is serial driver required for NXP Bluetooth
+	  devices with UART interface.
+
+	  Say Y here to compile support for NXP Bluetooth UART device into
+	  the kernel, or say M here to compile as a module (btnxpuart).
+
+
 endmenu
diff --git a/drivers/bluetooth/Makefile b/drivers/bluetooth/Makefile
index e0b261f24fc9..7a5967e9ac48 100644
--- a/drivers/bluetooth/Makefile
+++ b/drivers/bluetooth/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_BT_QCA)		+= btqca.o
 obj-$(CONFIG_BT_MTK)		+= btmtk.o
 
 obj-$(CONFIG_BT_VIRTIO)		+= virtio_bt.o
+obj-$(CONFIG_BT_NXPUART)	+= btnxpuart.o
 
 obj-$(CONFIG_BT_HCIUART_NOKIA)	+= hci_nokia.o
 
diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
new file mode 100644
index 000000000000..95ca538ed756
--- /dev/null
+++ b/drivers/bluetooth/btnxpuart.c
@@ -0,0 +1,1285 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  NXP Bluetooth driver
+ *  Copyright 2018-2023 NXP
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+
+#include <linux/serdev.h>
+#include <linux/of.h>
+#include <linux/skbuff.h>
+#include <asm/unaligned.h>
+#include <linux/firmware.h>
+#include <linux/string.h>
+#include <linux/crc8.h>
+#include <linux/crc32.h>
+#include <linux/string_helpers.h>
+
+#include <net/bluetooth/bluetooth.h>
+#include <net/bluetooth/hci_core.h>
+
+#include "h4_recv.h"
+
+#define MANUFACTURER_NXP		37
+
+#define BTNXPUART_TX_STATE_ACTIVE	1
+#define BTNXPUART_FW_DOWNLOADING	2
+#define BTNXPUART_CHECK_BOOT_SIGNATURE	3
+#define BTNXPUART_SERDEV_OPEN		4
+
+#define FIRMWARE_W8987	"nxp/uartuart8987_bt.bin"
+#define FIRMWARE_W8997	"nxp/uartuart8997_bt_v4.bin"
+#define FIRMWARE_W9098	"nxp/uartuart9098_bt_v1.bin"
+#define FIRMWARE_IW416	"nxp/uartiw416_bt_v0.bin"
+#define FIRMWARE_IW612	"nxp/uartspi_n61x_v1.bin.se"
+
+#define CHIP_ID_W9098		0x5c03
+#define CHIP_ID_IW416		0x7201
+#define CHIP_ID_IW612		0x7601
+
+#define HCI_NXP_PRI_BAUDRATE	115200
+#define HCI_NXP_SEC_BAUDRATE	3000000
+
+#define MAX_FW_FILE_NAME_LEN    50
+
+/* Default ps timeout period in milli-second */
+#define PS_DEFAULT_TIMEOUT_PERIOD     2000
+
+/* wakeup methods */
+#define WAKEUP_METHOD_DTR       0
+#define WAKEUP_METHOD_BREAK     1
+#define WAKEUP_METHOD_EXT_BREAK 2
+#define WAKEUP_METHOD_RTS       3
+#define WAKEUP_METHOD_INVALID   0xff
+
+/* power save mode status */
+#define PS_MODE_DISABLE         0
+#define PS_MODE_ENABLE          1
+
+/* Power Save Commands to ps_work_func  */
+#define PS_CMD_EXIT_PS          1
+#define PS_CMD_ENTER_PS         2
+
+/* power save state */
+#define PS_STATE_AWAKE          0
+#define PS_STATE_SLEEP          1
+
+/* Bluetooth vendor command : Sleep mode */
+#define HCI_NXP_AUTO_SLEEP_MODE	0xfc23
+/* Bluetooth vendor command : Wakeup method */
+#define HCI_NXP_WAKEUP_METHOD	0xfc53
+/* Bluetooth vendor command : Set operational baudrate */
+#define HCI_NXP_SET_OPER_SPEED	0xfc09
+/* Bluetooth vendor command: Independent Reset */
+#define HCI_NXP_IND_RESET	0xfcfc
+
+/* Bluetooth Power State : Vendor cmd params */
+#define BT_PS_ENABLE			0x02
+#define BT_PS_DISABLE			0x03
+
+/* Bluetooth Host Wakeup Methods */
+#define BT_HOST_WAKEUP_METHOD_NONE      0x00
+#define BT_HOST_WAKEUP_METHOD_DTR       0x01
+#define BT_HOST_WAKEUP_METHOD_BREAK     0x02
+#define BT_HOST_WAKEUP_METHOD_GPIO      0x03
+
+/* Bluetooth Chip Wakeup Methods */
+#define BT_CTRL_WAKEUP_METHOD_DSR       0x00
+#define BT_CTRL_WAKEUP_METHOD_BREAK     0x01
+#define BT_CTRL_WAKEUP_METHOD_GPIO      0x02
+#define BT_CTRL_WAKEUP_METHOD_EXT_BREAK 0x04
+#define BT_CTRL_WAKEUP_METHOD_RTS       0x05
+
+struct ps_data {
+	u8    target_ps_mode;	/* ps mode to be set */
+	u8    cur_psmode;	/* current ps_mode */
+	u8    ps_state;		/* controller's power save state */
+	u8    ps_cmd;
+	u8    h2c_wakeupmode;
+	u8    cur_h2c_wakeupmode;
+	u8    c2h_wakeupmode;
+	u8    c2h_wakeup_gpio;
+	u8    h2c_wakeup_gpio;
+	bool  driver_sent_cmd;
+	u16   h2c_ps_interval;
+	u16   c2h_ps_interval;
+	struct hci_dev *hdev;
+	struct work_struct work;
+	struct timer_list ps_timer;
+};
+
+struct wakeup_cmd_payload {
+	u8 c2h_wakeupmode;
+	u8 c2h_wakeup_gpio;
+	u8 h2c_wakeupmode;
+	u8 h2c_wakeup_gpio;
+} __packed;
+
+struct psmode_cmd_payload {
+	u8 ps_cmd;
+	__le16 c2h_ps_interval;
+} __packed;
+
+struct btnxpuart_data {
+	bool fw_dnld_use_high_baudrate;
+	const u8 *fw_name;
+};
+
+struct btnxpuart_dev {
+	struct hci_dev *hdev;
+	struct serdev_device *serdev;
+
+	struct work_struct tx_work;
+	unsigned long tx_state;
+	struct sk_buff_head txq;
+	struct sk_buff *rx_skb;
+
+	const struct firmware *fw;
+	u8 fw_name[MAX_FW_FILE_NAME_LEN];
+	u32 fw_dnld_v1_offset;
+	u32 fw_v1_sent_bytes;
+	u32 fw_v3_offset_correction;
+	u32 fw_v1_expected_len;
+	wait_queue_head_t fw_dnld_done_wait_q;
+	wait_queue_head_t check_boot_sign_wait_q;
+
+	u32 new_baudrate;
+	u32 current_baudrate;
+	u32 fw_init_baudrate;
+	bool timeout_changed;
+	bool baudrate_changed;
+
+	struct ps_data psdata;
+	struct btnxpuart_data *nxp_data;
+};
+
+#define NXP_V1_FW_REQ_PKT	0xa5
+#define NXP_V1_CHIP_VER_PKT	0xaa
+#define NXP_V3_FW_REQ_PKT	0xa7
+#define NXP_V3_CHIP_VER_PKT	0xab
+
+#define NXP_ACK_V1		0x5a
+#define NXP_NAK_V1		0xbf
+#define NXP_ACK_V3		0x7a
+#define NXP_NAK_V3		0x7b
+#define NXP_CRC_ERROR_V3	0x7c
+
+#define HDR_LEN			16
+
+#define NXP_RECV_FW_REQ_V1 \
+	.type = NXP_V1_FW_REQ_PKT, \
+	.hlen = 4, \
+	.loff = 0, \
+	.lsize = 0, \
+	.maxlen = 4
+
+#define NXP_RECV_CHIP_VER_V3 \
+	.type = NXP_V3_CHIP_VER_PKT, \
+	.hlen = 4, \
+	.loff = 0, \
+	.lsize = 0, \
+	.maxlen = 4
+
+#define NXP_RECV_FW_REQ_V3 \
+	.type = NXP_V3_FW_REQ_PKT, \
+	.hlen = 9, \
+	.loff = 0, \
+	.lsize = 0, \
+	.maxlen = 9
+
+struct v1_data_req {
+	__le16 len;
+	__le16 len_comp;
+} __packed;
+
+struct v3_data_req {
+	__le16 len;
+	__le32 offset;
+	__le16 error;
+	u8 crc;
+} __packed;
+
+struct v3_start_ind {
+	__le16 chip_id;
+	u8 loader_ver;
+	u8 crc;
+} __packed;
+
+/* UART register addresses of BT chip */
+#define CLKDIVADDR	0x7f00008f
+#define UARTDIVADDR	0x7f000090
+#define UARTMCRADDR	0x7f000091
+#define UARTREINITADDR	0x7f000092
+#define UARTICRADDR	0x7f000093
+#define UARTFCRADDR	0x7f000094
+
+#define MCR		0x00000022
+#define INIT		0x00000001
+#define ICR		0x000000c7
+#define FCR		0x000000c7
+
+#define POLYNOMIAL8	0x07
+
+struct uart_reg {
+	__le32 address;
+	__le32 value;
+} __packed;
+
+struct uart_config {
+	struct uart_reg clkdiv;
+	struct uart_reg uartdiv;
+	struct uart_reg mcr;
+	struct uart_reg re_init;
+	struct uart_reg icr;
+	struct uart_reg fcr;
+	__be32 crc;
+} __packed;
+
+struct nxp_bootloader_cmd {
+	__le32 header;
+	__le32 arg;
+	__le32 payload_len;
+	__be32 crc;
+} __packed;
+
+static u8 crc8_table[CRC8_TABLE_SIZE];
+
+/* Default configurations */
+#define DEFAULT_H2C_WAKEUP_MODE	WAKEUP_METHOD_BREAK
+#define DEFAULT_PS_MODE		PS_MODE_ENABLE
+#define FW_INIT_BAUDRATE	HCI_NXP_PRI_BAUDRATE
+
+static struct sk_buff *nxp_drv_send_cmd(struct hci_dev *hdev, u16 opcode,
+					u32 plen,
+					void *param)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+	struct ps_data *psdata = &nxpdev->psdata;
+	struct sk_buff *skb;
+
+	/* set flag to prevent nxp_enqueue from parsing values from this command and
+	 * calling hci_cmd_sync_queue() again.
+	 */
+	psdata->driver_sent_cmd = true;
+	skb = __hci_cmd_sync(hdev, opcode, plen, param, HCI_CMD_TIMEOUT);
+	psdata->driver_sent_cmd = false;
+
+	return skb;
+}
+
+static void btnxpuart_tx_wakeup(struct btnxpuart_dev *nxpdev)
+{
+	if (schedule_work(&nxpdev->tx_work))
+		set_bit(BTNXPUART_TX_STATE_ACTIVE, &nxpdev->tx_state);
+}
+
+/* NXP Power Save Feature */
+static void ps_start_timer(struct btnxpuart_dev *nxpdev)
+{
+	struct ps_data *psdata = &nxpdev->psdata;
+
+	if (!psdata)
+		return;
+
+	if (psdata->cur_psmode == PS_MODE_ENABLE)
+		mod_timer(&psdata->ps_timer, jiffies + msecs_to_jiffies(psdata->h2c_ps_interval));
+}
+
+static void ps_cancel_timer(struct btnxpuart_dev *nxpdev)
+{
+	struct ps_data *psdata = &nxpdev->psdata;
+
+	flush_work(&psdata->work);
+	del_timer_sync(&psdata->ps_timer);
+}
+
+static void ps_control(struct hci_dev *hdev, u8 ps_state)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+	struct ps_data *psdata = &nxpdev->psdata;
+	int status;
+
+	if (psdata->ps_state == ps_state ||
+	    !test_bit(BTNXPUART_SERDEV_OPEN, &nxpdev->tx_state))
+		return;
+
+	switch (psdata->cur_h2c_wakeupmode) {
+	case WAKEUP_METHOD_DTR:
+		if (ps_state == PS_STATE_AWAKE)
+			status = serdev_device_set_tiocm(nxpdev->serdev, TIOCM_DTR, 0);
+		else
+			status = serdev_device_set_tiocm(nxpdev->serdev, 0, TIOCM_DTR);
+		break;
+	case WAKEUP_METHOD_BREAK:
+	default:
+		if (ps_state == PS_STATE_AWAKE)
+			status = serdev_device_break_ctl(nxpdev->serdev, 0);
+		else
+			status = serdev_device_break_ctl(nxpdev->serdev, -1);
+		bt_dev_dbg(hdev, "Set UART break: %s, status=%d",
+			   str_on_off(ps_state == PS_STATE_SLEEP), status);
+		break;
+	}
+	if (!status)
+		psdata->ps_state = ps_state;
+	if (ps_state == PS_STATE_AWAKE)
+		btnxpuart_tx_wakeup(nxpdev);
+}
+
+static void ps_work_func(struct work_struct *work)
+{
+	struct ps_data *data = container_of(work, struct ps_data, work);
+
+	if (data->ps_cmd == PS_CMD_ENTER_PS && data->cur_psmode == PS_MODE_ENABLE)
+		ps_control(data->hdev, PS_STATE_SLEEP);
+	else if (data->ps_cmd == PS_CMD_EXIT_PS)
+		ps_control(data->hdev, PS_STATE_AWAKE);
+}
+
+static void ps_timeout_func(struct timer_list *t)
+{
+	struct ps_data *data = from_timer(data, t, ps_timer);
+	struct hci_dev *hdev = data->hdev;
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+
+	if (test_bit(BTNXPUART_TX_STATE_ACTIVE, &nxpdev->tx_state)) {
+		ps_start_timer(nxpdev);
+	} else {
+		data->ps_cmd = PS_CMD_ENTER_PS;
+		schedule_work(&data->work);
+	}
+}
+
+static int ps_init_work(struct hci_dev *hdev)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+	struct ps_data *psdata = &nxpdev->psdata;
+
+	psdata->h2c_ps_interval = PS_DEFAULT_TIMEOUT_PERIOD;
+	psdata->ps_state = PS_STATE_AWAKE;
+	psdata->target_ps_mode = DEFAULT_PS_MODE;
+	psdata->hdev = hdev;
+	psdata->c2h_wakeupmode = BT_HOST_WAKEUP_METHOD_NONE;
+	psdata->c2h_wakeup_gpio = 0xff;
+
+	switch (DEFAULT_H2C_WAKEUP_MODE) {
+	case WAKEUP_METHOD_DTR:
+		psdata->h2c_wakeupmode = WAKEUP_METHOD_DTR;
+		break;
+	case WAKEUP_METHOD_BREAK:
+	default:
+		psdata->h2c_wakeupmode = WAKEUP_METHOD_BREAK;
+		break;
+	}
+	psdata->cur_psmode = PS_MODE_DISABLE;
+	psdata->cur_h2c_wakeupmode = WAKEUP_METHOD_INVALID;
+	INIT_WORK(&psdata->work, ps_work_func);
+
+	return 0;
+}
+
+static void ps_init_timer(struct hci_dev *hdev)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+	struct ps_data *psdata = &nxpdev->psdata;
+
+	timer_setup(&psdata->ps_timer, ps_timeout_func, 0);
+}
+
+static void ps_wakeup(struct btnxpuart_dev *nxpdev)
+{
+	struct ps_data *psdata = &nxpdev->psdata;
+
+	if (psdata->ps_state != PS_STATE_AWAKE) {
+		psdata->ps_cmd = PS_CMD_EXIT_PS;
+		schedule_work(&psdata->work);
+	}
+}
+
+static int send_ps_cmd(struct hci_dev *hdev, void *data)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+	struct ps_data *psdata = &nxpdev->psdata;
+	struct psmode_cmd_payload pcmd;
+	struct sk_buff *skb;
+	u8 *status;
+
+	if (psdata->target_ps_mode == PS_MODE_ENABLE)
+		pcmd.ps_cmd = BT_PS_ENABLE;
+	else
+		pcmd.ps_cmd = BT_PS_DISABLE;
+	pcmd.c2h_ps_interval = __cpu_to_le16(psdata->c2h_ps_interval);
+
+	skb = nxp_drv_send_cmd(hdev, HCI_NXP_AUTO_SLEEP_MODE, sizeof(pcmd), &pcmd);
+	if (IS_ERR(skb)) {
+		bt_dev_err(hdev, "Setting Power Save mode failed (%ld)", PTR_ERR(skb));
+		return PTR_ERR(skb);
+	}
+
+	status = skb_pull_data(skb, 1);
+	if (status) {
+		if (!*status)
+			psdata->cur_psmode = psdata->target_ps_mode;
+		else
+			psdata->target_ps_mode = psdata->cur_psmode;
+		if (psdata->cur_psmode == PS_MODE_ENABLE)
+			ps_start_timer(nxpdev);
+		else
+			ps_wakeup(nxpdev);
+		bt_dev_dbg(hdev, "Power Save mode response: status=%d, ps_mode=%d",
+			   *status, psdata->cur_psmode);
+	}
+	kfree_skb(skb);
+
+	return 0;
+}
+
+static int send_wakeup_method_cmd(struct hci_dev *hdev, void *data)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+	struct ps_data *psdata = &nxpdev->psdata;
+	struct wakeup_cmd_payload pcmd;
+	struct sk_buff *skb;
+	u8 *status;
+
+	pcmd.c2h_wakeupmode = psdata->c2h_wakeupmode;
+	pcmd.c2h_wakeup_gpio = psdata->c2h_wakeup_gpio;
+	switch (psdata->h2c_wakeupmode) {
+	case WAKEUP_METHOD_DTR:
+		pcmd.h2c_wakeupmode = BT_CTRL_WAKEUP_METHOD_DSR;
+		break;
+	case WAKEUP_METHOD_BREAK:
+	default:
+		pcmd.h2c_wakeupmode = BT_CTRL_WAKEUP_METHOD_BREAK;
+		break;
+	}
+	pcmd.h2c_wakeup_gpio = 0xff;
+
+	skb = nxp_drv_send_cmd(hdev, HCI_NXP_WAKEUP_METHOD, sizeof(pcmd), &pcmd);
+	if (IS_ERR(skb)) {
+		bt_dev_err(hdev, "Setting wake-up method failed (%ld)", PTR_ERR(skb));
+		return PTR_ERR(skb);
+	}
+
+	status = skb_pull_data(skb, 1);
+	if (status) {
+		if (*status == 0)
+			psdata->cur_h2c_wakeupmode = psdata->h2c_wakeupmode;
+		else
+			psdata->h2c_wakeupmode = psdata->cur_h2c_wakeupmode;
+		bt_dev_dbg(hdev, "Set Wakeup Method response: status=%d, h2c_wakeupmode=%d",
+			   *status, psdata->cur_h2c_wakeupmode);
+	}
+	kfree_skb(skb);
+
+	return 0;
+}
+
+static void ps_init(struct hci_dev *hdev)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+	struct ps_data *psdata = &nxpdev->psdata;
+
+	serdev_device_set_tiocm(nxpdev->serdev, 0, TIOCM_RTS);
+	usleep_range(5000, 10000);
+	serdev_device_set_tiocm(nxpdev->serdev, TIOCM_RTS, 0);
+	usleep_range(5000, 10000);
+
+	switch (psdata->h2c_wakeupmode) {
+	case WAKEUP_METHOD_DTR:
+		serdev_device_set_tiocm(nxpdev->serdev, 0, TIOCM_DTR);
+		serdev_device_set_tiocm(nxpdev->serdev, TIOCM_DTR, 0);
+		break;
+	case WAKEUP_METHOD_BREAK:
+	default:
+		serdev_device_break_ctl(nxpdev->serdev, -1);
+		usleep_range(5000, 10000);
+		serdev_device_break_ctl(nxpdev->serdev, 0);
+		usleep_range(5000, 10000);
+		break;
+	}
+	if (psdata->cur_h2c_wakeupmode != psdata->h2c_wakeupmode)
+		hci_cmd_sync_queue(hdev, send_wakeup_method_cmd, NULL, NULL);
+	if (psdata->cur_psmode != psdata->target_ps_mode)
+		hci_cmd_sync_queue(hdev, send_ps_cmd, NULL, NULL);
+}
+
+/* NXP Firmware Download Feature */
+static int nxp_download_firmware(struct hci_dev *hdev)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+	int err = 0;
+
+	nxpdev->fw_dnld_v1_offset = 0;
+	nxpdev->fw_v1_sent_bytes = 0;
+	nxpdev->fw_v1_expected_len = HDR_LEN;
+	nxpdev->fw_v3_offset_correction = 0;
+	nxpdev->baudrate_changed = false;
+	nxpdev->timeout_changed = false;
+
+	serdev_device_set_baudrate(nxpdev->serdev, HCI_NXP_PRI_BAUDRATE);
+	serdev_device_set_flow_control(nxpdev->serdev, 0);
+	nxpdev->current_baudrate = HCI_NXP_PRI_BAUDRATE;
+
+	/* Wait till FW is downloaded and CTS becomes low */
+	err = wait_event_interruptible_timeout(nxpdev->fw_dnld_done_wait_q,
+					       !test_bit(BTNXPUART_FW_DOWNLOADING,
+							 &nxpdev->tx_state),
+					       msecs_to_jiffies(60000));
+	if (err == 0) {
+		bt_dev_err(hdev, "FW Download Timeout.");
+		return -ETIMEDOUT;
+	}
+
+	serdev_device_set_flow_control(nxpdev->serdev, 1);
+	err = serdev_device_wait_for_cts(nxpdev->serdev, 1, 60000);
+	if (err < 0) {
+		bt_dev_err(hdev, "CTS is still high. FW Download failed.");
+		return err;
+	}
+	release_firmware(nxpdev->fw);
+	memset(nxpdev->fw_name, 0, sizeof(nxpdev->fw_name));
+
+	/* Allow the downloaded FW to initialize */
+	usleep_range(800 * USEC_PER_MSEC, 1 * USEC_PER_SEC);
+
+	return 0;
+}
+
+static void nxp_send_ack(u8 ack, struct hci_dev *hdev)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+	u8 ack_nak[2];
+	int len = 1;
+
+	ack_nak[0] = ack;
+	if (ack == NXP_ACK_V3) {
+		ack_nak[1] = crc8(crc8_table, ack_nak, 1, 0xff);
+		len = 2;
+	}
+	serdev_device_write_buf(nxpdev->serdev, ack_nak, len);
+}
+
+static bool nxp_fw_change_baudrate(struct hci_dev *hdev, u16 req_len)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+	struct nxp_bootloader_cmd nxp_cmd5;
+	struct uart_config uart_config;
+
+	if (req_len == sizeof(nxp_cmd5)) {
+		nxp_cmd5.header = __cpu_to_le32(5);
+		nxp_cmd5.arg = 0;
+		nxp_cmd5.payload_len = __cpu_to_le32(sizeof(uart_config));
+		/* FW expects swapped CRC bytes */
+		nxp_cmd5.crc = __cpu_to_be32(crc32_be(0UL, (char *)&nxp_cmd5,
+						      sizeof(nxp_cmd5) - 4));
+
+		serdev_device_write_buf(nxpdev->serdev, (u8 *)&nxp_cmd5, sizeof(nxp_cmd5));
+		nxpdev->fw_v3_offset_correction += req_len;
+	} else if (req_len == sizeof(uart_config)) {
+		uart_config.clkdiv.address = __cpu_to_le32(CLKDIVADDR);
+		uart_config.clkdiv.value = __cpu_to_le32(0x00c00000);
+		uart_config.uartdiv.address = __cpu_to_le32(UARTDIVADDR);
+		uart_config.uartdiv.value = __cpu_to_le32(1);
+		uart_config.mcr.address = __cpu_to_le32(UARTMCRADDR);
+		uart_config.mcr.value = __cpu_to_le32(MCR);
+		uart_config.re_init.address = __cpu_to_le32(UARTREINITADDR);
+		uart_config.re_init.value = __cpu_to_le32(INIT);
+		uart_config.icr.address = __cpu_to_le32(UARTICRADDR);
+		uart_config.icr.value = __cpu_to_le32(ICR);
+		uart_config.fcr.address = __cpu_to_le32(UARTFCRADDR);
+		uart_config.fcr.value = __cpu_to_le32(FCR);
+		/* FW expects swapped CRC bytes */
+		uart_config.crc = __cpu_to_be32(crc32_be(0UL, (char *)&uart_config,
+							 sizeof(uart_config) - 4));
+
+		serdev_device_write_buf(nxpdev->serdev, (u8 *)&uart_config, sizeof(uart_config));
+		serdev_device_wait_until_sent(nxpdev->serdev, 0);
+		nxpdev->fw_v3_offset_correction += req_len;
+		return true;
+	}
+	return false;
+}
+
+static bool nxp_fw_change_timeout(struct hci_dev *hdev, u16 req_len)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+	struct nxp_bootloader_cmd nxp_cmd7;
+
+	if (req_len != sizeof(nxp_cmd7))
+		return false;
+
+	nxp_cmd7.header = __cpu_to_le32(7);
+	nxp_cmd7.arg = __cpu_to_le32(0x70);
+	nxp_cmd7.payload_len = 0;
+	/* FW expects swapped CRC bytes */
+	nxp_cmd7.crc = __cpu_to_be32(crc32_be(0UL, (char *)&nxp_cmd7,
+					      sizeof(nxp_cmd7) - 4));
+	serdev_device_write_buf(nxpdev->serdev, (u8 *)&nxp_cmd7, sizeof(nxp_cmd7));
+	serdev_device_wait_until_sent(nxpdev->serdev, 0);
+	nxpdev->fw_v3_offset_correction += req_len;
+	return true;
+}
+
+static u32 nxp_get_data_len(const u8 *buf)
+{
+	struct nxp_bootloader_cmd *hdr = (struct nxp_bootloader_cmd *)buf;
+
+	return __le32_to_cpu(hdr->payload_len);
+}
+
+static bool is_fw_downloading(struct btnxpuart_dev *nxpdev)
+{
+	return test_bit(BTNXPUART_FW_DOWNLOADING, &nxpdev->tx_state);
+}
+
+static bool process_boot_signature(struct btnxpuart_dev *nxpdev)
+{
+	if (test_bit(BTNXPUART_CHECK_BOOT_SIGNATURE, &nxpdev->tx_state)) {
+		clear_bit(BTNXPUART_CHECK_BOOT_SIGNATURE, &nxpdev->tx_state);
+		wake_up_interruptible(&nxpdev->check_boot_sign_wait_q);
+		return false;
+	}
+	return is_fw_downloading(nxpdev);
+}
+
+static int nxp_request_firmware(struct hci_dev *hdev, const u8 *fw_name)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+	int err = 0;
+
+	if (!strlen(nxpdev->fw_name)) {
+		snprintf(nxpdev->fw_name, MAX_FW_FILE_NAME_LEN, "%s", fw_name);
+
+		bt_dev_dbg(hdev, "Request Firmware: %s", nxpdev->fw_name);
+		err = request_firmware(&nxpdev->fw, nxpdev->fw_name, &hdev->dev);
+		if (err < 0) {
+			bt_dev_err(hdev, "Firmware file %s not found", nxpdev->fw_name);
+			clear_bit(BTNXPUART_FW_DOWNLOADING, &nxpdev->tx_state);
+		}
+	}
+	return err;
+}
+
+/* for legacy chipsets with V1 bootloader */
+static int nxp_recv_fw_req_v1(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+	struct btnxpuart_data *nxp_data = nxpdev->nxp_data;
+	struct v1_data_req *req;
+	u32 requested_len;
+
+	if (!process_boot_signature(nxpdev))
+		goto free_skb;
+
+	req = (struct v1_data_req *)skb_pull_data(skb, sizeof(struct v1_data_req));
+	if (!req)
+		goto free_skb;
+
+	if ((req->len ^ req->len_comp) != 0xffff) {
+		bt_dev_dbg(hdev, "ERR: Send NAK");
+		nxp_send_ack(NXP_NAK_V1, hdev);
+		goto free_skb;
+	}
+	nxp_send_ack(NXP_ACK_V1, hdev);
+
+	if (nxp_data->fw_dnld_use_high_baudrate) {
+		if (!nxpdev->timeout_changed) {
+			nxpdev->timeout_changed = nxp_fw_change_timeout(hdev, req->len);
+			goto free_skb;
+		}
+		if (!nxpdev->baudrate_changed) {
+			nxpdev->baudrate_changed = nxp_fw_change_baudrate(hdev, req->len);
+			if (nxpdev->baudrate_changed) {
+				serdev_device_set_baudrate(nxpdev->serdev,
+							   HCI_NXP_SEC_BAUDRATE);
+				serdev_device_set_flow_control(nxpdev->serdev, 1);
+				nxpdev->current_baudrate = HCI_NXP_SEC_BAUDRATE;
+			}
+			goto free_skb;
+		}
+	}
+
+	if (nxp_request_firmware(hdev, nxp_data->fw_name))
+		goto free_skb;
+
+	requested_len = req->len;
+	if (requested_len == 0) {
+		bt_dev_dbg(hdev, "FW Downloaded Successfully: %zu bytes", nxpdev->fw->size);
+		clear_bit(BTNXPUART_FW_DOWNLOADING, &nxpdev->tx_state);
+		wake_up_interruptible(&nxpdev->fw_dnld_done_wait_q);
+		goto free_skb;
+	}
+	if (requested_len & 0x01) {
+		/* The CRC did not match at the other end.
+		 * Simply send the same bytes again.
+		 */
+		requested_len = nxpdev->fw_v1_sent_bytes;
+		bt_dev_dbg(hdev, "CRC error. Resend %d bytes of FW.", requested_len);
+	} else {
+		nxpdev->fw_dnld_v1_offset += nxpdev->fw_v1_sent_bytes;
+
+		/* The FW bin file is made up of many blocks of
+		 * 16 byte header and payload data chunks. If the
+		 * FW has requested a header, read the payload length
+		 * info from the header, before sending the header.
+		 * In the next iteration, the FW should request the
+		 * payload data chunk, which should be equal to the
+		 * payload length read from header. If there is a
+		 * mismatch, clearly the driver and FW are out of sync,
+		 * and we need to re-send the previous header again.
+		 */
+		if (requested_len == nxpdev->fw_v1_expected_len) {
+			if (requested_len == HDR_LEN)
+				nxpdev->fw_v1_expected_len = nxp_get_data_len(nxpdev->fw->data +
+									nxpdev->fw_dnld_v1_offset);
+			else
+				nxpdev->fw_v1_expected_len = HDR_LEN;
+		} else if (requested_len == HDR_LEN) {
+			/* FW download out of sync. Send previous chunk again */
+			nxpdev->fw_dnld_v1_offset -= nxpdev->fw_v1_sent_bytes;
+			nxpdev->fw_v1_expected_len = HDR_LEN;
+		}
+	}
+
+	if (nxpdev->fw_dnld_v1_offset + requested_len <= nxpdev->fw->size)
+		serdev_device_write_buf(nxpdev->serdev,
+					nxpdev->fw->data + nxpdev->fw_dnld_v1_offset,
+					requested_len);
+	nxpdev->fw_v1_sent_bytes = requested_len;
+
+free_skb:
+	kfree_skb(skb);
+	return 0;
+}
+
+static u8 *nxp_get_fw_name_from_chipid(struct hci_dev *hdev, u16 chipid)
+{
+	u8 *fw_name = NULL;
+
+	switch (chipid) {
+	case CHIP_ID_W9098:
+		fw_name = FIRMWARE_W9098;
+		break;
+	case CHIP_ID_IW416:
+		fw_name = FIRMWARE_IW416;
+		break;
+	case CHIP_ID_IW612:
+		fw_name = FIRMWARE_IW612;
+		break;
+	default:
+		bt_dev_err(hdev, "Unknown chip signature %04x", chipid);
+		break;
+	}
+	return fw_name;
+}
+
+static int nxp_recv_chip_ver_v3(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct v3_start_ind *req = skb_pull_data(skb, sizeof(struct v3_start_ind));
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+
+	if (!process_boot_signature(nxpdev))
+		goto free_skb;
+
+	if (!nxp_request_firmware(hdev, nxp_get_fw_name_from_chipid(hdev, req->chip_id)))
+		nxp_send_ack(NXP_ACK_V3, hdev);
+
+free_skb:
+	kfree_skb(skb);
+	return 0;
+}
+
+static int nxp_recv_fw_req_v3(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+	struct v3_data_req *req;
+
+	if (!process_boot_signature(nxpdev))
+		goto free_skb;
+
+	req = (struct v3_data_req *)skb_pull_data(skb, sizeof(struct v3_data_req));
+	if (!req || !nxpdev->fw)
+		goto free_skb;
+
+	nxp_send_ack(NXP_ACK_V3, hdev);
+
+	if (!nxpdev->timeout_changed) {
+		nxpdev->timeout_changed = nxp_fw_change_timeout(hdev, req->len);
+		goto free_skb;
+	}
+
+	if (!nxpdev->baudrate_changed) {
+		nxpdev->baudrate_changed = nxp_fw_change_baudrate(hdev, req->len);
+		if (nxpdev->baudrate_changed) {
+			serdev_device_set_baudrate(nxpdev->serdev,
+						   HCI_NXP_SEC_BAUDRATE);
+			serdev_device_set_flow_control(nxpdev->serdev, 1);
+			nxpdev->current_baudrate = HCI_NXP_SEC_BAUDRATE;
+		}
+		goto free_skb;
+	}
+
+	if (req->len == 0) {
+		bt_dev_dbg(hdev, "FW Downloaded Successfully: %zu bytes", nxpdev->fw->size);
+		clear_bit(BTNXPUART_FW_DOWNLOADING, &nxpdev->tx_state);
+		wake_up_interruptible(&nxpdev->fw_dnld_done_wait_q);
+		goto free_skb;
+	}
+	if (req->error)
+		bt_dev_dbg(hdev, "FW Download received err 0x%02x from chip", req->error);
+
+	if (req->offset < nxpdev->fw_v3_offset_correction) {
+		/* This scenario should ideally never occur. But if it ever does,
+		 * FW is out of sync and needs a power cycle.
+		 */
+		bt_dev_err(hdev, "Something went wrong during FW download. Please power cycle and try again");
+		goto free_skb;
+	}
+
+	serdev_device_write_buf(nxpdev->serdev,
+				nxpdev->fw->data + req->offset - nxpdev->fw_v3_offset_correction,
+				req->len);
+
+free_skb:
+	kfree_skb(skb);
+	return 0;
+}
+
+static int nxp_set_baudrate_cmd(struct hci_dev *hdev, void *data)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+	__le32 new_baudrate = __cpu_to_le32(nxpdev->new_baudrate);
+	struct ps_data *psdata = &nxpdev->psdata;
+	struct sk_buff *skb;
+	u8 *status;
+
+	if (!psdata)
+		return 0;
+
+	skb = nxp_drv_send_cmd(hdev, HCI_NXP_SET_OPER_SPEED, 4, (u8 *)&new_baudrate);
+	if (IS_ERR(skb)) {
+		bt_dev_err(hdev, "Setting baudrate failed (%ld)", PTR_ERR(skb));
+		return PTR_ERR(skb);
+	}
+
+	status = (u8 *)skb_pull_data(skb, 1);
+	if (status) {
+		if (*status == 0) {
+			serdev_device_set_baudrate(nxpdev->serdev, nxpdev->new_baudrate);
+			nxpdev->current_baudrate = nxpdev->new_baudrate;
+		}
+		bt_dev_dbg(hdev, "Set baudrate response: status=%d, baudrate=%d",
+			   *status, nxpdev->new_baudrate);
+	}
+	kfree_skb(skb);
+
+	return 0;
+}
+
+static int nxp_set_ind_reset(struct hci_dev *hdev, void *data)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+	struct sk_buff *skb;
+	u8 *status;
+	u8 pcmd = 0;
+	int err = 0;
+
+	skb = nxp_drv_send_cmd(hdev, HCI_NXP_IND_RESET, 1, &pcmd);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	status = skb_pull_data(skb, 1);
+	if (status) {
+		if (*status == 0) {
+			set_bit(BTNXPUART_FW_DOWNLOADING, &nxpdev->tx_state);
+			err = nxp_download_firmware(hdev);
+			if (err < 0)
+				goto free_skb;
+			serdev_device_set_baudrate(nxpdev->serdev, nxpdev->fw_init_baudrate);
+			nxpdev->current_baudrate = nxpdev->fw_init_baudrate;
+			hci_cmd_sync_queue(hdev, send_wakeup_method_cmd, NULL, NULL);
+			hci_cmd_sync_queue(hdev, send_ps_cmd, NULL, NULL);
+		}
+	}
+
+free_skb:
+	kfree_skb(skb);
+	return err;
+}
+
+/* NXP protocol */
+static int nxp_check_boot_sign(struct btnxpuart_dev *nxpdev)
+{
+	serdev_device_set_baudrate(nxpdev->serdev, HCI_NXP_PRI_BAUDRATE);
+	serdev_device_set_flow_control(nxpdev->serdev, 0);
+	set_bit(BTNXPUART_CHECK_BOOT_SIGNATURE, &nxpdev->tx_state);
+
+	return wait_event_interruptible_timeout(nxpdev->check_boot_sign_wait_q,
+					       !test_bit(BTNXPUART_CHECK_BOOT_SIGNATURE,
+							 &nxpdev->tx_state),
+					       msecs_to_jiffies(1000));
+}
+
+static int nxp_setup(struct hci_dev *hdev)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+	int err = 0;
+
+	set_bit(BTNXPUART_FW_DOWNLOADING, &nxpdev->tx_state);
+	init_waitqueue_head(&nxpdev->fw_dnld_done_wait_q);
+	init_waitqueue_head(&nxpdev->check_boot_sign_wait_q);
+
+	if (nxp_check_boot_sign(nxpdev)) {
+		bt_dev_dbg(hdev, "Need FW Download.");
+		err = nxp_download_firmware(hdev);
+		if (err < 0)
+			return err;
+	} else {
+		bt_dev_dbg(hdev, "FW already running.");
+		clear_bit(BTNXPUART_FW_DOWNLOADING, &nxpdev->tx_state);
+	}
+
+	serdev_device_set_flow_control(nxpdev->serdev, 1);
+	device_property_read_u32(&nxpdev->serdev->dev, "fw-init-baudrate",
+				 &nxpdev->fw_init_baudrate);
+	if (!nxpdev->fw_init_baudrate)
+		nxpdev->fw_init_baudrate = FW_INIT_BAUDRATE;
+	serdev_device_set_baudrate(nxpdev->serdev, nxpdev->fw_init_baudrate);
+	nxpdev->current_baudrate = nxpdev->fw_init_baudrate;
+
+	ps_init(hdev);
+
+	return 0;
+}
+
+static int nxp_enqueue(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+	struct ps_data *psdata = &nxpdev->psdata;
+	struct hci_command_hdr *hdr;
+	struct psmode_cmd_payload ps_parm;
+	struct wakeup_cmd_payload wakeup_parm;
+	__le32 baudrate_parm;
+
+	/* if vendor commands are received from user space (e.g. hcitool), update
+	 * driver flags accordingly and ask driver to re-send the command to FW.
+	 * In case the payload for any command does not match expected payload
+	 * length, let the firmware and user space program handle it, or throw
+	 * an error.
+	 */
+	if (bt_cb(skb)->pkt_type == HCI_COMMAND_PKT && !psdata->driver_sent_cmd) {
+		hdr = (struct hci_command_hdr *)skb->data;
+		if (hdr->plen != (skb->len - HCI_COMMAND_HDR_SIZE))
+			goto send_skb;
+
+		switch (__le16_to_cpu(hdr->opcode)) {
+		case HCI_NXP_AUTO_SLEEP_MODE:
+			if (hdr->plen == sizeof(ps_parm)) {
+				memcpy(&ps_parm, skb->data + HCI_COMMAND_HDR_SIZE, hdr->plen);
+				if (ps_parm.ps_cmd == BT_PS_ENABLE)
+					psdata->target_ps_mode = PS_MODE_ENABLE;
+				else if (ps_parm.ps_cmd == BT_PS_DISABLE)
+					psdata->target_ps_mode = PS_MODE_DISABLE;
+				psdata->c2h_ps_interval = __le16_to_cpu(ps_parm.c2h_ps_interval);
+				hci_cmd_sync_queue(hdev, send_ps_cmd, NULL, NULL);
+				goto free_skb;
+			}
+			break;
+		case HCI_NXP_WAKEUP_METHOD:
+			if (hdr->plen == sizeof(wakeup_parm)) {
+				memcpy(&wakeup_parm, skb->data + HCI_COMMAND_HDR_SIZE, hdr->plen);
+				psdata->c2h_wakeupmode = wakeup_parm.c2h_wakeupmode;
+				psdata->c2h_wakeup_gpio = wakeup_parm.c2h_wakeup_gpio;
+				psdata->h2c_wakeup_gpio = wakeup_parm.h2c_wakeup_gpio;
+				switch (wakeup_parm.h2c_wakeupmode) {
+				case BT_CTRL_WAKEUP_METHOD_DSR:
+					psdata->h2c_wakeupmode = WAKEUP_METHOD_DTR;
+					break;
+				case BT_CTRL_WAKEUP_METHOD_BREAK:
+				default:
+					psdata->h2c_wakeupmode = WAKEUP_METHOD_BREAK;
+					break;
+				}
+				hci_cmd_sync_queue(hdev, send_wakeup_method_cmd, NULL, NULL);
+				goto free_skb;
+			}
+			break;
+		case HCI_NXP_SET_OPER_SPEED:
+			if (hdr->plen == sizeof(baudrate_parm)) {
+				memcpy(&baudrate_parm, skb->data + HCI_COMMAND_HDR_SIZE, hdr->plen);
+				nxpdev->new_baudrate = __le32_to_cpu(baudrate_parm);
+				hci_cmd_sync_queue(hdev, nxp_set_baudrate_cmd, NULL, NULL);
+				goto free_skb;
+			}
+			break;
+		case HCI_NXP_IND_RESET:
+			if (hdr->plen == 1) {
+				hci_cmd_sync_queue(hdev, nxp_set_ind_reset, NULL, NULL);
+				goto free_skb;
+			}
+			break;
+		default:
+			break;
+		}
+	}
+
+send_skb:
+	/* Prepend skb with frame type */
+	memcpy(skb_push(skb, 1), &hci_skb_pkt_type(skb), 1);
+	skb_queue_tail(&nxpdev->txq, skb);
+
+	btnxpuart_tx_wakeup(nxpdev);
+ret:
+	return 0;
+
+free_skb:
+	kfree_skb(skb);
+	goto ret;
+}
+
+static struct sk_buff *nxp_dequeue(void *data)
+{
+	struct btnxpuart_dev *nxpdev = (struct btnxpuart_dev *)data;
+
+	ps_wakeup(nxpdev);
+	ps_start_timer(nxpdev);
+	return skb_dequeue(&nxpdev->txq);
+}
+
+/* btnxpuart based on serdev */
+static void btnxpuart_tx_work(struct work_struct *work)
+{
+	struct btnxpuart_dev *nxpdev = container_of(work, struct btnxpuart_dev,
+						   tx_work);
+	struct serdev_device *serdev = nxpdev->serdev;
+	struct hci_dev *hdev = nxpdev->hdev;
+	struct sk_buff *skb;
+	int len;
+
+	while ((skb = nxp_dequeue(nxpdev))) {
+		len = serdev_device_write_buf(serdev, skb->data, skb->len);
+		hdev->stat.byte_tx += len;
+
+		skb_pull(skb, len);
+		if (skb->len > 0) {
+			skb_queue_head(&nxpdev->txq, skb);
+			break;
+		}
+
+		switch (hci_skb_pkt_type(skb)) {
+		case HCI_COMMAND_PKT:
+			hdev->stat.cmd_tx++;
+			break;
+		case HCI_ACLDATA_PKT:
+			hdev->stat.acl_tx++;
+			break;
+		case HCI_SCODATA_PKT:
+			hdev->stat.sco_tx++;
+			break;
+		}
+
+		kfree_skb(skb);
+	}
+	clear_bit(BTNXPUART_TX_STATE_ACTIVE, &nxpdev->tx_state);
+}
+
+static int btnxpuart_open(struct hci_dev *hdev)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+	int err = 0;
+
+	err = serdev_device_open(nxpdev->serdev);
+	if (err) {
+		bt_dev_err(hdev, "Unable to open UART device %s",
+			   dev_name(&nxpdev->serdev->dev));
+	} else {
+		set_bit(BTNXPUART_SERDEV_OPEN, &nxpdev->tx_state);
+	}
+	return err;
+}
+
+static int btnxpuart_close(struct hci_dev *hdev)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+
+	serdev_device_close(nxpdev->serdev);
+	clear_bit(BTNXPUART_SERDEV_OPEN, &nxpdev->tx_state);
+	return 0;
+}
+
+static int btnxpuart_flush(struct hci_dev *hdev)
+{
+	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
+
+	/* Flush any pending characters */
+	serdev_device_write_flush(nxpdev->serdev);
+	skb_queue_purge(&nxpdev->txq);
+
+	cancel_work_sync(&nxpdev->tx_work);
+
+	kfree_skb(nxpdev->rx_skb);
+	nxpdev->rx_skb = NULL;
+
+	return 0;
+}
+
+static const struct h4_recv_pkt nxp_recv_pkts[] = {
+	{ H4_RECV_ACL,          .recv = hci_recv_frame },
+	{ H4_RECV_SCO,          .recv = hci_recv_frame },
+	{ H4_RECV_EVENT,        .recv = hci_recv_frame },
+	{ NXP_RECV_FW_REQ_V1,   .recv = nxp_recv_fw_req_v1 },
+	{ NXP_RECV_CHIP_VER_V3, .recv = nxp_recv_chip_ver_v3 },
+	{ NXP_RECV_FW_REQ_V3,   .recv = nxp_recv_fw_req_v3 },
+};
+
+static bool is_valid_bootloader_signature(const u8 *data, size_t count)
+{
+	if ((*data == NXP_V1_FW_REQ_PKT && count == sizeof(struct v1_data_req) + 1) ||
+	    (*data == NXP_V3_FW_REQ_PKT && count == sizeof(struct v3_data_req) + 1) ||
+	    (*data == NXP_V3_CHIP_VER_PKT && count == sizeof(struct v3_start_ind) + 1))
+		return true;
+	else
+		return false;
+}
+
+static int btnxpuart_receive_buf(struct serdev_device *serdev, const u8 *data,
+				 size_t count)
+{
+	struct btnxpuart_dev *nxpdev = serdev_device_get_drvdata(serdev);
+
+	if (is_fw_downloading(nxpdev) && !is_valid_bootloader_signature(data, count)) {
+		/* Unknown bootloader signature, skip without returning error */
+		return count;
+	}
+
+	ps_start_timer(nxpdev);
+
+	nxpdev->rx_skb = h4_recv_buf(nxpdev->hdev, nxpdev->rx_skb, data, count,
+				     nxp_recv_pkts, ARRAY_SIZE(nxp_recv_pkts));
+	if (IS_ERR(nxpdev->rx_skb)) {
+		int err = PTR_ERR(nxpdev->rx_skb);
+
+		bt_dev_err(nxpdev->hdev, "Frame reassembly failed (%d)", err);
+		nxpdev->rx_skb = NULL;
+		return err;
+	}
+	nxpdev->hdev->stat.byte_rx += count;
+	return count;
+}
+
+static void btnxpuart_write_wakeup(struct serdev_device *serdev)
+{
+	serdev_device_write_wakeup(serdev);
+}
+
+static const struct serdev_device_ops btnxpuart_client_ops = {
+	.receive_buf = btnxpuart_receive_buf,
+	.write_wakeup = btnxpuart_write_wakeup,
+};
+
+static int nxp_serdev_probe(struct serdev_device *serdev)
+{
+	struct hci_dev *hdev;
+	struct btnxpuart_dev *nxpdev;
+
+	nxpdev = devm_kzalloc(&serdev->dev, sizeof(*nxpdev), GFP_KERNEL);
+	if (!nxpdev)
+		return -ENOMEM;
+
+	nxpdev->nxp_data = (struct btnxpuart_data *)device_get_match_data(&serdev->dev);
+
+	nxpdev->serdev = serdev;
+	serdev_device_set_drvdata(serdev, nxpdev);
+
+	serdev_device_set_client_ops(serdev, &btnxpuart_client_ops);
+
+	INIT_WORK(&nxpdev->tx_work, btnxpuart_tx_work);
+	skb_queue_head_init(&nxpdev->txq);
+
+	crc8_populate_msb(crc8_table, POLYNOMIAL8);
+
+	/* Initialize and register HCI device */
+	hdev = hci_alloc_dev();
+	if (!hdev) {
+		dev_err(&serdev->dev, "Can't allocate HCI device\n");
+		return -ENOMEM;
+	}
+
+	nxpdev->hdev = hdev;
+
+	hdev->bus = HCI_UART;
+	hci_set_drvdata(hdev, nxpdev);
+
+	hdev->manufacturer = MANUFACTURER_NXP;
+	hdev->open  = btnxpuart_open;
+	hdev->close = btnxpuart_close;
+	hdev->flush = btnxpuart_flush;
+	hdev->setup = nxp_setup;
+	hdev->send  = nxp_enqueue;
+	SET_HCIDEV_DEV(hdev, &serdev->dev);
+
+	if (hci_register_dev(hdev) < 0) {
+		dev_err(&serdev->dev, "Can't register HCI device\n");
+		hci_free_dev(hdev);
+		return -ENODEV;
+	}
+
+	ps_init_work(hdev);
+	ps_init_timer(hdev);
+
+	return 0;
+}
+
+static void nxp_serdev_remove(struct serdev_device *serdev)
+{
+	struct btnxpuart_dev *nxpdev = serdev_device_get_drvdata(serdev);
+	struct hci_dev *hdev = nxpdev->hdev;
+
+	/* Restore FW baudrate to fw_init_baudrate if changed.
+	 * This will ensure FW baudrate is in sync with
+	 * driver baudrate in case this driver is re-inserted.
+	 */
+	if (nxpdev->current_baudrate != nxpdev->fw_init_baudrate) {
+		nxpdev->new_baudrate = nxpdev->fw_init_baudrate;
+		nxp_set_baudrate_cmd(hdev, NULL);
+	}
+
+	ps_cancel_timer(nxpdev);
+	hci_unregister_dev(hdev);
+	hci_free_dev(hdev);
+}
+
+static struct btnxpuart_data w8987_data = {
+	.fw_dnld_use_high_baudrate = true,
+	.fw_name = FIRMWARE_W8987,
+};
+
+static struct btnxpuart_data w8997_data = {
+	.fw_dnld_use_high_baudrate = false,
+	.fw_name = FIRMWARE_W8997,
+};
+
+static const struct of_device_id nxpuart_of_match_table[] = {
+	{ .compatible = "nxp,88w8987-bt", .data = &w8987_data },
+	{ .compatible = "nxp,88w8997-bt", .data = &w8997_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nxpuart_of_match_table);
+
+static struct serdev_device_driver nxp_serdev_driver = {
+	.probe = nxp_serdev_probe,
+	.remove = nxp_serdev_remove,
+	.driver = {
+		.name = "btnxpuart",
+		.of_match_table = of_match_ptr(nxpuart_of_match_table),
+	},
+};
+
+module_serdev_device_driver(nxp_serdev_driver);
+
+MODULE_AUTHOR("Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>");
+MODULE_DESCRIPTION("NXP Bluetooth Serial driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

