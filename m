Return-Path: <linux-bluetooth+bounces-6502-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE0E9407A6
	for <lists+linux-bluetooth@lfdr.de>; Tue, 30 Jul 2024 07:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BECEBB22B1C
	for <lists+linux-bluetooth@lfdr.de>; Tue, 30 Jul 2024 05:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B99145B3E;
	Tue, 30 Jul 2024 05:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="Omrv4FR/"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp14.infineon.com (smtp14.infineon.com [217.10.52.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FF233D5;
	Tue, 30 Jul 2024 05:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722317612; cv=none; b=s15Z+xfgKtp17yQEkjHdpz3p/LZq1678aznfzQd78orkCXKzoz34ldMoRYrBgBTFavNO6nZV6N8r/aZw8yhwK/5KAKrAIDHoC9rWtpZFGxMl7jCWM0R5Ggqy7YglxJ7hafn/cg5vnpclBB790Yw0y0/4FJ+eKvE+9mTBnUcUPIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722317612; c=relaxed/simple;
	bh=mfrU/3rYClKdMX6f1BiatEydT3zyDFgafKqGGnbsN8Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XfuXc8Q2V0zFB2CKT/ePNJZbuj7p6mC0S/yxl/Gs1jGfuv+iB7nG4rpVvONRVFC17o6Y2kwLIsNBpYunhFPqSUaQcjlJS1m3kFWKdoyMoALDvhmGcMRu06YTCuz9ntjZcggvinc3XqoKF7n83dG4fGVm+TJqiTD4gQlfoA8vA24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=Omrv4FR/; arc=none smtp.client-ip=217.10.52.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1722317610; x=1753853610;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mfrU/3rYClKdMX6f1BiatEydT3zyDFgafKqGGnbsN8Y=;
  b=Omrv4FR/vnVpLJ6yFOK4WxH6+wqEC+FAAWD36WxKrY/VwzTdHRt4g8nw
   pM0a0035Nvj/sJj+qzGliYS37w+N6NyoH1GPZplOqcgttVCsX2q8Y8psL
   j+vHjO3IvUP8oY26F5n1K9cTvrUeS4x50lMCC+7i9kyto0jGRkttSeX0I
   M=;
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="57582827"
X-IronPort-AV: E=Sophos;i="6.09,247,1716242400"; 
   d="scan'208";a="57582827"
Received: from unknown (HELO MUCSE803.infineon.com) ([172.23.29.29])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 07:32:19 +0200
Received: from MUCSE835.infineon.com (172.23.7.107) by MUCSE803.infineon.com
 (172.23.29.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 30 Jul
 2024 07:32:19 +0200
Received: from MUCSE832.infineon.com (172.23.7.104) by MUCSE835.infineon.com
 (172.23.7.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 30 Jul
 2024 07:32:18 +0200
Received: from MUCSE832.infineon.com ([fe80::6918:9b7d:1c9c:3175]) by
 MUCSE832.infineon.com ([fe80::6918:9b7d:1c9c:3175%15]) with mapi id
 15.02.1258.034; Tue, 30 Jul 2024 07:32:18 +0200
From: <Nobuaki.Tsunashima@infineon.com>
To: <luiz.dentz@gmail.com>
CC: <marcel@holtmann.org>, <linux-bluetooth@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5] Bluetooth: btbcm: Apply
 HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER to CYW4373
Thread-Topic: [PATCH v5] Bluetooth: btbcm: Apply
 HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER to CYW4373
Thread-Index: AQHaznj9n/K9wMYANEyNMyvingl9f7HnOGUAgAAnxLCAJ4YJwA==
Date: Tue, 30 Jul 2024 05:32:18 +0000
Message-ID: <fffdb002acce460c82b587f83e182860@infineon.com>
References: <20240705011525.402650-1-nobuaki.tsunashima@infineon.com>
 <CABBYNZLo2P5VLFJ0XahNyh8CeOAA6rg1WTWpMx3WRqhYby3uOQ@mail.gmail.com>
 <eb261ca4a0fd4e91900b1359c9923b1d@infineon.com>
In-Reply-To: <eb261ca4a0fd4e91900b1359c9923b1d@infineon.com>
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

SGVsbG8sDQoNClBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGVyZSBhcmUgYW55IGFkZGl0aW9uYWwg
YWN0aW9ucyBuZWVkZWQgZnJvbSBteSBlbmQgdG8gZmFjaWxpdGF0ZSBwcm9ncmVzcyBvbiB0aGlz
IHBhdGNoLg0KRG8geW91IGxpa2UgdG8gc2hvcnRlbiBuYW1lcyBvZiBvcmlnaW5hbCBhbmQgbmV3
bHkgYWRkZWQgdGFibGVzPw0KWW91ciBmZWVkYmFjayB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lh
dGVkLg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgYXR0ZW50aW9uIHRvIHRoaXMgbWF0dGVyLg0KDQpC
ZXN0IFJlZ2FyZHMsDQpOb2J1YWtpIFRzdW5hc2hpbWENCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IFRzdW5hc2hpbWEgTm9idWFraSAoU01EIEMzIEpQIFJNIFdMUyBBRSkgDQpT
ZW50OiBGcmlkYXksIEp1bHkgNSwgMjAyNCAxMTowNyBBTQ0KVG86ICdMdWl6IEF1Z3VzdG8gdm9u
IERlbnR6JyA8bHVpei5kZW50ekBnbWFpbC5jb20+DQpDYzogTWFyY2VsIEhvbHRtYW5uIDxtYXJj
ZWxAaG9sdG1hbm4ub3JnPjsgbGludXgtYmx1ZXRvb3RoQHZnZXIua2VybmVsLm9yZzsgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogUkU6IFtQQVRDSCB2NV0gQmx1ZXRvb3Ro
OiBidGJjbTogQXBwbHkgSENJX1FVSVJLX0JST0tFTl9SRUFEX1RSQU5TTUlUX1BPV0VSIHRvIENZ
VzQzNzMNCg0KSGkgTHVpeiwNCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnQuDQoNCj4+ICsjZGVm
aW5lIEJDTV9ST01GV19CQVNFTElORV9OVU0gMHhGRkZGIHN0YXRpYyBjb25zdCBzdHJ1Y3QgDQo+
PiArYmNtX2NoaXBfdmVyc2lvbl90YWJsZSBkaXNhYmxlX2Jyb2tlbl9yZWFkX3RyYW5zbWl0X3Bv
d2VyX2J5X2NoaXBfdmVyW10gPSB7DQo+PiArICAgICAgIHsgMHg4NywgQkNNX1JPTUZXX0JBU0VM
SU5FX05VTSB9ICAgICAgICAgICAgICAgIC8qIENZVzQzNzMvNDM3M0UgKi8NCj4+ICt9Ow0KPg0K
PiBDYW4gd2UgaGF2ZSBhIGxpdHRsZSBsZXNzIHZlcmJvc2UgbmFtZXM/IGUuZy4gYnJva2VuX3Jl
YWRfdHhfcG93ZXIgYW5kIGJ0YmNtX2Jyb2tlbl9yZWFkX3R4X3Bvd2VyIHNvdW5kcyBhIGxvdCBi
ZXR0ZXIgaW1vLg0KDQpXZSBhbHJlYWR5IGhhdmUgYSB0YWJsZSBuYW1lZCAiZGlzYWJsZV9icm9r
ZW5fcmVhZF90cmFuc21pdF9wb3dlciIgYXMgYmVsb3cuDQoNCj4gc3RhdGljIGNvbnN0IHN0cnVj
dCBkbWlfc3lzdGVtX2lkIGRpc2FibGVfYnJva2VuX3JlYWRfdHJhbnNtaXRfcG93ZXJbXSA9IHsN
Cj4Jew0KPgkJIC5tYXRjaGVzID0gew0KPgkJCURNSV9NQVRDSChETUlfQk9BUkRfVkVORE9SLCAi
QXBwbGUgSW5jLiIpLA0KPgkJCURNSV9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiTWFjQm9va1By
bzE2LDEiKSwNCj4JCX0sDQo+CX0sDQoNClNvLCBhcyBteSBuZXcgdGFibGUgaXMgc2FtZSByb2xl
IG9mIHRoZSBvcmlnaW5hbCB0YWJsZSBidXQgcmVmZXJyaW5nIGNoaXAgdmVyc2lvbiwgSSB0aGlu
ayB0aGUgbmFtZSBpcyBzdHJhaWdodCBmb3J3YXJkLg0KDQpPciwgd2UgbWF5IHNob3J0ZW4gbmFt
ZSBvZiB0aGUgb3JpZ2luYWwgdGFibGUgYXMgd2VsbCBsaWtlIGJlbG93LiBEbyB5b3UgbGlrZSBp
dD8NCg0KT3JpZ2luYWwgdGFibGUNCnN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCBi
cm9rZW5fcmVhZF90eF9wb3dlcl9kbWlbXSANCg0KTmV3IHRhYmxlDQpzdGF0aWMgY29uc3Qgc3Ry
dWMgYmNtX2NoaXBfdmVyc2lvbl90YWJsZSBicm9rZW5fcmVhZF90eF9wb3dlcl9jaGlwX3Zlcltd
DQoNCkJlc3QgUmVnYXJkcywNCk5vYnVha2kgVHN1bmFzaGltYQ0KDQotLQ0KLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBMdWl6IEF1Z3VzdG8gdm9uIERlbnR6IDxsdWl6LmRlbnR6QGdt
YWlsLmNvbT4NClNlbnQ6IEZyaWRheSwgSnVseSA1LCAyMDI0IDEwOjM0IEFNDQpUbzogVHN1bmFz
aGltYSBOb2J1YWtpIChTTUQgQzMgSlAgUk0gV0xTIEFFKSA8Tm9idWFraS5Uc3VuYXNoaW1hQGlu
ZmluZW9uLmNvbT4NCkNjOiBNYXJjZWwgSG9sdG1hbm4gPG1hcmNlbEBob2x0bWFubi5vcmc+OyBs
aW51eC1ibHVldG9vdGhAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIHY1XSBCbHVldG9vdGg6IGJ0YmNtOiBBcHBseSBIQ0lf
UVVJUktfQlJPS0VOX1JFQURfVFJBTlNNSVRfUE9XRVIgdG8gQ1lXNDM3Mw0KDQpDYXV0aW9uOiBU
aGlzIGUtbWFpbCBvcmlnaW5hdGVkIG91dHNpZGUgSW5maW5lb24gVGVjaG5vbG9naWVzLiBQbGVh
c2UgYmUgY2F1dGlvdXMgd2hlbiBzaGFyaW5nIGluZm9ybWF0aW9uIG9yIG9wZW5pbmcgYXR0YWNo
bWVudHMgZXNwZWNpYWxseSBmcm9tIHVua25vd24gc2VuZGVycy4gUmVmZXIgdG8gb3VyIGludHJh
bmV0IGd1aWRlPGh0dHBzOi8vaW50cmFuZXQtY29udGVudC5pbmZpbmVvbi5jb20vZXhwbG9yZS9h
Ym91dGluZmluZW9uL3J1bGVzL2luZm9ybWF0aW9uc2VjdXJpdHkvdWcvU29jaWFsRW5naW5lZXJp
bmcvUGFnZXMvU29jaWFsRW5naW5lZXJpbmdFbGVtZW50c19lbi5hc3B4PiB0byBoZWxwIHlvdSBp
ZGVudGlmeSBQaGlzaGluZyBlbWFpbC4NCg0KDQoNCkhpIE5vYnVha2ksDQoNCk9uIFRodSwgSnVs
IDQsIDIwMjQgYXQgOToxNuKAr1BNIE5vYnVha2kgVHN1bmFzaGltYSA8bm9idWFraS50c3VuYXNo
aW1hQGluZmluZW9uLmNvbT4gd3JvdGU6DQo+DQo+IEZyb206IE5vYnVha2kgVHN1bmFzaGltYSA8
Tm9idWFraS5Uc3VuYXNoaW1hQGluZmluZW9uLmNvbT4NCj4NCj4gQ1lXNDM3MyBST00gRlcgaGFz
IGFuIGlzc3VlIHRoYXQgaXQgY2xhaW1zIExFX1JlYWRfVHJhbnNtaXRfUG93ZXIgDQo+IGNvbW1h
bmQgYXMgc3VwcG9ydGVkIGluIGEgcmVzcG9uc2Ugb2YgUmVhZF9Mb2NhbF9TdXBwb3J0ZWRfQ29t
bWFuZCANCj4gY29tbWFuZCBidXQgcmVqZWN0cyB0aGUgTEVfUmVhZF9UcmFuc21pdF9Qb3dlciBj
b21tYW5kIHdpdGggIlVua25vd24gSENJIENvbW1hbmQiDQo+IHN0YXR1cy4gQmVjYXVzZSBCbHVl
dG9vdGggZHJpdmVyIG9mIGtlcm5lbCA1LjExIGFkZGVkIHNlbmRpbmcgdGhlIA0KPiBMRV9SZWFk
X1RyYW5zbWl0X1Bvd2VyIGNvbW1hbmQgaW4gaW5pdGlhbGl6ZSBwaGFzZSwgaGNpIHVwIGZhaWxz
IGR1ZSANCj4gdG8gdGhlIGlzc3VlLg0KPg0KPiBFc3BlY2lhbGx5IGluIFVTQiBpL2YgY2FzZSwg
aXQgd291bGQgYmUgZGlmZmljdWx0IHRvIGRvd25sb2FkIHBhdGNoIEZXIA0KPiB0aGF0IGluY2x1
ZGVzIGl0cyBmaXggdW5sZXNzIGhjaSBpcyB1cC4NCj4NCj4gVGhlIGRyaXZlciBhbHJlYWR5IGNv
bnRhaW5zIGluZnJhc3RydWN0dXJlIHRvIGFwcGx5IHRoZSBxdWlyayBmb3IgdGhlIA0KPiBpc3N1
ZSwgYnV0IGN1cnJlbnRseSBpdCBvbmx5IHN1cHBvcnRzIERNSSBiYXNlZCBtYXRjaGluZy4gQWRk
IHN1cHBvcnQgDQo+IHRvIG1hdGNoIGJ5IGNoaXAgaWQgYW5kIGJhc2VsaW5lIEZXIHZlcnNpb24g
dG8gZGV0ZWN0IENZVzQzNzMgUk9NIEZXIA0KPiBidWlsZCBpbiBnZW5lcmljIHN5c3RlbS4NCj4N
Cj4gRml4ZXM6IDdjMzk1ZWE1MjFlNiAoIkJsdWV0b290aDogUXVlcnkgTEUgdHggcG93ZXIgb24g
c3RhcnR1cCIpDQo+IFNpZ25lZC1vZmYtYnk6IE5vYnVha2kgVHN1bmFzaGltYSA8Tm9idWFraS5U
c3VuYXNoaW1hQGluZmluZW9uLmNvbT4NCj4gLS0tDQo+IFY0IC0+IFY1OiBVc2Ugc2tiX3B1bGxf
ZGF0YSgpIHRvIGFjY2VzcyBza2ItPmRhdGEgYXMgc2FmZXIgbWFubmVyLg0KPiBWMyAtPiBWNDog
Rml4IGEgZmV3IGNvZGluZyBzdHlsZSB3YXJuaW5ncyBhbmQgcmVmaW5lIGNvbW1lbnRzIGZvciBj
bGFyaWZ5Lg0KPiBWMiAtPiBWMzogRml4IGEgZmV3IGNvZGluZyBzdHlsZSB3YXJuaW5ncyBhbmQg
Y2hhbmdlIHRoZSBzdWJqZWN0IGFzIG1vcmUgc3BlY2lmaWMuDQo+IFYxIC0+IFYyOiBGaXggc2V2
ZXJhbCBjb2Rpbmcgc3R5bGUgd2FybmluZ3MuDQo+DQo+ICBkcml2ZXJzL2JsdWV0b290aC9idGJj
bS5jIHwgNDENCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+ICBk
cml2ZXJzL2JsdWV0b290aC9idHVzYi5jIHwgIDQgKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0
MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ibHVldG9vdGgvYnRiY20uYyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0YmNtLmMgDQo+IGluZGV4
IDBhNTQ0NWFjNWUxYi4uZGQ3MjYyYThkYzhlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2JsdWV0
b290aC9idGJjbS5jDQo+ICsrKyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0YmNtLmMNCj4gQEAgLTQz
NywxNiArNDM3LDUzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCBkaXNhYmxl
X2Jyb2tlbl9yZWFkX3RyYW5zbWl0X3Bvd2VyW10gPSB7DQo+ICAgICAgICAgeyB9DQo+ICB9Ow0K
Pg0KPiArc3RydWN0IGJjbV9jaGlwX3ZlcnNpb25fdGFibGUgew0KPiArICAgICAgIHU4IGNoaXBf
aWQ7ICAgICAgICAgICAgICAgICAgICAgLyogQ2hpcCBJRCAqLw0KPiArICAgICAgIHUxNiBiYXNl
bGluZTsgICAgICAgICAgIC8qIEJhc2VsaW5lIHZlcnNpb24gb2YgcGF0Y2ggRlcgKi8NCj4gK307
DQo+ICsjZGVmaW5lIEJDTV9ST01GV19CQVNFTElORV9OVU0gMHhGRkZGIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgDQo+ICtiY21fY2hpcF92ZXJzaW9uX3RhYmxlIGRpc2FibGVfYnJva2VuX3JlYWRfdHJh
bnNtaXRfcG93ZXJfYnlfY2hpcF92ZXJbXSA9IHsNCj4gKyAgICAgICB7IDB4ODcsIEJDTV9ST01G
V19CQVNFTElORV9OVU0gfSAgICAgICAgICAgICAgICAvKiBDWVc0MzczLzQzNzNFICovDQo+ICt9
Ow0KDQpDYW4gd2UgaGF2ZSBhIGxpdHRsZSBsZXNzIHZlcmJvc2UgbmFtZXM/IGUuZy4gYnJva2Vu
X3JlYWRfdHhfcG93ZXIgYW5kIGJ0YmNtX2Jyb2tlbl9yZWFkX3R4X3Bvd2VyIHNvdW5kcyBhIGxv
dCBiZXR0ZXIgaW1vLg0KDQo+ICtzdGF0aWMgYm9vbCBidGJjbV9pc19kaXNhYmxlX2Jyb2tlbl9y
ZWFkX3R4X3Bvd2VyX2J5X2NoaXBfdmVyKHU4DQo+ICtjaGlwX2lkLCB1MTYgYmFzZWxpbmUpIHsN
Cj4gKyAgICAgICBpbnQgaTsNCj4gKyAgICAgICBzaXplX3QgdGFibGVfc2l6ZSA9IEFSUkFZX1NJ
WkUoZGlzYWJsZV9icm9rZW5fcmVhZF90cmFuc21pdF9wb3dlcl9ieV9jaGlwX3Zlcik7DQo+ICsg
ICAgICAgY29uc3Qgc3RydWN0IGJjbV9jaGlwX3ZlcnNpb25fdGFibGUgKmVudHJ5ID0NCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQo+ICsmZGlzYWJs
ZV9icm9rZW5fcmVhZF90cmFuc21pdF9wb3dlcl9ieV9jaGlwX3ZlclswXTsNCj4gKw0KPiArICAg
ICAgIGZvciAoaSA9IDAgOyBpIDwgdGFibGVfc2l6ZSA7IGkrKywgZW50cnkrKykgICAgIHsNCj4g
KyAgICAgICAgICAgICAgIGlmICgoY2hpcF9pZCA9PSBlbnRyeS0+Y2hpcF9pZCkgJiYgKGJhc2Vs
aW5lID09IGVudHJ5LT5iYXNlbGluZSkpDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biB0cnVlOw0KPiArICAgICAgIH0NCj4gKw0KPiArICAgICAgIHJldHVybiBmYWxzZTsNCj4gK30N
Cj4gKw0KPiAgc3RhdGljIGludCBidGJjbV9yZWFkX2luZm8oc3RydWN0IGhjaV9kZXYgKmhkZXYp
ICB7DQo+ICAgICAgICAgc3RydWN0IHNrX2J1ZmYgKnNrYjsNCj4gKyAgICAgICB1OCAqY2hpcF9p
ZDsNCj4gKyAgICAgICB1MTYgKmJhc2VsaW5lOw0KPg0KPiAgICAgICAgIC8qIFJlYWQgVmVyYm9z
ZSBDb25maWcgVmVyc2lvbiBJbmZvICovDQo+ICAgICAgICAgc2tiID0gYnRiY21fcmVhZF92ZXJi
b3NlX2NvbmZpZyhoZGV2KTsNCj4gICAgICAgICBpZiAoSVNfRVJSKHNrYikpDQo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gUFRSX0VSUihza2IpOw0KPiAtDQo+IC0gICAgICAgYnRfZGV2X2luZm8o
aGRldiwgIkJDTTogY2hpcCBpZCAldSIsIHNrYi0+ZGF0YVsxXSk7DQo+ICsgICAgICAgc2tiX3B1
bGxfZGF0YShza2IsIDEpOw0KPiArICAgICAgIGNoaXBfaWQgPSBza2JfcHVsbF9kYXRhKHNrYiwg
c2l6ZW9mKCpjaGlwX2lkKSk7DQo+ICsgICAgICAgc2tiX3B1bGxfZGF0YShza2IsIDEpOw0KPiAr
ICAgICAgIGJhc2VsaW5lID0gc2tiX3B1bGxfZGF0YShza2IsIHNpemVvZigqYmFzZWxpbmUpKTsN
Cj4gKw0KPiArICAgICAgIGlmIChjaGlwX2lkKSB7DQo+ICsgICAgICAgICAgICAgICBidF9kZXZf
aW5mbyhoZGV2LCAiQkNNOiBjaGlwIGlkICV1IiwgKmNoaXBfaWQpOw0KPiArDQo+ICsgICAgICAg
ICAgICAgICBpZiAoYmFzZWxpbmUpIHsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgLyogQ2hl
Y2sgQ2hpcCBJRCBhbmQgZGlzYWJsZSBicm9rZW4gUmVhZCBMRSBNaW4vTWF4IFR4IFBvd2VyICov
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChidGJjbV9pc19kaXNhYmxlX2Jyb2tlbl9y
ZWFkX3R4X3Bvd2VyX2J5X2NoaXBfdmVyKCpjaGlwX2lkLCAqYmFzZWxpbmUpKQ0KPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHNldF9iaXQoSENJX1FVSVJLX0JST0tFTl9SRUFEX1RS
QU5TTUlUX1BPV0VSLCAmaGRldi0+cXVpcmtzKTsNCj4gKyAgICAgICAgICAgICAgIH0NCj4gKyAg
ICAgICB9DQo+ICAgICAgICAga2ZyZWVfc2tiKHNrYik7DQo+DQo+ICAgICAgICAgcmV0dXJuIDA7
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2JsdWV0b290aC9idHVzYi5jIGIvZHJpdmVycy9ibHVl
dG9vdGgvYnR1c2IuYyANCj4gaW5kZXggZDMxZWRhZDdhMDU2Li41MjU2MWM4ZDg4MjggMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0dXNiLmMNCj4gKysrIGIvZHJpdmVycy9ibHVl
dG9vdGgvYnR1c2IuYw0KPiBAQCAtMTQyLDYgKzE0MiwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHVzYl9kZXZpY2VfaWQgYnR1c2JfdGFibGVbXSA9IHsNCj4gICAgICAgICB7IFVTQl9WRU5ET1Jf
QU5EX0lOVEVSRkFDRV9JTkZPKDB4MDRjYSwgMHhmZiwgMHgwMSwgMHgwMSksDQo+ICAgICAgICAg
ICAuZHJpdmVyX2luZm8gPSBCVFVTQl9CQ01fUEFUQ0hSQU0gfSwNCj4NCj4gKyAgICAgICAvKiBD
eXByZXNzIGRldmljZXMgd2l0aCB2ZW5kb3Igc3BlY2lmaWMgaWQgKi8NCj4gKyAgICAgICB7IFVT
Ql9WRU5ET1JfQU5EX0lOVEVSRkFDRV9JTkZPKDB4MDRiNCwgMHhmZiwgMHgwMSwgMHgwMSksDQo+
ICsgICAgICAgICAuZHJpdmVyX2luZm8gPSBCVFVTQl9CQ01fUEFUQ0hSQU0gfSwNCj4gKw0KPiAg
ICAgICAgIC8qIEJyb2FkY29tIGRldmljZXMgd2l0aCB2ZW5kb3Igc3BlY2lmaWMgaWQgKi8NCj4g
ICAgICAgICB7IFVTQl9WRU5ET1JfQU5EX0lOVEVSRkFDRV9JTkZPKDB4MGE1YywgMHhmZiwgMHgw
MSwgMHgwMSksDQo+ICAgICAgICAgICAuZHJpdmVyX2luZm8gPSBCVFVTQl9CQ01fUEFUQ0hSQU0g
fSwNCj4gLS0NCj4gMi4yNS4xDQo+DQoNCg0KLS0NCkx1aXogQXVndXN0byB2b24gRGVudHoNCg==

