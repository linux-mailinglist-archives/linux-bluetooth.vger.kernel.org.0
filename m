Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB6346A4AB
	for <lists+linux-bluetooth@lfdr.de>; Mon,  6 Dec 2021 19:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238207AbhLFSgh (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 6 Dec 2021 13:36:37 -0500
Received: from mail-sn1anam02hn2229.outbound.protection.outlook.com ([52.100.159.229]:49990
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237265AbhLFSgg (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 6 Dec 2021 13:36:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzxaDaIQZSEcRu7xtTmW051QV1A8y6H5qWCakLug15iF8sAOK8034UOy5g5vezaNdRww8KJw0GAA7zAwx7PLeBKKgqmeJK3rOwfR8TT3bMHdN6aMaPryhLmrNVdKz/mgM+IAlKivdnamZ9Qb6CLAaMivkFhkvkResn6h1RBy/roz49qW3V3/2vvG0caO+1AOu7sd9xqf3oDoNwhmYTPPKkK22NhFxqMYAbyv4sV/AJa+Ty+OdxzgmhTO93NYUDQCD5sQhAO1cSnO+Ux4SLLbpzKnfmypsZWfjUGkUSBTFhOwDWHCN2h/IwG+GPbrFQzd+fFXWix9EQgx87xwvY9J3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=GJal79Lhk6oTNN7//bB0fb40mI0kvzP200BXGuf5HabEXIZdBGFXnw5tvhQXi3robogVr1wpLQnjViX8x5Mcn6v0KggRh15T3pxPKBpojt0Fea8jP5z43hAqsQnJnFGjyQdCmH2Vpnkw9pIQTi0UWt9U637LTY9V5TZbEbT2xSYf1LmpgS7f1YvimC2V2xHfCQsXvIHxId/DEBQZyBeST5SsWupiBVWcVhhrq2tutSAY0HaOYyRZ0bsngiz1mp/N5NtZJQbJI0PIMALRwYXib7hUyzlVQrNYDreCW99AeK2xtyB0o13WE7tg3T/JILBktCNlhbDg4CHlOUUqEu2eHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 146.201.107.145) smtp.rcpttodomain=slarti.ucd.ie smtp.mailfrom=msn.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=msn.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fsu.onmicrosoft.com;
 s=selector2-fsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=ZaV7egOH9hL2u7bq8ViQZVoTXmoQ9wqjw7zRIrBC8YsuQ6qybnSsjMOxmsvehP3H+OQ68gtnvpKHpOOZ1i5RdNyEWgEh4NaPTzCZ1/Yh4WAZOQWVq6kR2V0Hyfiy0ORRk+MKhdP3GWMpRpsDJeNSiEUnUj5FPR0Dkl7K364MK8k=
Received: from MWHPR17CA0075.namprd17.prod.outlook.com (2603:10b6:300:c2::13)
 by DM8P220MB0424.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:3a::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.19; Mon, 6 Dec 2021 18:32:58 +0000
Received: from MW2NAM04FT014.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:300:c2:cafe::a8) by MWHPR17CA0075.outlook.office365.com
 (2603:10b6:300:c2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Mon, 6 Dec 2021 18:32:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 146.201.107.145) smtp.mailfrom=msn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=msn.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 msn.com discourages use of 146.201.107.145 as permitted sender)
Received: from mailrelay03.its.fsu.edu (146.201.107.145) by
 MW2NAM04FT014.mail.protection.outlook.com (10.13.31.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:32:57 +0000
Received: from [10.0.0.200] (ani.stat.fsu.edu [128.186.4.119])
        by mailrelay03.its.fsu.edu (Postfix) with ESMTP id 4EE73938A3;
        Mon,  6 Dec 2021 13:32:18 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re: From Fred!
To:     Recipients <fred128@msn.com>
From:   "Fred Gamba." <fred128@msn.com>
Date:   Mon, 06 Dec 2021 19:31:35 +0100
Reply-To: fred_gamba@yahoo.co.jp
Message-ID: <9d9441ca-532a-4ba8-9055-fe1956ebb074@MW2NAM04FT014.eop-NAM04.prod.protection.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 906d4afc-c542-4af8-37cd-08d9b8e6d36a
X-MS-TrafficTypeDiagnostic: DM8P220MB0424:EE_
X-Microsoft-Antispam-PRVS: <DM8P220MB0424988E7021B40C320D2F9CEB6D9@DM8P220MB0424.NAMP220.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Forefront-Antispam-Report: CIP:146.201.107.145;CTRY:US;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:mailrelay03.its.fsu.edu;PTR:mailrelay03.its.fsu.edu;CAT:OSPM;SFS:(4636009)(84050400002)(46966006)(40470700001)(5660300002)(8676002)(508600001)(316002)(2860700004)(31686004)(336012)(6862004)(8936002)(6266002)(70206006)(6200100001)(786003)(2906002)(26005)(35950700001)(47076005)(82310400004)(83380400001)(956004)(356005)(31696002)(82202003)(40460700001)(86362001)(70586007)(7116003)(6666004)(3480700007)(7406005)(9686003)(7596003)(7416002)(7366002)(480584002);DIR:OUT;SFP:1501;
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGplRXZtWWlMZTF6UDdOQzlHWW1HNzRhS3ByYTFJRVEyenljWVREZCt2TWFl?=
 =?utf-8?B?Q0xCVVMrelpvNHVRQkl4R01nSWZZMld1RWlVNDlkM1g0RUJaRzlXODdiTVZw?=
 =?utf-8?B?U1lKZm1CYXRqUWlMV2pac1lzOVRkTnZaS3BkWEtEZGd5bEk1QmVnc2tXbnNU?=
 =?utf-8?B?amphQUZIaG16MkxNUGRjdFppcjZ1cWpxbVV0ek9WRHdVbHg0VGxhMkxFU3kr?=
 =?utf-8?B?dkY0c2taWUZEbEdMWnlnek9VajRGQ0pSRFM0NDBkb0RrdnBaMTNQeWNRblY2?=
 =?utf-8?B?OThmVzl3MC9GNmpydHVBRzdTT2lKbkxLTEhKSktJUm8vc0JId05vNXUzL2Zh?=
 =?utf-8?B?cUlxMS9Ic0hYOUlRZ3NVclhjNnZ4Y1duWjAxZ1BVVzB3NUEyV3cydllYWk04?=
 =?utf-8?B?R0RlNzFWS0oxcEJKT0xzdHB3LzNrSUgxaW5ONlZOcW9lTjRHNi95K0NXei8y?=
 =?utf-8?B?K0FhcVlRWVdYSDdnVU5oU0Nmd1hzY0RQdERtUTFkaHVQdWJ0SU90NFZKNlh6?=
 =?utf-8?B?Sno4SkRDeXJhM0prZjRtMmtORU1hQy9keUppQVBKY3p2Uk1LcklJM0wraGRL?=
 =?utf-8?B?RlM3bEFsRXFzQTlwZG91bG9JRGp2ejBqMjBvaThOZk9ZWEVzSzlaUWIwdlBn?=
 =?utf-8?B?SjFsbnRHS3NXNS9qKzI2aHZqeFJEVCtQS3YvKzZmRy9WOHFnWmNHaEprMWFa?=
 =?utf-8?B?U0JoLzU5bVJINHlZVU9uRGtzekozOWxxWHVPdXl3TDZQM093am1BenJIRG5E?=
 =?utf-8?B?Wjc1YXpBZjlmdnE4Vk5uSlhyMWNqRUNSaEFyc28vcllkMlFkVHFIYXo3MVVk?=
 =?utf-8?B?Nng4VG11NlF4dmp2TTJaaFpBNlUzRW80VFNtQnlaMHFTV09wSGhSK2ZyQUpE?=
 =?utf-8?B?MUdCcG5VcW9ML2hKYzFjVUZiTXhaNmFVSmpTdHZRNi91ekxQbWVHaURYZllx?=
 =?utf-8?B?bU9Qc1ZNUFNFYjN4ek5EU1IrcEx4cEtHMUF5RmZJQXFsZEpuM293cUFBd2N4?=
 =?utf-8?B?b05GYzdZWUxoTVFFSnpMNjF2MDZlWnRYNGYrd29NNFRNd0JPRHlqcSswbWta?=
 =?utf-8?B?VFdPb2JhNTBWckJJQ0pEQ0VBSmx3aEZTN04wcWZLSWxPYi9tMVdFUWczN1F6?=
 =?utf-8?B?R2lsR0w4MG1CNi9IcUpraXFDbzJXYXpleXdWNkRJekxYczVvTnY1dnlkS2o3?=
 =?utf-8?B?RUVxTGQ3VEswTk42UmhleXFnWHlLUUJPZkQ2RDY0cncwVVFSMzhSOGhQV2ZN?=
 =?utf-8?B?TW1tUmloNURxTitGMmEzOGdKWGx6cXhSTElEeDR1UksrdTBiNnVVVjQ5bWky?=
 =?utf-8?B?djliSUhJM29LTU4yWHJOTnN6OUZjR0xLVnZZZGRUbC9yT0UxcWlqTVgyQzdU?=
 =?utf-8?B?OGpnQ0t4Qk56dkFndlp3N3VmekdrSlU5a3g2MUloM210OFVHVHREc0hybStu?=
 =?utf-8?Q?iOvUisKL?=
X-OriginatorOrg: fsu.edu
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:32:57.6703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 906d4afc-c542-4af8-37cd-08d9b8e6d36a
X-MS-Exchange-CrossTenant-Id: a36450eb-db06-42a7-8d1b-026719f701e3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a36450eb-db06-42a7-8d1b-026719f701e3;Ip=[146.201.107.145];Helo=[mailrelay03.its.fsu.edu]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM04FT014.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8P220MB0424
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello,

I decided to write you this proposal in good faith, believing that you will=
 not betray me. I have been in search of someone with the same last name of=
 our late customer and close friend of mine (Mr. Richard), heence I contact=
ed you Because both of you bear the same surname and coincidentally from th=
e same country, and I was pushed to contact you and see how best we can ass=
ist each other. Meanwhile I am Mr. Fred Gamba, a reputable banker here in A=
ccra Ghana.

On the 15 January 2009, the young millionaire (Mr. Richard) a citizen of yo=
ur country and Crude Oil dealer made a fixed deposit with my bank for 60 ca=
lendar months, valued at US $ 6,500,000.00 (Six Million, Five Hundred Thous=
and US Dollars) and The mature date for this deposit contract was on 15th o=
f January, 2015. But sadly he was among the death victims in the 03 March 2=
011, Earthquake disaster in Japan that killed over 20,000 people including =
him. Because he was in Japan on a business trip and that was how he met his=
 end.

My bank management is yet to know about his death, but I knew about it beca=
use he was my friend and I am his Account Relationship Officer, and he did =
not mention any Next of Kin / Heir when the account was opened, because he =
was not married and no children. Last week my Bank Management reminded me a=
gain requested that Mr. Richard should give instructions on what to do abou=
t his funds, if to renew the contract or not.

I know this will happen and that is why I have been looking for a means to =
handle the situation, because if my Bank Directors happens to know that he =
is dead and do not have any Heir, they will take the funds for their person=
al use, That is why I am seeking your co-operation to present you as the Ne=
xt of Kin / Heir to the account, since you bear same last name with the dec=
eased customer.

There is no risk involved; the transaction will be executed under a legitim=
ate arrangement that will protect you from any breach of law okay. So It's =
better that we claim the money, than allowing the Bank Directors to take it=
, they are rich already. I am not a greedy person, so I am suggesting we sh=
are the funds in this ratio, 50% 50, ie equal.

Let me know your mind on this and please do treat this information highly c=
onfidential.

I will review further information to you as soon as I receive your
positive response.

Have a nice day and I anticipating your communication.

With Regards,
Fred Gamba.
