Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307EC317159
	for <lists+linux-bluetooth@lfdr.de>; Wed, 10 Feb 2021 21:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232894AbhBJU17 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 10 Feb 2021 15:27:59 -0500
Received: from mga04.intel.com ([192.55.52.120]:4766 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233378AbhBJU0n (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 10 Feb 2021 15:26:43 -0500
IronPort-SDR: rJsHXLreoRAuj9h/yMSM/vVgwDZotcUJDVYdv7jWif8TGpDab8vmwx/zaoAp3PAyyXuOd/0m5F
 ebTMNdD09YCw==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="179589752"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; 
   d="scan'208";a="179589752"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 12:25:59 -0800
IronPort-SDR: 338lXNdEzuVFFKHMQKGv/9zs4+AdhpsrmOxd8hrVw7rqn8ucfryxQn1FKr5gwQdCRMhZeaMDub
 ex3DflO8BI+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; 
   d="scan'208";a="421192926"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2021 12:25:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 10 Feb 2021 12:25:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 10 Feb 2021 12:25:59 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 10 Feb 2021 12:25:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0wWV5siOXRqWCU9ROwONkuWntMePM3JLWBRrfbx/CdTB5ljXgFv3Rb3aHVLq9PeqrMCYGgiSdw+xFcOuI8IMfu0+jSaSKQhPb5yRDBe4GAcemBAVdQnyvyhYWH1EgA4vEOPZV+ybUXS4FqxibXu82RYfhc9QVL0Km0NBeQPXf3dD1BJ/Bd7K3F8AxkUpMTWr30HpS3PrWTzc+wxZHe2/29cthoHJYtd/i3vgZKHqa/hvNqTpDqWeIvDJBjXmoZ/sJCFLhz4Htd4wY7tWAatlbF46ZrJqQ+eHfrwP/zrkUwyqIcSQC2RyHxTQjux7jDPeaNh8KCrIoDnB4AQnOPoaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnUxuT0SyNH0HiXZMldWPKE5DhyEgMZQ3A8Q5wNTaBo=;
 b=BhJ+BFLMy24m/1lyz9q4yqjwaKCfYuWkKUjoN0YiwlgbQt+oxzy3KUgjtgbo+jdPJBheVIakyB6oaYY1y00LzkmPZgJ77D1s1ykQPUqkOkb8HWdXxjX5XMxojtvLtxFQIhB/PTKbkLb69weT8k1poCF2z+a2NzYFueuMOVnEIEWkYyRUiqsW/C8H+MSOaF/bYaLKaNQleU4BedimOVn8zlalRTpWwxH69u79lE7jhjRBxhVV/pbd9k6lUOuCRBNR4HtQbbgkxOfgQ3oN5qkMNM1QD8c7dDhqGUl1w3qDoirPQTm9RZkJc1CTlzVA7/GuTpNpE+A4V5cqcHltAakKRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnUxuT0SyNH0HiXZMldWPKE5DhyEgMZQ3A8Q5wNTaBo=;
 b=ppvmzKeJPhpPeF7vd5y8+NaHZf6G1UAvYomYzbc4oGXXJgyAK1BkdPp+eUUO8dTZzH55kS06HkL7ruPm3EnuR6J9Sh+AwvC9oNmXwOBCVVkPnbUP1X3N1o2ews3aT8cIxxQ8JzMhvBntV3j+88BWp222eAjxV7sVcCcmSO0deCc=
Received: from MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10)
 by MN2PR11MB4077.namprd11.prod.outlook.com (2603:10b6:208:13f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Wed, 10 Feb
 2021 20:25:58 +0000
Received: from MN2PR11MB4741.namprd11.prod.outlook.com
 ([fe80::b882:37e2:4d6a:1ccf]) by MN2PR11MB4741.namprd11.prod.outlook.com
 ([fe80::b882:37e2:4d6a:1ccf%4]) with mapi id 15.20.3846.027; Wed, 10 Feb 2021
 20:25:58 +0000
From:   "An, Tedd" <tedd.an@intel.com>
To:     "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>
CC:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Subject: Re: [PATCH v4 2/6] Bluetooth: btintel: Move operational checks after
 version check
Thread-Topic: [PATCH v4 2/6] Bluetooth: btintel: Move operational checks after
 version check
Thread-Index: AQHW/86imc0uXLzXTka3MNifcXTs0qpRwQSAgAADCwCAABIzgA==
Date:   Wed, 10 Feb 2021 20:25:57 +0000
Message-ID: <bea0542054d60abf26e8cfeef7a23cbecd9f07f6.camel@intel.com>
References: <20210210165916.2148856-1-luiz.dentz@gmail.com>
         <20210210165916.2148856-2-luiz.dentz@gmail.com>
         <b9c71d7433f22ca3d93c623c9239ecf14c53de40.camel@intel.com>
         <CABBYNZK-a1-tb1XsEcoDuorewZxb=R2Y=qNjcEoxay58cZKJ9g@mail.gmail.com>
In-Reply-To: <CABBYNZK-a1-tb1XsEcoDuorewZxb=R2Y=qNjcEoxay58cZKJ9g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 (3.36.5-2.fc32) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.139.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a3f19c0-d240-4784-3738-08d8ce021337
x-ms-traffictypediagnostic: MN2PR11MB4077:
x-microsoft-antispam-prvs: <MN2PR11MB4077D531A8C00DED2E087DEAFF8D9@MN2PR11MB4077.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kumx14EYCTohFCMIesnVm8MISk1Vwjc079hL4U9rDI20brNdSzI0msIj6UKedaxmo0L5/XEDyyyP70Qx4hV94uG6mcoUbtw5/QjZFL3OacABQMhsObyka2wWhy8xPRlCdZinWqod+Cy9iwOU1r5WK6bUQIWanw5wo3VcfP5/lPpJxoI5+bWlaQIwKcxCuUCJwpmuTh6oD0fR4Koa6iTM898Yo1/F36ZW5+zJl+9X7Rnt4bG+Y53Rr5pGlTa4uZ7lqhDhYC35lYmwbskjWZzmzINHvyJxZTuTSifIDupyP/39Mb/7Jl4gDFD0RVWp2FNOjztwPpX9n8XxNaCLNB5/6e67B7Te0erkhR10v5+VN/A5359hnkp7WaweSNg6sgULOFz9ed6guG84U6zftw6ManH8l8roQkv2V2/cShkz1+29YfwNyZQD1PS+1RtVhghI59pFF+IRBHRv2IDflDNBSAVhEO2QI5t8PEuU7Vba/KNWrEOmQJFZTZdVeVvXLGdQTxSDIonmbvzPmXGYr+lo8Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4741.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(376002)(39860400002)(396003)(366004)(71200400001)(2616005)(36756003)(2906002)(26005)(186003)(6506007)(53546011)(6512007)(5660300002)(4326008)(66556008)(66446008)(64756008)(66476007)(66946007)(478600001)(91956017)(76116006)(6486002)(8936002)(316002)(8676002)(86362001)(6916009)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SG1zZXc5UGhoUTlTUU4wcDlMcUZ5TERCMHpGakdEaGMvU2hRYm9LSzNKSEM5?=
 =?utf-8?B?RjAvZm9DN2RiM2w4ZkgvR1dQY3JEcHBiRDgrQTZTM1F0ak9pRlhST0dlV3hj?=
 =?utf-8?B?SU81cXluLzdYSjNNek0xb0pHOFdEV1VJdFF4R3RmYnM4QlNzT2I5M1lqcGJ5?=
 =?utf-8?B?cmRrZEY4Z055LzBweXk4MWtCV1Ayd3Q2dFZFTWFRK1RaYXZTV3BFVlBDdC9l?=
 =?utf-8?B?YWtOUkF3K0R6MkxNbVNveGZKaXZVMXVWNXVWcWVMOU5KLzNzd3pqK2tzS1BS?=
 =?utf-8?B?UkFDcEtNK0JRUGRybm9zWHVjbXNZS3BZZUdWWVJCRUd3UUR0UXlNRU5PQ0Ji?=
 =?utf-8?B?NTNJb2crRHBEbmZxWUh6cDR5dWthdDBOSHlPT0VEbkowaWdSOXpHRkNJYWp6?=
 =?utf-8?B?U2FjSXhYelJWSVNDN3cyUjlCUDBlVXY3S0FTT2NvVm82dENjd0ZZR3ZBQzN1?=
 =?utf-8?B?SjVST08vTDJiazVYZUk4ZUd1bTFZSXg0RVV6b25sYjNFREplVjVOZm9OY0ww?=
 =?utf-8?B?M1ZER0R1RWdoMmNuR1lZV21iQUZ5Ly9UZS9NNFliemxvYlN6TXQzY1hneGxD?=
 =?utf-8?B?dXhqRlcwQWlzWWg0TDBKaUZXaXdLeTliNTAyVisyckdPR0s0WitNVkhjcjcw?=
 =?utf-8?B?TjFaRHJPUW1HMWJISXhGTk9vZFcreUxwcHFkcXdIQ0NyTm9tdzZYZnJyUHNZ?=
 =?utf-8?B?S21MYkVhcHBmbXd0dVBzS3M1c1FMK1ZiVEY5Yjk3MUc2cm9GQnhBU1l4bVNM?=
 =?utf-8?B?dTZ1QjhWdWN5OVZ1cFo2TkYvMWZIQmo2Qm84Z1NOK2NNQTYrckQ0OTZUMUZ1?=
 =?utf-8?B?WDNYQnpXRi9DRzVEM1BuM3ZTRHN3cFQ3WWdadUt4YTNLeUhIc0VLT1paU3JW?=
 =?utf-8?B?Vk9wcWttT2J6cFBoa3loQTloRWJHUFAvMk5XdVJlVTZXR1AxdW1ESThBMlpE?=
 =?utf-8?B?MnBaMTl6bHNNeDNHVWRyakNBbnQ1NUFsbldiSldLaGtROUlyRUhja0hGMTda?=
 =?utf-8?B?NFV3Q3dCM3FEY1dNTDY0TWU0V3pYTE13YnBvZUFlNThRN2Fka3kyZy9ZM2dL?=
 =?utf-8?B?c2JXbnJWQnlaWStSQWxIRHpvSmpIOXI4dXgwOFZORnlPUi9hOUZscVZGYm5y?=
 =?utf-8?B?N0NqbldGMHVQamJBZHpUOU5hWVlxbUNYNkRzeHNYVHBxdlREaTgzcGVEakx5?=
 =?utf-8?B?UTRXaVZiaitacUs3ZTRVOUR1SWxDSG5NWE9BNm52Z1lSTDl3MnRPamZleVBw?=
 =?utf-8?B?dWxwbUFGUnVuYWkvVnJ6RG9McG1EbHFBSm1leWsyZU9SNFc1Wlc2dG13dDJs?=
 =?utf-8?B?WDhPdUFXK1BQNzFSUDMrbldMSG9TcjN2UjN4M2NyWGFRVGN1WGdzUzBYVEt1?=
 =?utf-8?B?YUpHdWNwcFpkTTFoY3N3Qlp0UmZUZWNsUDVIaHpBYklEU2lBaVRqVmRnMXlv?=
 =?utf-8?B?Mm1TTGZpdDQzbVJYOENuT055L25rQ2VIRjN1RUVneXoyN2R4ek1lbU9xNi9O?=
 =?utf-8?B?c1U0ZzhaTDJQYjVCNnlDOStxQ0psaldncGgySkdORVQ5Z2svQ2RYSHhnWTBx?=
 =?utf-8?B?UmFmRWdYMnVGMWVZRnhYWmhrZ0VTMm9FL0N1V1Q0eDRtZ0w3Tkk2ZUNUMHpS?=
 =?utf-8?B?alpzamlESVM5eTkwMDJFdCt5S09UTDlLRjFCaldwOTZCUTVFNm0rcXliV05k?=
 =?utf-8?B?M1NqSnFEZWR5V1lGS291ZmdadzNTM2JvSHExaWo1eGtVckVkUFZrMjZWcEx1?=
 =?utf-8?B?dW1ydXp0bkVKUEZPRVlkYjlQUzJsMjdXMktUYzdXZWJkQ2k4S2hHcE10RzJk?=
 =?utf-8?B?a1d4NDlwanlSSXBYZ0h2Zz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4350ABFE1A6DE24B83AA8DA196D2E38C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4741.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3f19c0-d240-4784-3738-08d8ce021337
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2021 20:25:57.9332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aRMRzceFYL544hDAacIPCle4Pxr0izQ6GSiVRRu7M6C4Zma0tpBbVXR9UO+10qAijQ8hpCU/m/qYkw3kcWd9vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4077
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

SGkgTHVpeiwNCg0KT24gV2VkLCAyMDIxLTAyLTEwIGF0IDExOjIwIC0wODAwLCBMdWl6IEF1Z3Vz
dG8gdm9uIERlbnR6IHdyb3RlOg0KPiBIaSBUZWRkLA0KPiANCj4gT24gV2VkLCBGZWIgMTAsIDIw
MjEgYXQgMTE6MTAgQU0gQW4sIFRlZGQgPHRlZGQuYW5AaW50ZWwuY29tPiB3cm90ZToNCj4gPiBP
biBXZWQsIDIwMjEtMDItMTAgYXQgMDg6NTkgLTA4MDAsIEx1aXogQXVndXN0byB2b24gRGVudHog
d3JvdGU6DQo+ID4gPiBGcm9tOiBMdWl6IEF1Z3VzdG8gdm9uIERlbnR6IDxsdWl6LnZvbi5kZW50
ekBpbnRlbC5jb20+DQo+ID4gPiANCj4gPiA+IEluIG9yZGVyIHRvIGFsbG93IG5ldyBmaXJtd2Fy
ZSB0byBiZSBsb2FkZWQgaXQgZmlyc3QgbmVlZHMgdG8gY2hlY2sgaWYNCj4gPiA+IHRoZSBmaXJt
d2FyZSB2ZXJzaW9uIG9uIGZpbGUgbWF0Y2hlcyB0aGUgb25lIGxvYWRlZCBpZiBpdCBkb2Vzbid0
IHRoZW4NCj4gPiA+IGl0IG5lZWRzIHRvIHJldmVydCB0byBib29ybG9hZGVyIG1vZGUgaW4gb3Jk
ZXIgdG8gbG9hZCB0aGUgbmV3IGZpcm13YXJlLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBMdWl6IEF1Z3VzdG8gdm9uIERlbnR6IDxsdWl6LnZvbi5kZW50ekBpbnRlbC5jb20+DQo+ID4g
PiAtLS0NCj4gPiA+ICBkcml2ZXJzL2JsdWV0b290aC9idGludGVsLmMgfCAyMiArKysrKysrKysr
Kw0KPiA+ID4gIGRyaXZlcnMvYmx1ZXRvb3RoL2J0dXNiLmMgICB8IDc0ICsrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDUyIGluc2Vy
dGlvbnMoKyksIDQ0IGRlbGV0aW9ucygtKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ibHVldG9vdGgvYnRpbnRlbC5jIGIvZHJpdmVycy9ibHVldG9vdGgvYnRpbnRlbC5jDQo+
ID4gPiBpbmRleCA4OWY4NWQ1NGNhNjQuLjBkMGY2NDNmOTcyYSAxMDA2NDQNCj4gPiA+IC0tLSBh
L2RyaXZlcnMvYmx1ZXRvb3RoL2J0aW50ZWwuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ibHVldG9v
dGgvYnRpbnRlbC5jDQo+ID4gPiBAQCAtOTQ5LDYgKzk0OSwxNyBAQCBpbnQgYnRpbnRlbF9kb3du
bG9hZF9maXJtd2FyZShzdHJ1Y3QgaGNpX2RldiAqaGRldiwNCj4gPiA+ICAgICAgICAgICAgICAg
cmV0dXJuIC1FQUxSRUFEWTsNCj4gPiA+ICAgICAgIH0NCj4gPiA+IA0KPiA+ID4gKyAgICAgLyog
VGhlIGZpcm13YXJlIHZhcmlhbnQgZGV0ZXJtaW5lcyBpZiB0aGUgZGV2aWNlIGlzIGluIGJvb3Rs
b2FkZXINCj4gPiA+ICsgICAgICAqIG1vZGUgb3IgaXMgcnVubmluZyBvcGVyYXRpb25hbCBmaXJt
d2FyZS4gVGhlIHZhbHVlIDB4MDYgaWRlbnRpZmllcw0KPiA+ID4gKyAgICAgICogdGhlIGJvb3Rs
b2FkZXIgYW5kIHRoZSB2YWx1ZSAweDIzIGlkZW50aWZpZXMgdGhlIG9wZXJhdGlvbmFsDQo+ID4g
PiArICAgICAgKiBmaXJtd2FyZS4NCj4gPiA+ICsgICAgICAqDQo+ID4gPiArICAgICAgKiBJZiB0
aGUgZmlybXdhcmUgdmVyc2lvbiBoYXMgY2hhbmdlZCB0aGF0IG1lYW5zIGl0IG5lZWRzIHRvIGJl
IHJlc2V0DQo+ID4gPiArICAgICAgKiB0byBib290bG9hZGVyIHdoZW4gb3BlcmF0aW9uYWwgc28g
dGhlIG5ldyBmaXJtd2FyZSBjYW4gYmUgbG9hZGVkLg0KPiA+ID4gKyAgICAgICovDQo+ID4gPiAr
ICAgICBpZiAodmVyLT5md192YXJpYW50ID09IDB4MjMpDQo+ID4gPiArICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOw0KPiA+ID4gKw0KPiA+ID4gICAgICAgZXJyID0gYnRpbnRlbF9zZmlfcnNh
X2hlYWRlcl9zZWN1cmVfc2VuZChoZGV2LCBmdyk7DQo+ID4gPiAgICAgICBpZiAoZXJyKQ0KPiA+
ID4gICAgICAgICAgICAgICByZXR1cm4gZXJyOw0KPiA+ID4gQEAgLTk3Niw2ICs5ODcsMTcgQEAg
aW50IGJ0aW50ZWxfZG93bmxvYWRfZmlybXdhcmVfbmV3Z2VuKHN0cnVjdCBoY2lfZGV2ICpoZGV2
LA0KPiA+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVBTFJFQURZOw0KPiA+ID4gICAgICAgfQ0K
PiA+ID4gDQo+ID4gPiArICAgICAvKiBUaGUgZmlybXdhcmUgdmFyaWFudCBkZXRlcm1pbmVzIGlm
IHRoZSBkZXZpY2UgaXMgaW4gYm9vdGxvYWRlcg0KPiA+ID4gKyAgICAgICogbW9kZSBvciBpcyBy
dW5uaW5nIG9wZXJhdGlvbmFsIGZpcm13YXJlLiBUaGUgdmFsdWUgMHgwMyBpZGVudGlmaWVzDQo+
ID4gPiArICAgICAgKiB0aGUgYm9vdGxvYWRlciBhbmQgdGhlIHZhbHVlIDB4MjMgaWRlbnRpZmll
cyB0aGUgb3BlcmF0aW9uYWwNCj4gPiA+ICsgICAgICAqIGZpcm13YXJlLg0KPiA+ID4gKyAgICAg
ICoNCj4gPiA+ICsgICAgICAqIElmIHRoZSBmaXJtd2FyZSB2ZXJzaW9uIGhhcyBjaGFuZ2VkIHRo
YXQgbWVhbnMgaXQgbmVlZHMgdG8gYmUgcmVzZXQNCj4gPiA+ICsgICAgICAqIHRvIGJvb3Rsb2Fk
ZXIgd2hlbiBvcGVyYXRpb25hbCBzbyB0aGUgbmV3IGZpcm13YXJlIGNhbiBiZSBsb2FkZWQuDQo+
ID4gPiArICAgICAgKi8NCj4gPiA+ICsgICAgIGlmICh2ZXItPmltZ190eXBlID09IDB4MDMpDQo+
ID4gPiArICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ID4gKw0KPiA+ID4gICAgICAg
LyogaUJUIGhhcmR3YXJlIHZhcmlhbnRzIDB4MGIsIDB4MGMsIDB4MTEsIDB4MTIsIDB4MTMsIDB4
MTQgc3VwcG9ydA0KPiA+ID4gICAgICAgICogb25seSBSU0Egc2VjdXJlIGJvb3QgZW5naW5lLiBI
ZW5jZSwgdGhlIGNvcnJlc3BvbmRpbmcgc2ZpIGZpbGUgd2lsbA0KPiA+ID4gICAgICAgICogaGF2
ZSBSU0EgaGVhZGVyIG9mIDY0NCBieXRlcyBmb2xsb3dlZCBieSBDb21tYW5kIEJ1ZmZlci4NCj4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2JsdWV0b290aC9idHVzYi5jIGIvZHJpdmVycy9ibHVl
dG9vdGgvYnR1c2IuYw0KPiA+ID4gaW5kZXggYzkyMDYwZTc0NzJjLi5hNDRmM2NmMjU3OTAgMTAw
NjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2JsdWV0b290aC9idHVzYi5jDQo+ID4gPiArKysgYi9k
cml2ZXJzL2JsdWV0b290aC9idHVzYi5jDQo+ID4gPiBAQCAtMjQ2OSwxNCArMjQ2OSwzMCBAQCBz
dGF0aWMgaW50IGJ0dXNiX3NlbmRfZnJhbWVfaW50ZWwoc3RydWN0IGhjaV9kZXYgKmhkZXYsIHN0
cnVjdCBza19idWZmICpza2IpDQo+ID4gPiAgICAgICByZXR1cm4gLUVJTFNFUTsNCj4gPiA+ICB9
DQo+ID4gPiANCj4gPiA+IC1zdGF0aWMgYm9vbCBidHVzYl9zZXR1cF9pbnRlbF9uZXdfZ2V0X2Z3
X25hbWUoc3RydWN0IGludGVsX3ZlcnNpb24gKnZlciwNCj4gPiA+ICtzdGF0aWMgaW50IGJ0dXNi
X3NldHVwX2ludGVsX25ld19nZXRfZndfbmFtZShzdHJ1Y3QgaW50ZWxfdmVyc2lvbiAqdmVyLA0K
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBp
bnRlbF9ib290X3BhcmFtcyAqcGFyYW1zLA0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNoYXIgKmZ3X25hbWUsIHNpemVfdCBsZW4sDQo+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqc3VmZml4
KQ0KPiA+ID4gIHsNCj4gPiA+ICsgICAgIC8qIFRoZSBoYXJkd2FyZSBwbGF0Zm9ybSBudW1iZXIg
aGFzIGEgZml4ZWQgdmFsdWUgb2YgMHgzNyBhbmQNCj4gPiA+ICsgICAgICAqIGZvciBub3cgb25s
eSBhY2NlcHQgdGhpcyBzaW5nbGUgdmFsdWUuDQo+ID4gPiArICAgICAgKi8NCj4gPiA+ICsgICAg
IGlmICh2ZXItPmh3X3BsYXRmb3JtICE9IDB4MzcpDQo+ID4gPiArICAgICAgICAgICAgIHJldHVy
biAtRUlOVkFMOw0KPiA+ID4gKw0KPiA+ID4gICAgICAgc3dpdGNoICh2ZXItPmh3X3ZhcmlhbnQp
IHsNCj4gPiA+ICAgICAgIGNhc2UgMHgwYjogICAgICAvKiBTZlAgKi8NCj4gPiA+ICAgICAgIGNh
c2UgMHgwYzogICAgICAvKiBXc1AgKi8NCj4gPiA+ICsgICAgICAgICAgICAgLyogVGhlIGZpcm13
YXJlIHZhcmlhbnQgZGV0ZXJtaW5lcyBpZiB0aGUgZGV2aWNlIGlzIGluDQo+ID4gPiArICAgICAg
ICAgICAgICAqIGJvb3Rsb2FkZXIgbW9kZSBvciBpcyBydW5uaW5nIG9wZXJhdGlvbmFsIGZpcm13
YXJlLg0KPiA+ID4gKyAgICAgICAgICAgICAgKg0KPiA+ID4gKyAgICAgICAgICAgICAgKiBWZXJz
aW9uIGNoZWNraW5nIGNhbm5vdCBiZSBwZXJmb3JtZWQgaW4gdGhlc2UgbW9kZWxzIHNpbmNlDQo+
ID4gPiArICAgICAgICAgICAgICAqIHRoZSBmaXJtd2FyZSB2ZXJzaW9uaW5nIGRlcGVuZHMgb24g
dGhlIGZpcm13YXJlIGJlaW5nIGluDQo+ID4gPiArICAgICAgICAgICAgICAqIGJvb3Rsb2FkZXIg
bW9kZS4NCj4gPiA+ICsgICAgICAgICAgICAgICovDQo+ID4gPiArICAgICAgICAgICAgIGlmICh2
ZXItPmZ3X3ZhcmlhbnQgPT0gMHgyMykNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gLUVBTFJFQURZOw0KPiA+ID4gKw0KPiA+ID4gICAgICAgICAgICAgICBzbnByaW50Zihmd19u
YW1lLCBsZW4sICJpbnRlbC9pYnQtJXUtJXUuJXMiLA0KPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgIGxlMTZfdG9fY3B1KHZlci0+aHdfdmFyaWFudCksDQo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgbGUxNl90b19jcHUocGFyYW1zLT5kZXZfcmV2aWQpLA0KPiA+ID4gQEAgLTI0OTMsOSAr
MjUwOSwxMCBAQCBzdGF0aWMgYm9vbCBidHVzYl9zZXR1cF9pbnRlbF9uZXdfZ2V0X2Z3X25hbWUo
c3RydWN0IGludGVsX3ZlcnNpb24gKnZlciwNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICBz
dWZmaXgpOw0KPiA+ID4gICAgICAgICAgICAgICBicmVhazsNCj4gPiA+ICAgICAgIGRlZmF1bHQ6
DQo+ID4gPiAtICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4gPiA+ICsgICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7DQo+ID4gPiAgICAgICB9DQo+ID4gPiAtICAgICByZXR1cm4gdHJ1ZTsN
Cj4gPiA+ICsNCj4gPiA+ICsgICAgIHJldHVybiAwOw0KPiA+IA0KPiA+IFRoZXJlIGlzIG9uZSBt
b3JlIHBsYWNlIGluIGJ0dXNiX3NldHVwX2ludGVsX25ldygpQGJ0dXNiLmMgdG8gdXBkYXRlIHRo
ZSBoYW5kbGluZyBvZiByZXR1cm4NCj4gPiB2YWx1ZSBvZiB0aGlzIGZ1bmNpb24sIHdoaWNoIGlz
IHJlbGF0ZWQgdG8gbG9hZGluZyB0aGUgRERDLg0KPiA+IENvZGUgbGlrZSB0aGlzLi4uDQo+ID4g
DQo+ID4gaWYgKCFlcnIpIHsNCj4gPiAgICAgICAgIGJ0X2Rldl9lcnIoaGRldiwgIlVuc3VwcG9y
dGVkIEludGVsIGZpcm13YXJlIG5hbWluZyIpOw0KPiA+IH0gZWxzZSB7DQo+IA0KPiBUaGlzIHNo
b3VsZCBuZXZlciBmYWlsIHRob3VnaCBzaW5jZSB0aGUgZmlyc3Qgb25lIHdvdWxkIGNoZWNrIGlm
IHRoZQ0KPiBmaXJtd2FyZSBuYW1lIGNhbm5vdCBiZSBnZW5lcmF0ZWQgaWYgd291bGQgZmFpbCBh
bmQgbmV2ZXIgcmVhY2ggdGhpcw0KPiBvbmUsIHRoYXQgc2FpZCBwZXJoYXBzIHN0YXRpYyBhbmFs
eXplciB3aWxsIGNvbXBsYWluIGFib3V0IG5vdA0KPiBjaGVja2luZyB0aGUgcmV0dXJuIGhlcmUu
DQo+IA0KDQpJdCBpcyBub3QgZm9yIGZhaWx1cmUgY2FzZS4gRm9yIHN1Y2Nlc3MgY2FzZSwgaXQg
c2hvdWxkIGdldCB0aGUgRERDIGZpbGUgbmFtZS4NCkl0IGdldHMgY29ycmVjdCBuYW1lIHdpdGgg
ZXJyPTAsIHdoaWNoIHNob3VsZCBiZSBhbiBlcnJvci4NCg0KDQo+ID4gDQo+ID4gPiAgfQ0KPiA+
ID4gDQo+ID4gPiAgc3RhdGljIHZvaWQgYnR1c2Jfc2V0dXBfaW50ZWxfbmV3Z2VuX2dldF9md19u
YW1lKGNvbnN0IHN0cnVjdCBpbnRlbF92ZXJzaW9uX3RsdiAqdmVyX3RsdiwNCj4gPiA+IEBAIC0y
NTUwLDcgKzI1NjcsNiBAQCBzdGF0aWMgaW50IGJ0dXNiX2ludGVsX2Rvd25sb2FkX2Zpcm13YXJl
X25ld2dlbihzdHJ1Y3QgaGNpX2RldiAqaGRldiwNCj4gPiA+ICAgICAgIGlmICh2ZXItPmltZ190
eXBlID09IDB4MDMpIHsNCj4gPiA+ICAgICAgICAgICAgICAgY2xlYXJfYml0KEJUVVNCX0JPT1RM
T0FERVIsICZkYXRhLT5mbGFncyk7DQo+ID4gPiAgICAgICAgICAgICAgIGJ0aW50ZWxfY2hlY2tf
YmRhZGRyKGhkZXYpOw0KPiA+ID4gLSAgICAgICAgICAgICByZXR1cm4gMDsNCj4gPiA+ICAgICAg
IH0NCj4gPiA+IA0KPiA+ID4gICAgICAgLyogQ2hlY2sgZm9yIHN1cHBvcnRlZCBpQlQgaGFyZHdh
cmUgdmFyaWFudHMgb2YgdGhpcyBmaXJtd2FyZQ0KPiA+ID4gQEAgLTI2OTQsMzUgKzI3MTAsNiBA
QCBzdGF0aWMgaW50IGJ0dXNiX2ludGVsX2Rvd25sb2FkX2Zpcm13YXJlKHN0cnVjdCBoY2lfZGV2
ICpoZGV2LA0KPiA+ID4gICAgICAgaWYgKCF2ZXIgfHwgIXBhcmFtcykNCj4gPiA+ICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gPiANCj4gPiA+IC0gICAgIC8qIFRoZSBoYXJkd2Fy
ZSBwbGF0Zm9ybSBudW1iZXIgaGFzIGEgZml4ZWQgdmFsdWUgb2YgMHgzNyBhbmQNCj4gPiA+IC0g
ICAgICAqIGZvciBub3cgb25seSBhY2NlcHQgdGhpcyBzaW5nbGUgdmFsdWUuDQo+ID4gPiAtICAg
ICAgKi8NCj4gPiA+IC0gICAgIGlmICh2ZXItPmh3X3BsYXRmb3JtICE9IDB4MzcpIHsNCj4gPiA+
IC0gICAgICAgICAgICAgYnRfZGV2X2VycihoZGV2LCAiVW5zdXBwb3J0ZWQgSW50ZWwgaGFyZHdh
cmUgcGxhdGZvcm0gKCV1KSIsDQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgdmVyLT5o
d19wbGF0Zm9ybSk7DQo+ID4gPiAtICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ID4g
LSAgICAgfQ0KPiA+ID4gLQ0KPiA+ID4gLSAgICAgLyogQ2hlY2sgZm9yIHN1cHBvcnRlZCBpQlQg
aGFyZHdhcmUgdmFyaWFudHMgb2YgdGhpcyBmaXJtd2FyZQ0KPiA+ID4gLSAgICAgICogbG9hZGlu
ZyBtZXRob2QuDQo+ID4gPiAtICAgICAgKg0KPiA+ID4gLSAgICAgICogVGhpcyBjaGVjayBoYXMg
YmVlbiBwdXQgaW4gcGxhY2UgdG8gZW5zdXJlIGNvcnJlY3QgZm9yd2FyZA0KPiA+ID4gLSAgICAg
ICogY29tcGF0aWJpbGl0eSBvcHRpb25zIHdoZW4gbmV3ZXIgaGFyZHdhcmUgdmFyaWFudHMgY29t
ZSBhbG9uZy4NCj4gPiA+IC0gICAgICAqLw0KPiA+ID4gLSAgICAgc3dpdGNoICh2ZXItPmh3X3Zh
cmlhbnQpIHsNCj4gPiA+IC0gICAgIGNhc2UgMHgwYjogICAgICAvKiBTZlAgKi8NCj4gPiA+IC0g
ICAgIGNhc2UgMHgwYzogICAgICAvKiBXc1AgKi8NCj4gPiA+IC0gICAgIGNhc2UgMHgxMTogICAg
ICAvKiBKZlAgKi8NCj4gPiA+IC0gICAgIGNhc2UgMHgxMjogICAgICAvKiBUaFAgKi8NCj4gPiA+
IC0gICAgIGNhc2UgMHgxMzogICAgICAvKiBIclAgKi8NCj4gPiA+IC0gICAgIGNhc2UgMHgxNDog
ICAgICAvKiBDY1AgKi8NCj4gPiA+IC0gICAgICAgICAgICAgYnJlYWs7DQo+ID4gPiAtICAgICBk
ZWZhdWx0Og0KPiA+ID4gLSAgICAgICAgICAgICBidF9kZXZfZXJyKGhkZXYsICJVbnN1cHBvcnRl
ZCBJbnRlbCBoYXJkd2FyZSB2YXJpYW50ICgldSkiLA0KPiA+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgIHZlci0+aHdfdmFyaWFudCk7DQo+ID4gPiAtICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KPiA+ID4gLSAgICAgfQ0KPiA+ID4gLQ0KPiA+ID4gICAgICAgYnRpbnRlbF92ZXJzaW9u
X2luZm8oaGRldiwgdmVyKTsNCj4gPiA+IA0KPiA+ID4gICAgICAgLyogVGhlIGZpcm13YXJlIHZh
cmlhbnQgZGV0ZXJtaW5lcyBpZiB0aGUgZGV2aWNlIGlzIGluIGJvb3Rsb2FkZXINCj4gPiA+IEBA
IC0yNzQxLDE2ICsyNzI4LDggQEAgc3RhdGljIGludCBidHVzYl9pbnRlbF9kb3dubG9hZF9maXJt
d2FyZShzdHJ1Y3QgaGNpX2RldiAqaGRldiwNCj4gPiA+ICAgICAgIGlmICh2ZXItPmZ3X3Zhcmlh
bnQgPT0gMHgyMykgew0KPiA+ID4gICAgICAgICAgICAgICBjbGVhcl9iaXQoQlRVU0JfQk9PVExP
QURFUiwgJmRhdGEtPmZsYWdzKTsNCj4gPiA+ICAgICAgICAgICAgICAgYnRpbnRlbF9jaGVja19i
ZGFkZHIoaGRldik7DQo+ID4gPiAtICAgICAgICAgICAgIHJldHVybiAwOw0KPiA+ID4gLSAgICAg
fQ0KPiA+ID4gLQ0KPiA+ID4gLSAgICAgLyogSWYgdGhlIGRldmljZSBpcyBub3QgaW4gYm9vdGxv
YWRlciBtb2RlLCB0aGVuIHRoZSBvbmx5IHBvc3NpYmxlDQo+ID4gPiAtICAgICAgKiBjaG9pY2Ug
aXMgdG8gcmV0dXJuIGFuIGVycm9yIGFuZCBhYm9ydCB0aGUgZGV2aWNlIGluaXRpYWxpemF0aW9u
Lg0KPiA+ID4gLSAgICAgICovDQo+ID4gPiAtICAgICBpZiAodmVyLT5md192YXJpYW50ICE9IDB4
MDYpIHsNCj4gPiA+IC0gICAgICAgICAgICAgYnRfZGV2X2VycihoZGV2LCAiVW5zdXBwb3J0ZWQg
SW50ZWwgZmlybXdhcmUgdmFyaWFudCAoJXUpIiwNCj4gPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICB2ZXItPmZ3X3ZhcmlhbnQpOw0KPiA+ID4gLSAgICAgICAgICAgICByZXR1cm4gLUVOT0RF
VjsNCj4gPiA+ICsgICAgICAgICAgICAgLyogUHJvY2VlZCB0byBkb3dubG9hZCB0byBjaGVjayBp
ZiB0aGUgdmVyc2lvbiBtYXRjaGVzICovDQo+ID4gPiArICAgICAgICAgICAgIGdvdG8gZG93bmxv
YWQ7DQo+ID4gPiAgICAgICB9DQo+ID4gPiANCj4gPiA+ICAgICAgIC8qIFJlYWQgdGhlIHNlY3Vy
ZSBib290IHBhcmFtZXRlcnMgdG8gaWRlbnRpZnkgdGhlIG9wZXJhdGluZw0KPiA+ID4gQEAgLTI3
NzgsNiArMjc1Nyw3IEBAIHN0YXRpYyBpbnQgYnR1c2JfaW50ZWxfZG93bmxvYWRfZmlybXdhcmUo
c3RydWN0IGhjaV9kZXYgKmhkZXYsDQo+ID4gPiAgICAgICAgICAgICAgIHNldF9iaXQoSENJX1FV
SVJLX0lOVkFMSURfQkRBRERSLCAmaGRldi0+cXVpcmtzKTsNCj4gPiA+ICAgICAgIH0NCj4gPiA+
IA0KPiA+ID4gK2Rvd25sb2FkOg0KPiA+ID4gICAgICAgLyogV2l0aCB0aGlzIEludGVsIGJvb3Rs
b2FkZXIgb25seSB0aGUgaGFyZHdhcmUgdmFyaWFudCBhbmQgZGV2aWNlDQo+ID4gPiAgICAgICAg
KiByZXZpc2lvbiBpbmZvcm1hdGlvbiBhcmUgdXNlZCB0byBzZWxlY3QgdGhlIHJpZ2h0IGZpcm13
YXJlIGZvciBTZlANCj4gPiA+ICAgICAgICAqIGFuZCBXc1AuDQo+ID4gPiBAQCAtMjgwMSw3ICsy
NzgxLDEzIEBAIHN0YXRpYyBpbnQgYnR1c2JfaW50ZWxfZG93bmxvYWRfZmlybXdhcmUoc3RydWN0
IGhjaV9kZXYgKmhkZXYsDQo+ID4gPiAgICAgICAgKi8NCj4gPiA+ICAgICAgIGVyciA9IGJ0dXNi
X3NldHVwX2ludGVsX25ld19nZXRfZndfbmFtZSh2ZXIsIHBhcmFtcywgZnduYW1lLA0KPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihmd25h
bWUpLCAic2ZpIik7DQo+ID4gPiAtICAgICBpZiAoIWVycikgew0KPiA+ID4gKyAgICAgaWYgKGVy
ciA8IDApIHsNCj4gPiA+ICsgICAgICAgICAgICAgaWYgKGVyciA9PSAtRUFMUkVBRFkpIHsNCj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAvKiBGaXJtd2FyZSBoYXMgYWxyZWFkeSBiZWVuIGxv
YWRlZCAqLw0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHNldF9iaXQoQlRVU0JfRklSTVdB
UkVfTE9BREVELCAmZGF0YS0+ZmxhZ3MpOw0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGdv
dG8gZG9uZTsNCj4gPiA+ICsgICAgICAgICAgICAgfQ0KPiA+ID4gKw0KPiA+ID4gICAgICAgICAg
ICAgICBidF9kZXZfZXJyKGhkZXYsICJVbnN1cHBvcnRlZCBJbnRlbCBmaXJtd2FyZSBuYW1pbmci
KTsNCj4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gPiAgICAgICB9DQo+
IA0KPiANCg==
