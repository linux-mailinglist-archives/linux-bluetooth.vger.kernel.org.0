Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDE5F314AC3
	for <lists+linux-bluetooth@lfdr.de>; Tue,  9 Feb 2021 09:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbhBIIt3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 9 Feb 2021 03:49:29 -0500
Received: from mga06.intel.com ([134.134.136.31]:25150 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229878AbhBIIrg (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 9 Feb 2021 03:47:36 -0500
IronPort-SDR: kmyphlyrFi93+kNz1+lH34RZ0WAHe4uoAwSwQTD8qy1lRgYVOEGNhB+fJr4T5EBlw4Jo9xXFjQ
 5Mu6F6qxI0fg==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="243344136"
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; 
   d="scan'208";a="243344136"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 00:46:45 -0800
IronPort-SDR: S12EhqgpAiYo35T1O132G6IpnVhZqRQ2unTddWc7jN5DNvHfmS+Ex9SsGRQAPCQnsFYl8GH8qt
 JDot1jwxbH3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; 
   d="scan'208";a="374884005"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga002.jf.intel.com with ESMTP; 09 Feb 2021 00:46:45 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Feb 2021 00:46:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 9 Feb 2021 00:46:45 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 9 Feb 2021 00:46:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=joBxyxULTsihIOuGF3Q2k/iHvn46NFXsnRJdcedIegbHENZp+/SDb6zOQ6i8wp5XDYzp8ikzBWtNJmQEawCOT1EdiqpF1lHZdzaeqfq/yEry1Uzb7/nVL2Pirm9ysFOs2E/TRmWdk/rfKISlb6aJGz5G0mbbs8xTbbR11weCr1vFjL7US7ogsUtZKxV+yo0ceqp+HgxGXVPsQR/qzOs7gQW2IUug3xP04wYzyfn+ZJe49rXP5VRfd5gz8fGYT5u6ZdiWMohP6PDjLgXN2YzNQKbAoWiTyquhKJuNkW21kElTPLbAZEJOCR3dyqxT6kn098TencnOqa3D9pGMKPPm+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iT5ThVa7Q99+FwV3aiybfF9RlGnXSeiwqSivfO/sYdU=;
 b=WQiay7f+px6bP5o+e2ddeNNCTaJ2RlybmnKWbDixG1VoMnDRTLiiF4tqxN9txL126sSlwEwlZcX6pjyc8rau2vsNR3IMdQQmgP+/jvLTNkuRcsjkRwYhP17O4R1V1jgcGUpOIQE0IiF9YljTFlXiARscK2uOPhcTdv9FOYZTEgooEglH/ieMqfxrVGE39WAUqoOtubdv/1nNPzDXwe5jpriOm8kZbfjMcathG6DSsh9GUQoI+h80yw2qeho8YfV/qbcW+ubC2GSXcOlSsZJJjH1OCMMRTxmZAkQa2BpaVqrsGlbTIR0KOqIj0prMSx1ZmVzWYVGSSHo1PW3jumBbTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iT5ThVa7Q99+FwV3aiybfF9RlGnXSeiwqSivfO/sYdU=;
 b=WjYERTf0BfFn+bj5W/k6LCW4iRZwYaS9QSFlJUb/SDYdm1nbsnlZTV/ud8ZdoLZ8Rshr+L6+vOk2vJ+Ca9+pp0x01gWI94pqQss73yn7Phe0x3sPkYH7aImLGiNhefMrAINSORX7sT7zg+d7beDfQBayPwurh0wFI5P2KOu5ydo=
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by MWHPR11MB1566.namprd11.prod.outlook.com (2603:10b6:301:10::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Tue, 9 Feb
 2021 08:46:43 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::9d55:273b:c716:25f9]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::9d55:273b:c716:25f9%6]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 08:46:43 +0000
From:   "An, Tedd" <tedd.an@intel.com>
To:     "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
CC:     "marcel@holtmann.org" <marcel@holtmann.org>
Subject: Re: [PATCH v2] Bluetooth: btintel: Check firmware version before
 download
Thread-Topic: [PATCH v2] Bluetooth: btintel: Check firmware version before
 download
Thread-Index: AQHW+z3Ef7obgTCt0kqAlMgOiiomR6pPibEA
Date:   Tue, 9 Feb 2021 08:46:43 +0000
Message-ID: <48a1f50435579ea07ab41d6e5faa766f21047d1f.camel@intel.com>
References: <20210204213414.1417675-1-luiz.dentz@gmail.com>
In-Reply-To: <20210204213414.1417675-1-luiz.dentz@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 (3.36.5-2.fc32) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.137.77]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97ef34fa-6986-4dbe-cd63-08d8ccd739d3
x-ms-traffictypediagnostic: MWHPR11MB1566:
x-microsoft-antispam-prvs: <MWHPR11MB15669CD54E9ED6EE8052DAB2FF8E9@MWHPR11MB1566.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dny8ROT7H390OVq7U/WDbyUCAgobOj0Iyg+6HG6lwnO5e6DrkIP4Vpy4wrNLaKkg+BB6GoriXXE+DdjUFExn48D6/u0Ab+q26xNmE9VdeewlVUwulXPdYteBp3aE8hDICZwtBk7lNixL7jK07oQfovX2q3rdqtOUSrDxIb/SiD31I4uPr7dBD7LP7C6pHoVgYSJHMtvJOnytcjlPkJy85aQkYNj6jWzs/aTkTLsYHHFhwzCJNt5OMlUGjmg3AHAlsfrGwg5qbVnieFQXTHDzlpHjHtoMz109l/xOwWiyjD11INxuNtB1EuuVw6zW+3Tzhqf2XNItBgDxXANsvq2Bk76GY94U7dJnSRspJ658+sfyWdemoE4bBXkDOEWcWnIfsRUAd1ccDv9USwyRw7QdhAF0P+mzsfgDCtWIlRksJkd8MKf5GvCJl0+tP1hD/wvL0GR6Wdl8eDaIuWwjpEFydkfYuMcVOIGwmcaupHFAAvnyVlGtiuQUN+qYdP3pKqsY2MT+L9Dx+zX9J0boCEn7bg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4748.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(136003)(396003)(376002)(366004)(8676002)(36756003)(5660300002)(2906002)(8936002)(110136005)(478600001)(76116006)(316002)(83380400001)(6512007)(86362001)(4326008)(66446008)(26005)(186003)(71200400001)(2616005)(66556008)(64756008)(6506007)(66476007)(6486002)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?WlhvQW9yMjFsT0k0S2o4UDRra0grTTFBSG9wd2F6K0NPNUw5aXJHL1k0bUJy?=
 =?utf-8?B?V3JDdjdjemo4K1VjekdiQldhZUQvVlV6dnphNkNTOG1oajVwVmwzdDlBRENO?=
 =?utf-8?B?NTdpQ3VwTkpCKytnc2JTeHIvYWRtY1BreEN0U2ErRjJWY0RHZFBPdTQyWWJo?=
 =?utf-8?B?ZTR2dHFGVyt3Tlc2aXg5cFZDVjVZWnhpb1NnWTFFZHRwemFkODFTY0tXMjAz?=
 =?utf-8?B?dlorY2piYUdtL3FIZktJdmZHeFJRbGJYelQrMTlxTjBiVWJTODgxSmp2M3ly?=
 =?utf-8?B?SnBRa0hBQnJWVDA1L0ZQcVBqczViVncwN3hVMXloN0lFc1VEZ3B2NEZDb2h1?=
 =?utf-8?B?bkk4a3hEY2xDVUpVQk5QSnRwb3FLK0dad0VmOXNPRytJTGNoTjVQRThmVysx?=
 =?utf-8?B?SHg4VWhFcUpJZnlVclFTQU1QaUl2dXNYUlhIcDJCTXZmOXpMTXNCYzY3VmI0?=
 =?utf-8?B?Z2VJODJMWWlqbEdxa08waWFmN0o3OFJPYUZ3V044Wno0azRRc0VVeGtSUWNv?=
 =?utf-8?B?ZEtXaGF4REVwQjFVelNOOElUUlpQMHdvR2tuM0k0ZWJuSFBaYmxjQlBaa2I4?=
 =?utf-8?B?YjM1ZnhXSjRsNnpaZ25adEFSSkdpY2hHY3J2Mlhza3pDdWJ3VXBOVHB2cG1P?=
 =?utf-8?B?aGZDMkRxdmloZ3IyNndrZUVzRlhGR0R0NURZd21rekNZZ3RnYnhVTmgvNzFj?=
 =?utf-8?B?bE5SeFg5MklzN2lJQmI3Mk81d3JBaUVnU3d3UUV6SWl3enJOb1hHUWpKRXBh?=
 =?utf-8?B?bFBBcWJDNy8rZ2tZQzE1a3dVaUVTdjk0R0RoRjVkcUpwSThUTXhLcEhLNnpH?=
 =?utf-8?B?ZVlkc1NRN091cHpDYWdkbkN0QUlNbVoxRW9qV0VKQWg1MExLNHlaWHlWWUds?=
 =?utf-8?B?RFJucjJmc0pTMGRiQkxQWTN3cnZ2d2c2cnphRmpjTWZiWDNhVGtBem9EY3V2?=
 =?utf-8?B?T3U0d1BEN1U4ZjhnNVJPWE9od2lsT2pXQ0FvKzZxN0lIaEN2bDhmYnFveG9v?=
 =?utf-8?B?NWJZbWRhYVA2K3hXaUVkNjRWZkI2V1Q1QUh0emRyWWRkb1IyWHplR1pxalhs?=
 =?utf-8?B?N000T21YTDhWbVV0ZzUzcGZEazNGODFkcTJ0ckFZMGJwUjhJYWp2K1F2WitT?=
 =?utf-8?B?VVpVRG40ZGl5MHUzNVA5N25HK1R4d1BaK1kwNmtmRHdqa3AxWUgzRGlNS3Ro?=
 =?utf-8?B?RzQ3MklLVmxYS1FNMTZHdDNBV0cvT204anJIU1lwbzNnSHh4NlhsOFFwVFpJ?=
 =?utf-8?B?cXdzMmU2VldKb1o5MG1NbG45VDJOdzBhQ0trbzlSZzNSSWFRd3FQZ0lMSWVJ?=
 =?utf-8?B?UkVmemhYRTNCQVVmVndJWlo2NU5adTJMSkVVVmFzUTVCL2hickJ4SW9DbjFG?=
 =?utf-8?B?VE9GaE5zV2NxZGROdGdNdUJHOERBNnhoT3c5N0xWUWlScCs2V1pnUityeHVF?=
 =?utf-8?B?Z3VlWFJHZ0E2bnRudFZlZ2E5V3RENno1OXJqMThwdkVFcHcxbU5HWkswdGNX?=
 =?utf-8?B?U09lL3JINjBGaHdyK1RHSmt1NVdubWVUZUYvYjBrZitLR0p3WkF2R2V6RVNS?=
 =?utf-8?B?Wi9iL3IwVG54RVJwcnUwcUZYUXViY2gvL2xPVyt4d0ZPSVlYUUYyMHVjTnNI?=
 =?utf-8?B?aGRUU2FxWCtPT2pLZzUzNE1zcTY4WHdUYWRNUGNaNlNDbzd6cUdhUU0vVk9M?=
 =?utf-8?B?a2NYSVl1bXBUOWpiZXIwbFIvM04vREYyKzZRT3NnSzhmcXdIc1diaUNqRXRD?=
 =?utf-8?B?eEo3eFFDcDlmRzBGeHZHeDFFU29kOGJIZDFHZVdtUElCYmNKNFNFZloyRzJl?=
 =?utf-8?B?SE9yV3J2S2RPcEp2OHR2UT09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <19F60AF256A11140A9AFAAD05BE9C2E6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ef34fa-6986-4dbe-cd63-08d8ccd739d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2021 08:46:43.2475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q+yuN0ZNwfipCoNUGUnh/ukBjVz+YlTZU97zkSukKZ9W7HItxNXe9yyE0DU2iLKkrzrkgsrDKllQpRLU973kzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1566
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

