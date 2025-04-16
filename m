Return-Path: <linux-bluetooth+bounces-11662-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9373CA880DE
	for <lists+linux-bluetooth@lfdr.de>; Mon, 14 Apr 2025 14:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90E7117721D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 14 Apr 2025 12:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30AFF2BD5B5;
	Mon, 14 Apr 2025 12:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmIl+ZI+"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369D5D528
	for <linux-bluetooth@vger.kernel.org>; Mon, 14 Apr 2025 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744635278; cv=fail; b=W1F+5iorwkUd8r0D++lRTWGk+9QshddWtU5dZBTGWuUV5anROKCYztcHNBSvwLkoDcdk2dAA5EVdrtzG7BbaAkgjYdrf90MAq4xR0NlNV7cMmJyYzodDm4zH9Ra7jybBv+ZEyKE/mQHvZekuwmQo1Z/XVT2zfCsbr3GAqyFihaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744635278; c=relaxed/simple;
	bh=EXD0WLwq0p8zRk9Z7kJzwSv9PG1Yot0YaWfwV3ECFHw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PWQ6QA69mMaki0ju4dJACr2Glp31lWdWCP3Uzb02kwRLySegChAsUkZ2Hy2HdyGwMM+8d91BKvhN47/YHeacfVEGZY4BKrJDK2njaEW/Rwn5On0Be33KjSHSOo2jkV9CLe9PavYaDCnS4bbBbbYsWcpNsteeBHDHbwvwfvekfXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmIl+ZI+; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744635277; x=1776171277;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EXD0WLwq0p8zRk9Z7kJzwSv9PG1Yot0YaWfwV3ECFHw=;
  b=XmIl+ZI+44mriX9NnTySxIqsRdQw4JRHRhtJRSaMpBf7OHw3IlrIXQBz
   LahSsIe0nuRWBoXoWQBuhiOfoiInvfLMKstVrvoaj7UbpdUbFcfnkruJ8
   KItGPKNy0trV8pjy5j6Wn+63zRFBcG/xnr41ZTHbickcVzLAPJhpeuVh3
   RlawaRHONTbowXM+gukFlLsbFuV/4N67rcruRFEkL+o8qlXWLmAgrHZjS
   jI+0pFUYP8umF6dCMx74vJeHk5txjM9hgdp2d/VJYXZ3HIKDc9/quQYH3
   XblJtxL+IDzM0mja2JIbmEqfRyDqnKxBvD2UcxQ9rJEqu1QqXCqrFrPxO
   A==;
