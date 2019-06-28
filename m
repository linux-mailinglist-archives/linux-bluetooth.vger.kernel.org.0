Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8345159DD1
	for <lists+linux-bluetooth@lfdr.de>; Fri, 28 Jun 2019 16:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfF1OdR (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 28 Jun 2019 10:33:17 -0400
Received: from mga09.intel.com ([134.134.136.24]:26338 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726711AbfF1OdR (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 28 Jun 2019 10:33:17 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Jun 2019 07:33:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,428,1557212400"; 
   d="scan'208";a="153385640"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
  by orsmga007.jf.intel.com with ESMTP; 28 Jun 2019 07:33:15 -0700
Received: from orsmsx161.amr.corp.intel.com (10.22.240.84) by
 ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 28 Jun 2019 07:33:15 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.5.135]) by
 ORSMSX161.amr.corp.intel.com ([169.254.4.81]) with mapi id 14.03.0439.000;
 Fri, 28 Jun 2019 07:33:15 -0700
From:   "Gix, Brian" <brian.gix@intel.com>
To:     "michal.lowas-rzechonek@silvair.com" 
        <michal.lowas-rzechonek@silvair.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
CC:     "Stotland, Inga" <inga.stotland@intel.com>
Subject: Re: [PATCH BlueZ 2/3] mesh: Add DevKeySend call
Thread-Topic: [PATCH BlueZ 2/3] mesh: Add DevKeySend call
Thread-Index: AQHVLbBTXkZCBJk6F0mOJ2IaxbXQY6axhQEAgAARy4A=
Date:   Fri, 28 Jun 2019 14:33:14 +0000
Message-ID: <1561732393.7802.50.camel@intel.com>
References: <20190628125205.21411-1-michal.lowas-rzechonek@silvair.com>
         <20190628125205.21411-3-michal.lowas-rzechonek@silvair.com>
         <20190628132932.bhcvcx4tzlfkertu@mlowasrzechonek2133>
In-Reply-To: <20190628132932.bhcvcx4tzlfkertu@mlowasrzechonek2133>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.80.171]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4EF12F16735534F891A1D5D5AE7CFE8@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

DQpIaSBNaWNoYcWCLA0KDQpPbiBGcmksIDIwMTktMDYtMjggYXQgMTU6MjkgKzAyMDAsIE1pY2hh
xYIgTG93YXMtUnplY2hvbmVrIHdyb3RlOg0KPiBIaSwNCj4gDQo+IE9uIDA2LzI4LCBNaWNoYcWC
IExvd2FzLVJ6ZWNob25layB3cm90ZToNCj4gPiArCWlmICghbF9kYnVzX21lc3NhZ2VfZ2V0X2Fy
Z3VtZW50cyhtc2csICJvcXFheSIsICZlbGVfcGF0aCwgJmRzdCwNCj4gPiArCQkJCQkJCSZuZXRf
aWR4LCAmaXRlcl9kYXRhKSkNCj4gPiArCQlyZXR1cm4gZGJ1c19lcnJvcihtc2csIE1FU0hfRVJS
T1JfSU5WQUxJRF9BUkdTLCBOVUxMKTsNCj4gDQo+IEkgaGF2ZSBhIHF1ZXN0aW9uIGhlcmU6IHdo
YXQncyB0aGUgaWRlYSBiZWhpbmQgbmV0X2luZGV4IGFyZ3VtZW50IGluDQo+IHRoaXMgQVBJPyBU
aGVyZSBpcyBubyBzdWNoIGFyZ3VtZW50IGluIHJlZ3VsYXIgU2VuZCgpIGNhbGwsIGFuZCBJIGRv
bid0DQoNClVubGlrZSBBcHAgS2V5cywgRGV2aWNlIGtleXMgZG8gbm90IGhhdmUgYSBib3VuZCBO
ZXQgS2V5Li4uICBUaGV5IGNhbiBiZSBzZW50IG9uICphbnkqIG5ldHdvcmsga2V5LiAgU28gd2hp
bGUNCnNlbmRpbmcgYSBtZXNzYWdlIG9uIGEgc3BlY2lmaWMgQXBwIGluZGV4IGltcGxpZXMgdGhl
IE5ldCBLZXkgdG8gdXNlLCB0aGUgRGV2IEtleSBzZW5kIGRvZXMgbm90LCBhbmQgc28gbmVlZHMN
Cml0IHRvIGJlIGV4cGxpY2l0Lg0KDQoNCg0KPiBxdWl0ZSBnZXQgd2h5Lg0KPiANCj4gcmVnYXJk
cw==
