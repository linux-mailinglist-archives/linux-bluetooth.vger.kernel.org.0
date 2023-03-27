Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D77386CA63B
	for <lists+linux-bluetooth@lfdr.de>; Mon, 27 Mar 2023 15:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbjC0NqX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 27 Mar 2023 09:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjC0NqW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 27 Mar 2023 09:46:22 -0400
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2043.outbound.protection.outlook.com [40.107.241.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B033AB9
        for <linux-bluetooth@vger.kernel.org>; Mon, 27 Mar 2023 06:46:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBGCKzTyW2xahM6T+5bl351oMKOZd6XFU7Pq0XhTlghXWE99SopC+7xEvxKfcSoaCdfJX3SXRalUh1JAWnIupjSRs0cClaf4h8i0azZ4svJcnqlLXX/bbDmOHZoCWlxzMFxkFV3voG/JFO/dTmIHhUmMCYCNMVxLaDprKZjiLSynMQB+CU9sGkSrPjzqFeUM2lC4/M4aWvJ98PMei8ybD/rMRbqtSBFo3pBfv5CAmP7JGKalWbRv7/0RAHDiyEKt5aiNtNHE3IPyqRvjKDFRiQhfsQyOQ0EeZo6AeBL+FUMaQ8sqm3IfIMxGv6yCNuVBS6min+BC9/cYzaU2/Gw9mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cpu9VI1TtMrQw7bxg6kDSU6Bb3zBKnDzGrAQLgqw+zc=;
 b=f2KQFWX5bt9oN20W97nqMHVzUJUlA6gPUHn50G5hOyeqyU9YlPmvj+/BVqezXNXLlU11RWmpIMuDfbodJoq6Kc91eUaZB1vGK60sPOHo7VKvXhfwsX6HHi0ze/HWBcnmremdNoLp32rhND+s4PRQD0FW3zW7bZ67ElJnSEjz6jUc6K+79U3nLsldz6G6aaTlsjYu2X1Nh3vf9DC3XkwPIrzLBaRNSy1OCq4xK1ukMSUda70sSoJUuQjMuySWxEyZZVgcCbuZn8hw7jfgSRAtFHqvieE4rhSrLHEkb0gebYp0LvEy238iLEBoN3Io+8ytpdRrgBLY1KJzL9blXK798Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cpu9VI1TtMrQw7bxg6kDSU6Bb3zBKnDzGrAQLgqw+zc=;
 b=e6541Y1TIT7mZPqzZxMRU2JbXn1L2asExPrcRMVNYBEJ2t1CES6IZ/8kuDZ9WcQBAl9GCycI0HxbZUM4KALn961hljOcu+j/ERIPtojuwPVhNqNvAVUitxFMTCTiSELXkeB4cY+TkS0mDTY4ccjq0Chvm+HrjAz+lv/rEaJSCRc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8898.eurprd04.prod.outlook.com (2603:10a6:20b:42d::15)
 by AS1PR04MB9559.eurprd04.prod.outlook.com (2603:10a6:20b:483::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 13:46:16 +0000
Received: from AS8PR04MB8898.eurprd04.prod.outlook.com
 ([fe80::afb8:bb33:948f:d1e1]) by AS8PR04MB8898.eurprd04.prod.outlook.com
 ([fe80::afb8:bb33:948f:d1e1%9]) with mapi id 15.20.6222.030; Mon, 27 Mar 2023
 13:46:16 +0000
From:   Iulia Tanasescu <iulia.tanasescu@nxp.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Iulia Tanasescu <iulia.tanasescu@nxp.com>
Subject: [PATCH BlueZ 1/1] Split bt_iso_qos into dedicated structures
Date:   Mon, 27 Mar 2023 16:46:02 +0300
Message-Id: <20230327134602.14340-2-iulia.tanasescu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327134602.14340-1-iulia.tanasescu@nxp.com>
References: <20230327134602.14340-1-iulia.tanasescu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0117.eurprd04.prod.outlook.com
 (2603:10a6:208:55::22) To AS8PR04MB8898.eurprd04.prod.outlook.com
 (2603:10a6:20b:42d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8898:EE_|AS1PR04MB9559:EE_
X-MS-Office365-Filtering-Correlation-Id: 5493c37a-78bc-4fb4-fedc-08db2ec9a2dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ihynlv9R0FXeL3SDhGe3eIUdxfdiDX/xrFgT6MXMmPeue/Gb/m7ofOuPQafdj9VSDLQxtZldMzKAr38M8m36ZlzRDSF3Qj1cVJanrz+2vop4ZQohP08cfdMmZcC/pqrqtxcN41L7yQeknJL+r4cem2zrecGN16iP8E6qZPSJvr9VJyLJNSCDji7QX4okJ/rGPSmbNBF4ly2gKp5DSoR0RuSyhQOAbCr8chhsjOM9cTYyjHF/JtBpGJ4D0qfzIw6scIuxC4PiVwF7bsLnqgqfbGwvKL62h0sKraHH8BCcZGck+DFVxdCwxtHNgco9cmCCr+tf700CO3CmmNrmHBcE7bY2UTTXcMraBwtFsO8/RE9+ZbbQDtw3lW1swKHv1n9AwdcP+HVY9pabEx6VcW/bIbUxayh9aH/DlDUtBbpmvul1pMrYGHhgcWMxIbObmM6EKRDxiSOwYNibGVfhc6NySo6OVRqZbkuJtSNUgUjw8qhnl6JWmMAG6eNUDvehvJmREFhWnjkQ7lf/AjIyl+WAKFqdDFbH7E59No2ynVz1AbepnJcS7+QLvlxi+OW0IYjqF91swBlvQeSfWzuUrM2ORsEFnfIk79IiVx/JZpNxzxPHj5kR+i8aKbHdhkLj5Aa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8898.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199021)(44832011)(86362001)(36756003)(2906002)(26005)(6486002)(6666004)(83380400001)(52116002)(1076003)(2616005)(478600001)(4326008)(316002)(6916009)(66556008)(8676002)(66476007)(66946007)(6512007)(186003)(55236004)(5660300002)(6506007)(38350700002)(41300700001)(30864003)(8936002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JLrU1ZTohw2k2oFqUV9lNIFsn2V7/z83TyGFQXAvJzI9dF17xd3poTsS4jWr?=
 =?us-ascii?Q?633KVAEXyyz0hBEUzzvf7K8IrSkuolKYGSep9j/A6/80V6xrBrqbJrMefUis?=
 =?us-ascii?Q?5ZrZCXOF5dolXwPZwcFBaOoyuLGLR0oOzCGjKnxStCq4HBKGoDOtYA1sLhuc?=
 =?us-ascii?Q?jLyXIxWTslit9Pyg9tTtFhj449sUGHCMAPWb7sXCt8GZkxwUjiY8mHRbsvT1?=
 =?us-ascii?Q?q/bTLRt2fykYFLldk1ODeH14aS1ooQRPgb8BS3Bz5P2Av2Gr+ZVFROjF+nSr?=
 =?us-ascii?Q?DgJBeoVti4CLclukwByze6y0JcMxpDYFX8gzDcic9BKybvCKi/KV8nEoZ0K/?=
 =?us-ascii?Q?qkkPik1uxUcacKlSCZsfPx3EG2H/riJdGHZiVOqzRW/3nxwij64247vemh30?=
 =?us-ascii?Q?/9T09ib2xgEdxBpKJwbzHO7ZewfFV/dxCzgKM6Mc/vpD+liFVmwf/W9rq9xV?=
 =?us-ascii?Q?ilKOI3v/ijoTXafxRyf+OwbuyVnbZIbn2m3a/xn5d6xPS+QAgZf+euWj+yYU?=
 =?us-ascii?Q?7wI/0eRvM9f8opa5qlmu7FMfVSI86mRUciGAmbofcf5sgmP6nIpPdmQ/5zf7?=
 =?us-ascii?Q?p0vSNwttc8vOpbbbAkg9k2YMgZIwUaw4EUEZnTUlL6oz5PeCm282KtO754c9?=
 =?us-ascii?Q?uzJglcSbV+WRrj+j25r0RJ10gPX7xRYWh6wwHarMb2BsSEFqVW++FH32sqDn?=
 =?us-ascii?Q?XOeqPzvJz7PUcjBWDx3qM6jcECdzzJ0gReNavaxuixIbhlXYw/9sOsEs0mEy?=
 =?us-ascii?Q?5r2tE2SGm1tydAbNhKDrNsaH3R8y2Zur8QO7CoyJVJi9XNA+sW/6wtasMyQ4?=
 =?us-ascii?Q?uATcEV/gyDDjSjODWmfzmDDwuoO6NIrVS1lIkUMhIjphu2JxnukdqKPfyNOm?=
 =?us-ascii?Q?GtScqJU1xJjIgWw9j+vhFhXsJwVm4Op/VvMJmZhbSvCRd/JKju9+8ZzA+DvS?=
 =?us-ascii?Q?t/s2GizSGGf9IeFXma4mSsCNWon+9hX2meT/+StWUZt7HyYncfdBIG7om2g5?=
 =?us-ascii?Q?C2yi3uTENaGK/dFbC4LY124v/DOBoiWNC8EWibSfamzbPIZQ9PgCoFnf2nph?=
 =?us-ascii?Q?0Q5o+hNEo9amkzA7RxoTzFnCMhMg9ccewfiJainlKhDAn7bHeH+PFZylSmxo?=
 =?us-ascii?Q?d7IDMdt8+YdKPB2RY+bLymPhArc0gkaWt0+PQ25zKJX+JvcLXV/GUuQUXjEI?=
 =?us-ascii?Q?r6MxYf0iuvBydEY+/4UaPYWBlRv0O4v1K5EJbkLImEuGHib9MQEHuUsBy5p7?=
 =?us-ascii?Q?mgPtMk+/wB195t7tLPHB0a00gjQdJ9xwC+nyCkuVEYHTotFcxuhJGMBzrVjY?=
 =?us-ascii?Q?I/29rEdVsmJo09FDaL+5GLPivEWmHWdREPgXvBzneSgA7ljitY4EkOYxRRcY?=
 =?us-ascii?Q?WWYt1LODEuzLde7T8wuYUMaxmfu5o4gt4tEpu7QRbnHgIT0P9r8jQJQpjGV6?=
 =?us-ascii?Q?9fSkATSCc7oERRPokX/OhyviJ6xNSKgsTz4s7V+AURayXohEYbcshdo7UaPG?=
 =?us-ascii?Q?mtnODNlsoGG2GT8V+ZSSLSCImbk+MIi8LjV6xvMOBbR7cxGRkvQLH5bPCQm/?=
 =?us-ascii?Q?52zRJInLUDZBOLFJ9hMHr22Pyr3ktP+rv2e1tTONVVBTIihVK0IkQoIwo9/0?=
 =?us-ascii?Q?uw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5493c37a-78bc-4fb4-fedc-08db2ec9a2dd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8898.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 13:46:16.0592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVl66LmEEjDtW33oQksEG28H9huiEHMGkiTki4eRZYkReDPzhJr27Jszy7ZPhPsl5KlBD8obVWW1/lr7Ql5lQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9559
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

---
 btio/btio.c          |   7 +-
 client/player.c      |   7 +-
 emulator/bthost.c    |   3 +-
 emulator/bthost.h    |   3 +-
 lib/bluetooth.h      |  59 +++++++++++----
 profiles/audio/bap.c |  19 ++---
 tools/btiotest.c     |  17 +++--
 tools/iso-tester.c   | 144 +++++++++++++++++++++++++++++++----
 tools/isotest.c      | 177 +++++++++++++++++++++++++++++++------------
 9 files changed, 336 insertions(+), 100 deletions(-)

diff --git a/btio/btio.c b/btio/btio.c
index 1ad42728d..6f6d76dc8 100644
--- a/btio/btio.c
+++ b/btio/btio.c
@@ -5,6 +5,7 @@
  *
  *  Copyright (C) 2009-2010  Marcel Holtmann <marcel@holtmann.org>
  *  Copyright (C) 2009-2010  Nokia Corporation
+ *  Copyright 2023 NXP
  *
  *
  */
@@ -1608,13 +1609,13 @@ static gboolean iso_get(int sock, GError **err, BtIOOption opt1, va_list args)
 			*(va_arg(args, uint8_t *)) = dst.iso_bdaddr_type;
 			break;
 		case BT_IO_OPT_MTU:
-			*(va_arg(args, uint16_t *)) = qos.out.sdu;
+			*(va_arg(args, uint16_t *)) = qos.ucast.out.sdu;
 			break;
 		case BT_IO_OPT_IMTU:
-			*(va_arg(args, uint16_t *)) = qos.in.sdu;
+			*(va_arg(args, uint16_t *)) = qos.ucast.in.sdu;
 			break;
 		case BT_IO_OPT_OMTU:
-			*(va_arg(args, uint16_t *)) = qos.out.sdu;
+			*(va_arg(args, uint16_t *)) = qos.ucast.out.sdu;
 			break;
 		case BT_IO_OPT_PHY:
 			if (get_phy(sock, &phy) < 0) {
diff --git a/client/player.c b/client/player.c
index 63e11db09..5572cc566 100644
--- a/client/player.c
+++ b/client/player.c
@@ -4,6 +4,7 @@
  *  BlueZ - Bluetooth protocol stack for Linux
  *
  *  Copyright (C) 2020  Intel Corporation. All rights reserved.
+ *  Copyright 2023 NXP
  *
  *
  */
@@ -3534,7 +3535,7 @@ static bool transport_timer_read(struct io *io, void *user_data)
 	}
 
 	/* num of packets = latency (ms) / interval (us) */
-	num = (qos.out.latency * 1000 / qos.out.interval);
+	num = (qos.ucast.out.latency * 1000 / qos.ucast.out.interval);
 
 	ret = transport_send_seq(transport, transport->fd, num);
 	if (ret < 0) {
@@ -3570,8 +3571,8 @@ static int transport_send(struct transport *transport, int fd,
 		return -errno;
 
 	memset(&ts, 0, sizeof(ts));
-	ts.it_value.tv_nsec = qos->out.latency * 1000000;
-	ts.it_interval.tv_nsec = qos->out.latency * 1000000;
+	ts.it_value.tv_nsec = qos->ucast.out.latency * 1000000;
+	ts.it_interval.tv_nsec = qos->ucast.out.latency * 1000000;
 
 	if (timerfd_settime(timer_fd, TFD_TIMER_ABSTIME, &ts, NULL) < 0)
 		return -errno;
diff --git a/emulator/bthost.c b/emulator/bthost.c
index 4671fe17d..1b6847b81 100644
--- a/emulator/bthost.c
+++ b/emulator/bthost.c
@@ -5,6 +5,7 @@
  *
  *  Copyright (C) 2011-2012  Intel Corporation
  *  Copyright (C) 2004-2010  Marcel Holtmann <marcel@holtmann.org>
+ *  Copyright 2023 NXP
  *
  *
  */
@@ -3171,7 +3172,7 @@ bool bthost_search_ext_adv_addr(struct bthost *bthost, const uint8_t *addr)
 }
 
 void bthost_set_cig_params(struct bthost *bthost, uint8_t cig_id,
-				uint8_t cis_id, const struct bt_iso_qos *qos)
+			uint8_t cis_id, const struct bt_iso_ucast_qos *qos)
 {
 	struct bt_hci_cmd_le_set_cig_params *cp;
 
diff --git a/emulator/bthost.h b/emulator/bthost.h
index 92182687f..779ca7d06 100644
--- a/emulator/bthost.h
+++ b/emulator/bthost.h
@@ -5,6 +5,7 @@
  *
  *  Copyright (C) 2011-2012  Intel Corporation
  *  Copyright (C) 2004-2010  Marcel Holtmann <marcel@holtmann.org>
+ *  Copyright 2023 NXP
  *
  *
  */
@@ -106,7 +107,7 @@ void bthost_create_big(struct bthost *bthost, uint8_t num_bis);
 bool bthost_search_ext_adv_addr(struct bthost *bthost, const uint8_t *addr);
 
 void bthost_set_cig_params(struct bthost *bthost, uint8_t cig_id,
-				uint8_t cis_id, const struct bt_iso_qos *qos);
+			uint8_t cis_id, const struct bt_iso_ucast_qos *qos);
 void bthost_create_cis(struct bthost *bthost, uint16_t cis_handle,
 						uint16_t acl_handle);
 
diff --git a/lib/bluetooth.h b/lib/bluetooth.h
index af5fbcfbc..660a529d8 100644
--- a/lib/bluetooth.h
+++ b/lib/bluetooth.h
@@ -6,6 +6,7 @@
  *  Copyright (C) 2000-2001  Qualcomm Incorporated
  *  Copyright (C) 2002-2003  Maxim Krasnyansky <maxk@qualcomm.com>
  *  Copyright (C) 2002-2010  Marcel Holtmann <marcel@holtmann.org>
+ *  Copyright 2023 NXP
  *
  *
  */
@@ -146,6 +147,9 @@ struct bt_voice {
 #define BT_ISO_QOS_CIG_UNSET	0xff
 #define BT_ISO_QOS_CIS_UNSET	0xff
 
+#define BT_ISO_QOS_BIG_UNSET	0xff
+#define BT_ISO_QOS_BIS_UNSET	0xff
+
 struct bt_iso_io_qos {
 	uint32_t interval;
 	uint16_t latency;
@@ -154,25 +158,54 @@ struct bt_iso_io_qos {
 	uint8_t  rtn;
 };
 
-struct bt_iso_qos {
-	union {
-		uint8_t  cig;
-		uint8_t  big;
-	};
-	union {
-		uint8_t  cis;
-		uint8_t  bis;
-	};
-	union {
-		uint8_t  sca;
-		uint8_t  sync_interval;
-	};
+struct bt_iso_ucast_qos {
+	uint8_t  cig;
+	uint8_t  cis;
+	uint8_t  sca;
 	uint8_t  packing;
 	uint8_t  framing;
 	struct bt_iso_io_qos in;
 	struct bt_iso_io_qos out;
 };
 
+struct bt_iso_bcast_src_qos {
+	uint8_t  sync_interval;
+	uint8_t  big;
+	uint8_t  bis;
+	uint8_t  packing;
+	uint8_t  framing;
+	uint8_t  encryption;
+	uint8_t  bcode[16];
+	struct bt_iso_io_qos out;
+};
+
+struct bt_iso_bcast_snk_qos {
+	uint8_t  options;
+	uint16_t skip;
+	uint16_t sync_timeout;
+	uint8_t  sync_cte_type;
+	uint8_t  big;
+	uint8_t  encryption;
+	uint8_t  bcode[16];
+	uint8_t  mse;
+	uint16_t timeout;
+	struct bt_iso_io_qos in;
+};
+
+struct bt_iso_bcast_qos {
+	union {
+		struct bt_iso_bcast_src_qos bsrc;
+		struct bt_iso_bcast_snk_qos bsnk;
+	};
+};
+
+struct bt_iso_qos {
+	union {
+		struct bt_iso_ucast_qos ucast;
+		struct bt_iso_bcast_qos bcast;
+	};
+};
+
 #define BT_CODEC		19
 struct bt_codec {
 	uint8_t id;
diff --git a/profiles/audio/bap.c b/profiles/audio/bap.c
index dfdf87255..afc87d85f 100644
--- a/profiles/audio/bap.c
+++ b/profiles/audio/bap.c
@@ -4,6 +4,7 @@
  *  BlueZ - Bluetooth protocol stack for Linux
  *
  *  Copyright (C) 2022  Intel Corporation. All rights reserved.
+ *  Copyright 2023 NXP
  *
  *
  */
@@ -746,10 +747,10 @@ static bool match_stream_qos(const void *data, const void *user_data)
 
 	qos = bt_bap_stream_get_qos((void *)stream);
 
-	if (iso_qos->cig != qos->cig_id)
+	if (iso_qos->ucast.cig != qos->cig_id)
 		return false;
 
-	return iso_qos->cis == qos->cis_id;
+	return iso_qos->ucast.cis == qos->cis_id;
 }
 
 static void iso_confirm_cb(GIOChannel *io, void *user_data)
@@ -771,7 +772,7 @@ static void iso_confirm_cb(GIOChannel *io, void *user_data)
 	}
 
 	DBG("ISO: incoming connect from %s (CIG 0x%02x CIS 0x%02x)",
-					address, qos.cig, qos.cis);
+					address, qos.ucast.cig, qos.ucast.cis);
 
 	stream = queue_remove_if(data->streams, match_stream_qos, &qos);
 	if (!stream) {
@@ -990,11 +991,11 @@ static void bap_create_io(struct bap_data *data, struct bap_ep *ep,
 	}
 
 	memset(&iso_qos, 0, sizeof(iso_qos));
-	iso_qos.cig = qos[0] ? qos[0]->cig_id : qos[1]->cig_id;
-	iso_qos.cis = qos[0] ? qos[0]->cis_id : qos[1]->cis_id;
+	iso_qos.ucast.cig = qos[0] ? qos[0]->cig_id : qos[1]->cig_id;
+	iso_qos.ucast.cis = qos[0] ? qos[0]->cis_id : qos[1]->cis_id;
 
-	bap_iso_qos(qos[0], &iso_qos.in);
-	bap_iso_qos(qos[1], &iso_qos.out);
+	bap_iso_qos(qos[0], &iso_qos.ucast.in);
+	bap_iso_qos(qos[1], &iso_qos.ucast.out);
 
 	if (ep)
 		bap_connect_io(data, ep, stream, &iso_qos, defer);
@@ -1189,8 +1190,8 @@ static void bap_connecting(struct bt_bap_stream *stream, bool state, int fd,
 			return;
 		}
 
-		ep->qos.cig_id = qos.cig;
-		ep->qos.cis_id = qos.cis;
+		ep->qos.cig_id = qos.ucast.cig;
+		ep->qos.cis_id = qos.ucast.cis;
 	}
 
 	DBG("stream %p fd %d: CIG 0x%02x CIS 0x%02x", stream, fd,
diff --git a/tools/btiotest.c b/tools/btiotest.c
index 193e1395b..75af90543 100644
--- a/tools/btiotest.c
+++ b/tools/btiotest.c
@@ -5,6 +5,7 @@
  *
  *  Copyright (C) 2009-2010  Marcel Holtmann <marcel@holtmann.org>
  *  Copyright (C) 2009-2010  Nokia Corporation
+ *  Copyright 2023 NXP
  *
  *
  */
@@ -39,13 +40,15 @@ static int opt_update_sec = 0;
 }
 
 struct bt_iso_qos qos = {
-	.cig = BT_ISO_QOS_CIG_UNSET,
-	.cis = BT_ISO_QOS_CIG_UNSET,
-	.sca = 0x07,
-	.packing = 0x00,
-	.framing = 0x00,
-	.in = DEFAULT_IO_QOS,
-	.out = DEFAULT_IO_QOS,
+	.ucast = {
+		.cig = BT_ISO_QOS_CIG_UNSET,
+		.cis = BT_ISO_QOS_CIG_UNSET,
+		.sca = 0x07,
+		.packing = 0x00,
+		.framing = 0x00,
+		.in = DEFAULT_IO_QOS,
+		.out = DEFAULT_IO_QOS,
+	},
 };
 
 struct io_data {
diff --git a/tools/iso-tester.c b/tools/iso-tester.c
index e4582573a..2dd90c14e 100644
--- a/tools/iso-tester.c
+++ b/tools/iso-tester.c
@@ -4,6 +4,7 @@
  *  BlueZ - Bluetooth protocol stack for Linux
  *
  *  Copyright (C) 2022  Intel Corporation.
+ *  Copyright 2023 NXP
  *
  */
 
@@ -42,13 +43,15 @@
 
 #define QOS_FULL(_cig, _cis, _in, _out) \
 { \
-	.cig = _cig, \
-	.cis = _cis, \
-	.sca = 0x07, \
-	.packing = 0x00, \
-	.framing = 0x00, \
-	.in = _in, \
-	.out = _out, \
+	.ucast = { \
+		.cig = _cig, \
+		.cis = _cis, \
+		.sca = 0x07, \
+		.packing = 0x00, \
+		.framing = 0x00, \
+		.in = _in, \
+		.out = _out, \
+	},\
 }
 
 #define QOS(_interval, _latency, _sdu, _phy, _rtn) \
@@ -119,10 +122,56 @@
 #define QOS_48_5_2 QOS_OUT(7500, 75, 117, 0x02, 13)
 #define QOS_48_6_2 QOS_OUT(10000, 100, 155, 0x02, 13)
 
-#define QOS_OUT_16_2_1 QOS_OUT(10000, 10, 40, 0x02, 2)
-#define QOS_OUT_1_16_2_1 QOS_OUT_1(10000, 10, 40, 0x02, 2)
-#define QOS_OUT_1_1_16_2_1 QOS_OUT_1_1(10000, 10, 40, 0x02, 2)
-#define QOS_IN_16_2_1 QOS_IN(10000, 10, 40, 0x02, 2)
+#define QOS_SINK_FULL(_big, _in) \
+{ \
+	.bcast.bsnk = { \
+		.options = 0x00, \
+		.skip = 0x0000, \
+		.sync_timeout = 0x4000, \
+		.sync_cte_type = 0x00, \
+		.big = _big, \
+		.encryption = 0x00, \
+		.bcode = {0}, \
+		.mse = 0x00, \
+		.timeout = 0x4000, \
+		.in = _in, \
+	}, \
+}
+
+#define QOS_SOURCE_FULL(_big, _bis, _out) \
+{ \
+	.bcast.bsrc = { \
+		.sync_interval = 0x07, \
+		.big = _big, \
+		.bis = _bis, \
+		.packing = 0x00, \
+		.framing = 0x00, \
+		.encryption = 0x00, \
+		.bcode = {0}, \
+		.out = _out, \
+	}, \
+}
+
+#define BCAST_QOS_OUT(_interval, _latency, _sdu, _phy, _rtn) \
+	QOS_SOURCE_FULL(BT_ISO_QOS_BIG_UNSET, BT_ISO_QOS_BIS_UNSET, \
+		QOS_IO(_interval, _latency, _sdu, _phy, _rtn))
+
+#define BCAST_QOS_OUT_1(_interval, _latency, _sdu, _phy, _rtn) \
+	QOS_SOURCE_FULL(0x01, BT_ISO_QOS_BIS_UNSET, \
+		QOS_IO(_interval, _latency, _sdu, _phy, _rtn))
+
+#define BCAST_QOS_OUT_1_1(_interval, _latency, _sdu, _phy, _rtn) \
+	QOS_SOURCE_FULL(0x01, 0x01, \
+		QOS_IO(_interval, _latency, _sdu, _phy, _rtn))
+
+#define BCAST_QOS_IN(_interval, _latency, _sdu, _phy, _rtn) \
+	QOS_SINK_FULL(BT_ISO_QOS_BIG_UNSET, \
+		QOS_IO(_interval, _latency, _sdu, _phy, _rtn))
+
+#define QOS_OUT_16_2_1 BCAST_QOS_OUT(10000, 10, 40, 0x02, 2)
+#define QOS_OUT_1_16_2_1 BCAST_QOS_OUT_1(10000, 10, 40, 0x02, 2)
+#define QOS_OUT_1_1_16_2_1 BCAST_QOS_OUT_1_1(10000, 10, 40, 0x02, 2)
+#define QOS_IN_16_2_1 BCAST_QOS_IN(10000, 10, 40, 0x02, 2)
 
 struct test_data {
 	const void *test_data;
@@ -670,6 +719,7 @@ static const struct iso_client_data bcast_16_2_1_recv = {
 	.expect_err = 0,
 	.recv = &send_16_2_1,
 	.bcast = true,
+	.server = true,
 };
 
 static void client_connectable_complete(uint16_t opcode, uint8_t status,
@@ -1080,8 +1130,8 @@ static bool check_io_qos(const struct bt_iso_io_qos *io1,
 	return true;
 }
 
-static bool check_qos(const struct bt_iso_qos *qos1,
-				const struct bt_iso_qos *qos2)
+static bool check_ucast_qos(const struct bt_iso_ucast_qos *qos1,
+				const struct bt_iso_ucast_qos *qos2)
 {
 	if (qos1->cig != BT_ISO_QOS_CIG_UNSET &&
 			qos2->cig != BT_ISO_QOS_CIG_UNSET &&
@@ -1124,6 +1174,63 @@ static bool check_qos(const struct bt_iso_qos *qos1,
 	return true;
 }
 
+static bool check_bcast_src_qos(const struct bt_iso_bcast_src_qos *qos1,
+				const struct bt_iso_bcast_src_qos *qos2)
+{
+	if (qos1->sync_interval != qos2->sync_interval) {
+		tester_warn("Unexpected QoS sync interval: 0x%02x != 0x%02x",
+				qos1->sync_interval, qos2->sync_interval);
+		return false;
+	}
+
+	if (qos1->big != BT_ISO_QOS_BIG_UNSET &&
+			qos2->big != BT_ISO_QOS_BIG_UNSET &&
+			qos1->big != qos2->big) {
+		tester_warn("Unexpected BIG ID: 0x%02x != 0x%02x",
+				qos1->big, qos2->big);
+		return false;
+	}
+
+	if (qos1->bis != BT_ISO_QOS_BIS_UNSET &&
+			qos2->bis != BT_ISO_QOS_BIS_UNSET &&
+			qos1->bis != qos2->bis) {
+		tester_warn("Unexpected BIS ID: 0x%02x != 0x%02x",
+				qos1->bis, qos2->bis);
+		return false;
+	}
+
+	if (qos1->packing != qos2->packing) {
+		tester_warn("Unexpected QoS packing: 0x%02x != 0x%02x",
+				qos1->packing, qos2->packing);
+		return false;
+	}
+
+	if (qos1->framing != qos2->framing) {
+		tester_warn("Unexpected QoS framing: 0x%02x != 0x%02x",
+				qos1->framing, qos2->framing);
+		return false;
+	}
+
+	if (qos1->encryption != qos2->encryption) {
+		tester_warn("Unexpected QoS encryption: 0x%02x != 0x%02x",
+				qos1->encryption, qos2->encryption);
+		return false;
+	}
+
+
+	if (memcmp(qos1->bcode, qos2->bcode, sizeof(qos1->bcode))) {
+		tester_warn("Unexpected QoS Broadcast Code");
+		return false;
+	}
+
+	if (!check_io_qos(&qos1->out, &qos2->out)) {
+		tester_warn("Unexpected Output QoS");
+		return false;
+	}
+
+	return true;
+}
+
 static gboolean iso_recv_data(GIOChannel *io, GIOCondition cond,
 							gpointer user_data)
 {
@@ -1250,6 +1357,7 @@ static gboolean iso_connect(GIOChannel *io, GIOCondition cond,
 	int err, sk_err, sk;
 	socklen_t len;
 	struct bt_iso_qos qos;
+	bool ret = true;
 
 	sk = g_io_channel_unix_get_fd(io);
 
@@ -1264,7 +1372,13 @@ static gboolean iso_connect(GIOChannel *io, GIOCondition cond,
 		return FALSE;
 	}
 
-	if (!check_qos(&qos, &isodata->qos)) {
+	if (!isodata->bcast)
+		ret = check_ucast_qos(&qos.ucast, &isodata->qos.ucast);
+	else if (!isodata->server)
+		ret = check_bcast_src_qos(&qos.bcast.bsrc,
+					&isodata->qos.bcast.bsrc);
+
+	if (!ret) {
 		tester_warn("Unexpected QoS parameter");
 		tester_test_failed();
 		return FALSE;
@@ -1579,7 +1693,7 @@ static void setup_listen(struct test_data *data, uint8_t num, GIOFunc func)
 		client = hciemu_get_client(data->hciemu, 0);
 		host = hciemu_client_host(client);
 
-		bthost_set_cig_params(host, 0x01, 0x01, &isodata->qos);
+		bthost_set_cig_params(host, 0x01, 0x01, &isodata->qos.ucast);
 		bthost_create_cis(host, 257, data->acl_handle);
 	}
 }
diff --git a/tools/isotest.c b/tools/isotest.c
index 2b5f164de..f00f03249 100644
--- a/tools/isotest.c
+++ b/tools/isotest.c
@@ -4,6 +4,7 @@
  *  BlueZ - Bluetooth protocol stack for Linux
  *
  *  Copyright (C) 2022  Intel Corporation.
+ *  Copyright 2023 NXP
  *
  */
 
@@ -239,7 +240,7 @@ fail:
 	return err < 0 ? err : 0;
 }
 
-static void print_qos(int sk, struct sockaddr_iso *addr)
+static void print_ucast_qos(int sk)
 {
 	struct bt_iso_qos qos;
 	socklen_t len;
@@ -254,21 +255,83 @@ static void print_qos(int sk, struct sockaddr_iso *addr)
 		return;
 	}
 
-	if (!bacmp(&addr->iso_bdaddr, BDADDR_ANY)) {
-		syslog(LOG_INFO, "QoS BIG 0x%02x BIS 0x%02x Packing 0x%02x "
-			"Framing 0x%02x]", qos.big, qos.bis, qos.packing,
-			qos.framing);
-	} else {
-		syslog(LOG_INFO, "QoS CIG 0x%02x CIS 0x%02x Packing 0x%02x "
-			"Framing 0x%02x]", qos.cig, qos.cis, qos.packing,
-			qos.framing);
-		syslog(LOG_INFO, "Input QoS [Interval %u us Latency %u "
-			"ms SDU %u PHY 0x%02x RTN %u]", qos.in.interval,
-			qos.in.latency, qos.in.sdu, qos.in.phy, qos.in.rtn);
+	syslog(LOG_INFO, "QoS CIG 0x%02x CIS 0x%02x Packing 0x%02x "
+		"Framing 0x%02x]", qos.ucast.cig, qos.ucast.cis,
+		qos.ucast.packing, qos.ucast.framing);
+
+	syslog(LOG_INFO, "Input QoS [Interval %u us Latency %u "
+		"ms SDU %u PHY 0x%02x RTN %u]", qos.ucast.in.interval,
+		qos.ucast.in.latency, qos.ucast.in.sdu, qos.ucast.in.phy,
+		qos.ucast.in.rtn);
+
+	syslog(LOG_INFO, "Output QoS [Interval %u us Latency %u "
+		"ms SDU %u PHY 0x%02x RTN %u]", qos.ucast.out.interval,
+		qos.ucast.out.latency, qos.ucast.out.sdu, qos.ucast.out.phy,
+		qos.ucast.out.rtn);
+}
+
+static void print_bcast_src_qos(int sk)
+{
+	struct bt_iso_qos qos;
+	socklen_t len;
+
+	/* Read Out QOS */
+	memset(&qos, 0, sizeof(qos));
+	len = sizeof(qos);
+
+	if (getsockopt(sk, SOL_BLUETOOTH, BT_ISO_QOS, &qos, &len) < 0) {
+		syslog(LOG_ERR, "Can't get QoS socket option: %s (%d)",
+				strerror(errno), errno);
+		return;
 	}
+
+	syslog(LOG_INFO, "QoS BIG 0x%02x BIS 0x%02x Packing 0x%02x "
+		"Framing 0x%02x]", qos.bcast.bsrc.big, qos.bcast.bsrc.bis,
+		qos.bcast.bsrc.packing, qos.bcast.bsrc.framing);
+
 	syslog(LOG_INFO, "Output QoS [Interval %u us Latency %u "
-		"ms SDU %u PHY 0x%02x RTN %u]", qos.out.interval,
-		qos.out.latency, qos.out.sdu, qos.out.phy, qos.out.rtn);
+		"ms SDU %u PHY 0x%02x RTN %u]", qos.bcast.bsrc.out.interval,
+		qos.bcast.bsrc.out.latency, qos.bcast.bsrc.out.sdu,
+		qos.bcast.bsrc.out.phy, qos.bcast.bsrc.out.rtn);
+}
+
+static void print_bcast_snk_qos(int sk)
+{
+	struct bt_iso_qos qos;
+	socklen_t len;
+
+	/* Read Out QOS */
+	memset(&qos, 0, sizeof(qos));
+	len = sizeof(qos);
+
+	if (getsockopt(sk, SOL_BLUETOOTH, BT_ISO_QOS, &qos, &len) < 0) {
+		syslog(LOG_ERR, "Can't get QoS socket option: %s (%d)",
+				strerror(errno), errno);
+		return;
+	}
+
+	syslog(LOG_INFO, "QoS BIG 0x%02x", qos.bcast.bsnk.big);
+
+	syslog(LOG_INFO, "Input QoS [Interval %u us Latency %u "
+		"ms SDU %u PHY 0x%02x RTN %u]", qos.bcast.bsnk.in.interval,
+		qos.bcast.bsnk.in.latency, qos.bcast.bsnk.in.sdu,
+		qos.bcast.bsnk.in.phy, qos.bcast.bsnk.in.rtn);
+}
+
+static void ucast_qos_to_bcast_src(struct bt_iso_qos *qos)
+{
+	struct bt_iso_qos src_qos;
+
+	memset(&src_qos, 0, sizeof(src_qos));
+
+	src_qos.bcast.bsrc.sync_interval = qos->ucast.sca;
+	src_qos.bcast.bsrc.big = qos->ucast.cig;
+	src_qos.bcast.bsrc.bis = qos->ucast.cis;
+	src_qos.bcast.bsrc.packing = qos->ucast.packing;
+	src_qos.bcast.bsrc.framing = qos->ucast.framing;
+	src_qos.bcast.bsrc.out = qos->ucast.out;
+
+	*qos = src_qos;
 }
 
 static int do_connect(char *peer)
@@ -301,9 +364,13 @@ static int do_connect(char *peer)
 
 	/* Set QoS if available */
 	if (iso_qos) {
-		if (!inout || !strcmp(peer, "00:00:00:00:00:00")) {
-			iso_qos->in.phy = 0x00;
-			iso_qos->in.sdu = 0;
+		if (!strcmp(peer, "00:00:00:00:00:00")) {
+			ucast_qos_to_bcast_src(iso_qos);
+		} else {
+			if (!inout) {
+				iso_qos->ucast.in.phy = 0x00;
+				iso_qos->ucast.in.sdu = 0;
+			}
 		}
 
 		if (setsockopt(sk, SOL_BLUETOOTH, BT_ISO_QOS, iso_qos,
@@ -338,7 +405,10 @@ static int do_connect(char *peer)
 
 	syslog(LOG_INFO, "Connected [%s]", peer);
 
-	print_qos(sk, &addr);
+	if (!strcmp(peer, "00:00:00:00:00:00"))
+		print_bcast_src_qos(sk);
+	else
+		print_ucast_qos(sk);
 
 	return sk;
 
@@ -441,7 +511,10 @@ static void do_listen(char *filename, void (*handler)(int fd, int sk),
 		ba2str(&addr->iso_bdaddr, ba);
 		syslog(LOG_INFO, "Connected [%s]", ba);
 
-		print_qos(nsk, addr);
+		if (peer)
+			print_bcast_snk_qos(nsk);
+		else
+			print_ucast_qos(nsk);
 
 		/* Handle deferred setup */
 		if (defer_setup) {
@@ -648,7 +721,7 @@ static int read_file(int fd, ssize_t count, bool rewind)
 	return len;
 }
 
-static void do_send(int sk, int fd, struct bt_iso_qos *qos, uint32_t num,
+static void do_send(int sk, int fd, struct bt_iso_io_qos *out, uint32_t num,
 		    bool repeat)
 {
 	uint32_t seq;
@@ -662,14 +735,14 @@ static void do_send(int sk, int fd, struct bt_iso_qos *qos, uint32_t num,
 
 	for (seq = 0; ; seq++) {
 		if (fd >= 0) {
-			len = read_file(fd, qos->out.sdu, repeat);
+			len = read_file(fd, out->sdu, repeat);
 			if (len < 0) {
 				syslog(LOG_ERR, "read failed: %s (%d)",
 						strerror(-len), -len);
 				exit(1);
 			}
 		} else
-			len = qos->out.sdu;
+			len = out->sdu;
 
 		len = send(sk, buf, len, 0);
 		if (len <= 0) {
@@ -686,7 +759,7 @@ static void do_send(int sk, int fd, struct bt_iso_qos *qos, uint32_t num,
 				seq, len, used / len, used);
 
 		if (seq && !((seq + 1) % num))
-			send_wait(&t_start, num * qos->out.interval);
+			send_wait(&t_start, num * out->interval);
 	}
 }
 
@@ -696,6 +769,7 @@ static void send_mode(char *filename, char *peer, int i, bool repeat)
 	socklen_t len;
 	int sk, fd = -1;
 	uint32_t num;
+	struct bt_iso_io_qos *out;
 
 	if (filename) {
 		char altername[PATH_MAX];
@@ -728,16 +802,21 @@ static void send_mode(char *filename, char *peer, int i, bool repeat)
 	syslog(LOG_INFO, "Sending ...");
 
 	/* Read QoS */
+	if (!strcmp(peer, "00:00:00:00:00:00"))
+		out = &qos.bcast.bsrc.out;
+	else
+		out = &qos.ucast.out;
+
 	memset(&qos, 0, sizeof(qos));
 	len = sizeof(qos);
 	if (getsockopt(sk, SOL_BLUETOOTH, BT_ISO_QOS, &qos, &len) < 0) {
 		syslog(LOG_ERR, "Can't get Output QoS socket option: %s (%d)",
 				strerror(errno), errno);
-		qos.out.sdu = ISO_DEFAULT_MTU;
+		out->sdu = ISO_DEFAULT_MTU;
 	}
 
 	/* num of packets = latency (ms) / interval (us) */
-	num = (qos.out.latency * 1000 / qos.out.interval);
+	num = (out->latency * 1000 / out->interval);
 
 	syslog(LOG_INFO, "Number of packets: %d", num);
 
@@ -746,8 +825,8 @@ static void send_mode(char *filename, char *peer, int i, bool repeat)
 		 * latency:
 		 * jitter buffer = 2 * (SDU * subevents)
 		 */
-		sndbuf = 2 * ((qos.out.latency * 1000 / qos.out.interval) *
-							qos.out.sdu);
+		sndbuf = 2 * ((out->latency * 1000 / out->interval) *
+							out->sdu);
 
 	len = sizeof(sndbuf);
 	if (setsockopt(sk, SOL_SOCKET, SO_SNDBUF, &sndbuf, len) < 0) {
@@ -768,10 +847,10 @@ static void send_mode(char *filename, char *peer, int i, bool repeat)
 		}
 	}
 
-	for (i = 6; i < qos.out.sdu; i++)
+	for (i = 6; i < out->sdu; i++)
 		buf[i] = 0x7f;
 
-	do_send(sk, fd, &qos, num, repeat);
+	do_send(sk, fd, out, num, repeat);
 }
 
 static void reconnect_mode(char *peer)
@@ -826,12 +905,14 @@ static void multy_connect_mode(char *peer)
 
 #define QOS(_interval, _latency, _sdu, _phy, _rtn) \
 { \
-	.cig = BT_ISO_QOS_CIG_UNSET, \
-	.cis = BT_ISO_QOS_CIS_UNSET, \
-	.sca = 0x07, \
-	.packing = 0x00, \
-	.framing = 0x00, \
-	.out = QOS_IO(_interval, _latency, _sdu, _phy, _rtn), \
+	.ucast = { \
+		.cig = BT_ISO_QOS_CIG_UNSET, \
+		.cis = BT_ISO_QOS_CIS_UNSET, \
+		.sca = 0x07, \
+		.packing = 0x00, \
+		.framing = 0x00, \
+		.out = QOS_IO(_interval, _latency, _sdu, _phy, _rtn), \
+	}, \
 }
 
 #define QOS_PRESET(_name, _inout, _interval, _latency, _sdu, _phy, _rtn) \
@@ -1057,43 +1138,43 @@ int main(int argc, char *argv[])
 
 		case 'M':
 			if (optarg)
-				iso_qos->out.sdu = atoi(optarg);
+				iso_qos->ucast.out.sdu = atoi(optarg);
 			break;
 
 		case 'S':
 			if (optarg)
-				iso_qos->sca = atoi(optarg);
+				iso_qos->ucast.sca = atoi(optarg);
 			break;
 
 
 		case 'P':
 			if (optarg)
-				iso_qos->packing = atoi(optarg);
+				iso_qos->ucast.packing = atoi(optarg);
 			break;
 
 		case 'F':
 			if (optarg)
-				iso_qos->framing = atoi(optarg);
+				iso_qos->ucast.framing = atoi(optarg);
 			break;
 
 		case 'I':
 			if (optarg)
-				iso_qos->out.interval = atoi(optarg);
+				iso_qos->ucast.out.interval = atoi(optarg);
 			break;
 
 		case 'L':
 			if (optarg)
-				iso_qos->out.latency = atoi(optarg);
+				iso_qos->ucast.out.latency = atoi(optarg);
 			break;
 
 		case 'Y':
 			if (optarg)
-				iso_qos->out.phy = atoi(optarg);
+				iso_qos->ucast.out.phy = atoi(optarg);
 			break;
 
 		case 'R':
 			if (optarg)
-				iso_qos->out.rtn = atoi(optarg);
+				iso_qos->ucast.out.rtn = atoi(optarg);
 			break;
 
 		case 'B':
@@ -1112,12 +1193,12 @@ int main(int argc, char *argv[])
 
 		case 'G':
 			if (optarg)
-				iso_qos->cig = atoi(optarg);
+				iso_qos->ucast.cig = atoi(optarg);
 			break;
 
 		case 'T':
 			if (optarg)
-				iso_qos->cis = atoi(optarg);
+				iso_qos->ucast.cis = atoi(optarg);
 			break;
 
 		/* fall through */
@@ -1128,11 +1209,11 @@ int main(int argc, char *argv[])
 	}
 
 	if (inout) {
-		iso_qos->in = iso_qos->out;
+		iso_qos->ucast.in = iso_qos->ucast.out;
 	} else {
 		/* Align interval and latency even if is unidirectional */
-		iso_qos->in.interval = iso_qos->out.interval;
-		iso_qos->in.latency = iso_qos->out.latency;
+		iso_qos->ucast.in.interval = iso_qos->ucast.out.interval;
+		iso_qos->ucast.in.latency = iso_qos->ucast.out.latency;
 	}
 
 	buf = malloc(data_size);
-- 
2.34.1

