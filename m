Return-Path: <linux-bluetooth+bounces-25-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1287E4542
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Nov 2023 17:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B978B20D23
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Nov 2023 16:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20930321B4;
	Tue,  7 Nov 2023 16:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="c8V17P38"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4416630D1E
	for <linux-bluetooth@vger.kernel.org>; Tue,  7 Nov 2023 16:03:33 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04olkn2038.outbound.protection.outlook.com [40.92.75.38])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6275631015;
	Tue,  7 Nov 2023 08:03:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrUK+c7HWbJbCsb0SfSDTMA/R89N4hOEyA99Hh+t167WDg0tOe10zQCmILfPWuSRTzz1zaBwwpklelxfjruIQ01R39z06twiobxy8Fffz88GO3DnWhyA61kxFAwXTQwn1S4VPAAQ4591+HPpo85CgQ3BWQGTaLP6oC595N3PiAD/SDPvScbJ8pFqmocFfyt0c+jkRshuf/1KWquuNOhcIAtGNiVUe1BE1EgNOHvJZku467sRb6HhNzdfZobi5+2Hqf8sPPSnTp8BbLvPo5xqquVNbq0kebQA5dp9M/U2yKdpv3xYqHc2S291bFhB5zzP0nfnBrMCC5NnbMeBIR61GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrNg2Yx16ALOv/5T+VF5KpGF6ySyt3tHhxiBY1U1afU=;
 b=eFJmwPz2Z3m/Bnl2SyvVuDvVi/Hn+WMj5M5iN0hc9pJGWh9suNdIlXxNiLMYJbjH2yVBx4Z3Qm8pRbsW407h/p00GehxeeQ3K9VZr1JgGqd9ZD8uV7ro5U6bvPR0EcUpY4oO6zC3tf5KC4ZBQALMZGF3xcgaaqCCSzfYu50ucTgus5n5LY8r6t2LN72sGmsW2ODt7nVyJnpRlUSVcL4qrtNtF2Oy3cjweZgRcZGKVYABA6rx4eXSw0STqIp9BG7z/LH6Pf01W6sKsFHhpZ1iimwdVFr96FzLLvA5KhxpKT2dwv29kSigyX8XfVMfqwIg5QMGla9TS1T7ke7Xfy9wNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrNg2Yx16ALOv/5T+VF5KpGF6ySyt3tHhxiBY1U1afU=;
 b=c8V17P38yBQ0ykbBpDSSebQycy5DitbFSKNehvlEfaYoSXuI3v5y8Mi7qi5hIj+wRYL/mhP+v1vAzgSTwE/0qOGGtprmYsbgLJb3NX9JgK8g8pelnl0red5p7L7138M6rctRYS5C7wtm2oDWy67Q7by3TilMq3XJbx6HGAmnVkjv1w54f7cS6ywii/giZgCWOGV7wocUYLcliNSQVZ5rSCge4lYNRQZ1k8iv6V92Gof+JDvaEEI5anvEpinpkaL1LW8w56xH2tXZC0YZ3YpwNiIr9j0xyEo9dRLb/9m1NN4GH8VqkyXTmek+C50U2V6WHZPQ1zsGjNq3nUE4yu8h5A==
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:42a::7)
 by AS2PR10MB6352.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:553::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 16:03:30 +0000
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97]) by DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97%7]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 16:03:30 +0000
Date: Tue, 7 Nov 2023 21:32:51 +0530
From: Yuran Pereira <yuran.pereira@hotmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-bluetooth@vger.kernel.org, johan.hedberg@gmail.com,
	marcel@holtmann.org, linux-kernel@vger.kernel.org,
	luiz.dentz@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH 2/2] Bluetooth: Replaces printk with pr_debug in bt_dbg
Message-ID:
 <DB3PR10MB6835DDFE9086DAC4B01C7508E8A9A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
References: <DB3PR10MB6835C002EB4C5A05AD17610BE8AAA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
 <DB3PR10MB6835DE6D279B65EC040B92AEE8AAA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
 <2023110752-headset-gains-41a7@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023110752-headset-gains-41a7@gregkh>
X-TMN: [rKAWAmNPu1bZKfJOOMH+WvXj61cZGijA]
X-ClientProxiedBy: JN3P275CA0017.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:71::16)
 To DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:42a::7)
