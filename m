Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26428221E9C
	for <lists+linux-bluetooth@lfdr.de>; Thu, 16 Jul 2020 10:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgGPIkt (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 16 Jul 2020 04:40:49 -0400
Received: from mga04.intel.com ([192.55.52.120]:58628 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725921AbgGPIks (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 16 Jul 2020 04:40:48 -0400
IronPort-SDR: uUqL3QOuj3Yh0A0TFCzqKBWn0KidjR+TZXrezivZy4utdrzcLsu+NbWBRZSg5dhlNVLJg5+7VH
 vOIEbW4fmkGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="146853639"
X-IronPort-AV: E=Sophos;i="5.75,358,1589266800"; 
   d="scan'208";a="146853639"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2020 01:40:46 -0700
IronPort-SDR: XzhnR7+ZcBOQQ7/ghJ78CFnWTIV8EN2zMZQsJyOdEfAcI1J0FItijxUeK/R6bXOGwKuMto1+Wh
 Pd7KgissG1+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,358,1589266800"; 
   d="scan'208";a="300181800"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
  by orsmga002.jf.intel.com with ESMTP; 16 Jul 2020 01:40:46 -0700
Received: from orsmsx154.amr.corp.intel.com (10.22.226.12) by
 ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Jul 2020 01:40:46 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 ORSMSX154.amr.corp.intel.com (10.22.226.12) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Jul 2020 01:40:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Jul 2020 01:40:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnbpBUp2X33myEfiWY2iSQEKZ1RKhOUWfad6bYKERE3AkEmk7oMFbLyW4A/CHUF9/AUtnTblofiknhZz09K1/PUdsIVulrTKReMVSP6E1GxXSUsBtrQKuTITYtI+VtdKYMjtWMYlQUC5CvCLWBdm2qdfrciiVdJTSacWp5ierBv9fAeYioTbslLO4+8w9Meka9e350zUHVqPo4uELLsviqhgrhQ2VPnmKcwms7xUyzPvAQV60BsFtI2Y2YOZkmEp7eabW+JyZD91s/8DaGiSC9xbOG8lFET5Ku9AYEnb+J6/8/R5kd8ym550n4HGAOfThQ1U7IU42xcbY8SaAMnksQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jo1ukTd5ZCHyim1J/y2eUmviQ/TWO5uvZsJbWPse8BQ=;
 b=MHOlKRuOyqDra4EZEvZzCicaMzvmzlqz3sT/UjRez+g1J2+miEFaGaJBWYZ2WG99nt6EvVnyehNIPiBL5nkoJ/wrt54NIYF6wyiFAgkGO0c4AYbuUE262mG3NdjOFps53ZdgPoH4Yo4UC7KlethpCTdQh76/GQBPg/aJmFcQAqKsM3ncSUkdmsnXPx7yqPWbwYJk4KHzc0PQwDn94jRePC/IgKEHorePA6HCyMCNeLmQeYOQBvAFyzXbdDpPwxT4MmVpAKRSJG5LgYAQ9BBXgTTK9pqD+iHfnp8Yb9hHlxlgECSb3wkCmv5TZTElO2lXqY2/yoO375pNICl08LLbKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jo1ukTd5ZCHyim1J/y2eUmviQ/TWO5uvZsJbWPse8BQ=;
 b=T6B7G9KwHzIOGcDbu+pcE1V8l/xS2T/mP8mUZXfisTLVFqGXrB5cQdFN+ulybrg8wdNfF6DWgxB2BkAAQ3PKoS5jL+13h/guOtKZOx65n8tuJqVBTY4BJZJqBZmIGCWrXwEJDwIkY5jalgRrPCSjqj/+SSgCrjFzbI1WT4vNs78=
Received: from DM6PR11MB3369.namprd11.prod.outlook.com (2603:10b6:5:b::16) by
 DM6PR11MB2937.namprd11.prod.outlook.com (2603:10b6:5:62::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18; Thu, 16 Jul 2020 08:40:44 +0000
Received: from DM6PR11MB3369.namprd11.prod.outlook.com
 ([fe80::9064:3ba:cdd3:793b]) by DM6PR11MB3369.namprd11.prod.outlook.com
 ([fe80::9064:3ba:cdd3:793b%7]) with mapi id 15.20.3174.026; Thu, 16 Jul 2020
 08:40:44 +0000
From:   "Singh, AmitX K" <amitx.k.singh@intel.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
CC:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "Panda, Bharat B" <bharat.b.panda@intel.com>
Subject: RE: [PATCH] bluetoothctl:Add support for read characteristics value
Thread-Topic: [PATCH] bluetoothctl:Add support for read characteristics value
Thread-Index: AQHWO0WS9YqAd7ST3UyglNOrmzxAW6jKP4aAgDznkYA=
Date:   Thu, 16 Jul 2020 08:40:44 +0000
Message-ID: <DM6PR11MB3369B92BE82BDA54F4C29C19B67F0@DM6PR11MB3369.namprd11.prod.outlook.com>
References: <20200605142541.28412-1-amitx.k.singh@intel.com>
 <20200605142541.28412-3-amitx.k.singh@intel.com>
 <CABBYNZL_y5sBtWJFk-3b-oHRyq967ju=NNqn2i2+ySqQqe9-4A@mail.gmail.com>
In-Reply-To: <CABBYNZL_y5sBtWJFk-3b-oHRyq967ju=NNqn2i2+ySqQqe9-4A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [49.207.200.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acd02b5b-2080-4cb5-41eb-08d82963edf1
x-ms-traffictypediagnostic: DM6PR11MB2937:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB2937795FE5D2454080BBE307B67F0@DM6PR11MB2937.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:972;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ye+t3es7LP2WLQbMNqEHcPFshl9prej+fYVpofFuOgMIBdpiwzf+fVERrzPmEZxtkvXbk2sYPk0xe6nCaaiMgcWUHEVkCIUzfcFRW+RzUpi/HNuXgPmNn2JD6Zn0YomY9HH1smifGE3z/FzuM1mNflMwniswLNJwajJcHqyQ6wYrWTzu81riFMRcA8FB7vEMN9fX0vcs/1FNAe1jRlXT8UdHUO5tpGB4XVV6NbZtObz7E06WJE10HIf4JjAc2/FwclA4Uh1OXFYeMHQpXNg7K27480RLYE0RcffMplog//wmMDsSYh42T4O0B83LNTFj/gstrJP9XwsRank0hBvoxw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3369.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(6506007)(66476007)(64756008)(66556008)(26005)(54906003)(53546011)(6916009)(186003)(478600001)(7696005)(33656002)(66946007)(8936002)(8676002)(86362001)(5660300002)(9686003)(66446008)(55016002)(2906002)(71200400001)(76116006)(52536014)(4326008)(55236004)(107886003)(30864003)(316002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Nhqnxgq9e1ofMNUEhfpwkHudiYu8p9SLvrSnVuZ3PFiRs6pDzgwM9V+3TAz8TwVgXsEvuHl62gZfvpj4C5oA7RZk9ils5bCxvogiJtgeLlCGVG+ivE5WMMg6WictZ799f8biMuM3rlxV/5dOB+GqxGSct1IdCNg0ZEhrGHWcocAyqTLSkXmPpKic4vPrY8Q5MqnLyn5lEDc3WCGlwBD2Jz8+aZe9PnDH1rm17TEqReLco4bLUjIIUNYUijvmvunGXfn4gEeamjHoQgCGsA5FdrT8eymrlq+PMGqDaSh7bTj0Rq3usWh1bthVuGoSSr7D9Azt+uXurezIOls+u2fb6DFFYOj8m6GpfyjdPJo32BxLBHlTYFTm5pbWRYyWN6u7p47QXXU7hTaUTmTFvgtwIDR8YDdaXGgG0cpAPBN6C6qNAT518f6coHIBgaHKhix3sk4PbF4sHJc4C8sxErIp1IXtOGPkGtdL8IWvHxS0ROo=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3369.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd02b5b-2080-4cb5-41eb-08d82963edf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2020 08:40:44.2268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TJKsRABCIvuqciD/Nk1Fr2mV1yZONXcTL2KSv3O5uxiTWokRWrTvPtBP12foXNR8GHg9jbjunGJdaLMvorIbVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2937
X-OriginatorOrg: intel.com
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

SGkgTHVpeiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMdWl6IEF1
Z3VzdG8gdm9uIERlbnR6IDxsdWl6LmRlbnR6QGdtYWlsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBK
dW5lIDUsIDIwMjAgMTA6MzIgUE0NCj4gVG86IFNpbmdoLCBBbWl0WCBLIDxhbWl0eC5rLnNpbmdo
QGludGVsLmNvbT4NCj4gQ2M6IGxpbnV4LWJsdWV0b290aEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gYmx1ZXRvb3RoY3RsOkFkZCBzdXBwb3J0IGZvciByZWFkIGNoYXJh
Y3RlcmlzdGljcyB2YWx1ZQ0KPiANCj4gSGkgQW1pdCwNCj4gDQo+IE9uIEZyaSwgSnVuIDUsIDIw
MjAgYXQgNzozMCBBTSBBbWl0c2k1eCA8YW1pdHguay5zaW5naEBpbnRlbC5jb20+IHdyb3RlOg0K
PiA+DQo+ID4gRnJvbTogYW1pdCA8YW1pdHguay5zaW5naEBpbnRlbC5jb20+DQo+ID4NCj4gPiBD
aGFuZ2VzIG1hZGUgdG8gYWRkIHN1cHBvcnQgZm9yIHJlYWQgY2hhcmF0ZXJpc3RpYyB2YWx1ZSBi
eSB1dWlkIGluDQo+ID4gYmx1ZXRvb3RoY3RsLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogYW1p
dCA8YW1pdHguay5zaW5naEBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGNsaWVudC9nYXR0LmMg
ICAgICAgICAgICB8IDcwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGNs
aWVudC9nYXR0LmggICAgICAgICAgICB8ICAxICsNCj4gPiAgY2xpZW50L21haW4uYyAgICAgICAg
ICAgIHwgMTggKysrKysrKysrDQo+ID4gIHNyYy9nYXR0LWNsaWVudC5jICAgICAgICB8IDcwICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIHNyYy9zaGFyZWQvZ2F0dC1jbGll
bnQuYyB8IDg2DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0K
PiA+ICBzcmMvc2hhcmVkL2dhdHQtY2xpZW50LmggfCAgNSArKysNCj4gPiAgNiBmaWxlcyBjaGFu
Z2VkLCAyNDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2NsaWVudC9nYXR0LmMgYi9jbGllbnQvZ2F0dC5jIGluZGV4IDUzZjg3NTA1MC4uOGMyODQ0
ZWQ2DQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvY2xpZW50L2dhdHQuYw0KPiA+ICsrKyBiL2NsaWVu
dC9nYXR0LmMNCj4gPiBAQCAtNjgxLDYgKzY4MSw3NiBAQCB2b2lkIGdhdHRfcmVhZF9hdHRyaWJ1
dGUoR0RCdXNQcm94eSAqcHJveHksIGludA0KPiBhcmdjLCBjaGFyICphcmd2W10pDQo+ID4gICAg
ICAgICByZXR1cm4gYnRfc2hlbGxfbm9uaW50ZXJhY3RpdmVfcXVpdChFWElUX0ZBSUxVUkUpOw0K
PiA+ICB9DQo+ID4NCj4gPiArc3RhdGljIHZvaWQgY2hhcnJlYWRieXV1aWRfcmVwbHkoREJ1c01l
c3NhZ2UgKm1lc3NhZ2UsIHZvaWQNCj4gPiArKnVzZXJfZGF0YSkgew0KPiA+ICsgICAgICAgREJ1
c0Vycm9yIGVycm9yOw0KPiA+ICsgICAgICAgREJ1c01lc3NhZ2VJdGVyIGl0ZXIsIGFycmF5Ow0K
PiA+ICsgICAgICAgdWludDhfdCAqdmFsdWU7DQo+ID4gKyAgICAgICBpbnQgbGVuOw0KPiA+ICsN
Cj4gPiArICAgICAgIGRidXNfZXJyb3JfaW5pdCgmZXJyb3IpOw0KPiA+ICsNCj4gPiArICAgICAg
IGlmIChkYnVzX3NldF9lcnJvcl9mcm9tX21lc3NhZ2UoJmVycm9yLCBtZXNzYWdlKSA9PSBUUlVF
KSB7DQo+ID4gKyAgICAgICAgICAgICAgIGJ0X3NoZWxsX3ByaW50ZigiRmFpbGVkIHRvIHJlYWQ6
ICVzXG4iLCBlcnJvci5uYW1lKTsNCj4gPiArICAgICAgICAgICAgICAgZGJ1c19lcnJvcl9mcmVl
KCZlcnJvcik7DQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBidF9zaGVsbF9ub25pbnRlcmFj
dGl2ZV9xdWl0KEVYSVRfRkFJTFVSRSk7DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAg
ICAgZGJ1c19tZXNzYWdlX2l0ZXJfaW5pdChtZXNzYWdlLCAmaXRlcik7DQo+ID4gKw0KPiA+ICsg
ICAgICAgaWYgKGRidXNfbWVzc2FnZV9pdGVyX2dldF9hcmdfdHlwZSgmaXRlcikgIT0gREJVU19U
WVBFX0FSUkFZKSB7DQo+ID4gKyAgICAgICAgICAgICAgIGJ0X3NoZWxsX3ByaW50ZigiSW52YWxp
ZCByZXNwb25zZSB0byByZWFkXG4iKTsNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGJ0X3No
ZWxsX25vbmludGVyYWN0aXZlX3F1aXQoRVhJVF9GQUlMVVJFKTsNCj4gPiArICAgICAgIH0NCj4g
PiArDQo+ID4gKyAgICAgICBkYnVzX21lc3NhZ2VfaXRlcl9yZWN1cnNlKCZpdGVyLCAmYXJyYXkp
Ow0KPiA+ICsgICAgICAgZGJ1c19tZXNzYWdlX2l0ZXJfZ2V0X2ZpeGVkX2FycmF5KCZhcnJheSwg
JnZhbHVlLCAmbGVuKTsNCj4gPiArDQo+ID4gKyAgICAgICBpZiAobGVuIDwgMCkgew0KPiA+ICsg
ICAgICAgICAgICAgICBidF9zaGVsbF9wcmludGYoIlVuYWJsZSB0byBwYXJzZSB2YWx1ZVxuIik7
DQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBidF9zaGVsbF9ub25pbnRlcmFjdGl2ZV9xdWl0
KEVYSVRfRkFJTFVSRSk7DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgYnRfc2hl
bGxfaGV4ZHVtcCh2YWx1ZSwgbGVuKTsNCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gYnRfc2hl
bGxfbm9uaW50ZXJhY3RpdmVfcXVpdChFWElUX1NVQ0NFU1MpOw0KPiA+ICt9DQo+ID4gKw0KPiA+
ICtzdGF0aWMgdm9pZCBjaGFycmVhZGJ5dXVpZF9zZXR1cChEQnVzTWVzc2FnZUl0ZXIgKml0ZXIs
IHZvaWQNCj4gPiArKnVzZXJfZGF0YSkgew0KPiA+ICsgICAgICAgY2hhciAqdXVpZCA9IHVzZXJf
ZGF0YTsNCj4gPiArDQo+ID4gKyAgICAgICBkYnVzX21lc3NhZ2VfaXRlcl9hcHBlbmRfYmFzaWMo
aXRlciwgREJVU19UWVBFX1NUUklORywgJnV1aWQpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0
aWMgdm9pZCBjaGFycmVhZGJ5dXVpZF9hdHRyaWJ1dGUoR0RCdXNQcm94eSAqcHJveHksIGNoYXIg
KnV1aWQpIHsNCj4gPiArICAgICAgIGlmIChnX2RidXNfcHJveHlfbWV0aG9kX2NhbGwocHJveHks
ICJDaGFyUmVhZEJ5VVVJRCIsDQo+IGNoYXJyZWFkYnl1dWlkX3NldHVwLCBjaGFycmVhZGJ5dXVp
ZF9yZXBseSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1dWlkLCBOVUxMKSA9PSBGQUxTRSkgew0KPiA+ICsgICAgICAgICAgICAgICBidF9zaGVs
bF9wcmludGYoIkZhaWxlZCB0byBzZXQgdXVpZFxuIik7DQo+ID4gKyAgICAgICAgICAgICAgIHJl
dHVybiBidF9zaGVsbF9ub25pbnRlcmFjdGl2ZV9xdWl0KEVYSVRfRkFJTFVSRSk7DQo+ID4gKyAg
ICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgYnRfc2hlbGxfcHJpbnRmKCJBdHRlbXB0aW5nIHRv
IHJlYWQgc2VydmljZSBoYW5kbGUgJXNcbiIsDQo+ID4gK2dfZGJ1c19wcm94eV9nZXRfcGF0aChw
cm94eSkpOyB9DQo+ID4gKw0KPiA+ICt2b2lkIGdhdHRfY2hhcnJlYWRieXV1aWRfYXR0cmlidXRl
KEdEQnVzUHJveHkgKnByb3h5LCBpbnQgYXJnYywgY2hhcg0KPiA+ICsqYXJndltdKSB7DQo+ID4g
KyAgICAgICBjb25zdCBjaGFyICppZmFjZTsNCj4gPiArDQo+ID4gKyAgICAgICBpZmFjZSA9IGdf
ZGJ1c19wcm94eV9nZXRfaW50ZXJmYWNlKHByb3h5KTsNCj4gPiArDQo+ID4gKyAgICAgICBpZiAo
IXN0cmNtcChpZmFjZSwgIm9yZy5ibHVlei5HYXR0Q2hhcmFjdGVyaXN0aWMxIikpIHsNCj4gPiAr
ICAgICAgICAgICAgICAgY2hhcnJlYWRieXV1aWRfYXR0cmlidXRlKHByb3h5LCBhcmd2WzFdKTsN
Cj4gPiArICAgICAgICAgICAgICAgcmV0dXJuOw0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiAr
ICAgICAgIGJ0X3NoZWxsX3ByaW50ZigiVW5hYmxlIHRvIHJlYWQgYXR0cmlidXRlICVzXG4iLA0K
PiA+ICsNCj4gPiArIGdfZGJ1c19wcm94eV9nZXRfcGF0aChwcm94eSkpOw0KPiA+ICsNCj4gPiAr
ICAgICAgIHJldHVybiBidF9zaGVsbF9ub25pbnRlcmFjdGl2ZV9xdWl0KEVYSVRfRkFJTFVSRSk7
DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0YXRpYyB2b2lkIGNoYXJieXV1aWRfcmVwbHkoREJ1c01l
c3NhZ2UgKm1lc3NhZ2UsIHZvaWQgKnVzZXJfZGF0YSkNCj4gPiB7DQo+ID4gICAgICAgICBEQnVz
RXJyb3IgZXJyb3I7DQo+ID4gZGlmZiAtLWdpdCBhL2NsaWVudC9nYXR0LmggYi9jbGllbnQvZ2F0
dC5oIGluZGV4IDY5MmZiNTc1OC4uOGY5NmQ4NjY1DQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvY2xp
ZW50L2dhdHQuaA0KPiA+ICsrKyBiL2NsaWVudC9nYXR0LmgNCj4gPiBAQCAtMzUsNiArMzUsNyBA
QCBHREJ1c1Byb3h5ICpnYXR0X3NlbGVjdF9hdHRyaWJ1dGUoR0RCdXNQcm94eQ0KPiA+ICpwYXJl
bnQsIGNvbnN0IGNoYXIgKnBhdGgpOyAgY2hhciAqZ2F0dF9hdHRyaWJ1dGVfZ2VuZXJhdG9yKGNv
bnN0IGNoYXINCj4gPiAqdGV4dCwgaW50IHN0YXRlKTsgIHZvaWQgZ2F0dF9zZXJ2Ynl1dWlkX2F0
dHJpYnV0ZShHREJ1c1Byb3h5ICpwcm94eSwNCj4gPiBpbnQgYXJnYywgY2hhciAqYXJndltdKTsg
IHZvaWQgZ2F0dF9jaGFyYnl1dWlkX2F0dHJpYnV0ZShHREJ1c1Byb3h5DQo+ID4gKnByb3h5LCBp
bnQgYXJnYywgY2hhciAqYXJndltdKTsNCj4gPiArdm9pZCBnYXR0X2NoYXJyZWFkYnl1dWlkX2F0
dHJpYnV0ZShHREJ1c1Byb3h5ICpwcm94eSwgaW50IGFyZ2MsIGNoYXINCj4gPiArKmFyZ3ZbXSk7
DQo+ID4gIHZvaWQgZ2F0dF9yZWFkX2F0dHJpYnV0ZShHREJ1c1Byb3h5ICpwcm94eSwgaW50IGFy
Z2MsIGNoYXIgKmFyZ3ZbXSk7DQo+ID4gdm9pZCBnYXR0X3dyaXRlX2F0dHJpYnV0ZShHREJ1c1By
b3h5ICpwcm94eSwgaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSk7DQo+ID4gdm9pZCBnYXR0X25vdGlm
eV9hdHRyaWJ1dGUoR0RCdXNQcm94eSAqcHJveHksIGJvb2wgZW5hYmxlKTsgZGlmZiAtLWdpdA0K
PiA+IGEvY2xpZW50L21haW4uYyBiL2NsaWVudC9tYWluLmMgaW5kZXggMTBlNjRlMTdiLi40ZGQx
ZTU5M2EgMTAwNjQ0DQo+ID4gLS0tIGEvY2xpZW50L21haW4uYw0KPiA+ICsrKyBiL2NsaWVudC9t
YWluLmMNCj4gPiBAQCAtMjA3MSw2ICsyMDcxLDIyIEBAIHN0YXRpYyB2b2lkIGNtZF9hdHRyaWJ1
dGVfaW5mbyhpbnQgYXJnYywgY2hhcg0KPiAqYXJndltdKQ0KPiA+ICAgICAgICAgcmV0dXJuIGJ0
X3NoZWxsX25vbmludGVyYWN0aXZlX3F1aXQoRVhJVF9TVUNDRVNTKTsNCj4gPiAgfQ0KPiA+DQo+
ID4gK3N0YXRpYyB2b2lkIGNtZF9jaGFyX3JlYWRfYnlfdXVpZChpbnQgYXJnYywgY2hhciAqYXJn
dltdKSB7DQo+ID4gKyAgICAgICBHREJ1c1Byb3h5ICpwcm94eTsNCj4gPiArDQo+ID4gKyAgICAg
ICBwcm94eSA9IGZpbmRfYXR0cmlidXRlKGFyZ2MsIGFyZ3YpOw0KPiA+ICsNCj4gPiArICAgICAg
IHNldF9kZWZhdWx0X2F0dHJpYnV0ZShwcm94eSk7DQo+ID4gKw0KPiA+ICsgICAgICAgaWYgKCFk
ZWZhdWx0X2F0dHIpIHsNCj4gPiArICAgICAgICAgICAgICAgYnRfc2hlbGxfcHJpbnRmKCJObyBh
dHRyaWJ1dGUgc2VsZWN0ZWRcbiIpOw0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gYnRfc2hl
bGxfbm9uaW50ZXJhY3RpdmVfcXVpdChFWElUX0ZBSUxVUkUpOw0KPiA+ICsgICAgICAgfQ0KPiA+
ICsNCj4gPiArICAgICAgIGdhdHRfY2hhcnJlYWRieXV1aWRfYXR0cmlidXRlKGRlZmF1bHRfYXR0
ciwgYXJnYywgYXJndik7IH0NCj4gPiArDQo+ID4gIHN0YXRpYyB2b2lkIGNtZF9jaGFyX2J5X3V1
aWQoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkgIHsNCj4gPiAgICAgICAgIEdEQnVzUHJveHkgKnBy
b3h5Ow0KPiA+IEBAIC0yNzE4LDYgKzI3MzQsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGJ0X3No
ZWxsX21lbnUgZ2F0dF9tZW51ID0gew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIkRpc2NvdmVyIFByaW1hcnkgU2VydmljZXMgYnkgVVVJRCIgfSwNCj4gPiAgICAgICAgIHsg
ImNoYXItYnktdXVpZCIsICJbVVVJRF0iLCBjbWRfY2hhcl9ieV91dWlkLA0KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIkRpc2NvdmVyIENoYXJhY3RlcmlzdGljIFNlcnZpY2Vz
IGJ5DQo+ID4gVVVJRCIgfSwNCj4gPiArICAgICAgIHsgImNoYXItcmVhZC1ieS11dWlkIiwgIltV
VUlEXSIsIGNtZF9jaGFyX3JlYWRfYnlfdXVpZCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJSZWFkIENoYXJhY3RlcmlzdGljIGJ5IFVVSUQiIH0sDQo+ID4gICAgICAgICB7
ICJzZWxlY3QtYXR0cmlidXRlIiwgIjxhdHRyaWJ1dGUvVVVJRD4iLCAgY21kX3NlbGVjdF9hdHRy
aWJ1dGUsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiU2VsZWN0IGF0dHJp
YnV0ZSIsIGF0dHJpYnV0ZV9nZW5lcmF0b3IgfSwNCj4gPiAgICAgICAgIHsgImF0dHJpYnV0ZS1p
bmZvIiwgIlthdHRyaWJ1dGUvVVVJRF0iLCAgY21kX2F0dHJpYnV0ZV9pbmZvLA0KPiA+IGRpZmYg
LS1naXQgYS9zcmMvZ2F0dC1jbGllbnQuYyBiL3NyYy9nYXR0LWNsaWVudC5jIGluZGV4DQo+ID4g
ZGE4MTFlYTRmLi5jZDZkNmRmZGUgMTAwNjQ0DQo+ID4gLS0tIGEvc3JjL2dhdHQtY2xpZW50LmMN
Cj4gPiArKysgYi9zcmMvZ2F0dC1jbGllbnQuYw0KPiA+IEBAIC00NDQsNiArNDQ0LDI3IEBAIHN0
YXRpYyBzdHJ1Y3QgYXN5bmNfZGJ1c19vcA0KPiAqYXN5bmNfZGJ1c19vcF9uZXcoREJ1c01lc3Nh
Z2UgKm1zZywgdm9pZCAqZGF0YSkNCj4gPiAgICAgICAgIHJldHVybiBvcDsNCj4gPiAgfQ0KPiA+
DQo+ID4gK3N0YXRpYyBzdHJ1Y3QgYXN5bmNfZGJ1c19vcCAqZmV0Y2hfY2hhcl9yZWFkX2J5X3V1
aWQoc3RydWN0DQo+IGJ0X2dhdHRfY2xpZW50ICpnYXR0LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBEQnVzTWVzc2FnZSAqbXNnLA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjaGFyICp1dWlkLA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBidF9nYXR0X2NsaWVudF9jaGFyX2J5X3V1aWRf
Y2FsbGJhY2tfdCBjYWxsYmFjaywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdm9pZCAqZGF0YSkgew0KPiA+ICsgICAgICAgc3RydWN0IGFzeW5jX2RidXNfb3Ag
Km9wOw0KPiA+ICsNCj4gPiArICAgICAgIG9wID0gYXN5bmNfZGJ1c19vcF9uZXcobXNnLCBkYXRh
KTsNCj4gPiArICAgICAgIG9wLT5pZCA9IGJ0X2dhdHRfY2xpZW50X2NoYXJfcmVhZF9ieV91dWlk
KGdhdHQsIHV1aWQsIGNhbGxiYWNrLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGFzeW5jX2RidXNfb3BfcmVmKG9wKSwNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhc3luY19kYnVzX29wX3VucmVm
KTsNCj4gPiArDQo+ID4gKyAgICAgICBpZiAob3AtPmlkKQ0KPiA+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gb3A7DQo+ID4gKw0KPiA+ICsgICAgICAgYXN5bmNfZGJ1c19vcF9mcmVlKG9wKTsNCj4g
PiArDQo+ID4gKyAgICAgICByZXR1cm4gTlVMTDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGlj
IHN0cnVjdCBhc3luY19kYnVzX29wICpmZXRjaF9jaGFyX2J5X3V1aWQoc3RydWN0IGJ0X2dhdHRf
Y2xpZW50DQo+ICpnYXR0LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBEQnVzTWVzc2FnZSAqbXNnLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjaGFyICp1dWlkLCBAQCAtOTcyLDYgKzk5Myw1Mg0KPiA+IEBAIGZhaWw6DQo+
ID4gICAgICAgICBjaHJjLT5yZWFkX29wID0gTlVMTDsNCj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRp
YyB2b2lkIGNoYXJfcmVhZF9ieV91dWlkX2NiKGJvb2wgc3VjY2VzcywgdWludDhfdCBhdHRfZWNv
ZGUsIGNvbnN0DQo+IHVpbnQ4X3QgKnZhbHVlLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1aW50MTZfdCBsZW5ndGgsIHZvaWQNCj4gPiArKnVzZXJfZGF0YSkg
ew0KPiA+ICsgICAgICAgc3RydWN0IGFzeW5jX2RidXNfb3AgKm9wID0gdXNlcl9kYXRhOw0KPiA+
ICsgICAgICAgc3RydWN0IGNoYXJhY3RlcmlzdGljICpvcGNoYXIgPSBvcC0+ZGF0YTsNCj4gPiAr
DQo+ID4gKyAgICAgICBpZiAoIXN1Y2Nlc3MpDQo+ID4gKyAgICAgICAgICAgICAgIGdvdG8gZmFp
bDsNCj4gPiArDQo+ID4gKyAgICAgICBhc3luY19kYnVzX29wX3JlcGx5KG9wLCBhdHRfZWNvZGUs
IHZhbHVlLCBsZW5ndGgpOw0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybjsNCj4gPiArDQo+ID4g
K2ZhaWw6DQo+ID4gKyAgICAgICBhc3luY19kYnVzX29wX3JlcGx5KG9wLCBhdHRfZWNvZGUsIE5V
TEwsIDApOw0KPiA+ICsNCj4gPiArICAgICAgIG9wY2hhci0+dHlwZV9vcCA9IE5VTEw7DQo+ID4g
K30NCj4gPiArDQo+ID4gK3N0YXRpYyBEQnVzTWVzc2FnZSAqY2hhcl9yZWFkX2J5X3V1aWQoREJ1
c0Nvbm5lY3Rpb24gKmNvbm4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIERCdXNNZXNzYWdlICptc2csIHZvaWQNCj4gPiArKnVzZXJfZGF0YSkgew0KPiA+ICsg
ICAgICAgc3RydWN0IGNoYXJhY3RlcmlzdGljICpjaGFyZGF0YSA9IHVzZXJfZGF0YTsNCj4gPiAr
ICAgICAgIHN0cnVjdCBidF9nYXR0X2NsaWVudCAqZ2F0dCA9IGNoYXJkYXRhLT5zZXJ2aWNlLT5j
bGllbnQtPmdhdHQ7DQo+ID4gKyAgICAgICBEQnVzTWVzc2FnZUl0ZXIgaXRlcjsNCj4gPiArDQo+
ID4gKyAgICAgICBjaGFyICp1dWlkID0gMDsNCj4gPiArDQo+ID4gKyAgICAgICBpZiAoIWdhdHQp
DQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBidGRfZXJyb3JfZmFpbGVkKG1zZywgIk5vdCBj
b25uZWN0ZWQiKTsNCj4gPiArDQo+ID4gKyAgICAgICBkYnVzX21lc3NhZ2VfaXRlcl9pbml0KG1z
ZywgJml0ZXIpOw0KPiA+ICsNCj4gPiArICAgICAgIGlmIChkYnVzX21lc3NhZ2VfaXRlcl9nZXRf
YXJnX3R5cGUoJml0ZXIpID09IERCVVNfVFlQRV9TVFJJTkcpDQo+ID4gKyAgICAgICAgICAgICAg
IGRidXNfbWVzc2FnZV9pdGVyX2dldF9iYXNpYygmaXRlciwmdXVpZCk7DQo+ID4gKyAgICAgICBl
bHNlDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOw0KPiA+ICsNCj4gPiArICAgICAg
IGNoYXJkYXRhLT50eXBlX29wID0gZmV0Y2hfY2hhcl9yZWFkX2J5X3V1aWQoZ2F0dCwgbXNnLHV1
aWQsDQo+ID4gKyBjaGFyX3JlYWRfYnlfdXVpZF9jYiwgY2hhcmRhdGEpOw0KPiA+ICsNCj4gPiAr
ICAgICAgIGlmICghY2hhcmRhdGEtPnR5cGVfb3ApDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVy
biBidGRfZXJyb3JfZmFpbGVkKG1zZywgIkZhaWxlZCB0byBzZW5kIHJlYWQNCj4gPiArIHJlcXVl
c3QiKTsNCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gTlVMTDsNCj4gPiArfQ0KPiA+ICsNCj4g
PiAgc3RhdGljIHZvaWQgY2hhcmFjdGVyaXN0aWNfYnlfdXVpZF9jYihib29sIHN1Y2Nlc3MsIHVp
bnQ4X3QgYXR0X2Vjb2RlLA0KPiBjb25zdCB1aW50OF90ICp2YWx1ZSwNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3QgbGVuZ3RoLCB2b2lkDQo+ID4g
KnVzZXJfZGF0YSkgIHsgQEAgLTE3ODYsNiArMTg1Myw5IEBAIHN0YXRpYyBjb25zdCBHREJ1c01l
dGhvZFRhYmxlDQo+ID4gY2hhcmFjdGVyaXN0aWNfbWV0aG9kc1tdID0gew0KPiA+ICAgICAgICAg
eyBHREJVU19BU1lOQ19NRVRIT0QoIkNoYXJCeVVVSUQiLCBHREJVU19BUkdTKHsgIm9wdGlvbnMi
LA0KPiAicyIgfSksDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEdEQlVTX0FSR1MoeyAidmFsdWUiLCAiYXkiIH0pLA0KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjaGFyZGlzY292ZXJfYnlfdXVpZCkgfSwNCj4gPiArICAgICAg
IHsgR0RCVVNfQVNZTkNfTUVUSE9EKCJDaGFyUmVhZEJ5VVVJRCIsIEdEQlVTX0FSR1Moew0KPiAi
b3B0aW9ucyIsICJzIiB9KSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgR0RCVVNfQVJHUyh7ICJ2YWx1ZSIsICJheSIgfSksDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNoYXJfcmVhZF9ieV91dWlkKSB9LA0KPiANCj4gSXQg
d291bGQgaGF2ZSBoZWxwZWQgaWYgeW91IGhhZCBjb21tdW5pY2F0ZWQgdGhhdCB5b3Ugd291bGQg
YmUgbG9va2luZw0KPiBpbnRvIGFkZCBzdXBwb3J0IGZvciB0aGlzIHR5cGUgb2Ygb3BlcmF0aW9u
LCB0aGVzZSBwcm9jZWR1cmVzIG9idmlvdXNseQ0KPiBjYW5ub3QgYmUgcGFydCBvZiBDaGFyYWN0
ZXJpc3RpYyBpbnRlcmZhY2Ugc2luY2UgdGhhdCBpcyBvbmx5IGF2YWlsYWJsZSBhZnRlciB0aGUN
Cj4gZGlzY292ZXJ5IHByb2NlZHVyZSB0aGVuIHlvdSBjYW4ganVzdCBsb29rdXAgaW50ZXJuYWxs
eSBpbiB0aGUgY2FjaGUuIFNvIHRoaXMNCj4gdHlwZSBvZiBwcm9jZWR1cmUgd2lsbCBwcm9iYWJs
eSBuZWVkIHRvIGJlIHVuZGVyIGEgRGV2aWNlIG9iamVjdCBhbmQgbGV0cw0KPiBwbGVhc2UgYWdy
ZWUgb24gdGhlIGRvY3VtZW50YXRpb24gZmlyc3QgYmVmb3JlIHdlIG1vdmUgZm9yd2FyZC4NCj4g
DQoNCldoZW4gd2UgdmVyaWZ5IHRoZSBQVFMgdGVzdCBjYXNlIEdBVFQvQ0wvR0FSL0JWLTAzLUMg
IlJlYWQgdXNpbmcgY2hhcmFjdGVyaXNpdGljIFVVSUQiLCB0aGUgVGVzdCBjYXNlIGV4cGVjdCBy
ZWFkIHJlcXVlc3QgZnJvbSBkZXZpY2UgLg0KQWRkZWQgYSBjb2RlIGZvciBzZW5kaW5nIHJlYWQg
cmVxdWVzdCBmb3IgcmVhZGluZyBjaGFyYWN0ZXJpc3RpYyB2YWx1ZSB1c2luZyBVVUlEIG92ZXIg
Y2hhcmFjdGVyaXN0aWMgaW50ZXJmYWNlDQoNCj4gPiAgICAgICAgIHsgR0RCVVNfQVNZTkNfTUVU
SE9EKCJSZWFkVmFsdWUiLCBHREJVU19BUkdTKHsgIm9wdGlvbnMiLA0KPiAiYXtzdn0iIH0pLA0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHREJVU19BUkdTKHsg
InZhbHVlIiwgImF5IiB9KSwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY2hhcmFjdGVyaXN0aWNfcmVhZF92YWx1ZSkgfSwNCj4gPiBkaWZmIC0tZ2l0IGEvc3Jj
L3NoYXJlZC9nYXR0LWNsaWVudC5jIGIvc3JjL3NoYXJlZC9nYXR0LWNsaWVudC5jIGluZGV4DQo+
ID4gOGE2OTZjNzdmLi43YzlkMjVlYzMgMTAwNjQ0DQo+ID4gLS0tIGEvc3JjL3NoYXJlZC9nYXR0
LWNsaWVudC5jDQo+ID4gKysrIGIvc3JjL3NoYXJlZC9nYXR0LWNsaWVudC5jDQo+ID4gQEAgLTI3
MjUsNiArMjcyNSw5MCBAQCBkb25lOg0KPiA+ICAgICAgICAgICAgICAgICBvcC0+Y2FsbGJhY2so
c3VjY2VzcywgYXR0X2Vjb2RlLCB2YWx1ZSwgbGVuZ3RoLA0KPiA+IG9wLT51c2VyX2RhdGEpOyAg
fQ0KPiA+DQo+ID4gK3Vuc2lnbmVkIGludCBidF9nYXR0X2NsaWVudF9jaGFyX3JlYWRfYnlfdXVp
ZChzdHJ1Y3QgYnRfZ2F0dF9jbGllbnQNCj4gKmNsaWVudCwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjaGFyICp1dWlkLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJ0X2dhdHRfY2xpZW50X2No
YXJfYnlfdXVpZF9jYWxsYmFja190IGNhbGxiYWNrLA0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKnVzZXJfZGF0YSwNCj4gPiArDQo+ID4g
K2J0X2dhdHRfY2xpZW50X2Rlc3Ryb3lfZnVuY190IGRlc3Ryb3kpIHsNCj4gPiArICAgICAgIHN0
cnVjdCByZXF1ZXN0ICpyZXE7DQo+ID4gKyAgICAgICBzdHJ1Y3QgY2hhcl9ieV91dWlkX29wICpv
cDsNCj4gPiArICAgICAgIHVuc2lnbmVkIGNoYXIgKnBkdTsNCj4gPiArICAgICAgIHVpbnQxNl90
IGxlbiA7DQo+ID4gKyAgICAgICB1aW50MTZfdCBzdGFydF9oYW5kbGUgPSAweDAwMDE7DQo+ID4g
KyAgICAgICB1aW50MTZfdCBlbmRfaGFuZGxlID0gMHhmZmZmOw0KPiA+ICsgICAgICAgYnRfdXVp
ZF90IGJ0dXVpZDsNCj4gPiArICAgICAgIHVpbnQ4X3QgdXVpZDEyOFsxNl07DQo+ID4gKw0KPiA+
ICsgICAgICAgLyogTGVuZ3RoIG9mIHBkdSB3aWxsIGJlIHZhcnkgYWNjb3JkaW5nIHRvIHV1aWQg
dHlwZQ0KPiA+ICsgICAgICAgZm9yIDIgYnl0ZSB1dWlkIHRvdGFsIGxlbmd0aCAgaXMgOCAoc3Rh
cnQgaGFuZGxlKDIpICsgZW5kIGhhbmRsZSgyKSAgKw0KPiB1dWlkKDIpKQ0KPiA+ICsgICAgICAg
Zm9yIDE2IGJ5dGUgdXVpZCB0b3RhbCBsZW5ndGggIGlzIDIyIChzdGFydCBoYW5kbGUoMikgKyBl
bmQgaGFuZGxlKDIpICArDQo+IHV1aWQoMTYpKQ0KPiA+ICsgICAgICAgKi8NCj4gPiArICAgICAg
IHVpbnQxNl90IHBkdV9sZW5fMTZiaXRfdXVpZCA9IDY7DQo+ID4gKyAgICAgICB1aW50MTZfdCBw
ZHVfbGVuXzEyOGJpdF91dWlkID0gMjA7DQo+ID4gKw0KPiA+ICsgICAgICAgaWYgKGJ0X3N0cmlu
Z190b191dWlkKCZidHV1aWQsIHV1aWQpIDwgMCkgew0KPiA+ICsgICAgICAgICAgICAgICByZXR1
cm4gMDsNCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICBpZiAoYnR1dWlkLnR5cGUg
PT0gQlRfVVVJRDE2KXsNCj4gPiArICAgICAgICAgICAgICAgcGR1ID0gKHVuc2lnbmVkIGNoYXIg
KikgbWFsbG9jKHBkdV9sZW5fMTZiaXRfdXVpZCk7DQo+ID4gKyAgICAgICAgICAgICAgIGxlbiA9
IHBkdV9sZW5fMTZiaXRfdXVpZDsNCj4gPiArICAgICAgIH0gZWxzZSB7DQo+ID4gKyAgICAgICAg
ICAgICAgIHBkdSA9ICh1bnNpZ25lZCBjaGFyICopIG1hbGxvYyhwZHVfbGVuXzEyOGJpdF91dWlk
KTsNCj4gPiArICAgICAgICAgICAgICAgbGVuID0gcGR1X2xlbl8xMjhiaXRfdXVpZDsNCj4gPiAr
ICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICBpZiAoIWNsaWVudCkNCj4gPiArICAgICAgICAg
ICAgICAgcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICsgICAgICAgb3AgPSBuZXcwKHN0cnVjdCBjaGFy
X2J5X3V1aWRfb3AsIDEpOw0KPiA+ICsgICAgICAgcmVxID0gcmVxdWVzdF9jcmVhdGUoY2xpZW50
KTsNCj4gPiArICAgICAgIGlmICghcmVxKSB7DQo+ID4gKyAgICAgICAgICAgICAgIGZyZWUob3Ap
Ow0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gPiArICAgICAgIH0NCj4gPiArICAg
ICAgIGlmICghY2xpZW50KQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gPiArDQo+
ID4gKyAgICAgICBvcCA9IG5ldzAoc3RydWN0IGNoYXJfYnlfdXVpZF9vcCwgMSk7DQo+ID4gKyAg
ICAgICByZXEgPSByZXF1ZXN0X2NyZWF0ZShjbGllbnQpOw0KPiA+ICsNCj4gPiArICAgICAgIGlm
ICghcmVxKSB7DQo+ID4gKyAgICAgICAgICAgICAgIGZyZWUob3ApOw0KPiA+ICsgICAgICAgICAg
ICAgICByZXR1cm4gMDsNCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICBvcC0+Y2Fs
bGJhY2sgPSBjYWxsYmFjazsNCj4gPiArICAgICAgIG9wLT51c2VyX2RhdGEgPSB1c2VyX2RhdGE7
DQo+ID4gKyAgICAgICBvcC0+ZGVzdHJveSA9IGRlc3Ryb3k7DQo+ID4gKyAgICAgICByZXEtPmRh
dGEgPSBvcDsNCj4gPiArICAgICAgIHJlcS0+ZGVzdHJveSA9IGRlc3Ryb3lfY2hhcl9ieV91dWlk
X29wOw0KPiA+ICsNCj4gPiArICAgICAgIHB1dF9sZTE2KHN0YXJ0X2hhbmRsZSwgcGR1KTsNCj4g
PiArICAgICAgIHB1dF9sZTE2KGVuZF9oYW5kbGUsIHBkdSsyKTsNCj4gPiArDQo+ID4gKyAgICAg
ICBpZiAoYnR1dWlkLnR5cGUgPT0gQlRfVVVJRDE2KQ0KPiA+ICsgICAgICAgICAgICAgICBwdXRf
bGUxNihidHV1aWQudmFsdWUudTE2LCBwZHUrNCk7DQo+ID4gKyAgICAgICBlbHNlIHsNCj4gPiAr
ICAgICAgICAgICAgICAgYnN3YXBfMTI4KCZidHV1aWQudmFsdWUudTEyOC5kYXRhWzBdLCAmdXVp
ZDEyOFswXSk7DQo+ID4gKyAgICAgICAgICAgICAgIG1lbWNweShwZHUgKyA0LCB1dWlkMTI4LCAx
Nik7DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgcmVxLT5hdHRfaWQgPSBidF9h
dHRfc2VuZChjbGllbnQtPmF0dCwNCj4gQlRfQVRUX09QX1JFQURfQllfVFlQRV9SRVEsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
ZHUsIGxlbiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNoYXJfYnlfdXVpZF9jYiwgcmVxLA0KPiA+ICsNCj4gPiArIHJlcXVlc3Rf
dW5yZWYpOw0KPiA+ICsNCj4gPiArICAgICAgIGlmICghcmVxLT5hdHRfaWQpIHsNCj4gPiArICAg
ICAgICAgICAgICAgb3AtPmRlc3Ryb3kgPSBOVUxMOw0KPiA+ICsgICAgICAgICAgICAgICByZXF1
ZXN0X3VucmVmKHJlcSk7DQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAwOw0KPiA+ICsgICAg
ICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiByZXEtPmlkOw0KPiA+ICt9DQo+ID4gKw0K
PiA+ICB1bnNpZ25lZCBpbnQgYnRfZ2F0dF9jbGllbnRfY2hhcl9ieV91dWlkKHN0cnVjdCBidF9n
YXR0X2NsaWVudCAqY2xpZW50LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY2hhciAqdXVpZCwNCj4gPg0KPiA+IGJ0X2dhdHRfY2xpZW50X2NoYXJf
YnlfdXVpZF9jYWxsYmFja190IGNhbGxiYWNrLCBAQCAtMjc1NCw3ICsyODM4LDcgQEANCj4gdW5z
aWduZWQgaW50IGJ0X2dhdHRfY2xpZW50X2NoYXJfYnlfdXVpZChzdHJ1Y3QgYnRfZ2F0dF9jbGll
bnQgKmNsaWVudCwNCj4gPiAgICAgICAgIGlmIChidHV1aWQudHlwZSA9PSBCVF9VVUlEMTYpew0K
PiA+ICAgICAgICAgICAgICAgICBwZHUgPSAodW5zaWduZWQgY2hhciAqKSBtYWxsb2MocGR1X2xl
bl8xNmJpdF91dWlkKTsNCj4gPiAgICAgICAgICAgICAgICAgbGVuID0gcGR1X2xlbl8xNmJpdF91
dWlkOw0KPiA+IC0gICAgICAgfSBlbHNlIHsNCj4gPiArICAgICAgIH1lbHNlIHsNCj4gPiAgICAg
ICAgICAgICAgICAgcGR1ID0gKHVuc2lnbmVkIGNoYXIgKikgbWFsbG9jKHBkdV9sZW5fMTI4Yml0
X3V1aWQpOw0KPiA+ICAgICAgICAgICAgICAgICBsZW4gPSBwZHVfbGVuXzEyOGJpdF91dWlkOw0K
PiA+ICAgICAgICAgfQ0KPiA+IGRpZmYgLS1naXQgYS9zcmMvc2hhcmVkL2dhdHQtY2xpZW50Lmgg
Yi9zcmMvc2hhcmVkL2dhdHQtY2xpZW50LmggaW5kZXgNCj4gPiBmNWQ1MTY5Y2UuLjUwODU5Y2U1
MiAxMDA2NDQNCj4gPiAtLS0gYS9zcmMvc2hhcmVkL2dhdHQtY2xpZW50LmgNCj4gPiArKysgYi9z
cmMvc2hhcmVkL2dhdHQtY2xpZW50LmgNCj4gPiBAQCAtOTcsNiArOTcsMTEgQEAgdW5zaWduZWQg
aW50IGJ0X2dhdHRfY2xpZW50X2NoYXJfYnlfdXVpZChzdHJ1Y3QNCj4gYnRfZ2F0dF9jbGllbnQg
KmNsaWVudCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnRf
Z2F0dF9jbGllbnRfcmVhZF9jYWxsYmFja190IGNhbGxiYWNrLA0KPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICp1c2VyX2RhdGEsDQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJ0X2dhdHRfY2xpZW50X2Rlc3Ryb3lfZnVu
Y190DQo+ID4gZGVzdHJveSk7DQo+ID4gK3Vuc2lnbmVkIGludCBidF9nYXR0X2NsaWVudF9jaGFy
X3JlYWRfYnlfdXVpZChzdHJ1Y3QgYnRfZ2F0dF9jbGllbnQNCj4gKmNsaWVudCwNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2hhciAqdXVpZCwNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnRfZ2F0dF9jbGllbnRfcmVhZF9j
YWxsYmFja190IGNhbGxiYWNrLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB2b2lkICp1c2VyX2RhdGEsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJ0X2dhdHRfY2xpZW50X2Rlc3Ryb3lfZnVuY190DQo+ID4gK2Rlc3Ryb3kp
Ow0KPiA+ICB1bnNpZ25lZCBpbnQgYnRfZ2F0dF9jbGllbnRfcmVhZF92YWx1ZShzdHJ1Y3QgYnRf
Z2F0dF9jbGllbnQgKmNsaWVudCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdWludDE2X3QgdmFsdWVfaGFuZGxlLA0KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBidF9nYXR0X2NsaWVudF9yZWFkX2NhbGxiYWNrX3QNCj4gPiBj
YWxsYmFjaywNCj4gPiAtLQ0KPiA+IDIuMTcuMQ0KPiA+DQo+IA0KPiANCj4gLS0NCj4gTHVpeiBB
dWd1c3RvIHZvbiBEZW50eg0K
