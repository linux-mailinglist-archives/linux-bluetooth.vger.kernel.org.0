Return-Path: <linux-bluetooth+bounces-2263-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC38586FBB4
	for <lists+linux-bluetooth@lfdr.de>; Mon,  4 Mar 2024 09:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 394C7B20B3E
	for <lists+linux-bluetooth@lfdr.de>; Mon,  4 Mar 2024 08:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED92C17C7C;
	Mon,  4 Mar 2024 08:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MweGBF5F"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C093618040
	for <linux-bluetooth@vger.kernel.org>; Mon,  4 Mar 2024 08:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540476; cv=fail; b=PQo/aMDf/YojdUTZ1gseutxGESbwEL+6TqY92clFI5jo0JPkfZc4/4szv5zqgE+ijdZKafyB5fC8iso2BBypHrd6I+gq6QvoQIDc+iJl474yc+oO6AnUePE7t+lnR6OjKrIfT2/XL4eb2c1DpJio4F9ImWX0pYRsiIx3f9XoGbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540476; c=relaxed/simple;
	bh=96AjuuVaTIwuHuDrBAzz3k98NP8/gyhRFTwCO9yzMVE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AUVps+6k5pOMzO+5IUPE8DSuCtFxBTkvEDsz6fphzEZ4jwy2ndgcl7abnldg77p/Um/pLc6Y4FYLPdjVsjb/ZPSkI7ZswarZn8LOtkC53nhZqxI8Q/R8oUCsYl0N3+iCzXg8p1fn7mMunmMNyFzXNi/2+FpSVkIUgEZAkDT330c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MweGBF5F; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709540473; x=1741076473;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=96AjuuVaTIwuHuDrBAzz3k98NP8/gyhRFTwCO9yzMVE=;
  b=MweGBF5FpumRusc7QhGnL/WmNCL6e/4aJpkgd6vg5Qjqt39qTgqGR3Uq
   BRXFD9H4TWcsCHrJkGF/Z7eURahnRhDQRemiGGQ6K+a/vxo3FZHt8j5T4
   JJHOAnyNXZBAzegAP0o08eXIQmmvsS4KkK3yHVdTVHy1Ok8nQ7T6pMrRt
   FcN6bpAlNNmemnKsp4LdY9nQF1Kzb6Y9AQXPNLD6B8PeLIsA0uipyG9V/
   xd9mHeArKo7X4LEalH92JTZvVJzAGAuZ/73D2ewPptvPGhzQieGxcqP70
   ZjsPPwqqbcBrsgM18AurbDSKORhj8TaoXHOAFAFB6IJuAMYurvZKAoE2v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7788967"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="7788967"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 00:21:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8983077"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Mar 2024 00:21:13 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 00:21:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 00:21:11 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 00:21:11 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 00:21:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQpnHCb6F+qCodC8LENz3mbiVDMvodA1qHFD/HGmIsz7NubkCtoVtTRzULMXbHFtnV+vKTKYdqpgfpczjTxGgA2Seq1/53sX0C1Cc9iKTVsOqxmizwULYXaIreToYDQJPeqgkzGYR4flLf3qbiSBDcD4iPro8W71BIebq8OagfWHpv/oSw82tedltqKb281uYmfvgCLmdaGyxjt+aWPldS9d1Ko7dh2i/LV3sl68Vvj6J4yfXuNacouRvxK78sTGs3180iNmjzOwo/rdbDkpv55iQ54Sh25ZAuu5YS/ahiRuRBjNE9E/hFFU/w6l8cSbD7VU97MLCWWaXPd+FFggcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96AjuuVaTIwuHuDrBAzz3k98NP8/gyhRFTwCO9yzMVE=;
 b=WVU27PQuRMxyDwxBsJWAqs5n3VF28HmGEzViS9vlj76101javWaQfG63ln+MHwqCLJSRUZCudYKTXTl/rP6oE28HXR2mpiUNHjfSIKNB7uqRb39IEyO7aJqtC1BF8jQzV/a4jrRFT/Kn7lrSqdpUMK9xwBX76aQUBSkDR29yr60X6bUc/lMSR+/EVI7P2Svnwic5nxsrHbI0Ce7vru/0ok6v6ErNfuga/pfnpjn9bN5LzjbMwirmu6BSxb9bZET6wHMMmk0v25rR0hnwIylzGCu5QnDl3nksbRmpV7DP/I0svuMp4zjunWkPRAJDr5Co2dIUKu8h5FAdEecr3+jDzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB7585.namprd11.prod.outlook.com (2603:10b6:510:28f::10)
 by CH3PR11MB7916.namprd11.prod.outlook.com (2603:10b6:610:131::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 08:21:09 +0000
Received: from PH0PR11MB7585.namprd11.prod.outlook.com
 ([fe80::b517:edd4:27fa:580e]) by PH0PR11MB7585.namprd11.prod.outlook.com
 ([fe80::b517:edd4:27fa:580e%7]) with mapi id 15.20.7339.019; Mon, 4 Mar 2024
 08:21:09 +0000
From: "K, Kiran" <kiran.k@intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
CC: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
	"Srivatsa, Ravishankar" <ravishankar.srivatsa@intel.com>, "Tumkur Narayan,
 Chethan" <chethan.tumkur.narayan@intel.com>
Subject: RE: [PATCH v1] Bluetooth: btintel: Add support for downloading
 secondary boot loader image
Thread-Topic: [PATCH v1] Bluetooth: btintel: Add support for downloading
 secondary boot loader image
Thread-Index: AQHaa8C7aSRNyxzoN0WLksWEYDCp87EiucwAgARywMA=
Date: Mon, 4 Mar 2024 08:21:09 +0000
Message-ID: <PH0PR11MB7585A403D6FF95B34DF981B8F5232@PH0PR11MB7585.namprd11.prod.outlook.com>
References: <20240301102412.11151-1-kiran.k@intel.com>
 <c4f91a66-2890-4e76-bc01-42dd0c9a17dd@molgen.mpg.de>
In-Reply-To: <c4f91a66-2890-4e76-bc01-42dd0c9a17dd@molgen.mpg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7585:EE_|CH3PR11MB7916:EE_
x-ms-office365-filtering-correlation-id: c23fc47f-6824-4ce0-1251-08dc3c240bc5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VFzH/qjGjtrCv3HOD++GAgEgys/P6Usxpwvz5/3ioTX66piB1BLur9SBy2x7FF/CbX4qpeWSN1dTdTdWfLjQSRWYH2aE+icwsnZ/j7c8YqJeO382EGNqgxrS5fzeHjtF45fyZ3wePVmz0eFW6fJOOJCZUd14XQXwZqYjR08IjqBxdGOZUJ0XVJWiUS3HUdBHrS8eiFmVV3kGZEU/8+Y6S941uJPZXZxiNBqkdUnpexw7KNtRN+TVhXSG/QBlqhnOFUxcAu8uKECugKbZRwkdgnIZFGNPPeCS39lAhVqJiyEkSvsQGJFzY9u3GNryJfIPKcd+F9BYM2RHHWfNlD4POZvVbodHWSiQan9QgqyYzsQZ9o1SOXKg0c1fqn5RWuCJzOjY8Hjb8aTfr1U8UrRPK9E+7CcZ651+kTvVRxjUQqu2RE2hFw9naBjM2Za1rcpg25HWRFRUwZTs3EbC3+acDhteamlHSF8tmzZxtj80ZCHM+0hYESnL7yloSsjTBbyirJvAAtagy8KvIX6lK4hk58jYPiFdb2sPuKlbz0XG+CxrBboAnj+m08D4eE/m8J+w6vIhEmAclKsk0x3hWnSwF6ExH2VVZ0ICYpkZ19dWIwKXp3Hs24P5w3L9EIIgRSzV1wsWxHCBL5CcchzDJ/cGE1nmLXcmrq1r7O3rgjMDRIKhWIx7Ko4ljHBcDEodVDz/w1vGVDP3a6BwydyMl6kwDcXYp7i0tC9/2E+k43+orM4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7585.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXVYeENkTFJ2TU82MjhjRnBKWHBpWHhTMU5RSGNNNmNDdUpubVAyWVpwVUgr?=
 =?utf-8?B?dmZTa3FUdWFZNnhEaFpFY1NSZUNEYklsVlB0VC9XUm1RSzZxTDY4RGQ2SGMz?=
 =?utf-8?B?U2Q2eFNYcjhZUnlRSC8zbFAwZXhhTDQvb1QwakdHSlFmQ0I2c0FVaTluSmZx?=
 =?utf-8?B?OUk2MWl4b2h4b0VnbUlyNjNwcGk0RmtORitWakdDWXZ6UEdBcXloODB0WkNu?=
 =?utf-8?B?WmVMZ3F2eFRWT1J0WU5GRUhDTWwvaWJXNDhWNlZZNC9VaWw0eTAybkxVNDBT?=
 =?utf-8?B?RE4yYlRteVNPN2JKcTMzbjhMWUgxQklnQjZKSnVTbXYxZDBEVzNsSmMzcHJN?=
 =?utf-8?B?SnhjOFlPQTkzWjRuVGtTL3p0VTNtYjZQVS9SRkRMdG4yem9CajBxQTRUS2di?=
 =?utf-8?B?aE92RmRjWlg0b2RBKys3R0ZVeXcxbUFsZ0lhcFY2cFdsVkIybENoN25YeThk?=
 =?utf-8?B?VjhKUHJ4WngvK3puOXBpK1FyTmJFZ1N4L1RlMlF2WTNKYTYxMkJHTTZzWDZZ?=
 =?utf-8?B?ZkRDU3F0TEFuZWd0N2JEaGRBaCsxUHpwbkFtTU1kcERCSE40eGVLNzVTVHFy?=
 =?utf-8?B?U0JwdEtNYVppWVQ2REdjWUlCU1dZaEY2RHZsOWdESVcrRHovdWJBRFQ4b2oz?=
 =?utf-8?B?NW83NDdDVHhKV3BpajNXNDNhMXQ2aElxbGxiWFR0OXdXL3FCaWQ5RStjUmFW?=
 =?utf-8?B?OEwzbVJDbTV6OXpMVnlONTZXZGxpRFNNS2hDTlNkR1hoOGRFVXd0N0NuZllL?=
 =?utf-8?B?Ry95RW1rTm5ONERBZlZ1TjE0QTVaeWMrQ3Q0d2NoZmY1L2MyUzNTR1A2bUd6?=
 =?utf-8?B?OUw2N085eWE3b3RKWFZ3UUU1cU5jdU85Nm5LU1YrSUYwZUlCZTFvREVDdzJH?=
 =?utf-8?B?MGRZVVlRaDJJb1Z0ZVVZK3piYUR5ZDQ3bVFuNEVCbFdod1pWZnFOQWlkUURM?=
 =?utf-8?B?RmtvVjFvRXo5Y3NRM1lLN2VyS0h3cW5HajZmZnh6YXA5b1ZZYzlqS25KTk5t?=
 =?utf-8?B?dlNJL3dsZWFXemR1Yktsanl1U2cwMFVXNDd1bnFjZE5RVjBWQVhTYUx6Nmho?=
 =?utf-8?B?NCs2Z0swM2xrUXAzZXJ5VHdGcDhaT0NwZUI1anlTQ0NSckJkWExmQ3hPcFMr?=
 =?utf-8?B?WVFXZlVYaXZEOVpwTy9TMTVnc0VWVzRLb01tZVdjMDhqeGdzZ2RkNU9oc3N2?=
 =?utf-8?B?MnNhcjQ4cmtTTzJmeDlKZFJsRUptYXpVNGxVSzNCL1oxZUhibWsxQkg0RTd6?=
 =?utf-8?B?S2ZkVmNteW9FbkJzL3ZjNHZOS0tXSTE1R1BtY2ViVUZKazVydS9uNm9vTnZT?=
 =?utf-8?B?Mm0xcnFlUGFmT2V0eUtyL2x4RXN3d0lENDY5d3BmaGxSUFlWU2JlYWZTakZJ?=
 =?utf-8?B?Y0hsa0hLVkxDZ1VXcmhPYVZYQjdGNVdCa2I3dTVSaXREUlNSaEdxYXh0Yy92?=
 =?utf-8?B?N0ZDb1RxcUp1dXZaNytad0pJTitYNTlYOVpLNlppa0l2RXo4cUQzdGJvZ0F6?=
 =?utf-8?B?VVBFa3VhNTUzcU5EWFE5UGdZaHdrMTEvZCsyV2EzeW12a0txQzQvYVJmYTJk?=
 =?utf-8?B?Vmg4SzZTVDA1dHhDY3J6NXJ1Vmp3ZXlzVEpCMUZYQ2tPemNmRjNNc0xmRDBq?=
 =?utf-8?B?bFA4UDFmbmxYbmY0NC9QYnM4YWFPanduYVdRcE81SFBodDJCd2NuNHA3TjMr?=
 =?utf-8?B?cllSbk9SZ1FsR0FYcHVncDUwSDQ0VDYyR1VSRis0YlZmZzg4WVh3MkF4MFhx?=
 =?utf-8?B?MmtLY0U4bzNBbngwTStyN1I0YmYwbTNaWUFsUm1temI3MVNmdE5qYXZENFFT?=
 =?utf-8?B?L2ltZVpibEFsVmR6VVdUM2xnUGRmajArVTBpOXNrMWlMNUVNZjdpK2VGODJC?=
 =?utf-8?B?eW9zWmkvalN1YkpoYlIzR0d3dVJsL0xvK0EwSlNkaXRERkxTMzhTV3BPRzJl?=
 =?utf-8?B?dG1aU2hrYVNPRHVKaW1ycVdpTHNiMzU1R05EM05SVlI2QlM4cVdiSWEyOGhO?=
 =?utf-8?B?c05HRFF0UnEwM1VGUGQ4bWI5aUZzOWxmZFJFMTR6bmk2UTVLL1JyenBNc2tZ?=
 =?utf-8?B?ZDFqbE95RnB2djh4ajB1dVVhSS96Y0t1NXIzZU02UEV0cDFxVWNkUHlXRWRj?=
 =?utf-8?Q?CbBE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c23fc47f-6824-4ce0-1251-08dc3c240bc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2024 08:21:09.3685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RuJW13e2VKBQ5Q0bJzGQ3LwZMXHjpJmwb8RKMga1D07dkhD4M1XIS97mOclX4nBMAZis/bIxCgtNg/gRu8jF4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7916
X-OriginatorOrg: intel.com

SGkgUGF1bCwNCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IFBhdWwgTWVuemVsIDxwbWVuemVsQG1vbGdlbi5tcGcuZGU+
DQo+IFNlbnQ6IEZyaWRheSwgTWFyY2ggMSwgMjAyNCA0OjM4IFBNDQo+IFRvOiBLLCBLaXJhbiA8
a2lyYW4ua0BpbnRlbC5jb20+DQo+IENjOiBsaW51eC1ibHVldG9vdGhAdmdlci5rZXJuZWwub3Jn
OyBTcml2YXRzYSwgUmF2aXNoYW5rYXINCj4gPHJhdmlzaGFua2FyLnNyaXZhdHNhQGludGVsLmNv
bT47IFR1bWt1ciBOYXJheWFuLCBDaGV0aGFuDQo+IDxjaGV0aGFuLnR1bWt1ci5uYXJheWFuQGlu
dGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MV0gQmx1ZXRvb3RoOiBidGludGVsOiBB
ZGQgc3VwcG9ydCBmb3IgZG93bmxvYWRpbmcNCj4gc2Vjb25kYXJ5IGJvb3QgbG9hZGVyIGltYWdl
DQo+IA0KPiBEZWFyIEtpcmFuLA0KPiANCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBwYXRjaC4N
Cj4gDQo+IA0KPiBBbSAwMS4wMy4yNCB1bSAxMToyNCBzY2hyaWViIEtpcmFuIEs6DQo+ID4gU29t
ZSB2YXJpYW50cyBvZiBJbnRlbCBjb250cm9sbGVycyBsaWtlIEJsYXphckkgc3VwcG9ydHMgZG93
bmxvYWRpbmcNCj4gPiBvZg0KPiANCj4gc3VwcG9ydA0KPiANCj4gSW4gdGhlIGRpZmYgeW91IHdy
aXRlIEJsYXphci1JLg0KDQpPay4gSSB3aWxsIGZpeCBpdCBpbiB0aGUgbmV4dCBwYXRjaC4NCj4g
DQo+ID4gc2Vjb25kYXJ5IGJvb3Rsb2FkZXIuIFRoaXMgcGF0Y2ggYWRkcyB0aGUgc3VwcG9ydCB0
byBkb3dubG9hZA0KPiA+IHNlY29uZGFyeSBib290IGxvYWRlciBpbWFnZSBiZWZvcmUgZG93bmxv
YWRpbmcgb3BlcmF0aW9uYWwgZmlybXdhcmUNCj4gaW1hZ2UuDQo+IA0KPiBXaGF0IGlzIHRoZSBz
ZWNvbmRhcnkgYm9vdGxvYWRlciBuZWVkZWQgZm9yPw0KPiANClByaW1hcnkgYm9vdGxvYWRlciBp
cyBmbGFzaGVkIG92ZXIgUk9NIGFuZCBhbnkgaXNzdWVzIGZvdW5kIG9uY2UgdGhlIHByb2R1Y3Qg
cmVsZWFzZWQgdG8gbWFya2V0IGlzIGhhcmQgLyBpbXBvc3NpYmxlIHRvIGZpeC4gU28gaWRlYSBp
cyB0byBrZWVwIHByaW1hcnkgYm9vdGxvYWRlciBtaW5pbWFsIGFuZCBoYXZlIHNlY29uZGFyeSBi
b290bG9hZGVyLg0KDQo+ID4gU2lnbmVkLW9mZi1ieTogS2lyYW4gSyA8a2lyYW4ua0BpbnRlbC5j
b20+DQo+ID4gLS0tDQo+ID4gZG1lc2cgbG9nczoNCj4gPiBbICAgMTYuNTM3MTMwXSBCbHVldG9v
dGg6IENvcmUgdmVyIDIuMjINCj4gPiBbICAgMTYuNTM3MTM1XSBCbHVldG9vdGg6IFN0YXJ0aW5n
IHNlbGYgdGVzdGluZw0KPiA+IFsgICAxNi41NDAwMjFdIEJsdWV0b290aDogRUNESCB0ZXN0IHBh
c3NlZCBpbiAyODE4IHVzZWNzDQo+ID4gWyAgIDE2LjU2MDY2Nl0gQmx1ZXRvb3RoOiBTTVAgdGVz
dCBwYXNzZWQgaW4gNjAyIHVzZWNzDQo+ID4gWyAgIDE2LjU2MDY3NF0gQmx1ZXRvb3RoOiBGaW5p
c2hlZCBzZWxmIHRlc3RpbmcNCj4gPiBbICAgMTYuNTYwNjkwXSBCbHVldG9vdGg6IEhDSSBkZXZp
Y2UgYW5kIGNvbm5lY3Rpb24gbWFuYWdlciBpbml0aWFsaXplZA0KPiA+IFsgICAxNi41NjA2OTVd
IEJsdWV0b290aDogSENJIHNvY2tldCBsYXllciBpbml0aWFsaXplZA0KPiA+IFsgICAxNi41NjA2
OTddIEJsdWV0b290aDogTDJDQVAgc29ja2V0IGxheWVyIGluaXRpYWxpemVkDQo+ID4gWyAgIDE2
LjU2MDcwMF0gQmx1ZXRvb3RoOiBTQ08gc29ja2V0IGxheWVyIGluaXRpYWxpemVkDQo+ID4gWyAg
IDE2LjU3MTkzNF0gQmx1ZXRvb3RoOiBoY2kwOiBEZXZpY2UgcmV2aXNpb24gaXMgMA0KPiA+IFsg
ICAxNi41NzE5NDBdIEJsdWV0b290aDogaGNpMDogU2VjdXJlIGJvb3QgaXMgZGlzYWJsZWQNCj4g
PiBbICAgMTYuNTcxOTQxXSBCbHVldG9vdGg6IGhjaTA6IE9UUCBsb2NrIGlzIGRpc2FibGVkDQo+
ID4gWyAgIDE2LjU3MTk0Ml0gQmx1ZXRvb3RoOiBoY2kwOiBBUEkgbG9jayBpcyBlbmFibGVkDQo+
ID4gWyAgIDE2LjU3MTk0M10gQmx1ZXRvb3RoOiBoY2kwOiBEZWJ1ZyBsb2NrIGlzIGRpc2FibGVk
DQo+ID4gWyAgIDE2LjU3MTk0M10gQmx1ZXRvb3RoOiBoY2kwOiBNaW5pbXVtIGZpcm13YXJlIGJ1
aWxkIDEgd2VlayAxMCAyMDE0DQo+ID4gWyAgIDE2LjU3MTk0NV0gQmx1ZXRvb3RoOiBoY2kwOiBC
b290bG9hZGVyIHRpbWVzdGFtcCAyMDIyLjQ2IGJ1aWxkdHlwZSAxDQo+IGJ1aWxkIDI2NTkwDQo+
ID4gWyAgIDE2LjU3MjE4OV0gQmx1ZXRvb3RoOiBoY2kwOiBEU00gcmVzZXQgbWV0aG9kIHR5cGU6
IDB4MDANCj4gPiBbICAgMTYuNTc1MDAyXSBCbHVldG9vdGg6IGhjaTA6IEZvdW5kIGRldmljZSBm
aXJtd2FyZTogaW50ZWwvaWJ0LTAwOTAtMDI5MS0NCj4gMDIuc2ZpDQo+ID4gWyAgIDE2LjU3NTAw
N10gQmx1ZXRvb3RoOiBoY2kwOiBCb290IEFkZHJlc3M6IDB4MzAwOTkwMDANCj4gPiBbICAgMTYu
NTc1MDA4XSBCbHVldG9vdGg6IGhjaTA6IEZpcm13YXJlIFZlcnNpb246IDIwMC0xMC4yNA0KPiA+
IFsgICAxNi43MDU2OThdIEJsdWV0b290aDogaGNpMDogV2FpdGluZyBmb3IgZmlybXdhcmUgZG93
bmxvYWQgdG8gY29tcGxldGUNCj4gPiBbICAgMTYuNzA1OTI3XSBCbHVldG9vdGg6IGhjaTA6IEZp
cm13YXJlIGxvYWRlZCBpbiAxMjc4NTIgdXNlY3MNCj4gDQo+IFVucmVsYXRlZCwgIGJ1dCB0aGlz
IGlzIHF1aXRlIGxvbmcuDQpJIGNhbiBwYXNzIG9uIHRoaXMgaW5mb3JtYXRpb24gdG8gZmlybXdh
cmUuIEkgZmVlbCB0aGlzIHNlZW1zIHRvIGJlIE9LIGFzIHRoZSBtYXhpbXVtIHRpbWVvdXQgZm9y
IGZpcm13YXJlIGRvd25sb2FkIGlzIDUgc2Vjb25kcy4NCj4gDQo+ID4gWyAgIDE2LjcwNTk1Ml0g
Qmx1ZXRvb3RoOiBoY2kwOiBXYWl0aW5nIGZvciBkZXZpY2UgdG8gYm9vdA0KPiA+IFsgICAxNi43
MDg1MTldIEJsdWV0b290aDogaGNpMDogRGV2aWNlIGJvb3RlZCBpbiAyNTIyIHVzZWNzDQo+ID4g
WyAgIDE2LjcwODUzOF0gQmx1ZXRvb3RoOiBoY2kwOiBNYWxmb3JtZWQgTVNGVCB2ZW5kb3IgZXZl
bnQ6IDB4MDINCj4gDQo+IChVbnJlbGF0ZWQsIGJ1dCB0aGlzIGlzIHNob3duIG9uIGEgbG90IG9m
IGRldmljZXMuIE9uZSBtb3JlIHRpbWUgYmVsb3cuKQ0KPiANCj4gPiBbICAgMTYuNzEwMjk2XSBC
bHVldG9vdGg6IGhjaTA6IE5vIGRldmljZSBhZGRyZXNzIGNvbmZpZ3VyZWQNCj4gPiBbICAgMTYu
NzEyNDgzXSBCbHVldG9vdGg6IGhjaTA6IEZvdW5kIGRldmljZSBmaXJtd2FyZTogaW50ZWwvaWJ0
LTAwOTAtDQo+IDAyOTEuc2ZpDQo+ID4gWyAgIDE2LjcxMjQ5N10gQmx1ZXRvb3RoOiBoY2kwOiBC
b290IEFkZHJlc3M6IDB4MTAwMDA4MDANCj4gPiBbICAgMTYuNzEyNDk4XSBCbHVldG9vdGg6IGhj
aTA6IEZpcm13YXJlIFZlcnNpb246IDIxMS0xMC4yNA0KPiANCg0KPiBJdOKAmXMgdW5jbGVhciBm
cm9tIHRoZSBsb2dzLCB3aHkgdHdvIGZpcm13YXJlIGZpbGVzICh3aXRoIGRpZmZlcmVudA0KPiB2
ZXJzaW9ucykgYXJlIGxvYWRlZC4NCj4gDQpPbmUgaXMgc2Vjb25kYXJ5IGJvb3Rsb2FkZXIgKGli
dC0wMDkwLTAyOTEtMDIuc2ZpKSAgYW5kIHRoZSBvdGhlciBvbmUgaXMgb3BlcmF0aW9uYWwgZmly
bXdhcmUgKGlidC0wMDkwLTAyOTEuc2ZpKSAuICBJdCdzIHBvc3NpYmxlIHRvIGhhdmUgZGlmZmVy
ZW50IHZlcnNpb24uDQoNCj4gPiBbICAgMTYuOTMwODM0XSBCbHVldG9vdGg6IEJORVAgKEV0aGVy
bmV0IEVtdWxhdGlvbikgdmVyIDEuMw0KPiA+IFsgICAxNi45MzA4NDBdIEJsdWV0b290aDogQk5F
UCBmaWx0ZXJzOiBwcm90b2NvbCBtdWx0aWNhc3QNCj4gPiBbICAgMTYuOTMwODQ0XSBCbHVldG9v
dGg6IEJORVAgc29ja2V0IGxheWVyIGluaXRpYWxpemVkDQo+ID4gWyAgIDE4LjQ5NDEzN10gQmx1
ZXRvb3RoOiBoY2kwOiBXYWl0aW5nIGZvciBmaXJtd2FyZSBkb3dubG9hZCB0byBjb21wbGV0ZQ0K
PiA+IFsgICAxOC40OTQ4OTddIEJsdWV0b290aDogaGNpMDogRmlybXdhcmUgbG9hZGVkIGluIDE3
NDA2MzQgdXNlY3MNCj4gDQo+IEhtbSwgMS43IHNlY29uZHMgaXMgdmVyeSBsb25nLg0KPiANCj4g
PiBbICAgMTguNDk0OTcyXSBCbHVldG9vdGg6IGhjaTA6IFdhaXRpbmcgZm9yIGRldmljZSB0byBi
b290DQo+ID4gWyAgIDE4LjUyOTA4OV0gQmx1ZXRvb3RoOiBoY2kwOiBEZXZpY2UgYm9vdGVkIGlu
IDMzMzcxIHVzZWNzDQo+ID4gWyAgIDE4LjUyOTEyMV0gQmx1ZXRvb3RoOiBoY2kwOiBNYWxmb3Jt
ZWQgTVNGVCB2ZW5kb3IgZXZlbnQ6IDB4MDINCj4gPiBbICAgMTguNTI5OTE0XSBCbHVldG9vdGg6
IGhjaTA6IEZvdW5kIEludGVsIEREQyBwYXJhbWV0ZXJzOiBpbnRlbC9pYnQtMDA5MC0NCj4gMDI5
MS5kZGMNCj4gPiBbICAgMTguNTMyMTU4XSBCbHVldG9vdGg6IGhjaTA6IEFwcGx5aW5nIEludGVs
IEREQyBwYXJhbWV0ZXJzIGNvbXBsZXRlZA0KPiA+IFsgICAxOC41MzI1ODJdIEJsdWV0b290aDog
aGNpMDogRm91bmQgSW50ZWwgRERDIHBhcmFtZXRlcnM6DQo+IGludGVsL2JkYWRkcmVzcy5jZmcN
Cj4gPiBbICAgMTguNTM0MTA5XSBCbHVldG9vdGg6IGhjaTA6IEFwcGx5aW5nIEludGVsIEREQyBw
YXJhbWV0ZXJzIGNvbXBsZXRlZA0KPiA+IFsgICAxOC41MzcxNzBdIEJsdWV0b290aDogaGNpMDog
RmlybXdhcmUgdGltZXN0YW1wIDIwMjQuOSBidWlsZHR5cGUgMCBidWlsZA0KPiA1ODA2Nw0KPiA+
IFsgICAxOC41MzcxNzddIEJsdWV0b290aDogaGNpMDogRmlybXdhcmUgU0hBMTogMHg4MWFiZjFl
YQ0KPiA+IFsgICAxOC41NDA5ODVdIEJsdWV0b290aDogaGNpMDogRnNlcSBzdGF0dXM6IFN1Y2Nl
c3MgKDB4MDApDQo+ID4gWyAgIDE4LjU0MDk5Ml0gQmx1ZXRvb3RoOiBoY2kwOiBGc2VxIGV4ZWN1
dGVkOiAwMC4wMC4wMC4wMA0KPiA+IFsgICAxOC41NDA5OTNdIEJsdWV0b290aDogaGNpMDogRnNl
cSBCVCBUb3A6IDAwLjAwLjAwLjAwDQo+ID4gWyAgIDE4LjYzMTM2MF0gQmx1ZXRvb3RoOiBNR01U
IHZlciAxLjIyDQo+ID4gWyAgIDE4LjY3MzAyM10gQmx1ZXRvb3RoOiBSRkNPTU0gVFRZIGxheWVy
IGluaXRpYWxpemVkDQo+ID4gWyAgIDE4LjY3MzAzMV0gQmx1ZXRvb3RoOiBSRkNPTU0gc29ja2V0
IGxheWVyIGluaXRpYWxpemVkDQo+ID4gWyAgIDE4LjY3MzAzOV0gQmx1ZXRvb3RoOiBSRkNPTU0g
dmVyIDEuMTENCj4gDQo+IFRoYW5rIHlvdSBmb3IgcGFzdGluZyB0aGlzLiBJdOKAmWQgYmUgZ3Jl
YXQgaWYgeW91IGFkZGVkIGl0IHRvIHRoZSBjb21taXQNCj4gbWVzc2FnZSwgc28gYWJvdmUgLS0t
Lg0KDQpPay4gSSB3aWxsIGhhdmUgaXQgcGFydCBvZiBjb21taXQgbWVzc2FnZS4NCj4gDQo+ID4g
ICBkcml2ZXJzL2JsdWV0b290aC9idGludGVsLmMgfCAzOA0KPiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmx1ZXRvb3Ro
L2J0aW50ZWwuYyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0aW50ZWwuYw0KPiA+IGluZGV4IDZiYTdm
NWQxYjgzNy4uOTM0YWFkODliYmYxIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvYmx1ZXRvb3Ro
L2J0aW50ZWwuYw0KPiA+ICsrKyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0aW50ZWwuYw0KPiA+IEBA
IC01MjEsNiArNTIxLDkgQEAgc3RhdGljIGludCBidGludGVsX3ZlcnNpb25faW5mb190bHYoc3Ry
dWN0IGhjaV9kZXYNCj4gKmhkZXYsDQo+ID4gICAJCQkgICAgdmVyc2lvbi0+bWluX2Z3X2J1aWxk
X25uLCB2ZXJzaW9uLQ0KPiA+bWluX2Z3X2J1aWxkX2N3LA0KPiA+ICAgCQkJICAgIDIwMDAgKyB2
ZXJzaW9uLT5taW5fZndfYnVpbGRfeXkpOw0KPiA+ICAgCQlicmVhazsNCj4gPiArCWNhc2UgMHgw
MjoNCj4gPiArCQl2YXJpYW50ID0gIklNTCI7DQo+IA0KPiBXaGF0IGRvZXMgSU1MIG1lYW4/DQo+
IA0KPiA+ICsJCWJyZWFrOw0KPiA+ICAgCWNhc2UgMHgwMzoNCj4gPiAgIAkJdmFyaWFudCA9ICJG
aXJtd2FyZSI7DQo+ID4gICAJCWJyZWFrOw0KPiA+IEBAIC0yMTk0LDEwICsyMTk3LDI2IEBAIHN0
YXRpYyB2b2lkIGJ0aW50ZWxfZ2V0X2Z3X25hbWVfdGx2KGNvbnN0DQo+IHN0cnVjdCBpbnRlbF92
ZXJzaW9uX3RsdiAqdmVyLA0KPiA+ICAgCQkJCSAgICBjaGFyICpmd19uYW1lLCBzaXplX3QgbGVu
LA0KPiA+ICAgCQkJCSAgICBjb25zdCBjaGFyICpzdWZmaXgpDQo+ID4gICB7DQo+ID4gKwljb25z
dCBjaGFyICpmb3JtYXQ7DQo+ID4gICAJLyogVGhlIGZpcm13YXJlIGZpbGUgbmFtZSBmb3IgbmV3
IGdlbmVyYXRpb24gY29udHJvbGxlcnMgd2lsbCBiZQ0KPiA+ICAgCSAqIGlidC08Y252aV90b3Ag
dHlwZStjbnZpX3RvcCBzdGVwPi08Y252cl90b3AgdHlwZStjbnZyX3RvcCBzdGVwPg0KPiA+ICAg
CSAqLw0KPiA+IC0Jc25wcmludGYoZndfbmFtZSwgbGVuLCAiaW50ZWwvaWJ0LSUwNHgtJTA0eC4l
cyIsDQo+ID4gKwlzd2l0Y2ggKElOVEVMX0hXX1ZBUklBTlQodmVyLT5jbnZpX2J0KSkgew0KPiA+
ICsJLyogT25seSBCbGF6YXItSSAoMHgxZSkgcHJvZHVjdCBzdXBwb3J0cyBkb3dubG9hZGluZyBv
ZiBzZWNvbmRhcnkNCj4gYm9vdA0KPiA+ICsJICogbG9hZGVyIGltYWdlDQo+ID4gKwkgKi8NCj4g
PiArCWNhc2UgMHgxZToNCj4gDQo+IFNob3VsZCBhIG1hY3JvIGJlIGRlZmluZWQgZm9yIDB4MWU/
DQo+IA0KPiA+ICsJCWlmICh2ZXItPmltZ190eXBlID09IDEpDQo+IA0KPiBCZWxvdyB5b3Ugd3Jp
dGUgMHgweC4gU2hvdWxkIHRoaXMgYmUgY29uc2lzdGVudD8NCj4gDQo+ID4gKwkJCWZvcm1hdCA9
ICJpbnRlbC9pYnQtJTA0eC0lMDR4LTAyLiVzIjsNCj4gPiArCQllbHNlDQo+ID4gKwkJCWZvcm1h
dCA9ICJpbnRlbC9pYnQtJTA0eC0lMDR4LiVzIjsNCj4gPiArCQlicmVhazsNCj4gPiArCWRlZmF1
bHQ6DQo+ID4gKwkJCWZvcm1hdCA9ICJpbnRlbC9pYnQtJTA0eC0lMDR4LiVzIjsNCj4gPiArCQli
cmVhazsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlzbnByaW50Zihmd19uYW1lLCBsZW4sIGZvcm1h
dCwNCj4gPiAgIAkJIElOVEVMX0NOVlhfVE9QX1BBQ0tfU1dBQihJTlRFTF9DTlZYX1RPUF9UWVBF
KHZlci0NCj4gPmNudmlfdG9wKSwNCj4gPiAgIAkJCQkJICBJTlRFTF9DTlZYX1RPUF9TVEVQKHZl
ci0NCj4gPmNudmlfdG9wKSksDQo+ID4gICAJCSBJTlRFTF9DTlZYX1RPUF9QQUNLX1NXQUIoSU5U
RUxfQ05WWF9UT1BfVFlQRSh2ZXItDQo+ID5jbnZyX3RvcCksDQo+ID4gQEAgLTI2MDcsNiArMjYy
NiwyMyBAQCBzdGF0aWMgaW50IGJ0aW50ZWxfYm9vdGxvYWRlcl9zZXR1cF90bHYoc3RydWN0DQo+
IGhjaV9kZXYgKmhkZXYsDQo+ID4gICAJaWYgKGVycikNCj4gPiAgIAkJcmV0dXJuIGVycjsNCj4g
Pg0KPiA+ICsJZXJyID0gYnRpbnRlbF9yZWFkX3ZlcnNpb25fdGx2KGhkZXYsIHZlcik7DQo+ID4g
KwlpZiAoZXJyKQ0KPiA+ICsJCXJldHVybiBlcnI7DQo+ID4gKw0KPiA+ICsgICAgLyogSWYgaW1h
Z2UgdHlwZSByZXR1cm5lZCBpcyAweDAyLCB0aGVuIGNvbnRyb2xsZXIgc3VwcG9ydHMgc2Vjb25k
YXJ5DQo+ID4gKyAgICAgKiBib290IGxvYWRlciBpbWFnZQ0KPiA+ICsgICAgICovDQo+ID4gKwlp
ZiAodmVyLT5pbWdfdHlwZSA9PSAweDAyKSB7DQo+IA0KPiBDb3VsZCBhIG1hY3JvIGJlIGRlZmlu
ZWQgZm9yIDB4MDI/DQo+IA0KPiA+ICsJCWVyciA9IGJ0aW50ZWxfcHJlcGFyZV9md19kb3dubG9h
ZF90bHYoaGRldiwgdmVyLA0KPiAmYm9vdF9wYXJhbSk7DQo+ID4gKwkJaWYgKGVycikNCj4gPiAr
CQkJcmV0dXJuIGVycjsNCj4gPiArDQo+ID4gKwkJZXJyID0gYnRpbnRlbF9ib290KGhkZXYsIGJv
b3RfcGFyYW0pOw0KPiA+ICsJCWlmIChlcnIpDQo+ID4gKwkJCXJldHVybiBlcnI7DQo+ID4gKwl9
DQo+ID4gKw0KPiA+ICAgCWJ0aW50ZWxfY2xlYXJfZmxhZyhoZGV2LCBJTlRFTF9CT09UTE9BREVS
KTsNCj4gPg0KPiA+ICAgCWJ0aW50ZWxfZ2V0X2Z3X25hbWVfdGx2KHZlciwgZGRjbmFtZSwgc2l6
ZW9mKGRkY25hbWUpLCAiZGRjIik7DQo+IA0KPiANCj4gS2luZCByZWdhcmRzLA0KPiANCj4gUGF1
bA0KDQpUaGFua3MsDQpLaXJhbg0KDQo=

