Return-Path: <linux-bluetooth+bounces-2324-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DA08732F7
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 Mar 2024 10:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C8CA285F0D
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 Mar 2024 09:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00ECB5F57A;
	Wed,  6 Mar 2024 09:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L0qDOQ/R"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FE85DF3B
	for <linux-bluetooth@vger.kernel.org>; Wed,  6 Mar 2024 09:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709718243; cv=fail; b=BHXINjMuNSMYFMpojupO93DC2F/TUXYarmtPUA1feN+heeSqNQb/WC5C7UKx3Yfm+QoBp8U09JDT5D7vjsXAkh+/bao0riBgWPM8ZO0VzdTB4He5T9l9ZG+3wZTmDKmzyKLGWVj9QGPVnUy8d06/G7KL3VE4LON/69zq+fJj/os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709718243; c=relaxed/simple;
	bh=/KhDORAzzFRmY1SiY0wZI7TwbZkU9KBDcO/CqhRfCBM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ef0m2bnVL04FgRJgCoAG6Lrln/etM5yEiiX1/J7d//azV37XsmM+8djlhZJvrzbaI5dTaWG++sf/jjc0kflCxqqAIpNZRIppwep94YxsRt9cjGHC3UIYYCyd2OhLBgJkw7AQ24K+vkxxqEg0oXNok8m/TKpcsavvV5N2uWvl8Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L0qDOQ/R; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709718241; x=1741254241;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/KhDORAzzFRmY1SiY0wZI7TwbZkU9KBDcO/CqhRfCBM=;
  b=L0qDOQ/RpAjW8UUk8I97JgQwD0pWdshJqMRybt62V2PaKnK0r9ZFmp+7
   o2M95LG8NaUCRoFRgtYjjtGAhHra4NtOMY7Usupgdg4YQsQKL+36y3M0y
   oMpBYyM+O7RrZne/MSiOnGlujvgLyJT9UcBK0Ai0ioJD/GBD0ZvFcXgvG
   yKB+rj8Uk5BAyqwPdPY1Wcps2TjSFE6oR/DndI/12Z+gWwA+lGh1cgbuL
   eTFqStBUHQI68op85nUPMmZlwOB5qphJYW/o2+NSnxlCS302q3i6DyNWS
   nk47CmrYI/GS42e3NqqY7m2fgsGl8NvcCI8WEd1QS7UzAMhdu5iaZnU/o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="14898407"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="14898407"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 01:44:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="32854753"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Mar 2024 01:44:00 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 01:43:59 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 01:43:59 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 01:43:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHJdCMwSS9yOAMoYyS2MSYpiKvd4I/fy6oAN1JeOIYpZD4QTV48kmNnmN8f6G3KU0wpe3yjqL4YYDU4MExNjdqKRzSJX9KVwpCF4vfzzGfVDf8PY1mz1N4zec+aJ+/EW4x0QZwFJ94gfQuf8aUg/yvYabUp1pxURIkS5eKTrbihPwNa8P41kL73/WaoZr7JQGt/4SIwM3m/Nd2sDR+bBJl5FQMxkn3ZHinPAN/IlmXsoYtTx9nPwJLPNQf+I97w1vDedbbPv12gZaAVkZ8mTBArdk92H3TlROB24DktlAHLTMpwHXvdl7CKvcX/Ir/nlqfCPXbPBUAc6RvniiAD0dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KhDORAzzFRmY1SiY0wZI7TwbZkU9KBDcO/CqhRfCBM=;
 b=Xv5lFVJttQ5rsww/OZQUJKsCfwBv3IJgRVBHMiOC4i5dzdpziMsPqcB99rhS+TgsQsz8vB3mi816jIOndaDKpEFnKy6vuXHBkV+FBaKAf+a0n5JGtms1diX1FrNZ6Ie+qK4sjk+Txip3kOPJH87SlPbA+cuqUM8ttH3y98ayu4Mc/D679RNSt3AGwe5jHIZyuKt95HWFu5jvGk2k/BtSrDvToZpjL6Ky6pnY+x8k425yc/zlu/b4SKCG7Foi+2gdbRqvuIhekepUYgG1O4sFzy8NXvLG1+Pfo/hSaFCHWc2i9j6OOxR3j29oMRwJeej19UolTUcNyv+Be028QNG0mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB7585.namprd11.prod.outlook.com (2603:10b6:510:28f::10)
 by DS0PR11MB8163.namprd11.prod.outlook.com (2603:10b6:8:165::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 09:43:56 +0000
Received: from PH0PR11MB7585.namprd11.prod.outlook.com
 ([fe80::b517:edd4:27fa:580e]) by PH0PR11MB7585.namprd11.prod.outlook.com
 ([fe80::b517:edd4:27fa:580e%7]) with mapi id 15.20.7339.019; Wed, 6 Mar 2024
 09:43:56 +0000
From: "K, Kiran" <kiran.k@intel.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
CC: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
	"Srivatsa, Ravishankar" <ravishankar.srivatsa@intel.com>, "Tumkur Narayan,
 Chethan" <chethan.tumkur.narayan@intel.com>
Subject: RE: [PATCH v3 2/2] Bluetooth: btintel: Add support for downloading
 intermediate loader
Thread-Topic: [PATCH v3 2/2] Bluetooth: btintel: Add support for downloading
 intermediate loader
Thread-Index: AQHabwnZA1ORBCi/KUmHkTPcywwhx7EpukuAgACl0tA=
Date: Wed, 6 Mar 2024 09:43:56 +0000
Message-ID: <PH0PR11MB75853FCEE7FAD4406EA64A34F5212@PH0PR11MB7585.namprd11.prod.outlook.com>
References: <20240305144459.119564-1-kiran.k@intel.com>
 <20240305144459.119564-2-kiran.k@intel.com>
 <CABBYNZJC60s9m8D_KmYOT6R8+QY5_c5-4VgcgO8phpWD7ZTqWQ@mail.gmail.com>
In-Reply-To: <CABBYNZJC60s9m8D_KmYOT6R8+QY5_c5-4VgcgO8phpWD7ZTqWQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7585:EE_|DS0PR11MB8163:EE_
x-ms-office365-filtering-correlation-id: 6e4bc008-33e9-4773-a3fd-08dc3dc1f146
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IjMx0KrKNKLoLYk6zrHYjL+k/douqYGaR73kpWK35xQiqxIIz5g56P12c2mHqbnTEHGZcf0EXq8q82PSu8QdMWsyFRlO689L07YW/1ZwhpvWURkTcN1Np9alWAIMcWFlcon6Gd69J+mhJCm6OqyTMJE5FTdGtI57NOl2rb2Ca2MlPQ0mlqwwaX4Y54r7hVYYT9i+xhM5ORm1BMTAXTKUpETHjQ20BLAnuPlgY2ra/gN5J70eTcPENAq9tiKpMYkXXI68/4Y5czTZJSNvWZFHAE4YdiNvl4k8jX2EKIyRIA/ojYBj8qPiIB+EiMu7M3cECcCCR1BZvDyNcj4NlARvi7YG27yEGWjbFz2Iy/NtW6Jn/aY3jqhgKzGhGVe974MEli6/Pb5RIeiCRZzn8G50fDX0yb3NjNiFq/8jM7DTrlrvIPkdPdbKDXhSMnLf5u1k20ZR5/CoCmYnHl1D6qOiOl//cYzRGEuTPPh6mKZcOHrAZhoIj9ZAE/xo+Ysa/R8RDpzaN9ttAukPVAFll/87/lFGlePTZ4H9AO6HUXjGzp+FRlDpv+mN8nCY2dUbpNXHTHdtls6zRpDt8Bkxs2ocGbjTAgOS2tUH18VdEjKqrh5tlCknInbJvTXwPWQmfryS1W9VFe2Vys+8ew+Q5L4ltYFwKvq8XVMthHj3CZU6QJze2V9OSlIQgL05e9BduMxFeo7/4sBTs9YVBx0GHbwC8g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7585.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mjh5NGUrY2pyT0JVQVg1dHdVUjhkUU9ycWNKUE1qM3RCbjczTWJEWSt2RUZU?=
 =?utf-8?B?ZHozTXV1T2pzbEVGRnR0OU9VOFJNeWQ0Rm5kaVo4U2VYd3U4S1V0NWdTdHkv?=
 =?utf-8?B?WkQ5dFpiZzVkejdISzZ6YUNHcDNTbUZpNmhzdWpJTnhrSDdKdVRvMGlVby81?=
 =?utf-8?B?T2VRU3d2bklnTVMydVpCS3pMb2tiZFRWQU1mVWlpMHNYYTIrbzNJbHN1RkNp?=
 =?utf-8?B?MGRjUG43aDdzTTRyWUViQVc5eUg0V2xwK3dZL25nazZ5RUU5QVR3QjFXMXpH?=
 =?utf-8?B?bG5EaDFJUUREK0FlQU9ETXNyOGRoeFBmOW5hSU5MWVlEbTM0c1dGNDQ5RTFZ?=
 =?utf-8?B?MDFNY1pmVFBCb3VlVkgyb0Q1VDJlVXVDYlhpckk5V1gyL202emtsMitJbGxM?=
 =?utf-8?B?VmFuRjV1NzZZS2Fya1ZWaWFnTzVwZXdDOWtGNWxmaFBkWW9XaTF5dnliS3RR?=
 =?utf-8?B?cEcyUDBwUmdGQXFHTjJDeFBnZlAwNEtPQ21lcU40bExHdGtKYU5ER0NYS2lw?=
 =?utf-8?B?NU9ZQ2I4b2FCdVV2WkVTT2lKcUFXSDdMMmxoRWo1cVIvV0s5dXhEalhtaUVE?=
 =?utf-8?B?dWl2V2RVWGxmV1lmQWwvcHg5ZDR3bFF6emZhZFZZQmw0M3p4eGtyTGNsUWwy?=
 =?utf-8?B?YWJva2hPVDhkeEo5UnRXU1BNMDczS3FyRVBHb1IyUVdFRi94ZDJiS3JpUWZy?=
 =?utf-8?B?MkUxNlVYVjZWdHpNYWY2WUJVTGx2b1JJZERIOWJQWXJHaEpjQlRPUkphaFFH?=
 =?utf-8?B?WG5IemFOUjEwMGtSOTRqMzlvMU5tMTZobTcrY3g1Q3NtV3BjU29oY1VvZTFm?=
 =?utf-8?B?ZUxBRTZWbk1iVmVsazNrYTZzZnpBZTBNdEV0ajl6QTYyTllqYWgrWHlJOVE0?=
 =?utf-8?B?b0d4bUdSR05IaVFhU1BnWTI4dnJNU2NnTGVuVWtlVXFxWUZsd1g1Vm5DZkNh?=
 =?utf-8?B?RkxEc0hVMVpGeWhEdEdqbjB6bE9xMVRrU3ZDNS9OaFZRb1NqV0ZlT3BodGlr?=
 =?utf-8?B?L1V4dDNnMStqZGlCRG1hanVMZmZqa3FyVHFURUFiQWxzWEpFOEdPbkwwSnVm?=
 =?utf-8?B?S2NvdkNwWkpIK0h6ZDA2TXBKS21WTjM5VjREbCtkSHNtSy9MallMZS9xNjl4?=
 =?utf-8?B?MDlieUdhbnIveHZUanFkYUJ1VHk3VnVVVHNHS29VbU54YTdaQkRXbCtrZ2dM?=
 =?utf-8?B?VGZyOWw1RG51WG03K080R1RGcGRndnZldzVRV1RNSFM4Mm1oNXc3ZnFRMno5?=
 =?utf-8?B?dStUUEZTZmtOVmdKUERVU05mSTJDd3hZbXpmUVl1ZU43K0xoMEtmOXpWODNp?=
 =?utf-8?B?RHFJbmxNaDcwQm9ZbFByZTQxOW9QMEpyUzBSdVM1RldaVXNhNnM2TmUvQzBT?=
 =?utf-8?B?Y1ZKV3BmUnpBV0sydTY5QWdnNEptUkZhSU5MU1RDWFFoakliTG9FMEdUSFVL?=
 =?utf-8?B?YmVKUlZ1NjlPQ2h3UXBQSkpDck96K0EwR01XOTlKOVlzVnpoTGZBNU9MRFY4?=
 =?utf-8?B?bUVsSys4S2NXV0tTUDRLRWpoeEZSYU4wVytzQVIyWHNKa0ExYUVnbElKdWRO?=
 =?utf-8?B?VUt4c0VwbWtaVVR0L1lucmd0Mkhtdm9NSXJRUU9xNVFqT1d4OHVTRjI5RG9m?=
 =?utf-8?B?WGg4Mk82R09FazN4UGpNMmlHakJOeU5TbVEvTzlCQ0lBS0pEbGRpWHVTalBp?=
 =?utf-8?B?bno0NlBZK0w2MGtpVFFydEo4cGxMSklEZzAxR01lMmkxVm03dExsOExkdytx?=
 =?utf-8?B?ZUtXeExPS0VTcnJiRElQOTQ2NGozVU5McGIzMDlyYUo1ZHpGdlk4TXRqNFpL?=
 =?utf-8?B?NUFwSmxKWm4vcTBRUlQ4R1ZHWTE1OHBvZnArTGZEQUg0a0o3a1lzRXJyWVJ4?=
 =?utf-8?B?QzJSVURpSGRSSTdNMEliU2x4TFMxdDVRemRrcTMzL3krZ1Z2QzdCdXUrTGVC?=
 =?utf-8?B?STNSM2V4Y0ZCalY2ZlVoWWpaaXpoQUtyUzVaWktiNE82WTVOelRXNG1XMWpu?=
 =?utf-8?B?b21GUnpWbDdsU2paeVF4cU5mSk03enhaOW1menNJdXQ4UFVyRXF4VCtGcGc2?=
 =?utf-8?B?YUFaTkR0UGxUaGdKZVNhTVBLaWhSemhvSXVJU3g1RVI3VVBXQkJmdzRQTHdL?=
 =?utf-8?Q?5HXk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7585.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4bc008-33e9-4773-a3fd-08dc3dc1f146
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2024 09:43:56.5186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6+iWQyiDgeK4Cz2i7AVCKZgne6pBqcV/m6dqzJxJXrrofdCjYgLKmneyrcQCQVcXZa1mERVqhJd4z5in4KSFoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8163
X-OriginatorOrg: intel.com

SGkgTHVpeiwNCg0KVGhhbmtzIGZvciB0aGUgY29tbWVudHMuDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogTHVpeiBBdWd1c3RvIHZvbiBEZW50eiA8bHVpei5kZW50ekBn
bWFpbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTWFyY2ggNiwgMjAyNCAzOjU3IEFNDQo+IFRv
OiBLLCBLaXJhbiA8a2lyYW4ua0BpbnRlbC5jb20+DQo+IENjOiBsaW51eC1ibHVldG9vdGhAdmdl
ci5rZXJuZWwub3JnOyBTcml2YXRzYSwgUmF2aXNoYW5rYXINCj4gPHJhdmlzaGFua2FyLnNyaXZh
dHNhQGludGVsLmNvbT47IFR1bWt1ciBOYXJheWFuLCBDaGV0aGFuDQo+IDxjaGV0aGFuLnR1bWt1
ci5uYXJheWFuQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAyLzJdIEJsdWV0
b290aDogYnRpbnRlbDogQWRkIHN1cHBvcnQgZm9yIGRvd25sb2FkaW5nDQo+IGludGVybWVkaWF0
ZSBsb2FkZXINCj4gDQo+IEhpIEtpcmFuLA0KPiANCj4gT24gVHVlLCBNYXIgNSwgMjAyNCBhdCA5
OjMx4oCvQU0gS2lyYW4gSyA8a2lyYW4ua0BpbnRlbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gU29t
ZSB2YXJpYW50cyBvZiBJbnRlbCBjb250cm9sbGVycyBsaWtlIEJsYXphckkgc3VwcG9ydHMgZG93
bmxvYWRpbmcNCj4gPiBvZiBJbnRlcm1lZGlhdGUgYm9vdGxvYWRlciAoSU1MKSBpbWFnZS4gSU1M
IGdpdmVzIGZsZXhpYmlsaXR5IHRvIGZpeA0KPiA+IGlzc3VlcyBhcyBpdHMgbm90IHBvc3NpYmxl
IHRvIGZpeCBpc3N1ZSBpbiBQcmltYXJ5IGJvb3Rsb2FkZXIgb25jZQ0KPiA+IGZsYXNoZWQgdG8g
Uk9NLiBUaGlzIHBhdGNoIGFkZHMgdGhlIHN1cHBvcnQgdG8gZG93bmxvYWQgSU1MIGJlZm9yZQ0K
PiBkb3dubG9hZGluZyBvcGVyYXRpb25hbCBmaXJtd2FyZSBpbWFnZS4NCj4gPg0KPiA+IGRtZXNn
IGxvZ3M6DQo+ID4gWzEzLjM5OTAwM10gQmx1ZXRvb3RoOiBDb3JlIHZlciAyLjIyDQo+ID4gWzEz
LjM5OTAwNl0gQmx1ZXRvb3RoOiBTdGFydGluZyBzZWxmIHRlc3RpbmcgWzEzLjQwMTE5NF0gQmx1
ZXRvb3RoOg0KPiA+IEVDREggdGVzdCBwYXNzZWQgaW4gMjEzNSB1c2VjcyBbMTMuNDIxMTc1XSBC
bHVldG9vdGg6IFNNUCB0ZXN0IHBhc3NlZA0KPiA+IGluIDU5NyB1c2VjcyBbMTMuNDIxMTg0XSBC
bHVldG9vdGg6IEZpbmlzaGVkIHNlbGYgdGVzdGluZyBbMTMuNDIyOTE5XQ0KPiA+IEJsdWV0b290
aDogSENJIGRldmljZSBhbmQgY29ubmVjdGlvbiBtYW5hZ2VyIGluaXRpYWxpemVkIFsxMy40MjI5
MjNdDQo+ID4gQmx1ZXRvb3RoOiBIQ0kgc29ja2V0IGxheWVyIGluaXRpYWxpemVkIFsxMy40MjI5
MjVdIEJsdWV0b290aDogTDJDQVANCj4gPiBzb2NrZXQgbGF5ZXIgaW5pdGlhbGl6ZWQgWzEzLjQy
MjkzMF0gQmx1ZXRvb3RoOiBTQ08gc29ja2V0IGxheWVyDQo+ID4gaW5pdGlhbGl6ZWQgWzEzLjQ1
ODA2NV0gQmx1ZXRvb3RoOiBoY2kwOiBEZXZpY2UgcmV2aXNpb24gaXMgMA0KPiA+IFsxMy40NTgw
NzFdIEJsdWV0b290aDogaGNpMDogU2VjdXJlIGJvb3QgaXMgZGlzYWJsZWQgWzEzLjQ1ODA3Ml0N
Cj4gPiBCbHVldG9vdGg6IGhjaTA6IE9UUCBsb2NrIGlzIGRpc2FibGVkIFsxMy40NTgwNzJdIEJs
dWV0b290aDogaGNpMDogQVBJDQo+ID4gbG9jayBpcyBlbmFibGVkIFsxMy40NTgwNzNdIEJsdWV0
b290aDogaGNpMDogRGVidWcgbG9jayBpcyBkaXNhYmxlZA0KPiA+IFsxMy40NTgwNzNdIEJsdWV0
b290aDogaGNpMDogTWluaW11bSBmaXJtd2FyZSBidWlsZCAxIHdlZWsgMTAgMjAxNA0KPiA+IFsx
My40NTgwNzVdIEJsdWV0b290aDogaGNpMDogQm9vdGxvYWRlciB0aW1lc3RhbXAgMjAyMi40NiBi
dWlsZHR5cGUgMQ0KPiA+IGJ1aWxkIDI2NTkwIFsxMy40NTgzMjRdIEJsdWV0b290aDogaGNpMDog
RFNNIHJlc2V0IG1ldGhvZCB0eXBlOiAweDAwDQo+ID4gWzEzLjQ2MDY3OF0gQmx1ZXRvb3RoOiBo
Y2kwOiBGb3VuZCBkZXZpY2UgZmlybXdhcmU6DQo+ID4gaW50ZWwvaWJ0LTAwOTAtMDI5MS1pbWwu
c2ZpIFsxMy40NjA2ODRdIEJsdWV0b290aDogaGNpMDogQm9vdCBBZGRyZXNzOg0KPiA+IDB4MzAw
OTkwMDAgWzEzLjQ2MDY4NV0gQmx1ZXRvb3RoOiBoY2kwOiBGaXJtd2FyZSBWZXJzaW9uOiAyMjct
MTEuMjQNCj4gPiBbMTMuNTYyNTU0XSBCbHVldG9vdGg6IGhjaTA6IFdhaXRpbmcgZm9yIGZpcm13
YXJlIGRvd25sb2FkIHRvIGNvbXBsZXRlDQo+ID4gWzEzLjU2MzAyM10gQmx1ZXRvb3RoOiBoY2kw
OiBGaXJtd2FyZSBsb2FkZWQgaW4gOTk5NDEgdXNlY3MNCj4gPiBbMTMuNTYzMDU3XSBCbHVldG9v
dGg6IGhjaTA6IFdhaXRpbmcgZm9yIGRldmljZSB0byBib290IFsxMy41NjUwMjldDQo+ID4gQmx1
ZXRvb3RoOiBoY2kwOiBNYWxmb3JtZWQgTVNGVCB2ZW5kb3IgZXZlbnQ6IDB4MDIgWzEzLjU2NTE0
OF0NCj4gPiBCbHVldG9vdGg6IGhjaTA6IERldmljZSBib290ZWQgaW4gMjA2NCB1c2VjcyBbMTMu
NTY3MDY1XSBCbHVldG9vdGg6DQo+ID4gaGNpMDogTm8gZGV2aWNlIGFkZHJlc3MgY29uZmlndXJl
ZCBbMTMuNTY5MDEwXSBCbHVldG9vdGg6IGhjaTA6IEZvdW5kDQo+ID4gZGV2aWNlIGZpcm13YXJl
OiBpbnRlbC9pYnQtMDA5MC0wMjkxLnNmaSBbMTMuNTY5MDYxXSBCbHVldG9vdGg6IGhjaTA6DQo+
ID4gQm9vdCBBZGRyZXNzOiAweDEwMDAwODAwIFsxMy41NjkwNjJdIEJsdWV0b290aDogaGNpMDog
RmlybXdhcmUNCj4gPiBWZXJzaW9uOiAyMjctMTEuMjQgWzEzLjc4ODg5MV0gQmx1ZXRvb3RoOiBC
TkVQIChFdGhlcm5ldCBFbXVsYXRpb24pDQo+ID4gdmVyIDEuMyBbMTMuNzg4ODk3XSBCbHVldG9v
dGg6IEJORVAgZmlsdGVyczogcHJvdG9jb2wgbXVsdGljYXN0DQo+ID4gWzEzLjc4ODkwMl0gQmx1
ZXRvb3RoOiBCTkVQIHNvY2tldCBsYXllciBpbml0aWFsaXplZCBbMTUuNDM1OTA1XQ0KPiA+IEJs
dWV0b290aDogaGNpMDogV2FpdGluZyBmb3IgZmlybXdhcmUgZG93bmxvYWQgdG8gY29tcGxldGUg
WzE1LjQzNjAxNl0NCj4gPiBCbHVldG9vdGg6IGhjaTA6IEZpcm13YXJlIGxvYWRlZCBpbiAxODIz
MjMzIHVzZWNzIFsxNS40MzYyNThdDQo+ID4gQmx1ZXRvb3RoOiBoY2kwOiBXYWl0aW5nIGZvciBk
ZXZpY2UgdG8gYm9vdCBbMTUuNDcxMTQwXSBCbHVldG9vdGg6DQo+ID4gaGNpMDogRGV2aWNlIGJv
b3RlZCBpbiAzNDI3NyB1c2VjcyBbMTUuNDcxMjAxXSBCbHVldG9vdGg6IGhjaTA6DQo+ID4gTWFs
Zm9ybWVkIE1TRlQgdmVuZG9yIGV2ZW50OiAweDAyIFsxNS40NzE0ODddIEJsdWV0b290aDogaGNp
MDogRm91bmQNCj4gPiBJbnRlbCBEREMgcGFyYW1ldGVyczogaW50ZWwvaWJ0LTAwOTAtMDI5MS5k
ZGMgWzE1LjQ3NDM1M10gQmx1ZXRvb3RoOg0KPiA+IGhjaTA6IEFwcGx5aW5nIEludGVsIEREQyBw
YXJhbWV0ZXJzIGNvbXBsZXRlZCBbMTUuNDc0NDg2XSBCbHVldG9vdGg6DQo+ID4gaGNpMDogRm91
bmQgSW50ZWwgRERDIHBhcmFtZXRlcnM6IGludGVsL2JkYWRkcmVzcy5jZmcgWzE1LjQ3NTI5OV0N
Cj4gPiBCbHVldG9vdGg6IGhjaTA6IEFwcGx5aW5nIEludGVsIEREQyBwYXJhbWV0ZXJzIGNvbXBs
ZXRlZCBbMTUuNDc5MzgxXQ0KPiA+IEJsdWV0b290aDogaGNpMDogRmlybXdhcmUgdGltZXN0YW1w
IDIwMjQuMTAgYnVpbGR0eXBlIDMgYnVpbGQgNTg1OTUNCj4gPiBbMTUuNDc5Mzg1XSBCbHVldG9v
dGg6IGhjaTA6IEZpcm13YXJlIFNIQTE6IDB4YjRmM2NjNDYgWzE1LjQ4MzI0M10NCj4gPiBCbHVl
dG9vdGg6IGhjaTA6IEZzZXEgc3RhdHVzOiBTdWNjZXNzICgweDAwKSBbMTUuNDgzMjQ2XSBCbHVl
dG9vdGg6DQo+ID4gaGNpMDogRnNlcSBleGVjdXRlZDogMDAuMDAuMDAuMDAgWzE1LjQ4MzI0N10g
Qmx1ZXRvb3RoOiBoY2kwOiBGc2VxIEJUDQo+ID4gVG9wOiAwMC4wMC4wMC4wMCBbMTUuNTc4NzEy
XSBCbHVldG9vdGg6IE1HTVQgdmVyIDEuMjIgWzE1LjgyMjY4Ml0NCj4gPiBCbHVldG9vdGg6IFJG
Q09NTSBUVFkgbGF5ZXIgaW5pdGlhbGl6ZWQgWzE1LjgyMjY5MF0gQmx1ZXRvb3RoOiBSRkNPTU0N
Cj4gPiBzb2NrZXQgbGF5ZXIgaW5pdGlhbGl6ZWQgWzE1LjgyMjY5NV0gQmx1ZXRvb3RoOiBSRkNP
TU0gdmVyIDEuMTENCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEtpcmFuIEsgPGtpcmFuLmtAaW50
ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2JsdWV0b290aC9idGludGVsLmMgfCAzOA0K
PiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gPiAgZHJpdmVycy9i
bHVldG9vdGgvYnRpbnRlbC5oIHwgIDMgKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNDAgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Ymx1ZXRvb3RoL2J0aW50ZWwuYyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0aW50ZWwuYw0KPiA+IGlu
ZGV4IGVkOThiYjg2N2NmZi4uMDBlOTg2MDZjZjAyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Ymx1ZXRvb3RoL2J0aW50ZWwuYw0KPiA+ICsrKyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0aW50ZWwu
Yw0KPiA+IEBAIC01MjEsNiArNTIxLDkgQEAgc3RhdGljIGludCBidGludGVsX3ZlcnNpb25faW5m
b190bHYoc3RydWN0IGhjaV9kZXYNCj4gKmhkZXYsDQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHZlcnNpb24tPm1pbl9md19idWlsZF9ubiwgdmVyc2lvbi0+bWluX2Z3X2J1aWxkX2N3
LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAyMDAwICsgdmVyc2lvbi0+bWluX2Z3
X2J1aWxkX3l5KTsNCj4gPiAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICBjYXNl
IElNR19JTUw6DQo+ID4gKyAgICAgICAgICAgICAgIHZhcmlhbnQgPSAiSW50ZXJtZWRpYXRlIGxv
YWRlciI7DQo+ID4gKyAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICAgICAgICAgY2FzZSBJTUdf
T1A6DQo+ID4gICAgICAgICAgICAgICAgIHZhcmlhbnQgPSAiRmlybXdhcmUiOw0KPiA+ICAgICAg
ICAgICAgICAgICBicmVhazsNCj4gPiBAQCAtMjE5NCwxMCArMjE5NywyNiBAQCBzdGF0aWMgdm9p
ZCBidGludGVsX2dldF9md19uYW1lX3Rsdihjb25zdA0KPiBzdHJ1Y3QgaW50ZWxfdmVyc2lvbl90
bHYgKnZlciwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjaGFyICpm
d19uYW1lLCBzaXplX3QgbGVuLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IGNoYXIgKnN1ZmZpeCkgIHsNCj4gPiArICAgICAgIGNvbnN0IGNoYXIgKmZvcm1h
dDsNCj4gPiAgICAgICAgIC8qIFRoZSBmaXJtd2FyZSBmaWxlIG5hbWUgZm9yIG5ldyBnZW5lcmF0
aW9uIGNvbnRyb2xsZXJzIHdpbGwgYmUNCj4gPiAgICAgICAgICAqIGlidC08Y252aV90b3AgdHlw
ZStjbnZpX3RvcCBzdGVwPi08Y252cl90b3AgdHlwZStjbnZyX3RvcCBzdGVwPg0KPiA+ICAgICAg
ICAgICovDQo+ID4gLSAgICAgICBzbnByaW50Zihmd19uYW1lLCBsZW4sICJpbnRlbC9pYnQtJTA0
eC0lMDR4LiVzIiwNCj4gPiArICAgICAgIHN3aXRjaCAodmVyLT5jbnZpX3RvcCAmIDB4ZmZmKSB7
DQo+ID4gKyAgICAgICAvKiBPbmx5IEJsYXphciAgcHJvZHVjdCBzdXBwb3J0cyBkb3dubG9hZGlu
ZyBvZiBpbnRlcm1lZGlhdGUgbG9hZGVyDQo+ID4gKyAgICAgICAgKiBpbWFnZQ0KPiA+ICsgICAg
ICAgICovDQo+ID4gKyAgICAgICBjYXNlIENOVklfQkxBWkFSSToNCj4gPiArICAgICAgICAgICAg
ICAgaWYgKHZlci0+aW1nX3R5cGUgPT0gSU1HX0JPT1RMT0FERVIpDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgZm9ybWF0ID0gImludGVsL2lidC0lMDR4LSUwNHgtaW1sLiVzIjsNCj4gDQo+
IFNob3VsZG4ndCBpbWwgYmUgdGhlIGV4dGVuc2lvbiByYXRoZXIgdGhhbiB0aGUgbmFtZT8gTGlr
ZSBpbiBpbnRlbC9pYnQtMDA5MC0NCj4gMDI5MS5pbWwgd2hpY2ggeW91IGNhbiBwcm9iYWJseSBh
Y2hpZXZlIGJ5IGp1c3QgcmVwbGFjaW5nIHN1ZmZpeCwgdGhhdCBzYWlkIHRoaXMNCj4gZnVuY3Rp
b24gc2VlbXMgdG8gYmUgY2FsbGVkIHdpdGggLmRkYyBhcyBzdWZmaXggYXMgd2VsbCBzbyBJIGFz
c3VtZSB0aGVyZSBpcw0KDQpJIGZlZWwgaXQncyBiZXR0ZXIgdG8ga2VlcCB0aGUgZXh0ZW5zaW9u
IGFzIHNmaSAgYXMgdGhlIGltYWdlIGZvcm1hdCBmb3IgSU1MIGFuZCBPUCBiaW5hcmllcyBhcmUg
c2FtZS4NCg0KPiBzb21lIGNoZWNrIHByZXZlbnRpbmcgaXQgdG8gYmUgY2FsbGVkIHdoaWxlIHZl
cnNpb24gaXMgSU1HX0JPT1RMT0FERVI/DQpUaGVyZSBpcyBubyBzdWNoIHJlc3RyaWN0aW9uLiBU
aGUgc2FtZSBmdW5jdGlvbiBnZXRzIGNhbGxlZCBldmVuIHdoZW4gdmVyc2lvbiBpcyBJTUdfQk9P
VExPQURFUi4gSW5zaWRlIHRoaXMgZnVuY3Rpb24gd2UgY2hlY2sgZm9yIHByb2R1Y3QgYW5kIHZl
cnNpb24gdG8gZGVjaWRlIHdoZXRoZXIgdG8gbG9hZCBJTUwgb3IgT1AgaW1hZ2UuDQo+IA0KPiA+
ICsgICAgICAgICAgICAgICBlbHNlDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZm9ybWF0
ID0gImludGVsL2lidC0lMDR4LSUwNHguJXMiOw0KPiA+ICsgICAgICAgICAgICAgICBicmVhazsN
Cj4gPiArICAgICAgIGRlZmF1bHQ6DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZm9ybWF0
ID0gImludGVsL2lidC0lMDR4LSUwNHguJXMiOw0KPiA+ICsgICAgICAgICAgICAgICBicmVhazsN
Cj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICBzbnByaW50Zihmd19uYW1lLCBsZW4s
IGZvcm1hdCwNCj4gPiAgICAgICAgICAgICAgICAgIElOVEVMX0NOVlhfVE9QX1BBQ0tfU1dBQihJ
TlRFTF9DTlZYX1RPUF9UWVBFKHZlci0NCj4gPmNudmlfdG9wKSwNCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJTlRFTF9DTlZYX1RPUF9TVEVQKHZlci0+Y252
aV90b3ApKSwNCj4gPg0KPiA+IElOVEVMX0NOVlhfVE9QX1BBQ0tfU1dBQihJTlRFTF9DTlZYX1RP
UF9UWVBFKHZlci0+Y252cl90b3ApLA0KPiA+IEBAIC0yNjA3LDYgKzI2MjYsMjMgQEAgc3RhdGlj
IGludCBidGludGVsX2Jvb3Rsb2FkZXJfc2V0dXBfdGx2KHN0cnVjdA0KPiBoY2lfZGV2ICpoZGV2
LA0KPiA+ICAgICAgICAgaWYgKGVycikNCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIGVycjsN
Cj4gPg0KPiA+ICsgICAgICAgZXJyID0gYnRpbnRlbF9yZWFkX3ZlcnNpb25fdGx2KGhkZXYsIHZl
cik7DQo+ID4gKyAgICAgICBpZiAoZXJyKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gZXJy
Ow0KPiA+ICsNCj4gPiArICAgICAgIC8qIElmIGltYWdlIHR5cGUgcmV0dXJuZWQgaXMgSU1HX0lN
TCwgdGhlbiBjb250cm9sbGVyIHN1cHBvcnRzDQo+ID4gKyAgICAgICAgKiBpbnRlcm1lZGlhZSBs
b2FkZXIgaW1hZ2UNCj4gPiArICAgICAgICAqLw0KPiA+ICsgICAgICAgaWYgKHZlci0+aW1nX3R5
cGUgPT0gSU1HX0lNTCkgew0KPiA+ICsgICAgICAgICAgICAgICBlcnIgPSBidGludGVsX3ByZXBh
cmVfZndfZG93bmxvYWRfdGx2KGhkZXYsIHZlciwgJmJvb3RfcGFyYW0pOw0KPiA+ICsgICAgICAg
ICAgICAgICBpZiAoZXJyKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBlcnI7
DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBlcnIgPSBidGludGVsX2Jvb3QoaGRldiwgYm9v
dF9wYXJhbSk7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChlcnIpDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIGVycjsNCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gICAgICAg
ICBidGludGVsX2NsZWFyX2ZsYWcoaGRldiwgSU5URUxfQk9PVExPQURFUik7DQo+ID4NCj4gPiAg
ICAgICAgIGJ0aW50ZWxfZ2V0X2Z3X25hbWVfdGx2KHZlciwgZGRjbmFtZSwgc2l6ZW9mKGRkY25h
bWUpLCAiZGRjIik7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0aW50ZWwu
aCBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0aW50ZWwuaA0KPiA+IGluZGV4IDUyYjJmMTk4NmY4NS4u
YWUxNWIyMjUzYjZkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0aW50ZWwu
aA0KPiA+ICsrKyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0aW50ZWwuaA0KPiA+IEBAIC01MSw3ICs1
MSwxMCBAQCBzdHJ1Y3QgaW50ZWxfdGx2IHsNCj4gPiAgICAgICAgIHU4IHZhbFtdOw0KPiA+ICB9
IF9fcGFja2VkOw0KPiA+DQo+ID4gKyNkZWZpbmUgQ05WSV9CTEFaQVJJICAgICAgICAgICAweDkw
MA0KPiA+ICsNCj4gPiAgI2RlZmluZSBJTUdfQk9PVExPQURFUiAgICAgICAgIDB4MDEgICAgLyog
Qm9vdGxvYWRlciBpbWFnZSAqLw0KPiA+ICsjZGVmaW5lIElNR19JTUwgICAgICAgICAgICAgICAg
ICAgICAgICAweDAyICAgIC8qIEludGVybWVkaWF0ZSBpbWFnZSAqLw0KPiA+ICAjZGVmaW5lIElN
R19PUCAgICAgICAgICAgICAgICAgMHgwMyAgICAvKiBPcGVyYXRpb25hbCBpbWFnZSAqLw0KPiA+
DQo+ID4gIHN0cnVjdCBpbnRlbF92ZXJzaW9uX3RsdiB7DQo+ID4gLS0NCj4gPiAyLjM0LjENCj4g
Pg0KPiA+DQo+IA0KPiANCj4gLS0NCj4gTHVpeiBBdWd1c3RvIHZvbiBEZW50eg0KDQpSZWdhcmRz
LA0KS2lyYW4NCg0K