SGkgTHVpeiwNCg0KSSByYW4gYSBxdWljayB0ZXN0IHdpdGggIk5ldyBGVyArIFJlYm9vdCIgc2Nl
bmFyaW8gYW5kIGl0IGRpZG4ndCB1cGRhdGUNCnRvIHRoZSBuZXcgZmlybXdhcmUgYWZ0ZXIgcmVi
b290Lg0KDQpUaGVyZSBpcyBhIGNoZWNraW5nIG9mIGZ3X3ZhcmlhbnQgaW4gdGhlIGJ0dXNiX2lu
dGVsX2Rvd25sb2FkX2Zpcm13YXJlKCkgaW4gYnR1c2IuYywNCndoaWNoIHdpbGwgZXhpdCB0aGUg
ZnVuY3Rpb24gd2hlbiB0aGUgZncgaXMgcnVubmluZyBpbiBvcGVyYXRpb25hbCBtb2RlLg0KDQoJ
LyogVGhlIGZpcm13YXJlIHZhcmlhbnQgZGV0ZXJtaW5lcyBpZiB0aGUgZGV2aWNlIGlzIGluIGJv
b3Rsb2FkZXINCiAgICAgICAgICogbW9kZSBvciBpcyBydW5uaW5nIG9wZXJhdGlvbmFsIGZpcm13
YXJlLiBUaGUgdmFsdWUgMHgwNiBpZGVudGlmaWVzDQogICAgICAgICAqIHRoZSBib290bG9hZGVy
IGFuZCB0aGUgdmFsdWUgMHgyMyBpZGVudGlmaWVzIHRoZSBvcGVyYXRpb25hbA0KICAgICAgICAg
KiBmaXJtd2FyZS4NCiAgICAgICAgICoNCiAgICAgICAgICogV2hlbiB0aGUgb3BlcmF0aW9uYWwg
ZmlybXdhcmUgaXMgYWxyZWFkeSBwcmVzZW50LCB0aGVuIG9ubHkNCiAgICAgICAgICogdGhlIGNo
ZWNrIGZvciB2YWxpZCBCbHVldG9vdGggZGV2aWNlIGFkZHJlc3MgaXMgbmVlZGVkLiBUaGlzDQog
ICAgICAgICAqIGRldGVybWluZXMgaWYgdGhlIGRldmljZSB3aWxsIGJlIGFkZGVkIGFzIGNvbmZp
Z3VyZWQgb3INCiAgICAgICAgICogdW5jb25maWd1cmVkIGNvbnRyb2xsZXIuDQogICAgICAgICAq
DQogICAgICAgICAqIEl0IGlzIG5vdCBwb3NzaWJsZSB0byB1c2UgdGhlIFNlY3VyZSBCb290IFBh
cmFtZXRlcnMgaW4gdGhpcw0KICAgICAgICAgKiBjYXNlIHNpbmNlIHRoYXQgY29tbWFuZCBpcyBv
bmx5IGF2YWlsYWJsZSBpbiBib290bG9hZGVyIG1vZGUuDQogICAgICAgICAqLw0KICAgICAgICBp
ZiAodmVyLT5md192YXJpYW50ID09IDB4MjMpIHsNCiAgICAgICAgICAgICAgICBjbGVhcl9iaXQo
QlRVU0JfQk9PVExPQURFUiwgJmRhdGEtPmZsYWdzKTsNCiAgICAgICAgICAgICAgICBidGludGVs
X2NoZWNrX2JkYWRkcihoZGV2KTsNCiAgICAgICAgICAgICAgICByZXR1cm4gMDsNCiAgICAgICAg
fQ0KDQpTbywgdGhlIGNoZWNraW5nIGZpcm13YXJlIHZlcnNpb24gd2lsbCBuZXZlciBiZSBjYWxs
ZWQgaWYgdGhlIGZpcm13YXJlIGlzIGFscmVhZHkgcnVubmluZyBpbiBvcGVyYXRpb25hbCBmaXJt
d2FyZS4NCg0KUmVnYXJkcywNClRlZGQNCg0KT24gVGh1LCAyMDIxLTAyLTA0IGF0IDEzOjM0IC0w
ODAwLCBMdWl6IEF1Z3VzdG8gdm9uIERlbnR6IHdyb3RlOg0KPiBGcm9tOiBMdWl6IEF1Z3VzdG8g
dm9uIERlbnR6IDxsdWl6LnZvbi5kZW50ekBpbnRlbC5jb20+DQo+IA0KPiBUaGlzIGNoZWNrcyB0
aGUgZmlybXdhcmUgYnVpbGQgbnVtYmVyLCB3ZWVrIGFuZCB5ZWFyIG1hdGNoZXMgd2l0aA0KPiBy
ZXBlY3RpdmUgdmVyc2lvbiBsb2FkZWQgYW5kIHRoZW4gc2tpcCB0aGUgZG93bmxvYWQgcHJvY2Vz
cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEx1aXogQXVndXN0byB2b24gRGVudHogPGx1aXoudm9u
LmRlbnR6QGludGVsLmNvbT4NCj4gLS0tDQo+IA0KPiANCj4gIGRyaXZlcnMvYmx1ZXRvb3RoL2J0
aW50ZWwuYyAgIHwgOTQgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCj4gIGRy
aXZlcnMvYmx1ZXRvb3RoL2J0aW50ZWwuaCAgIHwgIDUgKy0NCj4gIGRyaXZlcnMvYmx1ZXRvb3Ro
L2J0dXNiLmMgICAgIHwgMTYgKysrKystDQo+ICBkcml2ZXJzL2JsdWV0b290aC9oY2lfaW50ZWwu
YyB8ICA3ICsrLQ0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA5NiBpbnNlcnRpb25zKCspLCAyNiBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2JsdWV0b290aC9idGludGVsLmMg
Yi9kcml2ZXJzL2JsdWV0b290aC9idGludGVsLmMNCj4gaW5kZXggODhjZTVmMGZmYzRiLi4xNTM5
ODliZDhkNWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0aW50ZWwuYw0KPiAr
KysgYi9kcml2ZXJzL2JsdWV0b290aC9idGludGVsLmMNCj4gQEAgLTI0LDYgKzI0LDE0IEBADQo+
ICAjZGVmaW5lIEVDRFNBX09GRlNFVAkJNjQ0DQo+ICAjZGVmaW5lIEVDRFNBX0hFQURFUl9MRU4J
MzIwDQo+ICANCj4gKyNkZWZpbmUgQ01EX1dSSVRFX0JPT1RfUEFSQU1TCTB4ZmMwZQ0KPiArc3Ry
dWN0IGNtZF93cml0ZV9ib290X3BhcmFtcyB7DQo+ICsJdTMyIGJvb3RfYWRkcjsNCj4gKwl1OCAg
ZndfYnVpbGRfbnVtOw0KPiArCXU4ICBmd19idWlsZF93dzsNCj4gKwl1OCAgZndfYnVpbGRfeXk7
DQo+ICt9IF9fcGFja2VkOw0KPiArDQo+ICBpbnQgYnRpbnRlbF9jaGVja19iZGFkZHIoc3RydWN0
IGhjaV9kZXYgKmhkZXYpDQo+ICB7DQo+ICAJc3RydWN0IGhjaV9ycF9yZWFkX2JkX2FkZHIgKmJk
YTsNCj4gQEAgLTg0MSw3ICs4NDksNyBAQCBzdGF0aWMgaW50IGJ0aW50ZWxfc2ZpX2VjZHNhX2hl
YWRlcl9zZWN1cmVfc2VuZChzdHJ1Y3QgaGNpX2RldiAqaGRldiwNCj4gIA0KPiAgc3RhdGljIGlu
dCBidGludGVsX2Rvd25sb2FkX2Zpcm13YXJlX3BheWxvYWQoc3RydWN0IGhjaV9kZXYgKmhkZXYs
DQo+ICAJCQkJCSAgICAgY29uc3Qgc3RydWN0IGZpcm13YXJlICpmdywNCj4gLQkJCQkJICAgICB1
MzIgKmJvb3RfcGFyYW0sIHNpemVfdCBvZmZzZXQpDQo+ICsJCQkJCSAgICAgc2l6ZV90IG9mZnNl
dCkNCj4gIHsNCj4gIAlpbnQgZXJyOw0KPiAgCWNvbnN0IHU4ICpmd19wdHI7DQo+IEBAIC04NTQs
MjAgKzg2Miw2IEBAIHN0YXRpYyBpbnQgYnRpbnRlbF9kb3dubG9hZF9maXJtd2FyZV9wYXlsb2Fk
KHN0cnVjdCBoY2lfZGV2ICpoZGV2LA0KPiAgCXdoaWxlIChmd19wdHIgLSBmdy0+ZGF0YSA8IGZ3
LT5zaXplKSB7DQo+ICAJCXN0cnVjdCBoY2lfY29tbWFuZF9oZHIgKmNtZCA9ICh2b2lkICopKGZ3
X3B0ciArIGZyYWdfbGVuKTsNCj4gIA0KPiAtCQkvKiBFYWNoIFNLVSBoYXMgYSBkaWZmZXJlbnQg
cmVzZXQgcGFyYW1ldGVyIHRvIHVzZSBpbiB0aGUNCj4gLQkJICogSENJX0ludGVsX1Jlc2V0IGNv
bW1hbmQgYW5kIGl0IGlzIGVtYmVkZGVkIGluIHRoZSBmaXJtd2FyZQ0KPiAtCQkgKiBkYXRhLiBT
bywgaW5zdGVhZCBvZiB1c2luZyBzdGF0aWMgdmFsdWUgcGVyIFNLVSwgY2hlY2sNCj4gLQkJICog
dGhlIGZpcm13YXJlIGRhdGEgYW5kIHNhdmUgaXQgZm9yIGxhdGVyIHVzZS4NCj4gLQkJICovDQo+
IC0JCWlmIChsZTE2X3RvX2NwdShjbWQtPm9wY29kZSkgPT0gMHhmYzBlKSB7DQo+IC0JCQkvKiBU
aGUgYm9vdCBwYXJhbWV0ZXIgaXMgdGhlIGZpcnN0IDMyLWJpdCB2YWx1ZQ0KPiAtCQkJICogYW5k
IHJlc3Qgb2YgMyBvY3RldHMgYXJlIHJlc2VydmVkLg0KPiAtCQkJICovDQo+IC0JCQkqYm9vdF9w
YXJhbSA9IGdldF91bmFsaWduZWRfbGUzMihmd19wdHIgKyBzaXplb2YoKmNtZCkpOw0KPiAtDQo+
IC0JCQlidF9kZXZfZGJnKGhkZXYsICJib290X3BhcmFtPTB4JXgiLCAqYm9vdF9wYXJhbSk7DQo+
IC0JCX0NCj4gLQ0KPiAgCQlmcmFnX2xlbiArPSBzaXplb2YoKmNtZCkgKyBjbWQtPnBsZW47DQo+
ICANCj4gIAkJLyogVGhlIHBhcmFtZXRlciBsZW5ndGggb2YgdGhlIHNlY3VyZSBzZW5kIGNvbW1h
bmQgcmVxdWlyZXMNCj4gQEAgLTg5NiwyOCArODkwLDkwIEBAIHN0YXRpYyBpbnQgYnRpbnRlbF9k
b3dubG9hZF9maXJtd2FyZV9wYXlsb2FkKHN0cnVjdCBoY2lfZGV2ICpoZGV2LA0KPiAgCXJldHVy
biBlcnI7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyBib29sIGJ0aW50ZWxfZmlybXdhcmVfdmVyc2lv
bihzdHJ1Y3QgaGNpX2RldiAqaGRldiwNCj4gKwkJCQkgICAgIHU4IG51bSwgdTggd3csIHU4IHl5
LA0KPiArCQkJCSAgICAgY29uc3Qgc3RydWN0IGZpcm13YXJlICpmdywNCj4gKwkJCQkgICAgIHUz
MiAqYm9vdF9hZGRyKQ0KPiArew0KPiArCWNvbnN0IHU4ICpmd19wdHI7DQo+ICsJdTMyIGZyYWdf
bGVuOw0KPiArDQo+ICsJZndfcHRyID0gZnctPmRhdGE7DQo+ICsJZnJhZ19sZW4gPSAwOw0KPiAr
DQo+ICsJd2hpbGUgKGZ3X3B0ciAtIGZ3LT5kYXRhIDwgZnctPnNpemUpIHsNCj4gKwkJc3RydWN0
IGhjaV9jb21tYW5kX2hkciAqY21kID0gKHZvaWQgKikoZndfcHRyICsgZnJhZ19sZW4pOw0KPiAr
DQo+ICsJCS8qIEVhY2ggU0tVIGhhcyBhIGRpZmZlcmVudCByZXNldCBwYXJhbWV0ZXIgdG8gdXNl
IGluIHRoZQ0KPiArCQkgKiBIQ0lfSW50ZWxfUmVzZXQgY29tbWFuZCBhbmQgaXQgaXMgZW1iZWRk
ZWQgaW4gdGhlIGZpcm13YXJlDQo+ICsJCSAqIGRhdGEuIFNvLCBpbnN0ZWFkIG9mIHVzaW5nIHN0
YXRpYyB2YWx1ZSBwZXIgU0tVLCBjaGVjaw0KPiArCQkgKiB0aGUgZmlybXdhcmUgZGF0YSBhbmQg
c2F2ZSBpdCBmb3IgbGF0ZXIgdXNlLg0KPiArCQkgKi8NCj4gKwkJaWYgKGxlMTZfdG9fY3B1KGNt
ZC0+b3Bjb2RlKSA9PSBDTURfV1JJVEVfQk9PVF9QQVJBTVMpIHsNCj4gKwkJCXN0cnVjdCBjbWRf
d3JpdGVfYm9vdF9wYXJhbXMgKnBhcmFtczsNCj4gKw0KPiArCQkJcGFyYW1zID0gKHZvaWQgKiko
ZndfcHRyICsgc2l6ZW9mKCpjbWQpKTsNCj4gKw0KPiArCQkJYnRfZGV2X2RiZyhoZGV2LCAiQm9v
dCBBZGRyZXNzOiAweCV4IiwNCj4gKwkJCQkgICBsZTMyX3RvX2NwdShwYXJhbXMtPmJvb3RfYWRk
cikpOw0KPiArDQo+ICsJCQlidF9kZXZfZGJnKGhkZXYsICJGaXJtd2FyZSBWZXJzaW9uOiAldS0l
dS4ldSIsDQo+ICsJCQkJICAgcGFyYW1zLT5md19idWlsZF9udW0sIHBhcmFtcy0+ZndfYnVpbGRf
d3csDQo+ICsJCQkJICAgcGFyYW1zLT5md19idWlsZF95eSk7DQo+ICsNCj4gKwkJCXJldHVybiAo
bnVtID09IHBhcmFtcy0+ZndfYnVpbGRfbnVtICYmDQo+ICsJCQkJd3cgPT0gcGFyYW1zLT5md19i
dWlsZF93dyAmJg0KPiArCQkJCXl5ID09IHBhcmFtcy0+ZndfYnVpbGRfeXkpOw0KPiArCQl9DQo+
ICsNCj4gKwkJZnJhZ19sZW4gKz0gc2l6ZW9mKCpjbWQpICsgY21kLT5wbGVuOw0KPiArCX0NCj4g
Kw0KPiArCXJldHVybiBmYWxzZTsNCj4gK30NCj4gKw0KPiAgaW50IGJ0aW50ZWxfZG93bmxvYWRf
ZmlybXdhcmUoc3RydWN0IGhjaV9kZXYgKmhkZXYsDQo+ICsJCQkgICAgICBzdHJ1Y3QgaW50ZWxf
dmVyc2lvbiAqdmVyLA0KPiAgCQkJICAgICAgY29uc3Qgc3RydWN0IGZpcm13YXJlICpmdywNCj4g
IAkJCSAgICAgIHUzMiAqYm9vdF9wYXJhbSkNCj4gIHsNCj4gIAlpbnQgZXJyOw0KPiAgDQo+ICsJ
LyogU2tpcCBkb3dubG9hZCBpZiBmaXJtd2FyZSBoYXMgdGhlIHNhbWUgdmVyc2lvbiAqLw0KPiAr
CWlmIChidGludGVsX2Zpcm13YXJlX3ZlcnNpb24oaGRldiwgdmVyLT5md19idWlsZF9udW0sIHZl
ci0+ZndfYnVpbGRfd3csDQo+ICsJCQkJICAgICB2ZXItPmZ3X2J1aWxkX3l5LCBmdywgYm9vdF9w
YXJhbSkpIHsNCj4gKwkJLyogUmV0dXJuIC1FQUxSRUFEWSB0byBpbmRpY2F0ZSB0aGF0IHRoZSBm
aXJtd2FyZSBoYXMgYWxyZWFkeQ0KPiArCQkgKiBiZWVuIGxvYWRlZC4NCj4gKwkJICovDQo+ICsJ
CXJldHVybiAtRUFMUkVBRFk7DQo+ICsJfQ0KPiArDQo+ICAJZXJyID0gYnRpbnRlbF9zZmlfcnNh
X2hlYWRlcl9zZWN1cmVfc2VuZChoZGV2LCBmdyk7DQo+ICAJaWYgKGVycikNCj4gIAkJcmV0dXJu
IGVycjsNCj4gIA0KPiAtCXJldHVybiBidGludGVsX2Rvd25sb2FkX2Zpcm13YXJlX3BheWxvYWQo
aGRldiwgZncsIGJvb3RfcGFyYW0sDQo+IC0JCQkJCQkgUlNBX0hFQURFUl9MRU4pOw0KPiArCXJl
dHVybiBidGludGVsX2Rvd25sb2FkX2Zpcm13YXJlX3BheWxvYWQoaGRldiwgZncsIFJTQV9IRUFE
RVJfTEVOKTsNCj4gIH0NCj4gIEVYUE9SVF9TWU1CT0xfR1BMKGJ0aW50ZWxfZG93bmxvYWRfZmly
bXdhcmUpOw0KPiAgDQo+ICBpbnQgYnRpbnRlbF9kb3dubG9hZF9maXJtd2FyZV9uZXdnZW4oc3Ry
dWN0IGhjaV9kZXYgKmhkZXYsDQo+ICsJCQkJICAgICBzdHJ1Y3QgaW50ZWxfdmVyc2lvbl90bHYg
KnZlciwNCj4gIAkJCQkgICAgIGNvbnN0IHN0cnVjdCBmaXJtd2FyZSAqZncsIHUzMiAqYm9vdF9w
YXJhbSwNCj4gIAkJCQkgICAgIHU4IGh3X3ZhcmlhbnQsIHU4IHNiZV90eXBlKQ0KPiAgew0KPiAg
CWludCBlcnI7DQo+ICAJdTMyIGNzc19oZWFkZXJfdmVyOw0KPiAgDQo+ICsJLyogU2tpcCBkb3du
bG9hZCBpZiBmaXJtd2FyZSBoYXMgdGhlIHNhbWUgdmVyc2lvbiAqLw0KPiArCWlmIChidGludGVs
X2Zpcm13YXJlX3ZlcnNpb24oaGRldiwgdmVyLT5taW5fZndfYnVpbGRfbm4sDQo+ICsJCQkJICAg
ICB2ZXItPm1pbl9md19idWlsZF9jdywgdmVyLT5taW5fZndfYnVpbGRfeXksDQo+ICsJCQkJICAg
ICBmdywgYm9vdF9wYXJhbSkpIHsNCj4gKwkJLyogUmV0dXJuIC1FQUxSRUFEWSB0byBpbmRpY2F0
ZSB0aGF0IGZpcm13YXJlIGhhcyBhbHJlYWR5IGJlZW4NCj4gKwkJICogbG9hZGVkLg0KPiArCQkg
Ki8NCj4gKwkJcmV0dXJuIC1FQUxSRUFEWTsNCj4gKwl9DQo+ICsNCj4gIAkvKiBpQlQgaGFyZHdh
cmUgdmFyaWFudHMgMHgwYiwgMHgwYywgMHgxMSwgMHgxMiwgMHgxMywgMHgxNCBzdXBwb3J0DQo+
ICAJICogb25seSBSU0Egc2VjdXJlIGJvb3QgZW5naW5lLiBIZW5jZSwgdGhlIGNvcnJlc3BvbmRp
bmcgc2ZpIGZpbGUgd2lsbA0KPiAgCSAqIGhhdmUgUlNBIGhlYWRlciBvZiA2NDQgYnl0ZXMgZm9s
bG93ZWQgYnkgQ29tbWFuZCBCdWZmZXIuDQo+IEBAIC05NDcsNyArMTAwMyw3IEBAIGludCBidGlu
dGVsX2Rvd25sb2FkX2Zpcm13YXJlX25ld2dlbihzdHJ1Y3QgaGNpX2RldiAqaGRldiwNCj4gIAkJ
aWYgKGVycikNCj4gIAkJCXJldHVybiBlcnI7DQo+ICANCj4gLQkJZXJyID0gYnRpbnRlbF9kb3du
bG9hZF9maXJtd2FyZV9wYXlsb2FkKGhkZXYsIGZ3LCBib290X3BhcmFtLCBSU0FfSEVBREVSX0xF
Tik7DQo+ICsJCWVyciA9IGJ0aW50ZWxfZG93bmxvYWRfZmlybXdhcmVfcGF5bG9hZChoZGV2LCBm
dywgUlNBX0hFQURFUl9MRU4pOw0KPiAgCQlpZiAoZXJyKQ0KPiAgCQkJcmV0dXJuIGVycjsNCj4g
IAl9IGVsc2UgaWYgKGh3X3ZhcmlhbnQgPj0gMHgxNykgew0KPiBAQCAtOTY4LDcgKzEwMjQsNiBA
QCBpbnQgYnRpbnRlbF9kb3dubG9hZF9maXJtd2FyZV9uZXdnZW4oc3RydWN0IGhjaV9kZXYgKmhk
ZXYsDQo+ICAJCQkJcmV0dXJuIGVycjsNCj4gIA0KPiAgCQkJZXJyID0gYnRpbnRlbF9kb3dubG9h
ZF9maXJtd2FyZV9wYXlsb2FkKGhkZXYsIGZ3LA0KPiAtCQkJCQkJCQlib290X3BhcmFtLA0KPiAg
CQkJCQkJCQlSU0FfSEVBREVSX0xFTiArIEVDRFNBX0hFQURFUl9MRU4pOw0KPiAgCQkJaWYgKGVy
cikNCj4gIAkJCQlyZXR1cm4gZXJyOw0KPiBAQCAtOTc4LDcgKzEwMzMsNiBAQCBpbnQgYnRpbnRl
bF9kb3dubG9hZF9maXJtd2FyZV9uZXdnZW4oc3RydWN0IGhjaV9kZXYgKmhkZXYsDQo+ICAJCQkJ
cmV0dXJuIGVycjsNCj4gIA0KPiAgCQkJZXJyID0gYnRpbnRlbF9kb3dubG9hZF9maXJtd2FyZV9w
YXlsb2FkKGhkZXYsIGZ3LA0KPiAtCQkJCQkJCQlib290X3BhcmFtLA0KPiAgCQkJCQkJCQlSU0Ff
SEVBREVSX0xFTiArIEVDRFNBX0hFQURFUl9MRU4pOw0KPiAgCQkJaWYgKGVycikNCj4gIAkJCQly
ZXR1cm4gZXJyOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibHVldG9vdGgvYnRpbnRlbC5oIGIv
ZHJpdmVycy9ibHVldG9vdGgvYnRpbnRlbC5oDQo+IGluZGV4IDY1MTFiMDkxY2FmNS4uNTFmMWYy
Yzg4M2I0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2JsdWV0b290aC9idGludGVsLmgNCj4gKysr
IGIvZHJpdmVycy9ibHVldG9vdGgvYnRpbnRlbC5oDQo+IEBAIC0xNjMsOSArMTYzLDEwIEBAIHN0
cnVjdCByZWdtYXAgKmJ0aW50ZWxfcmVnbWFwX2luaXQoc3RydWN0IGhjaV9kZXYgKmhkZXYsIHUx
NiBvcGNvZGVfcmVhZCwNCj4gIGludCBidGludGVsX3NlbmRfaW50ZWxfcmVzZXQoc3RydWN0IGhj
aV9kZXYgKmhkZXYsIHUzMiBib290X3BhcmFtKTsNCj4gIGludCBidGludGVsX3JlYWRfYm9vdF9w
YXJhbXMoc3RydWN0IGhjaV9kZXYgKmhkZXYsDQo+ICAJCQkgICAgIHN0cnVjdCBpbnRlbF9ib290
X3BhcmFtcyAqcGFyYW1zKTsNCj4gLWludCBidGludGVsX2Rvd25sb2FkX2Zpcm13YXJlKHN0cnVj
dCBoY2lfZGV2ICpkZXYsIGNvbnN0IHN0cnVjdCBmaXJtd2FyZSAqZncsDQo+IC0JCQkgICAgICB1
MzIgKmJvb3RfcGFyYW0pOw0KPiAraW50IGJ0aW50ZWxfZG93bmxvYWRfZmlybXdhcmUoc3RydWN0
IGhjaV9kZXYgKmRldiwgc3RydWN0IGludGVsX3ZlcnNpb24gKnZlciwNCj4gKwkJCSAgICAgIGNv
bnN0IHN0cnVjdCBmaXJtd2FyZSAqZncsIHUzMiAqYm9vdF9wYXJhbSk7DQo+ICBpbnQgYnRpbnRl
bF9kb3dubG9hZF9maXJtd2FyZV9uZXdnZW4oc3RydWN0IGhjaV9kZXYgKmhkZXYsDQo+ICsJCQkJ
ICAgICBzdHJ1Y3QgaW50ZWxfdmVyc2lvbl90bHYgKnZlciwNCj4gIAkJCQkgICAgIGNvbnN0IHN0
cnVjdCBmaXJtd2FyZSAqZncsDQo+ICAJCQkJICAgICB1MzIgKmJvb3RfcGFyYW0sIHU4IGh3X3Zh
cmlhbnQsDQo+ICAJCQkJICAgICB1OCBzYmVfdHlwZSk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2JsdWV0b290aC9idHVzYi5jIGIvZHJpdmVycy9ibHVldG9vdGgvYnR1c2IuYw0KPiBpbmRleCA0
MjY2YzA1Nzc0NmUuLjlhNGEzN2UzOTZiNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ibHVldG9v
dGgvYnR1c2IuYw0KPiArKysgYi9kcml2ZXJzL2JsdWV0b290aC9idHVzYi5jDQo+IEBAIC0yNjEy
LDEwICsyNjEyLDE2IEBAIHN0YXRpYyBpbnQgYnR1c2JfaW50ZWxfZG93bmxvYWRfZmlybXdhcmVf
bmV3Z2VuKHN0cnVjdCBoY2lfZGV2ICpoZGV2LA0KPiAgCXNldF9iaXQoQlRVU0JfRE9XTkxPQURJ
TkcsICZkYXRhLT5mbGFncyk7DQo+ICANCj4gIAkvKiBTdGFydCBmaXJtd2FyZSBkb3dubG9hZGlu
ZyBhbmQgZ2V0IGJvb3QgcGFyYW1ldGVyICovDQo+IC0JZXJyID0gYnRpbnRlbF9kb3dubG9hZF9m
aXJtd2FyZV9uZXdnZW4oaGRldiwgZncsIGJvb3RfcGFyYW0sDQo+ICsJZXJyID0gYnRpbnRlbF9k
b3dubG9hZF9maXJtd2FyZV9uZXdnZW4oaGRldiwgdmVyLCBmdywgYm9vdF9wYXJhbSwNCj4gIAkJ
CQkJICAgICAgIElOVEVMX0hXX1ZBUklBTlQodmVyLT5jbnZpX2J0KSwNCj4gIAkJCQkJICAgICAg
IHZlci0+c2JlX3R5cGUpOw0KPiAgCWlmIChlcnIgPCAwKSB7DQo+ICsJCWlmIChlcnIgPT0gLUVB
TFJFQURZKSB7DQo+ICsJCQkvKiBGaXJtd2FyZSBoYXMgYWxyZWFkeSBiZWVuIGxvYWRlZCAqLw0K
PiArCQkJc2V0X2JpdChCVFVTQl9GSVJNV0FSRV9MT0FERUQsICZkYXRhLT5mbGFncyk7DQo+ICsJ
CQlnb3RvIGRvbmU7DQo+ICsJCX0NCj4gKw0KPiAgCQkvKiBXaGVuIEZXIGRvd25sb2FkIGZhaWxz
LCBzZW5kIEludGVsIFJlc2V0IHRvIHJldHJ5DQo+ICAJCSAqIEZXIGRvd25sb2FkLg0KPiAgCQkg
Ki8NCj4gQEAgLTI4MDYsOCArMjgxMiwxNCBAQCBzdGF0aWMgaW50IGJ0dXNiX2ludGVsX2Rvd25s
b2FkX2Zpcm13YXJlKHN0cnVjdCBoY2lfZGV2ICpoZGV2LA0KPiAgCXNldF9iaXQoQlRVU0JfRE9X
TkxPQURJTkcsICZkYXRhLT5mbGFncyk7DQo+ICANCj4gIAkvKiBTdGFydCBmaXJtd2FyZSBkb3du
bG9hZGluZyBhbmQgZ2V0IGJvb3QgcGFyYW1ldGVyICovDQo+IC0JZXJyID0gYnRpbnRlbF9kb3du
bG9hZF9maXJtd2FyZShoZGV2LCBmdywgYm9vdF9wYXJhbSk7DQo+ICsJZXJyID0gYnRpbnRlbF9k
b3dubG9hZF9maXJtd2FyZShoZGV2LCB2ZXIsIGZ3LCBib290X3BhcmFtKTsNCj4gIAlpZiAoZXJy
IDwgMCkgew0KPiArCQlpZiAoZXJyID09IC1FQUxSRUFEWSkgew0KPiArCQkJLyogRmlybXdhcmUg
aGFzIGFscmVhZHkgYmVlbiBsb2FkZWQgKi8NCj4gKwkJCXNldF9iaXQoQlRVU0JfRklSTVdBUkVf
TE9BREVELCAmZGF0YS0+ZmxhZ3MpOw0KPiArCQkJZ290byBkb25lOw0KPiArCQl9DQo+ICsNCj4g
IAkJLyogV2hlbiBGVyBkb3dubG9hZCBmYWlscywgc2VuZCBJbnRlbCBSZXNldCB0byByZXRyeQ0K
PiAgCQkgKiBGVyBkb3dubG9hZC4NCj4gIAkJICovDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Js
dWV0b290aC9oY2lfaW50ZWwuYyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2hjaV9pbnRlbC5jDQo+IGlu
ZGV4IGIyMGE0MGZhYjgzZS4uNzI0OWI5MWQ5YjkxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2Js
dWV0b290aC9oY2lfaW50ZWwuYw0KPiArKysgYi9kcml2ZXJzL2JsdWV0b290aC9oY2lfaW50ZWwu
Yw0KPiBAQCAtNzM1LDcgKzczNSw3IEBAIHN0YXRpYyBpbnQgaW50ZWxfc2V0dXAoc3RydWN0IGhj
aV91YXJ0ICpodSkNCj4gIAlzZXRfYml0KFNUQVRFX0RPV05MT0FESU5HLCAmaW50ZWwtPmZsYWdz
KTsNCj4gIA0KPiAgCS8qIFN0YXJ0IGZpcm13YXJlIGRvd25sb2FkaW5nIGFuZCBnZXQgYm9vdCBw
YXJhbWV0ZXIgKi8NCj4gLQllcnIgPSBidGludGVsX2Rvd25sb2FkX2Zpcm13YXJlKGhkZXYsIGZ3
LCAmYm9vdF9wYXJhbSk7DQo+ICsJZXJyID0gYnRpbnRlbF9kb3dubG9hZF9maXJtd2FyZShoZGV2
LCAmdmVyLCBmdywgJmJvb3RfcGFyYW0pOw0KPiAgCWlmIChlcnIgPCAwKQ0KPiAgCQlnb3RvIGRv
bmU7DQo+ICANCj4gQEAgLTc4NCw3ICs3ODQsMTAgQEAgc3RhdGljIGludCBpbnRlbF9zZXR1cChz
dHJ1Y3QgaGNpX3VhcnQgKmh1KQ0KPiAgZG9uZToNCj4gIAlyZWxlYXNlX2Zpcm13YXJlKGZ3KTsN
Cj4gIA0KPiAtCWlmIChlcnIgPCAwKQ0KPiArCS8qIENoZWNrIGlmIHRoZXJlIHdhcyBhbiBlcnJv
ciBhbmQgaWYgaXMgbm90IC1FQUxSRUFEWSB3aGljaCBtZWFucyB0aGUNCj4gKwkgKiBmaXJtd2Fy
ZSBoYXMgYWxyZWFkeSBiZWVuIGxvYWRlZC4NCj4gKwkgKi8NCj4gKwlpZiAoZXJyIDwgMCAmJiBl
cnIgIT0gLUVBTFJFQURZKQ0KPiAgCQlyZXR1cm4gZXJyOw0KPiAgDQo+ICAJLyogV2UgbmVlZCB0
byByZXN0b3JlIHRoZSBkZWZhdWx0IHNwZWVkIGJlZm9yZSBJbnRlbCByZXNldCAqLw0K
