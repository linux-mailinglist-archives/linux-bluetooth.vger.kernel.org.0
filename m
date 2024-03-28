Return-Path: <linux-bluetooth+bounces-2688-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1713488666F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 Mar 2024 06:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 977BE1F22B82
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 Mar 2024 05:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C377C8F7D;
	Fri, 22 Mar 2024 05:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="i6IacEKd"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-4027.protonmail.ch (mail-4027.protonmail.ch [185.70.40.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CB6B67D
	for <linux-bluetooth@vger.kernel.org>; Fri, 22 Mar 2024 05:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711086661; cv=none; b=uUxOdqBlV0skk8232lpn15mGoQ0C4Kw2UrKOhsdJXuUJJhFZNHjdkEGPWe7V6nOHmG0AjaaIYmfMVrN1p/20lkdoRLbIQTSWJLnMyxX5ZZiM9EwxWhCLVsw4ArXc74ST6ynm2T/PFHVZbbWAogopJzKynAlsigvSIjfj3fUo0KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711086661; c=relaxed/simple;
	bh=oEeYldermshSLxb7N9IZbSvtBhiJcLM+hFvf7ztZSS8=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=e7Mw5HpeyhJPHnX8oabgiMuiImNtQ35BwyYbfmHzaIqqqoDWWQvOV5ZVuxGyV1C6Kw6geC8xVVf2nI7x2SsxiXVWa6aZZBbVy8RyrDdtCvQ4o9NiYuAxYrmvV71cKlTgzdCQacggmu/Z1nXhQMro2sMgnhUcp2w9IhmInve0mPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=i6IacEKd; arc=none smtp.client-ip=185.70.40.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=as7doqpzabd3pjg6fygjsnxhuu.protonmail; t=1711086650; x=1711345850;
	bh=oEeYldermshSLxb7N9IZbSvtBhiJcLM+hFvf7ztZSS8=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=i6IacEKdntwS1RJtw87hl9uJzi430rlP1kB375m5O8xWGh821UIWfBXOjMQj5BVsp
	 DugoCJN+nMYySLhiN9kZZN6aGJ49VQfO2XuM5BkOAe00dbm18STSTSgCyQur+K7QLa
	 CPMZ/BvYFoadnSTSukn9IDwWh+HnT8z8fe21WN+EnGD9sgWdowGWabFoziNRRDdpxn
	 ezJYMS6Pj7tlGoPN9ZnQe4SyKAHYLtnd2EwbB8beng8iamoQf7eHFNsOEifgfBMSBc
	 UThslJStcjCoTsYbDMnkK24b8NSA5VmOnOHu3ifI1Ovj6N/FBw12d/NoZhVxOAyly3
	 v+8HciwbV5QXA==
Date: Fri, 22 Mar 2024 05:50:36 +0000
To: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
From: Rustmilian <Rustmilian@proton.me>
Subject: [BR] bluez/bluez-libs regression
Message-ID: <RH_cQJ7FRJYEEw3rGLEa6UiZ8X2xiX8_H7n8K0J75X_SE3d40navRBE4wXK92zQry9pTQzN2LZkYp20THDIlI0LALSBQQIvJ_pRQQ0P8J20=@proton.me>
Feedback-ID: 52648909:user:proton
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------715b35f60be64c83c04d79020cf36221d043fee1e864ea0aae4bc2646f7c1a47"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------715b35f60be64c83c04d79020cf36221d043fee1e864ea0aae4bc2646f7c1a47
Content-Type: multipart/mixed;boundary=---------------------65b410175d41f66955c4833e41809421

-----------------------65b410175d41f66955c4833e41809421
Content-Type: multipart/alternative;boundary=---------------------77362a392b7cb5d8898a2d71abd51b12

-----------------------77362a392b7cb5d8898a2d71abd51b12
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

There's a regression somewhere between bluez 5.69 bluez-libs 5.69 (working=
) and latest (currently 5.73) that breaks Bluetooth for device :
`Bus 001 Device 010: ID 0bda:b00a Realtek Semiconductor Corp. Realtek Blue=
tooth 4.2 Adapter`

bluetooth.service says condition unmet : /sys/class/bluetooth/ not found, =
checking it; `/sys/class/bluetooth/` exists but is empty when it's suppose=
d to have a symlink from `/sys/class/bluetooth/hci0/` to `/sys/devices/pci=
0000:00/0000:00:08.1/0000:03:00.3/usb1/1-4/1-4:1.0/bluetooth/hci0/`
looking through the log there's also errors :
`usb 1-4: device descriptor read/64, error -71`
`usb 1-4: device not accepting address 6, error -71`
`usb 1-4: device not accepting address 7, error -71`
`usb usb1-port4: unable to enumerate USB device`

attachment is logs taken from the working version.
-----------------------77362a392b7cb5d8898a2d71abd51b12
Content-Type: multipart/related;boundary=---------------------599e9a306617f90fc40787259be49e23

-----------------------599e9a306617f90fc40787259be49e23
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7Ij5UaGVyZSdzIGEgcmVncmVzc2lvbiBzb21ld2hlcmUgYmV0d2VlbiBibHVleiA1LjY5IGJs
dWV6LWxpYnMgNS42OSAod29ya2luZykgYW5kIGxhdGVzdCAoY3VycmVudGx5IDUuNzMpIHRoYXQg
YnJlYWtzIEJsdWV0b290aCBmb3IgZGV2aWNlIDo8YnI+Cjxjb2RlPkJ1cyAwMDEgRGV2aWNlIDAx
MDogSUQgMGJkYTpiMDBhIFJlYWx0ZWsgU2VtaWNvbmR1Y3RvciBDb3JwLiBSZWFsdGVrIEJsdWV0
b290aCA0LjIgQWRhcHRlcjwvY29kZT48YnI+Cjxicj4KYmx1ZXRvb3RoLnNlcnZpY2Ugc2F5cyBj
b25kaXRpb24gdW5tZXQgOiAvc3lzL2NsYXNzL2JsdWV0b290aC8gbm90IGZvdW5kLCBjaGVja2lu
ZyBpdDsgPGNvZGU+L3N5cy9jbGFzcy9ibHVldG9vdGgvPC9jb2RlPiBleGlzdHMgYnV0IGlzIGVt
cHR5IHdoZW4gaXQncyBzdXBwb3NlZCB0byBoYXZlIGEgc3ltbGluayBmcm9tIDxjb2RlPi9zeXMv
Y2xhc3MvYmx1ZXRvb3RoL2hjaTAvPC9jb2RlPiB0byA8Y29kZT4vc3lzL2RldmljZXMvcGNpMDAw
MDowMC8wMDAwOjAwOjA4LjEvMDAwMDowMzowMC4zL3VzYjEvMS00LzEtNDoxLjAvYmx1ZXRvb3Ro
L2hjaTAvPC9jb2RlPjxicj4KbG9va2luZyB0aHJvdWdoIHRoZSBsb2cgdGhlcmUncyBhbHNvIGVy
cm9ycyA6PGJyPgo8Y29kZT51c2IgMS00OiBkZXZpY2UgZGVzY3JpcHRvciByZWFkLzY0LCBlcnJv
ciAtNzE8L2NvZGU+PGJyPgo8Y29kZT51c2IgMS00OiBkZXZpY2Ugbm90IGFjY2VwdGluZyBhZGRy
ZXNzIDYsIGVycm9yIC03MTwvY29kZT48YnI+Cjxjb2RlPnVzYiAxLTQ6IGRldmljZSBub3QgYWNj
ZXB0aW5nIGFkZHJlc3MgNywgZXJyb3IgLTcxPC9jb2RlPjxicj4KPGNvZGU+dXNiIHVzYjEtcG9y
dDQ6IHVuYWJsZSB0byBlbnVtZXJhdGUgVVNCIGRldmljZTwvY29kZT48YnI+Cjxicj4KYXR0YWNo
bWVudCBpcyBsb2dzIHRha2VuIGZyb20gdGhlIHdvcmtpbmcgdmVyc2lvbi48L2Rpdj4=
-----------------------599e9a306617f90fc40787259be49e23--
-----------------------77362a392b7cb5d8898a2d71abd51b12--
-----------------------65b410175d41f66955c4833e41809421
Content-Type: text/markdown; filename="5.69_logs.md"; name="5.69_logs.md"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="5.69_logs.md"; name="5.69_logs.md"

CmBgYHpzaApCdXMgMDAxLlBvcnQgMDAxOiBEZXYgMDAxLCBDbGFzcz1yb290X2h1YiwgRHJpdmVy
PXhoY2lfaGNkLzZwLCA0ODBNCiAgICB8X18gUG9ydCAwMDI6IERldiAwMDIsIElmIDAsIENsYXNz
PUh1bWFuIEludGVyZmFjZSBEZXZpY2UsIERyaXZlcj11c2JoaWQsIDEuNU0KICAgIHxfXyBQb3J0
IDAwMjogRGV2IDAwMiwgSWYgMSwgQ2xhc3M9SHVtYW4gSW50ZXJmYWNlIERldmljZSwgRHJpdmVy
PXVzYmhpZCwgMS41TQogICAgfF9fIFBvcnQgMDAzOiBEZXYgMDAzLCBJZiAwLCBDbGFzcz1IdW1h
biBJbnRlcmZhY2UgRGV2aWNlLCBEcml2ZXI9dXNiaGlkLCAxLjVNCiAgICB8X18gUG9ydCAwMDQ6
IERldiAwMTAsIElmIDAsIENsYXNzPVdpcmVsZXNzLCBEcml2ZXI9YnR1c2IsIDEyTQogICAgfF9f
IFBvcnQgMDA0OiBEZXYgMDEwLCBJZiAxLCBDbGFzcz1XaXJlbGVzcywgRHJpdmVyPWJ0dXNiLCAx
Mk0KICAgIHxfXyBQb3J0IDAwNTogRGV2IDAwOCwgSWYgMCwgQ2xhc3M9SHViLCBEcml2ZXI9aHVi
LzRwLCA0ODBNCiAgICAgICAgfF9fIFBvcnQgMDAyOiBEZXYgMDA5LCBJZiAwLCBDbGFzcz1WaWRl
bywgRHJpdmVyPXV2Y3ZpZGVvLCA0ODBNCiAgICAgICAgfF9fIFBvcnQgMDAyOiBEZXYgMDA5LCBJ
ZiAxLCBDbGFzcz1WaWRlbywgRHJpdmVyPXV2Y3ZpZGVvLCA0ODBNCi86ICBCdXMgMDAyLlBvcnQg
MDAxOiBEZXYgMDAxLCBDbGFzcz1yb290X2h1YiwgRHJpdmVyPXhoY2lfaGNkLzRwLCAxMDAwME0K
YGBgCgpgYGB6c2gKWyAgIDEwLjY1MjY3NV0gdXNiIDEtNDogUHJvZHVjdDogQmx1ZXRvb3RoIFJh
ZGlvClsgICAxMC43NTcwODddIEJsdWV0b290aDogQ29yZSB2ZXIgMi4yMgpbICAgMTAuNzU3MjIz
XSBCbHVldG9vdGg6IEhDSSBkZXZpY2UgYW5kIGNvbm5lY3Rpb24gbWFuYWdlciBpbml0aWFsaXpl
ZApbICAgMTAuNzU3MjI5XSBCbHVldG9vdGg6IEhDSSBzb2NrZXQgbGF5ZXIgaW5pdGlhbGl6ZWQK
WyAgIDEwLjc1NzIzMl0gQmx1ZXRvb3RoOiBMMkNBUCBzb2NrZXQgbGF5ZXIgaW5pdGlhbGl6ZWQK
WyAgIDEwLjc1NzIzNl0gQmx1ZXRvb3RoOiBTQ08gc29ja2V0IGxheWVyIGluaXRpYWxpemVkClsg
ICAxMC44MTMwMjVdIEJsdWV0b290aDogaGNpMDogUlRMOiBleGFtaW5pbmcgaGNpX3Zlcj0wOCBo
Y2lfcmV2PTAwMGMgbG1wX3Zlcj0wOCBsbXBfc3VidmVyPTg4MjEKWyAgIDEwLjgxNDU3MF0gQmx1
ZXRvb3RoOiBoY2kwOiBSVEw6IHJvbV92ZXJzaW9uIHN0YXR1cz0wIHZlcnNpb249MQpbICAgMTAu
ODE0NTc1XSBCbHVldG9vdGg6IGhjaTA6IFJUTDogbG9hZGluZyBydGxfYnQvcnRsODgyMWNfZncu
YmluClsgICAxMC44MTYxOTZdIEJsdWV0b290aDogaGNpMDogUlRMOiBsb2FkaW5nIHJ0bF9idC9y
dGw4ODIxY19jb25maWcuYmluClsgICAxMC44MTYyOTBdIEJsdWV0b290aDogaGNpMDogUlRMOiBj
Zmdfc3ogMTAsIHRvdGFsIHN6IDM0OTI2ClsgICAxMC45MDU4MzhdIEJsdWV0b290aDogQk5FUCAo
RXRoZXJuZXQgRW11bGF0aW9uKSB2ZXIgMS4zClsgICAxMC45MDU4NDNdIEJsdWV0b290aDogQk5F
UCBmaWx0ZXJzOiBwcm90b2NvbCBtdWx0aWNhc3QKWyAgIDEwLjkwNTg0OF0gQmx1ZXRvb3RoOiBC
TkVQIHNvY2tldCBsYXllciBpbml0aWFsaXplZApbICAgMTEuNDI2MTk3XSBCbHVldG9vdGg6IGhj
aTA6IFJUTDogZncgdmVyc2lvbiAweDc1YjhmMDk4ClsgICAxMS41MjQyNDBdIEJsdWV0b290aDog
TUdNVCB2ZXIgMS4yMgpbICAgMTEuNTcxODgyXSBCbHVldG9vdGg6IFJGQ09NTSBUVFkgbGF5ZXIg
aW5pdGlhbGl6ZWQKWyAgIDExLjU3MTg5MV0gQmx1ZXRvb3RoOiBSRkNPTU0gc29ja2V0IGxheWVy
IGluaXRpYWxpemVkClsgICAxMS41NzE4OTZdIEJsdWV0b290aDogUkZDT01NIHZlciAxLjExCmBg
YAoKYGBgenNoCkNvbnRyb2xsZXIgRDg6QzA6QTY6WFg6WFg6WFggKHB1YmxpYykKCU5hbWU6IEhB
TAoJQWxpYXM6IEhBTAoJQ2xhc3M6IDB4MDA3YzAxMGMgKDgxMjY3MzIpCglQb3dlcmVkOiB5ZXMK
CURpc2NvdmVyYWJsZTogbm8KCURpc2NvdmVyYWJsZVRpbWVvdXQ6IDB4MDAwMDAwYjQgKDE4MCkK
CVBhaXJhYmxlOiB5ZXMKCVVVSUQ6IE1lc3NhZ2UgTm90aWZpY2F0aW9uIFNlLi4gKDAwMDAxMTMz
LTAwMDAtMTAwMC04MDAwLTAwODA1ZjliMzRmYikKCVVVSUQ6IEEvViBSZW1vdGUgQ29udHJvbCAg
ICAgICAgKDAwMDAxMTBlLTAwMDAtMTAwMC04MDAwLTAwODA1ZjliMzRmYikKCVVVSUQ6IFZlbmRv
ciBzcGVjaWZpYyAgICAgICAgICAgKDAzYjgwZTVhLWVkZTgtNGIzMy1hNzUxLTZjZTM0ZWM0Yzcw
MCkKCVVVSUQ6IE9CRVggT2JqZWN0IFB1c2ggICAgICAgICAgKDAwMDAxMTA1LTAwMDAtMTAwMC04
MDAwLTAwODA1ZjliMzRmYikKCVVVSUQ6IE1lc3NhZ2UgQWNjZXNzIFNlcnZlciAgICAgKDAwMDAx
MTMyLTAwMDAtMTAwMC04MDAwLTAwODA1ZjliMzRmYikKCVVVSUQ6IFBuUCBJbmZvcm1hdGlvbiAg
ICAgICAgICAgKDAwMDAxMjAwLTAwMDAtMTAwMC04MDAwLTAwODA1ZjliMzRmYikKCVVVSUQ6IEly
TUMgU3luYyAgICAgICAgICAgICAgICAgKDAwMDAxMTA0LTAwMDAtMTAwMC04MDAwLTAwODA1Zjli
MzRmYikKCVVVSUQ6IFZlbmRvciBzcGVjaWZpYyAgICAgICAgICAgKDAwMDA1MDA1LTAwMDAtMTAw
MC04MDAwLTAwMDJlZTAwMDAwMSkKCVVVSUQ6IEEvViBSZW1vdGUgQ29udHJvbCBUYXJnZXQgKDAw
MDAxMTBjLTAwMDAtMTAwMC04MDAwLTAwODA1ZjliMzRmYikKCVVVSUQ6IEdlbmVyaWMgQXR0cmli
dXRlIFByb2ZpbGUgKDAwMDAxODAxLTAwMDAtMTAwMC04MDAwLTAwODA1ZjliMzRmYikKCVVVSUQ6
IFBob25lYm9vayBBY2Nlc3MgU2VydmVyICAgKDAwMDAxMTJmLTAwMDAtMTAwMC04MDAwLTAwODA1
ZjliMzRmYikKCVVVSUQ6IEF1ZGlvIFNpbmsgICAgICAgICAgICAgICAgKDAwMDAxMTBiLTAwMDAt
MTAwMC04MDAwLTAwODA1ZjliMzRmYikKCVVVSUQ6IERldmljZSBJbmZvcm1hdGlvbiAgICAgICAg
KDAwMDAxODBhLTAwMDAtMTAwMC04MDAwLTAwODA1ZjliMzRmYikKCVVVSUQ6IEdlbmVyaWMgQWNj
ZXNzIFByb2ZpbGUgICAgKDAwMDAxODAwLTAwMDAtMTAwMC04MDAwLTAwODA1ZjliMzRmYikKCVVV
SUQ6IEhhbmRzZnJlZSBBdWRpbyBHYXRld2F5ICAgKDAwMDAxMTFmLTAwMDAtMTAwMC04MDAwLTAw
ODA1ZjliMzRmYikKCVVVSUQ6IEF1ZGlvIFNvdXJjZSAgICAgICAgICAgICAgKDAwMDAxMTBhLTAw
MDAtMTAwMC04MDAwLTAwODA1ZjliMzRmYikKCVVVSUQ6IE9CRVggRmlsZSBUcmFuc2ZlciAgICAg
ICAgKDAwMDAxMTA2LTAwMDAtMTAwMC04MDAwLTAwODA1ZjliMzRmYikKCVVVSUQ6IEhhbmRzZnJl
ZSAgICAgICAgICAgICAgICAgKDAwMDAxMTFlLTAwMDAtMTAwMC04MDAwLTAwODA1ZjliMzRmYikK
CU1vZGFsaWFzOiB1c2I6djFENkJwMDI0NmQwNTQ1CglEaXNjb3ZlcmluZzogbm8KCVJvbGVzOiBj
ZW50cmFsCglSb2xlczogcGVyaXBoZXJhbApBZHZlcnRpc2luZyBGZWF0dXJlczoKCUFjdGl2ZUlu
c3RhbmNlczogMHgwMCAoMCkKCVN1cHBvcnRlZEluc3RhbmNlczogMHgwNSAoNSkKCVN1cHBvcnRl
ZEluY2x1ZGVzOiB0eC1wb3dlcgoJU3VwcG9ydGVkSW5jbHVkZXM6IGFwcGVhcmFuY2UKCVN1cHBv
cnRlZEluY2x1ZGVzOiBsb2NhbC1uYW1lCmBgYAoKYGBgenNoCuKXjyBibHVldG9vdGguc2Vydmlj
ZSAtIEJsdWV0b290aCBzZXJ2aWNlCiAgICAgTG9hZGVkOiBsb2FkZWQgKC91c3IvbGliL3N5c3Rl
bWQvc3lzdGVtL2JsdWV0b290aC5zZXJ2aWNlOyBlbmFibGVkOyBwcmVzZXQ6IGRpc2FibGVkKQog
ICAgIEFjdGl2ZTogYWN0aXZlIChydW5uaW5nKSBzaW5jZSBUaHUgMjAyNC0wMy0yMSAyMzo0Njow
MiBFRFQ7IDJzIGFnbwogICAgICAgRG9jczogbWFuOmJsdWV0b290aGQoOCkKICAgTWFpbiBQSUQ6
IDgyNzAgKGJsdWV0b290aGQpCiAgICAgU3RhdHVzOiAiUnVubmluZyIKICAgICAgVGFza3M6IDEg
KGxpbWl0OiAzOTI1KQogICAgIE1lbW9yeTogMi4wTSAocGVhazogMi4zTSkKICAgICAgICBDUFU6
IDQ2bXMKICAgICBDR3JvdXA6IC9zeXN0ZW0uc2xpY2UvYmx1ZXRvb3RoLnNlcnZpY2UKICAgICAg
ICAgICAgIOKUlOKUgDgyNzAgL3Vzci9saWIvYmx1ZXRvb3RoL2JsdWV0b290aGQKCk1hciAyMSAy
Mzo0NjowMiBIQUwgYmx1ZXRvb3RoZFs4MjcwXTogRW5kcG9pbnQgcmVnaXN0ZXJlZDogc2VuZGVy
PToxLjQ0IHBhdGg9L01lZGlhRW5kcG9pbnQvQTJEUFNvdXJjZS9hcHR4X2xsXzEKTWFyIDIxIDIz
OjQ2OjAyIEhBTCBibHVldG9vdGhkWzgyNzBdOiBFbmRwb2ludCByZWdpc3RlcmVkOiBzZW5kZXI9
OjEuNDQgcGF0aD0vTWVkaWFFbmRwb2ludC9BMkRQU291cmNlL2FwdHhfbGxfMApNYXIgMjEgMjM6
NDY6MDIgSEFMIGJsdWV0b290aGRbODI3MF06IEVuZHBvaW50IHJlZ2lzdGVyZWQ6IHNlbmRlcj06
MS40NCBwYXRoPS9NZWRpYUVuZHBvaW50L0EyRFBTb3VyY2UvYXB0eF9sbF9kdXBsZXhfMQpNYXIg
MjEgMjM6NDY6MDIgSEFMIGJsdWV0b290aGRbODI3MF06IEVuZHBvaW50IHJlZ2lzdGVyZWQ6IHNl
bmRlcj06MS40NCBwYXRoPS9NZWRpYUVuZHBvaW50L0EyRFBTb3VyY2UvYXB0eF9sbF9kdXBsZXhf
MApNYXIgMjEgMjM6NDY6MDIgSEFMIGJsdWV0b290aGRbODI3MF06IEVuZHBvaW50IHJlZ2lzdGVy
ZWQ6IHNlbmRlcj06MS40NCBwYXRoPS9NZWRpYUVuZHBvaW50L0EyRFBTb3VyY2UvZmFzdHN0cmVh
bQpNYXIgMjEgMjM6NDY6MDIgSEFMIGJsdWV0b290aGRbODI3MF06IEVuZHBvaW50IHJlZ2lzdGVy
ZWQ6IHNlbmRlcj06MS40NCBwYXRoPS9NZWRpYUVuZHBvaW50L0EyRFBTb3VyY2UvZmFzdHN0cmVh
bV9kdXBsZXgKTWFyIDIxIDIzOjQ2OjAyIEhBTCBibHVldG9vdGhkWzgyNzBdOiBFbmRwb2ludCBy
ZWdpc3RlcmVkOiBzZW5kZXI9OjEuNDQgcGF0aD0vTWVkaWFFbmRwb2ludC9BMkRQU2luay9vcHVz
XzA1Ck1hciAyMSAyMzo0NjowMiBIQUwgYmx1ZXRvb3RoZFs4MjcwXTogRW5kcG9pbnQgcmVnaXN0
ZXJlZDogc2VuZGVyPToxLjQ0IHBhdGg9L01lZGlhRW5kcG9pbnQvQTJEUFNvdXJjZS9vcHVzXzA1
Ck1hciAyMSAyMzo0NjowMiBIQUwgYmx1ZXRvb3RoZFs4MjcwXTogRW5kcG9pbnQgcmVnaXN0ZXJl
ZDogc2VuZGVyPToxLjQ0IHBhdGg9L01lZGlhRW5kcG9pbnQvQTJEUFNpbmsvb3B1c18wNV9kdXBs
ZXgKTWFyIDIxIDIzOjQ2OjAyIEhBTCBibHVldG9vdGhkWzgyNzBdOiBFbmRwb2ludCByZWdpc3Rl
cmVkOiBzZW5kZXI9OjEuNDQgcGF0aD0vTWVkaWFFbmRwb2ludC9BMkRQU291cmNlL29wdXNfMDVf
ZHVwbGV4CmBgYA==
-----------------------65b410175d41f66955c4833e41809421
Content-Type: application/pgp-keys; filename="publickey - Rustmilian@proton.me - 0x8E492719.asc"; name="publickey - Rustmilian@proton.me - 0x8E492719.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - Rustmilian@proton.me - 0x8E492719.asc"; name="publickey - Rustmilian@proton.me - 0x8E492719.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgp4ak1FWlpUWGdCWUpLd1lCQkFI
YVJ3OEJBUWRBTktKd3RmdkdBcmY5cGpTaERyQ1djRG9Sek1LY1U1RmYKVXo4SndYRXBnb2ZOS0ZK
MWMzUnRhV3hwWVc0Z0tGZHZjbXNwSUR4U2RYTjBiV2xzYVdGdVFIQnliM1J2CmJpNXRaVDdDa3dR
VEZnb0FPeFloQkk1Skp4bXJSNmRxRUxCZkJ1MmdrZGlBY1J4UkJRSmxsTmVBQWhzRApCUXNKQ0Fj
Q0FpSUNCaFVLQ1FnTEFnUVdBZ01CQWg0SEFoZUFBQW9KRU8yZ2tkaUFjUnhSVjd3QkFJWmoKTDhR
aS84YmNzNmpxWDlBcEQ1QnlRd0R0TC91K0JUV0lqRnNkZ3RVdEFRQ3RLeGZ5a0s3QXNPSldOUFVZ
CnBNTWdGMGRKejJvckkrYmNucTNCZXQyS0RzNDRCR1dVMTRBU0Npc0dBUVFCbDFVQkJRRUJCMENH
ejl1WgpzaE13Uno0VDVzMG5CMUpWcjJVRTJtdXc5eVhLNURBdWhCb1VaZ01CQ0FmQ2VBUVlGZ29B
SUJZaEJJNUoKSnhtclI2ZHFFTEJmQnUyZ2tkaUFjUnhSQlFKbGxOZUFBaHNNQUFvSkVPMmdrZGlB
Y1J4Ujl4b0JBSXdaCjk2SDRleHJJemExaitTc1VQLzJSSXlEQ2NaNUdUK2F0NktwODZEQVRBUDRx
Sk8zMTFjdkxyM0dGY2RObgpxb25jc1g4UmJ0Q1dLc21Kc0FtUG9VRUdDdz09Cj11UUhDCi0tLS0t
RU5EIFBHUCBQVUJMSUMgS0VZIEJMT0NLLS0tLS0K
-----------------------65b410175d41f66955c4833e41809421--

--------715b35f60be64c83c04d79020cf36221d043fee1e864ea0aae4bc2646f7c1a47
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKACcFgmX9HBUJkO2gkdiAcRxRFiEEjkknGatHp2oQsF8G7aCR2IBx
HFEAANQ6AQCrxBMahLxat7m9B017pmlYjgcrt94nFuhuX5WCO7dNfAEAmVgX
x1UBb3U+UUra6eE8bklM5dc0Cuss/HyLFCmkyQM=
=nreT
-----END PGP SIGNATURE-----


--------715b35f60be64c83c04d79020cf36221d043fee1e864ea0aae4bc2646f7c1a47--


