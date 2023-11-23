Return-Path: <linux-bluetooth+bounces-192-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 582AF7F625F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 23 Nov 2023 16:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09594281F8C
	for <lists+linux-bluetooth@lfdr.de>; Thu, 23 Nov 2023 15:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C42135EE1;
	Thu, 23 Nov 2023 15:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="c/s90/85"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2064.outbound.protection.outlook.com [40.107.247.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F06D67
	for <linux-bluetooth@vger.kernel.org>; Thu, 23 Nov 2023 07:10:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdKyXbz7aF16Va/DDoNKOu5Xtm8B6QQOIkvf1pJkYziAK3UyDWcGcNa/NXejAuhgSdRbOSTXhheFFMnbvdQzuEwwXAhVeLo3dXdAuZcFNzoqCG3RPqQjhKFUYBYqN6hswwpsnXoeOc0MtPdng1QsIrdo84lMVixi1NDZgICJOAsrfe9JQyxVKAtUpieLlFd7cXjpXDZ1rPxLjnM19uZ68axoxyEfP9PdOSGMQkg0UiZBwvFmZngQ5l5ZmvZzuzTya/Bg/sPaVcoiVSnZwfNLIeLquvc1/az3nCRZsHoTRGcNiwPy5rCBptQN+IGsCiIZ1dXrnqN1bSC31l18QSH9RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEifwHE9IGs4xp6NLyN+af2UVyIv16Gokuv94yNspp8=;
 b=XdLR8UclxEqxnwW49vFTBKi9jKBhcT3uX/Kk6uLfjf3UXU2dIwVQobK/e3rXqPnXDQ1rhtPlxoSyTYkoX/vsdsdpFr0EWejWGU169Qr3rI8kj6zxBriIsiqHryoLGYUi3/ZkZAXQ9Ycwh7vDuChHvqcqw5RszhiUJxzrdYFSAFHyz+bxd95+tQXg2oR7DAdC90twDHNLxiOmWK4M1mGf2S+h23ARuBuCx9sknsuIa+u9c0OsepHV4CnuxFOydZP1q/XKqT8gAdQf2LTS0wLv87C7ahgVQgt23a1QzC5ADoLEbU+JFlNtigohr11qMwLjz86HjuRdSpcZdrDG+bqBRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEifwHE9IGs4xp6NLyN+af2UVyIv16Gokuv94yNspp8=;
 b=c/s90/855TuQvebgJBQG+aGa7M3DcphXzNg4BLGQGpZUsyJOa7cIiZI2+MmGd8c2Jo+vQ7TpWOAw367H8G7dVgMhPGOt58SGBIUuVX4jY/1XZ6npHKv5JQnTm9TAG0zCT6VQXzApEQQ2RjmHB7TG4qmWIbJBCl3AXrckxr5Z5SQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB10073.eurprd04.prod.outlook.com (2603:10a6:800:1dd::8)
 by VI1PR04MB6928.eurprd04.prod.outlook.com (2603:10a6:803:12e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Thu, 23 Nov
 2023 15:10:45 +0000
Received: from VI1PR04MB10073.eurprd04.prod.outlook.com
 ([fe80::c38d:98a0:a823:d88a]) by VI1PR04MB10073.eurprd04.prod.outlook.com
 ([fe80::c38d:98a0:a823:d88a%6]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 15:10:45 +0000
From: Silviu Florian Barbulescu <silviu.barbulescu@nxp.com>
To: linux-bluetooth@vger.kernel.org
Cc: claudia.rosu@nxp.com,
	mihai-octavian.urzica@nxp.com,
	silviu.barbulescu@nxp.com,
	vlad.pruteanu@nxp.com,
	andrei.istodorescu@nxp.com,
	luiz.dentz@gmail.com,
	iulia.tanasescu@nxp.com
Subject: [PATCH BlueZ v5 3/5] Add support for multiple BISes
Date: Thu, 23 Nov 2023 17:10:31 +0200
Message-Id: <20231123151033.22898-4-silviu.barbulescu@nxp.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231123151033.22898-1-silviu.barbulescu@nxp.com>
References: <20231123151033.22898-1-silviu.barbulescu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0044.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::7) To VI1PR04MB10073.eurprd04.prod.outlook.com
 (2603:10a6:800:1dd::8)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB10073:EE_|VI1PR04MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: bb509f11-8223-4290-9942-08dbec365e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7rgyZZJUNhHE+4HpRLjtJ3ng6sQg6KN8Fffgh4a/vETarOMc4jc1mS7HoFWplBQKkwTifqyB/dSSIE07W4lokrYdF/qwnXqcDLWZPQ0fT5H+YKyXmyaWuV6FaOAPv/tRPqgXnBJOBvs8zeeAVvehKG9JsyKd/RHDPcKtsnfMWISYERv3n5j3S3IoshHk3MYI+1wnocAn8QkmPNW51LoX3BZWhpyjdK9CNBufJ1uUVDOaw7oP2jbI6aRl7NQ7cgonW5wiez06FVJIaGegNRxSfjppTFAVJEdvRxg3L3AnLCbhAaJQUZFINYOEfrFUT7gl0Mj2aYtdIW+lF3lLIQpRwNuznDX/sDE4POvYYhnURxJUFSrY0tM0z8EtmYK5IH2+aF054V5iGk3z7TCkT72Q60THDCtILRTlR4c5KKajcKPnuJ5Z+4WzMiDA6U+dRmaiRhCyTOV077qi4GpJwiF4eHMVMOskdSzT5XXplN9vyl9qVZOqarxIf2wLFZyzEpOGZbLuE0iDdMdExNpSK5GaVLHG/MncYfXnLHIWG6aF/pXBlz+/J/3kd7RLo9cdagxU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB10073.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(396003)(136003)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(2616005)(6512007)(6506007)(26005)(6486002)(1076003)(8676002)(8936002)(2906002)(5660300002)(30864003)(36756003)(4326008)(41300700001)(66556008)(86362001)(66476007)(66946007)(316002)(6916009)(478600001)(6666004)(38100700002)(83380400001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?svCs+jWI6Eczt/Q8kaHVgNfh50DKC12R9wKJ2AFSJawAPyUUR3AngW0UwAWz?=
 =?us-ascii?Q?MBeLqdwrhPeawcjaXMLwMMXi3UIVko7dTqChUdpU/CxDJ+NJDON0nnNEUAue?=
 =?us-ascii?Q?NcW7SoBKdBFpuT9RV5gTuUAScqCyZtlAAbyX9x3pSDly8CHSeeciinE+mTDu?=
 =?us-ascii?Q?beUyYwhqJGwtl1364ZUVkWwc83jXhzFyxg19/U25rXD5PKHdiqS6uRrVStht?=
 =?us-ascii?Q?fWIyFICCc4sxFo+G4fdRMDfVfdkQum26ISTszQ7+FTb67wxKx74mwFIVTVP0?=
 =?us-ascii?Q?7SytbxDyHRnBUsFp/JCo+fYjTqynEt1kMrCOnqCBWSXYiaHIG5N7TqptDc7J?=
 =?us-ascii?Q?e5kGy2b+BI/nfGGHfGCpLEG73v/TFMXjC5et4TtXZNRU8vZyovcO+z4Hpi5e?=
 =?us-ascii?Q?yuXCp3N8FkDCWzrU2Jv3IGRIGkkJlC/QIzIJU3Dhy1rkGUSDzs7rVYx0hIM7?=
 =?us-ascii?Q?rSzin82mmJN4r2+n+ZLhiFbeyQnnOxmo2OWIbw1nxh74IQ9DQkb5yCwI3dbD?=
 =?us-ascii?Q?hzlN+FapTiSGOM6XEKxfQOv3NwkAUVDZOdsOKI8w10vXHvDm/6sCidGBTrjT?=
 =?us-ascii?Q?dFeAnMR340kMAoESadTcdkIDa7tcy7ny9cL52velOfiVKaCdKtcd/MAoIJby?=
 =?us-ascii?Q?+jwPQ2s5Oww5KQyT6OMOE235fOlbzB5yEF3nYuImhvtR8IGdSWGWzkCRjYWh?=
 =?us-ascii?Q?FTWKAKBdXu38cu5Mfl8e6ZbPE4zZfPnuQzFTi1TdumfpAoz/zKwvxr9k1/eP?=
 =?us-ascii?Q?VVJY2ZTZGyaVORciTzz1IDo6XtveZwIITmaZDD2mbQ5VgmsePnkJR348PYtJ?=
 =?us-ascii?Q?U79QT0TRcF+fTrAmkCXoo+YBpxGlVDbl7183Wtw7CkGerPxhecVrAyn+BOFQ?=
 =?us-ascii?Q?OoRDX/F2n7GlaA3d4VMTSO3c3mjGgtr8vqLoRrW51P1BSQZuDLuS00+HNST5?=
 =?us-ascii?Q?MfYe4NNJrFzc9+15Emrg03sQHqA2Zsoo8w+tLHoyJJNVN3PvROCZZdR098rf?=
 =?us-ascii?Q?eabr3soueg3E7jy/eEN65VmV6Wh3YOsq/5t31RHWpEpiBGDXz2FMl0mFUmoL?=
 =?us-ascii?Q?dgZQmYEzl7Muy9kG8d0Gjalqjwr8yqTD/b3U4DK3H7abL+17dcik/HwTxGBU?=
 =?us-ascii?Q?YC3WpPJy/v+dUfOb53wO31t+PE7FF36lGLocuMzi/rXakkcixaV+TwOFopVv?=
 =?us-ascii?Q?HvY2YCsH5ICwAJPuBLI5Z8BaMILpaa2JiDtL+qUSal7UWFzK7BKcszCS/iqB?=
 =?us-ascii?Q?gPwvurX52CAnX20ootebDec5J07zFpBTNznJVNFDitWKP3zupim5XBZtNq2K?=
 =?us-ascii?Q?FerywSlKyv9mh43cQsh+ev5OkDdxxFV22Izd0e45CGl5D9j4ZJydAmZP8rea?=
 =?us-ascii?Q?sLyUXfnkb6Q5goXbRi2BIj6iUlJGxDyIUfZiKp5Aw291mdJeOcteJLLRxyMG?=
 =?us-ascii?Q?f8jW5hAX5flWS6EAulll3mu3QcuGJorA6IBYQ1/nwD40CU5KLwXkTacrS6mI?=
 =?us-ascii?Q?BdF5y2xo1VO6/GjJ84BTMoNixpDnFm4A9rdTaCc3YBcC3r14m5YM5V4UWMxa?=
 =?us-ascii?Q?JuU+yZCUDcS0Iw6k6O/7Rt4fS2LS48krvs9OUeDyqLGBUtfCXkvP52P64FgS?=
 =?us-ascii?Q?GQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb509f11-8223-4290-9942-08dbec365e22
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB10073.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 15:10:45.7542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JT9yZljdgPaFC+AGiNEljX8NI4gIZcpz1Bvh22r3j17arS2r9BIgubU1m3ad5avaQMSI0fnLk7FPqZ09x5oT/Wn01U6VrH8UVGZERGpGMMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6928

Add support for bcast multiple BISes

---
 profiles/audio/bap.c | 583 +++++++++++++++++++++++++++++++------------
 src/shared/bap.c     | 223 ++++++++++++++---
 src/shared/bap.h     |  35 ++-
 unit/test-bap.c      |  12 +-
 4 files changed, 644 insertions(+), 209 deletions(-)

diff --git a/profiles/audio/bap.c b/profiles/audio/bap.c
index 38a860c07..8bd4f6c86 100644
--- a/profiles/audio/bap.c
+++ b/profiles/audio/bap.c
@@ -97,6 +97,35 @@ struct bap_data {
 	void *user_data;
 };
 
+#define DEFAULT_IO_QOS \
+{ \
+	.interval	= 10000, \
+	.latency	= 10, \
+	.sdu		= 40, \
+	.phy		= 0x02, \
+	.rtn		= 2, \
+}
+
+static struct bt_iso_qos default_qos = {
+	.bcast = {
+		.big			= BT_ISO_QOS_BIG_UNSET,
+		.bis			= BT_ISO_QOS_BIS_UNSET,
+		.sync_factor	= 0x07,
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
+	}
+};
+
 static struct queue *sessions;
 
 static bool bap_data_set_user_data(struct bap_data *data, void *user_data)
@@ -254,7 +283,11 @@ static gboolean get_device(const GDBusPropertyTable *property,
 	const char *path;
 
 	if (bt_bap_pac_get_type(ep->lpac) == BT_BAP_BCAST_SOURCE)
-		path = adapter_get_path(ep->data->adapter);
+		/*
+		 *Use remote endpoint path as fake device path
+		 *for the remote broadcast source endpoint
+		 */
+		path = ep->path;
 	else
 		path = device_get_path(ep->data->device);
 
@@ -379,101 +412,203 @@ static int parse_array(DBusMessageIter *iter, struct iovec *iov)
 	return 0;
 }
 
-static bool parse_base(void *data, size_t len, util_debug_func_t func,
-		uint32_t *presDelay, uint8_t *numSubgroups, uint8_t *numBis,
-		struct bt_bap_codec *codec, struct iovec **caps,
-		struct iovec **meta)
+static void cleanup_subgroup(struct bt_bap_base_subgroup *subGroup)
+{
+	if (!subGroup)
+		return;
+
+	if (subGroup->meta)
+		util_iov_free(subGroup->meta, 1);
+
+	if (subGroup->caps)
+		util_iov_free(subGroup->caps, 1);
+
+	while (!queue_isempty(subGroup->bises)) {
+		struct bt_bap_bis *bis = queue_peek_head(subGroup->bises);
+
+		if (bis->caps)
+			util_iov_free(bis->caps, 1);
+		queue_remove(subGroup->bises, bis);
+		subGroup->numBises--;
+	}
+	queue_destroy(subGroup->bises, NULL);
+
+	if (subGroup)
+		free(subGroup);
+}
+
+static bool parse_base(struct bt_bap *bap, void *data, size_t len,
+		util_debug_func_t func, struct bt_bap_base *base)
 {
+	uint8_t numSubgroups;
+	uint8_t numBis;
+
 	struct iovec iov = {
 		.iov_base = data,
 		.iov_len = len,
 	};
+	util_debug(func, NULL, "BASE len %ld", len);
+	if (!base)
+		return false;
 
-	uint8_t capsLen, metaLen;
-	uint8_t *hexstream;
+	if (!util_iov_pull_le24(&iov, &base->presDelay))
+		return false;
+	util_debug(func, NULL, "PresentationDelay %d", base->presDelay);
 
-	if (presDelay) {
-		if (!util_iov_pull_le24(&iov, presDelay))
-			return false;
-		util_debug(func, NULL, "PresentationDelay %d", *presDelay);
-	}
+	if (!util_iov_pull_u8(&iov, &base->numSubgroups))
+		return false;
+	util_debug(func, NULL, "NumSubgroups %d", base->numSubgroups);
+	numSubgroups = base->numSubgroups;
 
-	if (numSubgroups) {
-		if (!util_iov_pull_u8(&iov, numSubgroups))
-			return false;
-		util_debug(func, NULL, "NumSubgroups %d", *numSubgroups);
-	}
+	for (int sg = 0; sg < numSubgroups; sg++) {
+		struct bt_bap_base_subgroup *subGroup = new0(
+						struct bt_bap_base_subgroup, 1);
+		uint8_t capsLen, metaLen;
+		uint8_t *hexstream;
 
-	if (numBis) {
-		if (!util_iov_pull_u8(&iov, numBis))
-			return false;
-		util_debug(func, NULL, "NumBis %d", *numBis);
-	}
+		subGroup->subGroupIndex = sg;
 
-	if (codec) {
-		codec = util_iov_pull_mem(&iov, sizeof(*codec));
-		if (!codec)
-			return false;
+		util_debug(func, NULL, "Subgroup #%d", sg);
+		subGroup->bap = bap;
+		subGroup->bises = queue_new();
+
+		if (!util_iov_pull_u8(&iov, &numBis)) {
+			cleanup_subgroup(subGroup);
+			goto fail;
+		}
+		util_debug(func, NULL, "NumBis %d", numBis);
+		subGroup->numBises = numBis;
+
+		memcpy(&subGroup->codec, util_iov_pull_mem(&iov,
+		sizeof(struct bt_bap_codec)), sizeof(struct bt_bap_codec));
 		util_debug(func, NULL, "%s: ID %d CID 0x%2.2x VID 0x%2.2x",
-				"Codec", codec->id, codec->cid, codec->vid);
-	}
+			"Codec", subGroup->codec.id, subGroup->codec.cid,
+				subGroup->codec.vid);
+		if (!util_iov_pull_u8(&iov, &capsLen)) {
+			cleanup_subgroup(subGroup);
+			goto fail;
+		}
 
-	if (!util_iov_pull_u8(&iov, &capsLen))
-		return false;
-	util_debug(func, NULL, "CC Len %d", capsLen);
+		util_debug(func, NULL, "CC Len %d", capsLen);
 
-	if (!capsLen)
-		return false;
-	if (caps) {
-		if (!(*caps))
-			*caps = new0(struct iovec, 1);
-		(*caps)->iov_len = capsLen;
-		(*caps)->iov_base = iov.iov_base;
-	}
+		subGroup->caps = new0(struct iovec, 1);
+		util_iov_memcpy(subGroup->caps, iov.iov_base, capsLen);
+		DBG("subgroup caps len %ld", subGroup->caps->iov_len);
 
-	for (int i = 0; capsLen > 1; i++) {
-		struct bt_ltv *ltv = util_iov_pull_mem(&iov, sizeof(*ltv));
-		uint8_t *caps;
+		for (int i = 0; capsLen > 1; i++) {
+			struct bt_ltv *ltv = util_iov_pull_mem(&iov,
+								sizeof(*ltv));
+			uint8_t *caps;
 
-		if (!ltv) {
-			util_debug(func, NULL, "Unable to parse %s",
-								"Capabilities");
-			return false;
+			if (!ltv) {
+				util_debug(func, NULL, "Unable to parse %s",
+							"Capabilities");
+				cleanup_subgroup(subGroup);
+				goto fail;
+			}
+
+			util_debug(func, NULL, "%s #%u: len %u type %u",
+						"CC", i, ltv->len, ltv->type);
+
+			caps = util_iov_pull_mem(&iov, ltv->len - 1);
+			if (!caps) {
+				util_debug(func, NULL, "Unable to parse %s",
+									"CC");
+				cleanup_subgroup(subGroup);
+				goto fail;
+			}
+			util_hexdump(' ', caps, ltv->len - 1, func, NULL);
+
+			capsLen -= (ltv->len + 1);
 		}
 
-		util_debug(func, NULL, "%s #%u: len %u type %u",
-					"CC", i, ltv->len, ltv->type);
+		if (!util_iov_pull_u8(&iov, &metaLen)) {
+			cleanup_subgroup(subGroup);
+			goto fail;
+		}
+		util_debug(func, NULL, "Metadata Len %d", metaLen);
 
-		caps = util_iov_pull_mem(&iov, ltv->len - 1);
-		if (!caps) {
-			util_debug(func, NULL, "Unable to parse %s",
-								"CC");
-			return false;
+		subGroup->meta = new0(struct iovec, 1);
+		subGroup->meta->iov_len = metaLen;
+		subGroup->meta->iov_base = iov.iov_base;
+
+		hexstream = util_iov_pull_mem(&iov, metaLen);
+		if (!hexstream) {
+			cleanup_subgroup(subGroup);
+			goto fail;
 		}
-		util_hexdump(' ', caps, ltv->len - 1, func, NULL);
+		util_hexdump(' ', hexstream, metaLen, func, NULL);
 
-		capsLen -= (ltv->len + 1);
-	}
+		for (int bis_sg = 0; bis_sg < subGroup->numBises; bis_sg++) {
+			struct bt_bap_bis *bis;
+			uint8_t capsLen;
+			uint8_t crtBis;
 
-	if (!util_iov_pull_u8(&iov, &metaLen))
-		return false;
-	util_debug(func, NULL, "Metadata Len %d", metaLen);
+			if (!util_iov_pull_u8(&iov, &crtBis)) {
+				cleanup_subgroup(subGroup);
+				goto fail;
+			}
+			util_debug(func, NULL, "BIS #%d", crtBis);
 
-	if (!metaLen)
-		return false;
-	if (meta) {
-		if (!(*meta))
-			*meta = new0(struct iovec, 1);
-		(*meta)->iov_len = metaLen;
-		(*meta)->iov_base = iov.iov_base;
-	}
+			bis = new0(struct bt_bap_bis, 1);
+			bis->bisIndex = crtBis;
 
-	hexstream = util_iov_pull_mem(&iov, metaLen);
-	if (!hexstream)
-		return false;
-	util_hexdump(' ', hexstream, metaLen, func, NULL);
+			if (!util_iov_pull_u8(&iov, &capsLen)) {
+				cleanup_subgroup(subGroup);
+				goto fail;
+			}
+			util_debug(func, NULL, "CC Len %d", capsLen);
+
+			bis->caps = new0(struct iovec, 1);
+			bis->caps->iov_len = capsLen;
+			util_iov_memcpy(bis->caps, iov.iov_base, capsLen);
+			DBG("bis caps len %ld", bis->caps->iov_len);
+
+			for (int i = 0; capsLen > 1; i++) {
+				struct bt_ltv *ltv = util_iov_pull_mem(&iov,
+								sizeof(*ltv));
+				uint8_t *caps;
+
+				if (!ltv) {
+					util_debug(func, NULL, "Unable to parse %s",
+								"Capabilities");
+					cleanup_subgroup(subGroup);
+					goto fail;
+				}
+
+				util_debug(func, NULL, "%s #%u: len %u type %u",
+						"CC", i, ltv->len, ltv->type);
+
+				caps = util_iov_pull_mem(&iov, ltv->len - 1);
+				if (!caps) {
+					util_debug(func, NULL,
+						"Unable to parse %s", "CC");
+					cleanup_subgroup(subGroup);
+					goto fail;
+				}
+				util_hexdump(' ', caps, ltv->len - 1, func,
+									NULL);
+
+				capsLen -= (ltv->len + 1);
+			}
+
+			queue_push_tail(subGroup->bises, bis);
+		}
 
+		queue_push_tail(base->subgroups, subGroup);
+	}
 	return true;
+
+fail:
+		while (!queue_isempty(base->subgroups)) {
+			struct bt_bap_base_subgroup *subGroup =
+					queue_peek_head(base->subgroups);
+			cleanup_subgroup(subGroup);
+			base->numSubgroups--;
+		}
+		util_debug(func, NULL, "Unable to parse %s", "Base");
+
+		return false;
 }
 
 static int parse_io_qos(const char *key, int var, DBusMessageIter *iter,
@@ -556,6 +691,16 @@ static int parse_bcast_qos(const char *key, int var, DBusMessageIter *iter,
 			return -EINVAL;
 
 		dbus_message_iter_get_basic(iter, &qos->bcast.encryption);
+	} else if (!strcasecmp(key, "BIG")) {
+		if (var != DBUS_TYPE_BYTE)
+			return -EINVAL;
+
+		dbus_message_iter_get_basic(iter, &qos->bcast.big);
+	}  else if (!strcasecmp(key, "BIS")) {
+		if (var != DBUS_TYPE_BYTE)
+			return -EINVAL;
+
+		dbus_message_iter_get_basic(iter, &qos->bcast.bis);
 	} else if (!strcasecmp(key, "Options")) {
 		if (var != DBUS_TYPE_BYTE)
 			return -EINVAL;
@@ -653,10 +798,12 @@ static int parse_qos(DBusMessageIter *iter, struct bt_bap_qos *qos,
 
 static int parse_configuration(DBusMessageIter *props, struct iovec **caps,
 				struct iovec **metadata, struct iovec **base,
-				struct bt_bap_qos *qos)
+				struct bt_bap_qos *qos,
+				struct bt_bap_base *base_s)
 {
 	const char *key;
 	struct iovec iov;
+	base_s->subgroups = NULL;
 
 	memset(&iov, 0, sizeof(iov));
 
@@ -702,14 +849,10 @@ static int parse_configuration(DBusMessageIter *props, struct iovec **caps,
 	}
 
 	if (*base) {
-		uint32_t presDelay;
-		uint8_t numSubgroups, numBis;
-		struct bt_bap_codec codec;
-
 		util_iov_memcpy(*base, (*caps)->iov_base, (*caps)->iov_len);
-		parse_base((*caps)->iov_base, (*caps)->iov_len, bap_debug,
-			&presDelay, &numSubgroups, &numBis, &codec,
-			caps, NULL);
+		base_s->subgroups = queue_new();
+		parse_base(NULL, (*caps)->iov_base, (*caps)->iov_len,
+							bap_debug, base_s);
 	}
 
 	return 0;
@@ -796,12 +939,53 @@ static void bap_io_close(struct bap_ep *ep)
 	ep->cig_active = false;
 }
 
+static bool match_bis_by_id(const void *data, const void *user_data)
+{
+	int32_t bis_id = PTR_TO_INT(user_data);
+	const struct bt_bap_bis *bis = data;
+
+	return bis->bisIndex == bis_id;
+}
+
+static int get_number_bises_in_base(struct queue *subgroups)
+{
+	const struct queue_entry *entry;
+	struct bt_bap_base_subgroup *subgroup;
+	int nr_bis = 0;
+
+	for (entry = queue_get_entries(subgroups); entry;
+						entry = entry->next) {
+		subgroup = entry->data;
+		nr_bis += subgroup->numBises;
+	}
+
+	return nr_bis;
+}
+
+static int get_number_bcast_source_ep(struct bap_ep *ep)
+{
+	const struct queue_entry *entry;
+	struct bap_ep *current_ep;
+	int nr_ep = 0;
+
+	for (entry = queue_get_entries(ep->data->bcast); entry;
+						entry = entry->next) {
+		current_ep = entry->data;
+		if (bt_bap_pac_get_type(current_ep->lpac) ==
+						BT_BAP_BCAST_SOURCE)
+			nr_ep++;
+	}
+
+	return nr_ep;
+}
+
 static DBusMessage *set_configuration(DBusConnection *conn, DBusMessage *msg,
 								void *data)
 {
 	struct bap_ep *ep = data;
 	const char *path;
 	DBusMessageIter args, props;
+	struct bt_bap_base parse_bap_base;
 
 	if (ep->msg)
 		return btd_error_busy(msg);
@@ -832,11 +1016,57 @@ static DBusMessage *set_configuration(DBusConnection *conn, DBusMessage *msg,
 	}
 
 	if (parse_configuration(&props, &ep->caps, &ep->metadata,
-				&ep->base, &ep->qos) < 0) {
+				&ep->base, &ep->qos, &parse_bap_base) < 0) {
 		DBG("Unable to parse configuration");
 		return btd_error_invalid_args(msg);
 	}
 
+	if (bt_bap_pac_get_type(ep->lpac) == BT_BAP_BCAST_SOURCE) {
+		unsigned int nr_ep = 1;
+		unsigned int nr_bises;
+		const struct queue_entry *entry;
+		struct bt_bap_bis *curent_bis = NULL;
+		struct bt_bap_base_subgroup *subgroup;
+
+		for (entry = queue_get_entries(parse_bap_base.subgroups);
+				entry; entry = entry->next) {
+			subgroup = entry->data;
+			curent_bis = queue_find(subgroup->bises,
+					match_bis_by_id,
+					INT_TO_PTR(ep->qos.bcast.bis));
+			if(curent_bis != NULL)
+				break;
+		}
+
+		if (curent_bis == NULL) {
+			DBG("Unable to find BIS");
+			return btd_error_invalid_args(msg);
+		}
+		util_iov_free(ep->caps, 1);
+		ep->caps = new0(struct iovec, 1);
+		bt_bap_ltv_merge(ep->caps, subgroup->caps, false);
+		bt_bap_ltv_merge(ep->caps, curent_bis->caps, false);
+
+		nr_ep = get_number_bcast_source_ep(ep);
+		nr_bises = get_number_bises_in_base(parse_bap_base.subgroups);
+		if (nr_ep < nr_bises) {
+			for (uint8_t i = 0; i < nr_bises-1; i++)
+				bt_bap_add_vendor_pac_from_pac(ep->lpac);
+		}
+	} else if ((bt_bap_pac_get_type(ep->rpac) == BT_BAP_BCAST_SOURCE) &&
+			(bt_bap_pac_get_type(ep->lpac) == BT_BAP_BCAST_SINK)) {
+		util_iov_free(ep->caps, 1);
+		ep->caps = new0(struct iovec, 1);
+		bt_bap_ltv_merge(ep->caps, bt_bap_pac_get_data(ep->rpac),
+									false);
+	}
+	/*
+	 * Kernel uses bis id as advertising handler. To open all BISes from
+	 * a big on the same advertisng handler set the bis
+	 * to BT_ISO_QOS_BIS_UNSET
+	 */
+	ep->qos.bcast.bis = BT_ISO_QOS_BIS_UNSET;
+
 	/* TODO: Check if stream capabilities match add support for Latency
 	 * and PHY.
 	 */
@@ -848,7 +1078,7 @@ static DBusMessage *set_configuration(DBusConnection *conn, DBusMessage *msg,
 						config_cb, ep);
 	if (!ep->id) {
 		DBG("Unable to config stream");
-		free(ep->caps);
+		util_iov_free(ep->caps, 1);
 		ep->caps = NULL;
 		return btd_error_invalid_args(msg);
 	}
@@ -901,31 +1131,16 @@ static void update_bcast_qos(struct bt_iso_qos *qos,
 		sizeof(qos->bcast.bcode));
 }
 
-static bool match_ep_type(const void *data, const void *user_data)
-{
-	const struct bap_ep *ep = data;
-
-	return (bt_bap_pac_get_type(ep->lpac) == PTR_TO_INT(user_data));
-}
-
 static void iso_bcast_confirm_cb(GIOChannel *io, GError *err, void *user_data)
 {
-	struct bap_data *data = user_data;
+	struct bap_ep *ep = user_data;
 	struct bt_iso_qos qos;
-	struct bt_iso_base base;
 	char address[18];
-	struct bap_ep *ep;
 	int fd;
-	struct iovec *base_io;
-	uint32_t presDelay;
-	uint8_t numSubgroups;
-	uint8_t numBis;
-	struct bt_bap_codec codec;
 
 	bt_io_get(io, &err,
 			BT_IO_OPT_DEST, address,
 			BT_IO_OPT_QOS, &qos,
-			BT_IO_OPT_BASE, &base,
 			BT_IO_OPT_INVALID);
 	if (err) {
 		error("%s", err->message);
@@ -934,29 +1149,15 @@ static void iso_bcast_confirm_cb(GIOChannel *io, GError *err, void *user_data)
 	}
 
 	g_io_channel_ref(io);
-	btd_service_connecting_complete(data->service, 0);
+	btd_service_connecting_complete(ep->data->service, 0);
 	DBG("BCAST ISO: sync with %s (BIG 0x%02x BIS 0x%02x)",
 					address, qos.bcast.big, qos.bcast.bis);
 
-	ep = queue_find(data->bcast, match_ep_type,
-			INT_TO_PTR(BT_BAP_BCAST_SINK));
-	if (!ep)
-		return;
-
 	update_bcast_qos(&qos, &ep->qos);
 
-	base_io = new0(struct iovec, 1);
-	util_iov_memcpy(base_io, base.base, base.base_len);
-
-	parse_base(base_io->iov_base, base_io->iov_len, bap_debug,
-			&presDelay, &numSubgroups, &numBis,
-			&codec, &ep->caps, &ep->metadata);
-
-	/* Update pac with BASE information */
-	bt_bap_update_bcast_source(ep->rpac, &codec, ep->caps, ep->metadata);
 	ep->id = bt_bap_stream_config(ep->stream, &ep->qos,
 					ep->caps, NULL, NULL);
-	data->listen_io = io;
+	ep->data->listen_io = io;
 
 	bt_bap_stream_set_user_data(ep->stream, ep->path);
 
@@ -968,25 +1169,39 @@ static void iso_bcast_confirm_cb(GIOChannel *io, GError *err, void *user_data)
 		return;
 	}
 
-
 	return;
 
 drop:
 	g_io_channel_shutdown(io, TRUE, NULL);
-
 }
 
 static void iso_pa_sync_confirm_cb(GIOChannel *io, void *user_data)
 {
 	GError *err = NULL;
+	struct bt_iso_base base;
+	char address[18];
+	struct bt_bap_base base_s;
+	struct bap_data *data = user_data;
+	struct bt_iso_qos qos;
 
-	if (!bt_io_bcast_accept(io, iso_bcast_confirm_cb,
-				user_data, NULL, &err, BT_IO_OPT_INVALID)) {
-		error("bt_io_bcast_accept: %s", err->message);
+	bt_io_get(io, &err,
+			BT_IO_OPT_DEST, address,
+			BT_IO_OPT_QOS, &qos,
+			BT_IO_OPT_BASE, &base,
+			BT_IO_OPT_INVALID);
+	if (err) {
+		error("%s", err->message);
 		g_error_free(err);
-		g_io_channel_shutdown(io, TRUE, NULL);
+		return;
 	}
+	g_io_channel_ref(io);
+	data->listen_io = io;
+	btd_service_connecting_complete(data->service, 0);
 
+	base_s.subgroups = queue_new();
+	parse_base(data->bap, base.base, base.base_len, bap_debug, &base_s);
+
+	bt_bap_update_bcast_source(NULL, &base_s);
 }
 
 static bool match_data_bap_data(const void *data, const void *match_data)
@@ -1082,6 +1297,7 @@ static struct bap_ep *ep_register_bcast(struct bap_data *data,
 	case BT_BAP_BCAST_SINK:
 		err = asprintf(&ep->path, "%s/pac_%s%d",
 				device_get_path(device), suffix, i);
+		ep->io = data->listen_io;
 		ep->base = new0(struct iovec, 1);
 		break;
 	}
@@ -1103,7 +1319,7 @@ static struct bap_ep *ep_register_bcast(struct bap_data *data,
 	}
 
 	/*
-	 * The broadcast source local endpoint has only lpac and broadcast 
+	 * The broadcast source local endpoint has only lpac and broadcast
 	 * sink local endpoint has a rpac and a lpac
 	 */
 	if (rpac)
@@ -1587,9 +1803,12 @@ static gboolean bap_io_disconnected(GIOChannel *io, GIOCondition cond,
 
 	bap_io_close(ep);
 
-	/* Check if connecting recreate IO */
-	if (!is_cig_busy(ep->data, ep->qos.ucast.cig_id))
-		recreate_cig(ep);
+	if (bt_bap_stream_get_type(ep->stream) ==
+					BT_BAP_STREAM_TYPE_UCAST) {
+		/* Check if connecting recreate IO */
+		if (!is_cig_busy(ep->data, ep->qos.ucast.cig_id))
+			recreate_cig(ep);
+	}
 
 	return FALSE;
 }
@@ -1680,7 +1899,7 @@ static void bap_connect_io(struct bap_data *data, struct bap_ep *ep,
 
 static void bap_connect_io_broadcast(struct bap_data *data, struct bap_ep *ep,
 				struct bt_bap_stream *stream,
-				struct bt_iso_qos *qos)
+				struct bt_iso_qos *qos, int defer)
 {
 	struct btd_adapter *adapter = data->user_data;
 	GIOChannel *io = NULL;
@@ -1716,7 +1935,7 @@ static void bap_connect_io_broadcast(struct bap_data *data, struct bap_ep *ep,
 			BT_IO_OPT_MODE, BT_IO_MODE_ISO,
 			BT_IO_OPT_QOS, qos,
 			BT_IO_OPT_BASE, &base,
-			BT_IO_OPT_DEFER_TIMEOUT, false,
+			BT_IO_OPT_DEFER_TIMEOUT, defer,
 			BT_IO_OPT_INVALID);
 
 	if (!io) {
@@ -1768,42 +1987,28 @@ static void bap_listen_io(struct bap_data *data, struct bt_bap_stream *stream,
 static void bap_listen_io_broadcast(struct bap_data *data, struct bap_ep *ep,
 			struct bt_bap_stream *stream, struct bt_iso_qos *qos)
 {
-	GIOChannel *io;
 	GError *err = NULL;
 	struct sockaddr_iso_bc iso_bc_addr;
 
 	iso_bc_addr.bc_bdaddr_type = btd_device_get_bdaddr_type(data->device);
 	memcpy(&iso_bc_addr.bc_bdaddr, device_get_address(data->device),
 			sizeof(bdaddr_t));
-	iso_bc_addr.bc_bis[0] = 1;
 	iso_bc_addr.bc_num_bis = 1;
+	iso_bc_addr.bc_bis[0] = strtol(bt_bap_pac_get_name(ep->rpac), NULL, 10);
 
 	DBG("stream %p", stream);
 
-	/* If IO already set skip creating it again */
-	if (bt_bap_stream_get_io(stream) || data->listen_io)
-		return;
-
-	io = bt_io_listen(NULL, iso_pa_sync_confirm_cb, ep->data, NULL, &err,
-			BT_IO_OPT_SOURCE_BDADDR,
-			btd_adapter_get_address(ep->data->adapter),
-			BT_IO_OPT_DEST_BDADDR,
-			device_get_address(data->device),
-			BT_IO_OPT_DEST_TYPE,
-			btd_device_get_bdaddr_type(data->device),
-			BT_IO_OPT_MODE, BT_IO_MODE_ISO,
-			BT_IO_OPT_QOS, &qos->bcast,
-			BT_IO_OPT_ISO_BC_NUM_BIS, iso_bc_addr.bc_num_bis,
-			BT_IO_OPT_ISO_BC_BIS, iso_bc_addr.bc_bis,
-			BT_IO_OPT_INVALID);
-	if (!io) {
-		error("%s", err->message);
+	if (!bt_io_bcast_accept(ep->data->listen_io, iso_bcast_confirm_cb,
+				ep, NULL, &err,
+				BT_IO_OPT_ISO_BC_NUM_BIS,
+				iso_bc_addr.bc_num_bis, BT_IO_OPT_ISO_BC_BIS,
+				iso_bc_addr.bc_bis, BT_IO_OPT_INVALID)) {
+		error("bt_io_bcast_accept: %s", err->message);
 		g_error_free(err);
+		g_io_channel_shutdown(ep->data->listen_io, TRUE, NULL);
 	}
-	ep->io = io;
-	ep->data->listen_io = io;
-
 }
+
 static void bap_create_ucast_io(struct bap_data *data, struct bap_ep *ep,
 				struct bt_bap_stream *stream, int defer)
 {
@@ -1838,9 +2043,6 @@ static void bap_create_bcast_io(struct bap_data *data, struct bap_ep *ep,
 
 	memset(&iso_qos, 0, sizeof(iso_qos));
 
-	if (!defer)
-		goto done;
-
 	iso_qos.bcast.big = ep->qos.bcast.big;
 	iso_qos.bcast.bis = ep->qos.bcast.bis;
 	iso_qos.bcast.sync_factor = ep->qos.bcast.sync_factor;
@@ -1857,9 +2059,9 @@ static void bap_create_bcast_io(struct bap_data *data, struct bap_ep *ep,
 	iso_qos.bcast.timeout = ep->qos.bcast.timeout;
 	memcpy(&iso_qos.bcast.out, &ep->qos.bcast.io_qos,
 				sizeof(struct bt_iso_io_qos));
-done:
+
 	if (bt_bap_pac_get_type(ep->lpac) == BT_BAP_BCAST_SOURCE)
-		bap_connect_io_broadcast(data, ep, stream, &iso_qos);
+		bap_connect_io_broadcast(data, ep, stream, &iso_qos, defer);
 	else
 		bap_listen_io_broadcast(data, ep, stream, &iso_qos);
 }
@@ -1884,6 +2086,31 @@ static void bap_create_io(struct bap_data *data, struct bap_ep *ep,
 		break;
 	}
 }
+/*
+ * Function  test_linked_streams_state will check if all linked streams
+ * have the test state.
+ * If all streams are in test_state returns true; Else returns false
+ */
+static bool test_linked_streams_state(struct bt_bap_stream *stream,
+						uint8_t test_state)
+{
+	const struct queue_entry *entry;
+	struct bt_bap_stream *linked_stream;
+	struct queue *links;
+
+	links = bt_bap_stream_io_get_links(stream);
+
+	if (!links)
+		return true;
+
+	for (entry = queue_get_entries(links); entry; entry = entry->next) {
+		linked_stream = entry->data;
+		if (bt_bap_stream_get_state(linked_stream) != test_state)
+			return false;
+	}
+
+	return true;
+}
 
 static void bap_state(struct bt_bap_stream *stream, uint8_t old_state,
 				uint8_t new_state, void *user_data)
@@ -1915,15 +2142,26 @@ static void bap_state(struct bt_bap_stream *stream, uint8_t old_state,
 		break;
 	case BT_BAP_STREAM_STATE_CONFIG:
 		if (ep && !ep->id) {
-			bap_create_io(data, ep, stream, true);
-			if (!ep->io) {
-				error("Unable to create io");
-				bt_bap_stream_release(stream, NULL, NULL);
-				return;
-			}
-
 			if (bt_bap_stream_get_type(stream) ==
+					BT_BAP_STREAM_TYPE_BCAST) {
+				bool defer = !test_linked_streams_state(stream,
+						BT_BAP_STREAM_STATE_CONFIG);
+				bap_create_io(data, ep, stream, defer);
+				if (!ep->io) {
+					error("Unable to create io");
+					bt_bap_stream_release(stream,
+								NULL, NULL);
+					return;
+				}
+			} else if (bt_bap_stream_get_type(stream) ==
 					BT_BAP_STREAM_TYPE_UCAST) {
+				bap_create_io(data, ep, stream, true);
+				if (!ep->io) {
+					error("Unable to create io");
+					bt_bap_stream_release(stream,
+								NULL, NULL);
+					return;
+				}
 				/* Wait QoS response to respond */
 				ep->id = bt_bap_stream_qos(stream, &ep->qos,
 								qos_cb,	ep);
@@ -2237,6 +2475,12 @@ static int bap_bcast_probe(struct btd_service *service)
 	struct btd_gatt_database *database = btd_adapter_get_database(adapter);
 	struct bap_data *data = btd_service_get_user_data(service);
 	char addr[18];
+	GIOChannel *io;
+	GError *err = NULL;
+	struct sockaddr_iso_bc iso_bc_addr;
+
+	iso_bc_addr.bc_bis[0] = 1;
+	iso_bc_addr.bc_num_bis = 1;
 
 	ba2str(device_get_address(device), addr);
 
@@ -2275,7 +2519,24 @@ static int bap_bcast_probe(struct btd_service *service)
 
 	bt_bap_set_user_data(data->bap, service);
 
-	bt_bap_new_bcast_source(data->bap, device_get_path(device));
+	DBG("Create PA sync with source");
+	io = bt_io_listen(NULL, iso_pa_sync_confirm_cb, data, NULL, &err,
+			BT_IO_OPT_SOURCE_BDADDR,
+			btd_adapter_get_address(data->adapter),
+			BT_IO_OPT_DEST_BDADDR,
+			device_get_address(data->device),
+			BT_IO_OPT_DEST_TYPE,
+			btd_device_get_bdaddr_type(data->device),
+			BT_IO_OPT_MODE, BT_IO_MODE_ISO,
+			BT_IO_OPT_QOS, &default_qos,
+			BT_IO_OPT_ISO_BC_NUM_BIS, iso_bc_addr.bc_num_bis,
+			BT_IO_OPT_ISO_BC_BIS, iso_bc_addr.bc_bis,
+			BT_IO_OPT_INVALID);
+	if (!io) {
+		error("%s", err->message);
+		g_error_free(err);
+	}
+
 	return 0;
 }
 
diff --git a/src/shared/bap.c b/src/shared/bap.c
index d8a3adde6..9593c77cf 100644
--- a/src/shared/bap.c
+++ b/src/shared/bap.c
@@ -254,6 +254,8 @@ static struct queue *bap_db;
 static struct queue *bap_cbs;
 static struct queue *sessions;
 
+static bool bt_bap_new_bcast_sink(struct bt_bap *bap);
+
 static bool bap_db_match(const void *data, const void *match_data)
 {
 	const struct bt_bap_db *bdb = data;
@@ -1111,7 +1113,8 @@ static struct bt_bap_stream_io *stream_get_io(struct bt_bap_stream *stream)
 		return stream->io;
 
 	io = NULL;
-	queue_foreach(stream->links, stream_find_io, &io);
+	if (bt_bap_stream_get_type(stream) == BT_BAP_STREAM_TYPE_UCAST)
+		queue_foreach(stream->links, stream_find_io, &io);
 
 	return io;
 }
@@ -1323,6 +1326,12 @@ static void stream_set_state_broadcast(struct bt_bap_stream *stream,
 
 	bt_bap_ref(bap);
 
+	switch (stream->ep->state) {
+	case BT_ASCS_ASE_STATE_QOS:
+		bap_stream_update_io_links(stream);
+		break;
+	}
+
 	for (entry = queue_get_entries(bap->state_cbs); entry;
 							entry = entry->next) {
 		struct bt_bap_state *state = entry->data;
@@ -2357,33 +2366,18 @@ static struct bt_bap_pac *bap_pac_find(struct bt_bap_db *bdb, uint8_t type,
 	return NULL;
 }
 
-static void *ltv_merge(struct iovec *data, struct iovec *cont)
-{
-	uint8_t delimiter = 0;
-
-	if (!data)
-		return NULL;
-
-	if (!cont || !cont->iov_len || !cont->iov_base)
-		return data->iov_base;
-
-	iov_append(data, sizeof(delimiter), &delimiter);
-
-	return iov_append(data, cont->iov_len, cont->iov_base);
-}
-
 static void bap_pac_merge(struct bt_bap_pac *pac, struct iovec *data,
 					struct iovec *metadata)
 {
 	/* Merge data into existing record */
 	if (pac->data)
-		ltv_merge(pac->data, data);
+		bt_bap_ltv_merge(pac->data, data, true);
 	else
 		pac->data = util_iov_dup(data, 1);
 
 	/* Merge metadata into existing record */
 	if (pac->metadata)
-		ltv_merge(pac->metadata, metadata);
+		bt_bap_ltv_merge(pac->metadata, metadata, true);
 	else
 		pac->metadata = util_iov_dup(metadata, 1);
 }
@@ -2614,6 +2608,20 @@ static void notify_session_pac_added(void *data, void *user_data)
 	queue_foreach(bap->pac_cbs, notify_pac_added, user_data);
 }
 
+struct bt_bap_pac *bt_bap_add_vendor_pac_from_pac(struct bt_bap_pac *pac)
+{
+	struct bt_bap_pac *new_pac;
+
+	new_pac = bt_bap_add_vendor_pac(pac->bdb->db, pac->name, pac->type,
+							pac->codec.id,
+							pac->codec.cid,
+							pac->codec.cid,
+							&pac->qos, pac->data,
+							pac->metadata);
+	bt_bap_pac_set_ops(new_pac, pac->ops, pac->user_data);
+	return new_pac;
+}
+
 struct bt_bap_pac *bt_bap_add_vendor_pac(struct gatt_db *db,
 					const char *name, uint8_t type,
 					uint8_t id, uint16_t cid, uint16_t vid,
@@ -2671,7 +2679,7 @@ struct bt_bap_pac *bt_bap_add_pac(struct gatt_db *db, const char *name,
 					struct iovec *metadata)
 {
 	return bt_bap_add_vendor_pac(db, name, type, id, 0x0000, 0x0000, qos,
-							data, metadata);
+						    data, metadata);
 }
 
 uint8_t bt_bap_pac_get_type(struct bt_bap_pac *pac)
@@ -2701,6 +2709,14 @@ uint32_t bt_bap_pac_get_locations(struct bt_bap_pac *pac)
 	}
 }
 
+struct iovec *bt_bap_pac_get_data(struct bt_bap_pac *pac)
+{
+	if (!pac)
+		return 0x00;
+
+	return pac->data;
+}
+
 uint16_t bt_bap_pac_get_supported_context(struct bt_bap_pac *pac)
 {
 	struct bt_pacs *pacs;
@@ -2783,12 +2799,26 @@ static void notify_session_pac_removed(void *data, void *user_data)
 bool bt_bap_pac_set_ops(struct bt_bap_pac *pac, struct bt_bap_pac_ops *ops,
 					void *user_data)
 {
+	const struct queue_entry *entry = NULL;
+	struct bt_bap_pac *pac_entry;
+
 	if (!pac)
 		return false;
 
 	pac->ops = ops;
 	pac->user_data = user_data;
 
+	if (pac->type == BT_BAP_BCAST_SOURCE) {
+		for (entry = queue_get_entries(pac->bdb->broadcast_sources);
+					entry != NULL; entry = entry->next) {
+			pac_entry = entry->data;
+			if (pac_entry != pac) {
+				pac_entry->ops = ops;
+				pac_entry->user_data = user_data;
+			}
+		}
+	}
+
 	return true;
 }
 
@@ -4471,6 +4501,11 @@ bool bt_bap_pac_bcast_is_local(struct bt_bap *bap, struct bt_bap_pac *pac)
 	return false;
 }
 
+char *bt_bap_pac_get_name(struct bt_bap_pac *pac)
+{
+	return pac->name;
+}
+
 static bool find_ep_unused(const void *data, const void *user_data)
 {
 	const struct bt_bap_endpoint *ep = data;
@@ -4591,7 +4626,6 @@ unsigned int bt_bap_stream_config(struct bt_bap_stream *stream,
 		if (stream->lpac->type == BT_BAP_BCAST_SINK) {
 			if (data)
 				stream_config(stream, data, NULL);
-			stream_set_state(stream, BT_BAP_STREAM_STATE_CONFIG);
 		}
 		return 1;
 	}
@@ -4682,7 +4716,7 @@ struct bt_bap_stream *bt_bap_stream_new(struct bt_bap *bap,
 			return NULL;
 
 		bt_bap_foreach_pac(bap, type, match_pac, &match);
-		if (!match.lpac)
+		if ((!match.lpac) || (!lpac))
 			return NULL;
 		if (!match.rpac && (lpac->type != BT_BAP_BCAST_SOURCE))
 			return NULL;
@@ -4699,7 +4733,15 @@ struct bt_bap_stream *bt_bap_stream_new(struct bt_bap *bap,
 	if (!ep) {
 		/* Check for unused ASE */
 		ep = queue_find(bap->remote_eps, find_ep_unused, &match);
-		if (!ep) {
+		if (!ep && lpac->type == BT_BAP_BCAST_SOURCE) {
+			bt_bap_new_bcast_sink(bap);
+			ep = queue_find(bap->remote_eps, find_ep_unused,
+								&match);
+			if (!ep) {
+				DBG(bap, "Unable to find unused ASE");
+				return NULL;
+			}
+		} else if (!ep) {
 			DBG(bap, "Unable to find unused ASE");
 			return NULL;
 		}
@@ -4712,6 +4754,15 @@ struct bt_bap_stream *bt_bap_stream_new(struct bt_bap *bap,
 	return stream;
 }
 
+void bt_bap_stream_foreach_link(struct bt_bap_stream *stream,
+			queue_foreach_func_t function, void *user_data)
+{
+	if (bt_bap_stream_get_type(stream) ==
+					BT_BAP_STREAM_TYPE_UCAST)
+		queue_foreach(bt_bap_stream_io_get_links(stream),
+						function, user_data);
+}
+
 struct bt_bap *bt_bap_stream_get_session(struct bt_bap_stream *stream)
 {
 	if (!stream)
@@ -4839,7 +4890,16 @@ static void bap_stream_enable_link(void *data, void *user_data)
 	struct bt_bap_stream *stream = data;
 	struct iovec *metadata = user_data;
 
-	bap_stream_metadata(stream, BT_ASCS_ENABLE, metadata, NULL, NULL);
+	switch (bt_bap_stream_get_type(stream)) {
+	case BT_BAP_STREAM_TYPE_UCAST:
+		bap_stream_metadata(stream, BT_ASCS_ENABLE, metadata,
+								NULL, NULL);
+		break;
+	case BT_BAP_STREAM_TYPE_BCAST:
+		stream_set_state_broadcast(stream,
+						BT_BAP_STREAM_STATE_CONFIG);
+		break;
+	}
 }
 
 unsigned int bt_bap_stream_enable(struct bt_bap_stream *stream,
@@ -4868,11 +4928,10 @@ unsigned int bt_bap_stream_enable(struct bt_bap_stream *stream,
 	case BT_BAP_STREAM_TYPE_BCAST:
 		if (!bt_bap_stream_io_dir(stream))
 			stream_set_state_broadcast(stream,
-				BT_BAP_STREAM_STATE_CONFIG);
+						BT_BAP_STREAM_STATE_CONFIG);
 		else if (bt_bap_stream_io_dir(stream) == BT_BAP_BCAST_SOURCE)
 			stream_set_state_broadcast(stream,
 				 BT_BAP_STREAM_STATE_STREAMING);
-
 		return 1;
 	}
 
@@ -4933,17 +4992,27 @@ static void bap_stream_disable_link(void *data, void *user_data)
 	struct iovec iov;
 	struct bt_ascs_disable disable;
 
-	memset(&disable, 0, sizeof(disable));
+	switch (bt_bap_stream_get_type(stream)) {
+	case BT_BAP_STREAM_TYPE_UCAST:
+		memset(&disable, 0, sizeof(disable));
+
+		disable.ase = stream->ep->id;
 
-	disable.ase = stream->ep->id;
+		iov.iov_base = &disable;
+		iov.iov_len = sizeof(disable);
 
-	iov.iov_base = &disable;
-	iov.iov_len = sizeof(disable);
+		req = bap_req_new(stream, BT_ASCS_DISABLE, &iov,
+							1, NULL, NULL);
 
-	req = bap_req_new(stream, BT_ASCS_DISABLE, &iov, 1, NULL, NULL);
+		if (!bap_queue_req(stream->bap, req))
+			bap_req_free(req);
+	break;
 
-	if (!bap_queue_req(stream->bap, req))
-		bap_req_free(req);
+	case BT_BAP_STREAM_TYPE_BCAST:
+		stream_set_state_broadcast(stream,
+				BT_BAP_STREAM_STATE_RELEASING);
+	break;
+	}
 }
 
 unsigned int bt_bap_stream_disable(struct bt_bap_stream *stream,
@@ -5189,7 +5258,8 @@ bool bt_bap_stream_set_io(struct bt_bap_stream *stream, int fd)
 
 	bap_stream_set_io(stream, INT_TO_PTR(fd));
 
-	queue_foreach(stream->links, bap_stream_set_io, INT_TO_PTR(fd));
+	if (bt_bap_stream_get_type(stream) == BT_BAP_STREAM_TYPE_UCAST)
+		queue_foreach(stream->links, bap_stream_set_io, INT_TO_PTR(fd));
 
 	return true;
 }
@@ -5210,6 +5280,23 @@ static bool match_name(const void *data, const void *match_data)
 	return (!strcmp(pac->name, name));
 }
 
+void *bt_bap_ltv_merge(struct iovec *data, struct iovec *cont,
+						bool add_delimiter)
+{
+	uint8_t delimiter = 0;
+
+	if (!data)
+		return NULL;
+
+	if (!cont || !cont->iov_len || !cont->iov_base)
+		return data->iov_base;
+
+	if (add_delimiter)
+		iov_append(data, sizeof(delimiter), &delimiter);
+
+	return iov_append(data, cont->iov_len, cont->iov_base);
+}
+
 int bt_bap_stream_cancel(struct bt_bap_stream *stream, unsigned int id)
 {
 	struct bt_bap_req *req;
@@ -5245,10 +5332,15 @@ int bt_bap_stream_io_link(struct bt_bap_stream *stream,
 	if (queue_find(stream->links, NULL, link))
 		return -EALREADY;
 
-	if (stream->client != link->client ||
+	if (bt_bap_stream_get_type(stream) == BT_BAP_STREAM_TYPE_BCAST) {
+		if (stream->qos.bcast.big != link->qos.bcast.big)
+			return -EINVAL;
+	} else {
+		if (stream->client != link->client ||
 			stream->qos.ucast.cig_id != link->qos.ucast.cig_id ||
 			stream->qos.ucast.cis_id != link->qos.ucast.cis_id)
-		return -EINVAL;
+			return -EINVAL;
+	}
 
 	if (!stream->links)
 		stream->links = queue_new();
@@ -5377,7 +5469,9 @@ int bt_bap_stream_io_connecting(struct bt_bap_stream *stream, int fd)
 
 	bap_stream_io_connecting(stream, INT_TO_PTR(fd));
 
-	queue_foreach(stream->links, bap_stream_io_connecting, INT_TO_PTR(fd));
+	if (bt_bap_stream_get_type(stream) == BT_BAP_STREAM_TYPE_UCAST)
+		queue_foreach(stream->links, bap_stream_io_connecting,
+						INT_TO_PTR(fd));
 
 	return 0;
 }
@@ -5433,11 +5527,58 @@ bool bt_bap_new_bcast_source(struct bt_bap *bap, const char *name)
 	return true;
 }
 
+static bool bt_bap_new_bcast_sink(struct bt_bap *bap)
+{
+	struct bt_bap_endpoint *ep;
+
+	/* Push remote endpoint with direction source */
+	ep = bap_endpoint_new_broadcast(bap->ldb, BT_BAP_BCAST_SOURCE);
+
+	if (ep)
+		queue_push_tail(bap->remote_eps, ep);
+
+	ep->bap = bap;
+	return true;
+}
+
+static void bis_to_pac(void *data, void *user_data)
+{
+	struct bt_bap_bis *bis = data;
+	struct bt_bap_base_subgroup *subgroup = user_data;
+	struct bt_bap_pac *pac_source_bis;
+	struct bt_bap_endpoint *ep;
+	int err = 0;
+
+	bt_bap_ltv_merge(bis->caps, subgroup->caps, false);
+	pac_source_bis = bap_pac_new(subgroup->bap->rdb, NULL,
+				BT_BAP_BCAST_SOURCE, &subgroup->codec, NULL,
+				bis->caps, subgroup->meta);
+
+	err = asprintf(&pac_source_bis->name, "%d", bis->bisIndex);
+
+	if (err < 0)
+		DBG(subgroup->bap, "error in asprintf");
+
+		/* Add remote source endpoint */
+	if (!subgroup->bap->rdb->broadcast_sources)
+		subgroup->bap->rdb->broadcast_sources = queue_new();
+	queue_push_tail(subgroup->bap->rdb->broadcast_sources, pac_source_bis);
+
+	queue_foreach(subgroup->bap->pac_cbs, notify_pac_added, pac_source_bis);
+	/* Push remote endpoint with direction sink */
+	ep = bap_endpoint_new_broadcast(subgroup->bap->rdb, BT_BAP_BCAST_SINK);
+
+	if (ep)
+		queue_push_tail(subgroup->bap->remote_eps, ep);
+}
+static void parse_bis(void *data, void *user_data)
+{
+	struct bt_bap_base_subgroup *subgroup = data;
+
+	queue_foreach(subgroup->bises, bis_to_pac, subgroup);
+}
 void bt_bap_update_bcast_source(struct bt_bap_pac *pac,
-					struct bt_bap_codec *codec,
-					struct iovec *data,
-					struct iovec *metadata)
+				struct bt_bap_base *base)
 {
-	bap_pac_merge(pac, data, metadata);
-	pac->codec = *codec;
+	queue_foreach(base->subgroups, parse_bis, NULL);
 }
diff --git a/src/shared/bap.h b/src/shared/bap.h
index 2c8f9208e..411655801 100644
--- a/src/shared/bap.h
+++ b/src/shared/bap.h
@@ -97,6 +97,27 @@ struct bt_bap_qos {
 	};
 };
 
+struct bt_bap_base {
+	uint32_t presDelay;
+	uint8_t numSubgroups;
+	struct queue *subgroups;
+};
+
+struct bt_bap_base_subgroup {
+	uint8_t subGroupIndex;
+	struct bt_bap *bap;
+	uint8_t numBises;
+	struct bt_bap_codec codec;
+	struct iovec *caps;
+	struct iovec *meta;
+	struct queue *bises;
+};
+
+struct bt_bap_bis {
+	uint8_t bisIndex;
+	struct iovec *caps;
+};
+
 typedef void (*bt_bap_ready_func_t)(struct bt_bap *bap, void *user_data);
 typedef void (*bt_bap_destroy_func_t)(void *user_data);
 typedef void (*bt_bap_debug_func_t)(const char *str, void *user_data);
@@ -168,6 +189,8 @@ uint8_t bt_bap_pac_get_type(struct bt_bap_pac *pac);
 
 uint32_t bt_bap_pac_get_locations(struct bt_bap_pac *pac);
 
+struct iovec *bt_bap_pac_get_data(struct bt_bap_pac *pac);
+
 uint16_t bt_bap_pac_get_supported_context(struct bt_bap_pac *pac);
 
 uint16_t bt_bap_pac_get_context(struct bt_bap_pac *pac);
@@ -176,6 +199,8 @@ struct bt_bap_pac_qos *bt_bap_pac_get_qos(struct bt_bap_pac *pac);
 
 uint8_t bt_bap_stream_get_type(struct bt_bap_stream *stream);
 
+struct bt_bap_pac *bt_bap_add_vendor_pac_from_pac(struct bt_bap_pac *pac);
+
 struct bt_bap_stream *bt_bap_pac_get_stream(struct bt_bap_pac *pac);
 
 /* Session related function */
@@ -231,6 +256,7 @@ int bt_bap_pac_get_codec(struct bt_bap_pac *pac, uint8_t *id,
 
 void bt_bap_pac_set_user_data(struct bt_bap_pac *pac, void *user_data);
 void *bt_bap_pac_get_user_data(struct bt_bap_pac *pac);
+char *bt_bap_pac_get_name(struct bt_bap_pac *pac);
 
 /* Stream related functions */
 int bt_bap_select(struct bt_bap_pac *lpac, struct bt_bap_pac *rpac,
@@ -242,6 +268,9 @@ struct bt_bap_stream *bt_bap_stream_new(struct bt_bap *bap,
 					struct bt_bap_qos *pqos,
 					struct iovec *data);
 
+void bt_bap_stream_foreach_link(struct bt_bap_stream *stream,
+			queue_foreach_func_t function, void *user_data);
+
 struct bt_bap *bt_bap_stream_get_session(struct bt_bap_stream *stream);
 uint8_t bt_bap_stream_get_state(struct bt_bap_stream *stream);
 
@@ -314,9 +343,9 @@ bool bt_bap_stream_io_is_connecting(struct bt_bap_stream *stream, int *fd);
 
 bool bt_bap_new_bcast_source(struct bt_bap *bap, const char *name);
 void bt_bap_update_bcast_source(struct bt_bap_pac *pac,
-					struct bt_bap_codec *codec,
-					struct iovec *data,
-					struct iovec *metadata);
+				struct bt_bap_base *base);
+void *bt_bap_ltv_merge(struct iovec *data, struct iovec *cont,
+						bool add_delimiter);
 
 bool bt_bap_pac_bcast_is_local(struct bt_bap *bap, struct bt_bap_pac *pac);
 
diff --git a/unit/test-bap.c b/unit/test-bap.c
index adade07db..d308d42f9 100644
--- a/unit/test-bap.c
+++ b/unit/test-bap.c
@@ -377,11 +377,13 @@ static void test_client_config(struct test_data *data)
 							"test-bap-snk",
 							BT_BAP_SINK, 0x0ff,
 							0x0001, 0x0001,
-							NULL, data->caps, NULL);
+							NULL, data->caps,
+							NULL);
 		else
 			data->snk = bt_bap_add_pac(data->db, "test-bap-snk",
 							BT_BAP_SINK, LC3_ID,
-							NULL, data->caps, NULL);
+							NULL, data->caps,
+							NULL);
 		g_assert(data->snk);
 	}
 
@@ -391,11 +393,13 @@ static void test_client_config(struct test_data *data)
 							"test-bap-src",
 							BT_BAP_SOURCE, 0x0ff,
 							0x0001, 0x0001,
-							NULL, data->caps, NULL);
+							NULL, data->caps,
+							NULL);
 		else
 			data->src = bt_bap_add_pac(data->db, "test-bap-src",
 							BT_BAP_SOURCE, LC3_ID,
-							NULL, data->caps, NULL);
+							NULL, data->caps,
+							NULL);
 		g_assert(data->src);
 	}
 }
-- 
2.39.2


