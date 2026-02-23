Return-Path: <linux-bluetooth+bounces-19284-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPbQEBiCnGnIIgQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19284-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 17:36:40 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B9C179E51
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 17:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E532302A7AA
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 16:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9278E318BAE;
	Mon, 23 Feb 2026 16:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arri.de header.i=@arri.de header.b="Gi8IX6lm"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013012.outbound.protection.outlook.com [52.101.83.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2086315D52
	for <linux-bluetooth@vger.kernel.org>; Mon, 23 Feb 2026 16:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864319; cv=fail; b=hETms3NKkxefsdKt4cGwe08Ka3QQ5W5lAM7kr0dpMpj0Un3UXoItjTyaFyCuv4nDDpM6KsUSSsquSuC1dHPbMZPDqRromA56SdgHOAMTtiY+gJoU79np2wlzgGEmNIcvYSeqA95fM8JbZS+PEH6VDytpgQ2lnxEVbbDV/SqsL2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864319; c=relaxed/simple;
	bh=Yml5LnqOGxSAC9ZOw9dACitPmQxtZfSSsezQ2iEc4/8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dqcRcuKrTNhGoSZawfeziOo2u9ep01TkkNHB5Oefnr5Ol0NUTSK30J3NzsNv1jHMKJLma3FKNPRx8CQegbLq4KqNgoDCJ+uQFnbgm3KF5E4te4+BkFj/fCCQrnJ/3LFRvzAV2Kp8W+gKJ+ugHpMtTqfqMM08amZe2rQdBb3OZ6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arri.de; spf=pass smtp.mailfrom=arri.de; dkim=pass (1024-bit key) header.d=arri.de header.i=@arri.de header.b=Gi8IX6lm; arc=fail smtp.client-ip=52.101.83.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arri.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arri.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qtqWnK63p++2k0HgxkcdXbpTEGtoQ4Z2JJuI+Oa7N2N0yoXaZasqgiF5pGADOzRLwMqY+M5CNycvaZbmth24W1jLbm5PHxwdYlaLGfwRvgWI4JA2z1YxTm8MODrgBsBDPiKYNFBcdqOSsPu31Yh/ZoJ3zC2L/ylGaTq4+2RvT11NO5z33o8zrfGS3fCql5DhwXWetUc0P+RmenB6B9pJ6IpdjMAYM9G/nt3anjy+/cogqxK6yLSAwdnDO2jXUTBft+Kxj1p1LDqyabOaBZ4WW5ly7/dCbOQQZXYJDkDyL7lEv6are0nkp2vB41hWZ4phXm1DrQHC9me2AXTGygB1AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMCkHg/rEWMvMjGuxGNMNOZCWcrmZwdGfa1mPIyTEtM=;
 b=mul4186Tq2GBiSUtJNY5FXAKHf728qq+Yv0l4v1WUb/h+mNP/7YusHxmam5m2XTwZw0YG6cv5DVAuLcIakR9XXdinBQNugL5byN/HPr8sbinwzARMCL7D9Ei+TgqvH0L9jFQux6qcvK2D+MXeVzXuHT4m3/UUW+fZHBpb4EKgqPdZ9aw7OkdWJAUkqZwzTCfNBdyPWbfuWsrI/ZrYXWKr56FasVi9/R/XkS0g7hJwSmg25R2vy+d3ePwm+WQOecvfkSicZeFc+VbEyy2Zz8RKuYB7mN2SaD7kDFUVQBccxUhBZTfMVq77gLHuBVCz5VHtu8WbTb1FaIpISzwahzV1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMCkHg/rEWMvMjGuxGNMNOZCWcrmZwdGfa1mPIyTEtM=;
 b=Gi8IX6lmQsZx/cQEUB8RGrOPlePAWrdCMcca7DwRKfkEG8LEGAohHwwplHsmijE673pXinntIy//bbuxioDu5qUyaKtboeXS/cOxnoxMoMgvK+/e8Nl9a2Slrpv2lSDBVZYFPbscKOhHIOKXVQKLZKXqXvJtkt1HRxU6ptG+og0=
Received: from DUZPR01CA0059.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::13) by AM9PR03MB7234.eurprd03.prod.outlook.com
 (2603:10a6:20b:268::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Mon, 23 Feb
 2026 16:31:52 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::a6) by DUZPR01CA0059.outlook.office365.com
 (2603:10a6:10:469::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 16:31:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 16:31:52 +0000
Received: from n9w6sw14.localnet (10.30.5.38) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 23 Feb
 2026 17:31:52 +0100
From: Christian Eggers <ceggers@arri.de>
To: <linux-bluetooth@vger.kernel.org>, Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>
Subject: Re: [PATCH v1] Bluetooth: L2CAP: Fix missing key size check for
 L2CAP_LE_CONN_REQ
Date: Mon, 23 Feb 2026 17:31:51 +0100
Message-ID: <5035898.OV4Wx5bFTl@n9w6sw14>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20260213183333.1830534-1-luiz.dentz@gmail.com>
References: <20260213183333.1830534-1-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFC:EE_|AM9PR03MB7234:EE_
X-MS-Office365-Filtering-Correlation-Id: 092dfe37-85da-45ad-5d79-08de72f90d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m0GyyJh71sxtwPLI2RPPH112MrHGd4VYtIQaxwBBuLpdntTO3OKiTV7GdRxu?=
 =?us-ascii?Q?WWZ+xuVHC8yI6Abc7wmnet/zN8l16urwk4R7XE4CgLeNyOJCt9OSAkB/KJEv?=
 =?us-ascii?Q?/qqwIaCwPkW2b+z2vTVBq18mXEQViMkSSQ8bevmqWq7VcvIYQ/Wwn6gO7Une?=
 =?us-ascii?Q?s5P9cYSDmNLWDweAYTINiLns9dw0+8cdKr0uJSR7uYuGnQ5ZzP9EtYCvrUZX?=
 =?us-ascii?Q?lUVpuAclXhAMpB+Vi7Z9f/K7wOQlySr/6+ArlHcq6+77gG541mQ/TshNKJRD?=
 =?us-ascii?Q?IJEdqR1Skbm1WC8qSAYcg1DxAQc+CzTebSrIhzb94pyeivVzTVAu1q9isEqW?=
 =?us-ascii?Q?FJ5qkZ+bYjwjvzMP5t2+sD23wAGmc/9uE8ND4bn7ECuLNOPFrqB5QdfocnSq?=
 =?us-ascii?Q?iEoBe/zM8q6PfwM8m1AinIeSQ+zMnHFcRlQNFYlFQ+MuUpwu9AQBDUfzKxrz?=
 =?us-ascii?Q?SBRpQxB5mwpn/bzDjYDIaJzxF9CU1z3HCw99v3DkrGPhz226nKAToS4N38ya?=
 =?us-ascii?Q?jlNyO7U8YxBUPsD6NWiKHIQvkqknk4so6JwLUWUZtY/YjGg7HiFFCsATvXG7?=
 =?us-ascii?Q?iGEpCajRhoSOUuv1LKqQqpZEW3gPwYTM80NHFEoMVrnfvUjlV525kDd5VCF/?=
 =?us-ascii?Q?umzc7koqWZHWKgsDyfYqwmJ/c5ejFE/sqBOlOmpkr+GkQtKf4beCLmK9UmO3?=
 =?us-ascii?Q?vr7EnyMzsxMBlIvAF8v6H9fjc52pUyTx7gzeO6SFHXPA0tUXghFUOCoHNIbn?=
 =?us-ascii?Q?BibD+Dy/P//e6g9r8TURrZZmE9QpL5KqBwgQrwYVjuWsUF8UJEOVPOiycvU0?=
 =?us-ascii?Q?6T7879riWLJev2wjUSKQOlZvNgJP4rd+XL3n07wU42IcLpLOuzvNurkEeH3M?=
 =?us-ascii?Q?Ndwft+KsAj02yCvx6b1/HD/GgvLQaEv+jz0QX4+aRyyxbj2lUktEE0W/2zwD?=
 =?us-ascii?Q?HZjeD+4hu+IoJMjnQsi743p+yZTo6Rdj5st+7E5JecJrLFrwWcm5geSivQe5?=
 =?us-ascii?Q?XPJbgnkFIy6SJK9zuMYrZWVXol9dFato+0oNUQhDErh6uzaqAkTLTfDAQmnA?=
 =?us-ascii?Q?9e9uwRUfypxDHaXR2yABOrDmp3DuYbX7sVVEEx/IyGUPXCQBzwOo9HMdQ39W?=
 =?us-ascii?Q?f0RBJ40sTMg/629E6Z+B54784mym4uSjElYPacq/h6gVVsDwTweNOlCEyvwH?=
 =?us-ascii?Q?JXgu+U7khGe/EFCcU8KAmRouR0FM8/2HwHxvUEAtDex+nzGUnndUTSEv/6a1?=
 =?us-ascii?Q?nir8fY4wEs5XXtvb7mdMR0aL/QQh9o94GMDlIAnxxUnzJpN8LPwSZXpYYPAB?=
 =?us-ascii?Q?R6qB+opkT+SmJzf7UqNljyAdS/AqxqNMi9hEnbyYMfBtM81Fs54aHOMIzFzN?=
 =?us-ascii?Q?KxziDjSjxJlcDMQNjX4VtGxPaMOzKYYbH1vQ52g2H4L91K4kH+gt99pro8yY?=
 =?us-ascii?Q?NS1uxMNVQRdhHSO+6v+FTwDWl9L22u3YvOqdj1o0mFHvHr2br+oSgg+rBu41?=
 =?us-ascii?Q?IhHLZv7hSDtIjyT4DT0EfngxYWmbrv4daOuVgD4lxo9QR23IW13j7A14ayLP?=
 =?us-ascii?Q?Nyq895KBbxfuRO3jlo7iLUrihL4y9BBVGOksuE5ahSzgu/Ntr1mQrEcQNbgE?=
 =?us-ascii?Q?xyRSIS7aZTaRPz5e5q0PliwalCfKIWejlnZTm9XQ8VeTwiXi3xA1f7CusgN6?=
 =?us-ascii?Q?yKNDRA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5DcEzZEkJdKcuILds/CL6z4rypP6dYZkRn1ZdBr/ScSRCPpP//BSde8wboKjN2wG5okWrCBP3Nd/ZETigPlnczficIna5CstY0qqm5aKh4HTctRzxVzG3mgZE6Lj6wNlFAq4RQOix8L8/ZsMdm36YKBdoCyi/YSF7hcecLhtmfvmxHvdhl6mawUIdIzde3D5jUvcp26P6pw6M/juD0wvJq6uziWTl9qoiMnSi+ySbyVN/51MIBfYWfzKcPPWphGOUhsqd+zpsphhcPnT6w9SAHAH91LQypm2wKRWw5ZoRRaNpPHnKK8PqDJIuCwRTrB+MZIn9+IY8/X9c6koPPGwI91LGiLaqO4TPu/N2omC/MJCFSzhMga5qlXu4Q+iXnzFiXXERr1JFPluembrYnmojPm7FejeRlp5v+JiNCgUSYk/7df9QrLt+EacS94Hp3Jx
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 16:31:52.5827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 092dfe37-85da-45ad-5d79-08de72f90d2b
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7234
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	CTE_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arri.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[arri.de:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19284-lists,linux-bluetooth=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,arri.de:email,arri.de:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ceggers@arri.de,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arri.de:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E6B9C179E51
X-Rspamd-Action: no action

Hi Luiz,

sorry for the delay, I was away last week.

After setting the minimum encryption size, I get a PASS for L2CAP/LE/CFC/BV-15-C:

echo -n 16 > /sys/kernel/debug/bluetooth/hci0/min_encrypt_key_size
l2test -r -P 0x00F4 -V le_public -E

Thank you very much!

On Friday, 13 February 2026, 19:33:33 CET, Luiz Augusto von Dentz wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This adds a check for encryption key size upon receiving
> L2CAP_LE_CONN_REQ which is required by L2CAP/LE/CFC/BV-15-C which
> expects L2CAP_CR_LE_BAD_KEY_SIZE.
> 
> Link: https://lore.kernel.org/linux-bluetooth/5782243.rdbgypaU67@n9w6sw14/
> Fixes: 27e2d4c8d28b ("Bluetooth: Add basic LE L2CAP connect request receiving support")
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
>  net/bluetooth/l2cap_core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
> index 9452c6179acb..f73506c35dc5 100644
> --- a/net/bluetooth/l2cap_core.c
> +++ b/net/bluetooth/l2cap_core.c
> @@ -4916,6 +4916,13 @@ static int l2cap_le_connect_req(struct l2cap_conn *conn,
>  		goto response_unlock;
>  	}
>  
> +	/* Check if Key Size is sufficient for the security level */
> +	if (!l2cap_check_enc_key_size(conn->hcon, pchan)) {
> +		result = L2CAP_CR_LE_BAD_KEY_SIZE;
> +		chan = NULL;
> +		goto response_unlock;
> +	}
> +
>  	/* Check for valid dynamic CID range */
>  	if (scid < L2CAP_CID_DYN_START || scid > L2CAP_CID_LE_DYN_END) {
>  		result = L2CAP_CR_LE_INVALID_SCID;
> 

Tested-by: Christian Eggers <ceggers@arri.de>




