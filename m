Return-Path: <linux-bluetooth+bounces-6120-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C401592D9A0
	for <lists+linux-bluetooth@lfdr.de>; Wed, 10 Jul 2024 21:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E58C7B2192E
	for <lists+linux-bluetooth@lfdr.de>; Wed, 10 Jul 2024 19:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1EF198E80;
	Wed, 10 Jul 2024 19:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="uChCKFMg"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com [148.163.137.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC6A198E6E
	for <linux-bluetooth@vger.kernel.org>; Wed, 10 Jul 2024 19:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.137.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720641341; cv=fail; b=rjEsijaXc4ijxUxVgJqRS5x/MXuGuDPheEiESJnnKxFJvZDuXPCzvu6ihRhzswIFrdbedHsxN3JadCyJ79eCXHvcPs0AHQiBj8bqu+vszgWMYOu9EhFN4Ym8K6/W86h2BRMB7bYtHo7u3Ut4vTSWU9BarwC+IV9USR+WmJLcm9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720641341; c=relaxed/simple;
	bh=duepX1kvh0THwIYPGdfoh8UrdM0E91dXPJmbkVLGN9M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qX82SJqRMNM2c3loiiJ9xx23Iwluwpxbzbp5HPYVmMYaQRNgvlQzxgT6tNJ3Ig4CHTkape8oDqUAvyskRFCStEKfl2AjvlxPCEnWovtZxyLDvdqz0pV0f+hRoDHvDBCFOujhnL2PQyzxAyBgzoSgdSDxjRg+f29JTNiO4NHAIzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com; spf=pass smtp.mailfrom=dell.com; dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b=uChCKFMg; arc=fail smtp.client-ip=148.163.137.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dell.com
Received: from pps.filterd (m0170394.ppops.net [127.0.0.1])
	by mx0b-00154904.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46AHZpLx017338;
	Wed, 10 Jul 2024 15:55:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from
	:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	smtpout1; bh=duepX1kvh0THwIYPGdfoh8UrdM0E91dXPJmbkVLGN9M=; b=uCh
	CKFMg+BgCS0M6Ft2fREWUJFiLpnhZ9w67qGKxtqZAb74z99+wdOWwaoaz3zZ6CeK
	PuBdROrlVa/AfYZf99gDvlLUW6J5N0ZqR6rblxz3/CVXAl0JHgSLpn42qEWxkVaR
	ua/lGIRcUf0Pbwbzf9EGKs2kAVK5VzICBcxiW1c+AmirSeZhtKfu0x7xWoUtzVKG
	vcGZLYeYtWu91gWnI7ihm/vynA5FLvEbMzIt0/aWhSCuoyWaFPBMQA91++yqsYVl
	KPyD4yE7AMCgi8LNZhHnxHuyaYyFtqa00QHi0+RDIt3EPbtAmUgt41Gpjxh08I1H
	YNefm/jMBDdt8wCny0A==
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
	by mx0b-00154904.pphosted.com (PPS) with ESMTPS id 4070g33nw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 15:55:31 -0400 (EDT)
Received: from pps.filterd (m0144102.ppops.net [127.0.0.1])
	by mx0b-00154901.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 46AJtUxA023280;
	Wed, 10 Jul 2024 15:55:30 -0400
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0b-00154901.pphosted.com (PPS) with ESMTPS id 409tugpa6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jul 2024 15:55:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F18uUQqE+O9qaMDK0/z48bZNK8XxuwMKgXApBPlesxjOKTbCaLQcORN/XCDmxyA/CrKBaALPNhAd84B21t5Jw05gHW3CBP+KGESNRqUZsW73IybhvwWz0gxxDCjAFA7c0xU/fIAhOeaFNN3rAlRI6pRaLTof5jnTL92FDITrmI4lb3u/j/16vIF0ERLxGmZo474rX6lqOaZQyZsCJdMtWfgzcVIVOEWI7JipgxnzumAg2M3IbjJkVZz4HFVk0/guspb+KylREVlUrr3vuUa8tLI3A2EY5CbRj1dfP2aLrKFIi9GjNEtcjVZHB2noFfDmq7MoQp390AihznUh9LngnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duepX1kvh0THwIYPGdfoh8UrdM0E91dXPJmbkVLGN9M=;
 b=XZru99WJNAIxJ7KB1q639UEZtVkGz3Bjn82l74atTyqoJX6san39FYXZjTcG5kViEQPeGausrmgfnWe8A+T9oOvsRB+epbK+pReZg2L0k5enaqDs5LgOVnvnbLFWfYuczqaRYXbuX4fAIgV0/yLh2g0zL0somMDOugJMNMOSvOlwf2ff+DV0v5m/upApfQkpt5JGYO0YzDUpiCzy50yfFe+qx4uFvF6fy/yEH0TBrsRdmew/OidyPCZT6FnJpuU5EawEBu5E8tj24KGsUM59jDhmD+LhuI44M++x1tx5Cv3fAYXmkTbHJo5hK9cLdSLVNyQkn06+10WytuYu2NGA3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SN4PR19MB5421.namprd19.prod.outlook.com (2603:10b6:806:20c::7)
 by BY3PR19MB5106.namprd19.prod.outlook.com (2603:10b6:a03:36f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Wed, 10 Jul
 2024 19:55:06 +0000
Received: from SN4PR19MB5421.namprd19.prod.outlook.com
 ([fe80::237c:614c:8f0b:ae83]) by SN4PR19MB5421.namprd19.prod.outlook.com
 ([fe80::237c:614c:8f0b:ae83%4]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 19:55:06 +0000
From: "Ramsay, Trey" <Trey.Ramsay@dell.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
CC: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Subject: RE: [PATCH] ATT: Error (0x01) - Error: Unlikely error (14) Prepare
 Write req (0x16)
Thread-Topic: [PATCH] ATT: Error (0x01) - Error: Unlikely error (14) Prepare
 Write req (0x16)
Thread-Index: AQHa0j9b0zaQeN00PEyxcrJ2hKNEr7HwXB7w
Date: Wed, 10 Jul 2024 19:55:06 +0000
Message-ID: 
 <SN4PR19MB54214DD841A41FB8C01DDFC9E4A42@SN4PR19MB5421.namprd19.prod.outlook.com>
References: 
 <SN4PR19MB5421B1226EA92B735CADEA44E4C82@SN4PR19MB5421.namprd19.prod.outlook.com>
 <SN4PR19MB54215EF3B4E7380A21387D2EE4DB2@SN4PR19MB5421.namprd19.prod.outlook.com>
 <CABBYNZ+8ca5f6nWG3D3x8mL3g=57Z0pogQP-+ww_aQuC0R1DWw@mail.gmail.com>
In-Reply-To: 
 <CABBYNZ+8ca5f6nWG3D3x8mL3g=57Z0pogQP-+ww_aQuC0R1DWw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_ActionId=21581bd3-e15b-43b1-88fa-4a32ccbb970d;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_ContentBits=0;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Enabled=true;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Method=Privileged;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_Name=Public
 No Visual
 Label;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_SetDate=2024-07-10T19:54:59Z;MSIP_Label_dad3be33-4108-4738-9e07-d8656a181486_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR19MB5421:EE_|BY3PR19MB5106:EE_
x-ms-office365-filtering-correlation-id: 67b9ea69-0d87-4d44-e89f-08dca11a322f
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dkJSNC81QkpDUk04ZHg0UHBpZ3NUQnpTcGpFOWhlV1NhNWY1elgvbzByM2N2?=
 =?utf-8?B?RlFPUkxaeERmcWJHR3o4TnVVWkNrc0Zna01GNnE2TkZJazM2Z2dwdXgrWXZT?=
 =?utf-8?B?NHYyMmFSUmFobFhxSjVyUWZybDdMN1ROZFdIdXJsaThNcTA4alFpR1BMOUto?=
 =?utf-8?B?OUZ3bUk0d3hlY2Fld2lPMmtvQnNPVEdFektwVDM3YzZKYis3T3U5Snp3VHBa?=
 =?utf-8?B?TnVZTGNoeEJYVzYwMVhyZm9RZ2RyYjZUR0c5NExBU2lOcVJtc2lTZVVNZHNO?=
 =?utf-8?B?Qm01V0N0MndIbE1KQVhDS3poWGRMbXZYc3ZRUnJGWW9ZeFFLNTlpSm9LaTdZ?=
 =?utf-8?B?TU80M2V5VzhJWHRIUHRuZVVKU2Z3YjZpMEl0MW04VnFrZzc0SlJqWUhFYi95?=
 =?utf-8?B?bmwwSTcrcE42aTkyQVB2dHhJV0E0UzRJNytQYUtpd0lMWTFSSi9WMmtwOG1z?=
 =?utf-8?B?aHR0a0g5dFE3NnloMzBDL2VJcDFQUUp3QktXQ1pVckVqUEFDZWhTdFZndktU?=
 =?utf-8?B?OCtsdkVJNTNIb2FVOXpOQ2ZwL3Q3YWJrSVVRUWRHSVlGbVAydm9hOWFUV0pl?=
 =?utf-8?B?Qi9QQUhtMFpZbkxwSG1wR1ByZkxHMDFRRllWS21wZ1l4cURiMUpGTGw2K1A4?=
 =?utf-8?B?SWI0bVRWRDloSjJhNi83ZUpKQXJtd1V3aDU5bCs2aU1rRzRSQWNwbGEzQzMy?=
 =?utf-8?B?azdHeVlOc3N0eG9TVk9Md2ZmMzJGNHhKbGlBQUErbHplWlFISWpUanpnYll6?=
 =?utf-8?B?NnVrclVDbTlQM0N5M1dXVXBEZERPcUNWd1loVjRTTlhWS0VGVnZxc2Fqa2d6?=
 =?utf-8?B?TUV1Q2sxMjhVNzNYS3pmMzRIblhERjduNDBZa3JTc3lYVXNKUjhNWmlIMHhP?=
 =?utf-8?B?YmY3aEIyV0RPVUNYaWlVeDJIalVjMjhqZjJWU0tWTVNMZmZpUXlWalhWYnRJ?=
 =?utf-8?B?TVJUVG1Xd1A4dHZJd2l0b0Y1NEtqQlRTSExKZUd1azhwdUVlSDBWSHcwSCty?=
 =?utf-8?B?U21na0FzZGZUMWRyZklERng2T2laUnYvYi9XNVE1aWxINks1cDdyTW5jTm5P?=
 =?utf-8?B?SWh5UkpNZGkzOFphdG42U0g1ODFTa09XQTRBTVlpdzRxdzJGQVlYRkhEcVZX?=
 =?utf-8?B?OGdKRUN3eGtNdkFJRGd6eDdENHJBZjhCS2VuMEgyaUwxczd0dDdmcDhnR01Z?=
 =?utf-8?B?ekg2TS9rbEJEby8xaWttQ2VNbC9MOG1taXUrTU5Bb0lMN1gyS0RpMzBPUXhC?=
 =?utf-8?B?VDdkK3M4UGdEWFhvbEY5QThacFZzNWpIaC9jNG9KY0RweWRpWlE2TTR4UTVi?=
 =?utf-8?B?Uy96U1I4a1NUZUh0K1JQSWdQQ1ZGbEVTRUo0ZWw0T3Q1UHpnRHJyMU9oTDJS?=
 =?utf-8?B?MEc2YVIvdm02ckZJSklLTzIxT1VrZGNaa1NqWWphZVllWWhaNXpDS29nQmZ3?=
 =?utf-8?B?bDEvR1diYlpJWFpsZHRYL25JbGxjRVJmSjdYRmRSR1ZOdURSUW40dGN6SDRO?=
 =?utf-8?B?WGpXQ2I0bklpZnJlazhDSmlWRU1WQWJWajlNemdtL3lMWG45NzFSQlArc1NU?=
 =?utf-8?B?aW9SaytHQXBSZ3UrMDM0MjdVN3NYSGV5cE82SFlPNTR1V1Q1ZFN3SE9takhU?=
 =?utf-8?B?dWZiSHBTTVNhWS9FT1JENWFkQjhuSlVnUXM5OXVRY0xwMzVUeVpSZUtTVndw?=
 =?utf-8?B?eG50Y0QvOE9hTUlkSG51Z2ZLRHlsL25OU0JobkZsTVZxNTI2WmZWcXQ1UVJt?=
 =?utf-8?B?djNtWmt2b0ZPZ2wvaU5XL1FjM2lRUzNmNmpqSW1VdHMrc3BUVkhlMGVDUkJz?=
 =?utf-8?B?UGZQYS9hbk0wMHlHRkpIdz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR19MB5421.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bEhpUTlpNFh0Y3FqYitKZ1h2b1kyanRvc1ZjMitTMzE2MmFDeEEwNEhWc2RX?=
 =?utf-8?B?RDQ3L2ZrSzhQSTkrY2xPb1JsNDVWUHRiZWkvVmJIN2xRL0lnUjZQSEJYV3Mr?=
 =?utf-8?B?QzJWSWFmY2phb2E5RG9vaVhsUTJWYnRPV3JsTGgwOTlCazBoWTltdms4YVlH?=
 =?utf-8?B?a1dNbUNDNnVYS0VCRXFyc0tVbVBpRGVyT1RsR3ErNVpEQzJKWVQyTXRmZjNJ?=
 =?utf-8?B?ZXdSMS9Rb3pRWUtaNjc0SUtiYTJ6WC9yK0RJODdoeDZldUIxQkFQNlNUVUcx?=
 =?utf-8?B?YWhnYVVEK3RrcFk1OTRRN1Q3UDRvcTI0QzkyTC85UUxHV1o4b1lnanMreHA4?=
 =?utf-8?B?MXVReGsyZUliL0FUQVUwTFBKcUxzdzBrL1Z6Unc5UGpxWDEwT2ZDUUxwNUFa?=
 =?utf-8?B?RXMwM21jVGRSWi9Lc3NpckpHNDMxZU5SQUhSdk80cFNJbXJqbCt1Vk9pY0Uz?=
 =?utf-8?B?UEdrWmJZZVRIbkNoSFlHeVpOZ29wSmhnSEVOQThtVGN4MXlEa2ZIVnUxWnYr?=
 =?utf-8?B?eENZZ1FVZUJqcGZENi8vSEo5ZlY5M2EvQkpoVGY5enJBQ1hkWG5IRUc2SUNX?=
 =?utf-8?B?bmxhWjdMNkEyWFNmalNrb1JDU1lKY1FjM0ZIL0lLMHFsamFYRjRiaWVYa3pm?=
 =?utf-8?B?d2tSSm5YcFNRK2lTUk5VT2haV0VaZ0VKaC9udzdCa0t3Y0h0b2FHWUJ0bUVD?=
 =?utf-8?B?L014SW15eFEvb1pldll4S1BVdlNhdDFtT2ZIRGtQMTdQdExhTkdxNmx6TW5U?=
 =?utf-8?B?NUVmb2NHS3FaSGhZcjlveG5RZ0tqNDZjUmhST1N2Q1VGbXIrWUlXUDVVVDV2?=
 =?utf-8?B?Y2RyeGY4RmxxczczdFVMdm9OS0phTmhPNWhtbGRINU0zVEtMSEJDS1YvVy9X?=
 =?utf-8?B?K2xiVHVpcHZCUHVRYVJIWXVVRnJqUUc0bHYxcVVYQ3QvQ3dNRnJXM1ozVnRE?=
 =?utf-8?B?ZEpxUHZJenoxZ1lIcWlnRGFJTmpBM3A2U0RNMzNvaUxBeEhRaHlJaVVKYnJm?=
 =?utf-8?B?N2wrWW9RZlNFWHRRWnVObjFkdWQwWFdFbDR2WGNaWk1vNXBybUdDekN0anRz?=
 =?utf-8?B?L1IxL01yS2JwVW9zSkc2TDZKczdFVFJBTWxrdGdYNGZyclpFTWlPMU1USkZH?=
 =?utf-8?B?cG03S3I2dG5FaEVkY3NQSGdieG9nb3dsSmtZczJNaFN3MzUyRzZiNzI3R0NL?=
 =?utf-8?B?OCtvbzNLT3pUM3JZWUVlWEFscHRNMG9LZ3oyRmNFZlI3QWZWWThnRmdFL0VO?=
 =?utf-8?B?UjF2TnRySFk5a2RDbDI3d0pPNjRzWFNCR05iZ3dnVEViTDB3UFg3MVJZTTlj?=
 =?utf-8?B?cFNwUDZnWnlrVFdPWkluVEtWL2R6bG9MQUl0UGRSd3d1OUZyME5hcGFtaTlv?=
 =?utf-8?B?bzNvOGRJbXVwQVk5YzJ3YlJicUhHK3NQeEtXRDBPdnc3QXNoaGNDNHZaUWRR?=
 =?utf-8?B?MVBJeWJYRk5CSi9IVy80VWVObUpWY0lpMC9IRGdqVWFMVWkrVzlQb0JwOS9F?=
 =?utf-8?B?dkk5T2N0elpETGtwYWR6RUpGc0RUZXAyTUFQWEtCc01LWGhjM2Irbmg0QzJC?=
 =?utf-8?B?YUcyVVpER0Q3NTQrMDF6c1dJcmR6NkJWVnl4dWVnaXFiMUloRzArRlJLeXpu?=
 =?utf-8?B?Y2hOTXNaNjZUMWhPV3RLUmhCYVBxNDZjVWNIbTVEVHA3TzZLMVRiL0szTnlz?=
 =?utf-8?B?UWg4c29sME9KMWJabEZwUXo4SERTTEUxMWNBZUFGdmVWTmltRnJYK2lZTE9C?=
 =?utf-8?B?RkxnUWRTMEsrVWFrQWtlUmlMMHp4Q25QUVYvTU9YQVZsVWR1djNpczNvTTB2?=
 =?utf-8?B?MVRXOEdlY2YxeUw1bmFPU2hRRUVGQWNsQURuMTRhZlpJa0tZSW9mTDFIZGhv?=
 =?utf-8?B?UEp4NEZpMzJLdE1KK2ZjZmpIZ296WVJjR24zdjRvVXlaWVVITUEwcEl5bHpr?=
 =?utf-8?B?M2swQjdHYTlYL2dmdko0WUt1OC80WmdUL1hjZU5wQ3BrMiszK3pSQVN6Qndj?=
 =?utf-8?B?cllyb2x1TkhIbGRweGNSMEFFTlMydnhDYVVEQkhqV0dLajRXd2hsaVRBUVRQ?=
 =?utf-8?B?Rlo1YnFSNGdLbklOWFkyRzFnQnhmaHBkZ0pWOEl6R3pJbnV3Wll5YUhZeFdG?=
 =?utf-8?Q?VZAXkxCYCdqbb8+WOxaK+il21?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR19MB5421.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b9ea69-0d87-4d44-e89f-08dca11a322f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 19:55:06.2718
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aiG+He1GdZ7oBofeu8puBqhJ9ekV/sG6PwkIr8hlWAjcWRkrp4q031j9P7Xk/wvQbth5Wu7Ck7sSDUWyI75hwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5106
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_14,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 spamscore=0 clxscore=1011 adultscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407100140
X-Proofpoint-GUID: GM4_bpOlav2D-DX1PxxdYUKr9iiaXqmH
X-Proofpoint-ORIG-GUID: GM4_bpOlav2D-DX1PxxdYUKr9iiaXqmH
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407100141

SGkgTHVpcywNCkl0IGlzIGEgUHJlcGFyZSBXcml0ZSBSZXF1ZXN0IGJ1dCBwcmVwX3dyaXRlX2Nv
bXBsZXRlX2NiIGlzIG5ldmVyIGdldHRpbmcgY2FsbGVkLiBJbiBnYXR0X2RiX2F0dHJpYnV0ZV93
cml0ZSwgdGhlIHByZXBfd3JpdGVfY29tcGxldGVfY2IgZnVuY3Rpb24gaXMgbm90IGdldHRpbmcg
Y2FsbGVkIHNpbmNlICJhdHRyaWJlLT53cml0ZV9mdW5jIiBpcyBub3QgbnVsbCBhbmQgdGhlIGZ1
bmN0aW9uIHdpbGwgcmV0dXJuICJUcnVlIi4gIFRoZSBwcmVwX3dyaXRlX2NvbXBsZXRlX2NiIGlz
IHN1cHBvc2VkIHRvIGdldCBjYWxsZWQgYWZ0ZXIgImdvdG8gZG9uZTsiIGJ1dCBpdCdzIG5vdCBn
ZXR0aW5nIGNhbGxlZC4gIFRoZSBwcmVwX3dyaXRlX2NvbXBsZXRlX2NiIGlzIGFzc2lnbmVkIHRv
ICJmdW5jIi4gICAgVGhlIHBhdGNoIGNoZWNrcyB0byBzZWUgaWYgbGVuIGlzIDAgYW5kIHdpbGwg
Z290byBkb25lIHdoaWNoIHdpbGwgY2FsbCBwcmVwX3dyaXRlX2NvbXBsZXRlX2NiLg0KIA0KDQo+
IEFDTCBkYXRhOiBoYW5kbGUgMCBmbGFncyAweDAxIGRsZW4gMw0KICAgIEFUVDogUHJlcGFyZSBX
cml0ZSByZXEgKDB4MTYpDQogICAgICBhdHRyIGhhbmRsZSAweDAwNjksIHZhbHVlIG9mZnNldCAw
eDAwMDANCiAgICAgIHBhcnQgYXR0ciB2YWx1ZSAgMHg4MCAweDAyIDB4MDAgMHgwMSAweGFhIDB4
ZDMgMHg4MSAweDUxIDB4NTQgMHg1YiAweGVhIDB4YWYgMHg2OCAweDBkIDB4ZWIgMHhlNiAweDEx
IDB4MmQgMHg2MyAweGIxIDB4OGUgMHhiZCAweGM0IDB4NjMgMHg4ZiAweGY2IDB4YjYgMHgxMCAw
eDYzIDB4YjUgMHg1NCAweDNmIDB4MzYgMHgxOSAweDQxIDB4NWIgMHgyNSAweGNkIDB4YTcgMHhl
NSAweDlkIDB4YzcgMHg3MSAweDI2IDB4MzMgMHg3YyAweGU4IDB4MGUgMHg2NyAweGQ4IDB4OWEg
MHgwYSAweGI1IDB4ZTUgMHgyNCAweDg3IDB4MmQgMHhjYyAweDAwIDB4YTkgMHhjOCAweGI4IDB4
OTUgMHg3NiAweDc1IDB4OWYgMHg3OSAweDFmIDB4OTQgMHhlNCAweGQ5IDB4YmUgMHhhYiAweDIy
IDB4YTMgMHgzMyAweDE4IDB4MjggMHg1NyAweDI2IDB4YWUgMHg2ZCAweDBhIDB4OWIgMHg2MyAw
eGViIDB4MTAgMHhmMyAweGI1IDB4ZWEgMHg2NCAweDRhIDB4ODEgMHg1NSAweGUwIDB4YTkgMHg0
MyAweDhjIDB4ODcgMHhiNCAweDMyIDB4MWMgMHg3OSAweGQ2IDB4MzQgMHg5NyAweGZmIDB4YWUg
MHg3MSAweDFlIDB4NTAgMHg3YyAweGI2IDB4NzIgMHg3YiAweDQ5IDB4NDQgMHhlZiAweGZlIDB4
ZTIgMHg0MCAweGM3IDB4M2UgMHg1ZSAweDQyIDB4OWIgMHhjYSAweGE0IDB4NjEgMHg2NiAweDcy
IDB4MGEgMHgxZCAweDVjIDB4YjAgMHhkYiAweGExIDB4YmIgMHhmNyAweGI2IDB4MjcgMHhhMCAw
eDY3IDB4ZGUgMHg2OSAweGQ5IDB4NjcgMHhhNyAweDA5IDB4NTggMHg3MSAweDM3IDB4OTkgMHg5
NSAweDVjIDB4NWQgMHgxMCAweDRkIDB4ZWQgMHgyZiAweGUyIDB4ODUgMHg2YyAweDAzIDB4NjAg
MHg4MCAweDY3IDB4MjUgMHgxYiAweDMzIDB4MDIgMHg1MyAweGJlIDB4NjcgMHhkYiAweGQ0IDB4
MmEgMHg5ZSAweDhkIDB4ODIgMHhlMiAweDlkIDB4YzQgMHg4NiAweDA4IDB4ODQgMHgyYyAweGJm
IDB4YTUgMHhjNSAweGQzIDB4OTkgMHhmMSAweDAyIDB4MDkgMHg4MCAweDBjIDB4YzUgMHhmOSAw
eDk5IDB4MDYgMHgyMCAweDAxIDB4NzUgMHhkYiAweDBjIDB4MTEgMHg4MSAweDg3IDB4MDQgMHg0
ZCAweGYwIDB4Y2MgMHhmNyAweDI3IDB4ODUgMHhjZCAweDIyIDB4ODQgMHg4NSAweDA0IDB4YjMg
MHhhMiAweGE5IDB4Y2MgMHhlOSAweDI3IDB4OGIgMHg2NyAweDAyIDB4MWIgMHhlMCAweDhjIDB4
ZDcgMHg4ZiAweDUxIDB4M2EgMHhhNiAweDBjIDB4MjMgMHhhMCAweDA5IDB4MmIgMHg0YyAweGIw
IDB4ODAgMHgzNCAweGY5IDB4NjEgMHhhYSAweDcyIDB4OTAgMHgzYSAweDVlIDB4YjcgMHgxMSAw
eGFmIDB4YzMgMHhjZCAweDc4IDB4NGYgMHhiNiAweDFiIDB4YmIgMHhiNCAweGIyIDB4NDIgMHg5
ZiAweDg3IDB4YWQgMHhmNiAweGExIDB4YWUgMHhkZCAweGRlIDB4MzggMHgwOSAweDdhIDB4YzUg
MHg3YyAweGJkIDB4OTggMHg4OSAweGFlIDB4NDkgMHg5OCAweGU3IDB4YWUgMHg5MiAweDI4IDB4
NDUgMHg1YSAweGJjIDB4MzAgMHg1MyAweGU1IDB4YzEgMHg1NiAweGIzIDB4OWYgMHg1NiAweDdi
IDB4YTEgMHgwMiAweGNkIDB4YzIgMHgyNSAweDJhIDB4YjIgMHhjNSAweGM5IDB4MzUgMHhlYyAw
eGE3IDB4MjYgMHg3OSAweDk3IDB4MmUgMHg5NiAweDk3IDB4M2UgMHg1YiAweDhmIDB4YzcgMHgy
ZiAweGE4IDB4MzkgMHg3MCAweGIxIDB4MjIgMHg1YiAweDJjIDB4MTUgMHg0MSAweGVjIDB4NmIg
MHhjNCAweDFlIDB4MmQgMHhjMCAweDQ3IDB4NzUgMHg0MiAweDAxIDB4NDAgMHhjNSAweDE3IDB4
NjkgMHhmNCAweDBhIDB4Y2QgMHg3ZSAweDYyIDB4MjUgMHhlYyAweDFmIDB4N2MgMHhhZSAweDdi
IDB4ZjkgMHgxZSAweDlmIDB4OTggMHhiZCAweGM3IDB4YzMgMHg0NCAweDRjIDB4ZTIgMHgwYSAw
eDhjIDB4YmUgMHhlYiAweDFlIDB4YWUgMHg3YiAweGJjIDB4NDkgMHhmYSAweDdkIDB4YTMgMHhk
ZiAweGIyIDB4YzAgMHg2OSAweGY3IDB4NTcgMHg2YiAweDZmIDB4ZTcgMHgyZSAweDNjIDB4OTAg
MHgwYSAweDE2IDB4ZTggMHgwMyAweDBkIDB4ZjEgMHg5YyAweDRjIDB4YTMgMHg0YiAweGNmIDB4
NmQgMHhjMyAweDRhIDB4NjkgMHgyNSAweGM1IDB4ZjYgMHg5YyAweDRiIDB4YjMgMHg3NyAweDY3
IDB4N2IgMHgwMCAweGJiIDB4MWYgMHhjZCAweDU5IDB4YjAgMHhlOSAweGY2IDB4YmUgMHhhMyAw
eDQxIDB4ZDEgMHgyYyAweDFmIDB4MDkgMHg2YiAweDRlIDB4NTIgMHgwMSAweDBjIDB4ZTEgMHgy
MCAweDZjIDB4NzYgMHhmZCAweGM5IDB4YjkgMHhiNCAweGQ4IDB4ZGYgMHhjYiAweGFjIDB4Nzcg
MHg2NSAweGNkIDB4OTggMHhlOSAweDY2IDB4NmMgMHhjOCAweDhmIDB4ZmMgMHhlZiAweDdlIDB4
NDggMHg5ZiAweGM4IDB4ZDYgMHg5YyAweDcyIDB4YWMgMHg0NCAweGEzIDB4NjcgMHhhMyAweDZh
IDB4ZTMgMHhkZSAweDNhIDB4ZDUgMHgyMSAweDk0IDB4MjkgMHg5NCAweDNkIDB4N2IgMHg4OCAw
eDI5IDB4YzMgMHhjMiAweDdlIDB4ODIgMHg5ZCAweGU3IDB4MDAgMHg3YyAweDk2IDB4MjggMHgx
ZCAweDIwIDB4ZjggMHg4MSAweDAyIDB4N2MgMHhjMiAweGIyIDB4ZmEgMHg0MyAweDkwIDB4NmUN
CjwgQUNMIGRhdGE6IGhhbmRsZSAwIGZsYWdzIDB4MDAgZGxlbiA5DQogICAgQVRUOiBFcnJvciAo
MHgwMSkNCiAgICAgIEVycm9yOiBVbmxpa2VseSBlcnJvciAoMTQpDQogICAgICBQcmVwYXJlIFdy
aXRlIHJlcSAoMHgxNikgb24gaGFuZGxlIDB4MDA2OQ0KPiBIQ0kgRXZlbnQ6IE51bWJlciBvZiBD
b21wbGV0ZWQgUGFja2V0cyAoMHgxMykgcGxlbiA1DQogICAgaGFuZGxlIDAgcGFja2V0cyAxDQo+
IEFDTCBkYXRhOiBoYW5kbGUgMCBmbGFncyAweDAyIGRsZW4gNg0KICAgIEFUVDogRXhlYyBXcml0
ZSByZXEgKDB4MTgpDQogICAgICBjYW5jZWwgYWxsIHByZXBhcmVkIHdyaXRlcyAoMHgwMCkNCjwg
QUNMIGRhdGE6IGhhbmRsZSAwIGZsYWdzIDB4MDAgZGxlbiA1DQogICAgQVRUOiBFeGVjIFdyaXRl
IHJlc3AgKDB4MTkpDQo+IEhDSSBFdmVudDogTnVtYmVyIG9mIENvbXBsZXRlZCBQYWNrZXRzICgw
eDEzKSBwbGVuIDUNCiAgICBoYW5kbGUgMCBwYWNrZXRzIDENCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IEx1aXogQXVndXN0byB2b24gRGVudHogPGx1aXouZGVudHpAZ21haWwu
Y29tPiANClNlbnQ6IFR1ZXNkYXksIEp1bHkgOSwgMjAyNCAzOjM0IFBNDQpUbzogUmFtc2F5LCBU
cmV5IDxUcmV5X1JhbXNheUBEZWxsLmNvbT4NCkNjOiBsaW51eC1ibHVldG9vdGhAdmdlci5rZXJu
ZWwub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIXSBBVFQ6IEVycm9yICgweDAxKSAtIEVycm9yOiBV
bmxpa2VseSBlcnJvciAoMTQpIFByZXBhcmUgV3JpdGUgcmVxICgweDE2KQ0KDQoNCltFWFRFUk5B
TCBFTUFJTF0gDQoNCkhpIFRyZXksDQoNCk9uIFR1ZSwgSnVsIDksIDIwMjQgYXQgMTozNOKAr1BN
IFJhbXNheSwgVHJleSA8VHJleS5SYW1zYXlAZGVsbC5jb20+IHdyb3RlOg0KPg0KPiBCbHVleiBN
YWludGFpbmVycywNCj4gSGVyZSBpcyBhIGZpeCBmb3IgYXR0cmlidXRlIHdyaXRlcyBub3Qgd29y
a2luZyBpbiANCj4gc3JjL3NoYXJlZC9nYXR0LWRiLmMuIFRoZSBwcmVwX3dyaXRlX2NvbXBsZXRl
X2NiIHdhcyBub3QgZ2V0dGluZyANCj4gY2FsbGVkLiBUaGUgYXR0cmliLT53cml0ZV9mdW5jIGNv
ZGUgYmxvY2sgc2hvdWxkIG5vdCBiZSBjYWxsZWQgd2hlbiANCj4gbGVuIGlzIDANCj4NCj4gY29t
bWl0IDVhOWJhYTEwZDRmZGU3Y2E4YWI4OGVjZDY4ZTE3NjcxYzMzY2I1ODcgKEhFQUQgLT4gZ2F0
LWRiLCANCj4gbWFzdGVyKQ0KPiBBdXRob3I6IFRyZXlfUmFtc2F5IDx0cmV5X3JhbXNheUBkZWxs
LmNvbT4NCj4gRGF0ZTogICBGcmkgTWF5IDMxIDE1OjM5OjI3IDIwMjQgLTA1MDANCj4NCj4gICAg
IHNoYXJlZC9nYXR0LWRiOiBQcmVwYXJlIFdyaXRlIHJlcSBlcnJvciBCVF9BVFRfRVJST1JfVU5M
SUtFTFkNCj4NCj4gICAgIEZpeGVzIFByZXBhcmUgV3JpdGUgcmVxIGVycm9yOiBCVF9BVFRfRVJS
T1JfVU5MSUtFTFkNCj4NCj4gICAgICAgICBBVFQ6IEVycm9yICgweDAxKQ0KPiAgICAgICAgICAg
RXJyb3I6IFVubGlrZWx5IGVycm9yICgxNCkNCj4gICAgICAgICAgIFByZXBhcmUgV3JpdGUgcmVx
ICgweDE2KSBvbiBoYW5kbGUgMHgwMDY5DQo+DQo+ICAgICBUaGUgcHJlcF93cml0ZV9jb21wbGV0
ZV9jYiB3YXMgbm90IGdldHRpbmcgY2FsbGVkDQo+ICAgICBUaGUgYXR0cmliLT53cml0ZV9mdW5j
IGNvZGUgYmxvY2sgZG9lcyBub3QgbmVlZCB0byBiZSBjYWxsZWQgd2hlbiANCj4gbGVuIGlzIDAN
Cg0KVGhpcyBkb2Vzbid0IHNvdW5kIHF1aXRlIHJpZ2h0LCAwIGxlbmd0aCBzdGlsbCBuZWVkcyB0
byBiZSBwYXNzZWQgdG8gdGhlIGF0dHJpYnV0ZSB0byBjb25maXJtIHNpbmNlIHdlIGRvbid0IGtu
b3cgaWYgaXQgY291bGQgYmUgYSBwcm9jZWR1cmUgb3Igbm90LiBDYW4geW91IGV4cGxhaW4gd2hh
dCBhdHRyaWJ1dGUgaXMgYmVpbmcgd3JpdHRlbiBhbmQgaWYgaXQgY291bGQgYmUgZHVlIHRvIHRo
ZSBhcHBsaWNhdGlvbiBub3QgcmVzcG9uZGluZyBhbmQgdGhlIHByb2NlZHVyZSB0aW1pbmcgb3V0
IChlLmcuIHdyaXRlX3RpbWVvdXQgaXMgY2FsbGVkPyksIHBlcmhhcHMgaWYgeW91IGNhbiBwYXN0
ZSBhIGJ0bW9uIHRyYWNlIGFzIHdlbGwgdGhhdCBjb3VsZCBoZWxwIGNoZWNraW5nIHdoYXQgYXR0
cmlidXRlIGl0IGlzIHRyeWluZyB0byB1c2UgcHJlcGFyZSB3cml0ZS4NCg0KPiBkaWZmIC0tZ2l0
IGEvc3JjL3NoYXJlZC9nYXR0LWRiLmMgYi9zcmMvc2hhcmVkL2dhdHQtZGIuYyBpbmRleCANCj4g
MmM4ZTdkMzFlLi42NzhhZWY0Y2YgMTAwNjQ0DQo+IC0tLSBhL3NyYy9zaGFyZWQvZ2F0dC1kYi5j
DQo+ICsrKyBiL3NyYy9zaGFyZWQvZ2F0dC1kYi5jDQo+IEBAIC0yMTI3LDYgKzIxMjcsMTAgQEAg
Ym9vbCBnYXR0X2RiX2F0dHJpYnV0ZV93cml0ZShzdHJ1Y3QgZ2F0dF9kYl9hdHRyaWJ1dGUgKmF0
dHJpYiwgdWludDE2X3Qgb2Zmc2V0LA0KPiAgICAgIGlmICghYXR0cmliIHx8ICghZnVuYyAmJiBh
dHRyaWItPndyaXRlX2Z1bmMpKQ0KPiAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+DQo+ICsgICAg
LyogTm90aGluZyB0byB3cml0ZSBqdXN0IHNraXAgKi8NCj4gKyAgICBpZiAobGVuID09IDApDQo+
ICsgICAgICAgIGdvdG8gZG9uZTsNCj4gKw0KPiAgICAgIGlmIChhdHRyaWItPndyaXRlX2Z1bmMp
IHsNCj4gICAgICAgICAgc3RydWN0IHBlbmRpbmdfd3JpdGUgKnA7DQo+DQo+IEBAIC0yMTYyLDEw
ICsyMTY2LDYgQEAgYm9vbCBnYXR0X2RiX2F0dHJpYnV0ZV93cml0ZShzdHJ1Y3QgZ2F0dF9kYl9h
dHRyaWJ1dGUgKmF0dHJpYiwgdWludDE2X3Qgb2Zmc2V0LA0KPiAgICAgICAgICByZXR1cm4gdHJ1
ZTsNCj4gICAgICB9DQo+DQo+IC0gICAgLyogTm90aGluZyB0byB3cml0ZSBqdXN0IHNraXAgKi8N
Cj4gLSAgICBpZiAobGVuID09IDApDQo+IC0gICAgICAgIGdvdG8gZG9uZTsNCj4gLQ0KPiAgICAg
IC8qIEZvciB2YWx1ZXMgc3RvcmVkIGluIGRiIGFsbG9jYXRlIG9uIGRlbWFuZCAqLw0KPiAgICAg
IGlmICghYXR0cmliLT52YWx1ZSB8fCBvZmZzZXQgPj0gYXR0cmliLT52YWx1ZV9sZW4gfHwNCj4g
ICAgICAgICAgICAgICAgICBsZW4gPiAodW5zaWduZWQpIChhdHRyaWItPnZhbHVlX2xlbiAtIG9m
ZnNldCkpIHsNCj4NCj4NCj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
UmFtc2F5LCBUcmV5IDxUcmV5LlJhbXNheUBkZWxsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEp1
bmUgMjAsIDIwMjQgMTo1OCBQTQ0KPiBUbzogbGludXgtYmx1ZXRvb3RoQHZnZXIua2VybmVsLm9y
Zw0KPiBTdWJqZWN0OiBbUEFUQ0hdIEFUVDogRXJyb3IgKDB4MDEpIC0gRXJyb3I6IFVubGlrZWx5
IGVycm9yICgxNCkgDQo+IFByZXBhcmUgV3JpdGUgcmVxICgweDE2KQ0KPg0KPg0KPiBCbHVleiBN
YWludGFpbmVycw0KPiBIZXJlIGlzIGEgZml4IGZvciBhdHRyaWJ1dGUgd3JpdGVzIG5vdCB3b3Jr
aW5nIGluIHNyYy9zaGFyZWQvZ2F0dC1kYi5jDQo+DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20v
djMvX19odHRwczovL2dpdGh1Yi5jb20vdHJhbXNheS9ibHVlei10cmFtc2F5L2MNCj4gb21taXQv
MjQ2YmM5NjA2MjlkZmYzNGU3NDRjNzI4ZjA0OGU5ZjUwZjFhMDA1ZF9fOyEhTHBLSSFqa0pZYW16
VThiT2RkMQ0KPiBxdC1zV3BqNmd5MVl3UzMwVXlhbUhMVUpqOVV5MFVlY3JCNlF4dkNkU1dGQVVI
N0R2cTJ3VkpxdTFDNWpqb1g1YW15d0pIDQo+ICQgW2dpdGh1YlsuXWNvbV0NCj4NCj4gc2hhcmVk
L2dhdHQtZGI6IFByZXBhcmUgV3JpdGUgcmVxIGVycm9yIEJUX0FUVF9FUlJPUl9VTkxJS0VMWSBG
aXhlcyANCj4gUHJlcGFyZSBXcml0ZSByZXEgZXJyb3I6IEJUX0FUVF9FUlJPUl9VTkxJS0VMWQ0K
Pg0KPiAgICAgQVRUOiBFcnJvciAoMHgwMSkNCj4gICAgICAgRXJyb3I6IFVubGlrZWx5IGVycm9y
ICgxNCkNCj4gICAgICAgUHJlcGFyZSBXcml0ZSByZXEgKDB4MTYpIG9uIGhhbmRsZSAweDAwNjkN
Cj4NCj4gVGhlIHByZXBfd3JpdGVfY29tcGxldGVfY2Igd2FzIG5vdCBnZXR0aW5nIGNhbGxlZCBU
aGUgDQo+IGF0dHJpYi0+d3JpdGVfZnVuYyBjb2RlIGJsb2NrIHNob3VsZCBub3QgYmUgY2FsbGVk
IHdoZW4gbGVuIGlzIDANCj4NCg0KDQotLQ0KTHVpeiBBdWd1c3RvIHZvbiBEZW50eg0KDQo=

