Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1E0A139758
	for <lists+linux-bluetooth@lfdr.de>; Mon, 13 Jan 2020 18:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727331AbgAMRS0 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 13 Jan 2020 12:18:26 -0500
Received: from mga11.intel.com ([192.55.52.93]:5244 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727222AbgAMRS0 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 13 Jan 2020 12:18:26 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Jan 2020 09:18:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,429,1571727600"; 
   d="scan'208";a="218719157"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jan 2020 09:18:10 -0800
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 13 Jan 2020 09:18:10 -0800
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 13 Jan 2020 09:18:10 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 13 Jan 2020 09:18:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4gnA7mVWXjNcW/PohQPHt5vCUJw2qS1xlYNYVfYF8aX2ePGVnSaJdysFEi9hknvmwQe2m5Of0ELg/v7ImuKO6oyshUojb5F+wK1s2v7IdXwUPZvmYAEiphvw3SMy6r0Tv2xQ/Aa26nb/mLLtsHs1ivRh0laPTwzJ1OkYhMotR2RNRbQmdWsbT8jcqFTbiqCPe3qgY96zS0lJPfxyaC2Wj98AYd4RVIlVbRQgJ2zR59TrGN3LSSWc4j6xlqrn/xId9LMust43ZeHu8t9FGXoESEUrMob9p5tfPemCnLLrHbbtTlGJ6ZNfOWJKQJLBKCFYMrnIpKHjnFenDtlY+PwLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39uXgwC290DaJc/vku8RnlIKAadB6goMm7VOvd2ifQ4=;
 b=dKIRDtDOE3I1S7gzPbaq4HOy08U8LQTdl5G1S4di3XTnhCqaj0ND4NhSa62CC+GjTkB1BHe5jv9lQQW23cDBRVpfcASXOHh6y6i8EXnhfWRK2rIEVBh3EUCh1S8lZJeglm3mSSUsaGnyu8A6a24zUFEfV+sex+l7QLy1pa7fgBezgzjokV5Roumuayi+j4vo9AWSF2FVoDwvZMqWW2TYxBWerd0agw8kQMxFl3I0q2sgFDmI76L4BlQZ4qJCqkIFfFHS4ghcUaUKEi59KiXD9I7eSVJlS6FwTnT1rTWTCc71vJ68CJVQBolVn+IA24ZZ0aRyLfZJWimW7XPoyyILJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39uXgwC290DaJc/vku8RnlIKAadB6goMm7VOvd2ifQ4=;
 b=sUknX+bHOfuyKo3JsY6m4cr80lcXtqz3OhZbPnnd4Nrd+6lhJcNQNJNROpFf9JW3ztkzyVhtegwP4JiW8GRqfeyVJ6YfAtjYEmJ5DA+KyETayExXtNqr0VyRVMO2pTE7XTpsTuiPaMnF+UTJvA4C4WAcNyA7YUuEi7nmhfbQuXM=
Received: from MWHPR11MB1664.namprd11.prod.outlook.com (10.172.54.13) by
 MWHPR11MB1376.namprd11.prod.outlook.com (10.169.230.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Mon, 13 Jan 2020 17:18:08 +0000
Received: from MWHPR11MB1664.namprd11.prod.outlook.com
 ([fe80::e8fb:c0e8:5779:367e]) by MWHPR11MB1664.namprd11.prod.outlook.com
 ([fe80::e8fb:c0e8:5779:367e%6]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 17:18:08 +0000
From:   "Gix, Brian" <brian.gix@intel.com>
To:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
CC:     "michal.lowas-rzechonek@silvair.com" 
        <michal.lowas-rzechonek@silvair.com>,
        "Stotland, Inga" <inga.stotland@intel.com>
Subject: Re: [PATCH BlueZ v4 1/1] mesh: Implement provisioning loop-back
Thread-Topic: [PATCH BlueZ v4 1/1] mesh: Implement provisioning loop-back
Thread-Index: AQHVyWO5rAo1z2hmnU+BOd1lF1jcWKfo2BCA
Date:   Mon, 13 Jan 2020 17:18:08 +0000
Message-ID: <801944f8a6cc6e43e865921a2ccec4d754c73901.camel@intel.com>
References: <20200112161608.24919-1-brian.gix@intel.com>
         <20200112161608.24919-2-brian.gix@intel.com>
In-Reply-To: <20200112161608.24919-2-brian.gix@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=brian.gix@intel.com; 
x-originating-ip: [192.55.54.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34a4eb37-9a23-4930-4f47-08d7984c8f2b
x-ms-traffictypediagnostic: MWHPR11MB1376:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB137688F9DC385E33D92FEEFCE1350@MWHPR11MB1376.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(366004)(376002)(346002)(39860400002)(199004)(189003)(107886003)(4326008)(86362001)(478600001)(81156014)(5660300002)(81166006)(8936002)(8676002)(6512007)(91956017)(6486002)(76116006)(36756003)(64756008)(66946007)(66476007)(66556008)(66446008)(6916009)(2906002)(26005)(6506007)(71200400001)(2616005)(186003)(54906003)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR11MB1376;H:MWHPR11MB1664.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pI/WazjIYnOkhKWcQ0zzl3JEDmBNzlFfGs8hBLw7NPCX/Hr1nDeUfYIMvbHCeT2NiB7BEVOvOq4nInGrDk+q1i5tStHGAPzL2jGS+/lQ5SEonz17uQfvFsqumS4M0W/HVtj1TfeInxc2YtE/JrsL5xBVfKT0HsJcckm3rGb73ZGPm2WWwXZfRfGX+7e7UP0aRmKkVx6RGE02L5fvSLYwleGZYHHZkSqTy+rmafJ9HM6R4lTGkObnyh7X8+Z0m3tEJUYU8jPr9xvrTNvaczx0BEAEiey20I6c/sbuCSqvv/4SNcY/Xem28YWAdfhWhJzR5vyBwe4AYmUoRIE0vFiCiFJcTd5WSUlOikAxAwxE9uuzY+/bkqAKlie2x0xRKUh9m6qcl0zCzqGykGe3nkb0v35aqDnj5jsSm3eocatqnXCDj6hoG+9/qiJLn8EAqrrK
Content-Type: text/plain; charset="utf-8"
Content-ID: <382AB9FE49C48840886CF7DA90D0BC7D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a4eb37-9a23-4930-4f47-08d7984c8f2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 17:18:08.1661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZB58yyz7iR4fvBRrso+rXBrHhoGhJVH4LTElByYAaNFjSWBZvAXJ+Vbg0tal2E6vfe325p9rmfo7P+JEPCD89g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1376
X-OriginatorOrg: intel.com
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

QXBwbGllZA0KT24gU3VuLCAyMDIwLTAxLTEyIGF0IDA4OjE2IC0wODAwLCBCcmlhbiBHaXggd3Jv
dGU6DQo+IFRoaXMgYWxsb3dzIG9uZSBBcHAgdXNpbmcgdGhlIG1lc2ggZGFlbW9uIHRvIHByb3Zp
c2lvbiBhbm90aGVyLg0KPiAtLS0NCj4gIG1lc2gvcGItYWR2LmMgfCAxNjMgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxMzAgaW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
bWVzaC9wYi1hZHYuYyBiL21lc2gvcGItYWR2LmMNCj4gaW5kZXggYzlhMmE2NTc0Li42ZWY0NWI4
YjAgMTAwNjQ0DQo+IC0tLSBhL21lc2gvcGItYWR2LmMNCj4gKysrIGIvbWVzaC9wYi1hZHYuYw0K
PiBAQCAtMzksNiArMzksNyBAQCBzdHJ1Y3QgcGJfYWR2X3Nlc3Npb24gew0KPiAgCW1lc2hfcHJv
dl9yZWNlaXZlX2Z1bmNfdCByeF9jYjsNCj4gIAltZXNoX3Byb3ZfYWNrX2Z1bmNfdCBhY2tfY2I7
DQo+ICAJc3RydWN0IGxfdGltZW91dCAqdHhfdGltZW91dDsNCj4gKwlzdHJ1Y3QgcGJfYWR2X3Nl
c3Npb24gKmxvb3A7DQo+ICAJdWludDMyX3QgbGlua19pZDsNCj4gIAl1aW50MTZfdCBleHBfbGVu
Ow0KPiAgCXVpbnQ4X3QgZXhwX2ZjczsNCj4gQEAgLTkzLDEwICs5NCw0MyBAQCBzdHJ1Y3QgcGJf
Y2xvc2VfaW5kIHsNCj4gIAl1aW50OF90IHJlYXNvbjsNCj4gIH0gX19wYWNrZWQ7DQo+ICANCj4g
LXN0YXRpYyBzdHJ1Y3QgcGJfYWR2X3Nlc3Npb24gKnBiX3Nlc3Npb24gPSBOVUxMOw0KPiArc3Ry
dWN0IGlkbGVfcnggew0KPiArCXN0cnVjdCBwYl9hZHZfc2Vzc2lvbiAqc2Vzc2lvbjsNCj4gKwl1
aW50MTZfdCBsZW47DQo+ICsJdWludDhfdCBkYXRhW1BCX0FEVl9NVFUgKyA2XTsNCj4gK307DQo+
ICsNCj4gK3N0YXRpYyBzdHJ1Y3QgbF9xdWV1ZSAqcGJfc2Vzc2lvbnMgPSBOVUxMOw0KPiAgDQo+
ICBzdGF0aWMgY29uc3QgdWludDhfdCBmaWx0ZXJbMV0gPSB7IE1FU0hfQURfVFlQRV9QUk9WSVNJ
T04gfTsNCj4gIA0KPiArc3RhdGljIHZvaWQgcGJfYWR2X3BhY2tldCh2b2lkICp1c2VyX2RhdGEs
IGNvbnN0IHVpbnQ4X3QgKnBrdCwgdWludDE2X3QgbGVuKTsNCj4gKw0KPiArc3RhdGljIHZvaWQg
aWRsZV9yeF9hZHYodm9pZCAqdXNlcl9kYXRhKQ0KPiArew0KPiArCXN0cnVjdCBpZGxlX3J4ICpy
eCA9IHVzZXJfZGF0YTsNCj4gKw0KPiArCXBiX2Fkdl9wYWNrZXQocngtPnNlc3Npb24sIHJ4LT5k
YXRhLCByeC0+bGVuKTsNCj4gKwlsX2ZyZWUocngpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9p
ZCBwYl9hZHZfc2VuZChzdHJ1Y3QgcGJfYWR2X3Nlc3Npb24gKnNlc3Npb24sDQo+ICsJCQkJCXVp
bnQ4X3QgY291bnQsIHVpbnQxNl90IGludGVydmFsLA0KPiArCQkJCQl2b2lkICpkYXRhLCB1aW50
MTZfdCBsZW4pDQo+ICt7DQo+ICsJc3RydWN0IGlkbGVfcnggKnJ4Ow0KPiArDQo+ICsJaWYgKHNl
c3Npb24tPmxvb3ApIHsNCj4gKwkJcnggPSBsX25ldyhzdHJ1Y3QgaWRsZV9yeCwgMSk7DQo+ICsJ
CXJ4LT5zZXNzaW9uID0gc2Vzc2lvbi0+bG9vcDsNCj4gKwkJcngtPmxlbiA9IGxlbjsNCj4gKwkJ
bWVtY3B5KHJ4LT5kYXRhLCBkYXRhLCBsZW4pOw0KPiArDQo+ICsJCWxfaWRsZV9vbmVzaG90KGlk
bGVfcnhfYWR2LCByeCwgTlVMTCk7DQo+ICsJfSBlbHNlDQo+ICsJCW1lc2hfc2VuZF9wa3QoY291
bnQsIGludGVydmFsLCBkYXRhLCBsZW4pOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgdm9pZCBzZW5k
X2Fkdl9zZWdzKHN0cnVjdCBwYl9hZHZfc2Vzc2lvbiAqc2Vzc2lvbiwgY29uc3QgdWludDhfdCAq
ZGF0YSwNCj4gIAkJCQkJCQl1aW50MTZfdCBzaXplKQ0KPiAgew0KPiBAQCAtMTM1LDcgKzE2OSw5
IEBAIHN0YXRpYyB2b2lkIHNlbmRfYWR2X3NlZ3Moc3RydWN0IHBiX2Fkdl9zZXNzaW9uICpzZXNz
aW9uLCBjb25zdCB1aW50OF90ICpkYXRhLA0KPiAgCWxfZGVidWcoIm1heF9zZWc6ICUyLjJ4Iiwg
bWF4X3NlZyk7DQo+ICAJbF9kZWJ1Zygic2l6ZTogJTIuMngsIENSQzogJTIuMngiLCBzaXplLCBi
dWZbOV0pOw0KPiAgCS8qIHByaW50X3BhY2tldCgiUEItVFgiLCBidWYgKyAxLCBpbml0X3NpemUg
KyA5KTsgKi8NCj4gLQltZXNoX3NlbmRfcGt0KE1FU0hfSU9fVFhfQ09VTlRfVU5MSU1JVEVELCAy
MDAsIGJ1ZiwgaW5pdF9zaXplICsgMTApOw0KPiArDQo+ICsJcGJfYWR2X3NlbmQoc2Vzc2lvbiwg
TUVTSF9JT19UWF9DT1VOVF9VTkxJTUlURUQsIDIwMCwNCj4gKwkJCQkJCQlidWYsIGluaXRfc2l6
ZSArIDEwKTsNCj4gIA0KPiAgCWNvbnN1bWVkID0gaW5pdF9zaXplOw0KPiAgDQo+IEBAIC0xNTIs
MTkgKzE4OCwzOSBAQCBzdGF0aWMgdm9pZCBzZW5kX2Fkdl9zZWdzKHN0cnVjdCBwYl9hZHZfc2Vz
c2lvbiAqc2Vzc2lvbiwgY29uc3QgdWludDhfdCAqZGF0YSwNCj4gIA0KPiAgCQkvKiBwcmludF9w
YWNrZXQoIlBCLVRYIiwgYnVmICsgMSwgc2VnX3NpemUgKyA2KTsgKi8NCj4gIA0KPiAtCQltZXNo
X3NlbmRfcGt0KE1FU0hfSU9fVFhfQ09VTlRfVU5MSU1JVEVELCAyMDAsDQo+ICsJCXBiX2Fkdl9z
ZW5kKHNlc3Npb24sIE1FU0hfSU9fVFhfQ09VTlRfVU5MSU1JVEVELCAyMDAsDQo+ICAJCQkJCQkJ
YnVmLCBzZWdfc2l6ZSArIDcpOw0KPiAgDQo+ICAJCWNvbnN1bWVkICs9IHNlZ19zaXplOw0KPiAg
CX0NCj4gIH0NCj4gIA0KPiArc3RhdGljIGJvb2wgc2Vzc2lvbl9tYXRjaCAoY29uc3Qgdm9pZCAq
YSwgY29uc3Qgdm9pZCAqYikNCj4gK3sNCj4gKwlyZXR1cm4gYSA9PSBiOw0KPiArfQ0KPiArDQo+
ICtzdGF0aWMgYm9vbCB1dWlkX21hdGNoIChjb25zdCB2b2lkICphLCBjb25zdCB2b2lkICpiKQ0K
PiArew0KPiArCWNvbnN0IHN0cnVjdCBwYl9hZHZfc2Vzc2lvbiAqc2Vzc2lvbiA9IGE7DQo+ICsJ
Y29uc3QgdWludDhfdCAqdXVpZCA9IGI7DQo+ICsNCj4gKwlyZXR1cm4gIW1lbWNtcChzZXNzaW9u
LT51dWlkLCB1dWlkLCBzaXplb2Yoc2Vzc2lvbi0+dXVpZCkpOw0KPiArfQ0KPiArDQo+ICtzdGF0
aWMgYm9vbCB1c2VyX21hdGNoIChjb25zdCB2b2lkICphLCBjb25zdCB2b2lkICpiKQ0KPiArew0K
PiArCWNvbnN0IHN0cnVjdCBwYl9hZHZfc2Vzc2lvbiAqc2Vzc2lvbiA9IGE7DQo+ICsNCj4gKwly
ZXR1cm4gc2Vzc2lvbi0+dXNlcl9kYXRhID09IGI7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyB2b2lk
IHR4X3RpbWVvdXQoc3RydWN0IGxfdGltZW91dCAqdGltZW91dCwgdm9pZCAqdXNlcl9kYXRhKQ0K
PiAgew0KPiAgCXN0cnVjdCBwYl9hZHZfc2Vzc2lvbiAqc2Vzc2lvbiA9IHVzZXJfZGF0YTsNCj4g
IAltZXNoX3Byb3ZfY2xvc2VfZnVuY190IGNiOw0KPiAgDQo+IC0JaWYgKCFzZXNzaW9uIHx8IHBi
X3Nlc3Npb24gIT0gc2Vzc2lvbikNCj4gKwlpZiAoIWxfcXVldWVfZmluZChwYl9zZXNzaW9ucywg
c2Vzc2lvbl9tYXRjaCwgc2Vzc2lvbikpDQo+ICAJCXJldHVybjsNCj4gIA0KPiAgCWxfdGltZW91
dF9yZW1vdmUoc2Vzc2lvbi0+dHhfdGltZW91dCk7DQo+IEBAIC0xNzMsOCArMjI5LDggQEAgc3Rh
dGljIHZvaWQgdHhfdGltZW91dChzdHJ1Y3QgbF90aW1lb3V0ICp0aW1lb3V0LCB2b2lkICp1c2Vy
X2RhdGEpDQo+ICAJbWVzaF9zZW5kX2NhbmNlbChmaWx0ZXIsIHNpemVvZihmaWx0ZXIpKTsNCj4g
IA0KPiAgCWxfaW5mbygiVFggdGltZW91dCIpOw0KPiAtCWNiID0gcGJfc2Vzc2lvbi0+Y2xvc2Vf
Y2I7DQo+IC0JdXNlcl9kYXRhID0gcGJfc2Vzc2lvbi0+dXNlcl9kYXRhOw0KPiArCWNiID0gc2Vz
c2lvbi0+Y2xvc2VfY2I7DQo+ICsJdXNlcl9kYXRhID0gc2Vzc2lvbi0+dXNlcl9kYXRhOw0KPiAg
CWNiKHVzZXJfZGF0YSwgMSk7DQo+ICB9DQo+ICANCj4gQEAgLTE4Miw3ICsyMzgsNyBAQCBzdGF0
aWMgdm9pZCBwYl9hZHZfdHgodm9pZCAqdXNlcl9kYXRhLCB2b2lkICpkYXRhLCB1aW50MTZfdCBs
ZW4pDQo+ICB7DQo+ICAJc3RydWN0IHBiX2Fkdl9zZXNzaW9uICpzZXNzaW9uID0gdXNlcl9kYXRh
Ow0KPiAgDQo+IC0JaWYgKCFzZXNzaW9uIHx8IHBiX3Nlc3Npb24gIT0gc2Vzc2lvbikNCj4gKwlp
ZiAoIWxfcXVldWVfZmluZChwYl9zZXNzaW9ucywgc2Vzc2lvbl9tYXRjaCwgc2Vzc2lvbikpDQo+
ICAJCXJldHVybjsNCj4gIA0KPiAgCWxfdGltZW91dF9yZW1vdmUoc2Vzc2lvbi0+dHhfdGltZW91
dCk7DQo+IEBAIC0yMDEsNyArMjU3LDggQEAgc3RhdGljIHZvaWQgc2VuZF9vcGVuX3JlcShzdHJ1
Y3QgcGJfYWR2X3Nlc3Npb24gKnNlc3Npb24pDQo+ICAJbWVtY3B5KG9wZW5fcmVxLnV1aWQsIHNl
c3Npb24tPnV1aWQsIDE2KTsNCj4gIA0KPiAgCW1lc2hfc2VuZF9jYW5jZWwoZmlsdGVyLCBzaXpl
b2YoZmlsdGVyKSk7DQo+IC0JbWVzaF9zZW5kX3BrdChNRVNIX0lPX1RYX0NPVU5UX1VOTElNSVRF
RCwgNTAwLCAmb3Blbl9yZXEsDQo+ICsNCj4gKwlwYl9hZHZfc2VuZChzZXNzaW9uLCBNRVNIX0lP
X1RYX0NPVU5UX1VOTElNSVRFRCwgNTAwLCAmb3Blbl9yZXEsDQo+ICAJCQkJCQkJc2l6ZW9mKG9w
ZW5fcmVxKSk7DQo+ICB9DQo+ICANCj4gQEAgLTIxNCw3ICsyNzEsOCBAQCBzdGF0aWMgdm9pZCBz
ZW5kX29wZW5fY2ZtKHN0cnVjdCBwYl9hZHZfc2Vzc2lvbiAqc2Vzc2lvbikNCj4gIAlvcGVuX2Nm
bS5vcGNvZGUgPSBQQl9BRFZfT1BFTl9DRk07DQo+ICANCj4gIAltZXNoX3NlbmRfY2FuY2VsKGZp
bHRlciwgc2l6ZW9mKGZpbHRlcikpOw0KPiAtCW1lc2hfc2VuZF9wa3QoTUVTSF9JT19UWF9DT1VO
VF9VTkxJTUlURUQsIDUwMCwgJm9wZW5fY2ZtLA0KPiArDQo+ICsJcGJfYWR2X3NlbmQoc2Vzc2lv
biwgTUVTSF9JT19UWF9DT1VOVF9VTkxJTUlURUQsIDUwMCwgJm9wZW5fY2ZtLA0KPiAgCQkJCQkJ
CXNpemVvZihvcGVuX2NmbSkpOw0KPiAgfQ0KPiAgDQo+IEBAIC0yMjIsMTggKzI4MCwyMSBAQCBz
dGF0aWMgdm9pZCBzZW5kX2FjayhzdHJ1Y3QgcGJfYWR2X3Nlc3Npb24gKnNlc3Npb24sIHVpbnQ4
X3QgdHJhbnNfbnVtKQ0KPiAgew0KPiAgCXN0cnVjdCBwYl9hY2sgYWNrID0geyBNRVNIX0FEX1RZ
UEVfUFJPVklTSU9OIH07DQo+ICANCj4gKwlpZiAoIWxfcXVldWVfZmluZChwYl9zZXNzaW9ucywg
c2Vzc2lvbl9tYXRjaCwgc2Vzc2lvbikpDQo+ICsJCXJldHVybjsNCj4gKw0KPiAgCWxfcHV0X2Jl
MzIoc2Vzc2lvbi0+bGlua19pZCwgJmFjay5saW5rX2lkKTsNCj4gIAlhY2sudHJhbnNfbnVtID0g
dHJhbnNfbnVtOw0KPiAgCWFjay5vcGNvZGUgPSBQQl9BRFZfQUNLOw0KPiAgDQo+IC0JbWVzaF9z
ZW5kX3BrdCgxLCAxMDAsICZhY2ssIHNpemVvZihhY2spKTsNCj4gKwlwYl9hZHZfc2VuZChzZXNz
aW9uLCAxLCAxMDAsICZhY2ssIHNpemVvZihhY2spKTsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIHZv
aWQgc2VuZF9jbG9zZV9pbmQoc3RydWN0IHBiX2Fkdl9zZXNzaW9uICpzZXNzaW9uLCB1aW50OF90
IHJlYXNvbikNCj4gIHsNCj4gIAlzdHJ1Y3QgcGJfY2xvc2VfaW5kIGNsb3NlX2luZCA9IHsgTUVT
SF9BRF9UWVBFX1BST1ZJU0lPTiB9Ow0KPiAgDQo+IC0JaWYgKCFwYl9zZXNzaW9uIHx8IHBiX3Nl
c3Npb24gIT0gc2Vzc2lvbikNCj4gKwlpZiAoIWxfcXVldWVfZmluZChwYl9zZXNzaW9ucywgc2Vz
c2lvbl9tYXRjaCwgc2Vzc2lvbikpDQo+ICAJCXJldHVybjsNCj4gIA0KPiAgCWxfcHV0X2JlMzIo
c2Vzc2lvbi0+bGlua19pZCwgJmNsb3NlX2luZC5saW5rX2lkKTsNCj4gQEAgLTI0Miw3ICszMDMs
OCBAQCBzdGF0aWMgdm9pZCBzZW5kX2Nsb3NlX2luZChzdHJ1Y3QgcGJfYWR2X3Nlc3Npb24gKnNl
c3Npb24sIHVpbnQ4X3QgcmVhc29uKQ0KPiAgCWNsb3NlX2luZC5yZWFzb24gPSByZWFzb247DQo+
ICANCj4gIAltZXNoX3NlbmRfY2FuY2VsKGZpbHRlciwgc2l6ZW9mKGZpbHRlcikpOw0KPiAtCW1l
c2hfc2VuZF9wa3QoMTAsIDEwMCwgJmNsb3NlX2luZCwgc2l6ZW9mKGNsb3NlX2luZCkpOw0KPiAr
DQo+ICsJcGJfYWR2X3NlbmQoc2Vzc2lvbiwgMTAsIDEwMCwgJmNsb3NlX2luZCwgc2l6ZW9mKGNs
b3NlX2luZCkpOw0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgdm9pZCBwYl9hZHZfcGFja2V0KHZvaWQg
KnVzZXJfZGF0YSwgY29uc3QgdWludDhfdCAqcGt0LCB1aW50MTZfdCBsZW4pDQo+IEBAIC0yNTQs
NyArMzE2LDcgQEAgc3RhdGljIHZvaWQgcGJfYWR2X3BhY2tldCh2b2lkICp1c2VyX2RhdGEsIGNv
bnN0IHVpbnQ4X3QgKnBrdCwgdWludDE2X3QgbGVuKQ0KPiAgCXVpbnQ4X3QgdHlwZTsNCj4gIAli
b29sIGZpcnN0Ow0KPiAgDQo+IC0JaWYgKCFwYl9zZXNzaW9uIHx8IHBiX3Nlc3Npb24gIT0gc2Vz
c2lvbikNCj4gKwlpZiAoIWxfcXVldWVfZmluZChwYl9zZXNzaW9ucywgc2Vzc2lvbl9tYXRjaCwg
c2Vzc2lvbikpDQo+ICAJCXJldHVybjsNCj4gIA0KPiAgCWxpbmtfaWQgPSBsX2dldF9iZTMyKHBr
dCArIDEpOw0KPiBAQCAtMzM3LDggKzM5OSw4IEBAIHN0YXRpYyB2b2lkIHBiX2Fkdl9wYWNrZXQo
dm9pZCAqdXNlcl9kYXRhLCBjb25zdCB1aW50OF90ICpwa3QsIHVpbnQxNl90IGxlbikNCj4gIAkJ
CW1lc2hfcHJvdl9jbG9zZV9mdW5jX3QgY2IgPSBzZXNzaW9uLT5jbG9zZV9jYjsNCj4gIAkJCXZv
aWQgKnVzZXJfZGF0YSA9IHNlc3Npb24tPnVzZXJfZGF0YTsNCj4gIA0KPiArCQkJbF9xdWV1ZV9y
ZW1vdmUocGJfc2Vzc2lvbnMsIHNlc3Npb24pOw0KPiAgCQkJbF9mcmVlKHNlc3Npb24pOw0KPiAt
CQkJcGJfc2Vzc2lvbiA9IE5VTEw7DQo+ICAJCQljYih1c2VyX2RhdGEsIHBrdFswXSk7DQo+ICAJ
CX0NCj4gIAkJYnJlYWs7DQo+IEBAIC00NDIsMzcgKzUwNCw3MiBAQCBib29sIHBiX2Fkdl9yZWco
Ym9vbCBpbml0aWF0b3IsIG1lc2hfcHJvdl9vcGVuX2Z1bmNfdCBvcGVuX2NiLA0KPiAgCQltZXNo
X3Byb3ZfcmVjZWl2ZV9mdW5jX3QgcnhfY2IsIG1lc2hfcHJvdl9hY2tfZnVuY190IGFja19jYiwN
Cj4gIAkJdWludDhfdCB1dWlkWzE2XSwgdm9pZCAqdXNlcl9kYXRhKQ0KPiAgew0KPiAtCWlmIChw
Yl9zZXNzaW9uKQ0KPiArCXN0cnVjdCBwYl9hZHZfc2Vzc2lvbiAqc2Vzc2lvbiwgKm9sZF9zZXNz
aW9uOw0KPiArDQo+ICsJaWYgKCFwYl9zZXNzaW9ucykNCj4gKwkJcGJfc2Vzc2lvbnMgPSBsX3F1
ZXVlX25ldygpOw0KPiArDQo+ICsJb2xkX3Nlc3Npb24gPSBsX3F1ZXVlX2ZpbmQocGJfc2Vzc2lv
bnMsIHV1aWRfbWF0Y2gsIHV1aWQpOw0KPiArDQo+ICsJLyogUmVqZWN0IDJuZCBzZXNzaW9uIGlm
IG5vdCBsb29waW5nIGJhY2sgKi8NCj4gKwlpZiAobF9xdWV1ZV9sZW5ndGgocGJfc2Vzc2lvbnMp
ICYmICFvbGRfc2Vzc2lvbikNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArDQo+ICsJLyogUmVqZWN0
IGxvb3BpbmcgdG8gbW9yZSB0aGFuIG9uZSBzZXNzaW9uIG9yIHdpdGggc2FtZSByb2xlKi8NCj4g
KwlpZiAob2xkX3Nlc3Npb24gJiYgKG9sZF9zZXNzaW9uLT5sb29wIHx8DQo+ICsJCQkJCW9sZF9z
ZXNzaW9uLT5pbml0aWF0b3IgPT0gaW5pdGlhdG9yKSkNCj4gIAkJcmV0dXJuIGZhbHNlOw0KPiAg
DQo+IC0JcGJfc2Vzc2lvbiA9IGxfbmV3KHN0cnVjdCBwYl9hZHZfc2Vzc2lvbiwgMSk7DQo+IC0J
cGJfc2Vzc2lvbi0+b3Blbl9jYiA9IG9wZW5fY2I7DQo+IC0JcGJfc2Vzc2lvbi0+Y2xvc2VfY2Ig
PSBjbG9zZV9jYjsNCj4gLQlwYl9zZXNzaW9uLT5yeF9jYiA9IHJ4X2NiOw0KPiAtCXBiX3Nlc3Np
b24tPmFja19jYiA9IGFja19jYjsNCj4gLQlwYl9zZXNzaW9uLT51c2VyX2RhdGEgPSB1c2VyX2Rh
dGE7DQo+IC0JcGJfc2Vzc2lvbi0+aW5pdGlhdG9yID0gaW5pdGlhdG9yOw0KPiAtCW1lbWNweShw
Yl9zZXNzaW9uLT51dWlkLCB1dWlkLCAxNik7DQo+ICsJc2Vzc2lvbiA9IGxfbmV3KHN0cnVjdCBw
Yl9hZHZfc2Vzc2lvbiwgMSk7DQo+ICsJc2Vzc2lvbi0+b3Blbl9jYiA9IG9wZW5fY2I7DQo+ICsJ
c2Vzc2lvbi0+Y2xvc2VfY2IgPSBjbG9zZV9jYjsNCj4gKwlzZXNzaW9uLT5yeF9jYiA9IHJ4X2Ni
Ow0KPiArCXNlc3Npb24tPmFja19jYiA9IGFja19jYjsNCj4gKwlzZXNzaW9uLT51c2VyX2RhdGEg
PSB1c2VyX2RhdGE7DQo+ICsJc2Vzc2lvbi0+aW5pdGlhdG9yID0gaW5pdGlhdG9yOw0KPiArCW1l
bWNweShzZXNzaW9uLT51dWlkLCB1dWlkLCAxNik7DQo+ICANCj4gLQltZXNoX3JlZ19wcm92X3J4
KHBiX2Fkdl9wYWNrZXQsIHBiX3Nlc3Npb24pOw0KPiArCWxfcXVldWVfcHVzaF9oZWFkKHBiX3Nl
c3Npb25zLCBzZXNzaW9uKTsNCj4gIA0KPiAgCWlmIChpbml0aWF0b3IpIHsNCj4gLQkJbF9nZXRy
YW5kb20oJnBiX3Nlc3Npb24tPmxpbmtfaWQsIHNpemVvZihwYl9zZXNzaW9uLT5saW5rX2lkKSk7
DQo+IC0JCXBiX3Nlc3Npb24tPnR4X3RpbWVvdXQgPSBsX3RpbWVvdXRfY3JlYXRlKDYwLCB0eF90
aW1lb3V0LA0KPiAtCQkJCQkJCXBiX3Nlc3Npb24sIE5VTEwpOw0KPiAtCQlzZW5kX29wZW5fcmVx
KHBiX3Nlc3Npb24pOw0KPiArCQlsX2dldHJhbmRvbSgmc2Vzc2lvbi0+bGlua19pZCwgc2l6ZW9m
KHNlc3Npb24tPmxpbmtfaWQpKTsNCj4gKwkJc2Vzc2lvbi0+dHhfdGltZW91dCA9IGxfdGltZW91
dF9jcmVhdGUoNjAsIHR4X3RpbWVvdXQsDQo+ICsJCQkJCQkJc2Vzc2lvbiwgTlVMTCk7DQo+ICsJ
fQ0KPiArDQo+ICsJLyogU2V0dXAgTG9vcC1iYWNrIGlmIGNvbXBsZW1lbnRhcnkgc2Vzc2lvbiB3
aXRoIHNhbWUgVVVJRCAqLw0KPiArCWlmIChvbGRfc2Vzc2lvbikgew0KPiArCQlzZXNzaW9uLT5s
b29wID0gb2xkX3Nlc3Npb247DQo+ICsJCW9sZF9zZXNzaW9uLT5sb29wID0gc2Vzc2lvbjsNCj4g
KwkJbWVzaF91bnJlZ19wcm92X3J4KHBiX2Fkdl9wYWNrZXQpOw0KPiArDQo+ICsJCWlmIChpbml0
aWF0b3IpDQo+ICsJCQlzZW5kX29wZW5fcmVxKHNlc3Npb24pOw0KPiArCQllbHNlDQo+ICsJCQlz
ZW5kX29wZW5fcmVxKG9sZF9zZXNzaW9uKTsNCj4gKw0KPiArCQlyZXR1cm4gdHJ1ZTsNCj4gIAl9
DQo+ICANCj4gKwltZXNoX3JlZ19wcm92X3J4KHBiX2Fkdl9wYWNrZXQsIHNlc3Npb24pOw0KPiAr
DQo+ICsJaWYgKGluaXRpYXRvcikNCj4gKwkJc2VuZF9vcGVuX3JlcShzZXNzaW9uKTsNCj4gKw0K
PiAgCXJldHVybiB0cnVlOw0KPiAgfQ0KPiAgDQo+ICB2b2lkIHBiX2Fkdl91bnJlZyh2b2lkICp1
c2VyX2RhdGEpDQo+ICB7DQo+IC0JaWYgKCFwYl9zZXNzaW9uIHx8IHBiX3Nlc3Npb24tPnVzZXJf
ZGF0YSAhPSB1c2VyX2RhdGEpDQo+ICsJc3RydWN0IHBiX2Fkdl9zZXNzaW9uICpzZXNzaW9uID0g
bF9xdWV1ZV9maW5kKHBiX3Nlc3Npb25zLA0KPiArCQkJCQkJdXNlcl9tYXRjaCwgdXNlcl9kYXRh
KTsNCj4gKw0KPiArCWlmICghc2Vzc2lvbikNCj4gIAkJcmV0dXJuOw0KPiAgDQo+IC0JbF90aW1l
b3V0X3JlbW92ZShwYl9zZXNzaW9uLT50eF90aW1lb3V0KTsNCj4gLQlzZW5kX2Nsb3NlX2luZChw
Yl9zZXNzaW9uLCAwKTsNCj4gLQlsX2ZyZWUocGJfc2Vzc2lvbik7DQo+IC0JcGJfc2Vzc2lvbiA9
IE5VTEw7DQo+ICsJbF90aW1lb3V0X3JlbW92ZShzZXNzaW9uLT50eF90aW1lb3V0KTsNCj4gKwlz
ZXNzaW9uLT50eF90aW1lb3V0ID0gTlVMTDsNCj4gKwlzZW5kX2Nsb3NlX2luZChzZXNzaW9uLCAw
KTsNCj4gKwlsX3F1ZXVlX3JlbW92ZShwYl9zZXNzaW9ucywgc2Vzc2lvbik7DQo+ICsJbF9mcmVl
KHNlc3Npb24pOw0KPiAgfQ0K
