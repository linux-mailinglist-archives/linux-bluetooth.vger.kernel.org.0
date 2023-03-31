Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98DBF6D241D
	for <lists+linux-bluetooth@lfdr.de>; Fri, 31 Mar 2023 17:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232478AbjCaPia (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 31 Mar 2023 11:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjCaPi3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 31 Mar 2023 11:38:29 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2058.outbound.protection.outlook.com [40.107.249.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3BC21E718
        for <linux-bluetooth@vger.kernel.org>; Fri, 31 Mar 2023 08:38:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cb/jswKyNrYWMBGwIgA2yPDb0Aht6lx+drn1PaQBR5qoqsD+/jesHWpC8G1JScwzlWnkKpO6l3Yt3u8gop1ZvG48IEj5qKY1T2TfYJ2xA8OSeew5lOf8Kaapm05c/Rw9W5Pa7gyjtDx1wfw0nmh/WKuSGjXtwxE3ZffSJeuLrclL7SgZZrGAs3S8Kwsy7zef6E1bCuIT4/gyBAf44DiZG7AJ29QGFG4xAt5zQY99xe4CEfkk+LTLUZBrHxZOMUxAZfo6/8NvyXfEj7JEV37TiglaAVEb46rjesOgNh9q+lsIw6E6vxvks2pDbpc4Ozaevp0+W0QwWcPWJRgiNBQrxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWV59iNof3RIxDGA3ejgdbMwg36Hme6YXwKuR3l8aSA=;
 b=HM3klPDrJ+KxzWzycXXfTiXcl0t4RmnnaRIZkMiaJz5LoqvHwQnIGjATYGvJBNsWy9awsteVklCdRo7KZ6gFe2lTVkA7DUJI0YOemQJKxuaR1zpI4/BPdwckTzK7e1o4G0Av+KR+pIa7R9hTTfTRXmz6xdQ6DWvINDGgRVGOpKR4bWLkuBYTfo4HJh/iTwH4IxcRTxYky7Bbzfpa5ZxoxjjiudK/bTi4XrxUecpX6tbmAd+zSk7qVI88OQnk4dLFyMcnppvZCN+mXY/kJDwodRa5QtiGvUOgwAEI3OKNjwwzG//QlUVO+Q509R894ftPKRB9NWwn+brnTmuTW4P4VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWV59iNof3RIxDGA3ejgdbMwg36Hme6YXwKuR3l8aSA=;
 b=WIs8U11DWM9eCbbCi9BLZURFn1xgbUIk1Xnyr8mI/fe70uD7Bmr35aaWezAhPbJE5ZtPJtmItCR9UqHJvM+m+cOxD+Rttaig17j6IhmmxZ0wFKoYkxfr9plTyAL//E7LAtA/Xo4rZD2hSM1nMaDYTMocQ8cS9ev8/UA2qJoOf7w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8898.eurprd04.prod.outlook.com (2603:10a6:20b:42d::15)
 by PAXPR04MB9399.eurprd04.prod.outlook.com (2603:10a6:102:2b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Fri, 31 Mar
 2023 15:38:20 +0000
Received: from AS8PR04MB8898.eurprd04.prod.outlook.com
 ([fe80::afb8:bb33:948f:d1e1]) by AS8PR04MB8898.eurprd04.prod.outlook.com
 ([fe80::afb8:bb33:948f:d1e1%9]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 15:38:20 +0000
From:   Iulia Tanasescu <iulia.tanasescu@nxp.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Iulia Tanasescu <iulia.tanasescu@nxp.com>
Subject: [PATCH v3 1/1] Bluetooth: Split bt_iso_qos into dedicated structures
Date:   Fri, 31 Mar 2023 18:38:01 +0300
Message-Id: <20230331153801.35290-2-iulia.tanasescu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331153801.35290-1-iulia.tanasescu@nxp.com>
References: <20230331153801.35290-1-iulia.tanasescu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0018.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::13) To AS8PR04MB8898.eurprd04.prod.outlook.com
 (2603:10a6:20b:42d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8898:EE_|PAXPR04MB9399:EE_
X-MS-Office365-Filtering-Correlation-Id: c98b9641-eeb9-4ae4-2df4-08db31fdf440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kc2vbc8vkO86YdhKVVLOFR1nurs5rcLCTUBJLXvBMJ88alKfZ0sqYKRd4/7EnMWg2Z5SnTaU5D4kV81mfnVhmIPDBeGdLcNyvbD6fuBjpig2eX5ZSYQhVEUlYf7vnw9GRHyPk+wtN2xE11xn6sMou9pnFqi7A/Ab4E95Fx8OJt+1/r4IHzOHu9llA1lgN8POCtlRV5zzIu49UNIqg+GZaoX+jzj5Vk+lXW4lgswEXxOabaY+aX6uZgrW+7x5BNhbDxe/8xFk6bf8TDkT4cO5J75d9r2Qr5zL3eQIMgfLS3hkUaJz6X9vX/8v5vkxWdpoSzQGVuyU/LFOYir2WBil4Q7R27wD1sgVZ2DkyH/mKP8XGtSCcxdHXGVBBDtJRUqYC5PvG4K591subtZUxrUXcV4LEMO3yz99SM7l5ilOWpzRTst7ZSvGxYvbDjdy7kqodOiuTGY6ychPATVj+QNTXBt5VZvUPKZVoai5zGBwlM7Ww1bZBZbvjvbnffUMMCbMasdx7Wwl/3JrOCBbogddfeV8Dp34sQnuvwi7EQ89aYWJpuB6helPVcFm97nz4kaJnuSauTSdfStsRrOwhAurCYCpnwCYOkyEdM4Kc3TGLtZvGprBncjjnn1j0VILYFHt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8898.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(451199021)(2616005)(52116002)(6486002)(6512007)(26005)(36756003)(478600001)(6506007)(1076003)(55236004)(186003)(6666004)(41300700001)(6916009)(66476007)(66556008)(4326008)(8676002)(44832011)(5660300002)(38100700002)(8936002)(30864003)(316002)(83380400001)(86362001)(66946007)(2906002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Umn9j0tt8uSJeMm2MAQ4CTpOD62QPpDbNgo3pZEQwdAB6/qHRAYDPzFkYtlk?=
 =?us-ascii?Q?T2DZGsPX7GUEb5PoKssNQTdgyyQCOI1sLt87xmA0lp84S2IeF244kwOtbZ0p?=
 =?us-ascii?Q?pchuVsex3VywQNmKu9S8xQTjp+lVVEsAQ0+VAx/ZLA4hTddQWjk/T85yStHq?=
 =?us-ascii?Q?5OQ0+qqX0U2WVa37t/FBOCLlZtW6T2LUOXXzs25p88zq7qM//mwzdvEK0SB4?=
 =?us-ascii?Q?YMYuBwtvZktquTfpC//effwT6gKla8YCHNxPOh2MiZ/9hykT4b4Iym/TXHNN?=
 =?us-ascii?Q?7jeobtXxW9lUDFv7mBHIUGXVEFGRj4KTZ8eiYWrY4AiJ0EgEKha+9qGnv7bQ?=
 =?us-ascii?Q?AtBDypHo2LWlG45IRGNLUwG1hXZ1WmHX93/Q9uKLFd2zYnE6qn0VHMDof2Gi?=
 =?us-ascii?Q?zqL26jt37bCBE9qbRkq+U3epRHtRyISw9mwEbd0593HlXeoI8DECkGnpzWkD?=
 =?us-ascii?Q?CP7typbaqACMI7tyJUQLQL1qMyfM/IMvbb3QY68nvTbG0tygkgT0wcfJGdHa?=
 =?us-ascii?Q?X/KPKZhYe/hdIv0FgfUy1QMiD/xqVt5O4VAMAhXgbpEygfpS9FSL/6YstJ8d?=
 =?us-ascii?Q?iOACE5ML0Vc400MhNc+zmNA9aaQloimqSSn4thDZygV2lyZwjcNjEyhqdXAW?=
 =?us-ascii?Q?6zXdqosJQPm5fhOjENFsFL6xwt2qpsuEU19rc780/MsqWr0Lh84DB2GWcIIL?=
 =?us-ascii?Q?UmsrwfijryAFhkgxxhKSTDrTpV9ErNktE8parQItlszXkqQauMo7Np61v/R1?=
 =?us-ascii?Q?6IiNmwuL0gB9oFwHwKVqbj+q1eIuD8ZMrEzc8F+oD6zjnjCt3EUKe1VYQxho?=
 =?us-ascii?Q?SIhuwvNLxKVNjs3pzKyJey2H5RGJd2x7OVpPsP8Lde5/YVGbPs/kSEzddlfK?=
 =?us-ascii?Q?/nBJIHxBkPb7MTpQkr3M8RFoo/PlD51CdobekFrD7zuP4IbCu8gEEMTkf9iz?=
 =?us-ascii?Q?pJ3pfhgCnX24Y1GAHgjKuDkDqkcB4ifiEpKP62e6er9Kxki1+iepboInVN01?=
 =?us-ascii?Q?lezwtaw5a8y8vuBxdchJ4Cu30rbzBU2SA9ucYiNpXAdu0IhsDQm8YXLLDM3H?=
 =?us-ascii?Q?yNdP01XS3wVEeTnkN0RC4eMu5fKT1iqMPG7oRBKNvcbBIf41pBl/lDfrpGt+?=
 =?us-ascii?Q?DMb1wEo8OyQYB9nWKLowqdddFCfpTmsSzpa3G0vkgPhUUC//HWQZIm4n1M1n?=
 =?us-ascii?Q?FliN0dE+WN/K29e3Lk70YUVruG46azzf4cq8dsDac/iuanvHp4T+8o6ibjRs?=
 =?us-ascii?Q?zzlNezkSG76wh49AiEOgT8jsr0w8twk2HJofzXlgfXIXoPQw16/zqoN+eiex?=
 =?us-ascii?Q?eQdn4CBoTpEml9t2z7RJp1LFCHKRhJ+p6HOvkuMg9IaPhYEZ9g0TdF8+o1ef?=
 =?us-ascii?Q?hzPdREzTb8hX0MTNe+HMPCFU+XhRPOBefGUWrBEgCD3KPfHrpzJpkXuS9E6v?=
 =?us-ascii?Q?145iNZ2p1/nST4mwKQ08UBAcTQ7cZGb79gflGOikm4dmfXQxRILXrky7TRCt?=
 =?us-ascii?Q?0ZqP++Bgtrk8lEddKuwqEbkNsCsOn8CQc22TL4SQFT41i8ZqCbH4fpbLoVTo?=
 =?us-ascii?Q?2yUARELvos+6hBbDrPQORHm/reFy8/wZn/RE7RYc4Tp5ncBrpz1+3eF8q0gn?=
 =?us-ascii?Q?aA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c98b9641-eeb9-4ae4-2df4-08db31fdf440
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8898.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 15:38:20.0165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: duz331kYbz5lD1+wvBq3pmbnyoKDdMhWGuuAUvnKjVKFftD1h6VpK7Q/7F2+/VzRgyrQHC1wPQbaCGM7i8Q5Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9399
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Split bt_iso_qos into dedicated unicast and broadcast
structures and add additional broadcast parameters.

Signed-off-by: Iulia Tanasescu <iulia.tanasescu@nxp.com>
---
 include/net/bluetooth/bluetooth.h |  43 +++++---
 include/net/bluetooth/hci_core.h  |   9 +-
 net/bluetooth/hci_conn.c          | 162 ++++++++++++++++--------------
 net/bluetooth/hci_event.c         |  33 +++---
 net/bluetooth/iso.c               | 125 ++++++++++++++++++-----
 5 files changed, 237 insertions(+), 135 deletions(-)

diff --git a/include/net/bluetooth/bluetooth.h b/include/net/bluetooth/bluetooth.h
index bcc5a4cd2c17..1b4230cd42a3 100644
--- a/include/net/bluetooth/bluetooth.h
+++ b/include/net/bluetooth/bluetooth.h
@@ -1,6 +1,7 @@
 /*
    BlueZ - Bluetooth protocol stack for Linux
    Copyright (C) 2000-2001 Qualcomm Incorporated
+   Copyright 2023 NXP
 
    Written 2000,2001 by Maxim Krasnyansky <maxk@qualcomm.com>
 
@@ -171,23 +172,39 @@ struct bt_iso_io_qos {
 	__u8  rtn;
 };
 
-struct bt_iso_qos {
-	union {
-		__u8  cig;
-		__u8  big;
-	};
-	union {
-		__u8  cis;
-		__u8  bis;
-	};
-	union {
-		__u8  sca;
-		__u8  sync_interval;
-	};
+struct bt_iso_ucast_qos {
+	__u8  cig;
+	__u8  cis;
+	__u8  sca;
+	__u8  packing;
+	__u8  framing;
+	struct bt_iso_io_qos in;
+	struct bt_iso_io_qos out;
+};
+
+struct bt_iso_bcast_qos {
+	__u8  big;
+	__u8  bis;
+	__u8  sync_interval;
 	__u8  packing;
 	__u8  framing;
 	struct bt_iso_io_qos in;
 	struct bt_iso_io_qos out;
+	__u8  encryption;
+	__u8  bcode[16];
+	__u8  options;
+	__u16 skip;
+	__u16 sync_timeout;
+	__u8  sync_cte_type;
+	__u8  mse;
+	__u16 timeout;
+};
+
+struct bt_iso_qos {
+	union {
+		struct bt_iso_ucast_qos ucast;
+		struct bt_iso_bcast_qos bcast;
+	};
 };
 
 #define BT_ISO_PHY_1M		0x01
diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index e22e45fbe8db..a17123d5a579 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -1,6 +1,7 @@
 /*
    BlueZ - Bluetooth protocol stack for Linux
    Copyright (c) 2000-2001, 2010, Code Aurora Forum. All rights reserved.
+   Copyright 2023 NXP
 
    Written 2000,2001 by Maxim Krasnyansky <maxk@qualcomm.com>
 
@@ -1091,7 +1092,7 @@ static inline struct hci_conn *hci_conn_hash_lookup_bis(struct hci_dev *hdev,
 		if (bacmp(&c->dst, ba) || c->type != ISO_LINK)
 			continue;
 
-		if (c->iso_qos.big == big && c->iso_qos.bis == bis) {
+		if (c->iso_qos.bcast.big == big && c->iso_qos.bcast.bis == bis) {
 			rcu_read_unlock();
 			return c;
 		}
@@ -1200,7 +1201,7 @@ static inline struct hci_conn *hci_conn_hash_lookup_cig(struct hci_dev *hdev,
 		if (c->type != ISO_LINK)
 			continue;
 
-		if (handle == c->iso_qos.cig) {
+		if (handle == c->iso_qos.ucast.cig) {
 			rcu_read_unlock();
 			return c;
 		}
@@ -1223,7 +1224,7 @@ static inline struct hci_conn *hci_conn_hash_lookup_big(struct hci_dev *hdev,
 		if (bacmp(&c->dst, BDADDR_ANY) || c->type != ISO_LINK)
 			continue;
 
-		if (handle == c->iso_qos.big) {
+		if (handle == c->iso_qos.bcast.big) {
 			rcu_read_unlock();
 			return c;
 		}
@@ -1332,7 +1333,7 @@ struct hci_conn *hci_connect_bis(struct hci_dev *hdev, bdaddr_t *dst,
 				 __u8 dst_type, struct bt_iso_qos *qos,
 				 __u8 data_len, __u8 *data);
 int hci_pa_create_sync(struct hci_dev *hdev, bdaddr_t *dst, __u8 dst_type,
-		       __u8 sid);
+		       __u8 sid, struct bt_iso_qos *qos);
 int hci_le_big_create_sync(struct hci_dev *hdev, struct bt_iso_qos *qos,
 			   __u16 sync_handle, __u8 num_bis, __u8 bis[]);
 int hci_conn_check_link_mode(struct hci_conn *conn);
diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index e4aee5950c36..fe8d54f8f04f 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -1,6 +1,7 @@
 /*
    BlueZ - Bluetooth protocol stack for Linux
    Copyright (c) 2000-2001, 2010, Code Aurora Forum. All rights reserved.
+   Copyright 2023 NXP
 
    Written 2000,2001 by Maxim Krasnyansky <maxk@qualcomm.com>
 
@@ -795,8 +796,8 @@ static void bis_list(struct hci_conn *conn, void *data)
 	if (bacmp(&conn->dst, BDADDR_ANY))
 		return;
 
-	if (d->big != conn->iso_qos.big || d->bis == BT_ISO_QOS_BIS_UNSET ||
-	    d->bis != conn->iso_qos.bis)
+	if (d->big != conn->iso_qos.bcast.big || d->bis == BT_ISO_QOS_BIS_UNSET ||
+	    d->bis != conn->iso_qos.bcast.bis)
 		return;
 
 	d->count++;
@@ -916,10 +917,10 @@ static void bis_cleanup(struct hci_conn *conn)
 		if (!test_and_clear_bit(HCI_CONN_PER_ADV, &conn->flags))
 			return;
 
-		hci_le_terminate_big(hdev, conn->iso_qos.big,
-				     conn->iso_qos.bis);
+		hci_le_terminate_big(hdev, conn->iso_qos.bcast.big,
+				     conn->iso_qos.bcast.bis);
 	} else {
-		hci_le_big_terminate(hdev, conn->iso_qos.big,
+		hci_le_big_terminate(hdev, conn->iso_qos.bcast.big,
 				     conn->sync_handle);
 	}
 }
@@ -959,7 +960,7 @@ static void cis_cleanup(struct hci_conn *conn)
 	struct iso_list_data d;
 
 	memset(&d, 0, sizeof(d));
-	d.cig = conn->iso_qos.cig;
+	d.cig = conn->iso_qos.ucast.cig;
 
 	/* Check if ISO connection is a CIS and remove CIG if there are
 	 * no other connections using it.
@@ -968,7 +969,7 @@ static void cis_cleanup(struct hci_conn *conn)
 	if (d.count)
 		return;
 
-	hci_le_remove_cig(hdev, conn->iso_qos.cig);
+	hci_le_remove_cig(hdev, conn->iso_qos.ucast.cig);
 }
 
 struct hci_conn *hci_conn_add(struct hci_dev *hdev, int type, bdaddr_t *dst,
@@ -1399,7 +1400,7 @@ static int qos_set_big(struct hci_dev *hdev, struct bt_iso_qos *qos)
 	struct iso_list_data data;
 
 	/* Allocate a BIG if not set */
-	if (qos->big == BT_ISO_QOS_BIG_UNSET) {
+	if (qos->bcast.big == BT_ISO_QOS_BIG_UNSET) {
 		for (data.big = 0x00; data.big < 0xef; data.big++) {
 			data.count = 0;
 			data.bis = 0xff;
@@ -1414,7 +1415,7 @@ static int qos_set_big(struct hci_dev *hdev, struct bt_iso_qos *qos)
 			return -EADDRNOTAVAIL;
 
 		/* Update BIG */
-		qos->big = data.big;
+		qos->bcast.big = data.big;
 	}
 
 	return 0;
@@ -1425,7 +1426,7 @@ static int qos_set_bis(struct hci_dev *hdev, struct bt_iso_qos *qos)
 	struct iso_list_data data;
 
 	/* Allocate BIS if not set */
-	if (qos->bis == BT_ISO_QOS_BIS_UNSET) {
+	if (qos->bcast.bis == BT_ISO_QOS_BIS_UNSET) {
 		/* Find an unused adv set to advertise BIS, skip instance 0x00
 		 * since it is reserved as general purpose set.
 		 */
@@ -1443,7 +1444,7 @@ static int qos_set_bis(struct hci_dev *hdev, struct bt_iso_qos *qos)
 			return -EADDRNOTAVAIL;
 
 		/* Update BIS */
-		qos->bis = data.bis;
+		qos->bcast.bis = data.bis;
 	}
 
 	return 0;
@@ -1472,8 +1473,8 @@ static struct hci_conn *hci_add_bis(struct hci_dev *hdev, bdaddr_t *dst,
 	if (err)
 		return ERR_PTR(err);
 
-	data.big = qos->big;
-	data.bis = qos->bis;
+	data.big = qos->bcast.big;
+	data.bis = qos->bcast.bis;
 	data.count = 0;
 
 	/* Check if there is already a matching BIG/BIS */
@@ -1481,7 +1482,7 @@ static struct hci_conn *hci_add_bis(struct hci_dev *hdev, bdaddr_t *dst,
 	if (data.count)
 		return ERR_PTR(-EADDRINUSE);
 
-	conn = hci_conn_hash_lookup_bis(hdev, dst, qos->big, qos->bis);
+	conn = hci_conn_hash_lookup_bis(hdev, dst, qos->bcast.big, qos->bcast.bis);
 	if (conn)
 		return ERR_PTR(-EADDRINUSE);
 
@@ -1636,13 +1637,13 @@ static void cis_add(struct iso_list_data *d, struct bt_iso_qos *qos)
 {
 	struct hci_cis_params *cis = &d->pdu.cis[d->pdu.cp.num_cis];
 
-	cis->cis_id = qos->cis;
-	cis->c_sdu  = cpu_to_le16(qos->out.sdu);
-	cis->p_sdu  = cpu_to_le16(qos->in.sdu);
-	cis->c_phy  = qos->out.phy ? qos->out.phy : qos->in.phy;
-	cis->p_phy  = qos->in.phy ? qos->in.phy : qos->out.phy;
-	cis->c_rtn  = qos->out.rtn;
-	cis->p_rtn  = qos->in.rtn;
+	cis->cis_id = qos->ucast.cis;
+	cis->c_sdu  = cpu_to_le16(qos->ucast.out.sdu);
+	cis->p_sdu  = cpu_to_le16(qos->ucast.in.sdu);
+	cis->c_phy  = qos->ucast.out.phy ? qos->ucast.out.phy : qos->ucast.in.phy;
+	cis->p_phy  = qos->ucast.in.phy ? qos->ucast.in.phy : qos->ucast.out.phy;
+	cis->c_rtn  = qos->ucast.out.rtn;
+	cis->p_rtn  = qos->ucast.in.rtn;
 
 	d->pdu.cp.num_cis++;
 }
@@ -1655,8 +1656,8 @@ static void cis_list(struct hci_conn *conn, void *data)
 	if (!bacmp(&conn->dst, BDADDR_ANY))
 		return;
 
-	if (d->cig != conn->iso_qos.cig || d->cis == BT_ISO_QOS_CIS_UNSET ||
-	    d->cis != conn->iso_qos.cis)
+	if (d->cig != conn->iso_qos.ucast.cig || d->cis == BT_ISO_QOS_CIS_UNSET ||
+	    d->cis != conn->iso_qos.ucast.cis)
 		return;
 
 	d->count++;
@@ -1675,17 +1676,18 @@ static int hci_le_create_big(struct hci_conn *conn, struct bt_iso_qos *qos)
 
 	memset(&cp, 0, sizeof(cp));
 
-	cp.handle = qos->big;
-	cp.adv_handle = qos->bis;
+	cp.handle = qos->bcast.big;
+	cp.adv_handle = qos->bcast.bis;
 	cp.num_bis  = 0x01;
-	hci_cpu_to_le24(qos->out.interval, cp.bis.sdu_interval);
-	cp.bis.sdu = cpu_to_le16(qos->out.sdu);
-	cp.bis.latency =  cpu_to_le16(qos->out.latency);
-	cp.bis.rtn  = qos->out.rtn;
-	cp.bis.phy  = qos->out.phy;
-	cp.bis.packing = qos->packing;
-	cp.bis.framing = qos->framing;
-	cp.bis.encryption = 0x00;
+	hci_cpu_to_le24(qos->bcast.out.interval, cp.bis.sdu_interval);
+	cp.bis.sdu = cpu_to_le16(qos->bcast.out.sdu);
+	cp.bis.latency =  cpu_to_le16(qos->bcast.out.latency);
+	cp.bis.rtn  = qos->bcast.out.rtn;
+	cp.bis.phy  = qos->bcast.out.phy;
+	cp.bis.packing = qos->bcast.packing;
+	cp.bis.framing = qos->bcast.framing;
+	cp.bis.encryption = qos->bcast.encryption;
+	memcpy(cp.bis.bcode, qos->bcast.bcode, sizeof(cp.bis.bcode));
 	memset(&cp.bis.bcode, 0, sizeof(cp.bis.bcode));
 
 	return hci_send_cmd(hdev, HCI_OP_LE_CREATE_BIG, sizeof(cp), &cp);
@@ -1699,7 +1701,7 @@ static bool hci_le_set_cig_params(struct hci_conn *conn, struct bt_iso_qos *qos)
 	memset(&data, 0, sizeof(data));
 
 	/* Allocate a CIG if not set */
-	if (qos->cig == BT_ISO_QOS_CIG_UNSET) {
+	if (qos->ucast.cig == BT_ISO_QOS_CIG_UNSET) {
 		for (data.cig = 0x00; data.cig < 0xff; data.cig++) {
 			data.count = 0;
 			data.cis = 0xff;
@@ -1719,22 +1721,22 @@ static bool hci_le_set_cig_params(struct hci_conn *conn, struct bt_iso_qos *qos)
 			return false;
 
 		/* Update CIG */
-		qos->cig = data.cig;
+		qos->ucast.cig = data.cig;
 	}
 
-	data.pdu.cp.cig_id = qos->cig;
-	hci_cpu_to_le24(qos->out.interval, data.pdu.cp.c_interval);
-	hci_cpu_to_le24(qos->in.interval, data.pdu.cp.p_interval);
-	data.pdu.cp.sca = qos->sca;
-	data.pdu.cp.packing = qos->packing;
-	data.pdu.cp.framing = qos->framing;
-	data.pdu.cp.c_latency = cpu_to_le16(qos->out.latency);
-	data.pdu.cp.p_latency = cpu_to_le16(qos->in.latency);
+	data.pdu.cp.cig_id = qos->ucast.cig;
+	hci_cpu_to_le24(qos->ucast.out.interval, data.pdu.cp.c_interval);
+	hci_cpu_to_le24(qos->ucast.in.interval, data.pdu.cp.p_interval);
+	data.pdu.cp.sca = qos->ucast.sca;
+	data.pdu.cp.packing = qos->ucast.packing;
+	data.pdu.cp.framing = qos->ucast.framing;
+	data.pdu.cp.c_latency = cpu_to_le16(qos->ucast.out.latency);
+	data.pdu.cp.p_latency = cpu_to_le16(qos->ucast.in.latency);
 
-	if (qos->cis != BT_ISO_QOS_CIS_UNSET) {
+	if (qos->ucast.cis != BT_ISO_QOS_CIS_UNSET) {
 		data.count = 0;
-		data.cig = qos->cig;
-		data.cis = qos->cis;
+		data.cig = qos->ucast.cig;
+		data.cis = qos->ucast.cis;
 
 		hci_conn_hash_list_state(hdev, cis_list, ISO_LINK, BT_BOUND,
 					 &data);
@@ -1745,7 +1747,7 @@ static bool hci_le_set_cig_params(struct hci_conn *conn, struct bt_iso_qos *qos)
 	}
 
 	/* Reprogram all CIS(s) with the same CIG */
-	for (data.cig = qos->cig, data.cis = 0x00; data.cis < 0x11;
+	for (data.cig = qos->ucast.cig, data.cis = 0x00; data.cis < 0x11;
 	     data.cis++) {
 		data.count = 0;
 
@@ -1755,14 +1757,14 @@ static bool hci_le_set_cig_params(struct hci_conn *conn, struct bt_iso_qos *qos)
 			continue;
 
 		/* Allocate a CIS if not set */
-		if (qos->cis == BT_ISO_QOS_CIS_UNSET) {
+		if (qos->ucast.cis == BT_ISO_QOS_CIS_UNSET) {
 			/* Update CIS */
-			qos->cis = data.cis;
+			qos->ucast.cis = data.cis;
 			cis_add(&data, qos);
 		}
 	}
 
-	if (qos->cis == BT_ISO_QOS_CIS_UNSET || !data.pdu.cp.num_cis)
+	if (qos->ucast.cis == BT_ISO_QOS_CIS_UNSET || !data.pdu.cp.num_cis)
 		return false;
 
 	if (hci_send_cmd(hdev, HCI_OP_LE_SET_CIG_PARAMS,
@@ -1797,32 +1799,32 @@ struct hci_conn *hci_bind_cis(struct hci_dev *hdev, bdaddr_t *dst,
 		return cis;
 
 	/* Update LINK PHYs according to QoS preference */
-	cis->le_tx_phy = qos->out.phy;
-	cis->le_rx_phy = qos->in.phy;
+	cis->le_tx_phy = qos->ucast.out.phy;
+	cis->le_rx_phy = qos->ucast.in.phy;
 
 	/* If output interval is not set use the input interval as it cannot be
 	 * 0x000000.
 	 */
-	if (!qos->out.interval)
-		qos->out.interval = qos->in.interval;
+	if (!qos->ucast.out.interval)
+		qos->ucast.out.interval = qos->ucast.in.interval;
 
 	/* If input interval is not set use the output interval as it cannot be
 	 * 0x000000.
 	 */
-	if (!qos->in.interval)
-		qos->in.interval = qos->out.interval;
+	if (!qos->ucast.in.interval)
+		qos->ucast.in.interval = qos->ucast.out.interval;
 
 	/* If output latency is not set use the input latency as it cannot be
 	 * 0x0000.
 	 */
-	if (!qos->out.latency)
-		qos->out.latency = qos->in.latency;
+	if (!qos->ucast.out.latency)
+		qos->ucast.out.latency = qos->ucast.in.latency;
 
 	/* If input latency is not set use the output latency as it cannot be
 	 * 0x0000.
 	 */
-	if (!qos->in.latency)
-		qos->in.latency = qos->out.latency;
+	if (!qos->ucast.in.latency)
+		qos->ucast.in.latency = qos->ucast.out.latency;
 
 	if (!hci_le_set_cig_params(cis, qos)) {
 		hci_conn_drop(cis);
@@ -1842,7 +1844,7 @@ bool hci_iso_setup_path(struct hci_conn *conn)
 
 	memset(&cmd, 0, sizeof(cmd));
 
-	if (conn->iso_qos.out.sdu) {
+	if (conn->iso_qos.ucast.out.sdu) {
 		cmd.handle = cpu_to_le16(conn->handle);
 		cmd.direction = 0x00; /* Input (Host to Controller) */
 		cmd.path = 0x00; /* HCI path if enabled */
@@ -1853,7 +1855,7 @@ bool hci_iso_setup_path(struct hci_conn *conn)
 			return false;
 	}
 
-	if (conn->iso_qos.in.sdu) {
+	if (conn->iso_qos.ucast.in.sdu) {
 		cmd.handle = cpu_to_le16(conn->handle);
 		cmd.direction = 0x01; /* Output (Controller to Host) */
 		cmd.path = 0x00; /* HCI path if enabled */
@@ -1880,7 +1882,7 @@ static int hci_create_cis_sync(struct hci_dev *hdev, void *data)
 	cmd.cis[0].acl_handle = cpu_to_le16(conn->link->handle);
 	cmd.cis[0].cis_handle = cpu_to_le16(conn->handle);
 	cmd.cp.num_cis++;
-	cig = conn->iso_qos.cig;
+	cig = conn->iso_qos.ucast.cig;
 
 	hci_dev_lock(hdev);
 
@@ -1890,7 +1892,7 @@ static int hci_create_cis_sync(struct hci_dev *hdev, void *data)
 		struct hci_cis *cis = &cmd.cis[cmd.cp.num_cis];
 
 		if (conn == data || conn->type != ISO_LINK ||
-		    conn->state == BT_CONNECTED || conn->iso_qos.cig != cig)
+		    conn->state == BT_CONNECTED || conn->iso_qos.ucast.cig != cig)
 			continue;
 
 		/* Check if all CIS(s) belonging to a CIG are ready */
@@ -1990,8 +1992,8 @@ static void hci_bind_bis(struct hci_conn *conn,
 			 struct bt_iso_qos *qos)
 {
 	/* Update LINK PHYs according to QoS preference */
-	conn->le_tx_phy = qos->out.phy;
-	conn->le_tx_phy = qos->out.phy;
+	conn->le_tx_phy = qos->bcast.out.phy;
+	conn->le_tx_phy = qos->bcast.out.phy;
 	conn->iso_qos = *qos;
 	conn->state = BT_BOUND;
 }
@@ -2004,16 +2006,16 @@ static int create_big_sync(struct hci_dev *hdev, void *data)
 	u32 flags = 0;
 	int err;
 
-	if (qos->out.phy == 0x02)
+	if (qos->bcast.out.phy == 0x02)
 		flags |= MGMT_ADV_FLAG_SEC_2M;
 
 	/* Align intervals */
-	interval = qos->out.interval / 1250;
+	interval = qos->bcast.out.interval / 1250;
 
-	if (qos->bis)
-		sync_interval = qos->sync_interval * 1600;
+	if (qos->bcast.bis)
+		sync_interval = qos->bcast.sync_interval * 1600;
 
-	err = hci_start_per_adv_sync(hdev, qos->bis, conn->le_per_adv_data_len,
+	err = hci_start_per_adv_sync(hdev, qos->bcast.bis, conn->le_per_adv_data_len,
 				     conn->le_per_adv_data, flags, interval,
 				     interval, sync_interval);
 	if (err)
@@ -2050,7 +2052,7 @@ static int create_pa_sync(struct hci_dev *hdev, void *data)
 }
 
 int hci_pa_create_sync(struct hci_dev *hdev, bdaddr_t *dst, __u8 dst_type,
-		       __u8 sid)
+		       __u8 sid, struct bt_iso_qos *qos)
 {
 	struct hci_cp_le_pa_create_sync *cp;
 
@@ -2063,9 +2065,13 @@ int hci_pa_create_sync(struct hci_dev *hdev, bdaddr_t *dst, __u8 dst_type,
 		return -ENOMEM;
 	}
 
+	cp->options = qos->bcast.options;
 	cp->sid = sid;
 	cp->addr_type = dst_type;
 	bacpy(&cp->addr, dst);
+	cp->skip = cpu_to_le16(qos->bcast.skip);
+	cp->sync_timeout = cpu_to_le16(qos->bcast.sync_timeout);
+	cp->sync_cte_type = qos->bcast.sync_cte_type;
 
 	/* Queue start pa_create_sync and scan */
 	return hci_cmd_sync_queue(hdev, create_pa_sync, cp, create_pa_complete);
@@ -2088,8 +2094,12 @@ int hci_le_big_create_sync(struct hci_dev *hdev, struct bt_iso_qos *qos,
 		return err;
 
 	memset(&pdu, 0, sizeof(pdu));
-	pdu.cp.handle = qos->big;
+	pdu.cp.handle = qos->bcast.big;
 	pdu.cp.sync_handle = cpu_to_le16(sync_handle);
+	pdu.cp.encryption = qos->bcast.encryption;
+	memcpy(pdu.cp.bcode, qos->bcast.bcode, sizeof(pdu.cp.bcode));
+	pdu.cp.mse = qos->bcast.mse;
+	pdu.cp.timeout = cpu_to_le16(qos->bcast.timeout);
 	pdu.cp.num_bis = num_bis;
 	memcpy(pdu.bis, bis, num_bis);
 
@@ -2139,7 +2149,7 @@ struct hci_conn *hci_connect_bis(struct hci_dev *hdev, bdaddr_t *dst,
 		return ERR_PTR(err);
 	}
 
-	hci_iso_qos_setup(hdev, conn, &qos->out,
+	hci_iso_qos_setup(hdev, conn, &qos->bcast.out,
 			  conn->le_tx_phy ? conn->le_tx_phy :
 			  hdev->le_tx_def_phys);
 
@@ -2165,9 +2175,9 @@ struct hci_conn *hci_connect_cis(struct hci_dev *hdev, bdaddr_t *dst,
 	if (IS_ERR(le))
 		return le;
 
-	hci_iso_qos_setup(hdev, le, &qos->out,
+	hci_iso_qos_setup(hdev, le, &qos->ucast.out,
 			  le->le_tx_phy ? le->le_tx_phy : hdev->le_tx_def_phys);
-	hci_iso_qos_setup(hdev, le, &qos->in,
+	hci_iso_qos_setup(hdev, le, &qos->ucast.in,
 			  le->le_rx_phy ? le->le_rx_phy : hdev->le_rx_def_phys);
 
 	cis = hci_bind_cis(hdev, dst, dst_type, qos);
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index ff99e8c2750f..6cf9ae5b14d3 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -1,6 +1,7 @@
 /*
    BlueZ - Bluetooth protocol stack for Linux
    Copyright (c) 2000-2001, 2010, Code Aurora Forum. All rights reserved.
+   Copyright 2023 NXP
 
    Written 2000,2001 by Maxim Krasnyansky <maxk@qualcomm.com>
 
@@ -3833,7 +3834,7 @@ static u8 hci_cc_le_set_cig_params(struct hci_dev *hdev, void *data,
 	rcu_read_lock();
 
 	list_for_each_entry_rcu(conn, &hdev->conn_hash.list, list) {
-		if (conn->type != ISO_LINK || conn->iso_qos.cig != rp->cig_id ||
+		if (conn->type != ISO_LINK || conn->iso_qos.ucast.cig != rp->cig_id ||
 		    conn->state == BT_CONNECTED)
 			continue;
 
@@ -3890,7 +3891,7 @@ static u8 hci_cc_le_setup_iso_path(struct hci_dev *hdev, void *data,
 	/* Input (Host to Controller) */
 	case 0x00:
 		/* Only confirm connection if output only */
-		if (conn->iso_qos.out.sdu && !conn->iso_qos.in.sdu)
+		if (conn->iso_qos.ucast.out.sdu && !conn->iso_qos.ucast.in.sdu)
 			hci_connect_cfm(conn, rp->status);
 		break;
 	/* Output (Controller to Host) */
@@ -6818,15 +6819,15 @@ static void hci_le_cis_estabilished_evt(struct hci_dev *hdev, void *data,
 		memset(&interval, 0, sizeof(interval));
 
 		memcpy(&interval, ev->c_latency, sizeof(ev->c_latency));
-		conn->iso_qos.in.interval = le32_to_cpu(interval);
+		conn->iso_qos.ucast.in.interval = le32_to_cpu(interval);
 		memcpy(&interval, ev->p_latency, sizeof(ev->p_latency));
-		conn->iso_qos.out.interval = le32_to_cpu(interval);
-		conn->iso_qos.in.latency = le16_to_cpu(ev->interval);
-		conn->iso_qos.out.latency = le16_to_cpu(ev->interval);
-		conn->iso_qos.in.sdu = le16_to_cpu(ev->c_mtu);
-		conn->iso_qos.out.sdu = le16_to_cpu(ev->p_mtu);
-		conn->iso_qos.in.phy = ev->c_phy;
-		conn->iso_qos.out.phy = ev->p_phy;
+		conn->iso_qos.ucast.out.interval = le32_to_cpu(interval);
+		conn->iso_qos.ucast.in.latency = le16_to_cpu(ev->interval);
+		conn->iso_qos.ucast.out.latency = le16_to_cpu(ev->interval);
+		conn->iso_qos.ucast.in.sdu = le16_to_cpu(ev->c_mtu);
+		conn->iso_qos.ucast.out.sdu = le16_to_cpu(ev->p_mtu);
+		conn->iso_qos.ucast.in.phy = ev->c_phy;
+		conn->iso_qos.ucast.out.phy = ev->p_phy;
 	}
 
 	if (!ev->status) {
@@ -6900,8 +6901,8 @@ static void hci_le_cis_req_evt(struct hci_dev *hdev, void *data,
 		cis->handle = cis_handle;
 	}
 
-	cis->iso_qos.cig = ev->cig_id;
-	cis->iso_qos.cis = ev->cis_id;
+	cis->iso_qos.ucast.cig = ev->cig_id;
+	cis->iso_qos.ucast.cis = ev->cis_id;
 
 	if (!(flags & HCI_PROTO_DEFER)) {
 		hci_le_accept_cis(hdev, ev->cis_handle);
@@ -6988,13 +6989,13 @@ static void hci_le_big_sync_established_evt(struct hci_dev *hdev, void *data,
 			bis->handle = handle;
 		}
 
-		bis->iso_qos.big = ev->handle;
+		bis->iso_qos.bcast.big = ev->handle;
 		memset(&interval, 0, sizeof(interval));
 		memcpy(&interval, ev->latency, sizeof(ev->latency));
-		bis->iso_qos.in.interval = le32_to_cpu(interval);
+		bis->iso_qos.bcast.in.interval = le32_to_cpu(interval);
 		/* Convert ISO Interval (1.25 ms slots) to latency (ms) */
-		bis->iso_qos.in.latency = le16_to_cpu(ev->interval) * 125 / 100;
-		bis->iso_qos.in.sdu = le16_to_cpu(ev->max_pdu);
+		bis->iso_qos.bcast.in.latency = le16_to_cpu(ev->interval) * 125 / 100;
+		bis->iso_qos.bcast.in.sdu = le16_to_cpu(ev->max_pdu);
 
 		hci_connect_cfm(bis, ev->status);
 	}
diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
index 8d136a730163..74117df03a3f 100644
--- a/net/bluetooth/iso.c
+++ b/net/bluetooth/iso.c
@@ -3,6 +3,7 @@
  * BlueZ - Bluetooth protocol stack for Linux
  *
  * Copyright (C) 2022 Intel Corporation
+ * Copyright 2023 NXP
  */
 
 #include <linux/module.h>
@@ -59,11 +60,17 @@ struct iso_pinfo {
 	__u16			sync_handle;
 	__u32			flags;
 	struct bt_iso_qos	qos;
+	bool			qos_user_set;
 	__u8			base_len;
 	__u8			base[BASE_MAX_LENGTH];
 	struct iso_conn		*conn;
 };
 
+static struct bt_iso_qos default_qos;
+
+static bool check_ucast_qos(struct bt_iso_qos *qos);
+static bool check_bcast_qos(struct bt_iso_qos *qos);
+
 /* ---- ISO timers ---- */
 #define ISO_CONN_TIMEOUT	(HZ * 40)
 #define ISO_DISCONN_TIMEOUT	(HZ * 2)
@@ -264,8 +271,15 @@ static int iso_connect_bis(struct sock *sk)
 		goto unlock;
 	}
 
+	/* Fail if user set invalid QoS */
+	if (iso_pi(sk)->qos_user_set && !check_bcast_qos(&iso_pi(sk)->qos)) {
+		iso_pi(sk)->qos = default_qos;
+		err = -EINVAL;
+		goto unlock;
+	}
+
 	/* Fail if out PHYs are marked as disabled */
-	if (!iso_pi(sk)->qos.out.phy) {
+	if (!iso_pi(sk)->qos.bcast.out.phy) {
 		err = -EINVAL;
 		goto unlock;
 	}
@@ -336,8 +350,15 @@ static int iso_connect_cis(struct sock *sk)
 		goto unlock;
 	}
 
+	/* Fail if user set invalid QoS */
+	if (iso_pi(sk)->qos_user_set && !check_ucast_qos(&iso_pi(sk)->qos)) {
+		iso_pi(sk)->qos = default_qos;
+		err = -EINVAL;
+		goto unlock;
+	}
+
 	/* Fail if either PHYs are marked as disabled */
-	if (!iso_pi(sk)->qos.in.phy && !iso_pi(sk)->qos.out.phy) {
+	if (!iso_pi(sk)->qos.ucast.in.phy && !iso_pi(sk)->qos.ucast.out.phy) {
 		err = -EINVAL;
 		goto unlock;
 	}
@@ -417,7 +438,7 @@ static int iso_send_frame(struct sock *sk, struct sk_buff *skb)
 
 	BT_DBG("sk %p len %d", sk, skb->len);
 
-	if (skb->len > qos->out.sdu)
+	if (skb->len > qos->ucast.out.sdu)
 		return -EMSGSIZE;
 
 	len = skb->len;
@@ -680,13 +701,23 @@ static struct proto iso_proto = {
 }
 
 static struct bt_iso_qos default_qos = {
-	.cig		= BT_ISO_QOS_CIG_UNSET,
-	.cis		= BT_ISO_QOS_CIS_UNSET,
-	.sca		= 0x00,
-	.packing	= 0x00,
-	.framing	= 0x00,
-	.in		= DEFAULT_IO_QOS,
-	.out		= DEFAULT_IO_QOS,
+	.bcast = {
+		.big			= BT_ISO_QOS_BIG_UNSET,
+		.bis			= BT_ISO_QOS_BIS_UNSET,
+		.sync_interval		= 0x00,
+		.packing		= 0x00,
+		.framing		= 0x00,
+		.in			= DEFAULT_IO_QOS,
+		.out			= DEFAULT_IO_QOS,
+		.encryption		= 0x00,
+		.bcode			= {0x00},
+		.options		= 0x00,
+		.skip			= 0x0000,
+		.sync_timeout		= 0x4000,
+		.sync_cte_type		= 0x00,
+		.mse			= 0x00,
+		.timeout		= 0x4000,
+	},
 };
 
 static struct sock *iso_sock_alloc(struct net *net, struct socket *sock,
@@ -893,9 +924,15 @@ static int iso_listen_bis(struct sock *sk)
 	if (!hdev)
 		return -EHOSTUNREACH;
 
+	/* Fail if user set invalid QoS */
+	if (iso_pi(sk)->qos_user_set && !check_bcast_qos(&iso_pi(sk)->qos)) {
+		iso_pi(sk)->qos = default_qos;
+		return -EINVAL;
+	}
+
 	err = hci_pa_create_sync(hdev, &iso_pi(sk)->dst,
 				 le_addr_type(iso_pi(sk)->dst_type),
-				 iso_pi(sk)->bc_sid);
+				 iso_pi(sk)->bc_sid, &iso_pi(sk)->qos);
 
 	hci_dev_put(hdev);
 
@@ -1154,21 +1191,62 @@ static bool check_io_qos(struct bt_iso_io_qos *qos)
 	return true;
 }
 
-static bool check_qos(struct bt_iso_qos *qos)
+static bool check_ucast_qos(struct bt_iso_qos *qos)
 {
-	if (qos->sca > 0x07)
+	if (qos->ucast.sca > 0x07)
 		return false;
 
-	if (qos->packing > 0x01)
+	if (qos->ucast.packing > 0x01)
 		return false;
 
-	if (qos->framing > 0x01)
+	if (qos->ucast.framing > 0x01)
 		return false;
 
-	if (!check_io_qos(&qos->in))
+	if (!check_io_qos(&qos->ucast.in))
 		return false;
 
-	if (!check_io_qos(&qos->out))
+	if (!check_io_qos(&qos->ucast.out))
+		return false;
+
+	return true;
+}
+
+static bool check_bcast_qos(struct bt_iso_qos *qos)
+{
+	if (qos->bcast.sync_interval > 0x07)
+		return false;
+
+	if (qos->bcast.packing > 0x01)
+		return false;
+
+	if (qos->bcast.framing > 0x01)
+		return false;
+
+	if (!check_io_qos(&qos->bcast.in))
+		return false;
+
+	if (!check_io_qos(&qos->bcast.out))
+		return false;
+
+	if (qos->bcast.encryption > 0x01)
+		return false;
+
+	if (qos->bcast.options > 0x07)
+		return false;
+
+	if (qos->bcast.skip > 0x01f3)
+		return false;
+
+	if (qos->bcast.sync_timeout < 0x000a || qos->bcast.sync_timeout > 0x4000)
+		return false;
+
+	if (qos->bcast.sync_cte_type > 0x1f)
+		return false;
+
+	if (qos->bcast.mse > 0x1f)
+		return false;
+
+	if (qos->bcast.timeout < 0x000a || qos->bcast.timeout > 0x4000)
 		return false;
 
 	return true;
@@ -1179,7 +1257,7 @@ static int iso_sock_setsockopt(struct socket *sock, int level, int optname,
 {
 	struct sock *sk = sock->sk;
 	int len, err = 0;
-	struct bt_iso_qos qos;
+	struct bt_iso_qos qos = default_qos;
 	u32 opt;
 
 	BT_DBG("sk %p", sk);
@@ -1212,24 +1290,19 @@ static int iso_sock_setsockopt(struct socket *sock, int level, int optname,
 		}
 
 		len = min_t(unsigned int, sizeof(qos), optlen);
-		if (len != sizeof(qos)) {
-			err = -EINVAL;
-			break;
-		}
-
-		memset(&qos, 0, sizeof(qos));
 
 		if (copy_from_sockptr(&qos, optval, len)) {
 			err = -EFAULT;
 			break;
 		}
 
-		if (!check_qos(&qos)) {
+		if (len == sizeof(qos.ucast) && !check_ucast_qos(&qos)) {
 			err = -EINVAL;
 			break;
 		}
 
 		iso_pi(sk)->qos = qos;
+		iso_pi(sk)->qos_user_set = true;
 
 		break;
 
@@ -1419,7 +1492,7 @@ static bool iso_match_big(struct sock *sk, void *data)
 {
 	struct hci_evt_le_big_sync_estabilished *ev = data;
 
-	return ev->handle == iso_pi(sk)->qos.big;
+	return ev->handle == iso_pi(sk)->qos.bcast.big;
 }
 
 static void iso_conn_ready(struct iso_conn *conn)
-- 
2.34.1

