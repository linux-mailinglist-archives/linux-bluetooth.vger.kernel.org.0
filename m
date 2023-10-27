Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC6AD7D9C9B
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Oct 2023 17:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345512AbjJ0PIn (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 27 Oct 2023 11:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjJ0PIm (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 27 Oct 2023 11:08:42 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2044.outbound.protection.outlook.com [40.107.7.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FCFB116
        for <linux-bluetooth@vger.kernel.org>; Fri, 27 Oct 2023 08:08:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HoX6lasTXC4VTSsIHUAKh4eOeGXaqx7HzvsDtXIZ5GvoxFl0Wl/d31xjKEd7Ptc+PSNXdD2++UjWw3jLE6sSBxcWH3bbhQXKHoMQg4WHTY8iMzbjUQetuDpfWTjETfQcRV+Ug2U+zBL40afBg4YXdK8kMlh/l4VJiA/fxxViaFRbmDMTOF1uqjNcM41MafCITuSmoqfigeqgQt3/fFSrWsvGJYymv2faoiTIkErNd5Xm7TjIfZoI91IYPWjyUCuqy50iv45ach+uUSumWkwXQY57twsNmZn4hg4r1qq44PR1HVam+nRZRTT5daac1hQlvaGocMhEMea8jWCshxCRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oH8gkqGfOau8AwK80plgHqs+LcivT/pIzjJ9MHdkeyA=;
 b=WgKaGht4XlQ0nuhgInHP3TyBS4mzVk98FOmcK/U3LGltF70pfxWfVOfS+LVDX0VQ1VESUAL8uwVp5zFP5EuvBX2ndE+e8GIJlvrBextQUTpvLuAOTeVxpqiH4Z2VdcB5K3rYmwd1qX3sMVOd2nfSUxi8VicZfBgg925zRpZ9JHCPV9DrJ+CPWudIhJaJ596/ZzdGR1eq1/+YIweqdCIfrFXz2w34yi6wTdoeZI+Tv7BFfg+yGONlp5NBFHITEbLbWa+bveJ99Tdayo0bdpf8rSNU8vZ9xF5xSKSTeF6Q21pLQW+Hdv+L7Err7nF1ldRSGn2od8tQViBMF4uOhZc3tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oH8gkqGfOau8AwK80plgHqs+LcivT/pIzjJ9MHdkeyA=;
 b=aD8Wfx+hHPOW/MO1Gu/XeIGNMKa7CMDM8SOpL/aUFkW+j7xnvW4/jgmfBLZ9EoBMZT1sDFjwqV1ASrR92RsaCfgFctL5luoR6ZVgBu0eBIT9prtpjWkE57Oq5ejoTxs9FcixU6xCdpCgEcL8k7XM3pRfuZB0MLOzthfnF5F/frw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8898.eurprd04.prod.outlook.com (2603:10a6:20b:42d::15)
 by AS5PR04MB9756.eurprd04.prod.outlook.com (2603:10a6:20b:677::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Fri, 27 Oct
 2023 15:08:36 +0000
Received: from AS8PR04MB8898.eurprd04.prod.outlook.com
 ([fe80::35fb:6e51:ad06:4a09]) by AS8PR04MB8898.eurprd04.prod.outlook.com
 ([fe80::35fb:6e51:ad06:4a09%3]) with mapi id 15.20.6954.011; Fri, 27 Oct 2023
 15:08:36 +0000
From:   Iulia Tanasescu <iulia.tanasescu@nxp.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     claudia.rosu@nxp.com, mihai-octavian.urzica@nxp.com,
        silviu.barbulescu@nxp.com, vlad.pruteanu@nxp.com,
        andrei.istodorescu@nxp.com, luiz.dentz@gmail.com,
        Iulia Tanasescu <iulia.tanasescu@nxp.com>
Subject: [PATCH BlueZ 0/1] iso-tester: Add test for bcast AC 13 reconnect
Date:   Fri, 27 Oct 2023 18:08:30 +0300
Message-Id: <20231027150831.10866-1-iulia.tanasescu@nxp.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR06CA0198.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::19) To AS8PR04MB8898.eurprd04.prod.outlook.com
 (2603:10a6:20b:42d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8898:EE_|AS5PR04MB9756:EE_
X-MS-Office365-Filtering-Correlation-Id: e831e1eb-d4a1-444b-c8f7-08dbd6fe9801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DXxslt/ybdij4a8N21FMAM5YnovPI0GSYEc5oINjFymwV33HN2YoLcdtriVNJOw7c54w2IHuKeAM5yYtG+YJu039UwhTIy0nnl9QGWRprw9noTEGNGbbr7/B10d5jxUIl4iN6zKKBUMpxiYxY08S58/fx8V7vVd+uzAJkYNafCi0w5QcfNRdpp8BrdFcynTu4DxyZ57Lfa31v6EtYNefORDXndZhinhRr5jsAgMDG8GWae1nrezuO/jemJz0wLWXVlkhLLMXUvW4YXyNu6+3KCIkBa+/uECfV+S8pxWwwPdP7LRHjlqgNIQmEMOWbpizWGQDI8Hy1iwTnk/ZebkkNQoxfeKg569JniH4RtyAqol4b7dQT+pyKqe0V2x1FCJH88K/XlCJvaLwfnyebTYBs9U6o7+4AXxDS9sJ0dyyO+m9c8yklpOLjLyM6lLEd0shZu+PPsl4XwhOGqblBybE/Bem5pfgpThozQkgA75DBvakdy9SWXrL1dQNXbLbzQOOcyh86xJ8L5YXqnOj/ZRcjSDzBM2VQHzRF+MKLRB0SieqA2qzGQCfN1LxdqswdBo9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8898.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(346002)(376002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(36756003)(6666004)(6916009)(86362001)(2906002)(66946007)(4744005)(66556008)(316002)(38100700002)(26005)(1076003)(2616005)(6486002)(478600001)(66476007)(83380400001)(6512007)(8676002)(8936002)(5660300002)(44832011)(4326008)(6506007)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KMT0K001iW7k2BfA76q7sqUhcN1hv32nzzkpYUj0U+FmTMc+D5Uab0QxllXN?=
 =?us-ascii?Q?Qb+I2W81JscW5av08UIIZ/6N5OKWLc1kCxepyoCjlBQuQ49x5sU4ZNQPdm2y?=
 =?us-ascii?Q?1sUNe72EPqDbW59ELmnhfbS46k+iTlkVvqOdrszs6U6bU4hzi6vbu9qRItFE?=
 =?us-ascii?Q?Of2Hw1LI2mg85Bei2kLGDaeNeBWMuympDgktC4xTK/JdNgb27n1sx7EWJhOS?=
 =?us-ascii?Q?Fd8lnZ8F8AyYBgqdBAu7yNNhOI0muu4qtSpcCl1WNZ3JFeSsy43MbfD4pEZH?=
 =?us-ascii?Q?vyGUr3sSxhQHsrYawMPTaaWtdwEOaJRQCOMllYdd+PppLmXaYi7lUWqVDLuB?=
 =?us-ascii?Q?L3E2RKkcpOoV5lCI1KzFzggGLGxhzv5ZtCpSKp/XfmXYgJF8jkHXuIo9OfK3?=
 =?us-ascii?Q?hLjLCjrgIyQUg5MkmDd1rGBMlEO5nUXyyDItSQ/48yfZ3JJtUUapPmX5oFmM?=
 =?us-ascii?Q?RLd18Wp4EbDNbKMY1FlxmNyhUcQik4VRglBHfkOGmTwZaALjr1ypkCUqBL4e?=
 =?us-ascii?Q?5RA3VWWlHVWWEqzgps5Yd6JCt4U8PFUwHivCIRub7PdusTEhaQNAj36IVjA/?=
 =?us-ascii?Q?QSijf1vve0fTKf51ZrOSBlTPGVYyF5MH2XE6jl0rQ2NtJjxChikHevG/0wDf?=
 =?us-ascii?Q?bC7pC5IeQmNu8n8Rl4diZZCmm4bZ4euJ7YdJDXPg6FIqoMpL/0qqLHlf3haq?=
 =?us-ascii?Q?PF1ge9ycfWfklPaULNePuJsU8CAEYtuYWhTNJ2EmimWwKajPUDCRSTp4ke+1?=
 =?us-ascii?Q?jD0P04/IlQiqidp2UrGUSez8HZbqwmFwTCuPLR0FN97U2xd1mnio4qFFlUWE?=
 =?us-ascii?Q?/k1H/h6rUGpOjuD3Pq9fkwuoH8k6ajbX6R/RKJV25S4Wc7tWDqGddLnbtsgO?=
 =?us-ascii?Q?p//Uf9ld8rf+nNsg9Cmqijyc477goELvCIh0RIkroKOYTAy1MLZUZjPtUGNQ?=
 =?us-ascii?Q?r/ZuAbzbfkTxB5fOcQFsqrESRNALn0gyDyg1Vq77nfkIvWaPVyf4UAtGRivf?=
 =?us-ascii?Q?gRJhvYQwwZ2CsZ84c5/50v1nKpPX9qEhdmnYKdN7NX+KgkfgrE6lkb1uhFUm?=
 =?us-ascii?Q?G/nmwBC464yh7m2I3n0cTz8V68BCPW3fxGPcY36lhNAaL+aQMtjJaya+4jdm?=
 =?us-ascii?Q?pRR6IWP5OQG9+rYtqlZhQ6vYTJpH48CFB+oi8gvR+ODOQyhtnJTLqQ5nYFwm?=
 =?us-ascii?Q?X1K688o7MLhDlstd6fcbeySvSN315L4brlO8koOTELREQI5wPql+3JPufvDc?=
 =?us-ascii?Q?3NcgW+i+05oVn8UIIEmuW7qR5xebWgkeYHljZU25y72vQb+VUjkK2iOh/kdF?=
 =?us-ascii?Q?yV0ASxOW2WU9d5cySGhceJiFb6TppQKgxA97VG3GL4pjc3HiAtM91u6LNLUD?=
 =?us-ascii?Q?LVzLnp1ZpYCPy5a4bUwsAV9pnPlmj5RCwwQjAKtJ8XN7MZYou2lSTc/0pkvp?=
 =?us-ascii?Q?CJkVu0TS4gzm2Ptp3Jdew9IlnQAw7rT+RK/zdoD2RLvmV1BEw7kkvtWpJOej?=
 =?us-ascii?Q?vhuEIj7HCqCvIWQDaaWFr6wkQuAStMRhT98EsLQped/vGm2GAPibcu4kHJMZ?=
 =?us-ascii?Q?w+sU5oz7/yn6I4GBayckMl9ILFiByjrs6JFZ/kkr0X06cGU1jd8F5eVwYUnt?=
 =?us-ascii?Q?4w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e831e1eb-d4a1-444b-c8f7-08dbd6fe9801
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8898.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 15:08:36.5618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPoGZJD4SKYQI3nU5SIPeeodLK7piKTqAuEwLM/uF0jiDKwc04T7C+zrVlnO4I13GmC9D/97IR56CIF+z4agxw==
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

This adds a test for the Broadcast AC 13 reconnect scenario: 2 BIS
sockets are connected, one of them is closed and then reopened, and
it is reassociated with the free BIS hcon inside the kernel space.

This depends on the kernel support added by patch
Bluetooth: ISO: Reassociate a socket with an active BIS.

Iulia Tanasescu (1):
  iso-tester: Add test for bcast AC 13 reconnect

 tools/iso-tester.c | 60 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 6 deletions(-)


base-commit: 00fdb61d56161f523e975b4c044030f4b40abb6d
-- 
2.39.2

