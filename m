Return-Path: <linux-bluetooth+bounces-9599-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A079FA04FE4
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Jan 2025 02:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECC973A35FC
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Jan 2025 01:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9792E152196;
	Wed,  8 Jan 2025 01:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="zAc4h1RQ"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2128.outbound.protection.outlook.com [40.107.117.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3F513632B
	for <linux-bluetooth@vger.kernel.org>; Wed,  8 Jan 2025 01:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736301042; cv=fail; b=JYKIcPNqGc4a/52TPwas8C87Hhj5o5HHBqwu2jies00nky+NOdtUdOoWpoQfvnvw5P+ryA61ukp7HXXlHt3BfoXYFE7ZlD7fk0lqJMy97ELbPpHQ6uiXQuM5zPTd7+zL92R0xzf1F/jMB/sMI5xiKf1V1Yu7z2Bjoj59SRhqjhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736301042; c=relaxed/simple;
	bh=ROzAOf3LKc+olzXV7c6ZKuTlybXyQMxCYdMGwAJiGJ0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fx8SuNCshPu/HJwJcr57oVcH+Nj6hichNwfPnTgGdbfJQSQhLd9gKb5g0a5/u85oWl/EahH/UIk4jSCpB9hAH45N/vaOMauXRbjXCJIGKcd+01/WPH6pKBMJmHY4Y9NsfMSlP/T0HxyABS8vj40KOmd13tf9Y3RT40rKDriqhD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=zAc4h1RQ; arc=fail smtp.client-ip=40.107.117.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xdf/wTwm6wFfcLXYvRIqS329gcLb6qf9XWbUqQGPm1vG4k+c7z2uaAOwJhOvYo16AApDYr/V2q4+9YQFiA1wXw9wKMTu4O/J8Bv/Sztjth0/OQl8zboNPtWI7SazD3fnwkoL/gqB1rZeUvIVfRccQhJqQk/yBPC8yAuEP5EK25G4MySjKodr9bPlG1JcGoy7/9KFnxH/lRJCgPpu29s8vMYqrtGQlbyjmH8oPaWWXwuNdYX0Se2sZu+9YSS86HbVLleqTh/tD0pVOyhZQDZwXrIuglAOK95wb7BrtnC0e1gjghnFVUdAATqZpmIIO2hXTG1pp2AtEjlp5siBNJ3asw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROzAOf3LKc+olzXV7c6ZKuTlybXyQMxCYdMGwAJiGJ0=;
 b=Czv7R2qlgwhnprs8qmTkU3mJ6vQ9jIuVvWyK8th2qURm22zpWAR6rixiDwzS6JHqUKOUXjDjHgFP9A+sHwZ2+/HFyrT1CECfJwywHCGkHjlzKQdle1kpAI8ptsfZEbpvf6gcn6+/rM00kEs8QpYvQCXuRZuWEzVEF3LJV9InaSJCJcU6oF3a6aWmiUYoPw35G6YiwRKxCyQWSDIuluiZWBXovIXrqcxmio3V0fQm1i8g44DWw9WLlRidYokTm91nGl0M+1Fp/kzitlbOTNV0TJ4lvfaZK0XtArAQ02XYKM1lY0pPKz3VirpXLhKQ4T6fDhhGMNDWuQdLnyvhH/H6Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROzAOf3LKc+olzXV7c6ZKuTlybXyQMxCYdMGwAJiGJ0=;
 b=zAc4h1RQXNWiFPAMzf4bbolvIkjY1YBF41IuaiGoOrqWanUWip8IuuZz4KOCndKYms7ZC/JF37/ua9/ZyJRSt9w7pAGos4SpCGhD23k0LeS8/oxu8adA7rhfNNM/f2reEp0HZ48Bh4TjiD4hjOSn2k02W0MSQ591AuKBgjcPUfPWIixP6WwaeeHBRGOXddi1iDUnTN50cJa13hyoVWOluB4CBjit+3nE3I1Ndbr32Y7DHMwffe5xvPUhQXAmSt92frFu3aP0vZQoFUIMGrIsZQED4x8G9hjMCXUucggDqburhsnrH93Dq6k78KYC21lHgCLrODfkGExFd5BMjptF+g==
Received: from JH0PR03MB7468.apcprd03.prod.outlook.com (2603:1096:990:16::12)
 by JH0PR03MB7654.apcprd03.prod.outlook.com (2603:1096:990:14::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Wed, 8 Jan
 2025 01:50:37 +0000
Received: from JH0PR03MB7468.apcprd03.prod.outlook.com
 ([fe80::4128:9446:1a0f:11fd]) by JH0PR03MB7468.apcprd03.prod.outlook.com
 ([fe80::4128:9446:1a0f:11fd%5]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 01:50:37 +0000
From: Yang Li <Yang.Li@amlogic.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>, "pav@iki.fi" <pav@iki.fi>
CC: Linux Bluetooth <linux-bluetooth@vger.kernel.org>
Subject: Re: [PATCH BlueZ bluez] bap: fixed issue of muting music silent after
 pause and resume.
Thread-Topic: [PATCH BlueZ bluez] bap: fixed issue of muting music silent
 after pause and resume.
Thread-Index: AQHbX+XM/afRgPUzVEq4U7hY6Iv1hbMJ66wAgAIz7IA=
Date: Wed, 8 Jan 2025 01:50:36 +0000
Message-ID: <5c94f8e5-bb47-4a38-b60c-8cb8d9c309c4@amlogic.com>
References: <20250106-upstream-v1-1-a16879b78ffd@amlogic.com>
 <CABBYNZJzjKQFA7gaQ2m+PEO_vbMgAZ4wy4fp--Rc4JFAQqAU_A@mail.gmail.com>
In-Reply-To:
 <CABBYNZJzjKQFA7gaQ2m+PEO_vbMgAZ4wy4fp--Rc4JFAQqAU_A@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB7468:EE_|JH0PR03MB7654:EE_
x-ms-office365-filtering-correlation-id: f2f842b1-b8e2-4d50-b594-08dd2f86d908
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MUdkNnkzaHpER2xlbmg1M3hJOUZudnoweGYxQUhlRVFyU3NSd0k5TXVlQkxY?=
 =?utf-8?B?a1N4QjMxRUtYMktyK0VZZitTc0JOQzI0dy95d0dBcmZnT1Y1Z1hiK3IwNnlm?=
 =?utf-8?B?VFBOdW5vNTlkMEZSbWljaThtVWc2NkNIMUl0RytUc01zWXJsRklPbk9wczQw?=
 =?utf-8?B?bS9JYmVNbjcyYjdJRjgxWDkvWE9HbUtMcDltRXAwMGlXamlPSTB5czBFWFF1?=
 =?utf-8?B?VWtaN2RwMDlidVowL2U3aEJta2drZDZUNWlIZG1XeGZuRWNKSzYyN2RPUkp4?=
 =?utf-8?B?ZWFZc3pZT25GdUdZOXFCT3BCWXd4eUhvYkxaTTZEL2luRjdHV1FWMEkwUEtm?=
 =?utf-8?B?NDRKYVMydExHUkVleitjMndjWkdXTXZkL0w0V2dwNGNEeUttOFJFWDFRQSsv?=
 =?utf-8?B?YmpQQ2V6N0J0cWU1MEtNa2N1azRIbmp2UndtRGdPUkJwL0Rmb1gyUFQyS1VP?=
 =?utf-8?B?dFZlY012WXcyc3VYS3BmbVdpMGc2SmVjaFhpVzVNd2F6ZmFsT0NDakpMWXpp?=
 =?utf-8?B?QlFMN2VaS1A3b0p4TGtZYjBZOUlrMk1pUi9nN1FXT240aEpSZE4xQURGbWxD?=
 =?utf-8?B?UUhzNVN4QnRiTWxISm1DUXJkcFpjbVM5c0Q0TDNKYStENVRsR0ZUTWRJdDd6?=
 =?utf-8?B?YnNBTmNLSXJUMm9Sdm5jYUdiNUpWWnB6L3N4S0h1TUltcVN6WHZ2OWh5Sm5C?=
 =?utf-8?B?RVZXbGVLd3dZeDhuaktVQ1BxYnlIRWc0YzdoT1poZXVVdE01Vnp3azE5RjNX?=
 =?utf-8?B?ME1RTk5ydDFxaGxsc2NDMGNqUENXSTdzNUYrYVFDNjkydmRNclY2U2M3TTM5?=
 =?utf-8?B?UmVqS01La2I3R0x3UlR6TFpZc1ZZb2dreHFnU2xQVnhVWGh2Tk9paEprS2tI?=
 =?utf-8?B?c2tWS0IzcGdHcXRVdCs1czBOTXNMWk9pLzdVV3NWcnlzVWRhMjNQZFNvUGdo?=
 =?utf-8?B?djRHdURvSjQzMVdTb1lMZk02WHNiNFZ0TTNRa3Y0OVRMdGI3bkJDcFZRSHF2?=
 =?utf-8?B?aFBEYzRWQlZ0MVJoakxiOXFPcjlwOUhPVEpwdTV5T3hHUVBUT3cxYzN2aTRr?=
 =?utf-8?B?cHlvSEorOFZsSlRlMndyRTlvNlhYendDbFErWVdvOUVXVUtiTTlnaVhtSG5X?=
 =?utf-8?B?blFyRy9pNGtvRHBrNmMvQUhSbHBHS0lBY3JJVVdMdzJ1aTd3a2VrUkJLNUlz?=
 =?utf-8?B?VXBsS3FPem95eG05c3FCN1dDeWUxQ1c5LzdHS2dGTkl2VzRaYzdBeFIxa2hw?=
 =?utf-8?B?UzJIcWhCWWMrQkVNbGl2cjVsNXcyVDMxQjkzNXJiREZSNTI0OHpNMUpDay9p?=
 =?utf-8?B?K2Q3UTNSYVFaTjlSNFc0T01kUWIrVFprdDVFWk50Tm1mci95UHRBOTBncFpZ?=
 =?utf-8?B?aEw4eUlOVVlndUZ4Y2hZR01VajVwY1c0am9ZMEswMGdFODN1Y0FBN1c0SFRp?=
 =?utf-8?B?cGdSTjBrUDlRMnFtbFhuSXp1U1htM0tDaUZTK2grY2s2aUdJaDFwRVh2eXN5?=
 =?utf-8?B?K1N4SzBaSTNOYXRpNzN2NU5Eek95cERRS2RhK0JyazZNbmJpV1NLU0FKaDBv?=
 =?utf-8?B?Zk92MVlTdnkwdndFN255d2FIQkM4dWU5RlF2VHh5ekpjMjYvSTQ5RlBrRmlT?=
 =?utf-8?B?UlRuTmZCNkR3N0ZGejlsaEpaeEd5RWM1UzdNZUNBejRNREhPdzNtZmNLNHdo?=
 =?utf-8?B?ZkVHL3BDSUQ4aUlpT2hwb09uR1VVZ2NmTGNSQ2lYQllLNmdHUE9mQlR6R0Fj?=
 =?utf-8?B?bG45OVh0eUh2eElubTczYnpaakgzZm80OWR3NjRUL3k3NDQyTGNqeTBvSHVQ?=
 =?utf-8?B?UW5rNzdxT3oxa3BDTU5iNTZHZ3JTV21aU1pGYWlMWHlqbVZwd2ZnU0VKeHU4?=
 =?utf-8?B?Zy80T1hvbDJ5SW1hcmJ2Z0JSSjd4eGlvcmRFcDBxOTBVTnc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB7468.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SUQ4MDVrbUpRdm9tZlQrSzNPckxscW8xYXpsMFN1Y0R3MU4rbTVaSU1rVDlE?=
 =?utf-8?B?QWNFeitibUVyem5yamRqYzM1TDlXdnNweXUzZnRXR3NjcXFpWmE5MVlxRTFL?=
 =?utf-8?B?aDRkVFdlVTdCVG56QWl0OEhJeWYrdHpES3l4V3kwbkd0aDloU0xxNjdNWmNk?=
 =?utf-8?B?YzlHakphaU5CWm52VWFpZCtBWVl2bFZxbW16Qkh6a013R0FaOW9VbnFuZEpv?=
 =?utf-8?B?ZWZOMmwyZnpKK2szUjh2MTllWWpaMHVNV2pHU0RUYTRoWUYwT2hxWGMyMytu?=
 =?utf-8?B?TkVjMHRDOWltaDFWanRiSjZBQ1ZvTXNGdyt4M2NLODRINndlaXVsNEpPSVg2?=
 =?utf-8?B?UlE1K3FPSkxXMmVuRFZTT08zWEZSS1ozKytBWUZ3RHF2bmVoSGtHVDZFSTZK?=
 =?utf-8?B?YUhTOU1FOTRVUmU4d0NLZGFBLzVjZWUwWHg4M25UeWlWM0U5dWpzcWh1UmIw?=
 =?utf-8?B?SGdmTzMvRko3akhhKzI2MVhneEN6bGhJNUlucFhSUWIvM1VhSUsycFlwMEV5?=
 =?utf-8?B?NkpJOUJMRmVYNG1pb1pWclhHRDVHZWpnRmJQV0NXWXFVTTBCSEg2bXRXcllS?=
 =?utf-8?B?dGFSUzNnUThSM2lMaE95cjdpbExZZlZjenhEWU9Zam9TeFBZQjkvcEExY2Jx?=
 =?utf-8?B?dnJBcXhJdFF0Y0tJVUZuMTQ5SmE0R0VBanRwaitlL2c1Q2R1NTVOVHBKZ1pU?=
 =?utf-8?B?M3UyMHJyeVpzd0xubWlVbitoeVlwWkpFV0JwdlZCdWM4eFpiK2hoTWd0bUsy?=
 =?utf-8?B?NDk3Ny9oeGZGa3BCdUU5d3JUQXkzUVEvZXh4WHFwTUlFUHkvMVdJQ3hvL05q?=
 =?utf-8?B?bXRkT0ZSYnZjMHV4dDJUalo0R2FuL0hObzhBNDNkVmlDTU90OGViOHJGRUNC?=
 =?utf-8?B?dkRnLzdSU3FxL0Q0N21KSzJlWlB6UklhdHdKTkRHRDhZY1BsYWdIU1lqQjk3?=
 =?utf-8?B?dDJDNmlsOEIwb3EwclRQVXlncUpkZTRkZlZlTGJtUUl4NXMzZ09TekI0c2d6?=
 =?utf-8?B?Z3lwaGEvb1RpY3JvbmxaSTlQb3FRanM3bTBKWXJKV21YaEh5VjI2R05RT21i?=
 =?utf-8?B?c2RMZHNvTFh1eDdEL1AyeWN1ZDlhTDRSNmcwVmFHT1haUUZzaDRjY2w1czV6?=
 =?utf-8?B?ZC9qOWQ3OWxHeTJPMWxaRmdLLzJ5elBOalUzTnZkb0p4VUROQzQ5c3ZxUmZ5?=
 =?utf-8?B?WlNuS3dpSFZ6Qlk1R25sUnJQaDA2ZUc3V2JPVVVVN0toNzJxSUpKZE9EdmhI?=
 =?utf-8?B?SlhZUEpOV0RPTFlxNjRNdEs0MzMzNXdoWWZVS3M5M3cxVW1iYzN4U3E0azFS?=
 =?utf-8?B?alkyeTA0cGZvaGR4TzRuMWlxNTh2YU9VRGZFeXhxaSs3TTB0M2hTSzMvZWkr?=
 =?utf-8?B?TmtKRXVlZlFTTWFRV281UGJ6YmdFbjdJRU1PTklHdC9yVUlPS2NLZWxkb2R0?=
 =?utf-8?B?MHl3bXVYbUE0RjZXdjBJVWE2STZ4aWVVUTRUbm1aNXRQclp0RFVXS0RGNHdu?=
 =?utf-8?B?MFVYMHRxVmFUVkJuKzN6Q250WlBaMjFiTzl4MVA1Mm5NRmNBandOWHJrcEtL?=
 =?utf-8?B?NjA1T1F0S2JLcnQxdnovcW1panpwL0Q4ek9OMjlzTTF3Wis1ekFMd3htTjdH?=
 =?utf-8?B?a3h6N09tTzJHZ2dCOHFNTEgxdUZEVzZSNU1IWUo5bjBGTjZTWlhSaFA5czMr?=
 =?utf-8?B?NGwzSXdIVHBpbnNDUUs1S3JDckNxRWd4VVZhVWFXcFhWQWl5ZTdnalo5QkhN?=
 =?utf-8?B?NFBGaWNTcWtJOXIzTWRtaFhmNmJUL0xuTlZIUDc4dXd2eVYxSURmaXhpOFd6?=
 =?utf-8?B?ajVOelZkNjVyRXdWOGc3TVBmN3BtbTFVQ0Fuc1NxdXVzbzMybi92L2dXMzdr?=
 =?utf-8?B?bmhDcTZnQkNUMmFUUFhlbkpBWTZBTHYxYjA5eW1BeWdaWFhxdFNiT2NtRndO?=
 =?utf-8?B?TUgvcHNHR0Y4d29WMGoxTisvMnRYNmkxZWtPQVdlczJDdzczSy9GNkMyMFBh?=
 =?utf-8?B?VXArY2NyRzV4T2V1YWk2bW85UzhoTjNFallsYm90bjByWUE1Z3pQR3ZmOHRU?=
 =?utf-8?B?T3paQlVsL3Bud1JNNlZiRGZkZklQSGFBS1RNUXk0Y0FiSjF3bEFSK1lKWS80?=
 =?utf-8?Q?UFyk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <92EB20150D1D7A4E8ADD6197E8C854E3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7468.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f842b1-b8e2-4d50-b594-08dd2f86d908
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 01:50:36.9393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dP3LbEUZrlrjm4m7trTTTA7MA4MG6IrTQYhrxKS/PV4hgGmOY5sgXQHPQBBcWha+95DXxOtjVswatmxtAl2P4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7654

SGkgTHVpeiAmIFBhdWxpLA0KDQpBU0NTIHYxLjAuMSDCpzUuOSBpbnRyb2R1Y2VzIHR3byBvcGVy
YXRpb24gcHJvY2Vzc2VzIGZvciB0aGUgc2VydmVyIHRvIA0KaGFuZGxlIHRoZSByZWxlYXNlZCBz
dGF0ZToNCi0tLS0tLS0tLS0tLS0tLS0NCklmIHRoZSBzZXJ2ZXIgd2FudHMgdG8gY2FjaGUgYSBj
b2RlYyBjb25maWd1cmF0aW9uOg0KLSBUcmFuc2l0aW9uIHRoZSBBU0UgdG8gdGhlIENvZGVjIENv
bmZpZ3VyZWQgc3RhdGUgYW5kIHdyaXRlIGEgdmFsdWUgb2YgDQoweDAxIChDb2RlYyBDb25maWd1
cmVkKSB0byB0aGUgQVNFX1N0YXRlIGZpZWxkDQotIFdyaXRlIHRoZSBjb25maWd1cmVkIHZhbHVl
cyBvciB0aGUgc2VydmVy4oCZcyBwcmVmZXJyZWQgdmFsdWVzIGZvciB0aGUgDQpDb2RlY19JRCwg
Q29kZWNfU3BlY2lmaWNfQ29uZmlndXJhdGlvbl9MZW5ndGgsIGFuZCANCkNvZGVjX1NwZWNpZmlj
X0NvbmZpZ3VyYXRpb24gcGFyYW1ldGVycyB0byB0aGUgbWF0Y2hpbmcgDQpBZGRpdGlvbmFsX0FT
RV9QYXJhbWV0ZXJzIGZpZWxkcyBkZWZpbmVkIGluIFRhYmxlIDQuMyANCjxodHRwczovL3d3dy5i
bHVldG9vdGguY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy9GaWxlcy9TcGVjaWZpY2F0aW9uL0hUTUwv
MjMxNjYtQVNDUy1odG1sNS9vdXQvZW4vaW5kZXgtZW4uaHRtbCNVVUlELThlOTYxZjhlLTk4Yjct
MjNiOC01M2Q3LTU5Y2M4ODc2MmZjMF9OMTY2MTQ2MDExNzAzNT4uDQotIFdyaXRlIHRoZSBzZXJ2
ZXLigJlzIHByZWZlcnJlZCB2YWx1ZXMgZm9yIHRoZSByZW1haW5pbmcgDQpBZGRpdGlvbmFsX0FT
RV9QYXJhbWV0ZXJzIGZpZWxkcyBkZWZpbmVkIGluIFRhYmxlIDQuMyANCjxodHRwczovL3d3dy5i
bHVldG9vdGguY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy9GaWxlcy9TcGVjaWZpY2F0aW9uL0hUTUwv
MjMxNjYtQVNDUy1odG1sNS9vdXQvZW4vaW5kZXgtZW4uaHRtbCNVVUlELThlOTYxZjhlLTk4Yjct
MjNiOC01M2Q3LTU5Y2M4ODc2MmZjMF9OMTY2MTQ2MDExNzAzNT4uDQoNCklmIHRoZSBzZXJ2ZXIg
ZG9lcyBub3Qgd2FudCB0byBjYWNoZSBhIGNvZGVjIGNvbmZpZ3VyYXRpb246DQotIFRyYW5zaXRp
b24gdGhlIEFTRSB0byB0aGUgSWRsZSBzdGF0ZSBhbmQgd3JpdGUgYSB2YWx1ZSBvZiAweDAwIChJ
ZGxlKSANCnRvIHRoZSBBU0VfU3RhdGUgZmllbGQuDQotIERlbGV0ZSBhbnkgQWRkaXRpb25hbF9B
U0VfUGFyYW1ldGVycyBmaWVsZHMgcHJlc2VudC4NCi0tLS0tLS0tLS0tLS0tLS0NCmh0dHBzOi8v
d3d3LmJsdWV0b290aC5jb20vd3AtY29udGVudC91cGxvYWRzL0ZpbGVzL1NwZWNpZmljYXRpb24v
SFRNTC8yMzE2Ni1BU0NTLWh0bWw1L291dC9lbi9pbmRleC1lbi5odG1sI1VVSUQtOWQ1MjIxYjIt
ZWFkZC0xYmRlLTA5ZDQtNWIzYmI5ZTZkN2I4DQpDdXJyZW50bHkgQmx1ZVogb25seSB1c2VzIG5v
bi1jYWNoZWQgb3BlcmF0aW9uLCBJdCBzZWVtcyB0aGF0IHRoZSANCkFuZHJvaWQgcGxhdGZvcm0g
aXMgbm90IGNvbXBhdGlibGUgd2l0aCB0aGUgbm9uLWNhY2hlZCBDb2RlYyANCkNvbmZpZ3VyYXRp
b24gc2NlbmFyaW8sDQpJIHJhaXNlZCBhbiBpc3N1ZSB3aGVuIHRlc3RpbmcgcGxheWJhY2sgYW5k
IHBhdXNlIHVzaW5nIGEgUGl4ZWwgcGhvbmUuIA0KaHR0cHM6Ly9naXRodWIuY29tL2JsdWV6L2Js
dWV6L2lzc3Vlcy8xMDUzDQpTbyBJIHRyaWVkIG1vZGlmeWluZyB0aGUgY29kZSB0byB1c2UgYSBj
YWNoZWQgQ29kZWMgQ29uZmlndXJhdGlvbiANCihyZWZlcmVuY2luZyB0aGUgcHJvY2VzcyBmb3Ig
UGl4ZWwgKyBSZWRtaSBCdWRzIDVQcm8gaGVhZHBob25lcykuDQpJIGJlbGlldmUgdGhlcmUgYXJl
IHR3byBpc3N1ZXMgdGhhdCBuZWVkIHRvIGJlIGNvbmZpcm1lZDoNCi0gRG9lcyBCbHVlWiBuZWVk
IHRvIHN1cHBvcnQgYm90aCBvcGVyYXRpb25zIGFuZCBob3cgdG8gZGVjaWRlIHdoaWNoIG9uZSAN
CnRvIHVzZT8gKGNhY2hlZCBvciBub24tY2FjaGVkKTsNCi0gV2hldGhlciB0aGUgQW5kcm9pZCBw
bGF0Zm9ybSB3aWxsIGJlIGNvbXBhdGlibGUgd2l0aCBub24tY2FjaGVkIGluIHRoZSANCmZ1dHVy
ZS4NCg0KPiBbIEVYVEVSTkFMIEVNQUlMIF0NCj4NCj4gSGkgWWFuZywNCj4NCj4gT24gU3VuLCBK
YW4gNSwgMjAyNSBhdCA5OjUw4oCvUE0gWWFuZyBMaSB2aWEgQjQgUmVsYXkNCj4gPGRldm51bGwr
eWFuZy5saS5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToNCj4+IEZyb206IFlhbmcgTGkg
PHlhbmcubGlAYW1sb2dpYy5jb20+DQo+Pg0KPj4gQ0lTIHNpbmsgbmVlZCBjYWNoaW5nIHRoZSBD
b2RlYyBDb25maWd1cmVkIHdoZW4gcmVsZWFzaW5nIGJ5IFBpeGVsLA0KPj4gc3RhdGUgbWFjaGlu
ZSBpcyByZWxlYXNpbmcgLT4gQ29kZWMuIElmIHN0cmVhbW1pbmcgLT4gaWRsZSwgQ0lTIHNpbmsN
Cj4+IHdhcyBzaWxlbnQgYWZ0ZXIgcmVzdW1lIG11c2ljLg0KPiBZb3UgbmVlZCB0byB3b3JrIG9u
IHRoZSBjb21taXQgbWVzc2FnZSwgcGVyaGFwcyBxdW90ZSB0aGUgc3BlYyBpZg0KPiB0aGVyZSBp
cyBhIGRlc2NyaXB0aW9uIG9mIHRoZSBzdGF0ZSB0cmFuc2l0aW9uLg0KV2VsbCwgSSBnb3QgaXQu
DQo+DQo+PiBTaWduZWQtb2ZmLWJ5OiBZYW5nIExpIDx5YW5nLmxpQGFtbG9naWMuY29tPg0KPj4g
LS0tDQo+PiAgIHNyYy9zaGFyZWQvYmFwLmMgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCsp
LCAxMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvc3JjL3NoYXJlZC9iYXAuYyBi
L3NyYy9zaGFyZWQvYmFwLmMNCj4+IGluZGV4IDE2NzUwMTI4Mi4uYTdmNWRlYzkyIDEwMDY0NA0K
Pj4gLS0tIGEvc3JjL3NoYXJlZC9iYXAuYw0KPj4gKysrIGIvc3JjL3NoYXJlZC9iYXAuYw0KPj4g
QEAgLTEwNjMsNiArMTA2MywyOCBAQCBzdGF0aWMgdm9pZCBzdHJlYW1fbm90aWZ5X21ldGFkYXRh
KHN0cnVjdCBidF9iYXBfc3RyZWFtICpzdHJlYW0pDQo+PiAgICAgICAgICBmcmVlKHN0YXR1cyk7
DQo+PiAgIH0NCj4+DQo+PiArc3RhdGljIHZvaWQgc3RyZWFtX25vdGlmeV9yZWxlYXNlKHN0cnVj
dCBidF9iYXBfc3RyZWFtICpzdHJlYW0pDQo+PiArew0KPj4gKyAgICAgICBzdHJ1Y3QgYnRfYmFw
X2VuZHBvaW50ICplcCA9IHN0cmVhbS0+ZXA7DQo+PiArICAgICAgIHN0cnVjdCBidF9hc2NzX2Fz
ZV9zdGF0dXMgKnN0YXR1czsNCj4+ICsgICAgICAgc2l6ZV90IGxlbjsNCj4+ICsNCj4+ICsgICAg
ICAgREJHKHN0cmVhbS0+YmFwLCAic3RyZWFtICVwIiwgc3RyZWFtKTsNCj4+ICsNCj4+ICsgICAg
ICAgbGVuID0gc2l6ZW9mKCpzdGF0dXMpOw0KPj4gKyAgICAgICBzdGF0dXMgPSBtYWxsb2MobGVu
KTsNCj4gSnVzdCB1c2UgYSBzdGFjayB2YXJpYWJsZSBpbnN0ZWFkIG9mIHVzaW5nIG1hbGxvYy4N
Cg0KSSB3aWxsIGRvIGl0Lg0KDQpJIGp1c3QgcmVmZXJyZWQgdG8gb3RoZXIgZnVuY3Rpb24gZmxv
d3MsIGxpa2Ugc3RyZWFtX25vdGlmeV9tZXRhZGF0YSgpDQoNCj4NCj4+ICsNCj4+ICsgICAgICAg
bWVtc2V0KHN0YXR1cywgMCwgbGVuKTsNCj4+ICsgICAgICAgc3RhdHVzLT5pZCA9IGVwLT5pZDsN
Cj4+ICsgICAgICAgZXAtPnN0YXRlID0gQlRfQkFQX1NUUkVBTV9TVEFURV9SRUxFQVNJTkc7DQo+
PiArICAgICAgIHN0YXR1cy0+c3RhdGUgPSBlcC0+c3RhdGU7DQo+PiArDQo+PiArICAgICAgIGdh
dHRfZGJfYXR0cmlidXRlX25vdGlmeShlcC0+YXR0ciwgKHZvaWQgKikgc3RhdHVzLCBsZW4sDQo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnRfYmFwX2dldF9hdHQo
c3RyZWFtLT5iYXApKTsNCj4+ICsNCj4+ICsgICAgICAgZnJlZShzdGF0dXMpOw0KPj4gK30NCj4+
ICsNCj4+ICAgc3RhdGljIHN0cnVjdCBidF9iYXAgKmJ0X2JhcF9yZWZfc2FmZShzdHJ1Y3QgYnRf
YmFwICpiYXApDQo+PiAgIHsNCj4+ICAgICAgICAgIGlmICghYmFwIHx8ICFiYXAtPnJlZl9jb3Vu
dCB8fCAhcXVldWVfZmluZChzZXNzaW9ucywgTlVMTCwgYmFwKSkNCj4+IEBAIC0xNjM0LDcgKzE2
NTYsNyBAQCBzdGF0aWMgYm9vbCBzdHJlYW1fbm90aWZ5X3N0YXRlKHZvaWQgKmRhdGEpDQo+PiAg
ICAgICAgICBzdHJ1Y3QgYnRfYmFwX3N0cmVhbSAqc3RyZWFtID0gZGF0YTsNCj4+ICAgICAgICAg
IHN0cnVjdCBidF9iYXBfZW5kcG9pbnQgKmVwID0gc3RyZWFtLT5lcDsNCj4+DQo+PiAtICAgICAg
IERCRyhzdHJlYW0tPmJhcCwgInN0cmVhbSAlcCIsIHN0cmVhbSk7DQo+PiArICAgICAgIERCRyhz
dHJlYW0tPmJhcCwgInN0cmVhbSAlcCBzdGF0dXMgJWQiLCBzdHJlYW0sIGVwLT5zdGF0ZSk7DQo+
Pg0KPj4gICAgICAgICAgaWYgKHN0cmVhbS0+c3RhdGVfaWQpIHsNCj4+ICAgICAgICAgICAgICAg
ICAgdGltZW91dF9yZW1vdmUoc3RyZWFtLT5zdGF0ZV9pZCk7DQo+PiBAQCAtMTY1NSw2ICsxNjc3
LDkgQEAgc3RhdGljIGJvb2wgc3RyZWFtX25vdGlmeV9zdGF0ZSh2b2lkICpkYXRhKQ0KPj4gICAg
ICAgICAgY2FzZSBCVF9BU0NTX0FTRV9TVEFURV9ESVNBQkxJTkc6DQo+PiAgICAgICAgICAgICAg
ICAgIHN0cmVhbV9ub3RpZnlfbWV0YWRhdGEoc3RyZWFtKTsNCj4+ICAgICAgICAgICAgICAgICAg
YnJlYWs7DQo+PiArICAgICAgIGNhc2UgQlRfQVNDU19BU0VfU1RBVEVfUkVMRUFTSU5HOg0KPj4g
KyAgICAgICAgICAgICAgIHN0cmVhbV9ub3RpZnlfcmVsZWFzZShzdHJlYW0pOw0KPiBPaywgSSBz
ZWUgd2hlcmUgdGhpcyBpcyBnb2luZywgYnV0IHRoZSBzcGVjIGRvZXNuJ3QgYWN0dWFsbHkgbWFu
ZGF0ZQ0KPiB0byBzZW5kIHJlbGVhc2luZyBvciBjYWNoaW5nIHRoZSBjb2RlYyBjb25maWd1cmF0
aW9uOg0KPg0KPiBodHRwczovL3d3dy5ibHVldG9vdGguY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy9G
aWxlcy9TcGVjaWZpY2F0aW9uL0hUTUwvMjMxNjYtQVNDUy1odG1sNS9vdXQvZW4vaW5kZXgtZW4u
aHRtbCNVVUlELWMzNzYwMGEzLTQ1NDEtMTkyNi0yZjEzLWViMjkwNTdlNDFkNV9OMTY2MTQ1OTUx
MzQxOA0KPg0KPiBQZXJoYXBzIHlvdSBhcmUgc2F5aW5nIHRoYXQgd2UgbmVlZCB0byBzZW5kIFJl
bGVhc2luZyBhdCBsZWFzdD8gVGhlcmUNCj4gaXMgYWxzbyB0aGUgdGhpbmcgdGhhdCBJIGRvbid0
IHVuZGVyc3RhbmQgaXMgd2h5IHdvdWxkIHNvbWVvbmUgc2VuZA0KPiByZWxlYXNlIGNvbW1hbmQg
YW5kIGdldCByaWQgb2YgUW9TL0NJRyB3aGlsZSBrZWVwaW5nIHRoZSBDb2RlYw0KPiBDb25maWd1
cmF0aW9uPw0KSSB0aGluayB0aGUgY2xpZW50IHJlcXVpcmVzIHRoZSBzZXJ2ZXIgdG8gbm90aWZ5
IHRoZSBjdXJyZW50IHN0YXRlIGFzIA0KcmVsZWFzZWQuDQo+DQo+PiArICAgICAgICAgICAgICAg
YnJlYWs7DQo+PiAgICAgICAgICB9DQo+Pg0KPj4gICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPj4g
QEAgLTE5MzYsOSArMTk2MSw3IEBAIHN0YXRpYyB1aW50OF90IHN0cmVhbV9kaXNhYmxlKHN0cnVj
dCBidF9iYXBfc3RyZWFtICpzdHJlYW0sIHN0cnVjdCBpb3ZlYyAqcnNwKQ0KPj4gICAgICAgICAg
LyogU2luayBjYW4gYXV0b25vbW91c2x5IHRyYW5zaXQgdG8gUU9TIHdoaWxlIHNvdXJjZSBuZWVk
cyB0byBnbyB0bw0KPj4gICAgICAgICAgICogRGlzYWJsaW5nIHVudGlsIEJUX0FTQ1NfU1RPUCBp
cyByZWNlaXZlZC4NCj4+ICAgICAgICAgICAqLw0KPj4gLSAgICAgICBpZiAoc3RyZWFtLT5lcC0+
ZGlyID09IEJUX0JBUF9TSU5LKQ0KPj4gLSAgICAgICAgICAgICAgIHN0cmVhbV9zZXRfc3RhdGUo
c3RyZWFtLCBCVF9CQVBfU1RSRUFNX1NUQVRFX1FPUyk7DQo+PiAtICAgICAgIGVsc2UNCj4+ICsg
ICAgICAgaWYgKHN0cmVhbS0+ZXAtPmRpciA9PSBCVF9CQVBfU09VUkNFKQ0KPiBEb24ndCB0aGlu
ayB0aGlzIGlzIGNvcnJlY3QsIHdoeSBhcmUgeW91IHRha2luZyBhd2F5IHRoZSBzZXR0aW5nIHRv
DQo+IFFvUyBsaWtlIGl0IGlzIGRvY3VtZW50ZWQ/DQoNClRoaXMgaXMgYWxzbyB3aGF0IEkgYW0g
Y29uZnVzZWQgYWJvdXQuIFdoeSBkbyB3ZSBuZWVkIHRvIHNldCBzdGF0ZT1Rb1MgDQppbiBzdHJl
YW1fZGlzYWJsZSgpPw0KDQogRnJvbSB0aGUgQVNFIHN0YXRlIG1hY2hpbmUsIHRoZSBBU0Ugc3Rh
dGUgc2hvdWxkIHN0YXkgaW4gQ29kZWMgDQpDb25maWd1cmVkIGFmdGVyIFJlbGVhc2VkLCBhbmQg
c3dpdGNoIHRvIFFvUyBzdGF0ZSB3aGVuIENsaWVudCANCmNvbmZpZ3VyZXMgUW9TLg0KDQpodHRw
czovL3d3dy5ibHVldG9vdGguY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy9GaWxlcy9TcGVjaWZpY2F0
aW9uL0hUTUwvMjMxNjYtQVNDUy1odG1sNS9vdXQvZW4vaW5kZXgtZW4uaHRtbCNVVUlELTM2M2Vl
ZWY2LWFiYzUtNmY1NC1jZmE2LTA5ZmU0NDUxZmQxNQ0KDQo+PiAgICAgICAgICAgICAgICAgIHN0
cmVhbV9zZXRfc3RhdGUoc3RyZWFtLCBCVF9CQVBfU1RSRUFNX1NUQVRFX0RJU0FCTElORyk7DQo+
Pg0KPj4gICAgICAgICAgcmV0dXJuIDA7DQo+PiBAQCAtMjA2OCwxNyArMjA5MSwxMSBAQCBzdGF0
aWMgdW5zaWduZWQgaW50IGJhcF91Y2FzdF9tZXRhZGF0YShzdHJ1Y3QgYnRfYmFwX3N0cmVhbSAq
c3RyZWFtLA0KPj4NCj4+ICAgc3RhdGljIHVpbnQ4X3Qgc3RyZWFtX3JlbGVhc2Uoc3RydWN0IGJ0
X2JhcF9zdHJlYW0gKnN0cmVhbSwgc3RydWN0IGlvdmVjICpyc3ApDQo+PiAgIHsNCj4+IC0gICAg
ICAgc3RydWN0IGJ0X2JhcF9wYWMgKnBhYzsNCj4+IC0NCj4+ICAgICAgICAgIERCRyhzdHJlYW0t
PmJhcCwgInN0cmVhbSAlcCIsIHN0cmVhbSk7DQo+Pg0KPj4gICAgICAgICAgYXNjc19hc2VfcnNw
X3N1Y2Nlc3MocnNwLCBzdHJlYW0tPmVwLT5pZCk7DQo+Pg0KPj4gLSAgICAgICBwYWMgPSBzdHJl
YW0tPmxwYWM7DQo+PiAtICAgICAgIGlmIChwYWMtPm9wcyAmJiBwYWMtPm9wcy0+Y2xlYXIpDQo+
PiAtICAgICAgICAgICAgICAgcGFjLT5vcHMtPmNsZWFyKHN0cmVhbSwgcGFjLT51c2VyX2RhdGEp
Ow0KPiBIbW0sIEkgdGhpbmsgd2UgZG8gZGVwZW5kIG9uIGNsZWFyIHRvIGJlIGNhbGxlZCB0byB0
ZWxsIHRoZSB1cHBlcg0KPiBzdGFjayB0aGUgdHJhbnNwb3J0IGlzIGJlaW5nIHJlbGVhc2VkLCBv
ciB5b3UgZGlkIHRlc3QgdGhpcyB3aXRoIHRoZQ0KPiBsaWtlcyBvZiBwaXBld2lyZSBhbmQgZm91
bmQgdGhhdCBpcyBub3QgcmVhbGx5IHJlcXVpcmVkPw0KSWYgY2xlYXIgaXMgZXhlY3V0ZWQsIENJ
UyB3aWxsIGJlIGRpc2Nvbm5lY3RlZCBhdXRvbWF0aWNhbGx5LiBJIGNvbXBhcmVkIA0KaXQgd2l0
aCB0aGUgcGl4ZWwrQnVkczUgaGVhZHBob25lcywgYW5kIGl0IHdhcyB0aGUgbW9iaWxlIHBob25l
IHRoYXQgDQpkaXNjb25uZWN0ZWQgdGhlIENJUywgc28gaW4gdGhlIGNhY2hlZCBDb2RlYyBDb25m
aWd1cmF0aW9uIG9wZXJhdGlvbiANCnByb2Nlc3MsIHRoZXJlIGlzIG5vIG5lZWQgdG8gZGlzY29u
bmVjdCB0aGUgQ0lTLg0KPg0KPj4gLSAgICAgICBzdHJlYW1fc2V0X3N0YXRlKHN0cmVhbSwgQlRf
QkFQX1NUUkVBTV9TVEFURV9JRExFKTsNCj4+ICsgICAgICAgc3RyZWFtX3NldF9zdGF0ZShzdHJl
YW0sIEJUX0JBUF9TVFJFQU1fU1RBVEVfUkVMRUFTSU5HKTsNCj4+DQo+PiAgICAgICAgICByZXR1
cm4gMDsNCj4+ICAgfQ0KPj4gQEAgLTYxNzIsOCArNjE4OSwxMCBAQCBzdGF0aWMgYm9vbCBzdHJl
YW1faW9fZGlzY29ubmVjdGVkKHN0cnVjdCBpbyAqaW8sIHZvaWQgKnVzZXJfZGF0YSkNCj4+DQo+
PiAgICAgICAgICBEQkcoc3RyZWFtLT5iYXAsICJzdHJlYW0gJXAgaW8gZGlzY29ubmVjdGVkIiwg
c3RyZWFtKTsNCj4+DQo+PiAtICAgICAgIGJ0X2JhcF9zdHJlYW1fc2V0X2lvKHN0cmVhbSwgLTEp
Ow0KPj4gKyAgICAgICBpZiAoc3RyZWFtLT5lcC0+c3RhdGUgPT0gQlRfQVNDU19BU0VfU1RBVEVf
UkVMRUFTSU5HKQ0KPj4gKyAgICAgICAgICAgICAgIHN0cmVhbV9zZXRfc3RhdGUoc3RyZWFtLCBC
VF9CQVBfU1RSRUFNX1NUQVRFX0NPTkZJRyk7DQo+Pg0KPj4gKyAgICAgICBidF9iYXBfc3RyZWFt
X3NldF9pbyhzdHJlYW0sIC0xKTsNCj4+ICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4+ICAgfQ0K
Pj4NCj4+DQo+PiAtLS0NCj4+IGJhc2UtY29tbWl0OiBkZmIxZmZkYzk1YTAwYmMwNmQ4MWE3NWMx
MWFiNWFkMmUyNGQzN2JmDQo+PiBjaGFuZ2UtaWQ6IDIwMjUwMTA2LXVwc3RyZWFtLTFlYzlhZTk2
Y2RhNA0KPj4NCj4+IEJlc3QgcmVnYXJkcywNCj4+IC0tDQo+PiBZYW5nIExpIDx5YW5nLmxpQGFt
bG9naWMuY29tPg0KPj4NCj4+DQo+Pg0KPg0KPiAtLQ0KPiBMdWl6IEF1Z3VzdG8gdm9uIERlbnR6
DQoNCg0K

