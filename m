Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 898AC786B0B
	for <lists+linux-bluetooth@lfdr.de>; Thu, 24 Aug 2023 11:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234540AbjHXJDg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 24 Aug 2023 05:03:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240644AbjHXJDa (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 24 Aug 2023 05:03:30 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04olkn2033.outbound.protection.outlook.com [40.92.74.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B07751708
        for <linux-bluetooth@vger.kernel.org>; Thu, 24 Aug 2023 02:03:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lacvgaqGpqWH1pKfDP1ne55CWGFrIOytRKKCUuDy9RZkHdZSQUDzpNkctQT59JSg3OdEFMU8KESPuRCav/Tu602Uq9WSBuDPN1VpwKMLQAIDMy0KmcoPgauD7QLJ2rExAVNog4qV3Qtmh2yZjJKdZhiqALWi3IcPeyPI91EdCuWtNage6J3CliUmfP2qeFoa8SXU1WG3FgEPBQ+kPgWo4PiyoztEWw8lLVBx7OTkW91u9xSu8pNc5aDlKPk2TsjO/eBuWm/U19PhKLRIGM0Sbw3Wh0xngczksNkCFhkVvujWz57Xwq7apfXn+9OyPXRGdpr3WpsXghHK7ig/HrK2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUOO4lJNXTmCUFjXLTJ4eRm26RBIO15MwTYHEDMMTWA=;
 b=RGBv9OvH9iBdVGbkCO8btpAmetH8qqscnlhq953xeG0+ziDF1pJrwGsibkmjj83+8HdlrMB/EzpE9emQE/waYwSDGIrxJdExhI7DYIaT7pfvLHqL5lgicZXHsvsCw9pnpNz21hwcsRYNvPIwwZR/n/liLE9Mzkvwh4VahNZ82DTjXHZlNxqz7shmuOTiEAaFEODyfuWXHq46q6CQ/nwlG9M1YFpMaxcj1DnDMrqI+RCfLaZ//NMWqke3oN9JtvS59TvPGxk/EFYb/nMtQzshvE3rTvTBf5/SlhJNryZNPuCEU58f4y+Pncp0PeEVpNqhuhf8wrnhFgwP6o58j2GSnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUOO4lJNXTmCUFjXLTJ4eRm26RBIO15MwTYHEDMMTWA=;
 b=FUbCf/S+1Jojo9k4UsfOzVPyATKDSd+Q8WRoHk+1QkRGbRb8fe/Kyf9FSS8hKCrFXL7qBjEzafd2NdTBHqVycbpp7C+T3vt8oxXlqqVjILrRP/xQC/c12mTGPG+JDReT1GCfuwnDq8/9oRmehgE0bdmwbgugGAb7LZuOXIFa0Ya6McNbjFXOxTz21EbWcRe2z9WamYXEljXI0r+TnC4CzMSKn2sNnS3QrT3tF9Dtt5gNNBGmTar0JwmXyF645/isDUdUFrBEtmhBoSFzpLtKjnYlsKwQGoJVgYDc4aEoK2+Us6wZblvhlefEsd8vfgbAXa5+Q0jLYbjbyeqwRrUZNw==
Received: from AM6P191MB0501.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:30::18)
 by AS8P191MB1672.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:2e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 09:03:25 +0000
Received: from AM6P191MB0501.EURP191.PROD.OUTLOOK.COM
 ([fe80::9f66:6cda:606:fa33]) by AM6P191MB0501.EURP191.PROD.OUTLOOK.COM
 ([fe80::9f66:6cda:606:fa33%4]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 09:03:25 +0000
From:   Bruno Pitrus <brunopitrus@hotmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
CC:     Paul Menzel <pmenzel@molgen.mpg.de>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Subject: Re: [PATCH] Bluetooth: HCI: Introduce HCI_QUIRK_BROKEN_LE_CODED
Thread-Topic: [PATCH] Bluetooth: HCI: Introduce HCI_QUIRK_BROKEN_LE_CODED
Thread-Index: AQHZ1TNtniBhsdYoPEWV9bmXCdZt4q/2wccAgADK24CAAA9pAIAAeTOAgAEUBoA=
Date:   Thu, 24 Aug 2023 09:03:25 +0000
Message-ID: <28219751.mYOd1jRtt3@bruno-beit>
References: <20230822191444.3741307-1-luiz.dentz@gmail.com>
 <5704690.DvuYhMxLoT@bruno-beit>
 <CABBYNZ+6pRytUHfi68h4Q=A9urNR=JtuJ0mzG+615q0Lyyeg+w@mail.gmail.com>
In-Reply-To: <CABBYNZ+6pRytUHfi68h4Q=A9urNR=JtuJ0mzG+615q0Lyyeg+w@mail.gmail.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn:  [xh/lOAmW+yPDoEqsd/IBeOqJOOFZqYa+]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6P191MB0501:EE_|AS8P191MB1672:EE_
x-ms-office365-filtering-correlation-id: 2f3a4512-f30c-4b96-31a1-08dba480f9cb
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yV331/Om4i1HK2gDFYBtvPMLydEFMRt4CKv5SmOGSni5Vl/YgaAND0GpeWpz5YNipQlNvd8me8tuS0x53goKM+jNm7TycUGaQPR+AxqoSxpEbrjcTy4M8WovXNYuq374f4BLIsMLB88Vj0l8FvoZTOJtmNgVty8ygA4q0emlX8P5lCX8SR2JfbLvwwXKcwytDZxuKoa5xTAgIs7uTposTwVxx9eC9eiSddM59ZtkhuUpb+PtBwM/Q6v5u9bOov2+ukwmTler5AphAUl4GFibfvBrVpcrPsl0qfvSlX7AvargDq8C2AQKPx9pLtbHlzmMA7OFacgFfNI5SwW3Edho1zfYaWR0lgSUviqOz8Jqi7J4fzn52pPmWlhKWRompJZo7BmAytE0hRQH3CXV0MRZgN7+QMCYS5a05cs4rvCsVJdNYyCMQEUC1URGcxwldEhDuQhLRjJLbPH5wBfulf1rHGbp/uKPz4xAzQBXbZyOOHC2sAaaLtgWZcrdKKuzMgL8n4FgKqNwnBIXWAPEasSha9hFS61N3O7GckmCKgH/0tbCkxNCGyfSHABIliOqd7VsJ2mR22i6cqQjSUdLyxdJMg==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1pkZUxUU1BHUEdIRm9WMGJDZkZWMVZHeVhOYmJJZFpvb2tPNmJuQ3hLcXdJ?=
 =?utf-8?B?NFhidFBQQnFORjkzSlUyQ2NjZGZxZjNnN2hpMVY5VWd1MUtOek5EUUNybys4?=
 =?utf-8?B?ejdKcTdvbTNxN1NKUnZFYTFweWs4V08wSDdmelkwZjVBeWkvNGVIQ0FMVVpl?=
 =?utf-8?B?SmdpMmtDb3ZXcXF4RjYzUVU2OVRwWHFYOFd4MDNKT0pHWnI0L2pqNlVFQnlu?=
 =?utf-8?B?andoUGdDaWF2dFpFeWVLaWZZTUswdlBPeC9EYjd0OXRnTFpGaklNbWxVVmNs?=
 =?utf-8?B?bjg3SnFnR0lNMHJwU2dLTHh3TEVvQjdFT01ZUUVnZ1JxSUF4QmpRNnBab3k4?=
 =?utf-8?B?VUswMmR5c1pJSDA3R1JsU1JzUU44dFJKZ2hNMzRxazNnZThqeGduZHk4azQ2?=
 =?utf-8?B?K1Yra213MSswcDZJZUdUSG8wMng3MDBESlZWU0duOStweXVjekZnc0xoZHZR?=
 =?utf-8?B?UXo0NWhZWnV3dFNzWHY1OXI3dy8vSklaV2pXVFJvUDVzZDNuUWd1L21obEdT?=
 =?utf-8?B?eDNSTGpRZnpuZ3p5engwemM3QytnWGZBYU5ERVZ5NVNsSzRyUEo3cUhUMGxa?=
 =?utf-8?B?ZnVjSnNBT0pXTmJWVWs4QlkvejBxN2ZuT1k0cENydjh2ZDJCc24vM3ZCdFFq?=
 =?utf-8?B?OG4ySThjanN0OEIxdTM5UTIrNmI5M1dqQzlhTk1YalNTQ0FnLzgvZFAxbjNB?=
 =?utf-8?B?UklCL1RUSGUrbi9mZEhNNldESmxQZ0pzQXhGVjMrUmxlQ2tSRkgwYXRGWVVo?=
 =?utf-8?B?bUxQdDUwa0p2SjBSdmZrQ3Nxem53ZkdMbk1aSitKbXNGSmRaWThPT0FZUFV2?=
 =?utf-8?B?RlNaYjVPQlpzOXJrTXlFMHhHRDcxdytmQk1ZdFo5U053WjVXdTFDUkNJaGZ5?=
 =?utf-8?B?Ymxtdi9DR3VEZHY5MG5SOW1ZZDRpdng3MlQrVGd1Njc4aEdXWXRvSVUvcC94?=
 =?utf-8?B?dEJaYzVFUys3K1BFc1RGUnFhdGtsM21WVk1nMTMwdU9NVFYrZXFibUxVVmxX?=
 =?utf-8?B?SHkwaFRraUVWNWpjdDh2cEhPemhqK2NkcFZTbnJ1QWhYbU9qZU5mTGZhRUZL?=
 =?utf-8?B?cW1reitEMitsYjBHSkJtTE9QSnFQT0ZLQ3VaRTZVbytqZlozbnlGcThkaTRp?=
 =?utf-8?B?L0dEai92R2wrbitaZmVKdmovN09uYUs1QVM4TnFsbjA2bGVTc0xTcVpoU0Zz?=
 =?utf-8?B?N1NNZGRJVkFhWjNKWU5pbEdJc1AwbWJ1VXk5aTVUdWkyZFZqZVp0eEZjMmk5?=
 =?utf-8?B?Ni9LRjdRdmhzdmVuNzFaTEd2NFdyeXZWNGtmMTQvZlhFWUExQUFKMm5WNmRC?=
 =?utf-8?B?K0ZmblBNNDA3OUdTTjk2eUJ2dEhZWmZiVzhFYkpmOHZQc2ppN3lhbFJ3d29j?=
 =?utf-8?B?VGVSTW5jaFgxMmZhYVhEbUZFcjd2N2ZsMHhsakJtVXpTOXJsQ1VzQ2IwcG5W?=
 =?utf-8?B?WXlrYytWd2NNUHVZTHRmSjBmb0lyYlBEM0NqWkNiS1hWUG9UZWNQdmxJQzNj?=
 =?utf-8?B?aVJpT05uTFZGbGRZOVNvNHNTZ0wxYVg3c0RlSG1ZZytPNzVxbU9GRWNuSkhF?=
 =?utf-8?B?aDdiMXJuOFdTV3B4N3NSaFZZYldaQXk2bDZ4T2RFUk4rTjZlY1pXejQ4eWRV?=
 =?utf-8?Q?UN66yhdkU+12qRLbnZConUe0Fomq6Vfb7+bwjcOX45eA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F98DD70CDE88947A6EDA6B48311598E@EURP191.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-50200.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6P191MB0501.EURP191.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3a4512-f30c-4b96-31a1-08dba480f9cb
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 09:03:25.6578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P191MB1672
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

RG5pYSDFm3JvZGEsIDIzIHNpZXJwbmlhIDIwMjMgMTg6MzU6MjcgQ0VTVCBMdWl6IEF1Z3VzdG8g
dm9uIERlbnR6IHBpc3plOgo+IEhpIEJydW5vLAo+IAo+IE9uIFdlZCwgQXVnIDIzLCAyMDIzIGF0
IDI6MjHigK9BTSBCcnVubyBQaXRydXMgPGJydW5vcGl0cnVzQGhvdG1haWwuY29tPiB3cm90ZToK
PiA+Cj4gPiBEbmlhIMWbcm9kYSwgMjMgc2llcnBuaWEgMjAyMyAxMDoyNjozMSBDRVNUIFBhdWwg
TWVuemVsIHBpc3plOgo+ID4gPiBEZWFyIEx1aXosCj4gPiA+Cj4gPiA+Cj4gPiA+IFRoYW5rIHlv
dSBmb3IgeW91ciBhbnN3ZXIuCj4gPiA+Cj4gPiA+IEFtIDIyLjA4LjIzIHVtIDIyOjIwIHNjaHJp
ZWIgTHVpeiBBdWd1c3RvIHZvbiBEZW50ejoKPiA+ID4gPiBIaSBQYXVsLAo+ID4gPiA+Cj4gPiA+
ID4gT24gVHVlLCBBdWcgMjIsIDIwMjMgYXQgMTowMeKAr1BNIFBhdWwgTWVuemVsIDxwbWVuemVs
QG1vbGdlbi5tcGcuZGU+IHdyb3RlOgo+ID4gPiA+Pgo+ID4gPiA+PiBbQ0M6ICtCcnVub10KPiA+
ID4gPj4KPiA+ID4gPj4gRGVhciBMdWl6LAo+ID4gPiA+Pgo+ID4gPiA+Pgo+ID4gPiA+PiBUaGFu
ayB5b3UgZm9yIHRoZSBwYXRjaC4KPiA+ID4gPj4KPiA+ID4gPj4gQW0gMjIuMDguMjMgdW0gMjE6
MTQgc2NocmllYiBMdWl6IEF1Z3VzdG8gdm9uIERlbnR6Ogo+ID4gPiA+Pj4gRnJvbTogTHVpeiBB
dWd1c3RvIHZvbiBEZW50eiA8bHVpei52b24uZGVudHpAaW50ZWwuY29tPgo+ID4gPiA+Pj4KPiA+
ID4gPj4+IFRoaXMgaW50cm9kdWNlcyBIQ0lfUVVJUktfQlJPS0VOX0xFX0NPREVEIGlzIGlzIHVz
ZWQgdG8gaW5kaWNhdGUgdGhhdAo+ID4gPiA+Pgo+ID4gPiA+PiDigKYuIEl0IGlzIHVzZWQg4oCm
Cj4gPiA+ID4+Cj4gPiA+ID4+PiBMRSBDb2RlZCBQSFkgc2hhbGwgbm90IGJlIHVzZWQsIGl0IGlz
IHRoZW4gc2V0IGZvciBzb21lIEludGVsIG1vZGVscwo+ID4gPiA+Pj4gdGhhdCBjbGFpbXMgdG8g
c3VwcG9ydCBpdCBidXQgd2hlbiB1c2VkIGNhdXNlcyBtYW55IHByb2JsZW1zLgo+ID4gPiA+Pgo+
ID4gPiA+PiB0aGF0IGNsYWltIHRvIOKApgo+ID4gPiA+Pgo+ID4gPiA+Pj4gTGluazogaHR0cHM6
Ly9naXRodWIuY29tL2JsdWV6L2JsdWV6L2lzc3Vlcy81NzcKPiA+ID4gPj4+IExpbms6IGh0dHBz
Oi8vZ2l0aHViLmNvbS9ibHVlei9ibHVlei9pc3N1ZXMvNTgyCj4gPiA+ID4+PiBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1ibHVldG9vdGgvQ0FCQllOWktjby12N3drakhIZXh4
UWJnd3dTei1TPUdaPWRaS2JSRTFxeFQxaDRmRmJRQG1haWwuZ21haWwuY29tL1QvIwo+ID4gPiA+
Pj4gRml4ZXM6IDI4OGM5MDIyNGVlYyAoIkJsdWV0b290aDogRW5hYmxlIGFsbCBzdXBwb3J0ZWQg
TEUgUEhZIGJ5IGRlZmF1bHQiKQo+ID4gPiA+Pj4gU2lnbmVkLW9mZi1ieTogTHVpeiBBdWd1c3Rv
IHZvbiBEZW50eiA8bHVpei52b24uZGVudHpAaW50ZWwuY29tPgo+ID4gPiA+Pj4gLS0tCj4gPiA+
ID4+PiAgICBkcml2ZXJzL2JsdWV0b290aC9idGludGVsLmMgICAgICB8ICAyICsrCj4gPiA+ID4+
PiAgICBpbmNsdWRlL25ldC9ibHVldG9vdGgvaGNpLmggICAgICB8IDEwICsrKysrKysrKysKPiA+
ID4gPj4+ICAgIGluY2x1ZGUvbmV0L2JsdWV0b290aC9oY2lfY29yZS5oIHwgIDQgKysrLQo+ID4g
PiA+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPiA+ID4+Pgo+ID4gPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0aW50
ZWwuYyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0aW50ZWwuYwo+ID4gPiA+Pj4gaW5kZXggOWIyMzlj
ZTk2ZmE0Li4zZWQ2MGIyYjAzNDAgMTAwNjQ0Cj4gPiA+ID4+PiAtLS0gYS9kcml2ZXJzL2JsdWV0
b290aC9idGludGVsLmMKPiA+ID4gPj4+ICsrKyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0aW50ZWwu
Ywo+ID4gPiA+Pj4gQEAgLTI3NzYsNiArMjc3Niw4IEBAIHN0YXRpYyBpbnQgYnRpbnRlbF9zZXR1
cF9jb21iaW5lZChzdHJ1Y3QgaGNpX2RldiAqaGRldikKPiA+ID4gPj4+ICAgICAgICAgICAgICAg
IGNhc2UgMHgxMTogICAgICAvKiBKZlAgKi8KPiA+ID4gPj4+ICAgICAgICAgICAgICAgIGNhc2Ug
MHgxMjogICAgICAvKiBUaFAgKi8KPiA+ID4gPj4+ICAgICAgICAgICAgICAgIGNhc2UgMHgxMzog
ICAgICAvKiBIclAgKi8KPiA+ID4gPj4+ICsgICAgICAgICAgICAgICAgICAgICBzZXRfYml0KEhD
SV9RVUlSS19CUk9LRU5fTEVfQ09ERUQsICZoZGV2LT5xdWlya3MpOwo+ID4gPiA+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgIGZhbGx0aHJvdWdoOwo+ID4gPiA+Pj4gICAgICAgICAgICAgICAgY2Fz
ZSAweDE0OiAgICAgIC8qIENjUCAqLwo+ID4gPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICBz
ZXRfYml0KEhDSV9RVUlSS19WQUxJRF9MRV9TVEFURVMsICZoZGV2LT5xdWlya3MpOwo+ID4gPiA+
Pj4gICAgICAgICAgICAgICAgICAgICAgICBmYWxsdGhyb3VnaDsKPiA+ID4gPj4+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL25ldC9ibHVldG9vdGgvaGNpLmggYi9pbmNsdWRlL25ldC9ibHVldG9vdGgv
aGNpLmgKPiA+ID4gPj4+IGluZGV4IGM1ODQyNWQ0YzU5Mi4uNzY3OTIxZDdmNWMxIDEwMDY0NAo+
ID4gPiA+Pj4gLS0tIGEvaW5jbHVkZS9uZXQvYmx1ZXRvb3RoL2hjaS5oCj4gPiA+ID4+PiArKysg
Yi9pbmNsdWRlL25ldC9ibHVldG9vdGgvaGNpLmgKPiA+ID4gPj4+IEBAIC0zMTksNiArMzE5LDE2
IEBAIGVudW0gewo+ID4gPiA+Pj4gICAgICAgICAqIFRoaXMgcXVpcmsgbXVzdCBiZSBzZXQgYmVm
b3JlIGhjaV9yZWdpc3Rlcl9kZXYgaXMgY2FsbGVkLgo+ID4gPiA+Pj4gICAgICAgICAqLwo+ID4g
PiA+Pj4gICAgICAgIEhDSV9RVUlSS19VU0VfTVNGVF9FWFRfQUREUkVTU19GSUxURVIsCj4gPiA+
ID4+PiArCj4gPiA+ID4+PiArICAgICAvKgo+ID4gPiA+Pj4gKyAgICAgICogV2hlbiB0aGlzIHF1
aXJrIGlzIHNldCwgTEUgQ29kZWQgUEhZIGlzIHNoYWxsIG5vdCBiZSB1c2VkLiBUaGlzIGlzCj4g
PiA+ID4+Cj4gPiA+ID4+IHMvaXMgc2hhbGwvc2hhbGwvCj4gPiA+ID4+Cj4gPiA+ID4+PiArICAg
ICAgKiByZXF1aXJlZCBmb3Igc29tZSBJbnRlbCBjb250cm9sbGVycyB3aGljaCBlcnJvbmVvdXNs
eSBjbGFpbSB0bwo+ID4gPiA+Pj4gKyAgICAgICogc3VwcG9ydCBpdCBidXQgaXQgY2F1c2VzIHBy
b2JsZW1zIHdpdGggZXh0ZW5kZWQgc2Nhbm5pbmcuCj4gPiA+ID4+PiArICAgICAgKgo+ID4gPiA+
Pj4gKyAgICAgICogVGhpcyBxdWlyayBjYW4gYmUgc2V0IGJlZm9yZSBoY2lfcmVnaXN0ZXJfZGV2
IGlzIGNhbGxlZCBvcgo+ID4gPiA+Pj4gKyAgICAgICogZHVyaW5nIHRoZSBoZGV2LT5zZXR1cCB2
ZW5kb3IgY2FsbGJhY2suCj4gPiA+ID4+PiArICAgICAgKi8KPiA+ID4gPj4+ICsgICAgIEhDSV9R
VUlSS19CUk9LRU5fTEVfQ09ERUQsCj4gPiA+ID4+PiAgICB9Owo+ID4gPiA+Pj4KPiA+ID4gPj4+
ICAgIC8qIEhDSSBkZXZpY2UgZmxhZ3MgKi8KPiA+ID4gPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L25ldC9ibHVldG9vdGgvaGNpX2NvcmUuaCBiL2luY2x1ZGUvbmV0L2JsdWV0b290aC9oY2lfY29y
ZS5oCj4gPiA+ID4+PiBpbmRleCA2ZTI5ODhiMTFmOTkuLmU2MzU5ZjczNDZmMSAxMDA2NDQKPiA+
ID4gPj4+IC0tLSBhL2luY2x1ZGUvbmV0L2JsdWV0b290aC9oY2lfY29yZS5oCj4gPiA+ID4+PiAr
KysgYi9pbmNsdWRlL25ldC9ibHVldG9vdGgvaGNpX2NvcmUuaAo+ID4gPiA+Pj4gQEAgLTE4MTcs
NyArMTgxNyw5IEBAIHZvaWQgaGNpX2Nvbm5fZGVsX3N5c2ZzKHN0cnVjdCBoY2lfY29ubiAqY29u
bik7Cj4gPiA+ID4+PiAgICAjZGVmaW5lIHNjYW5fMm0oZGV2KSAoKChkZXYpLT5sZV90eF9kZWZf
cGh5cyAmIEhDSV9MRV9TRVRfUEhZXzJNKSB8fCBcCj4gPiA+ID4+PiAgICAgICAgICAgICAgICAg
ICAgICAoKGRldiktPmxlX3J4X2RlZl9waHlzICYgSENJX0xFX1NFVF9QSFlfMk0pKQo+ID4gPiA+
Pj4KPiA+ID4gPj4+IC0jZGVmaW5lIGxlX2NvZGVkX2NhcGFibGUoZGV2KSAoKChkZXYpLT5sZV9m
ZWF0dXJlc1sxXSAmIEhDSV9MRV9QSFlfQ09ERUQpKQo+ID4gPiA+Pj4gKyNkZWZpbmUgbGVfY29k
ZWRfY2FwYWJsZShkZXYpICgoKGRldiktPmxlX2ZlYXR1cmVzWzFdICYgSENJX0xFX1BIWV9DT0RF
RCkgJiYgXAo+ID4gPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAhdGVzdF9iaXQo
SENJX1FVSVJLX0JST0tFTl9MRV9DT0RFRCwgXAo+ID4gPiA+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgJihkZXYpLT5xdWlya3MpKQo+ID4gPiA+Pj4KPiA+ID4gPj4+
ICAgICNkZWZpbmUgc2Nhbl9jb2RlZChkZXYpICgoKGRldiktPmxlX3R4X2RlZl9waHlzICYgSENJ
X0xFX1NFVF9QSFlfQ09ERUQpIHx8IFwKPiA+ID4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICgoZGV2KS0+bGVfcnhfZGVmX3BoeXMgJiBIQ0lfTEVfU0VUX1BIWV9DT0RFRCkpCj4gPiA+ID4+
Cj4gPiA+ID4+IFdpbGwgdGhpcyBiZSBmdXR1cmUgcHJvb2YsIG9uY2UgZmlybXdhcmUgZm9yIHRo
ZSBicm9rZW4gY29udHJvbGxlcnMgYXJlCj4gPiA+ID4+IGZpeGVkPwo+ID4gPiA+Cj4gPiA+ID4g
WWVzLCBpdCB3b24ndCBjYXVzZSBhbnkgcmVncmVzc2lvbnMgaWYgdGhlIGZpcm13YXJlIGlzIGZp
eGVkIGluIHRoZQo+ID4gPiA+IGZ1dHVyZSwgYnV0IExFIGNvZGVkIFBIWSB3aWxsIG5lZWQgdG8g
YmUgcmUtZW5hYmxlZCBieSByZW1vdmluZyB0aGUKPiA+ID4gPiBxdWlya3MsIHRoaXMgaXMgd2h5
IHdlIHNheSBpdCBpcyBicm9rZW4gYnV0IHdlIGNhbid0IGRlcGVuZCBvbiBydW50aW1lCj4gPiA+
ID4gZGV0ZWN0aW9uIGFuZCBzaG91bGQgcHJvYmFibHkgcHJpbnQgYSB3YXJuaW5nIHVudGlsIHdl
IGhhdmUgYSBwcm9wZXIKPiA+ID4gPiBmaXggZm9yIGl0IGxhbmRzIGF0IHRoZSBmaXJtd2FyZSBz
aWRlLiBXZSBjb3VsZCBpbiB0aGVvcnkgc2V0Cj4gPiA+ID4gSENJX1FVSVJLX0JST0tFTl9MRV9D
T0RFRCBiYXNlZCBvbiB0aGUgZmlybXdhcmUgdmVyc2lvbiBidXQgZmlybXdhcmUKPiA+ID4gPiB2
ZXJzaW9uaW5nIHNjaGVtZXMgdGVuZCB0byBjaGFuZ2Ugc28gSSdtIGFmcmFpZCB0aGF0IGNvdWxk
IGFsc28gY2F1c2UKPiA+ID4gPiByZWdyZXNzaW9uIGxpa2UgdGhpcyBpbiB0aGUgZnV0dXJlLgo+
ID4gPgo+ID4gPiBVbmRlcnN0b29kLiBNYXliZSB5b3UgY291bGQgYWRkIHRoZSBrbm93biBicm9r
ZW4gZmlybXdhcmUgdmVyc2lvbnMgdG8KPiA+ID4gdGhlIGNvbW1pdCBtZXNzYWdlIGZvciBwb3N0
ZXJpdHkgdGhvdWdoLgo+ID4gPgo+ID4gPgo+ID4gPiBLaW5kIHJlZ2FyZHMsCj4gPiA+Cj4gPiA+
IFBhdWwKPiA+ID4KPiA+IFRoYW5rcywKPiA+IFRoaXMgcGF0Y2ggcGFydGx5IHdvcmtzIGZvciBt
ZS4gVGhlIG1vdXNlIG5vdyB0YWtlcyBzZXZlcmFsIGRvemVuIHNlY29uZHMgdG8gZGV0ZWN0IHdo
ZXJlIHRoZSBjb21wdXRlciBkaWQgbm90IGZpbmQgaXQgYXQgYWxsIGJlZm9yZS4KPiA+IEJ1dCBu
b3RlIHRoYXQgaW4ga2VybmVsIDYuMy54IGl0IHdhcyBhbHdheXMgZGV0ZWN0ZWQgaW1tZWRpYXRl
bHkuCj4gCj4gV2hhdCB2ZXJzaW9uIGRpZCB5b3UgdHJ5LCB2MiBkaWRuJ3QgaGF2ZSBhbnkgZWZm
ZWN0IGZvciBtZSwgb25seSB2Mwo+IHdvcmtlZCB3aGljaCBoYWQgdGhlIHNhbWUgYmVoYXZpb3Ig
b2YgQVgyMTAgc28gaXQgZGlzY292ZXJlZCBpdCBxdWl0ZQo+IHF1aWNrbHkuCj4gCj4gCgpJIG9u
bHkgdHJpZWQgdjEgcGF0Y2ggKCBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC1i
bHVldG9vdGgvbXNnMTA2NDA2Lmh0bWwgKS4gU2hvdWxkIGkgdHJ5IGEgbGF0ZXIgdmVyc2lvbiBp
bnN0ZWFkPwo=