X-Microsoft-Original-Message-ID: <20231107160251.GA1836272@nmj-network>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR10MB6835:EE_|AS2PR10MB6352:EE_
X-MS-Office365-Filtering-Correlation-Id: adc8a9d6-7877-439e-3748-08dbdfab1585
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N8q8/bLU6fZC5wF0QfWOQLR7j2UPbAkQK+bdJ/xW8/aXBKNy7jGLoXsNE4V3/ztWe9aCavoLZtZHIwei5sKbo5b3LFKcyXyNxWcMXC3wS/NJ5r91eMxDoZB19ilosnP5G5rZa1JOgSUagg6YWomYAO48Cpz6i5xwtpmjAKzXVuavyynZzR9OvTIn4LknF0T6k8XpzHThqtovj4d8GAEeuqxDbZuX4rUGQhtHaFaov9ttLveLi/AN8z4BI19k6gmNQpUekN6yAZZXWIZ74vjHAbLVceC09ksolFFcDXO8uPQ27jnBnaj4dkm+BM5T7yAHhsdRFIT8sLzk+2yaU6CP87t9sflTCjPfPN1MQF4FoejywpQWDwYujWjTECvNP5v2RdDtfpr26GcNw4a1T1DO+qpD4EUgNkD0kOfIHKPt19DfFRNN2w0mZdaLLlqUF4IXGK2a+p0pk1tO7x2doKj2v6lN89XBSab4BxE9UjcMK6g86k2z21JZnEsKfdpnBxQFtqooefSNAh79nSySqly+RlagPQdSOqk2daTFfxXMPPX9ahysheen28lMIiSr3ELl
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cYIejzL+m48vq3IINFpprRXKg8nxBrQRb2pqo6KpMustGTqrBK9NBD/MJFsr?=
 =?us-ascii?Q?xiapGFUqJ4oUKyS+n7pCXpkmaCEwcOfaF2V4TtSR1nJ7hZ5VOT09Yb1GxTuN?=
 =?us-ascii?Q?DhPj923xYnIQRVC5U9QaWLh3O2yjUvoGnOTVmSfg9iD3bj6MDUqtxIo3arS0?=
 =?us-ascii?Q?EWnYAQ2YOENqI05nnlNtHgn9WDAwMxNoCwWMMHFsPIaSevoVpOvPYh2XPzLA?=
 =?us-ascii?Q?OqBrTsL5+0Ao9v1lEtPX3TDR3t317lhuoN3sJdfm5WG90FdDB7S7lHY76DDJ?=
 =?us-ascii?Q?ykWJReYhkDPVeEfGrymzPySNA5WXgrnKpFKhAlkwmyw6H3SvNlgameX2TDVf?=
 =?us-ascii?Q?+VsIog3z3y+yIo5a4Z5PfgeVwD+Tvug1WP/Y22vuk4KnvnAkIxB4lam8LHf2?=
 =?us-ascii?Q?tYYVnQS+kRoqweBY6k8mYwL1oLXm3NtrpVO1EEALO6eTp+rCWPF3chuaIfo1?=
 =?us-ascii?Q?gygkpLYqpZanU0/MK39mQQjmWgcd2TtwezDaav6J6D/Ruw52a/R5sxlswUEK?=
 =?us-ascii?Q?HBdrjqyXvjx7Adj4Z0v9hOvWW7equlzsaXAA0NJSQK1yZuTATUX36DvRED08?=
 =?us-ascii?Q?LeUycSIzaSXcsCA9B68Ms75cbrXsi1ivDTkG71vkoPKpvmx67mMgx5+Atjv8?=
 =?us-ascii?Q?RMi61/GiVeTwqEvxVVA8SJBJfIDmxoEPXHxfZx/e8rc36B98ouItr+rAhuCX?=
 =?us-ascii?Q?g5n7eFitvzrPkPNussaxd8sPHKMXpTS6cOLiTYOll8wWOONQEtuGYVtwvQCJ?=
 =?us-ascii?Q?0i2lI4dN2suoU5GMq4q+DWPMTOXRswLK4EHK4KhM4q75K2AOfbnvZlmRTk1a?=
 =?us-ascii?Q?Z8poV6LDQzV1lsRBX5dgdkJZKlsrN/cEtE1d+d41SrGWTCOrBm3xQ2hCsFwp?=
 =?us-ascii?Q?1T0KApZS9MGK7Ub8PcJlmHPX1kMEIyEc+wmAk/J1tHXpC4KVLHo5WpcfPVBQ?=
 =?us-ascii?Q?x9lbDKT563S5lZktNte4q5JzQQ3aQxkMk7P69SkmOPXfPWFaRO0rZdm4VyS0?=
 =?us-ascii?Q?LcjP7Unej5bAFpzXLve7NMJR2Eg/43ls2/jw6Iip+vNupSjFy21WOBb9nv7D?=
 =?us-ascii?Q?9CVnYHoq7R1F6d9eNfceiJvNrFT23JVtrFF7GzzVJk8+N0qEof7IqHA/h5jm?=
 =?us-ascii?Q?mtNIyhwPHJcN6pktFoCbv8uT+Lmz+AFQvmIy+M8yvT8QOK2G3wUbH1CGCYXA?=
 =?us-ascii?Q?kPVt/qIpt7wiDzdEay/x0heHS8021pEDvYosP8V9qstEZ/5isPymP7pAZR0?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: adc8a9d6-7877-439e-3748-08dbdfab1585
X-MS-Exchange-CrossTenant-AuthSource: DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 16:03:30.1291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6352

Hello Greg,
On Tue, Nov 07, 2023 at 07:31:27AM +0100, Greg KH wrote:
> 
> You might have just changed the functionality here, are you SURE this is
> identical to the original code?  How was it tested?
> 
> I'm not saying this is a bad idea to do, just be aware of the
> consequences for this change and document it properly (hint, the
> changelog does not document the user-visible change that just happened.)
> 
> Note, pr_debug() is NOT identical to printk(), look at the source for
> the full details.
> 

Thank you for the heads-up. 
Yes, you're right.

I just took another look and it seems that using pr_debug here
does defeat the purpose of bt_dbg which was created for situations
where `DYNAMIC_DEBUG` and `DEBUG` are disabled.

The likely equivalent would have been `pr_devel` but that also
depends on `DEBUG`.

Do you think that a new `pr_devel_uncond` like the one below
(only to be used in exceptional scenarios) would be a good idea?

```
#define pr_devel_uncond(fmt, ...) \
    printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
```

This would neither depend on `DYNAMIC_DEBUG` nor on `DEBUG`.

