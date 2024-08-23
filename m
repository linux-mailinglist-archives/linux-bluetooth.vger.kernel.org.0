Return-Path: <linux-bluetooth+bounces-6960-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 698E595C5EA
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Aug 2024 08:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBD2E1F235E7
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Aug 2024 06:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61C913A265;
	Fri, 23 Aug 2024 06:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="n40dgAVl"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp11.infineon.com (smtp11.infineon.com [217.10.52.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE98F748A;
	Fri, 23 Aug 2024 06:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724396324; cv=none; b=CH8J7axZRlQtQa3lwIx0TZcwOaXS1Jyvgc9VaOojR1Sj/7pBW1TTkGGuEJUZj9Cfcq5/IQ+7Qe6O05Uvh3lqR7jv7gDr3a3gYfz6ov0VT15TVvS4bvX/y7jpfdPh1hoUiMX7X0ywQphHMGhVOOCKoiPE4FkfqiSPD518Om1HPwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724396324; c=relaxed/simple;
	bh=N16u7qDOWjFotpEdoTYOfjQ9jdqyBYqPA4nJcmAhFOY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tRnEO4D7oZjBvsnBwcvF8HcYQPHxLwEK9SQWMPAsFuVFheZG26Mmdd7HUbLZ6Kc/S18mwGUGRzBalfavLN/NG0qyHKPTPpZpiNaYBflj2P0QHQYwICYm0seEh63yjhCxIl7el4Y9kW0Q4sme0H8HUeRroFOnPBsLjYL/Y7KBZWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=n40dgAVl; arc=none smtp.client-ip=217.10.52.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1724396323; x=1755932323;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=N16u7qDOWjFotpEdoTYOfjQ9jdqyBYqPA4nJcmAhFOY=;
  b=n40dgAVlx4LKQhNMj39d0trU2i1XYVHKrLb6c69Dy6Me0C/wkRmt8sXZ
   gHu3qqTOilZ1j4VH4TeO3Jog73wsQ+orwCQl8q30yxt/21l+x/8Fk24FQ
   nSh5YLpcjImQOoYaZx/JMz8oVbClTTBOmWf3mzdLqcWhS3pNOSXDoRa6q
   Y=;
X-CSE-ConnectionGUID: DUUElAuGQXa6+tOZDQoFkg==
X-CSE-MsgGUID: fzLvS1UDRaqvGzAjkBJK4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="67449402"
X-IronPort-AV: E=Sophos;i="6.10,169,1719871200"; 
   d="scan'208";a="67449402"
Received: from unknown (HELO MUCSE803.infineon.com) ([172.23.29.29])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 08:57:32 +0200
Received: from MUCSE835.infineon.com (172.23.7.107) by MUCSE803.infineon.com
 (172.23.29.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Fri, 23 Aug
 2024 08:57:31 +0200
Received: from MUCSE832.infineon.com (172.23.7.104) by MUCSE835.infineon.com
 (172.23.7.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Fri, 23 Aug
 2024 08:57:30 +0200
Received: from MUCSE832.infineon.com ([fe80::6918:9b7d:1c9c:3175]) by
 MUCSE832.infineon.com ([fe80::6918:9b7d:1c9c:3175%15]) with mapi id
 15.02.1258.034; Fri, 23 Aug 2024 08:57:30 +0200
From: <Nobuaki.Tsunashima@infineon.com>
To: <luiz.dentz@gmail.com>
CC: <marcel@holtmann.org>, <linux-bluetooth@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5] Bluetooth: btbcm: Apply
 HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER to CYW4373
Thread-Topic: [PATCH v5] Bluetooth: btbcm: Apply
 HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER to CYW4373
Thread-Index: AQHaznj9n/K9wMYANEyNMyvingl9f7HnOGUAgAAnxLCAJ4YJwIAlzfHA
Date: Fri, 23 Aug 2024 06:57:30 +0000
Message-ID: <129fadc882ef435fab8426b7eca72486@infineon.com>
References: <20240705011525.402650-1-nobuaki.tsunashima@infineon.com>
 <CABBYNZLo2P5VLFJ0XahNyh8CeOAA6rg1WTWpMx3WRqhYby3uOQ@mail.gmail.com>
 <eb261ca4a0fd4e91900b1359c9923b1d@infineon.com>
 <fffdb002acce460c82b587f83e182860@infineon.com>
In-Reply-To: <fffdb002acce460c82b587f83e182860@infineon.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgTHVpeiwNCg0KTGV0IG1lIHJlZnJhaW4gbXkgcXVlc3Rpb24gYmVsb3cuDQoNCkFzIHlvdSBw
cm9wb3NlZCB0byBzaG9ydGVuIGEgdGFibGUgbmFtZSwgImRpc2FibGVfYnJva2VuX3JlYWRfdHJh
bnNtaXRfcG93ZXJfYnlfY2hpcF92ZXIiLA0KYWRkZWQgaW4gbXkgcGF0Y2gsIHdlIG1heSBiZSBi
ZXR0ZXIgdG8gc2hvcnRlbiBhbm90aGVyIHRhYmxlIG5hbWUsIA0KIiBkaXNhYmxlX2Jyb2tlbl9y
ZWFkX3RyYW5zbWl0X3Bvd2VyIiwgdGhhdCB0aGUgZXhpc3RpbmcgY29kZSBhbHJlYWR5IGhhcy4N
Cg0KU28sIG15IHByb3Bvc2FsIGlzIHRvIGNoYW5nZSBib3RoIG5hbWVzIGFzIGJlbG93Lg0KDQox
KSBGcm9tICIgZGlzYWJsZV9icm9rZW5fcmVhZF90cmFuc21pdF9wb3dlciIgdG8gImJyb2tlbl9y
ZWFkX3R4X3Bvd2VyX2RtaSINCjIpIEZyb20gIiBkaXNhYmxlX2Jyb2tlbl9yZWFkX3RyYW5zbWl0
X3Bvd2VyX2J5X2NoaXBfdmVyICIgdG8gIiBicm9rZW5fcmVhZF90eF9wb3dlcl9jaGlwX3ZlciIN
Cg0KRG9lcyBpdCBtYWtlIHNlbnNlPw0KDQpCZXN0IFJlZ2FyZHMsDQpOb2J1YWtpIFRzdW5hc2hp
bWENCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFRzdW5hc2hpbWEgTm9idWFr
aSAoU01EIEMzIEpQIFJNIFdMUyBBRSkgDQpTZW50OiBUdWVzZGF5LCBKdWx5IDMwLCAyMDI0IDI6
MzIgUE0NClRvOiAnTHVpeiBBdWd1c3RvIHZvbiBEZW50eicgPGx1aXouZGVudHpAZ21haWwuY29t
Pg0KQ2M6ICdNYXJjZWwgSG9sdG1hbm4nIDxtYXJjZWxAaG9sdG1hbm4ub3JnPjsgJ2xpbnV4LWJs
dWV0b290aEB2Z2VyLmtlcm5lbC5vcmcnIDxsaW51eC1ibHVldG9vdGhAdmdlci5rZXJuZWwub3Jn
PjsgJ2xpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcnIDxsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnPg0KU3ViamVjdDogUkU6IFtQQVRDSCB2NV0gQmx1ZXRvb3RoOiBidGJjbTogQXBwbHkg
SENJX1FVSVJLX0JST0tFTl9SRUFEX1RSQU5TTUlUX1BPV0VSIHRvIENZVzQzNzMNCg0KSGVsbG8s
DQoNClBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGVyZSBhcmUgYW55IGFkZGl0aW9uYWwgYWN0aW9u
cyBuZWVkZWQgZnJvbSBteSBlbmQgdG8gZmFjaWxpdGF0ZSBwcm9ncmVzcyBvbiB0aGlzIHBhdGNo
Lg0KRG8geW91IGxpa2UgdG8gc2hvcnRlbiBuYW1lcyBvZiBvcmlnaW5hbCBhbmQgbmV3bHkgYWRk
ZWQgdGFibGVzPw0KWW91ciBmZWVkYmFjayB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkLg0K
DQpUaGFuayB5b3UgZm9yIHlvdXIgYXR0ZW50aW9uIHRvIHRoaXMgbWF0dGVyLg0KDQpCZXN0IFJl
Z2FyZHMsDQpOb2J1YWtpIFRzdW5hc2hpbWENCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IFRzdW5hc2hpbWEgTm9idWFraSAoU01EIEMzIEpQIFJNIFdMUyBBRSkNClNlbnQ6IEZy
aWRheSwgSnVseSA1LCAyMDI0IDExOjA3IEFNDQpUbzogJ0x1aXogQXVndXN0byB2b24gRGVudHon
IDxsdWl6LmRlbnR6QGdtYWlsLmNvbT4NCkNjOiBNYXJjZWwgSG9sdG1hbm4gPG1hcmNlbEBob2x0
bWFubi5vcmc+OyBsaW51eC1ibHVldG9vdGhAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnDQpTdWJqZWN0OiBSRTogW1BBVENIIHY1XSBCbHVldG9vdGg6IGJ0YmNt
OiBBcHBseSBIQ0lfUVVJUktfQlJPS0VOX1JFQURfVFJBTlNNSVRfUE9XRVIgdG8gQ1lXNDM3Mw0K
DQpIaSBMdWl6LA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudC4NCg0KPj4gKyNkZWZpbmUgQkNN
X1JPTUZXX0JBU0VMSU5FX05VTSAweEZGRkYgc3RhdGljIGNvbnN0IHN0cnVjdCANCj4+ICtiY21f
Y2hpcF92ZXJzaW9uX3RhYmxlIGRpc2FibGVfYnJva2VuX3JlYWRfdHJhbnNtaXRfcG93ZXJfYnlf
Y2hpcF92ZXJbXSA9IHsNCj4+ICsgICAgICAgeyAweDg3LCBCQ01fUk9NRldfQkFTRUxJTkVfTlVN
IH0gICAgICAgICAgICAgICAgLyogQ1lXNDM3My80MzczRSAqLw0KPj4gK307DQo+DQo+IENhbiB3
ZSBoYXZlIGEgbGl0dGxlIGxlc3MgdmVyYm9zZSBuYW1lcz8gZS5nLiBicm9rZW5fcmVhZF90eF9w
b3dlciBhbmQgYnRiY21fYnJva2VuX3JlYWRfdHhfcG93ZXIgc291bmRzIGEgbG90IGJldHRlciBp
bW8uDQoNCldlIGFscmVhZHkgaGF2ZSBhIHRhYmxlIG5hbWVkICJkaXNhYmxlX2Jyb2tlbl9yZWFk
X3RyYW5zbWl0X3Bvd2VyIiBhcyBiZWxvdy4NCg0KPiBzdGF0aWMgY29uc3Qgc3RydWN0IGRtaV9z
eXN0ZW1faWQgZGlzYWJsZV9icm9rZW5fcmVhZF90cmFuc21pdF9wb3dlcltdID0gew0KPgl7DQo+
CQkgLm1hdGNoZXMgPSB7DQo+CQkJRE1JX01BVENIKERNSV9CT0FSRF9WRU5ET1IsICJBcHBsZSBJ
bmMuIiksDQo+CQkJRE1JX01BVENIKERNSV9QUk9EVUNUX05BTUUsICJNYWNCb29rUHJvMTYsMSIp
LA0KPgkJfSwNCj4JfSwNCg0KU28sIGFzIG15IG5ldyB0YWJsZSBpcyBzYW1lIHJvbGUgb2YgdGhl
IG9yaWdpbmFsIHRhYmxlIGJ1dCByZWZlcnJpbmcgY2hpcCB2ZXJzaW9uLCBJIHRoaW5rIHRoZSBu
YW1lIGlzIHN0cmFpZ2h0IGZvcndhcmQuDQoNCk9yLCB3ZSBtYXkgc2hvcnRlbiBuYW1lIG9mIHRo
ZSBvcmlnaW5hbCB0YWJsZSBhcyB3ZWxsIGxpa2UgYmVsb3cuIERvIHlvdSBsaWtlIGl0Pw0KDQpP
cmlnaW5hbCB0YWJsZQ0Kc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGJyb2tlbl9y
ZWFkX3R4X3Bvd2VyX2RtaVtdIA0KDQpOZXcgdGFibGUNCnN0YXRpYyBjb25zdCBzdHJ1YyBiY21f
Y2hpcF92ZXJzaW9uX3RhYmxlIGJyb2tlbl9yZWFkX3R4X3Bvd2VyX2NoaXBfdmVyW10NCg0KQmVz
dCBSZWdhcmRzLA0KTm9idWFraSBUc3VuYXNoaW1hDQoNCi0tDQotLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IEx1aXogQXVndXN0byB2b24gRGVudHogPGx1aXouZGVudHpAZ21haWwuY29t
Pg0KU2VudDogRnJpZGF5LCBKdWx5IDUsIDIwMjQgMTA6MzQgQU0NClRvOiBUc3VuYXNoaW1hIE5v
YnVha2kgKFNNRCBDMyBKUCBSTSBXTFMgQUUpIDxOb2J1YWtpLlRzdW5hc2hpbWFAaW5maW5lb24u
Y29tPg0KQ2M6IE1hcmNlbCBIb2x0bWFubiA8bWFyY2VsQGhvbHRtYW5uLm9yZz47IGxpbnV4LWJs
dWV0b290aEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNClN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjVdIEJsdWV0b290aDogYnRiY206IEFwcGx5IEhDSV9RVUlSS19C
Uk9LRU5fUkVBRF9UUkFOU01JVF9QT1dFUiB0byBDWVc0MzczDQoNCkNhdXRpb246IFRoaXMgZS1t
YWlsIG9yaWdpbmF0ZWQgb3V0c2lkZSBJbmZpbmVvbiBUZWNobm9sb2dpZXMuIFBsZWFzZSBiZSBj
YXV0aW91cyB3aGVuIHNoYXJpbmcgaW5mb3JtYXRpb24gb3Igb3BlbmluZyBhdHRhY2htZW50cyBl
c3BlY2lhbGx5IGZyb20gdW5rbm93biBzZW5kZXJzLiBSZWZlciB0byBvdXIgaW50cmFuZXQgZ3Vp
ZGU8aHR0cHM6Ly9pbnRyYW5ldC1jb250ZW50LmluZmluZW9uLmNvbS9leHBsb3JlL2Fib3V0aW5m
aW5lb24vcnVsZXMvaW5mb3JtYXRpb25zZWN1cml0eS91Zy9Tb2NpYWxFbmdpbmVlcmluZy9QYWdl
cy9Tb2NpYWxFbmdpbmVlcmluZ0VsZW1lbnRzX2VuLmFzcHg+IHRvIGhlbHAgeW91IGlkZW50aWZ5
IFBoaXNoaW5nIGVtYWlsLg0KDQoNCg0KSGkgTm9idWFraSwNCg0KT24gVGh1LCBKdWwgNCwgMjAy
NCBhdCA5OjE24oCvUE0gTm9idWFraSBUc3VuYXNoaW1hIDxub2J1YWtpLnRzdW5hc2hpbWFAaW5m
aW5lb24uY29tPiB3cm90ZToNCj4NCj4gRnJvbTogTm9idWFraSBUc3VuYXNoaW1hIDxOb2J1YWtp
LlRzdW5hc2hpbWFAaW5maW5lb24uY29tPg0KPg0KPiBDWVc0MzczIFJPTSBGVyBoYXMgYW4gaXNz
dWUgdGhhdCBpdCBjbGFpbXMgTEVfUmVhZF9UcmFuc21pdF9Qb3dlciANCj4gY29tbWFuZCBhcyBz
dXBwb3J0ZWQgaW4gYSByZXNwb25zZSBvZiBSZWFkX0xvY2FsX1N1cHBvcnRlZF9Db21tYW5kIA0K
PiBjb21tYW5kIGJ1dCByZWplY3RzIHRoZSBMRV9SZWFkX1RyYW5zbWl0X1Bvd2VyIGNvbW1hbmQg
d2l0aCAiVW5rbm93biBIQ0kgQ29tbWFuZCINCj4gc3RhdHVzLiBCZWNhdXNlIEJsdWV0b290aCBk
cml2ZXIgb2Yga2VybmVsIDUuMTEgYWRkZWQgc2VuZGluZyB0aGUgDQo+IExFX1JlYWRfVHJhbnNt
aXRfUG93ZXIgY29tbWFuZCBpbiBpbml0aWFsaXplIHBoYXNlLCBoY2kgdXAgZmFpbHMgZHVlIA0K
PiB0byB0aGUgaXNzdWUuDQo+DQo+IEVzcGVjaWFsbHkgaW4gVVNCIGkvZiBjYXNlLCBpdCB3b3Vs
ZCBiZSBkaWZmaWN1bHQgdG8gZG93bmxvYWQgcGF0Y2ggRlcgDQo+IHRoYXQgaW5jbHVkZXMgaXRz
IGZpeCB1bmxlc3MgaGNpIGlzIHVwLg0KPg0KPiBUaGUgZHJpdmVyIGFscmVhZHkgY29udGFpbnMg
aW5mcmFzdHJ1Y3R1cmUgdG8gYXBwbHkgdGhlIHF1aXJrIGZvciB0aGUgDQo+IGlzc3VlLCBidXQg
Y3VycmVudGx5IGl0IG9ubHkgc3VwcG9ydHMgRE1JIGJhc2VkIG1hdGNoaW5nLiBBZGQgc3VwcG9y
dCANCj4gdG8gbWF0Y2ggYnkgY2hpcCBpZCBhbmQgYmFzZWxpbmUgRlcgdmVyc2lvbiB0byBkZXRl
Y3QgQ1lXNDM3MyBST00gRlcgDQo+IGJ1aWxkIGluIGdlbmVyaWMgc3lzdGVtLg0KPg0KPiBGaXhl
czogN2MzOTVlYTUyMWU2ICgiQmx1ZXRvb3RoOiBRdWVyeSBMRSB0eCBwb3dlciBvbiBzdGFydHVw
IikNCj4gU2lnbmVkLW9mZi1ieTogTm9idWFraSBUc3VuYXNoaW1hIDxOb2J1YWtpLlRzdW5hc2hp
bWFAaW5maW5lb24uY29tPg0KPiAtLS0NCj4gVjQgLT4gVjU6IFVzZSBza2JfcHVsbF9kYXRhKCkg
dG8gYWNjZXNzIHNrYi0+ZGF0YSBhcyBzYWZlciBtYW5uZXIuDQo+IFYzIC0+IFY0OiBGaXggYSBm
ZXcgY29kaW5nIHN0eWxlIHdhcm5pbmdzIGFuZCByZWZpbmUgY29tbWVudHMgZm9yIGNsYXJpZnku
DQo+IFYyIC0+IFYzOiBGaXggYSBmZXcgY29kaW5nIHN0eWxlIHdhcm5pbmdzIGFuZCBjaGFuZ2Ug
dGhlIHN1YmplY3QgYXMgbW9yZSBzcGVjaWZpYy4NCj4gVjEgLT4gVjI6IEZpeCBzZXZlcmFsIGNv
ZGluZyBzdHlsZSB3YXJuaW5ncy4NCj4NCj4gIGRyaXZlcnMvYmx1ZXRvb3RoL2J0YmNtLmMgfCA0
MQ0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4gIGRyaXZlcnMv
Ymx1ZXRvb3RoL2J0dXNiLmMgfCAgNCArKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQzIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2JsdWV0
b290aC9idGJjbS5jIGIvZHJpdmVycy9ibHVldG9vdGgvYnRiY20uYyANCj4gaW5kZXggMGE1NDQ1
YWM1ZTFiLi5kZDcyNjJhOGRjOGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0
YmNtLmMNCj4gKysrIGIvZHJpdmVycy9ibHVldG9vdGgvYnRiY20uYw0KPiBAQCAtNDM3LDE2ICs0
MzcsNTMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGRpc2FibGVfYnJva2Vu
X3JlYWRfdHJhbnNtaXRfcG93ZXJbXSA9IHsNCj4gICAgICAgICB7IH0NCj4gIH07DQo+DQo+ICtz
dHJ1Y3QgYmNtX2NoaXBfdmVyc2lvbl90YWJsZSB7DQo+ICsgICAgICAgdTggY2hpcF9pZDsgICAg
ICAgICAgICAgICAgICAgICAvKiBDaGlwIElEICovDQo+ICsgICAgICAgdTE2IGJhc2VsaW5lOyAg
ICAgICAgICAgLyogQmFzZWxpbmUgdmVyc2lvbiBvZiBwYXRjaCBGVyAqLw0KPiArfTsNCj4gKyNk
ZWZpbmUgQkNNX1JPTUZXX0JBU0VMSU5FX05VTSAweEZGRkYgc3RhdGljIGNvbnN0IHN0cnVjdCAN
Cj4gK2JjbV9jaGlwX3ZlcnNpb25fdGFibGUgZGlzYWJsZV9icm9rZW5fcmVhZF90cmFuc21pdF9w
b3dlcl9ieV9jaGlwX3ZlcltdID0gew0KPiArICAgICAgIHsgMHg4NywgQkNNX1JPTUZXX0JBU0VM
SU5FX05VTSB9ICAgICAgICAgICAgICAgIC8qIENZVzQzNzMvNDM3M0UgKi8NCj4gK307DQoNCkNh
biB3ZSBoYXZlIGEgbGl0dGxlIGxlc3MgdmVyYm9zZSBuYW1lcz8gZS5nLiBicm9rZW5fcmVhZF90
eF9wb3dlciBhbmQgYnRiY21fYnJva2VuX3JlYWRfdHhfcG93ZXIgc291bmRzIGEgbG90IGJldHRl
ciBpbW8uDQoNCj4gK3N0YXRpYyBib29sIGJ0YmNtX2lzX2Rpc2FibGVfYnJva2VuX3JlYWRfdHhf
cG93ZXJfYnlfY2hpcF92ZXIodTgNCj4gK2NoaXBfaWQsIHUxNiBiYXNlbGluZSkgew0KPiArICAg
ICAgIGludCBpOw0KPiArICAgICAgIHNpemVfdCB0YWJsZV9zaXplID0gQVJSQVlfU0laRShkaXNh
YmxlX2Jyb2tlbl9yZWFkX3RyYW5zbWl0X3Bvd2VyX2J5X2NoaXBfdmVyKTsNCj4gKyAgICAgICBj
b25zdCBzdHJ1Y3QgYmNtX2NoaXBfdmVyc2lvbl90YWJsZSAqZW50cnkgPQ0KPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gKyZkaXNhYmxlX2Jyb2tl
bl9yZWFkX3RyYW5zbWl0X3Bvd2VyX2J5X2NoaXBfdmVyWzBdOw0KPiArDQo+ICsgICAgICAgZm9y
IChpID0gMCA7IGkgPCB0YWJsZV9zaXplIDsgaSsrLCBlbnRyeSsrKSAgICAgew0KPiArICAgICAg
ICAgICAgICAgaWYgKChjaGlwX2lkID09IGVudHJ5LT5jaGlwX2lkKSAmJiAoYmFzZWxpbmUgPT0g
ZW50cnktPmJhc2VsaW5lKSkNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7
DQo+ICsgICAgICAgfQ0KPiArDQo+ICsgICAgICAgcmV0dXJuIGZhbHNlOw0KPiArfQ0KPiArDQo+
ICBzdGF0aWMgaW50IGJ0YmNtX3JlYWRfaW5mbyhzdHJ1Y3QgaGNpX2RldiAqaGRldikgIHsNCj4g
ICAgICAgICBzdHJ1Y3Qgc2tfYnVmZiAqc2tiOw0KPiArICAgICAgIHU4ICpjaGlwX2lkOw0KPiAr
ICAgICAgIHUxNiAqYmFzZWxpbmU7DQo+DQo+ICAgICAgICAgLyogUmVhZCBWZXJib3NlIENvbmZp
ZyBWZXJzaW9uIEluZm8gKi8NCj4gICAgICAgICBza2IgPSBidGJjbV9yZWFkX3ZlcmJvc2VfY29u
ZmlnKGhkZXYpOw0KPiAgICAgICAgIGlmIChJU19FUlIoc2tiKSkNCj4gICAgICAgICAgICAgICAg
IHJldHVybiBQVFJfRVJSKHNrYik7DQo+IC0NCj4gLSAgICAgICBidF9kZXZfaW5mbyhoZGV2LCAi
QkNNOiBjaGlwIGlkICV1Iiwgc2tiLT5kYXRhWzFdKTsNCj4gKyAgICAgICBza2JfcHVsbF9kYXRh
KHNrYiwgMSk7DQo+ICsgICAgICAgY2hpcF9pZCA9IHNrYl9wdWxsX2RhdGEoc2tiLCBzaXplb2Yo
KmNoaXBfaWQpKTsNCj4gKyAgICAgICBza2JfcHVsbF9kYXRhKHNrYiwgMSk7DQo+ICsgICAgICAg
YmFzZWxpbmUgPSBza2JfcHVsbF9kYXRhKHNrYiwgc2l6ZW9mKCpiYXNlbGluZSkpOw0KPiArDQo+
ICsgICAgICAgaWYgKGNoaXBfaWQpIHsNCj4gKyAgICAgICAgICAgICAgIGJ0X2Rldl9pbmZvKGhk
ZXYsICJCQ006IGNoaXAgaWQgJXUiLCAqY2hpcF9pZCk7DQo+ICsNCj4gKyAgICAgICAgICAgICAg
IGlmIChiYXNlbGluZSkgew0KPiArICAgICAgICAgICAgICAgICAgICAgICAvKiBDaGVjayBDaGlw
IElEIGFuZCBkaXNhYmxlIGJyb2tlbiBSZWFkIExFIE1pbi9NYXggVHggUG93ZXIgKi8NCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKGJ0YmNtX2lzX2Rpc2FibGVfYnJva2VuX3JlYWRfdHhf
cG93ZXJfYnlfY2hpcF92ZXIoKmNoaXBfaWQsICpiYXNlbGluZSkpDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc2V0X2JpdChIQ0lfUVVJUktfQlJPS0VOX1JFQURfVFJBTlNNSVRf
UE9XRVIsICZoZGV2LT5xdWlya3MpOw0KPiArICAgICAgICAgICAgICAgfQ0KPiArICAgICAgIH0N
Cj4gICAgICAgICBrZnJlZV9za2Ioc2tiKTsNCj4NCj4gICAgICAgICByZXR1cm4gMDsNCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0dXNiLmMgYi9kcml2ZXJzL2JsdWV0b290aC9i
dHVzYi5jIA0KPiBpbmRleCBkMzFlZGFkN2EwNTYuLjUyNTYxYzhkODgyOCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ibHVldG9vdGgvYnR1c2IuYw0KPiArKysgYi9kcml2ZXJzL2JsdWV0b290aC9i
dHVzYi5jDQo+IEBAIC0xNDIsNiArMTQyLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2Rl
dmljZV9pZCBidHVzYl90YWJsZVtdID0gew0KPiAgICAgICAgIHsgVVNCX1ZFTkRPUl9BTkRfSU5U
RVJGQUNFX0lORk8oMHgwNGNhLCAweGZmLCAweDAxLCAweDAxKSwNCj4gICAgICAgICAgIC5kcml2
ZXJfaW5mbyA9IEJUVVNCX0JDTV9QQVRDSFJBTSB9LA0KPg0KPiArICAgICAgIC8qIEN5cHJlc3Mg
ZGV2aWNlcyB3aXRoIHZlbmRvciBzcGVjaWZpYyBpZCAqLw0KPiArICAgICAgIHsgVVNCX1ZFTkRP
Ul9BTkRfSU5URVJGQUNFX0lORk8oMHgwNGI0LCAweGZmLCAweDAxLCAweDAxKSwNCj4gKyAgICAg
ICAgIC5kcml2ZXJfaW5mbyA9IEJUVVNCX0JDTV9QQVRDSFJBTSB9LA0KPiArDQo+ICAgICAgICAg
LyogQnJvYWRjb20gZGV2aWNlcyB3aXRoIHZlbmRvciBzcGVjaWZpYyBpZCAqLw0KPiAgICAgICAg
IHsgVVNCX1ZFTkRPUl9BTkRfSU5URVJGQUNFX0lORk8oMHgwYTVjLCAweGZmLCAweDAxLCAweDAx
KSwNCj4gICAgICAgICAgIC5kcml2ZXJfaW5mbyA9IEJUVVNCX0JDTV9QQVRDSFJBTSB9LA0KPiAt
LQ0KPiAyLjI1LjENCj4NCg0KDQotLQ0KTHVpeiBBdWd1c3RvIHZvbiBEZW50eg0K

