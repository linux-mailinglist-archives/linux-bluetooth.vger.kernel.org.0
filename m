Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59D025FCA9
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Jul 2019 19:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbfGDR5v (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 4 Jul 2019 13:57:51 -0400
Received: from mga18.intel.com ([134.134.136.126]:30130 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726404AbfGDR5v (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 4 Jul 2019 13:57:51 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jul 2019 10:57:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,451,1557212400"; 
   d="scan'208";a="155099711"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
  by orsmga007.jf.intel.com with ESMTP; 04 Jul 2019 10:57:50 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.5.44]) by
 ORSMSX104.amr.corp.intel.com ([169.254.4.232]) with mapi id 14.03.0439.000;
 Thu, 4 Jul 2019 10:57:49 -0700
From:   "Gix, Brian" <brian.gix@intel.com>
To:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "Stotland, Inga" <inga.stotland@intel.com>
Subject: Re: [PATCH BlueZ] mesh: Remove redundant initialization
Thread-Topic: [PATCH BlueZ] mesh: Remove redundant initialization
Thread-Index: AQHVMjhAkW/WiX8gI06XnXoTnxvYc6a7NOMA
Date:   Thu, 4 Jul 2019 17:57:48 +0000
Message-ID: <bb9eb9a85d550e2eac0cd50432413d6e218a7d72.camel@intel.com>
References: <20190704071516.17736-1-inga.stotland@intel.com>
In-Reply-To: <20190704071516.17736-1-inga.stotland@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.254.105.106]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E56BF9215653B48B234B1F1167B3015@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

QXBwbGllZA0KDQpPbiBUaHUsIDIwMTktMDctMDQgYXQgMDA6MTUgLTA3MDAsIEluZ2EgU3RvdGxh
bmQgd3JvdGU6DQo+IFRoaXMgZml4ZXMgYSBjYXNlIHdoZXJlIGEgdmFyaWFibGUgd2FzIGluaXRp
YWxpemVkIHR3aWNlLg0KPiAtLS0NCj4gIG1lc2gvY2ZnbW9kLXNlcnZlci5jIHwgMiArLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvbWVzaC9jZmdtb2Qtc2VydmVyLmMgYi9tZXNoL2NmZ21vZC1zZXJ2ZXIuYw0KPiBp
bmRleCA2MzRhYzAwNmIuLmJiNzhjZWFkNiAxMDA2NDQNCj4gLS0tIGEvbWVzaC9jZmdtb2Qtc2Vy
dmVyLmMNCj4gKysrIGIvbWVzaC9jZmdtb2Qtc2VydmVyLmMNCj4gQEAgLTc0Miw3ICs3NDIsNyBA
QCBzdGF0aWMgYm9vbCBjZmdfc3J2X3BrdCh1aW50MTZfdCBzcmMsIHVpbnQzMl90DQo+IGRzdCwN
Cj4gIAkJCQl1aW50OF90IHR0bCwgY29uc3Qgdm9pZCAqdXNlcl9kYXRhKQ0KPiAgew0KPiAgCXN0
cnVjdCBtZXNoX25vZGUgKm5vZGUgPSAoc3RydWN0IG1lc2hfbm9kZSAqKSB1c2VyX2RhdGE7DQo+
IC0Jc3RydWN0IG1lc2hfbmV0ICpuZXQgPSBub2RlX2dldF9uZXQobm9kZSk7DQo+ICsJc3RydWN0
IG1lc2hfbmV0ICpuZXQ7DQo+ICAJY29uc3QgdWludDhfdCAqcGt0ID0gZGF0YTsNCj4gIAlzdHJ1
Y3QgdGltZXZhbCB0aW1lX25vdzsNCj4gIAl1aW50MzJfdCBvcGNvZGUsIHRtcDMyOw0K
