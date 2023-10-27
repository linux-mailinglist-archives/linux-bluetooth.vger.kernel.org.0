Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A01447D9C5E
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Oct 2023 16:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346232AbjJ0O5F (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 27 Oct 2023 10:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346212AbjJ0O5B (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 27 Oct 2023 10:57:01 -0400
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2085.outbound.protection.outlook.com [40.107.247.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1158E1A1
        for <linux-bluetooth@vger.kernel.org>; Fri, 27 Oct 2023 07:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNM7SZGmjgplTHZTa06sxFkgcwhYEJZznuVqO+D2pUsdV04TjCd+mZMPfRkndIJzgrnakGpKsSfzYbzq8hi7wVhZFStUTGjS29C5aHb1Z/QMNBC0dKYgPXK0x4AbgeUeIAj50vRNl6wgJbCfJo2Sd9Jzd0VuEztmvBXRqTTfYhpDuyZ+icOVoFg0fai7HDsLaEQE2Nt+jedLyu5/Se4wqhxj4hoIVm3Ak3a1nvYAXHO4EdNm+fqbGtHNgpWMovYSArT8fmhqU8vUZNZo8vs+RP5SDNPwujVYpE99gV2/wFw6UasNHSPftYKA0/p9P4ANjyOQ6H5r5Cr6z+WyUy3juA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSv5ugpB+A0q7m46m3lazOTzUC9S5m8uM+xFQvxDUjU=;
 b=KLI3T7jcamnT9r9g6IVovllpA1n9/57jUMoDFzdim132Tld5iIopJjaEtJ3PrEo4i2D1nTjo4tubPUQKq+3o+5rZAH/j/26tGuAbj8wyAtF9qd1lM90WujjIKJFQSpGcyEaxgVLwXqtPXFlEl9NEtPVzTSo3td/orNsCOikRIVvzCC+lIouAfv2BWiAWoxAPq7NzyVOHKKuBybhY7gXwa1C/02weRVvTaCfYodbs/Xg9KQSJDM6ds13uEokls7uovlon32hItoel3GcKD9jx3X3W9aAipA6RQdHUwK3cL52S0gvB6MqiXEZTFYf5cJV/fA2R5jcjMHFa6ic/msIPEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSv5ugpB+A0q7m46m3lazOTzUC9S5m8uM+xFQvxDUjU=;
 b=LwbrwumJnI1lNWuZPm3XFNc5S3vgSb9ag9/qkwdZctfZRZf4tuJwDmKDoKVOQXeDlQNoT+W24sXfe7GtuVgUxA0C9qydOa7Kfu3l8s6BsS716fT2XpJMUJl3gRTGQ1ve0jcXfLL6MnHGbuUgpMZzOweCfrUXRjVBrQ/4DFN51z8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8898.eurprd04.prod.outlook.com (2603:10a6:20b:42d::15)
 by DBBPR04MB7820.eurprd04.prod.outlook.com (2603:10a6:10:1ec::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Fri, 27 Oct
 2023 14:56:54 +0000
Received: from AS8PR04MB8898.eurprd04.prod.outlook.com
 ([fe80::35fb:6e51:ad06:4a09]) by AS8PR04MB8898.eurprd04.prod.outlook.com
 ([fe80::35fb:6e51:ad06:4a09%3]) with mapi id 15.20.6954.011; Fri, 27 Oct 2023
 14:56:54 +0000
From:   Iulia Tanasescu <iulia.tanasescu@nxp.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     claudia.rosu@nxp.com, mihai-octavian.urzica@nxp.com,
        silviu.barbulescu@nxp.com, vlad.pruteanu@nxp.com,
        andrei.istodorescu@nxp.com, luiz.dentz@gmail.com,
        Iulia Tanasescu <iulia.tanasescu@nxp.com>
Subject: [PATCH 0/1] Bluetooth: ISO: Reassociate a socket with an active BIS
Date:   Fri, 27 Oct 2023 17:56:47 +0300
Message-Id: <20231027145648.2846-1-iulia.tanasescu@nxp.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0038.eurprd03.prod.outlook.com
 (2603:10a6:803:118::27) To AS8PR04MB8898.eurprd04.prod.outlook.com
 (2603:10a6:20b:42d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8898:EE_|DBBPR04MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: a021dd65-3eb8-459e-5a86-08dbd6fcf59d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ll+OjfIm8jiuVK9Ka46O9b0+/JTCjSpiWvlg/CX+FpgMgo08km/ig2Hg3x8t9krxrlZ7J62dsV973/mIVvz3CVLWENBrKV0O6hhipe0+1vlLoxHiVVxtd2Lb9rCLCHN/29GX94gEp2yYqGOWGIniDhyxnEpggRrFjPqk88UI/thIMkH3zCD4aABSF3oRp8ODWPAUa60jfkydztsVmnsPHS+BeFEOZv88va0HGo0PtFxZlrhMToaj4tIDpeAsmf0YRMUxE50AmeUlvCMI1FN13kxYcxE+2ce8mbENK9rfkt1dSAJVJ1x+Bb2cJp/ClWmg+vO/S1BjYQugYAXyU2YWoSvqYcREiUceUuX1ilx0yEFxXROQWaL8SDJ3b9uWDpEYOgsqdvkl1VozIajIJ90wQq42B3XR/M3Sy52RlWMY6erWT34d9nrwG8FoD6NdUCqmqwnMjIx7CKWHCPxEdpjnwFqZ4vARh4QhBhN9hhizOBgXONNtZ1OyDhKYFbk5+06MuvqsSlKv4QJiav+iiRsvhtG2K+4op4dfutkZFwC+AXvh7dF1HGhISPsIuEqWaXWp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8898.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(86362001)(2906002)(44832011)(41300700001)(6916009)(36756003)(316002)(66556008)(1076003)(4326008)(8936002)(8676002)(66476007)(5660300002)(66946007)(6486002)(38100700002)(478600001)(83380400001)(26005)(6506007)(2616005)(6666004)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iaGmeXxgYFELSk5G0QXrt419NOopXm3lGslX5U8qszpbtJL01M42/pby5luh?=
 =?us-ascii?Q?UrJadMhWeMeM2+Q5In7Xx0+ZtKw/pYv5DCvU3w7EFR82928m0/ssDK91UhX5?=
 =?us-ascii?Q?LYfifXKs61iMLJO3gSkA/RSqcKZJ8rb+o+MVDYy3lHZWUVePOakLj+aH1tUA?=
 =?us-ascii?Q?bLuYL6H0zIPAiO3gkWbPh6N6d7ROacBqyRTjEsyS67WZGyWxTHLFY7KuaCUP?=
 =?us-ascii?Q?dyonIM9viTfHDN45zczMHl0wd8306esRlMk/M+MkQg4EDzkdRUvhVJeiUxWe?=
 =?us-ascii?Q?YWZ0pHWly5eO6uMxeAtXyKm8nkweyrStuRpxl/iQ3+g5IZ942U3EMJItzzJw?=
 =?us-ascii?Q?l6FYTQRgDWF3th+9uaeO8Qm642jF6PzPBLuRwwCfYJArXIrAjwA36Z3zEIJv?=
 =?us-ascii?Q?CUdn2iL4Qz0ObdbTZih5ikJs7YCwtV4VPKnuiYxAyJYh+GoCrlbrols3QK3o?=
 =?us-ascii?Q?g3Y8ceojZtdqkgWAcOO/3UdNO1hhALtUuyTAM4aGu9RfpzTjsanOhU55i/Nm?=
 =?us-ascii?Q?EW8T4TTqrUQv+uFpag4DoY7rI8NSOgqKgHBktDVNZ22yEV7tnLN6yhgWcMvh?=
 =?us-ascii?Q?igs8OH4M7QKuMoAD09Mef02NFH1pWLnIn3qO/kC5zA19GytpzfGxVu2xZmf2?=
 =?us-ascii?Q?zjybMdqJJgfcGQ+igyEDja1Kl4n+IAvx0mxd7makCRb2LpCxgqEs3AzXS4V5?=
 =?us-ascii?Q?D5eDEA2tHIpFPYeNBA3pqkvc7yiYey+BBDC1s1rk+152c+vYo/XbbZSI8lik?=
 =?us-ascii?Q?B+yfz7p44uxWRwWSYsKjNnSRLGVaHvwk6BzbjlMjOqDfpnSHUvlK/Jv0Ux8F?=
 =?us-ascii?Q?1a5PXx+x7UC4EVTgV5oYTo7uUVd5pOlAk+2akxqne4W+rFkZCtrVDC4XWeMe?=
 =?us-ascii?Q?0cAme3Ue+WLvkSr6zdyETRSBUS6llBeXFoa77CNUaslORi1PW7V7k6XUf9ML?=
 =?us-ascii?Q?IX680t5aSfTjgtCWLksUDdK1VpQH39lUt8t99BXNeXeyk5z+Iqxot6uBV2Uo?=
 =?us-ascii?Q?/ylnXoc17M7cOOJhg3P4bCHiIDr5ZVNooqz8NbruyfhN3xKhIxSrSSNbnRu8?=
 =?us-ascii?Q?FEp+fujX7zFcSFYQouivDKVRi/QQS/hmJDNpdhWXGjarLQUMOqlxvL7JgP2b?=
 =?us-ascii?Q?demV7AZBoSL4vSbB1Iz+AlrQffKg3CfABqCYz9JO3llBIirFeNMBMPAkdCEh?=
 =?us-ascii?Q?1yKja0TKZKsWsMPYaLh0Npr2u1p3UstCAtA8Rlpy4NMKLtg406cz64as85Eu?=
 =?us-ascii?Q?vJ2DvfJTR8W7TZsjfCDsI5Bo6z48+6shfkX4P5nAK9MIXhcV/Sunvp4xzVpx?=
 =?us-ascii?Q?XJaJrzd3uZ/nQwVe0Fvfgzf/hQElgXDLRVz86vjt2NvNqeZojv4yqSNl85C9?=
 =?us-ascii?Q?MqSOoay0kYF4VWgQko5glCqflUPbD9F7QySK/ThCXhQzxirhtKRQ2TwIbmsG?=
 =?us-ascii?Q?HZQ3J9+H7fZlfQr5tOgTHaiyVt6lrKF6ywAWEcWTnOuXkwZw99S1W6in2QoF?=
 =?us-ascii?Q?QuYtjHCgzAySELXz7xiLfEpN0Fswi9ntgAa5PsLRhXPrFqEmFVOxBCp03MPL?=
 =?us-ascii?Q?Au2ncCGsdA8ZAb3LEC2LvpSbyJvW6sNFIIdvcDWtPHUgGC5pYjlN8ey8D9SU?=
 =?us-ascii?Q?zw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a021dd65-3eb8-459e-5a86-08dbd6fcf59d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8898.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 14:56:54.5698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XkFF7BIUfJTX+G7sa/9XSvGgbS0gPzfYDufNht0tzQpVPSCUEk2Hqm2qxXBqQ03lowibbXPnYsnV7hwAejSxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7820
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch implements a kernel improvement, to be able to reopen a BIS
socket from userspace and reassociate it with an active BIS connection.

This is useful for a Broadcast Source with multiple BISes - since a BIS
cannot be terminated independently from other BISes in the BIG, all BIS
hcons should be linked and kept alive as long as the BIG is active.

If multiple BIS sockets are opened for a BIG handle, and only part of
them are closed at some point, the associated hcons will be marked as
open. If new sockets will later be opened for the same BIG, they will
be reassociated with the open BIS hcons.

All BIS hcons will be cleaned up and the BIG will be terminated when the
last BIS socket is closed from userspace.

Iulia Tanasescu (1):
  Bluetooth: ISO: Reassociate a socket with an active BIS

 include/net/bluetooth/hci_core.h | 24 +++++++++++++
 net/bluetooth/hci_conn.c         | 27 ++++++++++++++
 net/bluetooth/iso.c              | 60 ++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+)


base-commit: 0783375f2c56ca17719d5ec670e498dc661ea5c3
-- 
2.39.2

