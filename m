Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0079414969B
	for <lists+linux-bluetooth@lfdr.de>; Sat, 25 Jan 2020 17:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgAYQ1O (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 25 Jan 2020 11:27:14 -0500
Received: from mga14.intel.com ([192.55.52.115]:21304 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgAYQ1N (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 25 Jan 2020 11:27:13 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jan 2020 08:27:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,361,1574150400"; 
   d="scan'208";a="260579759"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
  by fmsmga002.fm.intel.com with ESMTP; 25 Jan 2020 08:27:12 -0800
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 25 Jan 2020 08:27:12 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.52) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Sat, 25 Jan 2020 08:27:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifCJ4caaTNFVNoTQXw4mSkhrDTHx2G+7dCL23K+X7ITHadggFx7EUFAY0h0dAV2i7QMrxvyWa65r+F3jsUE+edWL8qPjxryW9ncdGx9GAVmUnXirF/xA929RTk5WsJ7P1CTMKiPABswi52ex5PVtQxe2wjqe1iO7RZAxs8CckmixPPo8ELwCsyPlaNWjiTeA5NLla4f1lFuWD8tRvpttBNBN1opYPLiTEsLmy6QKF2BamCBUv+FfwI5YbnDfLBNTPo8ufSAvZFumTF2ecwJrsll8k3UEpusTwT12oIL432JKbCibjl1TEW7+6/6kkXncc1Sz+gabhCmZSn2daUh7Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeEkiUx1lWpGp4LCmalj3zoOWufH4Mtyi0ujPlbaKS8=;
 b=F+PqW38k5X+W4dIot3md7EFlc+ZxCydfKJHv8VYb0PDug48q6iogDO0tjB/dF0xWaPXpZysLxMpGivW4tBjMlrT4DraYV2uhTiuu9yz/iPky9jxyRFYKPqc6NRGECfNGXynYJ6FCrvwza5fJQdG2idgUaQZLQasbBr9w1cwBioUuhG53OmmtBWZOH0Lq7xBW84ZMj3ava9uNXAEW89kPcrEpIJqeVDVqJcHbSJsQ5mgdM/TMtG+Qudsi46t0n4q7N97WXMWO9OMhCSK2ZgeNil4HcAmEPXSi2LAgRQH0hv7h3eVpNSaQ+9ur0hhmP/mKSIR3oseinuUK1xzcQMCgeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeEkiUx1lWpGp4LCmalj3zoOWufH4Mtyi0ujPlbaKS8=;
 b=oDhe0Q1y7y4xrA+JeMrTvXsHh5oWX5o7gA1RsF9TnNWHi1bxSqF/ZUhqS3jX8UpcE7SSOMZo/3rkEtoL5B2vGRDGEo6VgVW8zIf5sAFE+iiWGg+uWJ6/G6J/SfIs7SZAIKtMl1d60QqX9rDHYVTVg8xYA6M3yT5kLiKWrP/oCeU=
Received: from MWHPR11MB1664.namprd11.prod.outlook.com (10.172.54.13) by
 MWHPR11MB1646.namprd11.prod.outlook.com (10.172.54.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20; Sat, 25 Jan 2020 16:27:10 +0000
Received: from MWHPR11MB1664.namprd11.prod.outlook.com
 ([fe80::e8fb:c0e8:5779:367e]) by MWHPR11MB1664.namprd11.prod.outlook.com
 ([fe80::e8fb:c0e8:5779:367e%6]) with mapi id 15.20.2665.017; Sat, 25 Jan 2020
 16:27:09 +0000
From:   "Gix, Brian" <brian.gix@intel.com>
To:     "prathyusha.n@samsung.com" <prathyusha.n@samsung.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] mesh: Handle publickey exchange phase for
 initiator
Thread-Topic: [PATCH v1 1/1] mesh: Handle publickey exchange phase for
 initiator
Thread-Index: AQHV0DtnuOzoXiqTY0+vwZdCa0gjKKf7mBwA
Date:   Sat, 25 Jan 2020 16:27:09 +0000
Message-ID: <4d0fade910bbcd2e657ed5ca10d19d13aa0d23e5.camel@intel.com>
References: <CGME20200121091512epcas5p3fd399b595da13bbd57edcac6c97ad8be@epcas5p3.samsung.com>
         <1579598098-27136-1-git-send-email-prathyusha.n@samsung.com>
In-Reply-To: <1579598098-27136-1-git-send-email-prathyusha.n@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=brian.gix@intel.com; 
x-originating-ip: [134.134.139.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42903812-17cf-4f33-9494-08d7a1b36d24
x-ms-traffictypediagnostic: MWHPR11MB1646:
x-microsoft-antispam-prvs: <MWHPR11MB1646CB9B6367FD2E35B8B8EBE1090@MWHPR11MB1646.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0293D40691
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(39860400002)(346002)(136003)(396003)(366004)(189003)(199004)(26005)(66446008)(64756008)(478600001)(66556008)(76116006)(66476007)(66946007)(5660300002)(186003)(2906002)(6486002)(2616005)(6512007)(6506007)(81156014)(8936002)(8676002)(36756003)(86362001)(71200400001)(110136005)(316002)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR11MB1646;H:MWHPR11MB1664.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N9IkFLbg43Cci/UyzhJBIQ7tivYWJ804jyuJ+o6zosYnwzdOlizIUVj8tZ2UeyMo2Fwfysjs3uW/DWlnfgTs1LVmDzrzhNFd6UFPcEMMPdGpTNI9dLAmoaDdQ926VTUJe/bep/YI/3amQZUBLYQ6ND4/fZjvmsxLLh4OLyc5gzAzzhT2iw37ejd9Nf9DvaVpF9aKwUYh3jNb+sfp0e+2QjhNJ/mLEfh7GRvuieWY7FNe8CjQCvhPVTLjmKlKMcvE7qjwOiRxcRQJmqspo/LXtbERbydU33prFFi0oDspptBu8vcSI7/JcVJxE0gKmYQ6YFLMuPYut8sjmzOZsV9l8XHqlv6766SKKTBJLw4coCsXoLvVxyKQ2qUYadQl8zgqCx5RD44ksbVWKxVR8z4u6qR2rGsV4w0NIhHmXodWwKLtovjm9FB542t+ZEqzXvNi
x-ms-exchange-antispam-messagedata: 0goFN7ji/uWI2JTxcdJ+GfhHrn+VZdWiFG88JmQ/TeFthBP8D/ovCgGZ2SCeZw8xKWAlN43klfFxkfth5mQMtHGIoLwd8NDW7FSaA6OUyjTI1J8VOmzykACCcrkGRSsBKMrElCqFylts9JTFliW4CQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4A8BC71E11B4C43A713364A046F83D1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 42903812-17cf-4f33-9494-08d7a1b36d24
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2020 16:27:09.7666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qIdmtIhJgsFogRo0o8BItTYMNNh4Yj316ho34qETvZz6ddZghklXLNIlxMwLbgrZMqNAfbjOpIkX+RLJJPpCGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1646
X-OriginatorOrg: intel.com
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

QXBwbGllZCB3aXRoIG1pbm9yIGNoYW5nZXMNCg0KT24gVHVlLCAyMDIwLTAxLTIxIGF0IDE0OjQ0
ICswNTMwLCBQcmF0aHl1c2hhIE5lbGx1cmkgd3JvdGU6DQo+IEZyb206IFByYXRoeXVzaGEgTiA8
cHJhdGh5dXNoYS5uQHNhbXN1bmcuY29tPg0KPiANCj4gSW4gUHVibGljIEtleSBPT0IgY2FzZSwg
d2hlbiBwcm92aXNpb25lciByZWNlaXZlcyBwdWJsaWMga2V5IHZpYQ0KPiBPT0IsIHByb3Zpc2lv
bmVyIGhhcyB0byBzZW5kIGl0J3MgcHVibGljIGtleSB0byByZW1vdGUgbm9kZSBhbmQNCj4gYW5k
IHRoZW4gcHJvY2VlZCBmb3IgYXV0aGVudGljYXRpb24uDQo+IA0KPiBIYW5kbGUgaW52YWxpZCBr
ZXlzIGNhc2UuDQo+IC0tLQ0KPiAgbWVzaC9wcm92LWluaXRpYXRvci5jIHwgMjMxICsrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEz
NiBpbnNlcnRpb25zKCspLCA5NSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXNo
L3Byb3YtaW5pdGlhdG9yLmMgYi9tZXNoL3Byb3YtaW5pdGlhdG9yLmMNCj4gaW5kZXggN2VmZDVi
MzQ5Li4yMWY2ODYyNjQgMTAwNjQ0DQo+IC0tLSBhL21lc2gvcHJvdi1pbml0aWF0b3IuYw0KPiAr
KysgYi9tZXNoL3Byb3YtaW5pdGlhdG9yLmMNCj4gQEAgLTE4Niw3ICsxODYsNyBAQCBzdGF0aWMg
dm9pZCBpbnRfcHJvdl9vcGVuKHZvaWQgKnVzZXJfZGF0YSwgcHJvdl90cmFuc190eF90IHRyYW5z
X3R4LA0KPiAgCXJldHVybjsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIHZvaWQgcHJvdl9jYWxjX3Nl
Y3JldChjb25zdCB1aW50OF90ICpwdWIsIGNvbnN0IHVpbnQ4X3QgKnByaXYsDQo+ICtzdGF0aWMg
Ym9vbCBwcm92X2NhbGNfc2VjcmV0KGNvbnN0IHVpbnQ4X3QgKnB1YiwgY29uc3QgdWludDhfdCAq
cHJpdiwNCj4gIAkJCQkJCQl1aW50OF90ICpzZWNyZXQpDQo+ICB7DQo+ICAJdWludDhfdCB0bXBb
NjRdOw0KPiBAQCAtMTk2LDIyICsxOTYsMjcgQEAgc3RhdGljIHZvaWQgcHJvdl9jYWxjX3NlY3Jl
dChjb25zdCB1aW50OF90ICpwdWIsIGNvbnN0IHVpbnQ4X3QgKnByaXYsDQo+ICAJc3dhcF91MjU2
X2J5dGVzKHRtcCk7DQo+ICAJc3dhcF91MjU2X2J5dGVzKHRtcCArIDMyKTsNCj4gIA0KPiAtCWVj
ZGhfc2hhcmVkX3NlY3JldCh0bXAsIHByaXYsIHNlY3JldCk7DQo+ICsJaWYgKCFlY2RoX3NoYXJl
ZF9zZWNyZXQodG1wLCBwcml2LCBzZWNyZXQpKQ0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICANCj4g
IAkvKiBDb252ZXJ0IHRvIE1lc2ggYnl0ZSBvcmRlciAqLw0KPiAgCXN3YXBfdTI1Nl9ieXRlcyhz
ZWNyZXQpOw0KPiArCXJldHVybiB0cnVlOw0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgdm9pZCBpbnRf
Y3JlZGVudGlhbHMoc3RydWN0IG1lc2hfcHJvdl9pbml0aWF0b3IgKnByb3YpDQo+ICtzdGF0aWMg
Ym9vbCBpbnRfY3JlZGVudGlhbHMoc3RydWN0IG1lc2hfcHJvdl9pbml0aWF0b3IgKnByb3YpDQo+
ICB7DQo+IC0JcHJvdl9jYWxjX3NlY3JldChwcm92LT5jb25mX2lucHV0cy5kZXZfcHViX2tleSwN
Cj4gLQkJCXByb3YtPnByaXZhdGVfa2V5LCBwcm92LT5zZWNyZXQpOw0KPiArCWlmICghcHJvdl9j
YWxjX3NlY3JldChwcm92LT5jb25mX2lucHV0cy5kZXZfcHViX2tleSwNCj4gKwkJCQlwcm92LT5w
cml2YXRlX2tleSwgcHJvdi0+c2VjcmV0KSkNCj4gKwkJZ290byBmYWlsdXJlOw0KPiAgDQo+IC0J
bWVzaF9jcnlwdG9fczEoJnByb3YtPmNvbmZfaW5wdXRzLA0KPiAtCQkJc2l6ZW9mKHByb3YtPmNv
bmZfaW5wdXRzKSwgcHJvdi0+c2FsdCk7DQo+ICsJaWYgKCFtZXNoX2NyeXB0b19zMSgmcHJvdi0+
Y29uZl9pbnB1dHMsDQo+ICsJCQkJc2l6ZW9mKHByb3YtPmNvbmZfaW5wdXRzKSwgcHJvdi0+c2Fs
dCkpDQo+ICsJCWdvdG8gZmFpbHVyZTsNCj4gIA0KPiAtCW1lc2hfY3J5cHRvX3Byb3ZfY29uZl9r
ZXkocHJvdi0+c2VjcmV0LCBwcm92LT5zYWx0LA0KPiAtCQkJcHJvdi0+Y2FsY19rZXkpOw0KPiAr
CWlmICghbWVzaF9jcnlwdG9fcHJvdl9jb25mX2tleShwcm92LT5zZWNyZXQsIHByb3YtPnNhbHQs
DQo+ICsJCQkJcHJvdi0+Y2FsY19rZXkpKQ0KPiArCQlnb3RvIGZhaWx1cmU7DQo+ICANCj4gIAls
X2dldHJhbmRvbShwcm92LT5yYW5kX2F1dGhfd29ya3NwYWNlLCAxNik7DQo+ICANCj4gQEAgLTIy
NCw2ICsyMjksMTEgQEAgc3RhdGljIHZvaWQgaW50X2NyZWRlbnRpYWxzKHN0cnVjdCBtZXNoX3By
b3ZfaW5pdGlhdG9yICpwcm92KQ0KPiAgCXByaW50X3BhY2tldCgiTG9jYWxSYW5kb20iLCBwcm92
LT5yYW5kX2F1dGhfd29ya3NwYWNlLCAxNik7DQo+ICAJcHJpbnRfcGFja2V0KCJDb25maXJtYXRp
b25TYWx0IiwgcHJvdi0+c2FsdCwgMTYpOw0KPiAgCXByaW50X3BhY2tldCgiQ29uZmlybWF0aW9u
S2V5IiwgcHJvdi0+Y2FsY19rZXksIDE2KTsNCj4gKw0KPiArCXJldHVybiB0cnVlOw0KPiArDQo+
ICtmYWlsdXJlOg0KPiArCXJldHVybiBmYWxzZTsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIHVpbnQ4
X3QgdTE2X2hpZ2hfYml0KHVpbnQxNl90IG1hc2spDQo+IEBAIC0zMjAsMTAgKzMzMCwyMSBAQCBz
dGF0aWMgdm9pZCBzdGF0aWNfY2Iodm9pZCAqdXNlcl9kYXRhLCBpbnQgZXJyLCB1aW50OF90ICpr
ZXksIHVpbnQzMl90IGxlbikNCj4gIAlzZW5kX2NvbmZpcm0ocHJvdik7DQo+ICB9DQo+ICANCj4g
K3N0YXRpYyB2b2lkIHNlbmRfcHViX2tleShzdHJ1Y3QgbWVzaF9wcm92X2luaXRpYXRvciAqcHJv
dikNCj4gK3sNCj4gKwlzdHJ1Y3QgcHJvdl9wdWJfa2V5X21zZyBtc2c7DQo+ICsNCj4gKwltc2cu
b3Bjb2RlID0gUFJPVl9QVUJfS0VZOw0KPiArCW1lbWNweShtc2cucHViX2tleSwgcHJvdi0+Y29u
Zl9pbnB1dHMucHJ2X3B1Yl9rZXksIDY0KTsNCj4gKwlwcm92LT50cmFuc190eChwcm92LT50cmFu
c19kYXRhLCAmbXNnLCBzaXplb2YobXNnKSk7DQo+ICsJcHJvdi0+c3RhdGUgPSBJTlRfUFJPVl9L
RVlfU0VOVDsNCj4gK30NCj4gKw0KPiAgc3RhdGljIHZvaWQgcHViX2tleV9jYih2b2lkICp1c2Vy
X2RhdGEsIGludCBlcnIsIHVpbnQ4X3QgKmtleSwgdWludDMyX3QgbGVuKQ0KPiAgew0KPiAgCXN0
cnVjdCBtZXNoX3Byb3ZfaW5pdGlhdG9yICpyeF9wcm92ID0gdXNlcl9kYXRhOw0KPiAgCXN0cnVj
dCBwcm92X2ZhaWxfbXNnIG1zZzsNCj4gKwl1aW50OF90IGZhaWxfY29kZVsyXTsNCj4gIA0KPiAg
CWlmIChwcm92ICE9IHJ4X3Byb3YpDQo+ICAJCXJldHVybjsNCj4gQEAgLTMzOCwyMCArMzU5LDE3
IEBAIHN0YXRpYyB2b2lkIHB1Yl9rZXlfY2Iodm9pZCAqdXNlcl9kYXRhLCBpbnQgZXJyLCB1aW50
OF90ICprZXksIHVpbnQzMl90IGxlbikNCj4gIAltZW1jcHkocHJvdi0+Y29uZl9pbnB1dHMuZGV2
X3B1Yl9rZXksIGtleSwgNjQpOw0KPiAgCXByb3YtPm1hdGVyaWFsIHw9IE1BVF9SRU1PVEVfUFVC
TElDOw0KPiAgDQo+IC0JaWYgKChwcm92LT5tYXRlcmlhbCAmIE1BVF9TRUNSRVQpID09IE1BVF9T
RUNSRVQpDQo+IC0JCWludF9jcmVkZW50aWFscyhwcm92KTsNCj4gLQ0KPiAtCXNlbmRfY29uZmly
bShwcm92KTsNCj4gLX0NCj4gLQ0KPiAtc3RhdGljIHZvaWQgc2VuZF9wdWJfa2V5KHN0cnVjdCBt
ZXNoX3Byb3ZfaW5pdGlhdG9yICpwcm92KQ0KPiAtew0KPiAtCXN0cnVjdCBwcm92X3B1Yl9rZXlf
bXNnIG1zZzsNCj4gKwlpZiAoKHByb3YtPm1hdGVyaWFsICYgTUFUX1NFQ1JFVCkgPT0gTUFUX1NF
Q1JFVCkgew0KPiArCQlpZiAoIWludF9jcmVkZW50aWFscyhwcm92KSkgew0KPiArCQkJZmFpbF9j
b2RlWzBdID0gUFJPVl9GQUlMRUQ7DQo+ICsJCQlmYWlsX2NvZGVbMV0gPSBQUk9WX0VSUl9VTkVY
UEVDVEVEX0VSUjsNCj4gKwkJCXByb3YtPnRyYW5zX3R4KHByb3YtPnRyYW5zX2RhdGEsIGZhaWxf
Y29kZSwgMik7DQo+ICsJCQlpbnRfcHJvdl9jbG9zZShwcm92LCBmYWlsX2NvZGVbMV0pOw0KPiAr
CQkJcmV0dXJuOw0KPiArCQl9DQo+ICsJfQ0KPiAgDQo+IC0JbXNnLm9wY29kZSA9IFBST1ZfUFVC
X0tFWTsNCj4gLQltZW1jcHkobXNnLnB1Yl9rZXksIHByb3YtPmNvbmZfaW5wdXRzLnBydl9wdWJf
a2V5LCA2NCk7DQo+IC0JcHJvdi0+dHJhbnNfdHgocHJvdi0+dHJhbnNfZGF0YSwgJm1zZywgc2l6
ZW9mKG1zZykpOw0KPiAtCXByb3YtPnN0YXRlID0gSU5UX1BST1ZfS0VZX1NFTlQ7DQo+ICsJc2Vu
ZF9wdWJfa2V5KHByb3YpOw0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgdm9pZCBzZW5kX3JhbmRvbShz
dHJ1Y3QgbWVzaF9wcm92X2luaXRpYXRvciAqcHJvdikNCj4gQEAgLTQ4MiwxMyArNTAwLDk5IEBA
IHN0YXRpYyB2b2lkIGdldF9yYW5kb21fa2V5KHN0cnVjdCBtZXNoX3Byb3ZfaW5pdGlhdG9yICpw
cm92LCB1aW50OF90IGFjdGlvbiwNCj4gIAlsX3B1dF9iZTMyKG9vYl9rZXksIHByb3YtPnJhbmRf
YXV0aF93b3Jrc3BhY2UgKyA0NCk7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyB2b2lkIGludF9wcm92
X2F1dGgodm9pZCkNCj4gK3sNCj4gKwl1aW50OF90IGZhaWxfY29kZVsyXTsNCj4gKwl1aW50MzJf
dCBvb2Jfa2V5Ow0KPiArDQo+ICsJcHJvdi0+c3RhdGUgPSBJTlRfUFJPVl9LRVlfQUNLRUQ7DQo+
ICsNCj4gKwlsX2RlYnVnKCJhdXRoX21ldGhvZDogJWQiLCBwcm92LT5jb25mX2lucHV0cy5zdGFy
dC5hdXRoX21ldGhvZCk7DQo+ICsJbWVtc2V0KHByb3YtPnJhbmRfYXV0aF93b3Jrc3BhY2UgKyAx
NiwgMCwgMzIpOw0KPiArDQo+ICsJc3dpdGNoIChwcm92LT5jb25mX2lucHV0cy5zdGFydC5hdXRo
X21ldGhvZCkgew0KPiArCWRlZmF1bHQ6DQo+ICsJY2FzZSAwOg0KPiArCQkvKiBBdXRoIFR5cGUg
M2MgLSBObyBPT0IgKi8NCj4gKwkJcHJvdi0+bWF0ZXJpYWwgfD0gTUFUX1JBTkRfQVVUSDsNCj4g
KwkJYnJlYWs7DQo+ICsJY2FzZSAxOg0KPiArCQkvKiBBdXRoIFR5cGUgM2MgLSBTdGF0aWMgT09C
ICovDQo+ICsJCS8qIFByb21wdCBBZ2VudCBmb3IgU3RhdGljIE9PQiAqLw0KPiArCQlmYWlsX2Nv
ZGVbMV0gPSBtZXNoX2FnZW50X3JlcXVlc3Rfc3RhdGljKHByb3YtPmFnZW50LA0KPiArCQkJCXN0
YXRpY19jYiwgcHJvdik7DQo+ICsNCj4gKwkJaWYgKGZhaWxfY29kZVsxXSkNCj4gKwkJCWdvdG8g
ZmFpbHVyZTsNCj4gKw0KPiArCQlicmVhazsNCj4gKwljYXNlIDI6DQo+ICsJCS8qIEF1dGggVHlw
ZSAzYSAtIE91dHB1dCBPT0IgKi8NCj4gKwkJLyogUHJvbXB0IEFnZW50IGZvciBPdXRwdXQgT09C
ICovDQo+ICsJCWlmIChwcm92LT5jb25mX2lucHV0cy5zdGFydC5hdXRoX2FjdGlvbiA9PQ0KPiAr
CQkJCQkJUFJPVl9BQ1RJT05fT1VUX0FMUEhBKSB7DQo+ICsJCQlmYWlsX2NvZGVbMV0gPSBtZXNo
X2FnZW50X3Byb21wdF9hbHBoYSgNCj4gKwkJCQlwcm92LT5hZ2VudCwgdHJ1ZSwNCj4gKwkJCQlz
dGF0aWNfY2IsIHByb3YpOw0KPiArCQl9IGVsc2Ugew0KPiArCQkJZmFpbF9jb2RlWzFdID0gbWVz
aF9hZ2VudF9wcm9tcHRfbnVtYmVyKA0KPiArCQkJCXByb3YtPmFnZW50LCB0cnVlLA0KPiArCQkJ
CXByb3YtPmNvbmZfaW5wdXRzLnN0YXJ0LmF1dGhfYWN0aW9uLA0KPiArCQkJCW51bWJlcl9jYiwg
cHJvdik7DQo+ICsJCX0NCj4gKw0KPiArCQlpZiAoZmFpbF9jb2RlWzFdKQ0KPiArCQkJZ290byBm
YWlsdXJlOw0KPiArDQo+ICsJCWJyZWFrOw0KPiArDQo+ICsJY2FzZSAzOg0KPiArCQkvKiBBdXRo
IFR5cGUgM2IgLSBpbnB1dCBPT0IgKi8NCj4gKwkJZ2V0X3JhbmRvbV9rZXkocHJvdiwNCj4gKwkJ
CQlwcm92LT5jb25mX2lucHV0cy5zdGFydC5hdXRoX2FjdGlvbiwNCj4gKwkJCQlwcm92LT5jb25m
X2lucHV0cy5zdGFydC5hdXRoX3NpemUpOw0KPiArCQlvb2Jfa2V5ID0gbF9nZXRfYmUzMihwcm92
LT5yYW5kX2F1dGhfd29ya3NwYWNlICsgMjgpOw0KPiArDQo+ICsJCS8qIEFzayBBZ2VudCB0byBE
aXNwbGF5IHJhbmRvbSBrZXkgKi8NCj4gKwkJaWYgKHByb3YtPmNvbmZfaW5wdXRzLnN0YXJ0LmF1
dGhfYWN0aW9uID09DQo+ICsJCQkJCQlQUk9WX0FDVElPTl9JTl9BTFBIQSkgew0KPiArDQo+ICsJ
CQlmYWlsX2NvZGVbMV0gPSBtZXNoX2FnZW50X2Rpc3BsYXlfc3RyaW5nKA0KPiArCQkJCXByb3Yt
PmFnZW50LA0KPiArCQkJCShjaGFyICopIHByb3YtPnJhbmRfYXV0aF93b3Jrc3BhY2UgKyAxNiwN
Cj4gKwkJCQlOVUxMLCBwcm92KTsNCj4gKwkJfSBlbHNlIHsNCj4gKwkJCWZhaWxfY29kZVsxXSA9
IG1lc2hfYWdlbnRfZGlzcGxheV9udW1iZXIoDQo+ICsJCQkJcHJvdi0+YWdlbnQsIHRydWUsDQo+
ICsJCQkJcHJvdi0+Y29uZl9pbnB1dHMuc3RhcnQuYXV0aF9hY3Rpb24sDQo+ICsJCQkJb29iX2tl
eSwgTlVMTCwgcHJvdik7DQo+ICsJCX0NCj4gKw0KPiArCQlpZiAoZmFpbF9jb2RlWzFdKQ0KPiAr
CQkJZ290byBmYWlsdXJlOw0KPiArDQo+ICsJCWJyZWFrOw0KPiArDQo+ICsJfQ0KPiArDQo+ICsJ
aWYgKHByb3YtPm1hdGVyaWFsICYgTUFUX1JBTkRfQVVUSCkNCj4gKwkJc2VuZF9jb25maXJtKHBy
b3YpOw0KPiArDQo+ICsJcmV0dXJuOw0KPiArDQo+ICtmYWlsdXJlOg0KPiArCWxfZGVidWcoIkZh
aWxpbmcuLi4gJWQiLCBmYWlsX2NvZGVbMV0pOw0KPiArCWZhaWxfY29kZVswXSA9IFBST1ZfRkFJ
TEVEOw0KPiArCXByb3YtPnRyYW5zX3R4KHByb3YtPnRyYW5zX2RhdGEsIGZhaWxfY29kZSwgMik7
DQo+ICsJaW50X3Byb3ZfY2xvc2UocHJvdiwgZmFpbF9jb2RlWzFdKTsNCj4gK30NCj4gKw0KPiAg
c3RhdGljIHZvaWQgaW50X3Byb3Zfcngodm9pZCAqdXNlcl9kYXRhLCBjb25zdCB1aW50OF90ICpk
YXRhLCB1aW50MTZfdCBsZW4pDQo+ICB7DQo+ICAJc3RydWN0IG1lc2hfcHJvdl9pbml0aWF0b3Ig
KnJ4X3Byb3YgPSB1c2VyX2RhdGE7DQo+ICAJdWludDhfdCAqb3V0Ow0KPiAgCXVpbnQ4X3QgdHlw
ZSA9ICpkYXRhKys7DQo+ICAJdWludDhfdCBmYWlsX2NvZGVbMl07DQo+IC0JdWludDMyX3Qgb29i
X2tleTsNCj4gIA0KPiAgCWlmIChyeF9wcm92ICE9IHByb3YgfHwgIXByb3YtPnRyYW5zX3R4KQ0K
PiAgCQlyZXR1cm47DQo+IEBAIC01OTYsNzkgKzcwMCwxMiBAQCBzdGF0aWMgdm9pZCBpbnRfcHJv
dl9yeCh2b2lkICp1c2VyX2RhdGEsIGNvbnN0IHVpbnQ4X3QgKmRhdGEsIHVpbnQxNl90IGxlbikN
Cj4gIAkJaWYgKChwcm92LT5tYXRlcmlhbCAmIE1BVF9TRUNSRVQpICE9IE1BVF9TRUNSRVQpDQo+
ICAJCQlyZXR1cm47DQo+ICANCj4gLQkJaW50X2NyZWRlbnRpYWxzKHByb3YpOw0KPiAtCQlwcm92
LT5zdGF0ZSA9IElOVF9QUk9WX0tFWV9BQ0tFRDsNCj4gLQ0KPiAtCQlsX2RlYnVnKCJhdXRoX21l
dGhvZDogJWQiLCBwcm92LT5jb25mX2lucHV0cy5zdGFydC5hdXRoX21ldGhvZCk7DQo+IC0JCW1l
bXNldChwcm92LT5yYW5kX2F1dGhfd29ya3NwYWNlICsgMTYsIDAsIDMyKTsNCj4gLQkJc3dpdGNo
IChwcm92LT5jb25mX2lucHV0cy5zdGFydC5hdXRoX21ldGhvZCkgew0KPiAtCQlkZWZhdWx0Og0K
PiAtCQljYXNlIDA6DQo+IC0JCQkvKiBBdXRoIFR5cGUgM2MgLSBObyBPT0IgKi8NCj4gLQkJCXBy
b3YtPm1hdGVyaWFsIHw9IE1BVF9SQU5EX0FVVEg7DQo+IC0JCQlicmVhazsNCj4gLQkJY2FzZSAx
Og0KPiAtCQkJLyogQXV0aCBUeXBlIDNjIC0gU3RhdGljIE9PQiAqLw0KPiAtCQkJLyogUHJvbXB0
IEFnZW50IGZvciBTdGF0aWMgT09CICovDQo+IC0JCQlmYWlsX2NvZGVbMV0gPSBtZXNoX2FnZW50
X3JlcXVlc3Rfc3RhdGljKHByb3YtPmFnZW50LA0KPiAtCQkJCQlzdGF0aWNfY2IsIHByb3YpOw0K
PiAtDQo+IC0JCQlpZiAoZmFpbF9jb2RlWzFdKQ0KPiAtCQkJCWdvdG8gZmFpbHVyZTsNCj4gLQ0K
PiAtCQkJYnJlYWs7DQo+IC0JCWNhc2UgMjoNCj4gLQkJCS8qIEF1dGggVHlwZSAzYSAtIE91dHB1
dCBPT0IgKi8NCj4gLQkJCS8qIFByb21wdCBBZ2VudCBmb3IgT3V0cHV0IE9PQiAqLw0KPiAtCQkJ
aWYgKHByb3YtPmNvbmZfaW5wdXRzLnN0YXJ0LmF1dGhfYWN0aW9uID09DQo+IC0JCQkJCQkJUFJP
Vl9BQ1RJT05fT1VUX0FMUEhBKSB7DQo+IC0JCQkJZmFpbF9jb2RlWzFdID0gbWVzaF9hZ2VudF9w
cm9tcHRfYWxwaGEoDQo+IC0JCQkJCXByb3YtPmFnZW50LCB0cnVlLA0KPiAtCQkJCQlzdGF0aWNf
Y2IsIHByb3YpOw0KPiAtCQkJfSBlbHNlIHsNCj4gLQkJCQlmYWlsX2NvZGVbMV0gPSBtZXNoX2Fn
ZW50X3Byb21wdF9udW1iZXIoDQo+IC0JCQkJCXByb3YtPmFnZW50LCB0cnVlLA0KPiAtCQkJCQlw
cm92LT5jb25mX2lucHV0cy5zdGFydC5hdXRoX2FjdGlvbiwNCj4gLQkJCQkJbnVtYmVyX2NiLCBw
cm92KTsNCj4gLQkJCX0NCj4gLQ0KPiAtCQkJaWYgKGZhaWxfY29kZVsxXSkNCj4gLQkJCQlnb3Rv
IGZhaWx1cmU7DQo+IC0NCj4gLQkJCWJyZWFrOw0KPiAtDQo+IC0JCWNhc2UgMzoNCj4gLQkJCS8q
IEF1dGggVHlwZSAzYiAtIGlucHV0IE9PQiAqLw0KPiAtCQkJZ2V0X3JhbmRvbV9rZXkocHJvdiwN
Cj4gLQkJCQkJcHJvdi0+Y29uZl9pbnB1dHMuc3RhcnQuYXV0aF9hY3Rpb24sDQo+IC0JCQkJCXBy
b3YtPmNvbmZfaW5wdXRzLnN0YXJ0LmF1dGhfc2l6ZSk7DQo+IC0JCQlvb2Jfa2V5ID0gbF9nZXRf
YmUzMihwcm92LT5yYW5kX2F1dGhfd29ya3NwYWNlICsgMjgpOw0KPiAtDQo+IC0JCQkvKiBBc2sg
QWdlbnQgdG8gRGlzcGxheSByYW5kb20ga2V5ICovDQo+IC0JCQlpZiAocHJvdi0+Y29uZl9pbnB1
dHMuc3RhcnQuYXV0aF9hY3Rpb24gPT0NCj4gLQkJCQkJCQlQUk9WX0FDVElPTl9JTl9BTFBIQSkg
ew0KPiAtDQo+IC0JCQkJZmFpbF9jb2RlWzFdID0gbWVzaF9hZ2VudF9kaXNwbGF5X3N0cmluZygN
Cj4gLQkJCQkJcHJvdi0+YWdlbnQsDQo+IC0JCQkJCShjaGFyICopIHByb3YtPnJhbmRfYXV0aF93
b3Jrc3BhY2UgKyAxNiwNCj4gLQkJCQkJTlVMTCwgcHJvdik7DQo+IC0JCQl9IGVsc2Ugew0KPiAt
CQkJCWZhaWxfY29kZVsxXSA9IG1lc2hfYWdlbnRfZGlzcGxheV9udW1iZXIoDQo+IC0JCQkJCXBy
b3YtPmFnZW50LCB0cnVlLA0KPiAtCQkJCQlwcm92LT5jb25mX2lucHV0cy5zdGFydC5hdXRoX2Fj
dGlvbiwNCj4gLQkJCQkJb29iX2tleSwgTlVMTCwgcHJvdik7DQo+IC0JCQl9DQo+IC0NCj4gLQkJ
CWlmIChmYWlsX2NvZGVbMV0pDQo+IC0JCQkJZ290byBmYWlsdXJlOw0KPiAtDQo+IC0JCQlicmVh
azsNCj4gLQ0KPiArCQlpZiAoIWludF9jcmVkZW50aWFscyhwcm92KSkgew0KPiArCQkJZmFpbF9j
b2RlWzFdID0gUFJPVl9FUlJfVU5FWFBFQ1RFRF9FUlI7DQo+ICsJCQlnb3RvIGZhaWx1cmU7DQo+
ICAJCX0NCj4gIA0KPiAtCQlpZiAocHJvdi0+bWF0ZXJpYWwgJiBNQVRfUkFORF9BVVRIKQ0KPiAt
CQkJc2VuZF9jb25maXJtKHByb3YpOw0KPiAtDQo+ICsJCWludF9wcm92X2F1dGgoKTsNCj4gIAkJ
YnJlYWs7DQo+ICANCj4gIAljYXNlIFBST1ZfSU5QX0NNUExUOiAvKiBQcm92aXNpb25pbmcgSW5w
dXQgQ29tcGxldGUgKi8NCj4gQEAgLTc2MCwxMSArNzk3LDE1IEBAIHN0YXRpYyB2b2lkIGludF9w
cm92X2Fjayh2b2lkICp1c2VyX2RhdGEsIHVpbnQ4X3QgbXNnX251bSkNCj4gIAkJcHJvdi0+c3Rh
dGUgPSBJTlRfUFJPVl9EQVRBX0FDS0VEOw0KPiAgCQlicmVhazsNCj4gIA0KPiArCWNhc2UgSU5U
X1BST1ZfS0VZX1NFTlQ6DQo+ICsJCWlmIChwcm92LT5jb25mX2lucHV0cy5jYXBzLnB1Yl90eXBl
ID09IDEpDQo+ICsJCQlpbnRfcHJvdl9hdXRoKCk7DQo+ICsJCWJyZWFrOw0KPiArDQo+ICAJY2Fz
ZSBJTlRfUFJPVl9JRExFOg0KPiAgCWNhc2UgSU5UX1BST1ZfSU5WSVRFX1NFTlQ6DQo+ICAJY2Fz
ZSBJTlRfUFJPVl9JTlZJVEVfQUNLRUQ6DQo+ICAJY2FzZSBJTlRfUFJPVl9TVEFSVF9BQ0tFRDoN
Cj4gLQljYXNlIElOVF9QUk9WX0tFWV9TRU5UOg0KPiAgCWNhc2UgSU5UX1BST1ZfS0VZX0FDS0VE
Og0KPiAgCWNhc2UgSU5UX1BST1ZfQ09ORl9TRU5UOg0KPiAgCWNhc2UgSU5UX1BST1ZfQ09ORl9B
Q0tFRDoNCg==
