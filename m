Return-Path: <linux-bluetooth+bounces-3589-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BF48A562B
	for <lists+linux-bluetooth@lfdr.de>; Mon, 15 Apr 2024 17:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0C5D1F230D4
	for <lists+linux-bluetooth@lfdr.de>; Mon, 15 Apr 2024 15:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED8579B99;
	Mon, 15 Apr 2024 15:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.BE header.i=@OUTLOOK.BE header.b="BWtnlGHT"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04olkn2106.outbound.protection.outlook.com [40.92.75.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D4378C77
	for <linux-bluetooth@vger.kernel.org>; Mon, 15 Apr 2024 15:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.75.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713194330; cv=fail; b=NRAnLydUx79P7atIVvbqcCrlcCoIwhpA4xtdhom8Xve0I6te/XyZ/UPaLepb0GCUaM26DntNP+qVH1OZHBMsuoV6z7Dr1YYFGE35c6ef3UjsEQs4Ie0SUGw5I+aU9JA67v7Mv8rmdZChLksDLENfFVW+cjPzm4B+fk/F7kXMqBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713194330; c=relaxed/simple;
	bh=KgUlzlhII5BEmp+Wi2kON1/dEAkl4f504WBlrILFKNk=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OxW3s67c6SVh+Fv8DPsrbSN6ePKYG9A2how8wX3S0JKXyb0aEb1UmzIm9cWp+OFJ7jDiF7+CTswvdIW1uCedSqkF/VhC0zAZzArIsue5X+Ja8dng0tG4XPoJ4lNdgKZvDNu4S2Uf18DCTvJegcUfogO8o1Zee49z+NpNjcEM+AQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.be; spf=pass smtp.mailfrom=outlook.be; dkim=pass (2048-bit key) header.d=OUTLOOK.BE header.i=@OUTLOOK.BE header.b=BWtnlGHT; arc=fail smtp.client-ip=40.92.75.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.be
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLZxDq1mXrautMGSmYeUsky+GzeinwJ3rWQhy1aFft02+wWKR0DPb8vmj7zue5JYpTHaA7okg1KXwhNdJ5uNFpGLFd5l+S9HVO0iXneu4LBU7TTpojU/gMdUreyfGXuQJbbxvhJ4HGQSCxT/7vvAHHPHmrsrIEe41nu3SbpD++ifQ34HIchZ9gchKhbR732WJZ1CGixzEIvAttnjojQa/cqMlouBdtSl3/2BifA9cDPYdr3sKiSNGQq8jcj7rkOCcyMWW36ocAltJPD5E4VCmHyDwlgfLtvJY47xrdFjhvhxtYiar7d6x+BilbDoIx8xwoI3MhKc5Vy5ohlQQEH/lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgUlzlhII5BEmp+Wi2kON1/dEAkl4f504WBlrILFKNk=;
 b=W1XYbWtpI4WBiZ21BNNKva8VZnYbUrGh1q1yRgzI6v5Hob50SgUQJvGSXfOuRczzsDvdYCb+yAROs1JBovz6/ebE7V+BW7T/CCbsUmFwZt1JwvkHy1sHfdeoiP3Pv0l/8YimbzTc/CWrM1H+ercLfc+UyS693X2xXjy7DPefYPj6FFibx2KblFysTj0hpVc7nSq9FWEpdIfzJv8wHelTbq0Mg6tCulqYUqTtYuTdvE5kMxPgCsHXo0E3AXYTGlSyD9KZWGIYSuycgrUNhOv6LVCZR9ZAdqDGdpK07M0pdIrT1L0jU6SZN4487A5yUsIh37/5K4vr2zfNcuEj+KUxHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.BE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgUlzlhII5BEmp+Wi2kON1/dEAkl4f504WBlrILFKNk=;
 b=BWtnlGHTtCDzLnA4xf2daiR3w6TgrIUes7ZgyAhpx0kbRw34a5hgHWOClcLDMMqUm0VA62I1NPZkaa8VIWKX08tfjSYIbpNqFJyxGw4sUdIyBshnS3Kb15C6Br/JsIt//RQ+sojcgpcFVnPeEv5L73B76bdJt+RPKg0nSx8WkqGt8K1N3aurSZTDUonx9QH898WWzQhgFC7VInSM70iM57Rt31maw292kIEJcCqJCRsGhPKZd9Ww75sgfL9yUqVMeqXLA1RvhEkWO2wKI6ucLiJEDWiRCKAin8weKcTRBcpU8exGLgnOkMtpRuQBmI2QhFDfra5oTr2dCP5yxD120g==
Received: from PAXPR08MB6399.eurprd08.prod.outlook.com (2603:10a6:102:158::20)
 by AS2PR08MB9125.eurprd08.prod.outlook.com (2603:10a6:20b:5e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 15:18:45 +0000
Received: from PAXPR08MB6399.eurprd08.prod.outlook.com
 ([fe80::f658:361f:b679:8b3f]) by PAXPR08MB6399.eurprd08.prod.outlook.com
 ([fe80::f658:361f:b679:8b3f%7]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 15:18:45 +0000
From: Peter Mortier <peter.mortier@outlook.be>
To: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Subject: Bluetooth from Windows to Linux using BlueZ
Thread-Topic: Bluetooth from Windows to Linux using BlueZ
Thread-Index: AQHaj0g14qgvKTq53k6fANofPVUUyg==
Date: Mon, 15 Apr 2024 15:18:45 +0000
Message-ID:
 <PAXPR08MB639971AE2D6FB75937F92D2C98092@PAXPR08MB6399.eurprd08.prod.outlook.com>
References:
 <PAXPR08MB6399418D53ED76246B32164998092@PAXPR08MB6399.eurprd08.prod.outlook.com>
In-Reply-To:
 <PAXPR08MB6399418D53ED76246B32164998092@PAXPR08MB6399.eurprd08.prod.outlook.com>
Accept-Language: nl-BE, en-US
Content-Language: nl-NL
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-bromium-msgid: 562bbb6a-ab41-4ff1-9254-5fda8d573fe9
x-tmn: [/5AoAroIqTrkn1XBeRIxUOYh5O31JUHjTpfHMhBaL1M=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR08MB6399:EE_|AS2PR08MB9125:EE_
x-ms-office365-filtering-correlation-id: 0a3486ef-e4fd-432c-fb2c-08dc5d5f57ba
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FEgyW1TM5/c02LHhH2UYmsqPXOu8t8NjepuEGQL1XjINtOOZ1V1r9l3Jz97UEQPl1S9ClHiETObX3CU+fnkTuLhW9oHDuuPBBgHd/ZfllAbLyWxkYpK0Z7maCD2f9xEX0zx0XX0kBFRDx4X9fD74WEfD3dGY7cvmXky93tMM+aGox18+QKIcC+NqisStd/6xFAEvuNt7raIAEBpmSKq/Z3ZrSpmZRuD8JYw7Sm3Cm/F7Oh7cfQyGX1jt6LemCxF989jMONauuQuBzMC7wXRONnZFvIbv3Qsf7LVOqOeRJHn31KzE66cBVvW+fto0KmHHZke8MP+mlF+iUO+b2ro8qRyLkxMhwGOUfM0KfTWnywfbHoYM4yZkFfHeqpdVoGu9HI40lZWkoEOBjjNXgDLEEUmWAqf8QsrlJXY7XCKqW2CT1BcuBOu8BXm7FY7p9zIP2ZeDSnkJeXanwp2tDAY+gRIcV8X9Ab+g3CwpeQ7QkeheHMUyeBpaV4n2BIGA+w5Kx+O4MSPmQvardkPT1W/0O01zowV8wM+jtptVq2K6GxwSUSWEWp7prjxz6ZZPA9Rr
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y2hvNHZ4VzMzaHdjbUEvY1hTTFliUlFYY28xcTdiZG5rVzVreFpBSUk5R0pI?=
 =?utf-8?B?QUJCNjJNcTNZaEtTVXVldWh3TERaZ1RnSFBTck5FME53bkJpbXhLQ01INEN6?=
 =?utf-8?B?QzRXSkV6c0I3MzNMdEY4T0lZaDNEdGN0cXJzTWFkMitlOEU0QUp4U2V3VmtX?=
 =?utf-8?B?N1BicmVTTnFqUGI4SDYvMVhicm5Ha3NJc043bXpuV1lyMmlDZS8zZWZQWVpO?=
 =?utf-8?B?S2VDbVNhYmwySEMyRjFCVENSOVJzaFBOWlA0ZkRHV0MzbWhQMldGZzlSSkpX?=
 =?utf-8?B?MUx3VEVMaTloa25zSHZjbkJvZk1XbTZYNXpROFlUdURwTVNwQ1dZRlMzOVN6?=
 =?utf-8?B?dWJOaEZPeHFLeDRSQW1NNEdNWDVmbjdrZHF0RGlwZHZJRkIyb0dTYkY5SThW?=
 =?utf-8?B?S3pReG9LdStYeWMwRWdGMnhxdFlYTnl0NVdhUEFJYlBLTncyQ01sZkhVWlRK?=
 =?utf-8?B?QmV6ZlJzN29rNFloUjY4MDhCZGpLZXFBeTRsbmQwRHdRdmtOUk5iVVVWMmxN?=
 =?utf-8?B?Sk1zLy8rTWY5YjJEcVdGU04vN3plSmo1bmg0MUZCNGlSM0lmL0hUa1hVeHl5?=
 =?utf-8?B?bXVRRmFmOFVrOFhSS1dHbXJ6blhjOXdqd2pRL293V2tvMjNMd0J5Ymo4ZGFG?=
 =?utf-8?B?RU8yNGZoSGJndVI0Rm9ySDY0b3VlbHBIYXR3MEFXUk11VFVqbXQvWUpDcjZP?=
 =?utf-8?B?eVpvM3o3VEFaalpRL21vcXVkQnV4Y3V6RWloWXNnZDAwdm04SUJ4TUtaRnlS?=
 =?utf-8?B?MmdyNmxFU2ttWEJiUmRxSUQ5N2J6MmpRMzZtUW1IVUhobGVvcC9xN1FaNlVk?=
 =?utf-8?B?aWYxSTFjUWw2a1VjWHViVnQ0U2NoMTkwTU9BS2c4YTBIQVpxeGg2N3g3TC9i?=
 =?utf-8?B?UGdjcUU2VVpEVlMzQS9vVXl1Qm40RHFjeksrN2lGd2p3enh4WHBNNGJhSThG?=
 =?utf-8?B?OUZyLytmZnFNcWRkNTNkRUloeXdZTlA0UmhRaktoT2puYUx5NndoZGxieTdQ?=
 =?utf-8?B?Y0lDWm5pa2g3TndxT1J5N3RWNUVrS1lVZUFPai9TeHdweDVWOEIyMGdhT0c5?=
 =?utf-8?B?QVk3cUFvL0l0V3hOcFkrWWthWmQ2NFp3Q1BPSjIyNExUaFZraWtaNzhYVUZN?=
 =?utf-8?B?T1lvTisyNHlLSGoxa1RiZDhRSGxOWURTRXYwZVRFcWphZnlNZVczZmp5TUl3?=
 =?utf-8?B?RG5jaDlhYzVVY0lnU0QvdnFXM0pGZElkNjMzQlJRQSthR2p0TWVpRC9WTlpu?=
 =?utf-8?B?M2dmV3FmZGhncEVOeU1ENHZwaGIrWFJoanFRaTlpU0Myd3dtdlVlWVFEMEVq?=
 =?utf-8?B?WmxXcTJWSk1qeTRSTm5HSXh4UUZ2V3ovZXJ2dzdWbE0yQnZjV2RqT2k0VUNT?=
 =?utf-8?B?cVRicDJzc3BmSVRDVWhvdGhRVzdOL0ZkTmdzUlhoZnFyOGY0YkVJcVUreXZX?=
 =?utf-8?B?QW9KaEtYSUFNdE1sdVpzOTR6T0xGYkNkRmRXTWtiUTlQR0o4cWVyVFhDWU1a?=
 =?utf-8?B?UjJtdm9tTWpWcmhZb1ZGVk9XVXdoYm9ObmhTN1pPeVZHNVBNQlR1ZnRJSEw3?=
 =?utf-8?B?WnhBQ1lPMHFSeGxvOXhwSklONUJCVElGcjRxMUpHZFhwWkQ1Zlorck9xcW83?=
 =?utf-8?Q?+hUKrdAyFVOYe0Uz3CMzBsKUvUR7qWa4AxoZPzNKbWTE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-37dd7.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6399.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3486ef-e4fd-432c-fb2c-08dc5d5f57ba
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 15:18:45.4864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9125

RGVhciBhbGwsDQpJIHdhbnQgdG8gc2V0IHVwIGEgc2ltcGxlIGJsdWV0b290aCBjb25uZWN0aW9u
IGJldHdlZW4gMiBQQ+KAmXMsIGNsaWVudCBydW5uaW5nIFdpbmRvd3MgYW5kIHNlcnZlciBydW5u
aW5nIExpbnV4Lg0KVGhlcmUgaXMgbm8gbmVlZCBmb3IgYSBsb3Qgb2Ygb3ZlcmhlYWQgc3VjaCBh
cyBwYWlyaW5nLg0KSSBhbSBydW5uaW5nIHRoZSBzZXJ2ZXIgc29mdHdhcmUgb24gTGludXggVWJ1
bnR1IHdpdGggdGhlIGZvbGxvd2luZyBjb2RlOg0KDQogIMKgIGludCBzZXJ2ZXJTb2NrZXQsIGNs
aWVudFNvY2tldDsNCsKgICAgc3RydWN0IHNvY2thZGRyX3JjIHNlcnZlckFkZHIgPSB7MH0sIGNs
aWVudEFkZHI9ezB9Ow0KDQogIMKgIHNvY2tsZW5fdCBjbGllbnRBZGRyU2l6ZSA9IHNpemVvZihz
b2NrYWRkcl9yYyk7DQoNCsKgICAgLy8gQ3JlYXRlIEJsdWV0b290aCBzb2NrZXQNCiAgwqAgc2Vy
dmVyU29ja2V0PXNvY2tldChBRl9CTFVFVE9PVEgsIFNPQ0tfU1RSRUFNLCBCVFBST1RPX1JGQ09N
TSk7DQrCoCAgIGlmIChzZXJ2ZXJTb2NrZXQ8MCkNCiAgwqAgew0KwqDCoCAgwqAgcGVycm9yKCJz
b2NrZXQgY3JlYXRpb24gZmFpbGVkOiAiKTsNCiAgwqDCoMKgIHJldHVybiBmYWxzZTsNCsKgICAg
fQ0KICDCoCBiZGFkZHJfdMKgIGJkYWRkcl9hbnk9e3swLDAsMCwwLDAsMH19Ow0KDQogIC8vIEJp
bmQgdGhlIHNvY2tldCB0byBhbnkgbG9jYWwgQmx1ZXRvb3RoIGFkYXB0ZXINCsKgICAgc2VydmVy
QWRkci5yY19mYW1pbHkgPSBBRl9CTFVFVE9PVEg7DQogIMKgIHNlcnZlckFkZHIucmNfYmRhZGRy
ID0gYmRhZGRyX2FueTsgLy8gYmluZCB0byBhbnkgbG9jYWwgQmx1ZXRvb3RoIGFkYXB0ZXINCsKg
ICAgc2VydmVyQWRkci5yY19jaGFubmVsID0gMjU7DQoNCiAgwqAgaWYgKGJpbmQoc2VydmVyU29j
a2V0LChzdHJ1Y3Qgc29ja2FkZHIqKSZzZXJ2ZXJBZGRyLHNpemVvZihzZXJ2ZXJBZGRyKSk8MCkN
CsKgICAgew0KwqDCoMKgICAgcGVycm9yKCJCaW5kIGZhaWxlZCIpOw0KICDCoMKgwqAgY2xvc2Uo
c2VydmVyU29ja2V0KTsNCsKgwqAgIMKgIGV4aXQoRVhJVF9GQUlMVVJFKTsNCiAgwqAgfQ0KDQrC
oCAgIC8vIGxpc3RlbiBmb3IgaW5jb21pbmcgY29ubmVjdGlvbnMNCiAgwqAgaWYgKGxpc3Rlbihz
ZXJ2ZXJTb2NrZXQsMSkgPDApDQrCoCAgIHsNCiAgwqDCoMKgIHBlcnJvcigiTGlzdGVuIGZhaWxl
ZCIpOw0KwqDCoCAgwqAgY2xvc2Uoc2VydmVyU29ja2V0KTsNCsKgwqDCoCAgIGV4aXQoRVhJVF9G
QUlMVVJFKTsNCiAgwqAgfTsNCg0KICDCoCB3aGlsZSAodHJ1ZSkNCiAgwqAgew0KwqDCoCAgwqAg
d3hQcmludGYoIldhaXRpbmcgZm9yIGluY29taW5nIEJsdWV0b290aCBjb25uZWN0aW9ucy4uLlxu
Iik7DQoNCsKgwqDCoCAgIC8vIEFjY2VwdCBpbmNvbWluZyBjb25uZWN0aW9uDQogIMKgwqDCoCBj
bGllbnRTb2NrZXQgPSBhY2NlcHQoc2VydmVyU29ja2V0LCAoc3RydWN0IHNvY2thZGRyKikgJmNs
aWVudEFkZHIsJmNsaWVudEFkZHJTaXplKTsNCsKgwqAgIMKgIGlmIChjbGllbnRTb2NrZXQ8MCkN
CsKgwqDCoCAgIHsNCiAgwqDCoMKgwqDCoCBwZXJyb3IoImFjY2VwdCBmYWlsZWQiKTsNCsKgwqAg
IMKgwqDCoCBjb250aW51ZTsNCsKgwqDCoCAgIH0NCg0KSSBhbSBydW5uaW5nIHRoZSBjbGllbnQg
c29mdHdhcmUgb24gV2luZG93cyAxMCB3aXRoIHRoZSBmb2xsb3dpbmcgY29kZToNCg0KwqDCoMKg
IC8vIENyZWF0ZSBhIEJsdWV0b290aCBzb2NrZXQNCiAgwqAgbV9zZXJ2ZXJTb2NrZXQgPSBzb2Nr
ZXQoQUZfQlRILCBTT0NLX1NUUkVBTSwgQlRIUFJPVE9fUkZDT01NKTsNCsKgICAgU09DS0FERFJf
QlRIIHNlcnZlckFkZHIgPSB7IDAgfTsNCiAgwqAgaWYgKG1fc2VydmVyU29ja2V0ID09IElOVkFM
SURfU09DS0VUKSB7DQogIMKgwqDCoCByZXR1cm4gZmFsc2U7DQrCoCAgIH0NCg0KwqAgICAvLyBT
ZXQgdGhlIGFkZHJlc3Mgb2YgdGhlIHJlbW90ZSBCbHVldG9vdGggZGV2aWNlIHRvIGNvbm5lY3Qg
dG8NCiAgwqAgc2VydmVyQWRkci5hZGRyZXNzRmFtaWx5ID0gQUZfQlRIOw0KwqAgICBzZXJ2ZXJB
ZGRyLmJ0QWRkciA9ICpyZWludGVycHJldF9jYXN0PEJUSF9BRERSKj4oJm1fU2VydmVyLkFkZHJl
c3MudWxsTG9uZyk7IC8vIHRoaXMgaXMgdGhlIGFkZHJlcyBmb3VuZCBieSBmdW5jdGlvbiBCbHVl
dG9vdGhGaW5kRmlyc3REZXZpY2UoKQ0KICDCoCBzZXJ2ZXJBZGRyLnNlcnZpY2VDbGFzc0lkID0g
UkZDT01NX1BST1RPQ09MX1VVSUQ7wqAgLy8gSSBhbHNvIHRyaWVkIEdVSURfTlVMTA0KwqAgICBz
ZXJ2ZXJBZGRyLnBvcnQgPSAyNTsgLy8gSSBhbHNvIHRyaWVkIDANCg0KICDCoCAvLyBDb25uZWN0
IHRvIHRoZSByZW1vdGUgQmx1ZXRvb3RoIGRldmljZQ0KwqAgICBpZiAoY29ubmVjdChtX3NlcnZl
clNvY2tldCwgcmVpbnRlcnByZXRfY2FzdDxTT0NLQUREUio+KCZzZXJ2ZXJBZGRyKSwgc2l6ZW9m
KHNlcnZlckFkZHIpKSA9PSBTT0NLRVRfRVJST1IpIHsNCiDCoMKgICDCoCBzdGQ6OmNvdXQgPDwg
ImVycm9yOiAiIDw8IFdTQUdlTGFzdEVycm9yKCkgPDwgc3RkOjplbmRsOw0KwqAgIMKgwqAgcmV0
dXJuIGZhbHNlOw0KICDCoCB9DQoNClRoZSBMaW51eCBzZXJ2ZXIgaXMgbGlzdGVuaW5nIG9uIHBv
cnQgMjUgd2hpbGUgdGhlIFdpbmRvd3MgY2xpZW50IHRyaWVzIHRvIGNvbm5lY3QgdG8gdGhlIHNh
bWUgcG9ydC4gVGhlIGNsaWVudCBmaXJzdCBzZWFyY2hlcyBmb3IgdGhlIHNlcnZlciB3aXRoIEJs
dWV0b290aEZpbmRGaXJzdERldmljZSBhbmQgQmx1ZXRvb3RoRmluZE5leHREZXZpY2UsIGZpbmRz
IHRoZSBzZXJ2ZXIgYmx1ZXRvb290aCBhZGRyZXNzIGFuZCB1c2VzIHRoYXQgYWRkcmVzcyB0byBj
b25uZWN0LiANClRoZSBjb25uZWN0aW9uIG9uIHRoZSBjbGllbnQgdGhlbiBmYWlscyB3aXRoIGVy
cm9yIGNvZGUgMTAwNTEgKG9yIHNvbWV0aW1lcyAxMDA2MCkNCg0KT24gTGludXggdGhlcmUgaXMg
bm8gZmlyZXdhbGwgaW5zdGFsbGVkLCB1c2luZyBibHVldG9vdGhjbHQgSSBzZWUgaXQgaXMgcmVn
aXN0ZXJlZCBhbmQgcGFpcmFibGUuIFRoZSBibHVldG9vdGggZG9uZ2xlIGlzIHBsdWdnZWQgaW50
byBhIFVTQiBwb3J0IGFuZCBpcyBzZWVuIGFzIFVTQjIuMC1CVC4gSSBoYXZlIHRyaWVkIGRpZmZl
cmVudCBwb3J0cyB3aXRob3V0IHN1Y2Nlc3MuDQoNCkkndmUgZG9uZSBzb21lIHRlc3Rpbmcgd2l0
aCBteSBjb2RlLiBJdCBzZWVtcyBibHVldG9vdGggaXMgd29ya2luZyB3ZWxsIHdpdGggY29kZSBh
Ym92ZSBpbiB0aGUgZm9sbG93aW5nIGNpcmN1bXN0YW5jZXMgOiANCi0gd2luZG93cyDihpIgd2lu
ZG93cw0KLSBsaW51eCDihpIgbGludXgNCi0gbGludXgg4oaSIHdpbmRvd3MNClRoZSBvbmx5IHRo
aW5nIHRoYXQgZG9lc24ndCB3b3JrIGlzOiB3aW5kb3dzIOKGkiBsaW51eA0KDQpJIGFtIHRvbGQg
dGhlIHByb2JsZW0gbGllcyBpbiB0aGUgQmx1ZVogbGlicmFyeSwgYnV0IEkgZmluZCB0aGlzIGhh
cmQgdG8gYmVsaWV2ZS4gTXkgZ3Vlc3NlcyBhcmUgSSBhbSBkb2luZyBzb21ldGhpbmcgd3Jvbmcu
DQoNCkFueSBoZWxwIGlzIG11Y2ggYXBwcmVjaWF0ZWQhDQoNCkJlc3QgcmVnYXJkcywNClBldGVy
DQo=

