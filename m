Return-Path: <linux-bluetooth+bounces-684-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9305181A6D1
	for <lists+linux-bluetooth@lfdr.de>; Wed, 20 Dec 2023 19:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A73D1F23201
	for <lists+linux-bluetooth@lfdr.de>; Wed, 20 Dec 2023 18:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CE9482E2;
	Wed, 20 Dec 2023 18:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="WpwGpM8E"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-m17236.xmail.ntesmail.com (mail-m17236.xmail.ntesmail.com [45.195.17.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EB5482C2
	for <linux-bluetooth@vger.kernel.org>; Wed, 20 Dec 2023 18:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=WpwGpM8EdnjY9uJ6Rx5WrSpEng3TJJluAsxAUjiuJ3kcpazREnZ9QhSqJonrtz1x0n9YzOEz263thRain+9pEdpkDHw81znzlqT5DZrJZD868RkKOS6WeQ//biM4HukQwENDo9csTx8aqSDMKuO8a4Hy73gU3MO1Q+sH8S3b+9M=;
	s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Rd7bZpht3MgZ3e3emFUxwJYRNe3vQDRwIjiS4osZT7s=;
	h=date:mime-version:subject:message-id:from;
Received: from rock-chips.com (localhost [127.0.0.1])
	by mail-m12744.qiye.163.com (Hmail) with ESMTP id 6A0D2100224;
	Thu, 21 Dec 2023 01:48:43 +0800 (CST)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <APQAQAAJGHLYMZR7jBqi*4pR.1.1703094523428.Hmail.xiaoyao@rock-chips.com>
To: luiz.dentz@gmail.com
Cc: Xiao Yao <xiaokeqinhealth@126.com>, 
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	antiz <antiz@archlinux.org>
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSCB2Ml0gYWRhcHRlcjogRml4IGxpbmsga2V5IGFkZHJlc3MgdHlwZSBmb3Igb2xkIGtlcm5lbHM=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com web
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from xiaoyao@rock-chips.com( [205.178.182.76) ] by ajax-webmail ( [127.0.0.1] ) ; Thu, 21 Dec 2023 01:48:43 +0800 (GMT+08:00)
From: =?UTF-8?B?6IKW5Z6a?= <xiaoyao@rock-chips.com>
Date: Thu, 21 Dec 2023 01:48:43 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGhhKVh9OTE9NGUMeSR1CSFUTARMWGhIXJBQOD1
	lXWRgSC1lBWUlLTlVKTENVSkNJVUxNWVdZFhoPEhUdFFlBWU9LSFVKT0NPTExVSktLVUpCWQY+
X-HM-Tid: 0a8c8856cde1b217kuuu18c86ebbb4a
X-HM-MType: 1
X-HM-NTES-SC: AL0_4z5B86Wr4Tz9jdMF+bhXMfNG2w9N2nM6QCGwQmST2JrTCMbUPBxAZ6ApCD
	e8CEmSFmbiwmlS+Ep5af8oLSW6vq4VQrzmr9HeAs8ENTFCUGHFqaJ912xENObSfepupK4MdLONFW
	8Jd9UTqRIZ9K6vfZneaCJ7rKt4uuBiT7Zpu7I=
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzorKjoqOjoxPDM3IjYhKUwROQoS
	UU8LKVVKVUpMS0hLQk9OSUhCQ0pVMxYaEhdVAxIaFAIaFDsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
	WUlLTlVKTENVSkNJVUxNWVdZCAFZQUJNTks3Bg++

SGkgTHVpeiwKVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgZml4aW5nIHRoaXMgaXNzdWU7IHBsZWFz
ZSBkaXNyZWdhcmQgdGhpcyBwYXRjaC4KQmVzdCBSZWdhcmRzCgo+T24gV2VkLCBEZWMgMjAsIDIw
MjMgYXQgMTI6MzHigK9QTSBYaWFvIFlhbyA8eGlhb2tlcWluaGVhbHRoQDEyNi5jb20+IHdyb3Rl
Ogo+Pgo+PiBGcm9tOiBYaWFvIFlhbyA8eGlhb3lhb0Byb2NrLWNoaXBzLmNvbT4KPj4KPj4gQWNj
b3JkaW5nIHRvIHRoZSBCbHVldG9vdGggc3BlY2lmaWNhdGlvbiwgdGhlIGFkZHJlc3MKPj4gdHlw
ZSBvZiB0aGUgbGluayBrZXkgaXMgbm90IGZpeGVkLiBIb3dldmVyLCB0aGUKPj4gbG9hZF9saW5r
X2tleXMgZnVuY3Rpb24gaW4gdGhlIG9sZCBrZXJuZWwgY29kZSByZXF1aXJlcwo+PiB0aGF0IHRo
ZSBhZGRyZXNzIHR5cGUgbXVzdCBiZSBCREFERFJfQlJFRFIsIHNvIGF0dGVtcHQKPj4gaXQgd2hl
biB0aGUgZmlyc3QgbG9hZCBmYWlscy4KPj4KPj4gRml4ZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9i
bHVlei9ibHVlei9pc3N1ZXMvNjg2Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFhpYW8gWWFvIDx4aWFv
eWFvQHJvY2stY2hpcHMuY29tPgo+PiAtLS0KPj4gdjEgLT4gdjIKPj4gUHJpb3JpdGl6ZSBsb2Fk
aW5nIGtleXMgd2l0aCBzdGFuZGFyZCBhZGRyZXNzIHR5cGVzLAo+PiBhbmQgc3dpdGNoIHRvIEJS
RURSIGFkZHJlc3MgdHlwZXMgdXBvbiBmYWlsdXJlLCBhcwo+PiBzdWdnZXN0ZWQgYnkgdGhlIG1h
aW50YWluZXIuCj4+IC0tLQo+PiAgc3JjL2FkYXB0ZXIuYyB8IDQ1ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2Vy
dGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9zcmMvYWRhcHRlci5j
IGIvc3JjL2FkYXB0ZXIuYwo+PiBpbmRleCBlZTcwYjAwZDIuLmUxYjcwNGVjYyAxMDA2NDQKPj4g
LS0tIGEvc3JjL2FkYXB0ZXIuYwo+PiArKysgYi9zcmMvYWRhcHRlci5jCj4+IEBAIC0xNjgsNiAr
MTY4LDkgQEAgc3RhdGljIEdTTGlzdCAqYWRhcHRlcl9kcml2ZXJzID0gTlVMTDsKPj4gIHN0YXRp
YyBHU0xpc3QgKmRpc2Nvbm5lY3RfbGlzdCA9IE5VTEw7Cj4+ICBzdGF0aWMgR1NMaXN0ICpjb25u
X2ZhaWxfbGlzdCA9IE5VTEw7Cj4+Cj4+ICtzdGF0aWMgR1NMaXN0ICpsaW5rX2tleXMgPSBOVUxM
Owo+PiArc3RhdGljIGJvb2wgbGlua19rZXlzX2JyZGVyID0gZmFsc2U7Cj4+ICsKPj4gIHN0cnVj
dCBsaW5rX2tleV9pbmZvIHsKPj4gICAgICAgICBiZGFkZHJfdCBiZGFkZHI7Cj4+ICAgICAgICAg
dWludDhfdCBiZGFkZHJfdHlwZTsKPj4gQEAgLTQyODQsMjMgKzQyODcsNDUgQEAgc3RhdGljIGlu
dCBzZXRfcHJpdmFjeShzdHJ1Y3QgYnRkX2FkYXB0ZXIgKmFkYXB0ZXIsIHVpbnQ4X3QgcHJpdmFj
eSkKPj4gICAgICAgICByZXR1cm4gLTE7Cj4+ICB9Cj4+Cj4+ICtzdGF0aWMgdm9pZCBsb2FkX2xp
bmtfa2V5cyhzdHJ1Y3QgYnRkX2FkYXB0ZXIgKmFkYXB0ZXIsIEdTTGlzdCAqa2V5cywKPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBkZWJ1Z19rZXlzLCBib29sIGxpbmtfa2V5X2Jy
ZWRyKTsKPj4gKwo+PiAgc3RhdGljIHZvaWQgbG9hZF9saW5rX2tleXNfY29tcGxldGUodWludDhf
dCBzdGF0dXMsIHVpbnQxNl90IGxlbmd0aCwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IHZvaWQgKnBhcmFtLCB2b2lkICp1c2VyX2RhdGEpCj4+ICB7Cj4+
ICAgICAgICAgc3RydWN0IGJ0ZF9hZGFwdGVyICphZGFwdGVyID0gdXNlcl9kYXRhOwo+Pgo+PiAg
ICAgICAgIGlmIChzdGF0dXMgIT0gTUdNVF9TVEFUVVNfU1VDQ0VTUykgewo+PiArICAgICAgICAg
ICAgICAgLyoKPj4gKyAgICAgICAgICAgICAgICAqIEFjY29yZGluZyB0byB0aGUgQmx1ZXRvb3Ro
IHNwZWNpZmljYXRpb24sIHRoZSBhZGRyZXNzCj4+ICsgICAgICAgICAgICAgICAgKiB0eXBlIG9m
IHRoZSBsaW5rIGtleSBpcyBub3QgZml4ZWQuIEhvd2V2ZXIsIHRoZQo+PiArICAgICAgICAgICAg
ICAgICogbG9hZF9saW5rX2tleXMgZnVuY3Rpb24gaW4gdGhlIG9sZCBrZXJuZWwgY29kZSByZXF1
aXJlcwo+PiArICAgICAgICAgICAgICAgICogdGhhdCB0aGUgYWRkcmVzcyB0eXBlIG11c3QgYmUg
QkRBRERSX0JSRURSLCBzbyBhdHRlbXB0IGl0Lgo+PiArICAgICAgICAgICAgICAgICovCj4+ICsg
ICAgICAgICAgICAgICBpZiAobGlua19rZXlzX2JyZGVyID09IGZhbHNlICYmIHN0YXR1cyA9PSAw
eDBkKSB7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGxpbmtfa2V5c19icmRlciA9IHRydWU7
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGxvYWRfbGlua19rZXlzKGFkYXB0ZXIsIGxpbmtf
a2V5cywgYnRkX29wdHMuZGVidWdfa2V5cywKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbGlua19rZXlzX2JyZGVyKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuOwo+PiArICAgICAgICAgICAgICAgfQo+PiArCj4+ICAgICAgICAgICAgICAgICBidGRf
ZXJyb3IoYWRhcHRlci0+ZGV2X2lkLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAiRmFpbGVk
IHRvIGxvYWQgbGluayBrZXlzIGZvciBoY2kldTogJXMgKDB4JTAyeCkiLAo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGFkYXB0ZXItPmRldl9pZCwgbWdtdF9lcnJzdHIoc3RhdHVz
KSwgc3RhdHVzKTsKPj4gLSAgICAgICAgICAgICAgIHJldHVybjsKPj4gKwo+PiArICAgICAgICAg
ICAgICAgZ290byBmcmVlOwo+PiAgICAgICAgIH0KPj4KPj4gICAgICAgICBEQkcoImxpbmsga2V5
cyBsb2FkZWQgZm9yIGhjaSV1IiwgYWRhcHRlci0+ZGV2X2lkKTsKPj4gKwo+PiArZnJlZToKPj4g
KyAgICAgICBnX3NsaXN0X2ZyZWVfZnVsbChsaW5rX2tleXMsIGdfZnJlZSk7Cj4+ICsgICAgICAg
bGlua19rZXlzID0gTlVMTDsKPj4gKyAgICAgICBsaW5rX2tleXNfYnJkZXIgPSBmYWxzZTsKPj4g
IH0KPj4KPj4gIHN0YXRpYyB2b2lkIGxvYWRfbGlua19rZXlzKHN0cnVjdCBidGRfYWRhcHRlciAq
YWRhcHRlciwgR1NMaXN0ICprZXlzLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgZGVidWdfa2V5cykKPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgYm9vbCBkZWJ1Z19rZXlzLCBib29sIGxpbmtfa2V5X2JyZWRyKQo+PiAg
ewo+PiAgICAgICAgIHN0cnVjdCBtZ210X2NwX2xvYWRfbGlua19rZXlzICpjcDsKPj4gICAgICAg
ICBzdHJ1Y3QgbWdtdF9saW5rX2tleV9pbmZvICprZXk7Cj4+IEBAIC00MzIwLDggKzQzNDUsOCBA
QCBzdGF0aWMgdm9pZCBsb2FkX2xpbmtfa2V5cyhzdHJ1Y3QgYnRkX2FkYXB0ZXIgKmFkYXB0ZXIs
IEdTTGlzdCAqa2V5cywKPj4KPj4gICAgICAgICBrZXlfY291bnQgPSBnX3NsaXN0X2xlbmd0aChr
ZXlzKTsKPj4KPj4gLSAgICAgICBEQkcoImhjaSV1IGtleXMgJXp1IGRlYnVnX2tleXMgJWQiLCBh
ZGFwdGVyLT5kZXZfaWQsIGtleV9jb3VudCwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRlYnVnX2tleXMpOwo+PiArICAg
ICAgIERCRygiaGNpJXUga2V5cyAlenUgZGVidWdfa2V5cyAlZCAoJXMpIiwgYWRhcHRlci0+ZGV2
X2lkLCBrZXlfY291bnQsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGRlYnVnX2tleXMsIGxp
bmtfa2V5X2JyZWRyID8gImZvcmNlIGJyZWRyIiA6ICJub3JtYWwiKTsKPj4KPj4gICAgICAgICBj
cF9zaXplID0gc2l6ZW9mKCpjcCkgKyAoa2V5X2NvdW50ICogc2l6ZW9mKCprZXkpKTsKPj4KPj4g
QEAgLTQzNDcsNyArNDM3MiwxMCBAQCBzdGF0aWMgdm9pZCBsb2FkX2xpbmtfa2V5cyhzdHJ1Y3Qg
YnRkX2FkYXB0ZXIgKmFkYXB0ZXIsIEdTTGlzdCAqa2V5cywKPj4gICAgICAgICAgICAgICAgIHN0
cnVjdCBsaW5rX2tleV9pbmZvICppbmZvID0gbC0+ZGF0YTsKPj4KPj4gICAgICAgICAgICAgICAg
IGJhY3B5KCZrZXktPmFkZHIuYmRhZGRyLCAmaW5mby0+YmRhZGRyKTsKPj4gLSAgICAgICAgICAg
ICAgIGtleS0+YWRkci50eXBlID0gaW5mby0+YmRhZGRyX3R5cGU7Cj4+ICsgICAgICAgICAgICAg
ICBpZiAobGlua19rZXlfYnJlZHIpCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGtleS0+YWRk
ci50eXBlID0gQkRBRERSX0JSRURSOwo+PiArICAgICAgICAgICAgICAgZWxzZQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICBrZXktPmFkZHIudHlwZSA9IGluZm8tPmJkYWRkcl90eXBlOwo+PiAg
ICAgICAgICAgICAgICAga2V5LT50eXBlID0gaW5mby0+dHlwZTsKPj4gICAgICAgICAgICAgICAg
IG1lbWNweShrZXktPnZhbCwgaW5mby0+a2V5LCAxNik7Cj4+ICAgICAgICAgICAgICAgICBrZXkt
PnBpbl9sZW4gPSBpbmZvLT5waW5fbGVuOwo+PiBAQCAtNDg3Myw3ICs0OTAxLDYgQEAgZG9uZToK
Pj4gIHN0YXRpYyB2b2lkIGxvYWRfZGV2aWNlcyhzdHJ1Y3QgYnRkX2FkYXB0ZXIgKmFkYXB0ZXIp
Cj4+ICB7Cj4+ICAgICAgICAgY2hhciBkaXJuYW1lW1BBVEhfTUFYXTsKPj4gLSAgICAgICBHU0xp
c3QgKmtleXMgPSBOVUxMOwo+PiAgICAgICAgIEdTTGlzdCAqbHRrcyA9IE5VTEw7Cj4+ICAgICAg
ICAgR1NMaXN0ICppcmtzID0gTlVMTDsKPj4gICAgICAgICBHU0xpc3QgKnBhcmFtcyA9IE5VTEw7
Cj4+IEBAIC00OTY0LDcgKzQ5OTEsNyBAQCBzdGF0aWMgdm9pZCBsb2FkX2RldmljZXMoc3RydWN0
IGJ0ZF9hZGFwdGVyICphZGFwdGVyKQo+PiAgICAgICAgICAgICAgICAgfQo+Pgo+PiAgICAgICAg
ICAgICAgICAgaWYgKGtleV9pbmZvKQo+PiAtICAgICAgICAgICAgICAgICAgICAgICBrZXlzID0g
Z19zbGlzdF9hcHBlbmQoa2V5cywga2V5X2luZm8pOwo+PiArICAgICAgICAgICAgICAgICAgICAg
ICBsaW5rX2tleXMgPSBnX3NsaXN0X2FwcGVuZChsaW5rX2tleXMsIGtleV9pbmZvKTsKPj4KPj4g
ICAgICAgICAgICAgICAgIGlmIChsdGtfaW5mbykKPj4gICAgICAgICAgICAgICAgICAgICAgICAg
bHRrcyA9IGdfc2xpc3RfYXBwZW5kKGx0a3MsIGx0a19pbmZvKTsKPj4gQEAgLTUwMTMsOCArNTA0
MCw4IEBAIGZyZWU6Cj4+Cj4+ICAgICAgICAgY2xvc2VkaXIoZGlyKTsKPj4KPj4gLSAgICAgICBs
b2FkX2xpbmtfa2V5cyhhZGFwdGVyLCBrZXlzLCBidGRfb3B0cy5kZWJ1Z19rZXlzKTsKPj4gLSAg
ICAgICBnX3NsaXN0X2ZyZWVfZnVsbChrZXlzLCBnX2ZyZWUpOwo+PiArICAgICAgIGxvYWRfbGlu
a19rZXlzKGFkYXB0ZXIsIGxpbmtfa2V5cywgYnRkX29wdHMuZGVidWdfa2V5cywKPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgbGlua19rZXlzX2JyZGVyKTsKPj4KPj4gICAgICAgICBsb2FkX2x0
a3MoYWRhcHRlciwgbHRrcyk7Cj4+ICAgICAgICAgZ19zbGlzdF9mcmVlX2Z1bGwobHRrcywgZ19m
cmVlKTsKPj4gLS0KPj4gMi4zNC4xCj4KPkl2ZSBqdXN0IHNlbnQgYSBzaW1pbGFyIGZpeDoKPgo+
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2JsdWV0b290aC9wYXRjaC8yMDIz
MTIyMDE3MjIyMi4yMzMzMDY0LTEtbHVpei5kZW50ekBnbWFpbC5jb20vCj4KPj4KPgo+Cj4tLSAK
Pkx1aXogQXVndXN0byB2b24gRGVudHoKPgoKCg0KDQo=

