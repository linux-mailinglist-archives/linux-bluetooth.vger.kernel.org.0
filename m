Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4AE7D9C9D
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Oct 2023 17:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345887AbjJ0PIt (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 27 Oct 2023 11:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345650AbjJ0PIr (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 27 Oct 2023 11:08:47 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2075.outbound.protection.outlook.com [40.107.22.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BEBB12A
        for <linux-bluetooth@vger.kernel.org>; Fri, 27 Oct 2023 08:08:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HB7QY/HjyJgvjv5n6+G+czuu4WQJPz6jUXaHo3xGiwsE3FtWkKCWPYgKlclv2+ZklxRi/Cc1vc7NypjAiroQPGkkgIsixIzPu+8vvLo0oZDkJmsKR8xvcF9dCMoGT1A8SlcaW85behy1ueC3lQRVxjcRekFHFbOVw9sthu+jLKHXYLQC+X4ugnU/Nx5dsQEYuac7rWdimsYuCJ+QQem9DYXn9FGGH8RdW8BCbGdsxCIJ/zJXn3Dx53KyxiK34N6Ql1XEFw9fDR4mYEpmpRuPIWaQviuBebCMN7xZUyZFzQFJkeQEO3Ll3+xrioegDlpjjgF5CloSM/Zq6NS0WXWM/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZtqAv+sSidZ21jw4s2ezgizbscRDUoKLVo5ZTCQ0fw=;
 b=nElKbAl0eCZssjKJekUizATRjuZprHDqpIls2xyAFIukX/HE/Y/hmamRjDfMSHoyBFnflR4u9v+2Fudcy46c/JgNTrEItngsMrQuKvwbOIPXVrO9Si5vWNXLvnOIoZwrHLQ9EvOTasUIaNXa8iH4G2XaFr5C79ixwT+lW2X+IZmdJn/OjUmkfTX9ToYA4xynRGtVumWo4DOcGckpADYY0mS8aHIieRV4g5t9igPylDN2chMl/NyfB9FsjfJfSOrQjAkMblFWHCg0Th1k+FRvaRekwG1pA+O6jqjHvR+IOK2G/lK/SJcK50+3JQ10dozgkSDQU0Ekp6nXHM1g+zjvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZtqAv+sSidZ21jw4s2ezgizbscRDUoKLVo5ZTCQ0fw=;
 b=GBpl8UPi6bpvlh4/SzpZPpJIdUFhKijyOmchM/4tBdlzD4vlMOlGy2ISyenp4K7Nm1GohjP6WAcwhkyls1Vpo0gpPRidLnk3i6dpykJD29eyz6V0mRymYgHC8Uvf1J3miib1WcJKV7bjrtScvLJsd7uDAuU5vTGBsALQefShV9U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8898.eurprd04.prod.outlook.com (2603:10a6:20b:42d::15)
 by AS5PR04MB9756.eurprd04.prod.outlook.com (2603:10a6:20b:677::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Fri, 27 Oct
 2023 15:08:40 +0000
Received: from AS8PR04MB8898.eurprd04.prod.outlook.com
 ([fe80::35fb:6e51:ad06:4a09]) by AS8PR04MB8898.eurprd04.prod.outlook.com
 ([fe80::35fb:6e51:ad06:4a09%3]) with mapi id 15.20.6954.011; Fri, 27 Oct 2023
 15:08:40 +0000
From:   Iulia Tanasescu <iulia.tanasescu@nxp.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     claudia.rosu@nxp.com, mihai-octavian.urzica@nxp.com,
        silviu.barbulescu@nxp.com, vlad.pruteanu@nxp.com,
        andrei.istodorescu@nxp.com, luiz.dentz@gmail.com,
        Iulia Tanasescu <iulia.tanasescu@nxp.com>
Subject: [PATCH BlueZ 1/1] iso-tester: Add test for bcast AC 13 reconnect
Date:   Fri, 27 Oct 2023 18:08:31 +0300
Message-Id: <20231027150831.10866-2-iulia.tanasescu@nxp.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231027150831.10866-1-iulia.tanasescu@nxp.com>
References: <20231027150831.10866-1-iulia.tanasescu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P194CA0052.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::41) To AS8PR04MB8898.eurprd04.prod.outlook.com
 (2603:10a6:20b:42d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8898:EE_|AS5PR04MB9756:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f4fe22-a656-447d-84fe-08dbd6fe9a85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FuSVAxoWY4ARTGU+Qeszqz3elueoyQ79pkTkkhqhVwNwald8QEhOkWrf8DqNaP7L1xiGJ/5/c7Ap/LFYYsjM22nLgcWNY/Fls3fRRh6QDdlRMprgeEPVL/YtwJCQAnn2qpSZf5czAe0CtF8b5+ahsDThC4Tfi4PWZW3ZH4FTnSGbK1yeE9eSfb0QQ6qMD9peP/QMPdCsto1p8GiKSZXXZWyMpeEoRn1T86U46FWpOy+kW/OT04KJ3PlQB304Z91qD3PUpaQwfP9hg1NlnJ3wQn1KliKTl15XYU1YVrS/ux8+4hWBfBXb2H7ZtZINO9fMdbR78GiFrmvJCMe2aw0DQLPHusO+ssQgWq1wsmk1osydGCTgS39Mp0d8kObJGO2HJYwN2QKlAdI5/weUsf/9ftXt5TzIL7OnIOZc4J0Ey2YSQ8NPOaNSdeECTShuhooZyZUbf/D7Cvz9tlgrACInctpHnoKieIqle/uYMoiNhXDfaYQ75FSGTDdWufesyVOEvWeWr6jATuOSgpUuF+uZyr1pthao61sWQfZzcIBCdWKEfbKPQzTQOHHFWOPfrd8J
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8898.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(346002)(376002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(36756003)(6666004)(6916009)(86362001)(2906002)(66946007)(66556008)(316002)(38100700002)(26005)(1076003)(2616005)(6486002)(478600001)(66476007)(83380400001)(6512007)(8676002)(8936002)(5660300002)(44832011)(4326008)(6506007)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XwX7rftWxdAh2DH6vAyo6PnojmKseVF2cpEqEdYvDZrjTUqFLqeqjGlaZ4IO?=
 =?us-ascii?Q?l6Fo80MYecfiMA0qgfIpNmEx4Ds7lT5n6MEsYWGNpOv+HXwlwGPHWndHdrF6?=
 =?us-ascii?Q?qTaI6A6YSJZ1EPrudEzmrqzWWljK8sx7y5F1EX+jaINYFaQYScopTbmUx/pr?=
 =?us-ascii?Q?yTfg8pSSu6zsNW9QbRCuPRjSvAgnUOiYNlp5Cdhb1o/013ncguVXr6uL2q+1?=
 =?us-ascii?Q?tJo2uUYDXLjCbjJLjrKpU+KnhIZGKA/nLovfQ0m1zMHrIv5I6F4TuPIQ10Zw?=
 =?us-ascii?Q?9xJK0qBZ3iwB10bIiudmg/DFB4h0WD3zC96i27ZMyqLnXLrsaP5b+RyE2TyV?=
 =?us-ascii?Q?uC5vXcaZqpSWpyRgVJp/llO5KmMx8qzkAWLP8zPSd7tl/OGz2UCo+qOrynx7?=
 =?us-ascii?Q?8oaOzmdzZO029pqILjhwmvf6m18ch27Fh7BVRw2EPhRJa4e4rezII2RTtqHQ?=
 =?us-ascii?Q?VXm0mp9xLSbwT9JYr6TZPBeNqfOGWcHMjdnvjxWvkfcAIDcxRu4RNBT7IFe6?=
 =?us-ascii?Q?7NYiXHTYYvaJ56/ss6XhmtYRiT9CuPZPRSICkD3bIfL+iGbWAfW4kF0qTzxh?=
 =?us-ascii?Q?lZ//vtdxqDqPf7lFMM9wQQgrYAYrw4bll2rpf6Sl+UOZ8bXE+c1zpVCxt5RH?=
 =?us-ascii?Q?i/QvBOIXABzhtUSmubhdyBtoR60nDyOI1dwRPapDDKd49rs4q797Cm7gYeJx?=
 =?us-ascii?Q?ic0FBDZhDU+E7G3gUoKC6YPC4nsYTkUzkz+pz+BKadCSK/Tl95ZEbV3IIHSX?=
 =?us-ascii?Q?lwYvjkoCZ+1g9Bhhmiyj1MRFPnbJlRATkWmJTIZYxGr8gEEDibxZYpbVrmIm?=
 =?us-ascii?Q?eUhgV8qdjgHF0lOOcbVUyrmY9q4CoeDM8OLDKUlL08g3ZkxdTtLkB3qjTdz1?=
 =?us-ascii?Q?/LWtiQaqjqGLJY+UgUIkLFTkXqQdaYv8HMBHtBKkEdJ05Q01UOOBDX40t+Sg?=
 =?us-ascii?Q?GDI50ULLCKThJMNx7ZD5bpe4PzPKxTyr9VXUG3k9r/SICNTO/IqAakaF8FQF?=
 =?us-ascii?Q?NfrPFO/mfId58LvTcqd5aQNmMsXbhw59ZiqyjWLtQJcYI9wSFpjFT3zkpuVd?=
 =?us-ascii?Q?JPlTFCwPvKbbTrGd1IUE1hku1J1mCF9gO3655IZh9NbDanPAmRf1BlLe0vAc?=
 =?us-ascii?Q?tXdB9Jij1FZh1QMd1FPCHe0okY6/P9kaX5Xu+0cQIj2f/g0cMaKWWIj4t4be?=
 =?us-ascii?Q?yMvo0bfCYunHR8pC3o7m1iuSoarxszu2YEoZgr1QDLETNT35GY4t5oAp/gq1?=
 =?us-ascii?Q?Az1CQ/hFAj8qoG8C92qVeJjidYK7T1Mrrba/up5gD4gAlAG87skBkatI9P01?=
 =?us-ascii?Q?Z5BBGGru2RxeV5riRJsWYcCIxTf8/LvNIfzGFncqZfnHIaoeoQyhTa7Ykzeg?=
 =?us-ascii?Q?//Z3i/UBuoKGvGL79XfWFmVjTBgI5s8Cu8KLElRQaeBfwHsijfmMU7nwppLU?=
 =?us-ascii?Q?68q3e5Ny6WIylQR9Kd4hgYgc8bLgTq4CPING+EFhn3vFq8zsCxy80xGwUQMe?=
 =?us-ascii?Q?YPPfaes2imf2natFX/+IFlPG/u9wicpxmzw1uxiq+grHI6QpMqwGHKgCMZi1?=
 =?us-ascii?Q?M/jOd4MIJ22fV/7srSt6oGD/4FShO5Mo0aiMeWXYtTzLvMtIhF9nTbBA8SOo?=
 =?us-ascii?Q?nw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f4fe22-a656-447d-84fe-08dbd6fe9a85
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8898.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 15:08:40.7069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1Z2RysU9vpBmdmSzJsPKpHVNuBOYXcdiJFAAOrxWwc7tNdHcE9sAwDwJUXm+m7YRF5YtPv4F2SStcS9eWrW5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9756
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This adds a test for Broadcast AC 13 reconnect:

ISO Broadcaster AC 13 Reconnect - Success

---
 tools/iso-tester.c | 60 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 6 deletions(-)

diff --git a/tools/iso-tester.c b/tools/iso-tester.c
index ae98af775..9fccbaa80 100644
--- a/tools/iso-tester.c
+++ b/tools/iso-tester.c
@@ -32,6 +32,7 @@
 #include "src/shared/tester.h"
 #include "src/shared/mgmt.h"
 #include "src/shared/util.h"
+#include "src/shared/queue.h"
 
 #define QOS_IO(_interval, _latency, _sdu, _phy, _rtn) \
 { \
@@ -388,7 +389,7 @@ struct test_data {
 	uint8_t accept_reason;
 	uint16_t handle;
 	uint16_t acl_handle;
-	GIOChannel *io;
+	struct queue *io_queue;
 	unsigned int io_id[2];
 	uint8_t client_num;
 	int step;
@@ -592,12 +593,19 @@ static void test_post_teardown(const void *test_data)
 	data->hciemu = NULL;
 }
 
+static void io_free(void *data)
+{
+	GIOChannel *io = data;
+
+	g_io_channel_unref(io);
+}
+
 static void test_data_free(void *test_data)
 {
 	struct test_data *data = test_data;
 
-	if (data->io)
-		g_io_channel_unref(data->io);
+	if (data->io_queue)
+		queue_destroy(data->io_queue, io_free);
 
 	if (data->io_id[0] > 0)
 		g_source_remove(data->io_id[0]);
@@ -1181,6 +1189,16 @@ static const struct iso_client_data bcast_ac_13_1_1 = {
 	.base_len = sizeof(base_lc3_ac_13),
 };
 
+static const struct iso_client_data bcast_ac_13_1_1_reconn = {
+	.qos = BCAST_AC_13_1_1,
+	.expect_err = 0,
+	.bcast = true,
+	.mconn = true,
+	.base = base_lc3_ac_13,
+	.base_len = sizeof(base_lc3_ac_13),
+	.disconnect = true,
+};
+
 static const struct iso_client_data bcast_ac_13_1 = {
 	.qos = BCAST_AC_13_1,
 	.expect_err = 0,
@@ -1911,10 +1929,14 @@ static gboolean iso_disconnected(GIOChannel *io, GIOCondition cond,
 							gpointer user_data)
 {
 	struct test_data *data = user_data;
+	const struct iso_client_data *isodata = data->test_data;
 
 	data->io_id[0] = 0;
 
-	if ((cond & G_IO_HUP) && !data->handle) {
+	if (cond & G_IO_HUP) {
+		if (!isodata->bcast && data->handle)
+			tester_test_failed();
+
 		tester_print("Successfully disconnected");
 
 		if (data->reconnect) {
@@ -2177,7 +2199,15 @@ static void setup_connect_many(struct test_data *data, uint8_t n, uint8_t *num,
 		data->io_id[num[i]] = g_io_add_watch(io, G_IO_OUT, func[i],
 									NULL);
 
-		g_io_channel_unref(io);
+		if (!isodata->bcast || !data->reconnect)
+			g_io_channel_unref(io);
+		else if (data->io_queue)
+			/* For the broadcast reconnect scenario, do not
+			 * unref channel here, to avoid closing the
+			 * socket. All queued channels will be closed
+			 * by test_data_free.
+			 */
+			queue_push_tail(data->io_queue, io);
 
 		tester_print("Connect %d in progress", num[i]);
 
@@ -2434,7 +2464,9 @@ static bool iso_defer_accept(struct test_data *data, GIOChannel *io)
 
 	tester_print("Accept deferred setup");
 
-	data->io = io;
+	data->io_queue = queue_new();
+	if (data->io_queue)
+		queue_push_tail(data->io_queue, io);
 
 	if (isodata->bcast)
 		data->io_id[0] = g_io_add_watch(io, G_IO_IN,
@@ -2758,6 +2790,18 @@ static void test_bcast2(const void *test_data)
 	setup_connect_many(data, 2, num, funcs);
 }
 
+static void test_bcast2_reconn(const void *test_data)
+{
+	struct test_data *data = tester_get_data();
+	uint8_t num[2] = {0, 1};
+	GIOFunc funcs[2] = {iso_connect_cb, iso_connect2_cb};
+
+	data->io_queue = queue_new();
+
+	data->reconnect = true;
+	setup_connect_many(data, 2, num, funcs);
+}
+
 static void test_bcast_recv(const void *test_data)
 {
 	struct test_data *data = tester_get_data();
@@ -3114,6 +3158,10 @@ int main(int argc, char *argv[])
 	test_iso("ISO Broadcaster AC 13 BIG 0x01 - Success", &bcast_ac_13_1,
 						setup_powered, test_bcast2);
 
+	test_iso("ISO Broadcaster AC 13 Reconnect - Success",
+					&bcast_ac_13_1_1_reconn, setup_powered,
+					test_bcast2_reconn);
+
 	test_iso("ISO Broadcaster AC 14 - Success", &bcast_ac_14, setup_powered,
 							test_bcast);
 
-- 
2.39.2

