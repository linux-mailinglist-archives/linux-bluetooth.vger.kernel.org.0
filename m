Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CFED3C68D6
	for <lists+linux-bluetooth@lfdr.de>; Tue, 13 Jul 2021 05:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234100AbhGMDTP (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 12 Jul 2021 23:19:15 -0400
Received: from mga06.intel.com ([134.134.136.31]:12079 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231340AbhGMDTP (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 12 Jul 2021 23:19:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="271201169"
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; 
   d="scan'208";a="271201169"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 20:16:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; 
   d="scan'208";a="459417096"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by orsmga008.jf.intel.com with ESMTP; 12 Jul 2021 20:16:23 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 12 Jul 2021 20:16:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Mon, 12 Jul 2021 20:16:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 12 Jul 2021 20:16:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRj7Q6/sdJNQ9nXTfTrv+dPpKdgll72gnUK9zl38Bl5P/89jsi5XhOW/a6yGsUGE8PPKGdi/7kdRdXtwkUrwd2IMSXKryxQvKgR7NfG4lM32vTYHe9zu82hvlkhwjacBsD+n3esp3oS1Weo3rz0vxe8Z0mCDwyMDyVr4QmZTT2cHfMxyrv1JzsWzznGTP5O4tvTWKH5+xZdaLvk34hfbjB6ky4e3xKgtUfjg2ZzSGd99mtLDcqrWL6K3uJfIAmOi+YgBg9P914RvUWTggzSQhnwEAsut9ff2wr7a5aS07UCabxh0dEda8r1QNy4wEvvzTNihZUS3WeqNXZpgyc8iag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dg6Zg0bO9/Y63OO8S6CzINSoQlBNguN7yUJ9XXbQ/D4=;
 b=QjRUDcuAFmSzHP8iqKPpNFwKxvZv9sYwCgZWQdh2Z5uG7aSMTcUFvn7wZ201dqoiw6/Tytoee8Brl+bJwykvhr+vlRVZDdbyuJLqa0ty/4UU/lSig/jUgaiLv2sK+ARa/9GzROAdlxzRw8N/0vYDMAok8rj3asTGupUIdv/px0nwHK2RkVXUMasUvFNDySOFcrqIibJA6B24+QNjuauAt3rEi9m+/Gv7v/SOgVcGIj+NHKVtEqW+gmxh6Q02QOICEiQCHdRmHT3mb2WrctCV9WqBQLe6CJFT8m7hNwc0gd5/8JZjXFgE6eY0wuSLBkY9IjdAKJKK52wa1RVRv5dAxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dg6Zg0bO9/Y63OO8S6CzINSoQlBNguN7yUJ9XXbQ/D4=;
 b=NrZzZbDnfMBH+6tegg7yDnPMwkVyuyJfwMXWzp/5bZaoP4qRVDrt5TH5v5d15aT07fkoDA2OfQLOE+7eAcq+3GxJTe5ITQbPSWgpgrFNreIPXa1qd/I34KSqfeYgtd0wgMx9QhdqqbBX1Q6XaZcgz3QuQtV6FH9TtyboKkRXjLs=
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM4PR11MB5566.namprd11.prod.outlook.com (2603:10b6:5:39c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.22; Tue, 13 Jul 2021 03:16:17 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::498d:94c4:3363:ea10]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::498d:94c4:3363:ea10%9]) with mapi id 15.20.4308.026; Tue, 13 Jul 2021
 03:16:16 +0000
From:   "K, Kiran" <kiran.k@intel.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>
CC:     Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        "An, Tedd" <tedd.an@intel.com>,
        "Von Dentz, Luiz" <luiz.von.dentz@intel.com>,
        "Tumkur Narayan, Chethan" <chethan.tumkur.narayan@intel.com>,
        "Srivatsa, Ravishankar" <ravishankar.srivatsa@intel.com>
Subject: RE: [PATCH v1] Bluetooth: btintel: Support Digital(N) + RF(N-1)
 combination
Thread-Topic: [PATCH v1] Bluetooth: btintel: Support Digital(N) + RF(N-1)
 combination
Thread-Index: AQHXXSO528+Zhfu3mk+4oTfAC3VD+KsMDGIAgAA36ACANCu3wA==
Date:   Tue, 13 Jul 2021 03:16:16 +0000
Message-ID: <DM8PR11MB55734F57D5E1106B855B4AB1F5149@DM8PR11MB5573.namprd11.prod.outlook.com>
References: <20210609114029.1656-1-kiran.k@intel.com>
 <E6C00EEB-8D02-4EF1-87FD-75E58023BA67@holtmann.org>
 <CABBYNZKL73_Z7x2-by4cFbx4rHiyedsYQcfrO5a52BCy3ATt2g@mail.gmail.com>
In-Reply-To: <CABBYNZKL73_Z7x2-by4cFbx4rHiyedsYQcfrO5a52BCy3ATt2g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b4fdcf4-7024-4ecb-0be1-08d945ac93ff
x-ms-traffictypediagnostic: DM4PR11MB5566:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR11MB55665D2E79F49DCB736D8349F5149@DM4PR11MB5566.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HqqwoyzhafoseFvDjvAtB/SFXB3QJSyEspbOfEIVwrHTsinywQWtE5rLDLWC0dh4fqIbBfRQZL2Q7s4E6wyEByiHPuAtXXindftZzkxUCD9IP013YV09fBL5Nq9ZdLkKebwioIK1BFwZuJMaQrneXT8hVog1fZPCf+mYLQYBhNKpTJUyPT1K8KI3Jviz/RayLHUP+MSjt+uOl51bcUxSpsT10qQUMo1CWS7CIAEvLV9yDWw4l3Db8JUBCRiho3S4V0Q6UWQRSx+u2eztiylwnOy8ghc07hYsEUp4N7SEmU2zhY9PUZgL4gtvibaLctz3FJgOuTEwYcWjKVyGN4OUey3L8Y2dKbV1EKmdfzfPelc/8m0TE0iqg5c8EZKZ9d5AUd3IVrfK2hRNkhxD4p8yHkGKtp+AAyBlzAOG/FBRcNEBOSv0MQGSlN5ueGw7CVSSMYuZSrnpycMLzNtXyLWbvwTcGuzoEdq8k1xl628XrKKcJ6BNYDV6/rkEnxgj+NJmkFCEpXc8kvcrsyZhlvCq+3wef5asGgp2XRD1pitvZm+MAQxIal3xixvfBDXiaqROGSycmH0xTiEaPXSuE0IjABhUZ6dWvYM5YyCdlRCb2LAWWpGTkHSoQ3gWdlw7a9r1f09assRRUYiRQEJma4QRIw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(8676002)(54906003)(7696005)(4326008)(86362001)(26005)(186003)(53546011)(76116006)(6506007)(71200400001)(478600001)(5660300002)(52536014)(30864003)(316002)(110136005)(8936002)(66446008)(9686003)(66476007)(38100700002)(66556008)(64756008)(66946007)(33656002)(55016002)(2906002)(122000001)(107886003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVYyRGNrRkxhT1VONWJ4WVJlbXJKUm1JYzZpRUYxcWxlZnMxcVIzdUZyRDRj?=
 =?utf-8?B?aHJHc2xOc1loZDNGS1pla29GUDlvaTFmejhhdHpLQ1h6WFlwNE4zRGNNYUVx?=
 =?utf-8?B?VUJKbGZDdG5La200dkZoV0RDaVorRDlROWVuajhCZDA3ZUZOS2sweHE5bDNV?=
 =?utf-8?B?emIxTTZBeTh3QzlXYndDN3FPb01FT0JEc0k4b2lES2hqS2ZOUVpURlkzN3ZT?=
 =?utf-8?B?YjdsN2hZTkJPVzRIaHdCNzIwY3F5Tkx0M082Y2Z0NXlpR0pscXEyMkJ2TWFL?=
 =?utf-8?B?Q0JYS2hOMVV2SWx5T2JlTjdwblM0eElFRGVVUFZUWFFuaWQ3eUlMWnB1WWsz?=
 =?utf-8?B?WHptRnlMeENmdUtleUFBL2pBQ2pJK21GZzZSU2J5eXBLUlR3d1N5NStxdDVT?=
 =?utf-8?B?by9HL2NwcWVOVHpEUE9uaHVuM1RSby9PMmxGVGRpY2krMFlmZDVxaFFCazFn?=
 =?utf-8?B?ZmRZaHBUb2N2OGhaZzBxUm1adis5T0xQL3NMR1I4UDE4ZTY1RlZTdWxRWWF3?=
 =?utf-8?B?bnVkZmdrQWdyYUNZeTkzOVRNS25ub3RFMnpManRQVTkxZjdKTkZaYUNsaW1y?=
 =?utf-8?B?Zjk5UjRVR1JmK1I4SzJVUnlrdTJVY3dnRStNb0FoamsvRjRMdElsa2Z2Y2xY?=
 =?utf-8?B?WFRBNm82QldRQnJ5WVR5cWxVWU53bVZ3MHFlTno2RXdBdzJzSjJ0NmRiQndz?=
 =?utf-8?B?VllkV0x3L3FXK2Z5RStsdzhpRDRncXFjTGpqNU1ra0hSbHFwYlp1eGZqQU5M?=
 =?utf-8?B?NGppcExjdTMyeTM2WXZEem0vbk9MN0VsbnBXUkc4Z2Z2c2RPZnE5R1RWV2pC?=
 =?utf-8?B?bGlib2gwRjNzRmx5RXAyV0dQNDk4cDhVY2pNTUtNMEh0M0p3ZnZpUm5VN3dZ?=
 =?utf-8?B?Z1g2WTdZTXUrbXduSmhiUFZFOU12SjBrYzVINzU2RVpJQW55R0ZBYkZhTnkr?=
 =?utf-8?B?NVVLTUlSZkd6cisySktuK255V0ZhZEp1Szd1WGt3QldVSTQzTDE0eFVUL2Zv?=
 =?utf-8?B?T3R6eklIclFRR0hHdXA2ODJMV2tUcjhZQXlRRzVIRDRZM2xZUGE2aEZpRUwy?=
 =?utf-8?B?b3lQbURvZHY1Y2ZoejlUU0IvdUM0TkVJWHJqVlA0ZzIzVS9KajhsTXVSWStY?=
 =?utf-8?B?YXFVelRvSzdIYTJKZE54cjZFVzNDL2NTMnZSdDdYdTVWZThPd3JjM0RBdm02?=
 =?utf-8?B?ZlBpVURlaW9ORngxY1lNUjI4Y3B4dXpLd0VDTWdZZXhRZjVmWmRJdEZiRnNH?=
 =?utf-8?B?QmpJbHN4c0FCSXlHWWdKdlBWL3NXSUc4SzVaRFU5UUhESXJLbG9FRDN6aGpD?=
 =?utf-8?B?aG9VV21QSmd4aklkT1RpM1dtOG0vTWtZc1dHUnZ1dlE1cU5JK1JrZ2dUVTdt?=
 =?utf-8?B?enltc0d5dkxzd0JabE8wNmxnNGxmTFNoVmlKTFN4S0lvaUFCYTBsKys2bHF0?=
 =?utf-8?B?MGdBNHFOOUZTcXNTay93UEhoblVzRzJHWWZweFpJNXFvYWJOcWJUclppd0Zk?=
 =?utf-8?B?ajhxZVA3cnpKOUhjRW9NMkhZSHdqODhldVArVWlDK0RXTzI5Rk05bmdaTXJJ?=
 =?utf-8?B?ZC9qM0RmQ3NHc2pJMTdUYmRXZHUvQWJTeDJseUJvRjd3Tk9HelIwbmJOQ3RU?=
 =?utf-8?B?eVp2eGZtWlFLbkpVc2RpWUR5ZlNUNGlrSGgyVUViaXg2OUd4YWRza29xbXFZ?=
 =?utf-8?B?cFg3OHRVS3FSQno0aU9HQ0xhT01oV2p1U2lidG1RMFNzUnJlbGFlbGlYdGdQ?=
 =?utf-8?Q?ZjUo4+4qODsJyOE8zxyFKeP2QgmYfKZLl0jEf9p?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4fdcf4-7024-4ecb-0be1-08d945ac93ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2021 03:16:16.8157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u7MibnD705ZAIyPv5Jp6Xbo1yOwxqUGHvi4f80TD1ilA5cOrveKFB3YgG8JkZTFgxpRgis5N77RER/eELkyBYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5566
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

SGkgTHVpeiwgTWFyY2VsLA0KDQpUaGFua3MgZm9yIHRoZSBjb21tZW50cy4gSSB3aWxsIG1ha2Ug
YSBuZXcgcGF0Y2ggYW5kIHN1Z2dlc3RlZCBhbmQgc2VuZCBpdCBmb3IgcmV2aWV3Lg0KDQpSZWdh
cmRzLA0KS2lyYW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMdWl6
IEF1Z3VzdG8gdm9uIERlbnR6IDxsdWl6LmRlbnR6QGdtYWlsLmNvbT4NCj4gU2VudDogVGh1cnNk
YXksIEp1bmUgMTAsIDIwMjEgNDowMiBBTQ0KPiBUbzogTWFyY2VsIEhvbHRtYW5uIDxtYXJjZWxA
aG9sdG1hbm4ub3JnPg0KPiBDYzogSywgS2lyYW4gPGtpcmFuLmtAaW50ZWwuY29tPjsgQmx1ZXog
bWFpbGluZyBsaXN0IDxsaW51eC0NCj4gYmx1ZXRvb3RoQHZnZXIua2VybmVsLm9yZz47IEFuLCBU
ZWRkIDx0ZWRkLmFuQGludGVsLmNvbT47IFZvbiBEZW50eiwNCj4gTHVpeiA8bHVpei52b24uZGVu
dHpAaW50ZWwuY29tPjsgVHVta3VyIE5hcmF5YW4sIENoZXRoYW4NCj4gPGNoZXRoYW4udHVta3Vy
Lm5hcmF5YW5AaW50ZWwuY29tPjsgU3JpdmF0c2EsIFJhdmlzaGFua2FyDQo+IDxyYXZpc2hhbmth
ci5zcml2YXRzYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjFdIEJsdWV0b290
aDogYnRpbnRlbDogU3VwcG9ydCBEaWdpdGFsKE4pICsgUkYoTi0xKQ0KPiBjb21iaW5hdGlvbg0K
PiANCj4gSGkgTWFyY2VsLCBLaXJhbiwNCj4gDQo+IE9uIFdlZCwgSnVuIDksIDIwMjEgYXQgMTI6
MTUgUE0gTWFyY2VsIEhvbHRtYW5uIDxtYXJjZWxAaG9sdG1hbm4ub3JnPg0KPiB3cm90ZToNCj4g
Pg0KPiA+IEhpIEtpcmFuLA0KPiA+DQo+ID4gPiBOZXcgZ2VuZXJhdGlvbiBJbnRlbCBjb250cm9s
bGVycyhOKSBuZWVkIHRvIHN1cHBvcnQgUkYgZnJvbSAoTi0xKQ0KPiA+ID4gZ2VuZXJhdGlvbi4g
U2luY2UgUElEIGNvbWVzIGZyb20gT1RQIHByZXNlbnQgaW4gUkYgbW9kdWxlLA0KPiA+ID4gKnNl
dHVwKiBmdW5jdGlvbiBnZXRzIG1hcHBlZCB0byBCVFVTQl9JTlRFTF9ORVcgaW5zdGVhZCBvZg0K
PiA+ID4gQlRVU0JfSU5URUxfTkVXR0VOLiBUaGlzIHBhdGNoIGNoZWNrcyBnZW5lcmF0aW9uIG9m
IENOVmkgaW4NCj4gPiA+ICpzZXR1cCogb2YgQlRVU0JfSU5URUxfTkVXIGFuZCBtYXBzIGNhbGxi
YWNrcyB0bw0KPiBCVFVTQl9JTlRFTF9ORVdHRU4NCj4gPiA+IGlmIG5ldyBnZW5lcmF0aW9uIGNv
bnRyb2xsZXIgaXMgZm91bmQgYW5kIGF0dGVtcHRzICpzZXR1cCogb2YNCj4gPiA+IEJUVVNCX0lO
VEVMX05FV0dFTi4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBLaXJhbiBLIDxraXJhbi5r
QGludGVsLmNvbT4NCj4gPiA+IFJldmlld2VkLWJ5OiBDaGV0aGFuIFQgTiA8Y2hldGhhbi50dW1r
dXIubmFyYXlhbkBpbnRlbC5jb20+DQo+ID4gPiBSZXZpZXdlZC1ieTogU3JpdmF0c2EgUmF2aXNo
YW5rYXIgPHJhdmlzaGFua2FyLnNyaXZhdHNhQGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4g
ZHJpdmVycy9ibHVldG9vdGgvYnRpbnRlbC5jIHwgMTE5DQo+ID4gPiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysNCj4gPiA+IGRyaXZlcnMvYmx1ZXRvb3RoL2J0aW50ZWwuaCB8
ICAxMCArKysNCj4gPiA+IGRyaXZlcnMvYmx1ZXRvb3RoL2J0dXNiLmMgICB8ICA0NSArKysrKysr
KysrKysrLQ0KPiA+ID4gbmV0L2JsdWV0b290aC9oY2lfY29yZS5jICAgIHwgICA1ICstDQo+ID4g
PiA0IGZpbGVzIGNoYW5nZWQsIDE3NyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+
ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2JsdWV0b290aC9idGludGVsLmMNCj4gPiA+
IGIvZHJpdmVycy9ibHVldG9vdGgvYnRpbnRlbC5jIGluZGV4IGU0NGI2OTkzY2Y5MS4uMWQ5ZWNj
NDgxZjE0DQo+ID4gPiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0aW50
ZWwuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ibHVldG9vdGgvYnRpbnRlbC5jDQo+ID4gPiBAQCAt
NDgzLDYgKzQ4Myw4NSBAQCBpbnQgYnRpbnRlbF92ZXJzaW9uX2luZm9fdGx2KHN0cnVjdCBoY2lf
ZGV2DQo+ID4gPiAqaGRldiwgc3RydWN0IGludGVsX3ZlcnNpb25fdGx2ICp2ZXIgfQ0KPiA+ID4g
RVhQT1JUX1NZTUJPTF9HUEwoYnRpbnRlbF92ZXJzaW9uX2luZm9fdGx2KTsNCj4gPiA+DQo+ID4g
PiArdm9pZCBidGludGVsX3BhcnNlX3ZlcnNpb25fdGx2KHN0cnVjdCBoY2lfZGV2ICpoZGV2LCBz
dHJ1Y3Qgc2tfYnVmZiAqc2tiLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgaW50ZWxfdmVyc2lvbl90bHYgKnZlcnNpb24pIHsNCj4gPiA+ICsgICAgIC8qIENvbnN1
bWUgQ29tbWFuZCBDb21wbGV0ZSBTdGF0dXMgZmllbGQgKi8NCj4gPiA+ICsgICAgIHNrYl9wdWxs
KHNrYiwgc2l6ZW9mKF9fdTgpKTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgIC8qIEV2ZW50IHBhcmFt
ZXRlcnMgY29udGF0aW4gbXVsdGlwbGUgVExWcy4gUmVhZCBlYWNoIG9mIHRoZW0NCj4gPiA+ICsg
ICAgICAqIGFuZCBvbmx5IGtlZXAgdGhlIHJlcXVpcmVkIGRhdGEuIEFsc28sIGl0IHVzZSBleGlz
dGluZyBsZWdhY3kNCj4gPiA+ICsgICAgICAqIHZlcnNpb24gZmllbGQgbGlrZSBod19wbGF0Zm9y
bSwgaHdfdmFyaWFudCwgYW5kIGZ3X3ZhcmlhbnQNCj4gPiA+ICsgICAgICAqIHRvIGtlZXAgdGhl
IGV4aXN0aW5nIHNldHVwIGZsb3cNCj4gPiA+ICsgICAgICAqLw0KPiA+ID4gKyAgICAgd2hpbGUg
KHNrYi0+bGVuKSB7DQo+ID4gPiArICAgICAgICAgICAgIHN0cnVjdCBpbnRlbF90bHYgKnRsdjsN
Cj4gPiA+ICsNCj4gPiA+ICsgICAgICAgICAgICAgdGx2ID0gKHN0cnVjdCBpbnRlbF90bHYgKilz
a2ItPmRhdGE7DQo+ID4gPiArICAgICAgICAgICAgIHN3aXRjaCAodGx2LT50eXBlKSB7DQo+ID4g
PiArICAgICAgICAgICAgIGNhc2UgSU5URUxfVExWX0NOVklfVE9QOg0KPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIHZlcnNpb24tPmNudmlfdG9wID0gZ2V0X3VuYWxpZ25lZF9sZTMyKHRsdi0+
dmFsKTsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gPg0KPiA+IEkgdGhp
bmsgd2UgYWxyZWFkeSBoYWQgdGhpcyBpc3N1ZSB0aGF0IHlvdSBuZWVkIHRvIGNoZWNrIHRoYXQg
ZW5vdWdoIGRhdGEgaXMNCj4gYWN0dWFsbHkgaW4gdGhlIFNLQi4NCj4gPg0KPiA+ID4gKyAgICAg
ICAgICAgICBjYXNlIElOVEVMX1RMVl9DTlZSX1RPUDoNCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICB2ZXJzaW9uLT5jbnZyX3RvcCA9IGdldF91bmFsaWduZWRfbGUzMih0bHYtPnZhbCk7DQo+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gPiArICAgICAgICAgICAgIGNh
c2UgSU5URUxfVExWX0NOVklfQlQ6DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgdmVyc2lv
bi0+Y252aV9idCA9IGdldF91bmFsaWduZWRfbGUzMih0bHYtPnZhbCk7DQo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gPiArICAgICAgICAgICAgIGNhc2UgSU5URUxfVExW
X0NOVlJfQlQ6DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgdmVyc2lvbi0+Y252cl9idCA9
IGdldF91bmFsaWduZWRfbGUzMih0bHYtPnZhbCk7DQo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgYnJlYWs7DQo+ID4gPiArICAgICAgICAgICAgIGNhc2UgSU5URUxfVExWX0RFVl9SRVZfSUQ6
DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgdmVyc2lvbi0+ZGV2X3Jldl9pZCA9IGdldF91
bmFsaWduZWRfbGUxNih0bHYtPnZhbCk7DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgYnJl
YWs7DQo+ID4gPiArICAgICAgICAgICAgIGNhc2UgSU5URUxfVExWX0lNQUdFX1RZUEU6DQo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgdmVyc2lvbi0+aW1nX3R5cGUgPSB0bHYtPnZhbFswXTsN
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gPiA+ICsgICAgICAgICAgICAg
Y2FzZSBJTlRFTF9UTFZfVElNRV9TVEFNUDoNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICB2
ZXJzaW9uLT50aW1lc3RhbXAgPSBnZXRfdW5hbGlnbmVkX2xlMTYodGx2LT52YWwpOw0KPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ID4gKyAgICAgICAgICAgICBjYXNlIElO
VEVMX1RMVl9CVUlMRF9UWVBFOg0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHZlcnNpb24t
PmJ1aWxkX3R5cGUgPSB0bHYtPnZhbFswXTsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBi
cmVhazsNCj4gPiA+ICsgICAgICAgICAgICAgY2FzZSBJTlRFTF9UTFZfQlVJTERfTlVNOg0KPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgIHZlcnNpb24tPmJ1aWxkX251bSA9IGdldF91bmFsaWdu
ZWRfbGUzMih0bHYtPnZhbCk7DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+
ID4gPiArICAgICAgICAgICAgIGNhc2UgSU5URUxfVExWX1NFQ1VSRV9CT09UOg0KPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIHZlcnNpb24tPnNlY3VyZV9ib290ID0gdGx2LT52YWxbMF07DQo+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gPiArICAgICAgICAgICAgIGNh
c2UgSU5URUxfVExWX09UUF9MT0NLOg0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHZlcnNp
b24tPm90cF9sb2NrID0gdGx2LT52YWxbMF07DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
YnJlYWs7DQo+ID4gPiArICAgICAgICAgICAgIGNhc2UgSU5URUxfVExWX0FQSV9MT0NLOg0KPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgIHZlcnNpb24tPmFwaV9sb2NrID0gdGx2LT52YWxbMF07
DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gPiArICAgICAgICAgICAg
IGNhc2UgSU5URUxfVExWX0RFQlVHX0xPQ0s6DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
dmVyc2lvbi0+ZGVidWdfbG9jayA9IHRsdi0+dmFsWzBdOw0KPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIGJyZWFrOw0KPiA+ID4gKyAgICAgICAgICAgICBjYXNlIElOVEVMX1RMVl9NSU5fRlc6
DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgdmVyc2lvbi0+bWluX2Z3X2J1aWxkX25uID0g
dGx2LT52YWxbMF07DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgdmVyc2lvbi0+bWluX2Z3
X2J1aWxkX2N3ID0gdGx2LT52YWxbMV07DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgdmVy
c2lvbi0+bWluX2Z3X2J1aWxkX3l5ID0gdGx2LT52YWxbMl07DQo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgYnJlYWs7DQo+ID4gPiArICAgICAgICAgICAgIGNhc2UgSU5URUxfVExWX0xJTUlU
RURfQ0NFOg0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHZlcnNpb24tPmxpbWl0ZWRfY2Nl
ID0gdGx2LT52YWxbMF07DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4g
PiArICAgICAgICAgICAgIGNhc2UgSU5URUxfVExWX1NCRV9UWVBFOg0KPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIHZlcnNpb24tPnNiZV90eXBlID0gdGx2LT52YWxbMF07DQo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gPiArICAgICAgICAgICAgIGNhc2UgSU5URUxf
VExWX09UUF9CREFERFI6DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgbWVtY3B5KCZ2ZXJz
aW9uLT5vdHBfYmRfYWRkciwgdGx2LT52YWwsIHRsdi0+bGVuKTsNCj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBicmVhazsNCj4gPiA+ICsgICAgICAgICAgICAgZGVmYXVsdDoNCj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAvKiBJZ25vcmUgcmVzdCBvZiBpbmZvcm1hdGlvbiAqLw0KPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ID4gKyAgICAgICAgICAgICB9DQo+
ID4gPiArICAgICAgICAgICAgIC8qIGNvbnN1bWUgdGhlIGN1cnJlbnQgdGx2IGFuZCBtb3ZlIHRv
IG5leHQqLw0KPiA+ID4gKyAgICAgICAgICAgICBza2JfcHVsbChza2IsIHRsdi0+bGVuICsgc2l6
ZW9mKCp0bHYpKTsNCj4gPiA+ICsgICAgIH0NCj4gPiA+ICt9DQo+ID4gPiArRVhQT1JUX1NZTUJP
TF9HUEwoYnRpbnRlbF9wYXJzZV92ZXJzaW9uX3Rsdik7DQo+ID4gPiArDQo+ID4gPiBpbnQgYnRp
bnRlbF9yZWFkX3ZlcnNpb25fdGx2KHN0cnVjdCBoY2lfZGV2ICpoZGV2LCBzdHJ1Y3QNCj4gPiA+
IGludGVsX3ZlcnNpb25fdGx2ICp2ZXJzaW9uKSB7DQo+ID4gPiAgICAgICBzdHJ1Y3Qgc2tfYnVm
ZiAqc2tiOw0KPiA+ID4gQEAgLTU5NSw2ICs2NzQsNDYgQEAgaW50IGJ0aW50ZWxfcmVhZF92ZXJz
aW9uX3RsdihzdHJ1Y3QgaGNpX2Rldg0KPiA+ID4gKmhkZXYsIHN0cnVjdCBpbnRlbF92ZXJzaW9u
X3RsdiAqdmVyIH0NCj4gPiA+IEVYUE9SVF9TWU1CT0xfR1BMKGJ0aW50ZWxfcmVhZF92ZXJzaW9u
X3Rsdik7DQo+ID4gPg0KPiA+ID4gK2ludCBidGludGVsX2dlbmVyaWNfcmVhZF92ZXJzaW9uKHN0
cnVjdCBoY2lfZGV2ICpoZGV2LA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBpbnRlbF92ZXJzaW9uX3RsdiAqdmVyX3RsdiwNCj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgaW50ZWxfdmVyc2lvbiAqdmVyLCBib29sDQo+ID4gPiAr
KmlzX3Rsdikgew0KPiA+ID4gKyAgICAgc3RydWN0IHNrX2J1ZmYgKnNrYjsNCj4gPiA+ICsgICAg
IGNvbnN0IHU4IHBhcmFtWzFdID0geyAweEZGIH07DQo+ID4gPiArDQo+ID4gPiArICAgICBza2Ig
PSBfX2hjaV9jbWRfc3luYyhoZGV2LCAweGZjMDUsIDEsIHBhcmFtLCBIQ0lfQ01EX1RJTUVPVVQp
Ow0KPiA+ID4gKyAgICAgaWYgKElTX0VSUihza2IpKSB7DQo+ID4gPiArICAgICAgICAgICAgIGJ0
X2Rldl9lcnIoaGRldiwgIlJlYWRpbmcgSW50ZWwgdmVyc2lvbiBpbmZvcm1hdGlvbiBmYWlsZWQN
Cj4gKCVsZCkiLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIFBUUl9FUlIoc2tiKSk7
DQo+ID4gPiArICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHNrYik7DQo+ID4gPiArICAgICB9
DQo+ID4gPiArDQo+ID4gPiArICAgICBpZiAoc2tiLT5kYXRhWzBdKSB7DQo+ID4gPiArICAgICAg
ICAgICAgIGJ0X2Rldl9lcnIoaGRldiwgIkludGVsIFJlYWQgVmVyc2lvbiBjb21tYW5kIGZhaWxl
ZCAoJTAyeCkiLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIHNrYi0+ZGF0YVswXSk7
DQo+ID4gPiArICAgICAgICAgICAgIGtmcmVlX3NrYihza2IpOw0KPiA+ID4gKyAgICAgICAgICAg
ICByZXR1cm4gLUVJTzsNCj4gPiA+ICsgICAgIH0NCj4gPiA+ICsNCj4gPiA+ICsgICAgIGlmIChz
a2ItPmxlbiA8IHNpemVvZihzdHJ1Y3QgaW50ZWxfdmVyc2lvbikpDQo+ID4gPiArICAgICAgICAg
ICAgIHJldHVybiAtRUlMU0VROw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgaWYgKHNrYi0+bGVuID09
IHNpemVvZihzdHJ1Y3QgaW50ZWxfdmVyc2lvbikgJiYNCj4gPiA+ICsgICAgICAgICBza2ItPmRh
dGFbMV0gPT0gMHgzNykNCj4gPiA+ICsgICAgICAgICAgICAgKmlzX3RsdiA9IGZhbHNlOw0KPiA+
ID4gKyAgICAgZWxzZQ0KPiA+ID4gKyAgICAgICAgICAgICAqaXNfdGx2ID0gdHJ1ZTsNCj4gPiA+
ICsNCj4gPiA+ICsgICAgIGlmICgqaXNfdGx2KQ0KPiA+ID4gKyAgICAgICAgICAgICBidGludGVs
X3BhcnNlX3ZlcnNpb25fdGx2KGhkZXYsIHNrYiwgdmVyX3Rsdik7DQo+ID4gPiArICAgICBlbHNl
DQo+ID4gPiArICAgICAgICAgICAgIG1lbWNweSh2ZXIsIHNrYi0+ZGF0YSwgc2l6ZW9mKCp2ZXIp
KTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgIGtmcmVlX3NrYihza2IpOw0KPiA+ID4gKyAgICAgcmV0
dXJuIDA7DQo+ID4gPiArfQ0KPiA+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKGJ0aW50ZWxfZ2VuZXJp
Y19yZWFkX3ZlcnNpb24pOw0KPiA+ID4gKw0KPiA+DQo+ID4gSSBoYXZlIHRoZSBmZWVsaW5nIHRo
YXQgd2UgYXJlIGZhbGxpbmcgYmFjayB0byBhIHBhdGNoIHRoYXQgSSBhbHJlYWR5IHJlamVjdGVk
Lg0KPiA+DQo+ID4gPiAvKiAtLS0tLS0tIFJFR01BUCBJQlQgU1VQUE9SVCAtLS0tLS0tICovDQo+
ID4gPg0KPiA+ID4gI2RlZmluZSBJQlRfUkVHX01PREVfOEJJVCAgMHgwMA0KPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0aW50ZWwuaA0KPiA+ID4gYi9kcml2ZXJzL2JsdWV0
b290aC9idGludGVsLmggaW5kZXggZDE4NDA2NGE1ZTdjLi4zNjZjYjc0NmY5YzQNCj4gPiA+IDEw
MDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ibHVldG9vdGgvYnRpbnRlbC5oDQo+ID4gPiArKysg
Yi9kcml2ZXJzL2JsdWV0b290aC9idGludGVsLmgNCj4gPiA+IEBAIC0xNzUsNiArMTc1LDEwIEBA
IGludCBidGludGVsX3JlYWRfZGVidWdfZmVhdHVyZXMoc3RydWN0IGhjaV9kZXYNCj4gKmhkZXYs
DQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaW50ZWxfZGVidWdf
ZmVhdHVyZXMNCj4gPiA+ICpmZWF0dXJlcyk7IGludCBidGludGVsX3NldF9kZWJ1Z19mZWF0dXJl
cyhzdHJ1Y3QgaGNpX2RldiAqaGRldiwNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29uc3Qgc3RydWN0IGludGVsX2RlYnVnX2ZlYXR1cmVzDQo+ID4gPiAqZmVhdHVyZXMpOw0K
PiA+ID4gK2ludCBidGludGVsX2dlbmVyaWNfcmVhZF92ZXJzaW9uKHN0cnVjdCBoY2lfZGV2ICpo
ZGV2LA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBpbnRlbF92
ZXJzaW9uX3RsdiAqdmVyX3RsdiwNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgaW50ZWxfdmVyc2lvbiAqdmVyLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJvb2wgKmlzX3Rsdik7DQo+ID4gPiAjZWxzZQ0KPiA+ID4NCj4gPiA+IHN0YXRp
YyBpbmxpbmUgaW50IGJ0aW50ZWxfY2hlY2tfYmRhZGRyKHN0cnVjdCBoY2lfZGV2ICpoZGV2KSBA
QA0KPiA+ID4gLTMwNyw0ICszMTEsMTAgQEAgc3RhdGljIGlubGluZSBpbnQgYnRpbnRlbF9zZXRf
ZGVidWdfZmVhdHVyZXMoc3RydWN0DQo+IGhjaV9kZXYgKmhkZXYsDQo+ID4gPiAgICAgICByZXR1
cm4gLUVPUE5PVFNVUFA7DQo+ID4gPiB9DQo+ID4gPg0KPiA+ID4gK3N0YXRpYyBpbnQgYnRpbnRl
bF9nZW5lcmljX3JlYWRfdmVyc2lvbihzdHJ1Y3QgaGNpX2RldiAqaGRldiwNCj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGludGVsX3ZlcnNpb25fdGx2
ICp2ZXJfdGx2LA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgaW50ZWxfdmVyc2lvbiAqdmVyLA0KPiA+ID4gK2Jvb2wgKmlzX3Rsdikgew0KPiA+ID4g
KyAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiA+ID4gK30NCj4gPiA+ICNlbmRpZg0KPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0dXNiLmMgYi9kcml2ZXJzL2JsdWV0b290
aC9idHVzYi5jDQo+ID4gPiBpbmRleCBhOTg1NWEyZGQ1NjEuLjE1ZDkxYWFlNTJjYyAxMDA2NDQN
Cj4gPiA+IC0tLSBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0dXNiLmMNCj4gPiA+ICsrKyBiL2RyaXZl
cnMvYmx1ZXRvb3RoL2J0dXNiLmMNCj4gPiA+IEBAIC01ODMsNiArNTgzLDkgQEAgc3RydWN0IGJ0
dXNiX2RhdGEgew0KPiA+ID4gICAgICAgdW5zaWduZWQgY21kX3RpbWVvdXRfY250Ow0KPiA+ID4g
fTsNCj4gPiA+DQo+ID4gPiArc3RhdGljIGludCBidHVzYl9zZXR1cF9pbnRlbF9uZXdnZW4oc3Ry
dWN0IGhjaV9kZXYgKmhkZXYpOyBzdGF0aWMNCj4gPiA+ICtpbnQgYnR1c2Jfc2h1dGRvd25faW50
ZWxfbmV3KHN0cnVjdCBoY2lfZGV2ICpoZGV2KTsNCj4gPiA+ICsNCj4gPiA+IHN0YXRpYyB2b2lk
IGJ0dXNiX2ludGVsX2NtZF90aW1lb3V0KHN0cnVjdCBoY2lfZGV2ICpoZGV2KSB7DQo+ID4gPiAg
ICAgICBzdHJ1Y3QgYnR1c2JfZGF0YSAqZGF0YSA9IGhjaV9nZXRfZHJ2ZGF0YShoZGV2KTsgQEAg
LTI4NDIsNg0KPiA+ID4gKzI4NDUsMTggQEAgc3RhdGljIGludCBidHVzYl9pbnRlbF9ib290KHN0
cnVjdCBoY2lfZGV2ICpoZGV2LCB1MzINCj4gYm9vdF9hZGRyKQ0KPiA+ID4gICAgICAgcmV0dXJu
IGVycjsNCj4gPiA+IH0NCj4gPiA+DQo+ID4gPiArc3RhdGljIGJvb2wgYnRpbnRlbF9pc19uZXdn
ZW5fY29udHJvbGxlcihzdHJ1Y3QgaGNpX2RldiAqaGRldiwgdTMyDQo+ID4gPiArY252aSkgew0K
PiA+ID4gKyAgICAgc3dpdGNoIChjbnZpICYgMHhGRkYpIHsNCj4gPiA+ICsgICAgIGNhc2UgMHg0
MDA6IC8qIFNsciAqLw0KPiA+ID4gKyAgICAgY2FzZSAweDQwMTogLyogU2xyLUYgKi8NCj4gPiA+
ICsgICAgIGNhc2UgMHg0MTA6IC8qIFR5UCAqLw0KPiA+ID4gKyAgICAgY2FzZSAweDgxMDogLyog
TWdyICovDQo+ID4gPiArICAgICAgICAgICAgIHJldHVybiB0cnVlOw0KPiA+ID4gKyAgICAgfQ0K
PiA+ID4gKyAgICAgcmV0dXJuIGZhbHNlOw0KPiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+IHN0YXRp
YyBpbnQgYnR1c2Jfc2V0dXBfaW50ZWxfbmV3KHN0cnVjdCBoY2lfZGV2ICpoZGV2KSB7DQo+ID4g
PiAgICAgICBzdHJ1Y3QgYnR1c2JfZGF0YSAqZGF0YSA9IGhjaV9nZXRfZHJ2ZGF0YShoZGV2KTsg
QEAgLTI4NTEsNg0KPiA+ID4gKzI4NjYsOCBAQCBzdGF0aWMgaW50IGJ0dXNiX3NldHVwX2ludGVs
X25ldyhzdHJ1Y3QgaGNpX2RldiAqaGRldikNCj4gPiA+ICAgICAgIGNoYXIgZGRjbmFtZVs2NF07
DQo+ID4gPiAgICAgICBpbnQgZXJyOw0KPiA+ID4gICAgICAgc3RydWN0IGludGVsX2RlYnVnX2Zl
YXR1cmVzIGZlYXR1cmVzOw0KPiA+ID4gKyAgICAgc3RydWN0IGludGVsX3ZlcnNpb25fdGx2IHZl
cl90bHY7DQo+ID4gPiArICAgICBib29sIGlzX3RsdjsNCj4gPiA+DQo+ID4gPiAgICAgICBCVF9E
QkcoIiVzIiwgaGRldi0+bmFtZSk7DQo+ID4gPg0KPiA+ID4gQEAgLTI4NjQsMTIgKzI4ODEsMzgg
QEAgc3RhdGljIGludCBidHVzYl9zZXR1cF9pbnRlbF9uZXcoc3RydWN0DQo+IGhjaV9kZXYgKmhk
ZXYpDQo+ID4gPiAgICAgICAgKiBpcyBpbiBib290bG9hZGVyIG1vZGUgb3IgaWYgaXQgYWxyZWFk
eSBoYXMgb3BlcmF0aW9uYWwgZmlybXdhcmUNCj4gPiA+ICAgICAgICAqIGxvYWRlZC4NCj4gPiA+
ICAgICAgICAqLw0KPiA+ID4gLSAgICAgZXJyID0gYnRpbnRlbF9yZWFkX3ZlcnNpb24oaGRldiwg
JnZlcik7DQo+ID4gPiArICAgICBlcnIgPSBidGludGVsX2dlbmVyaWNfcmVhZF92ZXJzaW9uKGhk
ZXYsICZ2ZXJfdGx2LCAmdmVyLA0KPiA+ID4gKyAmaXNfdGx2KTsNCj4gPiA+ICAgICAgIGlmIChl
cnIpIHsNCj4gPiA+ICAgICAgICAgICAgICAgYnRfZGV2X2VycihoZGV2LCAiSW50ZWwgUmVhZCB2
ZXJzaW9uIGZhaWxlZCAoJWQpIiwgZXJyKTsNCj4gPiA+ICAgICAgICAgICAgICAgYnRpbnRlbF9y
ZXNldF90b19ib290bG9hZGVyKGhkZXYpOw0KPiA+ID4gICAgICAgICAgICAgICByZXR1cm4gZXJy
Ow0KPiA+ID4gICAgICAgfQ0KPiA+ID4gKyAgICAgaWYgKGlzX3Rsdikgew0KPiA+ID4gKyAgICAg
ICAgICAgICAvKiBXZSBnb3QgVExWIGRhdGEuIENoZWNrIGZvciBuZXcgZ2VuZXJhdGlvbiBDTlZp
LiBJZiBwcmVzZW50LA0KPiA+ID4gKyAgICAgICAgICAgICAgKiB0aGVuIG1hcCB0aGUgY2FsbGJh
Y2tzIHRvIEJUVVNCX0lOVEVMX05FV0dFTiBhbmQgYXR0ZW1wdA0KPiA+ID4gKyAgICAgICAgICAg
ICAgKiBzZXR1cCBmdW5jdGlvbiBhZ2Fpbg0KPiA+ID4gKyAgICAgICAgICAgICAgKi8NCj4gPiA+
ICsgICAgICAgICAgICAgaWYgKGJ0aW50ZWxfaXNfbmV3Z2VuX2NvbnRyb2xsZXIoaGRldiwgdmVy
X3Rsdi5jbnZpX3RvcCkpIHsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBoZGV2LT5zZW5k
ID0gYnR1c2Jfc2VuZF9mcmFtZV9pbnRlbDsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBo
ZGV2LT5zZXR1cCA9IGJ0dXNiX3NldHVwX2ludGVsX25ld2dlbjsNCj4gPg0KPiA+IFNvIHRoaXMg
aXMgYSBjbGVhciBubywgeW91ciBhcmUgbm90IGNoYW5naW5nIGhkZXYtPnNldHVwIHdpdGhpbiBo
ZGV2LT5zZXR1cC4NCj4gPg0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGhkZXYtPnNodXRk
b3duID0gYnR1c2Jfc2h1dGRvd25faW50ZWxfbmV3Ow0KPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIGhkZXYtPmh3X2Vycm9yID0gYnRpbnRlbF9od19lcnJvcjsNCj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBoZGV2LT5zZXRfZGlhZyA9IGJ0aW50ZWxfc2V0X2RpYWc7DQo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgaGRldi0+c2V0X2JkYWRkciA9IGJ0aW50ZWxfc2V0X2JkYWRkcjsN
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBoZGV2LT5jbWRfdGltZW91dCA9IGJ0dXNiX2lu
dGVsX2NtZF90aW1lb3V0Ow0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUFH
QUlOOw0KPiA+ID4gKyAgICAgICAgICAgICB9DQo+ID4gPiArDQo+ID4gPiArICAgICAgICAgICAg
IC8qIHdlIG5lZWQgdG8gcmVhZCBsZWdhY3kgdmVyc2lvbiBoZXJlIHRvIG1pbmltaXplIHRoZSBj
aGFuZ2VzDQo+ID4gPiArICAgICAgICAgICAgICAqIGFuZCBrZWVwIHRoZSBlc2l4aXRpbmcgZmxv
dw0KPiA+ID4gKyAgICAgICAgICAgICAgKi8NCj4gPiA+ICsgICAgICAgICAgICAgZXJyID0gYnRp
bnRlbF9yZWFkX3ZlcnNpb24oaGRldiwgJnZlcik7DQo+ID4gPiArICAgICAgICAgICAgIGlmIChl
cnIpIHsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBidF9kZXZfZXJyKGhkZXYsICJJbnRl
bCBSZWFkIHZlcnNpb24gZmFpbGVkICglZCkiLCBlcnIpOw0KPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIGJ0aW50ZWxfcmVzZXRfdG9fYm9vdGxvYWRlcihoZGV2KTsNCj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gZXJyOw0KPiA+ID4gKyAgICAgICAgICAgICB9DQo+ID4gPiAr
ICAgICB9DQo+ID4gPg0KPiA+ID4gICAgICAgZXJyID0gYnRpbnRlbF92ZXJzaW9uX2luZm8oaGRl
diwgJnZlcik7DQo+ID4gPiAgICAgICBpZiAoZXJyKQ0KPiA+ID4gZGlmZiAtLWdpdCBhL25ldC9i
bHVldG9vdGgvaGNpX2NvcmUuYyBiL25ldC9ibHVldG9vdGgvaGNpX2NvcmUuYw0KPiA+ID4gaW5k
ZXggMWViN2ZmZDBkZDI5Li44ZTQwN2JhZDBlMzEgMTAwNjQ0DQo+ID4gPiAtLS0gYS9uZXQvYmx1
ZXRvb3RoL2hjaV9jb3JlLmMNCj4gPiA+ICsrKyBiL25ldC9ibHVldG9vdGgvaGNpX2NvcmUuYw0K
PiA+ID4gQEAgLTE0OTYsOCArMTQ5NiwxMSBAQCBzdGF0aWMgaW50IGhjaV9kZXZfZG9fb3Blbihz
dHJ1Y3QgaGNpX2Rldg0KPiA+ID4gKmhkZXYpDQo+ID4gPg0KPiA+ID4gICAgICAgICAgICAgICBo
Y2lfc29ja19kZXZfZXZlbnQoaGRldiwgSENJX0RFVl9TRVRVUCk7DQo+ID4gPg0KPiA+ID4gLSAg
ICAgICAgICAgICBpZiAoaGRldi0+c2V0dXApDQo+ID4gPiArICAgICAgICAgICAgIGlmIChoZGV2
LT5zZXR1cCkgew0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGhkZXYtPnNldHVw
KGhkZXYpOw0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQgJiYgcmV0ID09IC1F
QUdBSU4pDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBoZGV2LT5z
ZXR1cChoZGV2KTsNCj4gPiA+ICsgICAgICAgICAgICAgfQ0KPiA+DQo+ID4gTk8uIFBsZWFzZSBz
dG9wIGhhY2tpbmcgaGVyZS4gSSB0aGluayB5b3UgbmVlZCB0byB0YWtlIGEgd2hpdGVib2FyZCBh
bmQNCj4gZHJhdyBob3cgb3VyIGNvbnRyb2xsZXJzIGFyZSBpbml0aWFsaXplZC4NCj4gDQo+ICsx
DQo+IA0KPiBJdCBpcyBhbHJlYWR5IHN0cmFuZ2UgdGhhdCB3ZSBoYXZlIG1peGVkIGdlbmVyYXRp
b24sIGJlc2lkZXMgd2UgbmV2ZXIgcmVhbGx5DQo+IGRpZCBhIGdvb2Qgam9iIHRyYWNraW5nIHRo
ZSBnZW5lcmF0aW9uIHByb3Blcmx5LCBidXQgd2l0aCB0aGlzIGl0IHNlZW1zIHdlIGFyZQ0KPiBh
dHRlbXB0aW5nIHRvIG1peCBnZW5lcmF0aW9ucyBzbyB3ZSBubyBsb25nZXIgY2FuIGRldGVjdCB0
aGVtIGJhc2VkIG9uDQo+IFVTQiBQSUQvVklEIGJ1dCBuZWVkIHRvIGRpZyBpbnRvIHRoZSB2ZXJz
aW9uIGluZm9ybWF0aW9uIGF0IHJ1bnRpbWUsIHNvIGltbw0KPiB3ZSBzaG91bGQgZWl0aGVyIGRl
dGVjdGVkIGJhc2VkIG9uIFVTQiBQSUQvVklEIG9yIGlmIHRoYXQgaXMgbm90IHBvc3NpYmxlDQo+
IHRoZW4gc3dpdGNoIGl0IHRvIGJlIHJ1bnRpbWUgb25seSBhbmQgbm90IHRyeSB0byBkbyBib3Ro
IGFzIGl0IHNob3VsZCBiZSBjbGVhcg0KPiBieSBub3cgdGhhdCB3aWxsIGp1c3QgbWFrZSB0aGUg
Y29kZSByZWFsbHkgaGFyZCB0byBmb2xsb3cuDQo+IA0KPiAtLQ0KPiBMdWl6IEF1Z3VzdG8gdm9u
IERlbnR6DQo=