X-CSE-ConnectionGUID: mcWYv58+RIOSy2HCdaYaTw==
X-CSE-MsgGUID: VyyLw3JTQjaXgoC5v70c+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="57467689"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="57467689"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 05:54:35 -0700
X-CSE-ConnectionGUID: sRiAdsJDTEaXJY1sHQOMmw==
X-CSE-MsgGUID: Mk3+qhJ9S1aI2QKZLtW/aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134649170"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 05:54:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 05:54:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 05:54:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 05:54:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EkDX1A09oeiinDs3tvJffWrno/VlSU08Uf2a83feRKKqpMW2BZCR9i9U2HQXVx90RSG3lH1nCvfQbeztFgZND43XQUlAgLIptmu0Ozq93h4n3EfJlpLIQHWUpunsssTCcgAqzvbfixlMG7JVg0qm0NLkII7aeh+yTSlf1NpHUFgcnO1dB6k7Tdd//M2DFCqBsaDkNxa/Co01W8iUmvceYDUrzUIzqf8wMAOBNDMv49igc9IRxBth7VLb+c4FJCD+/s5e+janBej8mvPRWam2IC6oeaVxdhGWokbk0UHR/QtjhdGesVp80oCy5FcjL7C7eqyGtjeB2zC5m3dMSvPSpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXD0WLwq0p8zRk9Z7kJzwSv9PG1Yot0YaWfwV3ECFHw=;
 b=ueQD9wFE11N2w++zOcLLDFABUfH7779wD3OK7wdACDTiu8MRqnl9KiJp59lV/X0q2BAcBvvb0YknIJ3nBSlPTv/Ubs+fArO8QHhUmH/fQXHueZKfuZLCr1gQg62WCjNG8UPN/uqe03IqSkTHEgJ9JBdz6dF9A6IfAwWmBDBxOQlGbAkIFUzMFp7vqyCMl2kbjqIuS37lLWi1ruHM+fEmOjjWX8yA4LOFUoOHc6XOHD09E5vw+i9fZv3ntPMmciWqca8QMgpfkGA6r/5XvCgX7hpXoF/q0poXLzu1MAm+HdoJQ+Q3wWCn7EWNH4BBnxOVDCKhXB9RIOfdRvCP4KU+4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB7585.namprd11.prod.outlook.com (2603:10b6:510:28f::10)
 by PH7PR11MB8551.namprd11.prod.outlook.com (2603:10b6:510:30d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 12:53:49 +0000
Received: from PH0PR11MB7585.namprd11.prod.outlook.com
 ([fe80::9ba4:34:81ac:5010]) by PH0PR11MB7585.namprd11.prod.outlook.com
 ([fe80::9ba4:34:81ac:5010%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 12:53:49 +0000
From: "K, Kiran" <kiran.k@intel.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
CC: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
	"Srivatsa, Ravishankar" <ravishankar.srivatsa@intel.com>, "Tumkur Narayan,
 Chethan" <chethan.tumkur.narayan@intel.com>, "Devegowda, Chandrashekar"
	<chandrashekar.devegowda@intel.com>, "Satija, Vijay" <vijay.satija@intel.com>
Subject: RE: [PATCH v1] Bluetooth: btintel_pcie: Avoid redundant buffer
 allocation
Thread-Topic: [PATCH v1] Bluetooth: btintel_pcie: Avoid redundant buffer
 allocation
Thread-Index: AQHbo3OQL748+KXB0E2ylEIewHhgSrOQ3M8AgBJUEOA=
Date: Mon, 14 Apr 2025 12:53:49 +0000
Message-ID: <PH0PR11MB75856A5E09F6F388146F4A13F5B32@PH0PR11MB7585.namprd11.prod.outlook.com>
References: <20250402022054.64501-1-kiran.k@intel.com>
 <CABBYNZ+p+_M7396tqo16ORDdBf38wQFRckBG4ZanXUoCQZCoRQ@mail.gmail.com>
In-Reply-To: <CABBYNZ+p+_M7396tqo16ORDdBf38wQFRckBG4ZanXUoCQZCoRQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7585:EE_|PH7PR11MB8551:EE_
x-ms-office365-filtering-correlation-id: 55e35b69-915f-4cef-ac20-08dd7b5366a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OWJJU1FYaVExSnZoYzRFeG1NMWdEZVRJWDVUVk9uT0FJZGwvT2ovc3NVSEI3?=
 =?utf-8?B?Z3pSL0M3VEx3d24raVNoNDNnSS80NFYyeEdPRjJsSHgzS0U0RzQzM2NidEp1?=
 =?utf-8?B?VGdjTVlKZlRhbTJ1VUY1ZDVEZUlJc0FxQnEzd0xTdW5HWE5MZUUzTGs5b2sx?=
 =?utf-8?B?QXRYc0twQVJ3RXhEQXBPWGE5SzZjUkdtU21mVUhjS3dqUmZEVFk1RVI3Ry9W?=
 =?utf-8?B?YXErWlNLc2ZCalBGNEVoNVFJTjUxeGhrNGFDdVJPV3JEU0FINTVDY2ZYODEv?=
 =?utf-8?B?U0QvWUVzdEIraXZJL3NEZ0lVQkJhUXQxU1c2ZjUySjMrSjBDclFUanRSSDA5?=
 =?utf-8?B?WWxrUEN5aGZpdEI1SU1rMXJiU2JvNmhyd3haQnVCYUZpdmtBRG5CSGgwN05y?=
 =?utf-8?B?UmVCa09mTVRhdkYvQTRDRmp3RGpvL0FmSmR0THlmWmNTcXdDaXVRbFQzUTNv?=
 =?utf-8?B?RzdNZytkYVpjRGtuMVVXRElmWFB5d2VUVzdLTHY0RlJKZTBOUjdhVWJzbUJo?=
 =?utf-8?B?eERIT2VEWjhUK2NzMzhOVUNaaWgxMC8rZ0F6Y1p3RlEyZWgzTk1jNXloZWlG?=
 =?utf-8?B?bFc3bUk2bHp3OENSK0QwdlUwUDhoVnpUMnREVE9NUyt5cXlNS2o5dnUzZTcx?=
 =?utf-8?B?OUlyaVhIYUVxQTJkWVV5ZnluWmRsTjR4blNhOWk5aWNGWFpDZ2lzcUJwN3RQ?=
 =?utf-8?B?WlpWZmtEYkg5bXlmNmtoT3M1dXJ4SkR2VjBpaVg4ci9UUWZzSzFrY005czFF?=
 =?utf-8?B?ZGI4TDc3aGNJeWtKSWRDWkwvdEtodnJzMmpsUVdSK0ZySy9PVFBMaHFpU2Vv?=
 =?utf-8?B?UFVrUUYva2trWUR0NmpER0xNN3l4ZE9vd0w5dHFYMDhGSWZJQ05HOFFGV0V4?=
 =?utf-8?B?aTk2YWpvOWFZWDR0dDlRYWNHMitKWEhTaExMcUNpNkFOMWYyb3FHbjlpUnZa?=
 =?utf-8?B?ZkIzaHRtN0p2SkdmVkdyc0Z5YjRWb0lwWnhIWlQvNFh3dlBSR2tjTWlFNmFv?=
 =?utf-8?B?MkFQNk5XWFlWL0FPY2dha0VFeUZkaDQ4K1B6aWIvbFBrZjBzbklteTc0RGNX?=
 =?utf-8?B?SG9lZ2NYSE1JVVJEK29Kc0JZOUZKQTF0MjcrS2NWWGFhenJrR0tsY01na2Vt?=
 =?utf-8?B?dlZZeXEySWZPKzlSVXJacnNWR1dkRllGRXpybDZMeGsrWDNlaXhtU29RTFls?=
 =?utf-8?B?ekxNcnkxNFBIWUJyYXF3N3hEcVI1NG9EdXM0YXhSK3lLdkhKQXhRRXd2dnps?=
 =?utf-8?B?NlRvNUNHZWtzWDBKSytOZVJWL2JIMksvbk9hTGhIckZ4YWZCODZpYUREUTlX?=
 =?utf-8?B?WnFEaUVCVlVDK3lyazJBZ1oxWStLNWNBOWJMY0NZSy81UDE1di9obnBDOTdK?=
 =?utf-8?B?M0dpOGJuM013WFRxelJHRGFNNWwySFhBMXZjM2dJMHpQMXV3cWVOd1VGWi85?=
 =?utf-8?B?dDNtc05QZ252d1VuaTZDZmN1ZDhsRDN4U2p5cmhLSXIwSUlKS25xdTRmUi8y?=
 =?utf-8?B?VEwvN3FQVnVjaGl0R29nZ2orZ000YkpzdVhtbUlWd0dZMUVxOWZyOFBTUFNT?=
 =?utf-8?B?QXFnUkRVMGdIV1BhRkorSHNzczBBNjRRWHNVMUN4UEVZUnJEYXhkeXBKMGF3?=
 =?utf-8?B?VENqeWQySkxNazBmVlljYTdWL1psQkRrR09IT2UzcnVsb3dqbG5wREJsVmFn?=
 =?utf-8?B?RUE2dThLaHJMMWFBNWoxRGFIeUY1a3V1aHU4SVIyelArTDVHa1dwbmNicmxn?=
 =?utf-8?B?YXZLY25PZHg5aXpyWjdnQjJtWUgyQ3ZWcFlzY09zK2ZDV3R2STdZZ1NqMElK?=
 =?utf-8?B?NkpxOWtvMGxhMU1rdTNMd0YzbElmN3lBZUM4VkpiVU1PV25tTVgwQkREOW83?=
 =?utf-8?B?RkhSMVBjYnlORTBQV21jWFlZR0plQnowTEtuWm43SWUza2xkeWpTM3o5WmYv?=
 =?utf-8?B?Qy9UcG84KzEzT1hNSHMwcHhRcnZDd1IvK1M0K0tLV082cWlFemxJa0R0Tnhs?=
 =?utf-8?B?NGVVbnVvbzFRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7585.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEl3SmtrNkdXeklwQTJkYVNiOWFDUS9qQXZCWk9NNjZsbWxBUE1vcUJNcjZR?=
 =?utf-8?B?K3BpOEdXVGMyNTFBdlRXVk83YTgyV3pMeVpMUHo2RE4wZXBUNjc4T3dRdml5?=
 =?utf-8?B?VWJlRnJDRFEzcUxvTkZ1K2JEWUtTNDVOL04vL2JpUWpWNVJ0WEJFMHVTdXpW?=
 =?utf-8?B?R1ZBL01UQ0lhZFZnL0NrMWFGbmFrY3FYVURmUm1MaEhRZXQ0WGo1ZWRmbVA1?=
 =?utf-8?B?dVRpUU1veWgxb0k3cUgwRTNTdGp5NGtUVGdIcmdhWE0vdlVkbTcrczlxQTg4?=
 =?utf-8?B?cW9ZR1Y5eEFuL3FySlIweUM3cDNMbWN1VXFwcEpBd2wyamMyZ2dOYUJQaUY1?=
 =?utf-8?B?ZzVCME5tdEVPRCtZNkJ1dEVIUTRMUXJwcjE0VG52bVF6b1habmVoVWsrN0Vj?=
 =?utf-8?B?SU5hTDVvb0VKeDYzMnNuUTRLbktFOUhCLzNoaXR0S2FQbmc5VjRwMGx6ZWo4?=
 =?utf-8?B?MDQxOHo3LzRnYXIzMEFGNGtDYldvaHNaYjBWSkVhd2Jab1lCZ3RRd20zQmxw?=
 =?utf-8?B?M3pjNTA5bGlweWYzN1kzZUZ1WUR2ZDg2bkZiWkZwbGQ5ZVVkdnJzaGVMNk1H?=
 =?utf-8?B?UnpGSjBLNVNiYWliRlVHZ0ZmMjRRMEF1NGVCVjhaRkdnUE90V1VrTEVzaGtH?=
 =?utf-8?B?d0FtT3FDSDJCR2ZtdFdxV1FpbjRjdE1nZ1J4cC9qdHB2L1l4WDVOMm5KQXdn?=
 =?utf-8?B?Q1pJRkgrZWZjUXNXZUlqdkRZRVRZd1dIc3BjekcxQU82VlVnMGRJeGV5ZEdq?=
 =?utf-8?B?dmMranBMZFJvRXIxWHhCNjdLNW12bWcrWXcvcUpWVklINzlPMFBFN2Q0WWtu?=
 =?utf-8?B?MUR2dlRXRVdEZ2tjR0F3M0Jaa2JMbjFRSFU1VDJPMElVTjZVdnAzOVFTZEU4?=
 =?utf-8?B?ZEl3Y2VPa0I4bTJjYVJPNWJJVTNCUlAzY0dra1ozR2x6TXIvUkpuZ2MyWUFy?=
 =?utf-8?B?aWZJVWhKY0J5TFF2RkxZRXh4bnhCa1FEWmZEeC9pa1E2M3hLVVVtS3pMeDV6?=
 =?utf-8?B?N1RCTWpsYjNzNzN0dlVPM0xGUGl2VEI3NnBNSUtiK2N1V3VTdGs1bmtocTMz?=
 =?utf-8?B?Qm13czJkZDY1eVdNZjlQbFFKb29ReGhtWDFnRHU1NTh3emdnTmVrL1dMYk5O?=
 =?utf-8?B?WGYwQnpqeFNNaldVR21aSzFuVlZXVDd3dDRTeGlaVTN6UXZ1cGZCY0dzQ3pX?=
 =?utf-8?B?TDMrbU1OOStLa3VMS1NNTmRFdHN4dk1hK21ReHVLTU95dGh1TVg3MjVLUEx1?=
 =?utf-8?B?ZWNLSUV0NElrQm1EM3Y1YnFISFBJdHVSUC9yQTJ4U3JqcXIxREdXNW9JbkxG?=
 =?utf-8?B?Z2x3MkVkdzRIaURxWUFTNHYzWTBsdHM1ZmdXMHNoekN3Q3VZSjZLMVpMeU1E?=
 =?utf-8?B?ZnFLdW1RWkcvakQyczVPcTBuWkhGcTk4NHRGeFdtS0phTnV4YUE0QzFLMXFO?=
 =?utf-8?B?SzN1Q1Yyd0RreW1HZkYyWkFCQmNHS2Y0dWwvQ2dMMks0UkpnbnJUOFFVWGRL?=
 =?utf-8?B?eklLYmNlNzU5SXRpcm5iYWkrc2lyQUhEaTl1cjBGWmt6V0hKalRBeU9ZTTZC?=
 =?utf-8?B?UmdaSjdmVjM3R0ZpNjBDV05YT2VhZFh5L0sraEM2TVd0VGZ5dSszaW83K3dY?=
 =?utf-8?B?MW5jOVJjd2hFZGNocW0waUNYdTFPTEE4T2RIK1J6ZkdPcG5yV0tnUGtGZjRy?=
 =?utf-8?B?WG00dUxtSW1DYVVDNEl6clVoUkcwWWkzQld2MHg2eThUYnlvVXg3MVhQN0t0?=
 =?utf-8?B?OGZCTHluWCtMaXlDQ2RmRGxwbmNDZnVjeGI3WmRXcUpKNnZKeGJxOEhJSGdl?=
 =?utf-8?B?c2VTcUNOeWlDMlhSSUMrYVl3UUxVNVQ4bmRRZmNKRkNDY2ZxTXphbGlDOU5O?=
 =?utf-8?B?UGcwd0huaEQyM1RUcm1pZCtmYjJ1VzVEazRNazQwNjF6OElJR0dnODB5RzRt?=
 =?utf-8?B?TzQrTVJuNHI2ZmRnZ09GaUdMbHJnUUtnRHJMRDJwd3hZd1BqcFZoUkJOdzRm?=
 =?utf-8?B?Q0lrUmM5Zzh0WlNKNkNtaFE2VjhrS1k0UkRKbGMxODgvaTZZL3dRNWQzcWky?=
 =?utf-8?B?OU5Wa01zc1FpOUZoZmpnVUxkTFJpSVRFZElSVjVKcGJiR3Z5OExEZWJyUGN2?=
 =?utf-8?Q?dBFY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e35b69-915f-4cef-ac20-08dd7b5366a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 12:53:49.1022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KW69Mo+Z1LYueMyh8RfwUczVixUswP+9a3rjEE6mtHmXVwgsmtE6+k5IuXJV/WdzaZPVUyQQr629MiO8rQxX6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8551
X-OriginatorOrg: intel.com

SGkgTHVpeiwNCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLg0KDQoNCj5TdWJqZWN0OiBSZTog
W1BBVENIIHYxXSBCbHVldG9vdGg6IGJ0aW50ZWxfcGNpZTogQXZvaWQgcmVkdW5kYW50IGJ1ZmZl
cg0KPmFsbG9jYXRpb24NCj4NCj5IaSBLaXJhbiwNCj4NCj5PbiBUdWUsIEFwciAxLCAyMDI1IGF0
IDEwOjA04oCvUE0gS2lyYW4gSyA8a2lyYW4ua0BpbnRlbC5jb20+IHdyb3RlOg0KPj4NCj4+IFJl
dXNlIHRoZSBza2IgYnVmZmVyIHByb3ZpZGVkIGJ5IHRoZSBQQ0llIGRyaXZlciB0byBwYXNzIGl0
IG9udG8gdGhlDQo+PiBzdGFjaywgaW5zdGVhZCBvZiBjb3B5aW5nIGl0IHRvIGEgbmV3IHNrYi4N
Cj4+DQo+PiBGaXhlczogYzJiNjM2YjNmNzg4ICgiQmx1ZXRvb3RoOiBidGludGVsX3BjaWU6IEFk
ZCBzdXBwb3J0IGZvciBQQ0llDQo+PiB0cmFuc3BvcnQiKQ0KPj4gU2lnbmVkLW9mZi1ieTogS2ly
YW4gSyA8a2lyYW4ua0BpbnRlbC5jb20+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL2JsdWV0b290aC9i
dGludGVsX3BjaWUuYyB8IDU4DQo+PiArKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
Pj4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkNCj4+
DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibHVldG9vdGgvYnRpbnRlbF9wY2llLmMNCj4+IGIv
ZHJpdmVycy9ibHVldG9vdGgvYnRpbnRlbF9wY2llLmMNCj4+IGluZGV4IGUwYjUwNTEzNDAzZi4u
ZWJjMzZmZDMzZGU4IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ibHVldG9vdGgvYnRpbnRlbF9w
Y2llLmMNCj4+ICsrKyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0aW50ZWxfcGNpZS5jDQo+PiBAQCAt
OTQ3LDggKzk0NywxMCBAQCBzdGF0aWMgaW50IGJ0aW50ZWxfcGNpZV9yZWN2X2V2ZW50KHN0cnVj
dCBoY2lfZGV2DQo+KmhkZXYsIHN0cnVjdCBza19idWZmICpza2IpDQo+PiAgICAgICAgICAgICAg
ICAgLyogVGhpcyBpcyBhIGRlYnVnIGV2ZW50IHRoYXQgY29tZXMgZnJvbSBJTUwgYW5kIE9QIGlt
YWdlIHdoZW4gaXQNCj4+ICAgICAgICAgICAgICAgICAgKiBzdGFydHMgZXhlY3V0aW9uLiBUaGVy
ZSBpcyBubyBuZWVkIHBhc3MgdGhpcyBldmVudCB0byBzdGFjay4NCj4NCj5JcyB0aGlzIGxvZ2dl
ZC9zZW50IHRvIG1vbml0b3IgYXQgbGVhc3Q/DQoNCk5vLiAgSSB3aWxsIGxvZyBwYXJ0IEhDSSB0
cmFjZXMgaW4gdGhlIFYyIHZlcnNpb24gb2YgdGhlIHBhdGNoLg0KPg0KPj4gICAgICAgICAgICAg
ICAgICAqLw0KPj4gLSAgICAgICAgICAgICAgIGlmIChza2ItPmRhdGFbMl0gPT0gMHg5NykNCj4+
ICsgICAgICAgICAgICAgICBpZiAoc2tiLT5kYXRhWzJdID09IDB4OTcpIHsNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGtmcmVlX3NrYihza2IpOw0KPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIDA7DQo+PiArICAgICAgICAgICAgICAgfQ0KPj4gICAgICAgICB9DQo+Pg0KPj4g
ICAgICAgICByZXR1cm4gaGNpX3JlY3ZfZnJhbWUoaGRldiwgc2tiKTsgQEAgLTk2NCw3ICs5NjYs
NiBAQCBzdGF0aWMNCj4+IGludCBidGludGVsX3BjaWVfcmVjdl9mcmFtZShzdHJ1Y3QgYnRpbnRl
bF9wY2llX2RhdGEgKmRhdGEsDQo+PiAgICAgICAgIHU4IHBrdF90eXBlOw0KPj4gICAgICAgICB1
MTYgcGxlbjsNCj4+ICAgICAgICAgdTMyIHBjaWVfcGt0X3R5cGU7DQo+PiAtICAgICAgIHN0cnVj
dCBza19idWZmICpuZXdfc2tiOw0KPj4gICAgICAgICB2b2lkICpwZGF0YTsNCj4+ICAgICAgICAg
c3RydWN0IGhjaV9kZXYgKmhkZXYgPSBkYXRhLT5oZGV2Ow0KPj4NCj4+IEBAIC05NzQsOCArOTc1
LDcgQEAgc3RhdGljIGludCBidGludGVsX3BjaWVfcmVjdl9mcmFtZShzdHJ1Y3QNCj5idGludGVs
X3BjaWVfZGF0YSAqZGF0YSwNCj4+ICAgICAgICAgcGRhdGEgPSBza2JfcHVsbF9kYXRhKHNrYiwg
QlRJTlRFTF9QQ0lFX0hDSV9UWVBFX0xFTik7DQo+PiAgICAgICAgIGlmICghcGRhdGEpIHsNCj4+
ICAgICAgICAgICAgICAgICBidF9kZXZfZXJyKGhkZXYsICJDb3JydXB0ZWQgcGFja2V0IHJlY2Vp
dmVkIik7DQo+PiAtICAgICAgICAgICAgICAgcmV0ID0gLUVJTFNFUTsNCj4+IC0gICAgICAgICAg
ICAgICBnb3RvIGV4aXRfZXJyb3I7DQo+PiArICAgICAgICAgICAgICAgZ290byBub19vcl9zaG9y
dF9kYXRhOw0KPj4gICAgICAgICB9DQo+Pg0KPj4gICAgICAgICBwY2llX3BrdF90eXBlID0gZ2V0
X3VuYWxpZ25lZF9sZTMyKHBkYXRhKTsgQEAgLTk4Nyw4ICs5ODcsNyBAQA0KPj4gc3RhdGljIGlu
dCBidGludGVsX3BjaWVfcmVjdl9mcmFtZShzdHJ1Y3QgYnRpbnRlbF9wY2llX2RhdGEgKmRhdGEs
DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICBwa3RfdHlwZSA9IEhDSV9BQ0xEQVRBX1BLVDsN
Cj4+ICAgICAgICAgICAgICAgICB9IGVsc2Ugew0KPj4gICAgICAgICAgICAgICAgICAgICAgICAg
YnRfZGV2X2VycihoZGV2LCAiQUNMIHBhY2tldCBpcyB0b28gc2hvcnQiKTsNCj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgIHJldCA9IC1FSUxTRVE7DQo+PiAtICAgICAgICAgICAgICAgICAgICAg
ICBnb3RvIGV4aXRfZXJyb3I7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG5vX29y
X3Nob3J0X2RhdGE7DQo+PiAgICAgICAgICAgICAgICAgfQ0KPj4gICAgICAgICAgICAgICAgIGJy
ZWFrOw0KPj4NCj4+IEBAIC05OTgsOCArOTk3LDcgQEAgc3RhdGljIGludCBidGludGVsX3BjaWVf
cmVjdl9mcmFtZShzdHJ1Y3QNCj5idGludGVsX3BjaWVfZGF0YSAqZGF0YSwNCj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHBrdF90eXBlID0gSENJX1NDT0RBVEFfUEtUOw0KPj4gICAgICAgICAg
ICAgICAgIH0gZWxzZSB7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICBidF9kZXZfZXJyKGhk
ZXYsICJTQ08gcGFja2V0IGlzIHRvbyBzaG9ydCIpOw0KPj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgcmV0ID0gLUVJTFNFUTsNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXhpdF9l
cnJvcjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gbm9fb3Jfc2hvcnRfZGF0YTsN
Cj4+ICAgICAgICAgICAgICAgICB9DQo+PiAgICAgICAgICAgICAgICAgYnJlYWs7DQo+Pg0KPj4g
QEAgLTEwMDksOCArMTAwNyw3IEBAIHN0YXRpYyBpbnQgYnRpbnRlbF9wY2llX3JlY3ZfZnJhbWUo
c3RydWN0DQo+YnRpbnRlbF9wY2llX2RhdGEgKmRhdGEsDQo+PiAgICAgICAgICAgICAgICAgICAg
ICAgICBwa3RfdHlwZSA9IEhDSV9FVkVOVF9QS1Q7DQo+PiAgICAgICAgICAgICAgICAgfSBlbHNl
IHsNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGJ0X2Rldl9lcnIoaGRldiwgIkV2ZW50IHBh
Y2tldCBpcyB0b28gc2hvcnQiKTsNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1F
SUxTRVE7DQo+PiAtICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGV4aXRfZXJyb3I7DQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG5vX29yX3Nob3J0X2RhdGE7DQo+PiAgICAgICAg
ICAgICAgICAgfQ0KPj4gICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4NCj4+IEBAIC0xMDIwLDQ1
ICsxMDE3LDQwIEBAIHN0YXRpYyBpbnQgYnRpbnRlbF9wY2llX3JlY3ZfZnJhbWUoc3RydWN0DQo+
YnRpbnRlbF9wY2llX2RhdGEgKmRhdGEsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICBwa3Rf
dHlwZSA9IEhDSV9JU09EQVRBX1BLVDsNCj4+ICAgICAgICAgICAgICAgICB9IGVsc2Ugew0KPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgYnRfZGV2X2VycihoZGV2LCAiSVNPIHBhY2tldCBpcyB0
b28gc2hvcnQiKTsNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1FSUxTRVE7DQo+
PiAtICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGV4aXRfZXJyb3I7DQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICBnb3RvIG5vX29yX3Nob3J0X2RhdGE7DQo+PiAgICAgICAgICAgICAgICAg
fQ0KPj4gICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4NCj4+ICAgICAgICAgZGVmYXVsdDoNCj4+
ICAgICAgICAgICAgICAgICBidF9kZXZfZXJyKGhkZXYsICJJbnZhbGlkIHBhY2tldCB0eXBlIHJl
Y2VpdmVkOiAweCU0LjR4IiwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaWVfcGt0
X3R5cGUpOw0KPj4gLSAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7DQo+PiAtICAgICAgICAg
ICAgICAgZ290byBleGl0X2Vycm9yOw0KPj4gKyAgICAgICAgICAgICAgIGdvdG8gbm9fb3Jfc2hv
cnRfZGF0YTsNCj4+ICAgICAgICAgfQ0KPj4NCj4+ICAgICAgICAgaWYgKHNrYi0+bGVuIDwgcGxl
bikgew0KPj4gICAgICAgICAgICAgICAgIGJ0X2Rldl9lcnIoaGRldiwgIlJlY2VpdmVkIGNvcnJ1
cHRlZCBwYWNrZXQuIHR5cGU6IDB4JTIuMngiLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGt0X3R5cGUpOw0KPj4gLSAgICAgICAgICAgICAgIHJldCA9IC1FSUxTRVE7DQo+PiAtICAg
ICAgICAgICAgICAgZ290byBleGl0X2Vycm9yOw0KPj4gKyAgICAgICAgICAgICAgIGdvdG8gbm9f
b3Jfc2hvcnRfZGF0YTsNCj4+ICAgICAgICAgfQ0KPj4NCj4+ICAgICAgICAgYnRfZGV2X2RiZyho
ZGV2LCAicGt0X3R5cGU6IDB4JTIuMnggbGVuOiAldSIsIHBrdF90eXBlLCBwbGVuKTsNCj4+DQo+
PiAtICAgICAgIG5ld19za2IgPSBidF9za2JfYWxsb2MocGxlbiwgR0ZQX0FUT01JQyk7DQo+PiAt
ICAgICAgIGlmICghbmV3X3NrYikgew0KPj4gLSAgICAgICAgICAgICAgIGJ0X2Rldl9lcnIoaGRl
diwgIkZhaWxlZCB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIHNrYiBvZiBsZW46ICV1IiwNCj4+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgIHNrYi0+bGVuKTsNCj4+IC0gICAgICAgICAgICAgICBy
ZXQgPSAtRU5PTUVNOw0KPj4gLSAgICAgICAgICAgICAgIGdvdG8gZXhpdF9lcnJvcjsNCj4+IC0g
ICAgICAgfQ0KPj4gLQ0KPj4gLSAgICAgICBoY2lfc2tiX3BrdF90eXBlKG5ld19za2IpID0gcGt0
X3R5cGU7DQo+PiAtICAgICAgIHNrYl9wdXRfZGF0YShuZXdfc2tiLCBza2ItPmRhdGEsIHBsZW4p
Ow0KPj4gKyAgICAgICBoY2lfc2tiX3BrdF90eXBlKHNrYikgPSBwa3RfdHlwZTsNCj4+ICAgICAg
ICAgaGRldi0+c3RhdC5ieXRlX3J4ICs9IHBsZW47DQo+PiArICAgICAgIHNrYl90cmltKHNrYiwg
cGxlbik7DQo+Pg0KPj4gICAgICAgICBpZiAocGNpZV9wa3RfdHlwZSA9PSBCVElOVEVMX1BDSUVf
SENJX0VWVF9QS1QpDQo+PiAtICAgICAgICAgICAgICAgcmV0ID0gYnRpbnRlbF9wY2llX3JlY3Zf
ZXZlbnQoaGRldiwgbmV3X3NrYik7DQo+PiArICAgICAgICAgICAgICAgcmV0ID0gYnRpbnRlbF9w
Y2llX3JlY3ZfZXZlbnQoaGRldiwgc2tiKTsNCj4+ICAgICAgICAgZWxzZQ0KPj4gLSAgICAgICAg
ICAgICAgIHJldCA9IGhjaV9yZWN2X2ZyYW1lKGhkZXYsIG5ld19za2IpOw0KPj4gKyAgICAgICAg
ICAgICAgIHJldCA9IGhjaV9yZWN2X2ZyYW1lKGhkZXYsIHNrYik7DQo+Pg0KPj4gLWV4aXRfZXJy
b3I6DQo+PiArZ290byBvdXQ7DQo+PiArDQo+PiArbm9fb3Jfc2hvcnRfZGF0YToNCj4+ICsgICAg
ICAgcmV0ID0gLUVJTFNFUTsNCj4+ICsgICAgICAga2ZyZWVfc2tiKHNrYik7DQo+DQo+RG9uJ3Qg
cmVhbGx5IGxpa2Ugd2hlcmUgdGhpcyBpcyBnb2luZywgaGF2aW5nIGEgZ290byBsYWJlbCB0byBj
bGVhbnVwIGlzIGZpbmUsDQo+aGF2aW5nIG11bHRpcGxlIGFuZCB0aGUgaGF2aW5nIHRvIGZpZ3Vy
ZSBvdXQgd2hpY2ggb25lIGRvZXMgd2hhdCBpcyByYXRoZXINCj5jb25mdXNpbmcgYW5kIGRvZXNu
J3QgaGVscCB0aGF0IG11Y2gsIGFueXdheSBpZiB3ZSBnb3QgYSBuZWdhdGl2ZSByZXQgeW91IGNh
bg0KPnByb2JhYmx5IGp1c3QgbWFrZSBpdCBkcm9wIHRoZSBza2Igb24gdGhlIGlmDQo+KHJldCkg
c3RhdGVtZW50Lg0KDQpPay4gSSB3aWxsIHJldmlzaXQgdGhpcyBwYXRjaCBhbmQgdHJ5IHRvIG1h
a2UgaXQgbW9yZSByZWFkYWJsZS4NCj4NCj4+ICtvdXQ6DQo+PiAgICAgICAgIGlmIChyZXQpDQo+
PiAgICAgICAgICAgICAgICAgaGRldi0+c3RhdC5lcnJfcngrKzsNCj4+DQo+PiBAQCAtMTE5Miw4
ICsxMTg0LDYgQEAgc3RhdGljIHZvaWQgYnRpbnRlbF9wY2llX3J4X3dvcmsoc3RydWN0IHdvcmtf
c3RydWN0DQo+KndvcmspDQo+PiAgICAgICAgIHN0cnVjdCBidGludGVsX3BjaWVfZGF0YSAqZGF0
YSA9IGNvbnRhaW5lcl9vZih3b3JrLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBidGludGVsX3BjaWVfZGF0YSwgcnhfd29yayk7DQo+PiAgICAgICAg
IHN0cnVjdCBza19idWZmICpza2I7DQo+PiAtICAgICAgIGludCBlcnI7DQo+PiAtICAgICAgIHN0
cnVjdCBoY2lfZGV2ICpoZGV2ID0gZGF0YS0+aGRldjsNCj4+DQo+PiAgICAgICAgIGlmICh0ZXN0
X2JpdChCVElOVEVMX1BDSUVfSFdFWFBfSU5QUk9HUkVTUywgJmRhdGEtPmZsYWdzKSkgew0KPj4g
ICAgICAgICAgICAgICAgIC8qIFVubGlrZSB1c2IgcHJvZHVjdHMsIGNvbnRyb2xsZXIgd2lsbCBu
b3Qgc2VuZA0KPj4gaGFyZHdhcmUgQEAgLTEyMTQsMTEgKzEyMDQsNyBAQCBzdGF0aWMgdm9pZA0K
Pj4gYnRpbnRlbF9wY2llX3J4X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPj4NCj4+
ICAgICAgICAgLyogUHJvY2VzcyB0aGUgc2tfYnVmIGluIHF1ZXVlIGFuZCBzZW5kIHRvIHRoZSBI
Q0kgbGF5ZXIgKi8NCj4+ICAgICAgICAgd2hpbGUgKChza2IgPSBza2JfZGVxdWV1ZSgmZGF0YS0+
cnhfc2tiX3EpKSkgew0KPj4gLSAgICAgICAgICAgICAgIGVyciA9IGJ0aW50ZWxfcGNpZV9yZWN2
X2ZyYW1lKGRhdGEsIHNrYik7DQo+PiAtICAgICAgICAgICAgICAgaWYgKGVycikNCj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgIGJ0X2Rldl9lcnIoaGRldiwgIkZhaWxlZCB0byBzZW5kIHJlY2Vp
dmVkIGZyYW1lOiAlZCIsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVy
cik7DQo+PiAtICAgICAgICAgICAgICAga2ZyZWVfc2tiKHNrYik7DQo+PiArICAgICAgICAgICAg
ICAgYnRpbnRlbF9wY2llX3JlY3ZfZnJhbWUoZGF0YSwgc2tiKTsNCj4+ICAgICAgICAgfQ0KPj4g
IH0NCj4+DQo+PiAtLQ0KPj4gMi40My4wDQo+Pg0KPj4NCj4NCj4NCj4tLQ0KPkx1aXogQXVndXN0
byB2b24gRGVudHoNCg0KUmVnYXJkcywNCktpcmFuDQoNCg==

