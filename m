Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2971B2ADE49
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Nov 2020 19:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgKJS1a (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 10 Nov 2020 13:27:30 -0500
Received: from mga11.intel.com ([192.55.52.93]:55406 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbgKJS10 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 10 Nov 2020 13:27:26 -0500
IronPort-SDR: K/7KKqAvoZdZFZFkHADkUNOKb+EqmX7vDC1QQb9Fl2sKa1xzAFnlG0inJzh7zGz0fiaU0pniGe
 62Nc0engBQQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="166517436"
X-IronPort-AV: E=Sophos;i="5.77,467,1596524400"; 
   d="scan'208";a="166517436"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 10:27:09 -0800
IronPort-SDR: wH81aLUIMDW5ShxhBcut4kyevNoPUdBbCs3r2bYARTh1gqP1BX0pF7ZY3J9ZrTndsktLKKuhdA
 QV+IS6o0u2ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,467,1596524400"; 
   d="scan'208";a="327777811"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga006.jf.intel.com with ESMTP; 10 Nov 2020 10:27:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 10 Nov 2020 10:27:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 10 Nov 2020 10:27:08 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (104.47.38.57) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 10 Nov 2020 10:27:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OyuzzVccNLpb2H3lIqCyrdTMM1xe7JgoOyXnDcdAuS84aVad8XO87nwSvGNvAoU/8pj+gS1ZQHnL4X536L/u5n8g2M/OxsVA6ikdkbxOaXPBGLwqLI2sRVQSdjFmXpF4wgnLeOfoKqYBv8mr68Nzvz3Zeun+gDGphGFKte3BhP0h2f7Hy2IQqOxZYRJOsixUcJ0mJjC8O97jB3SFsqprmT7iNjsnmGB7b9HbON3TC1/Op+i7XQCTZxpu0YG1sEYOegkAZsvSgklaiAXYNuBaDIBY9wGts94AsjMSaDXjY6v4JvdVXk2+M4mPXusOHLIjt5c2tB8virH8uzNqms9FWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alUf2/40pYveATT9Pr9Oh5Nv7YLje9YYajIaPF5JZiU=;
 b=QZK/36QZqhNvk85R9Osuv3JqCx3bDZ139/W9vIaNr7oqLfx6FhSYIsQ7k61aq1SSiSR9Gbcwgo5cKyI4PBtgsVdbiVfOxeMTsz78+33hAIRLgsyZ3A8vFYyvhEQQWhGXcL71tdCURc07Ou9U8duHzHGmGel4kO/jtWUno70cQryIziPh/AI98VoJ1so6De9IY1Ane+bKCADPFIJ9hoU3LgbYpsGmexDViyW6HnQ0hhS3e3z8ySCvbvNynA9yPGoUw+zsE7qO42I/P200yI1GQ4mpw3mb0Fg12EOS+XQWEXf+/T+DdGiQ2uo2HfHXFKsChjHzEIoGureYQBdNzD6Otg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alUf2/40pYveATT9Pr9Oh5Nv7YLje9YYajIaPF5JZiU=;
 b=aJ5BusIDEkgJ6/l2iqcQJzu8ZuFkqwhuVpcgG+x+8TRFliy1N5U6UUkpY3F7i5dZCdJhj0MEhchlMWU+vybGIItQhLhwSXbkpLo4M+/8X8pS/CT34LSINIzJgU2J4mPyDPE13GdBjic4kUXYAdDx4YkBw7zM7zZ1evFHk4XlZRA=
Received: from MW3PR11MB4539.namprd11.prod.outlook.com (2603:10b6:303:2f::13)
 by MWHPR11MB2029.namprd11.prod.outlook.com (2603:10b6:300:27::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Tue, 10 Nov
 2020 18:27:07 +0000
Received: from MW3PR11MB4539.namprd11.prod.outlook.com
 ([fe80::80b8:462a:6fde:926]) by MW3PR11MB4539.namprd11.prod.outlook.com
 ([fe80::80b8:462a:6fde:926%6]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 18:27:07 +0000
From:   "Gix, Brian" <brian.gix@intel.com>
To:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "Stotland, Inga" <inga.stotland@intel.com>
Subject: Re: [PATCH BlueZ] mesh: Fix errors found by static analysis
Thread-Topic: [PATCH BlueZ] mesh: Fix errors found by static analysis
Thread-Index: AQHWtAwAKjaffgk3/EulABt35BQkHqnBthcA
Date:   Tue, 10 Nov 2020 18:27:07 +0000
Message-ID: <f836d2e0148e2b156bd5837f651e6d43808541a9.camel@intel.com>
References: <20201106071053.122820-1-inga.stotland@intel.com>
In-Reply-To: <20201106071053.122820-1-inga.stotland@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.55.43]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e6e8a94-b0e4-4da0-6633-08d885a63afa
x-ms-traffictypediagnostic: MWHPR11MB2029:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB2029ACDD8AB0375A2E5C08CAE1E90@MWHPR11MB2029.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:62;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FXW4FQiUfui0VW+VtNqyWSzrRRbKGadlWjpvKs255h38JKmnDW53wn6XhnyOmL4zmlosKYbyf2clDsCFnHtnI3HsIQDOyuI3iTTQlJKdtkRV4XldxkJuSAUu3uZQrxcemnWqcuLbo6oFQS/36XsjdJB4rXU38i1MiViikW+kO0Nl7KWP8FQeFRqKV1LVLvUAxzCJQ2Uhj86hEpTsPsFNIlxa+IvNDhR5XpyUzIxZblOYsi+rX12VggvzoV9ng6yPYA413zagS0nm4ppk9I9Blb+nfxTlh7NkQ36vW40vxAQMItbjXfmGocaE0498kjTNQd7rZbI6i1zkBjU1BlFZOg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4539.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39850400004)(366004)(8936002)(83380400001)(6636002)(86362001)(2906002)(110136005)(36756003)(8676002)(26005)(316002)(186003)(6486002)(5660300002)(2616005)(91956017)(66556008)(6506007)(64756008)(66946007)(66476007)(76116006)(66446008)(478600001)(71200400001)(6512007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: tdw3n3EGQp57vl19w1nqXPw5hZ+PRSQCiCT2qaRvOMgkG4U4oiCihJ5PxhI6i1UnG4TXapPJx+fa/Q3ttAYocIsBg5cCRwyfNlfVm3TTWtwQIyREesH5bfmqNRl94s/7cnEWGgrrm6UeT4ZhmOiXuD77ls+n77mBi+CEQYLgkL4OUpNskQcaIkzYncwdekFEgH7VdasPye4CejsBdGCiYPtyIXXHBnySskWKTsKYcEd3KD9LFit+WVvWh4VdxRPFpd7kzo0BEgd1yTvI0CumJd3QxwkfXku725Qa24ms8z0C1o9WBHkwuEqDKWzXXlqESULA/rnFe3h1xyiFRoY5bYiTK2IxeLMrZS9Lw1aBsMxz/SVxZyBolVI0W7wQNx6MIv3GQ8WfKWbc/d1deXbd2+SUaAgyVIfxXk0upHv9pr2PM4f+2q/x7hoL9E3MIuavaMt7SLwZUCPN/5wEhIS5LV4CbF7IPY+OPrWgD1GSUZOMQM7ax9mf+mI4bC3ngGHkreia+r4zxgsClDtHF/OcbS1xlhoDB5vAQ7+4lE0dDRPLMWT8ONOVu+xKqewFTgjJh94nPa1v6z5gNyOSRAFhkT9uMDnX4n2HzSKqS2DlrbsykHNlO1ABXk25dzRxI3sxCU5c9rfLOkpPY8x2JxhMLHiLyq6Gi1PXgPU638jRQOc6na3FWziYzne79S4hFF45aJEIVds0vd8vSlpslP3V7gXG8aNGBIQfQD0A+/iby5s0ROlxUVMZraLk1QVs4jhHNTkzfyw7XfTTDUvdQ4XNXDiTc1sfWunoUz3pByCr9wVZTLgvqVBI6UZXD4eQhrhB8zajaufm3OL/dLFMX8qZh0oLUpOJEEFzB9Jyg+E1R4TWi5igTGqgHABXsgK1HiSUKO2Ky18DUPCg/IDtO41/Cw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F610DFE8104E4499AB08CDDC2494E2C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6e8a94-b0e4-4da0-6633-08d885a63afa
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2020 18:27:07.2374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XWxSkuoEGjWNTKVeRIOu/MfcaoSVvoRJywGTSCbUeHYWZLyGFIZPVo2EHWaSKQ/me13jH7ER2uWBG8Dknf/A2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2029
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

QXBwbGllZA0KDQpPbiBUaHUsIDIwMjAtMTEtMDUgYXQgMjM6MTAgLTA4MDAsIEluZ2EgU3RvdGxh
bmQgd3JvdGU6DQo+IFRoaXMgZml4ZXMgYSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgZXJyb3Ig
KGNmZ21vZC1zZXJ2ZXIuYykNCj4gYW5kIG1pc2NlbGxhbmVvdXMgaXNzdWVzIHJlbGF0ZWQgdG8g
dW5jaGVja2VkIHJldHVybiBzdGF0dXMuDQo+IC0tLQ0KPiAgbWVzaC9hZ2VudC5jICAgICAgICAg
fCA0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tDQo+ICBtZXNo
L2FwcGtleS5jICAgICAgICB8ICA2ICsrKy0tLQ0KPiAgbWVzaC9jZmdtb2Qtc2VydmVyLmMgfCAx
MiArKystLS0tLS0tLS0NCj4gIG1lc2gva2V5cmluZy5jICAgICAgIHwgMzggKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0NCj4gIDQgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0
aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWVzaC9hZ2VudC5j
IGIvbWVzaC9hZ2VudC5jDQo+IGluZGV4IGIwZDUyM2QxNi4uNTA1OGQwZDhkIDEwMDY0NA0KPiAt
LS0gYS9tZXNoL2FnZW50LmMNCj4gKysrIGIvbWVzaC9hZ2VudC5jDQo+IEBAIC05NSw3ICs5NSw3
IEBAIHN0YXRpYyBib29sIHNpbXBsZV9tYXRjaChjb25zdCB2b2lkICphLCBjb25zdCB2b2lkICpi
KQ0KPiAgCXJldHVybiBhID09IGI7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyB2b2lkIHBhcnNlX3By
b3ZfY2FwcyhzdHJ1Y3QgbWVzaF9hZ2VudF9wcm92X2NhcHMgKmNhcHMsDQo+ICtzdGF0aWMgYm9v
bCBwYXJzZV9wcm92X2NhcHMoc3RydWN0IG1lc2hfYWdlbnRfcHJvdl9jYXBzICpjYXBzLA0KPiAg
CQkJCXN0cnVjdCBsX2RidXNfbWVzc2FnZV9pdGVyICpwcm9wZXJ0eSkNCj4gIHsNCj4gIAlzdHJ1
Y3QgbF9kYnVzX21lc3NhZ2VfaXRlciBpdGVyX2NhcHM7DQo+IEBAIC0xMDMsNyArMTAzLDcgQEAg
c3RhdGljIHZvaWQgcGFyc2VfcHJvdl9jYXBzKHN0cnVjdCBtZXNoX2FnZW50X3Byb3ZfY2FwcyAq
Y2FwcywNCj4gIAl1aW50MzJfdCBpOw0KPiAgDQo+ICAJaWYgKCFsX2RidXNfbWVzc2FnZV9pdGVy
X2dldF92YXJpYW50KHByb3BlcnR5LCAiYXMiLCAmaXRlcl9jYXBzKSkNCj4gLQkJcmV0dXJuOw0K
PiArCQlyZXR1cm4gZmFsc2U7DQo+ICANCj4gIAl3aGlsZSAobF9kYnVzX21lc3NhZ2VfaXRlcl9u
ZXh0X2VudHJ5KCZpdGVyX2NhcHMsICZzdHIpKSB7DQo+ICAJCWZvciAoaSA9IDA7IGkgPCBMX0FS
UkFZX1NJWkUoY2FwX3RhYmxlKTsgaSsrKSB7DQo+IEBAIC0xMjksOSArMTI5LDEwIEBAIHN0YXRp
YyB2b2lkIHBhcnNlX3Byb3ZfY2FwcyhzdHJ1Y3QgbWVzaF9hZ2VudF9wcm92X2NhcHMgKmNhcHMs
DQo+ICAJCQljYXBzLT5zdGF0aWNfdHlwZSA9IDE7DQo+ICAJfQ0KPiAgDQo+ICsJcmV0dXJuIHRy
dWU7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyB2b2lkIHBhcnNlX29vYl9pbmZvKHN0cnVjdCBtZXNo
X2FnZW50X3Byb3ZfY2FwcyAqY2FwcywNCj4gK3N0YXRpYyBib29sIHBhcnNlX29vYl9pbmZvKHN0
cnVjdCBtZXNoX2FnZW50X3Byb3ZfY2FwcyAqY2FwcywNCj4gIAkJCQlzdHJ1Y3QgbF9kYnVzX21l
c3NhZ2VfaXRlciAqcHJvcGVydHkpDQo+ICB7DQo+ICAJc3RydWN0IGxfZGJ1c19tZXNzYWdlX2l0
ZXIgaXRlcl9vb2I7DQo+IEBAIC0xMzksNyArMTQwLDcgQEAgc3RhdGljIHZvaWQgcGFyc2Vfb29i
X2luZm8oc3RydWN0IG1lc2hfYWdlbnRfcHJvdl9jYXBzICpjYXBzLA0KPiAgCWNvbnN0IGNoYXIg
KnN0cjsNCj4gIA0KPiAgCWlmICghbF9kYnVzX21lc3NhZ2VfaXRlcl9nZXRfdmFyaWFudChwcm9w
ZXJ0eSwgImFzIiwgJml0ZXJfb29iKSkNCj4gLQkJcmV0dXJuOw0KPiArCQlyZXR1cm4gZmFsc2U7
DQo+ICANCj4gIAl3aGlsZSAobF9kYnVzX21lc3NhZ2VfaXRlcl9uZXh0X2VudHJ5KCZpdGVyX29v
YiwgJnN0cikpIHsNCj4gIAkJZm9yIChpID0gMDsgaSA8IExfQVJSQVlfU0laRShvb2JfdGFibGUp
OyBpKyspIHsNCj4gQEAgLTE0OCw5ICsxNDksMTEgQEAgc3RhdGljIHZvaWQgcGFyc2Vfb29iX2lu
Zm8oc3RydWN0IG1lc2hfYWdlbnRfcHJvdl9jYXBzICpjYXBzLA0KPiAgCQkJY2Fwcy0+b29iX2lu
Zm8gfD0gb29iX3RhYmxlW2ldLm1hc2s7DQo+ICAJCX0NCj4gIAl9DQo+ICsNCj4gKwlyZXR1cm4g
dHJ1ZTsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIHZvaWQgcGFyc2VfcHJvcGVydGllcyhzdHJ1Y3Qg
bWVzaF9hZ2VudCAqYWdlbnQsDQo+ICtzdGF0aWMgYm9vbCBwYXJzZV9wcm9wZXJ0aWVzKHN0cnVj
dCBtZXNoX2FnZW50ICphZ2VudCwNCj4gIAkJCQkJc3RydWN0IGxfZGJ1c19tZXNzYWdlX2l0ZXIg
KnByb3BlcnRpZXMpDQo+ICB7DQo+ICAJY29uc3QgY2hhciAqa2V5LCAqdXJpX3N0cmluZzsNCj4g
QEAgLTE2MCwxNSArMTYzLDIwIEBAIHN0YXRpYyB2b2lkIHBhcnNlX3Byb3BlcnRpZXMoc3RydWN0
IG1lc2hfYWdlbnQgKmFnZW50LA0KPiAgDQo+ICAJd2hpbGUgKGxfZGJ1c19tZXNzYWdlX2l0ZXJf
bmV4dF9lbnRyeShwcm9wZXJ0aWVzLCAma2V5LCAmdmFyaWFudCkpIHsNCj4gIAkJaWYgKCFzdHJj
bXAoa2V5LCAiQ2FwYWJpbGl0aWVzIikpIHsNCj4gLQkJCXBhcnNlX3Byb3ZfY2FwcygmYWdlbnQt
PmNhcHMsICZ2YXJpYW50KTsNCj4gKwkJCWlmICghcGFyc2VfcHJvdl9jYXBzKCZhZ2VudC0+Y2Fw
cywgJnZhcmlhbnQpKQ0KPiArCQkJCXJldHVybiBmYWxzZTsNCj4gIAkJfSBlbHNlIGlmICghc3Ry
Y21wKGtleSwgIlVSSSIpKSB7DQo+IC0JCQlsX2RidXNfbWVzc2FnZV9pdGVyX2dldF92YXJpYW50
KCZ2YXJpYW50LCAicyIsDQo+IC0JCQkJCQkJCSZ1cmlfc3RyaW5nKTsNCj4gKwkJCWlmICghbF9k
YnVzX21lc3NhZ2VfaXRlcl9nZXRfdmFyaWFudCgmdmFyaWFudCwgInMiLA0KPiArCQkJCQkJCQkm
dXJpX3N0cmluZykpDQo+ICsJCQkJcmV0dXJuIGZhbHNlOw0KPiAgCQkJLyogVE9ETzogY29tcHV0
ZSBoYXNoICovDQo+ICAJCX0gZWxzZSBpZiAoIXN0cmNtcChrZXksICJPdXRPZkJhbmRJbmZvIikp
IHsNCj4gLQkJCXBhcnNlX29vYl9pbmZvKCZhZ2VudC0+Y2FwcywgJnZhcmlhbnQpOw0KPiArCQkJ
aWYgKCFwYXJzZV9vb2JfaW5mbygmYWdlbnQtPmNhcHMsICZ2YXJpYW50KSkNCj4gKwkJCQlyZXR1
cm4gZmFsc2U7DQo+ICAJCX0NCj4gIAl9DQo+ICsNCj4gKwlyZXR1cm4gdHJ1ZTsNCj4gIH0NCj4g
IA0KPiAgc3RhdGljIHZvaWQgYWdlbnRfZnJlZSh2b2lkICphZ2VudF9kYXRhKQ0KPiBAQCAtMjUz
LDcgKzI2MSwxMCBAQCBzdHJ1Y3QgbWVzaF9hZ2VudCAqbWVzaF9hZ2VudF9jcmVhdGUoY29uc3Qg
Y2hhciAqcGF0aCwgY29uc3QgY2hhciAqb3duZXIsDQo+ICAJYWdlbnQtPm93bmVyID0gbF9zdHJk
dXAob3duZXIpOw0KPiAgCWFnZW50LT5wYXRoID0gbF9zdHJkdXAocGF0aCk7DQo+ICANCj4gLQlw
YXJzZV9wcm9wZXJ0aWVzKGFnZW50LCBwcm9wZXJ0aWVzKTsNCj4gKwlpZiAoIXBhcnNlX3Byb3Bl
cnRpZXMoYWdlbnQsIHByb3BlcnRpZXMpKSB7DQo+ICsJCWxfZnJlZShhZ2VudCk7DQo+ICsJCXJl
dHVybiBOVUxMOw0KPiArCX0NCj4gIA0KPiAgCWxfcXVldWVfcHVzaF90YWlsKGFnZW50cywgYWdl
bnQpOw0KPiAgDQo+IEBAIC0zMTIsMTUgKzMyMywxNyBAQCBzdGF0aWMgdm9pZCBwcm9wZXJ0aWVz
X3JlcGx5KHN0cnVjdCBsX2RidXNfbWVzc2FnZSAqcmVwbHksIHZvaWQgKnVzZXJfZGF0YSkNCj4g
IAllcnIgPSBnZXRfcmVwbHlfZXJyb3IocmVwbHkpOw0KPiAgDQo+ICAJaWYgKGVyciAhPSBNRVNI
X0VSUk9SX05PTkUpDQo+IC0JCWdvdG8gZmFpbDsNCj4gKwkJZ290byBkb25lOw0KPiAgDQo+ICAJ
aWYgKCFsX2RidXNfbWVzc2FnZV9nZXRfYXJndW1lbnRzKHJlcGx5LCAiYXtzdn0iLCAmcHJvcGVy
dGllcykpIHsNCj4gIAkJZXJyID0gTUVTSF9FUlJPUl9GQUlMRUQ7DQo+IC0JCWdvdG8gZmFpbDsN
Cj4gKwkJZ290byBkb25lOw0KPiAgCX0NCj4gIA0KPiAtCXBhcnNlX3Byb3BlcnRpZXMoYWdlbnQs
ICZwcm9wZXJ0aWVzKTsNCj4gLWZhaWw6DQo+ICsJaWYgKCFwYXJzZV9wcm9wZXJ0aWVzKGFnZW50
LCAmcHJvcGVydGllcykpDQo+ICsJCWVyciA9IE1FU0hfRVJST1JfRkFJTEVEOw0KPiArDQo+ICtk
b25lOg0KPiAgCWlmIChyZXEtPmNiKSB7DQo+ICAJCWNiID0gcmVxLT5jYjsNCj4gIAkJY2IocmVx
LT51c2VyX2RhdGEsIGVycik7DQo+IEBAIC00MjUsNyArNDM4LDcgQEAgc3RhdGljIHZvaWQga2V5
X3JlcGx5KHN0cnVjdCBsX2RidXNfbWVzc2FnZSAqcmVwbHksIHZvaWQgKnVzZXJfZGF0YSkNCj4g
IAltZXNoX2FnZW50X2tleV9jYl90IGNiOw0KPiAgCXN0cnVjdCBsX2RidXNfbWVzc2FnZV9pdGVy
IGl0ZXJfYXJyYXk7DQo+ICAJdWludDMyX3QgbiA9IDAsIGV4cGVjdGVkX2xlbiA9IDA7DQo+IC0J
dWludDhfdCAqYnVmOw0KPiArCXVpbnQ4X3QgKmJ1ZiA9IE5VTEw7DQo+ICAJaW50IGVycjsNCj4g
IA0KPiAgCWlmICghbF9xdWV1ZV9maW5kKGFnZW50cywgc2ltcGxlX21hdGNoLCBhZ2VudCkgfHwg
IWFnZW50LT5yZXEpDQo+IGRpZmYgLS1naXQgYS9tZXNoL2FwcGtleS5jIGIvbWVzaC9hcHBrZXku
Yw0KPiBpbmRleCA3ZWZiOGY1YzQuLjU0OWY1YTgwZCAxMDA2NDQNCj4gLS0tIGEvbWVzaC9hcHBr
ZXkuYw0KPiArKysgYi9tZXNoL2FwcGtleS5jDQo+IEBAIC0xMDAsMTEgKzEwMCwxMSBAQCBib29s
IGFwcGtleV9rZXlfaW5pdChzdHJ1Y3QgbWVzaF9uZXQgKm5ldCwgdWludDE2X3QgbmV0X2lkeCwg
dWludDE2X3QgYXBwX2lkeCwNCj4gIAlpZiAoIWFwcF9rZXlzKQ0KPiAgCQlyZXR1cm4gTlVMTDsN
Cj4gIA0KPiAtCWtleSA9IGFwcF9rZXlfbmV3KCk7DQo+IC0JaWYgKCFrZXkpDQo+ICsJaWYgKCFt
ZXNoX25ldF9oYXZlX2tleShuZXQsIG5ldF9pZHgpKQ0KPiAgCQlyZXR1cm4gZmFsc2U7DQo+ICAN
Cj4gLQlpZiAoIW1lc2hfbmV0X2hhdmVfa2V5KG5ldCwgbmV0X2lkeCkpDQo+ICsJa2V5ID0gYXBw
X2tleV9uZXcoKTsNCj4gKwlpZiAoIWtleSkNCj4gIAkJcmV0dXJuIGZhbHNlOw0KPiAgDQo+ICAJ
a2V5LT5uZXRfaWR4ID0gbmV0X2lkeDsNCj4gZGlmZiAtLWdpdCBhL21lc2gvY2ZnbW9kLXNlcnZl
ci5jIGIvbWVzaC9jZmdtb2Qtc2VydmVyLmMNCj4gaW5kZXggMDAwOWExYmVlLi41ZWVmZWRjNGQg
MTAwNjQ0DQo+IC0tLSBhL21lc2gvY2ZnbW9kLXNlcnZlci5jDQo+ICsrKyBiL21lc2gvY2ZnbW9k
LXNlcnZlci5jDQo+IEBAIC04MCwxMyArODAsMTIgQEAgc3RhdGljIHVpbnQxNl90IGNvbmZpZ19w
dWJfZ2V0KHN0cnVjdCBtZXNoX25vZGUgKm5vZGUsIGNvbnN0IHVpbnQ4X3QgKnBrdCwNCj4gIA0K
PiAgCXB1YiA9IG1lc2hfbW9kZWxfcHViX2dldChub2RlLCBlbGVfYWRkciwgaWQsICZzdGF0dXMp
Ow0KPiAgDQo+IC0JcnR4ID0gcHViLT5ydHguY250ICsgKCgocHViLT5ydHguaW50ZXJ2YWwgLyA1
MCkgLSAxKSA8PCAzKTsNCj4gLQ0KPiAtCWlmIChwdWIgJiYgc3RhdHVzID09IE1FU0hfU1RBVFVT
X1NVQ0NFU1MpDQo+ICsJaWYgKHB1YiAmJiBzdGF0dXMgPT0gTUVTSF9TVEFUVVNfU1VDQ0VTUykg
ew0KPiArCQlydHggPSBwdWItPnJ0eC5jbnQgKyAoKChwdWItPnJ0eC5pbnRlcnZhbCAvIDUwKSAt
IDEpIDw8IDMpOw0KPiAgCQlyZXR1cm4gc2V0X3B1Yl9zdGF0dXMoc3RhdHVzLCBlbGVfYWRkciwg
aWQsIHB1Yi0+YWRkciwgcHViLT5pZHgsDQo+ICAJCQkJCXB1Yi0+Y3JlZGVudGlhbCwgcHViLT50
dGwsIHB1Yi0+cGVyaW9kLA0KPiAgCQkJCQlydHgpOw0KPiAtCWVsc2UNCj4gKwl9IGVsc2UNCj4g
IAkJcmV0dXJuIHNldF9wdWJfc3RhdHVzKHN0YXR1cywgZWxlX2FkZHIsIGlkLCAwLCAwLCAwLCAw
LCAwLCAwKTsNCj4gIH0NCj4gIA0KPiBAQCAtNTkyLDEyICs1OTEsNyBAQCBzdGF0aWMgdWludDE2
X3QgY2ZnX2FwcGtleV9tc2coc3RydWN0IG1lc2hfbm9kZSAqbm9kZSwgY29uc3QgdWludDhfdCAq
cGt0LA0KPiAgCXN0cnVjdCBtZXNoX25ldCAqbmV0ID0gbm9kZV9nZXRfbmV0KG5vZGUpOw0KPiAg
DQo+ICAJbl9pZHggPSBsX2dldF9sZTE2KHBrdCkgJiAweGZmZjsNCj4gLQlpZiAobl9pZHggPiBO
RVRfSURYX01BWCkNCj4gLQkJcmV0dXJuIDA7DQo+IC0NCj4gIAlhX2lkeCA9IGxfZ2V0X2xlMTYo
cGt0ICsgMSkgPj4gNDsNCj4gLQlpZiAoYV9pZHggPiBBUFBfSURYX01BWCkNCj4gLQkJcmV0dXJu
IDA7DQo+ICANCj4gIAluID0gbWVzaF9tb2RlbF9vcGNvZGVfc2V0KE9QX0FQUEtFWV9TVEFUVVMs
IG1zZyk7DQo+ICANCj4gZGlmZiAtLWdpdCBhL21lc2gva2V5cmluZy5jIGIvbWVzaC9rZXlyaW5n
LmMNCj4gaW5kZXggYmJlNTAxMDYzLi4xZWY0ZmMzZWYgMTAwNjQ0DQo+IC0tLSBhL21lc2gva2V5
cmluZy5jDQo+ICsrKyBiL21lc2gva2V5cmluZy5jDQo+IEBAIC01MCwxOCArNTAsMjIgQEAgYm9v
bCBrZXlyaW5nX3B1dF9uZXRfa2V5KHN0cnVjdCBtZXNoX25vZGUgKm5vZGUsIHVpbnQxNl90IG5l
dF9pZHgsDQo+ICAJCXJldHVybiBmYWxzZTsNCj4gIA0KPiAgCXNucHJpbnRmKGtleV9maWxlLCBQ
QVRIX01BWCwgIiVzJXMiLCBub2RlX3BhdGgsIG5ldF9rZXlfZGlyKTsNCj4gLQlta2RpcihrZXlf
ZmlsZSwgMDc1NSk7DQo+ICsNCj4gKwlpZiAoIW1rZGlyKGtleV9maWxlLCAwNzU1KSkNCj4gKwkJ
cmV0dXJuIGZhbHNlOw0KPiArDQo+ICAJc25wcmludGYoa2V5X2ZpbGUsIFBBVEhfTUFYLCAiJXMl
cy8lMy4zeCIsIG5vZGVfcGF0aCwgbmV0X2tleV9kaXIsDQo+ICAJCQkJCQkJCW5ldF9pZHgpOw0K
PiAgCWxfZGVidWcoIlB1dCBOZXQgS2V5ICVzIiwga2V5X2ZpbGUpOw0KPiAgDQo+ICAJZmQgPSBv
cGVuKGtleV9maWxlLCBPX1dST05MWSB8IE9fQ1JFQVQgfCBPX1RSVU5DLCBTX0lSVVNSIHwgU19J
V1VTUik7DQo+IC0JaWYgKGZkID49IDApIHsNCj4gLQkJaWYgKHdyaXRlKGZkLCBrZXksIHNpemVv
Zigqa2V5KSkgPT0gc2l6ZW9mKCprZXkpKQ0KPiAtCQkJcmVzdWx0ID0gdHJ1ZTsNCj4gKwlpZiAo
ZmQgPCAwKQ0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICANCj4gLQkJY2xvc2UoZmQpOw0KPiAtCX0N
Cj4gKwlpZiAod3JpdGUoZmQsIGtleSwgc2l6ZW9mKCprZXkpKSA9PSBzaXplb2YoKmtleSkpDQo+
ICsJCXJlc3VsdCA9IHRydWU7DQo+ICsNCj4gKwljbG9zZShmZCk7DQo+ICANCj4gIAlyZXR1cm4g
cmVzdWx0Ow0KPiAgfQ0KPiBAQCAtODMsNyArODcsMTAgQEAgYm9vbCBrZXlyaW5nX3B1dF9hcHBf
a2V5KHN0cnVjdCBtZXNoX25vZGUgKm5vZGUsIHVpbnQxNl90IGFwcF9pZHgsDQo+ICAJCXJldHVy
biBmYWxzZTsNCj4gIA0KPiAgCXNucHJpbnRmKGtleV9maWxlLCBQQVRIX01BWCwgIiVzJXMiLCBu
b2RlX3BhdGgsIGFwcF9rZXlfZGlyKTsNCj4gLQlta2RpcihrZXlfZmlsZSwgMDc1NSk7DQo+ICsN
Cj4gKwlpZiAoIW1rZGlyKGtleV9maWxlLCAwNzU1KSkNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiAr
DQo+ICAJc25wcmludGYoa2V5X2ZpbGUsIFBBVEhfTUFYLCAiJXMlcy8lMy4zeCIsIG5vZGVfcGF0
aCwgYXBwX2tleV9kaXIsDQo+ICAJCQkJCQkJCWFwcF9pZHgpOw0KPiAgCWxfZGVidWcoIlB1dCBB
cHAgS2V5ICVzIiwga2V5X2ZpbGUpOw0KPiBAQCAtMTAwLDE2ICsxMDcsMTcgQEAgYm9vbCBrZXly
aW5nX3B1dF9hcHBfa2V5KHN0cnVjdCBtZXNoX25vZGUgKm5vZGUsIHVpbnQxNl90IGFwcF9pZHgs
DQo+ICAJCX0NCj4gIA0KPiAgCQlsc2VlayhmZCwgMCwgU0VFS19TRVQpOw0KPiAtCX0gZWxzZQ0K
PiArCX0gZWxzZSB7DQo+ICAJCWZkID0gb3BlbihrZXlfZmlsZSwgT19XUk9OTFkgfCBPX0NSRUFU
IHwgT19UUlVOQywNCj4gIAkJCQkJCQlTX0lSVVNSIHwgU19JV1VTUik7DQo+ICsJCWlmIChmZCA8
IDApDQo+ICsJCQlyZXR1cm4gZmFsc2U7DQo+ICsJfQ0KPiAgDQo+IC0JaWYgKGZkID49IDApIHsN
Cj4gLQkJaWYgKHdyaXRlKGZkLCBrZXksIHNpemVvZigqa2V5KSkgPT0gc2l6ZW9mKCprZXkpKQ0K
PiAtCQkJcmVzdWx0ID0gdHJ1ZTsNCj4gKwlpZiAod3JpdGUoZmQsIGtleSwgc2l6ZW9mKCprZXkp
KSA9PSBzaXplb2YoKmtleSkpDQo+ICsJCXJlc3VsdCA9IHRydWU7DQo+ICANCj4gLQkJY2xvc2Uo
ZmQpOw0KPiAtCX0NCj4gKwljbG9zZShmZCk7DQo+ICANCj4gIAlyZXR1cm4gcmVzdWx0Ow0KPiAg
fQ0KPiBAQCAtMTk4LDcgKzIwNiw5IEBAIGJvb2wga2V5cmluZ19wdXRfcmVtb3RlX2Rldl9rZXko
c3RydWN0IG1lc2hfbm9kZSAqbm9kZSwgdWludDE2X3QgdW5pY2FzdCwNCj4gIAkJcmV0dXJuIGZh
bHNlOw0KPiAgDQo+ICAJc25wcmludGYoa2V5X2ZpbGUsIFBBVEhfTUFYLCAiJXMlcyIsIG5vZGVf
cGF0aCwgZGV2X2tleV9kaXIpOw0KPiAtCW1rZGlyKGtleV9maWxlLCAwNzU1KTsNCj4gKw0KPiAr
CWlmICghbWtkaXIoa2V5X2ZpbGUsIDA3NTUpKQ0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICANCj4g
IAlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykgew0KPiAgCQlzbnByaW50ZihrZXlfZmlsZSwg
UEFUSF9NQVgsICIlcyVzLyU0LjR4Iiwgbm9kZV9wYXRoLA0K
