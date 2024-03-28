Return-Path: <linux-bluetooth+bounces-2305-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9BF871E43
	for <lists+linux-bluetooth@lfdr.de>; Tue,  5 Mar 2024 12:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA5BCB213FE
	for <lists+linux-bluetooth@lfdr.de>; Tue,  5 Mar 2024 11:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2718C58AA0;
	Tue,  5 Mar 2024 11:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+QBYNc8"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AD758139
	for <linux-bluetooth@vger.kernel.org>; Tue,  5 Mar 2024 11:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709639474; cv=fail; b=QHs0Jkb/0NTKkORbHNNWxZbuWCO/h+xiCfUjUQk0njBCw4UcqBMA49Fca+kAsBBcwWOnZuM+wBEAM9dSl8yotxHfeEaBZYzzwD49GrpoDsaH8y366HHX2UP/+O6aHYv9q6U85q2C6GsmtuCSnXJZTyrLmkJVkNIVZ7v4n3docm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709639474; c=relaxed/simple;
	bh=2NnF8PLnBvtLBcRsIhqys+W0ndCQqN0fv8KVOGyCdzw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jXQDy4sCE5jAeicI2xZfRcuWfT+TshgwgnfyTiWh7CjL1R5dcYFM2c9gpkaOjVAzrpeZ47f/SBEr5VlkUdQOdoFwJU+67lZDIwCFdqeh8DwHcXGseTvX2j7QrDnkajVTHuwb08Ja6Q+jqcxu5J5KFwZEOZ62F+ChmoKBDIZkntE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+QBYNc8; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709639473; x=1741175473;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2NnF8PLnBvtLBcRsIhqys+W0ndCQqN0fv8KVOGyCdzw=;
  b=K+QBYNc893WfP5jSEKXZmlObAd6BGiDVa6wER77Zq34sIKamEFwTFoxA
   t+dy8zeWeC7qv6bkBk2apzaot3uvz2A+r1+XP40/t/P4W86XFJ9yg+h5D
   5iP82eAnfPdjMFUQ4KUJopNq4hAHbdo/oTi6+X+2PWgI50r5mgCiu06M+
   kkA3yB3aTSm+3jiwatD1/H4UNkfw5JmVkQRCyEfYnAhUhv+rER35Xo048
   VdrvcBrzRfTC7JiZo2Nx/O47A7h+qom28hdCmKBvT1NxSjLmbTT0IFQlp
   FNVyohcBAeg/jttizMHi+ug0mjrU67iHQBhL/dnyPjT/m3DwEAC4zfnQI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="29610099"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="29610099"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 03:51:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="14030838"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Mar 2024 03:51:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 03:51:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 03:51:09 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 03:51:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxtUgz4wjCxGEfQzctPYEQzGUD8vBb2VrCduDUo56wI8xk7l/Q7QDssIapC1dnPcfVbnuYRPzFGg+4YPB6MUvDVIS1FK8hbNHE/Is6WeeZrgVPa5B5tfAf/2mJe3UumDiR9SCumkwcVnFvfTQFDn8WiRZd1iwW0R0mLMnUCzelMClIQz7KFPUYljoZ+zH6M6IISv21dBeLeXy5XI56DlGYiZqFNH2arjK7O0uISCqIbvCs9mXLaZKq1AVPbawlm2HdUyGvkgGc/l3SLXD5d6ZPQ1GjpCxMQ2C/5JlT+Qo8B8Ho+bTBAeR60nfKMoZ3MCOvSYh/qCD5R0F6oRczUFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NnF8PLnBvtLBcRsIhqys+W0ndCQqN0fv8KVOGyCdzw=;
 b=CmgzGzM1CCT+qGQNiWgggX419vdDl3F8y/b5Q8nxUtMk6cvvYNKCbwP5TkqvJGVXIBSW6dwqRofnSMG3BRmgJyJIxzftHnSaEs0Re5mRYC99RyRxqZkcO8+mMFfOpDmDL2Oa0VfU6IV63OXwZhW0yJDexBUiF1If5j0LklfjJuPECodlIF4F8jUJTBPlHvNtd8Z416NSK4rU6J4F+2Ci7kSkDj+RQ3mb1Iq3uuqdWKpJFBRXD7l1mJf57MjHFC1SBpjQ2KiRbAZltxC3h4YlMtIhzvlU+rqGUzNewJ3svhuNj0qXA0qsR8pn6/c0fgJ5U7gr2ySluHpreuiNJZB23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB7585.namprd11.prod.outlook.com (2603:10b6:510:28f::10)
 by SJ0PR11MB6742.namprd11.prod.outlook.com (2603:10b6:a03:47b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Tue, 5 Mar
 2024 11:51:01 +0000
Received: from PH0PR11MB7585.namprd11.prod.outlook.com
 ([fe80::b517:edd4:27fa:580e]) by PH0PR11MB7585.namprd11.prod.outlook.com
 ([fe80::b517:edd4:27fa:580e%7]) with mapi id 15.20.7339.019; Tue, 5 Mar 2024
 11:51:01 +0000
From: "K, Kiran" <kiran.k@intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
CC: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
	"Srivatsa, Ravishankar" <ravishankar.srivatsa@intel.com>, "Tumkur Narayan,
 Chethan" <chethan.tumkur.narayan@intel.com>
Subject: RE: [PATCH v1] Bluetooth: btintel: Add support for downloading
 secondary boot loader image
Thread-Topic: [PATCH v1] Bluetooth: btintel: Add support for downloading
 secondary boot loader image
Thread-Index: AQHaa8C7aSRNyxzoN0WLksWEYDCp87EiucwAgARywMCAABxMgIABwSTQ
Date: Tue, 5 Mar 2024 11:51:01 +0000
Message-ID: <PH0PR11MB75853D83656171E99FB9AD6AF5222@PH0PR11MB7585.namprd11.prod.outlook.com>
References: <20240301102412.11151-1-kiran.k@intel.com>
 <c4f91a66-2890-4e76-bc01-42dd0c9a17dd@molgen.mpg.de>
 <PH0PR11MB7585A403D6FF95B34DF981B8F5232@PH0PR11MB7585.namprd11.prod.outlook.com>
 <6e2a8ae7-1685-4d13-9b6b-c28290caf8b8@molgen.mpg.de>
In-Reply-To: <6e2a8ae7-1685-4d13-9b6b-c28290caf8b8@molgen.mpg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7585:EE_|SJ0PR11MB6742:EE_
x-ms-office365-filtering-correlation-id: 89718d64-39df-4cab-a86f-08dc3d0a8781
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MYffGV4z9e7TZFzuOGBiBCSBQP9mwXhgPdZlTgcimbokjSmhobWaMTJEwO34Z5gM/+o7DykoU1QOuO4MZx9kQ1ez3SEunQVx2XUzHcfswzS9qT1ZvTbiGckQp+NXWjD7bhSz7pke+ehdPqecMu7UyTPpbSGsbNOrDJ1KE8DF1dHtDiRu4ukeZYUiJYlaKcNON7kTqO7hg5Hn68Pbc+ND9bpEdG3ax9Rb0eiYMApgveuSbbqu2jFnDY3s00qgh77r9Gw8A0Mc+x1xHSY4j2e03TluzIbGgTQ0E6rDjmtI3/Pfd35COBUqNmvIEL9TcxdBiKMXaJ5z1y2b6+cvHMScOUV7c6Ehn2Cfllofk+vNp4GY8vhJl6mt9HYsx425acJEjcQ/TfNUpjPqTiGo2Ub02WNsopqD3pMrXd0LehBaqHGzWmuHpoO7zEDpR2bf6spuHBp9g/h3FG+/naTr/ihh0c24UWp4Pw6ZMMyt3aiVqabdy+66RRkJSxdBJx8sVrYqNm0mfqHx+2qsR0yYk9Y7xnPmyvm8z5PEZGtYAjW9qVA/wActqEKOL+/jhMTaIx66tUPL84hxCnw4tYPkea5XLV9pYzcvTOTa2AevboU1NlXcvXfnjBDJEpzIgBqBOgRUC1uJLtmdjZ275SM7x6Rrai3FGbmRm6en3pjXsT4M4MQWy095Bz1UgYeYRqliWXzCXN0E2eHeD5b+whRgTUkHKKZPyWGLxfC7PvVLlm92AEY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7585.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWs3Y0JRQmNySE43cXVQai9GeXBJSFVnRXZQUE9BY0ZmOU4yUzR0WUc3QjN5?=
 =?utf-8?B?cGJFNjJ0d3BuYlJ0M2MwWlVvZ0JLZld3Q2pzS2RubFlXMkcwcnBrTmZ6QTM4?=
 =?utf-8?B?OHpRY3ZPSWlHV2JxQXBSYzROSzFJZmdNcWhQWkFuYjUveXE0N3E1L1ZiZ1E2?=
 =?utf-8?B?dGJ0S3IwWXRDNzJkY3kyUy9zYitxZ1V5Q2M1Tk55ODlhbjBwWXR3TlFkWnNz?=
 =?utf-8?B?OHZFam1mcnE0WTdIT1QvcVZtQXFtTnMrYzFBOFh3dmRSbzVya3hIKzIrUW5P?=
 =?utf-8?B?K202WWF1SVVDeGg5YUEyMzQ4NGNwVjBwUExSakU1VVBYaWNRR0k2RW11UWM0?=
 =?utf-8?B?MjBGK2NkbE5DdS81cFYzckl2UWl3T0NaUmZXTmJVeHF0MEtOckNVaHBPWktm?=
 =?utf-8?B?c3p0aSt4TWIwa2pLMHd1ckEyMEZWRTVubnFTUGhwbVJVY1I4cWVicE9aU3l4?=
 =?utf-8?B?cXVHSHpQRmdIaDNaVWZVWTNaTVcvWVFqeWpHTHZnbURjOHJpUTFUOTlXZ3BC?=
 =?utf-8?B?aTBNUzFPeG5QTjJPaTZxNDlUZ0Y4dVM1bnBNWGpaaEtzUmJGWDY1eld0bFdS?=
 =?utf-8?B?YlVudEQ2cVBMY3ljakdNQmFZNlVIQm8wS2NxMjEyTXVGUi9xOFp1Ty9RZkt3?=
 =?utf-8?B?NllYVkQzOFVoOC9TTUtlUjJxSURiRzV3Z0VWaVFVVmwxb01pUHRoL0R0MTlz?=
 =?utf-8?B?UWJBaFAwaXZjUllIMFJDRjhBZzk0Vk0zcUdadUlQWG8wZWhXaVVBbWYvQVpP?=
 =?utf-8?B?OEFkbTJha2RzZENtSnV1aDZxMzJwdmNTKzB1UHFtQXh1SjJpS3VWc1hOcG9y?=
 =?utf-8?B?L0orMXdtODVtMkdKUVZMb0kzbjA1VzZYbG9JMVNWL0QzVGdvWHR0bU5tWk1s?=
 =?utf-8?B?L1pRMG1hUnp2R3dvOG90dnh4akhuNWNCdndlcnV2cTVUd0pkbVVPWjIzbWVa?=
 =?utf-8?B?ekdHTklMOUpzcm5Hekx6VWhLNVRlVDg0aXAxNklRZVJMMGYva3hQMU5WN0hs?=
 =?utf-8?B?akFmdWtDemQ3QWRXWW4wWUJrOU0zUkM1SG9kWmZXeHh2WitlcGdiR0M2RzJj?=
 =?utf-8?B?c003VmJYclVnbkdPa1JNODEzdjFtcXg1ZFZ0M0RnVjM4a2FHTWUyUzQ5OE5W?=
 =?utf-8?B?VWpKQzlSWklYdUlaZzE3clVmbkZvVVhuQlMvc0ZqWXVnWmFFeG5oeFMzNWg4?=
 =?utf-8?B?ZG16RkJSUGVvdkplZDZtVUo3MFgrc2NRbTN4ZlBQYnZzSnZRMG11WS95WnJx?=
 =?utf-8?B?dUdmTGhpU2N2NXo4dXVrU3RFaCtpZHpnSzhqNXozWVR5VzRab2ZJbHY2RCsy?=
 =?utf-8?B?MVJYeTFuRXZVdEljSHFlWU1mUjYzc3lUWmt5TmZiWGxFT2xMSWcxTU5VOGt6?=
 =?utf-8?B?Mk9tVG5EQ00wdWkvVkEvSHM2NGdSN0VWT3loKytvUUw4ZVo1QnB4OXdNcXNy?=
 =?utf-8?B?YlZBSFIrdnRzZmlYUlZXL1ozT3NRMkcxS2hzQllucU1kT2hPaHJHMjFVVDl0?=
 =?utf-8?B?d3NUYys4VDZhTXh1NThQNXh3dkZ3KzFiYm9ZM3h5Rm9YOVFLQ1oyTFBrenVy?=
 =?utf-8?B?MERZN3dNTTFGZ2xwODI2Z0VDQzNERHJsSUNySFZLMWJzcGVlMlZhNFM3K0Ir?=
 =?utf-8?B?WW1oSVlhT0NhdEpEMWlsaTIrYUh1dENsdkNtbXQ0TVVXY2xMa3E3bnBPREkw?=
 =?utf-8?B?TUZRS3NCUHo4UTF6V3prd2g4WU1WUzcyOWY5ZHZaRVhWc0pkVDJlRHNRMGZL?=
 =?utf-8?B?eEdZb2puYnI3NDZjUEZEVlpSSGpKcEZicGZ6Q2VCMmNYblRyTGVGbXN2b3FD?=
 =?utf-8?B?SEl1OGZHUDc3Um42K1BOVVI5TEJrdGR5UzNxQ0lwYjhUcUNuZGNlelhzd3dO?=
 =?utf-8?B?ZHc4S2w2b2ZIdWExcWZCYTBIOEZuaEluZHJKcmtWdjM3WlVLY29pcVhBVjVS?=
 =?utf-8?B?U2o5OUFLM3ZHYmo5OVhjZjMrcmdibG9VM3B5VlN0L0ViR3JBZldaVm1za0Zw?=
 =?utf-8?B?T3J4dGhYTERoODA2aWp0ZVppM1B0RC90Y2lzV1dmWGNPRFlSZ0ZiVndJNnBR?=
 =?utf-8?B?QTBkSGlsazFTL1VycXl6NFk2MThSWWtSdjk0NXBWS2R4ZTRZc1NDZ0Roa3I4?=
 =?utf-8?Q?ISVE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 89718d64-39df-4cab-a86f-08dc3d0a8781
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 11:51:01.1530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b5CLer1yMBl3ch35fjLIJ0YH4eru0IF749lbvb7IUdF5eyo1Ogq7DSCPZI25UoyW8zWrdbD/HCgvDsNEAqAacw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6742
X-OriginatorOrg: intel.com

SGkgUGF1bCwNCg0KQXBwcmVjaWF0ZSB5b3VyIGNvbW1lbnRzLg0KDQo+IA0KPiBEZWFyIEtpcmFu
LA0KPiANCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciByZXBseS4NCj4gDQo+IEFtIDA0LjAzLjI0
IHVtIDA5OjIxIHNjaHJpZWIgSywgS2lyYW46DQo+IA0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+PiBGcm9tOiBQYXVsIE1lbnplbCA8cG1lbnplbEBtb2xnZW4ubXBnLmRlPg0K
PiA+PiBTZW50OiBGcmlkYXksIE1hcmNoIDEsIDIwMjQgNDozOCBQTQ0KPiANCj4gW+KApl0NCj4g
DQo+ID4+IEFtIDAxLjAzLjI0IHVtIDExOjI0IHNjaHJpZWIgS2lyYW4gSzoNCj4gPj4+IFNvbWUg
dmFyaWFudHMgb2YgSW50ZWwgY29udHJvbGxlcnMgbGlrZSBCbGF6YXJJIHN1cHBvcnRzIGRvd25s
b2FkaW5nDQo+ID4+PiBvZg0KPiA+Pg0KPiA+PiBzdXBwb3J0DQo+ID4+DQo+ID4+IEluIHRoZSBk
aWZmIHlvdSB3cml0ZSBCbGF6YXItSS4NCj4gPg0KPiA+IE9rLiBJIHdpbGwgZml4IGl0IGluIHRo
ZSBuZXh0IHBhdGNoLg0KPiA+Pg0KPiA+Pj4gc2Vjb25kYXJ5IGJvb3Rsb2FkZXIuIFRoaXMgcGF0
Y2ggYWRkcyB0aGUgc3VwcG9ydCB0byBkb3dubG9hZA0KPiA+Pj4gc2Vjb25kYXJ5IGJvb3QgbG9h
ZGVyIGltYWdlIGJlZm9yZSBkb3dubG9hZGluZyBvcGVyYXRpb25hbCBmaXJtd2FyZQ0KPiBpbWFn
ZS4NCj4gPj4NCj4gPj4gV2hhdCBpcyB0aGUgc2Vjb25kYXJ5IGJvb3Rsb2FkZXIgbmVlZGVkIGZv
cj8NCj4gPg0KPiA+IFByaW1hcnkgYm9vdGxvYWRlciBpcyBmbGFzaGVkIG92ZXIgUk9NIGFuZCBh
bnkgaXNzdWVzIGZvdW5kIG9uY2UgdGhlDQo+ID4gcHJvZHVjdCByZWxlYXNlZCB0byBtYXJrZXQg
aXMgaGFyZCAvIGltcG9zc2libGUgdG8gZml4LiBTbyBpZGVhIGlzIHRvDQo+ID4ga2VlcCBwcmlt
YXJ5IGJvb3Rsb2FkZXIgbWluaW1hbCBhbmQgaGF2ZSBzZWNvbmRhcnkgYm9vdGxvYWRlci4NCj4g
VGhhbmsgeW91LiBJIHRoaW5rLCB0aGF04oCZZCBiZSBnb29kIHRvIGhhdmUgaW4gdGhlIGNvbW1p
dCBtZXNzYWdlLg0KPiANCkFjay4gSSB3aWxsIHVwZGF0ZSBjb21taXQgbWVzc2FnZS4NCg0KPiA+
Pj4gU2lnbmVkLW9mZi1ieTogS2lyYW4gSyA8a2lyYW4ua0BpbnRlbC5jb20+DQo+ID4+PiAtLS0N
Cj4gPj4+IGRtZXNnIGxvZ3M6DQo+ID4+PiBbICAgMTYuNTM3MTMwXSBCbHVldG9vdGg6IENvcmUg
dmVyIDIuMjINCj4gPj4+IFsgICAxNi41MzcxMzVdIEJsdWV0b290aDogU3RhcnRpbmcgc2VsZiB0
ZXN0aW5nDQo+ID4+PiBbICAgMTYuNTQwMDIxXSBCbHVldG9vdGg6IEVDREggdGVzdCBwYXNzZWQg
aW4gMjgxOCB1c2Vjcw0KPiA+Pj4gWyAgIDE2LjU2MDY2Nl0gQmx1ZXRvb3RoOiBTTVAgdGVzdCBw
YXNzZWQgaW4gNjAyIHVzZWNzDQo+ID4+PiBbICAgMTYuNTYwNjc0XSBCbHVldG9vdGg6IEZpbmlz
aGVkIHNlbGYgdGVzdGluZw0KPiA+Pj4gWyAgIDE2LjU2MDY5MF0gQmx1ZXRvb3RoOiBIQ0kgZGV2
aWNlIGFuZCBjb25uZWN0aW9uIG1hbmFnZXIgaW5pdGlhbGl6ZWQNCj4gPj4+IFsgICAxNi41NjA2
OTVdIEJsdWV0b290aDogSENJIHNvY2tldCBsYXllciBpbml0aWFsaXplZA0KPiA+Pj4gWyAgIDE2
LjU2MDY5N10gQmx1ZXRvb3RoOiBMMkNBUCBzb2NrZXQgbGF5ZXIgaW5pdGlhbGl6ZWQNCj4gPj4+
IFsgICAxNi41NjA3MDBdIEJsdWV0b290aDogU0NPIHNvY2tldCBsYXllciBpbml0aWFsaXplZA0K
PiA+Pj4gWyAgIDE2LjU3MTkzNF0gQmx1ZXRvb3RoOiBoY2kwOiBEZXZpY2UgcmV2aXNpb24gaXMg
MA0KPiA+Pj4gWyAgIDE2LjU3MTk0MF0gQmx1ZXRvb3RoOiBoY2kwOiBTZWN1cmUgYm9vdCBpcyBk
aXNhYmxlZA0KPiA+Pj4gWyAgIDE2LjU3MTk0MV0gQmx1ZXRvb3RoOiBoY2kwOiBPVFAgbG9jayBp
cyBkaXNhYmxlZA0KPiA+Pj4gWyAgIDE2LjU3MTk0Ml0gQmx1ZXRvb3RoOiBoY2kwOiBBUEkgbG9j
ayBpcyBlbmFibGVkDQo+ID4+PiBbICAgMTYuNTcxOTQzXSBCbHVldG9vdGg6IGhjaTA6IERlYnVn
IGxvY2sgaXMgZGlzYWJsZWQNCj4gPj4+IFsgICAxNi41NzE5NDNdIEJsdWV0b290aDogaGNpMDog
TWluaW11bSBmaXJtd2FyZSBidWlsZCAxIHdlZWsgMTAgMjAxNA0KPiA+Pj4gWyAgIDE2LjU3MTk0
NV0gQmx1ZXRvb3RoOiBoY2kwOiBCb290bG9hZGVyIHRpbWVzdGFtcCAyMDIyLjQ2IGJ1aWxkdHlw
ZSAxDQo+IGJ1aWxkIDI2NTkwDQo+ID4+PiBbICAgMTYuNTcyMTg5XSBCbHVldG9vdGg6IGhjaTA6
IERTTSByZXNldCBtZXRob2QgdHlwZTogMHgwMA0KPiA+Pj4gWyAgIDE2LjU3NTAwMl0gQmx1ZXRv
b3RoOiBoY2kwOiBGb3VuZCBkZXZpY2UgZmlybXdhcmU6IGludGVsL2lidC0wMDkwLQ0KPiAwMjkx
LTAyLnNmaQ0KPiA+Pj4gWyAgIDE2LjU3NTAwN10gQmx1ZXRvb3RoOiBoY2kwOiBCb290IEFkZHJl
c3M6IDB4MzAwOTkwMDANCj4gPj4+IFsgICAxNi41NzUwMDhdIEJsdWV0b290aDogaGNpMDogRmly
bXdhcmUgVmVyc2lvbjogMjAwLTEwLjI0DQo+ID4+PiBbICAgMTYuNzA1Njk4XSBCbHVldG9vdGg6
IGhjaTA6IFdhaXRpbmcgZm9yIGZpcm13YXJlIGRvd25sb2FkIHRvDQo+IGNvbXBsZXRlDQo+ID4+
PiBbICAgMTYuNzA1OTI3XSBCbHVldG9vdGg6IGhjaTA6IEZpcm13YXJlIGxvYWRlZCBpbiAxMjc4
NTIgdXNlY3MNCj4gPj4NCj4gPj4gVW5yZWxhdGVkLCAgYnV0IHRoaXMgaXMgcXVpdGUgbG9uZy4N
Cj4gPiBJIGNhbiBwYXNzIG9uIHRoaXMgaW5mb3JtYXRpb24gdG8gZmlybXdhcmUuIEkgZmVlbCB0
aGlzIHNlZW1zIHRvIGJlIE9LDQo+ID4gYXMgdGhlIG1heGltdW0gdGltZW91dCBmb3IgZmlybXdh
cmUgZG93bmxvYWQgaXMgNSBzZWNvbmRzLg0KPiANCj4gU3RhcnRpbmcgbXkgc3lzdGVtLCBpbiBh
biBpZGVhbCB3b3JsZCBpdOKAmXMgcmVhZHkgYWZ0ZXIgYXQgbW9zdCBvbmUgc2Vjb25kDQo+IChz
eXN0ZW0gZmlybXdhcmUgMC41IHNlY29uZHMsIExpbnV4IGtlcm5lbCAwLjIgc2Vjb25kcyArIDAu
MyB1c2VyIHNwYWNlKS4gOy0pDQo+IElkZWFsbHksIEJsdWV0b290aCB3b3VsZCBiZSBvcGVyYXRp
b25hbCBieSB0aGVuLg0KPiANCj4gPj4+IFsgICAxNi43MDU5NTJdIEJsdWV0b290aDogaGNpMDog
V2FpdGluZyBmb3IgZGV2aWNlIHRvIGJvb3QNCj4gPj4+IFsgICAxNi43MDg1MTldIEJsdWV0b290
aDogaGNpMDogRGV2aWNlIGJvb3RlZCBpbiAyNTIyIHVzZWNzDQo+ID4+PiBbICAgMTYuNzA4NTM4
XSBCbHVldG9vdGg6IGhjaTA6IE1hbGZvcm1lZCBNU0ZUIHZlbmRvciBldmVudDogMHgwMg0KPiA+
Pg0KPiA+PiAoVW5yZWxhdGVkLCBidXQgdGhpcyBpcyBzaG93biBvbiBhIGxvdCBvZiBkZXZpY2Vz
LiBPbmUgbW9yZSB0aW1lDQo+ID4+IGJlbG93LikNCj4gPj4NCj4gPj4+IFsgICAxNi43MTAyOTZd
IEJsdWV0b290aDogaGNpMDogTm8gZGV2aWNlIGFkZHJlc3MgY29uZmlndXJlZA0KPiA+Pj4gWyAg
IDE2LjcxMjQ4M10gQmx1ZXRvb3RoOiBoY2kwOiBGb3VuZCBkZXZpY2UgZmlybXdhcmU6IGludGVs
L2lidC0wMDkwLQ0KPiAwMjkxLnNmaQ0KPiA+Pj4gWyAgIDE2LjcxMjQ5N10gQmx1ZXRvb3RoOiBo
Y2kwOiBCb290IEFkZHJlc3M6IDB4MTAwMDA4MDANCj4gPj4+IFsgICAxNi43MTI0OThdIEJsdWV0
b290aDogaGNpMDogRmlybXdhcmUgVmVyc2lvbjogMjExLTEwLjI0DQo+ID4NCj4gPj4gSXTigJlz
IHVuY2xlYXIgZnJvbSB0aGUgbG9ncywgd2h5IHR3byBmaXJtd2FyZSBmaWxlcyAod2l0aCBkaWZm
ZXJlbnQNCj4gPj4gdmVyc2lvbnMpIGFyZSBsb2FkZWQuDQo+ID4NCj4gPiBPbmUgaXMgc2Vjb25k
YXJ5IGJvb3Rsb2FkZXIgKGlidC0wMDkwLTAyOTEtMDIuc2ZpKSBhbmQgdGhlIG90aGVyIG9uZQ0K
PiA+IGlzIG9wZXJhdGlvbmFsIGZpcm13YXJlIChpYnQtMDA5MC0wMjkxLnNmaSkgLiAgSXQncyBw
b3NzaWJsZSB0byBoYXZlDQo+ID4gZGlmZmVyZW50IHZlcnNpb24uDQo+IFVuZGVyc3Rvb2QuIENv
dWxkIHRoYXQgYmUgbWFkZSBtb3JlIGNsZWFyIGluIHRoZSBsb2dnaW5nIG91dHB1dD8NCj4gDQpB
Y2suIEkgd2lsbCB1c2UgdGhlIHN0cmluZyAiaW1sIiBpbnN0ZWFkIG9mIGltYWdlIHR5cGUgLSAw
Mi4NCg0KPiA+Pj4gWyAgIDE2LjkzMDgzNF0gQmx1ZXRvb3RoOiBCTkVQIChFdGhlcm5ldCBFbXVs
YXRpb24pIHZlciAxLjMNCj4gPj4+IFsgICAxNi45MzA4NDBdIEJsdWV0b290aDogQk5FUCBmaWx0
ZXJzOiBwcm90b2NvbCBtdWx0aWNhc3QNCj4gPj4+IFsgICAxNi45MzA4NDRdIEJsdWV0b290aDog
Qk5FUCBzb2NrZXQgbGF5ZXIgaW5pdGlhbGl6ZWQNCj4gPj4+IFsgICAxOC40OTQxMzddIEJsdWV0
b290aDogaGNpMDogV2FpdGluZyBmb3IgZmlybXdhcmUgZG93bmxvYWQgdG8NCj4gY29tcGxldGUN
Cj4gPj4+IFsgICAxOC40OTQ4OTddIEJsdWV0b290aDogaGNpMDogRmlybXdhcmUgbG9hZGVkIGlu
IDE3NDA2MzQgdXNlY3MNCj4gPj4NCj4gPj4gSG1tLCAxLjcgc2Vjb25kcyBpcyB2ZXJ5IGxvbmcu
DQo+ID4+DQo+ID4+PiBbICAgMTguNDk0OTcyXSBCbHVldG9vdGg6IGhjaTA6IFdhaXRpbmcgZm9y
IGRldmljZSB0byBib290DQo+ID4+PiBbICAgMTguNTI5MDg5XSBCbHVldG9vdGg6IGhjaTA6IERl
dmljZSBib290ZWQgaW4gMzMzNzEgdXNlY3MNCj4gPj4+IFsgICAxOC41MjkxMjFdIEJsdWV0b290
aDogaGNpMDogTWFsZm9ybWVkIE1TRlQgdmVuZG9yIGV2ZW50OiAweDAyDQo+ID4+PiBbICAgMTgu
NTI5OTE0XSBCbHVldG9vdGg6IGhjaTA6IEZvdW5kIEludGVsIEREQyBwYXJhbWV0ZXJzOiBpbnRl
bC9pYnQtDQo+IDAwOTAtMDI5MS5kZGMNCj4gPj4+IFsgICAxOC41MzIxNThdIEJsdWV0b290aDog
aGNpMDogQXBwbHlpbmcgSW50ZWwgRERDIHBhcmFtZXRlcnMgY29tcGxldGVkDQo+ID4+PiBbICAg
MTguNTMyNTgyXSBCbHVldG9vdGg6IGhjaTA6IEZvdW5kIEludGVsIEREQyBwYXJhbWV0ZXJzOg0K
PiBpbnRlbC9iZGFkZHJlc3MuY2ZnDQo+ID4+PiBbICAgMTguNTM0MTA5XSBCbHVldG9vdGg6IGhj
aTA6IEFwcGx5aW5nIEludGVsIEREQyBwYXJhbWV0ZXJzIGNvbXBsZXRlZA0KPiA+Pj4gWyAgIDE4
LjUzNzE3MF0gQmx1ZXRvb3RoOiBoY2kwOiBGaXJtd2FyZSB0aW1lc3RhbXAgMjAyNC45IGJ1aWxk
dHlwZSAwDQo+IGJ1aWxkIDU4MDY3DQo+ID4+PiBbICAgMTguNTM3MTc3XSBCbHVldG9vdGg6IGhj
aTA6IEZpcm13YXJlIFNIQTE6IDB4ODFhYmYxZWENCj4gPj4+IFsgICAxOC41NDA5ODVdIEJsdWV0
b290aDogaGNpMDogRnNlcSBzdGF0dXM6IFN1Y2Nlc3MgKDB4MDApDQo+ID4+PiBbICAgMTguNTQw
OTkyXSBCbHVldG9vdGg6IGhjaTA6IEZzZXEgZXhlY3V0ZWQ6IDAwLjAwLjAwLjAwDQo+ID4+PiBb
ICAgMTguNTQwOTkzXSBCbHVldG9vdGg6IGhjaTA6IEZzZXEgQlQgVG9wOiAwMC4wMC4wMC4wMA0K
PiA+Pj4gWyAgIDE4LjYzMTM2MF0gQmx1ZXRvb3RoOiBNR01UIHZlciAxLjIyDQo+ID4+PiBbICAg
MTguNjczMDIzXSBCbHVldG9vdGg6IFJGQ09NTSBUVFkgbGF5ZXIgaW5pdGlhbGl6ZWQNCj4gPj4+
IFsgICAxOC42NzMwMzFdIEJsdWV0b290aDogUkZDT01NIHNvY2tldCBsYXllciBpbml0aWFsaXpl
ZA0KPiA+Pj4gWyAgIDE4LjY3MzAzOV0gQmx1ZXRvb3RoOiBSRkNPTU0gdmVyIDEuMTENCj4gPj4N
Cj4gPj4gVGhhbmsgeW91IGZvciBwYXN0aW5nIHRoaXMuIEl04oCZZCBiZSBncmVhdCBpZiB5b3Ug
YWRkZWQgaXQgdG8gdGhlDQo+ID4+IGNvbW1pdCBtZXNzYWdlLCBzbyBhYm92ZSAtLS0uDQo+ID4N
Cj4gPiBPay4gSSB3aWxsIGhhdmUgaXQgcGFydCBvZiBjb21taXQgbWVzc2FnZS4NCj4gDQo+IFRo
YW5rIHlvdS4NCj4gDQo+IEJ5IHRoZSB3YXksIEkgaGFkIHdyaXR0ZW4gc29tZSBtb3JlIGNvbW1l
bnRzIGJlbG93LiBJdCBsb29rcyBsaWtlIHlvdQ0KPiBvdmVybG9va2VkIHRoZW0uDQo+DQpZZXMu
ICBNeSBiYWQuICBQbGVhc2Ugc2VlIHRoZSByZXNwb25zZSBiZWxvdy4NCiANCj4gPj4+ICAgIGRy
aXZlcnMvYmx1ZXRvb3RoL2J0aW50ZWwuYyB8IDM4DQo+ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0NCj4gPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmx1ZXRv
b3RoL2J0aW50ZWwuYw0KPiA+Pj4gYi9kcml2ZXJzL2JsdWV0b290aC9idGludGVsLmMgaW5kZXgg
NmJhN2Y1ZDFiODM3Li45MzRhYWQ4OWJiZjENCj4gPj4+IDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJp
dmVycy9ibHVldG9vdGgvYnRpbnRlbC5jDQo+ID4+PiArKysgYi9kcml2ZXJzL2JsdWV0b290aC9i
dGludGVsLmMNCj4gPj4+IEBAIC01MjEsNiArNTIxLDkgQEAgc3RhdGljIGludCBidGludGVsX3Zl
cnNpb25faW5mb190bHYoc3RydWN0DQo+ID4+PiBoY2lfZGV2DQo+ID4+ICpoZGV2LA0KPiA+Pj4g
ICAgCQkJICAgIHZlcnNpb24tPm1pbl9md19idWlsZF9ubiwgdmVyc2lvbi0NCj4gbWluX2Z3X2J1
aWxkX2N3LA0KPiA+Pj4gICAgCQkJICAgIDIwMDAgKyB2ZXJzaW9uLT5taW5fZndfYnVpbGRfeXkp
Ow0KPiA+Pj4gICAgCQlicmVhazsNCj4gPj4+ICsJY2FzZSAweDAyOg0KPiA+Pj4gKwkJdmFyaWFu
dCA9ICJJTUwiOw0KPiA+Pg0KPiA+PiBXaGF0IGRvZXMgSU1MIG1lYW4/DQpJbnRlcm1lZGlhdGUg
bG9hZGVyLg0KPiA+Pg0KPiA+Pj4gKwkJYnJlYWs7DQo+ID4+PiAgICAJY2FzZSAweDAzOg0KPiA+
Pj4gICAgCQl2YXJpYW50ID0gIkZpcm13YXJlIjsNCj4gPj4+ICAgIAkJYnJlYWs7DQo+ID4+PiBA
QCAtMjE5NCwxMCArMjE5NywyNiBAQCBzdGF0aWMgdm9pZCBidGludGVsX2dldF9md19uYW1lX3Rs
dihjb25zdA0KPiA+PiBzdHJ1Y3QgaW50ZWxfdmVyc2lvbl90bHYgKnZlciwNCj4gPj4+ICAgIAkJ
CQkgICAgY2hhciAqZndfbmFtZSwgc2l6ZV90IGxlbiwNCj4gPj4+ICAgIAkJCQkgICAgY29uc3Qg
Y2hhciAqc3VmZml4KQ0KPiA+Pj4gICAgew0KPiA+Pj4gKwljb25zdCBjaGFyICpmb3JtYXQ7DQo+
ID4+PiAgICAJLyogVGhlIGZpcm13YXJlIGZpbGUgbmFtZSBmb3IgbmV3IGdlbmVyYXRpb24gY29u
dHJvbGxlcnMgd2lsbCBiZQ0KPiA+Pj4gICAgCSAqIGlidC08Y252aV90b3AgdHlwZStjbnZpX3Rv
cCBzdGVwPi08Y252cl90b3AgdHlwZStjbnZyX3RvcCBzdGVwPg0KPiA+Pj4gICAgCSAqLw0KPiA+
Pj4gLQlzbnByaW50Zihmd19uYW1lLCBsZW4sICJpbnRlbC9pYnQtJTA0eC0lMDR4LiVzIiwNCj4g
Pj4+ICsJc3dpdGNoIChJTlRFTF9IV19WQVJJQU5UKHZlci0+Y252aV9idCkpIHsNCj4gPj4+ICsJ
LyogT25seSBCbGF6YXItSSAoMHgxZSkgcHJvZHVjdCBzdXBwb3J0cyBkb3dubG9hZGluZyBvZiBz
ZWNvbmRhcnkNCj4gYm9vdA0KPiA+Pj4gKwkgKiBsb2FkZXIgaW1hZ2UNCj4gPj4+ICsJICovDQo+
ID4+PiArCWNhc2UgMHgxZToNCj4gPj4NCj4gPj4gU2hvdWxkIGEgbWFjcm8gYmUgZGVmaW5lZCBm
b3IgMHgxZT8NCkFjay4gDQo+ID4+DQo+ID4+PiArCQlpZiAodmVyLT5pbWdfdHlwZSA9PSAxKQ0K
PiA+Pg0KPiA+PiBCZWxvdyB5b3Ugd3JpdGUgMHgweC4gU2hvdWxkIHRoaXMgYmUgY29uc2lzdGVu
dD8NCkFjaw0KPiA+Pg0KPiA+Pj4gKwkJCWZvcm1hdCA9ICJpbnRlbC9pYnQtJTA0eC0lMDR4LTAy
LiVzIjsNCj4gPj4+ICsJCWVsc2UNCj4gPj4+ICsJCQlmb3JtYXQgPSAiaW50ZWwvaWJ0LSUwNHgt
JTA0eC4lcyI7DQo+ID4+PiArCQlicmVhazsNCj4gPj4+ICsJZGVmYXVsdDoNCj4gPj4+ICsJCQlm
b3JtYXQgPSAiaW50ZWwvaWJ0LSUwNHgtJTA0eC4lcyI7DQo+ID4+PiArCQlicmVhazsNCj4gPj4+
ICsJfQ0KPiA+Pj4gKw0KPiA+Pj4gKwlzbnByaW50Zihmd19uYW1lLCBsZW4sIGZvcm1hdCwNCj4g
Pj4+ICAgIAkJIElOVEVMX0NOVlhfVE9QX1BBQ0tfU1dBQihJTlRFTF9DTlZYX1RPUF9UWVBFKHZl
ci0NCj4gY252aV90b3ApLA0KPiA+Pj4gICAgCQkJCQkgIElOVEVMX0NOVlhfVE9QX1NURVAodmVy
LQ0KPiBjbnZpX3RvcCkpLA0KPiA+Pj4gICAgCQkgSU5URUxfQ05WWF9UT1BfUEFDS19TV0FCKElO
VEVMX0NOVlhfVE9QX1RZUEUodmVyLQ0KPiBjbnZyX3RvcCksDQo+ID4+PiBAQCAtMjYwNyw2ICsy
NjI2LDIzIEBAIHN0YXRpYyBpbnQNCj4gPj4+IGJ0aW50ZWxfYm9vdGxvYWRlcl9zZXR1cF90bHYo
c3RydWN0DQo+ID4+IGhjaV9kZXYgKmhkZXYsDQo+ID4+PiAgICAJaWYgKGVycikNCj4gPj4+ICAg
IAkJcmV0dXJuIGVycjsNCj4gPj4+DQo+ID4+PiArCWVyciA9IGJ0aW50ZWxfcmVhZF92ZXJzaW9u
X3RsdihoZGV2LCB2ZXIpOw0KPiA+Pj4gKwlpZiAoZXJyKQ0KPiA+Pj4gKwkJcmV0dXJuIGVycjsN
Cj4gPj4+ICsNCj4gPj4+ICsgICAgLyogSWYgaW1hZ2UgdHlwZSByZXR1cm5lZCBpcyAweDAyLCB0
aGVuIGNvbnRyb2xsZXIgc3VwcG9ydHMgc2Vjb25kYXJ5DQo+ID4+PiArICAgICAqIGJvb3QgbG9h
ZGVyIGltYWdlDQo+ID4+PiArICAgICAqLw0KPiA+Pj4gKwlpZiAodmVyLT5pbWdfdHlwZSA9PSAw
eDAyKSB7DQo+ID4+DQo+ID4+IENvdWxkIGEgbWFjcm8gYmUgZGVmaW5lZCBmb3IgMHgwMj8NCkFj
aw0KDQo+ID4+DQo+ID4+PiArCQllcnIgPSBidGludGVsX3ByZXBhcmVfZndfZG93bmxvYWRfdGx2
KGhkZXYsIHZlciwNCj4gJmJvb3RfcGFyYW0pOw0KPiA+Pj4gKwkJaWYgKGVycikNCj4gPj4+ICsJ
CQlyZXR1cm4gZXJyOw0KPiA+Pj4gKw0KPiA+Pj4gKwkJZXJyID0gYnRpbnRlbF9ib290KGhkZXYs
IGJvb3RfcGFyYW0pOw0KPiA+Pj4gKwkJaWYgKGVycikNCj4gPj4+ICsJCQlyZXR1cm4gZXJyOw0K
PiA+Pj4gKwl9DQo+ID4+PiArDQo+ID4+PiAgICAJYnRpbnRlbF9jbGVhcl9mbGFnKGhkZXYsIElO
VEVMX0JPT1RMT0FERVIpOw0KPiA+Pj4NCj4gPj4+ICAgIAlidGludGVsX2dldF9md19uYW1lX3Rs
dih2ZXIsIGRkY25hbWUsIHNpemVvZihkZGNuYW1lKSwgImRkYyIpOw0KPiANCj4gDQo+IEtpbmQg
cmVnYXJkcywNCj4gDQo+IFBhdWwNCg0KVGhhbmtzLA0KS2lyYW4NCg==

