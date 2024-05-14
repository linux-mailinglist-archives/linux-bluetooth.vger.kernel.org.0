Return-Path: <linux-bluetooth+bounces-4604-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F5F8C5104
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 May 2024 13:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 405221F2148A
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 May 2024 11:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E66412DD84;
	Tue, 14 May 2024 10:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="IvzrDRon"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-4027.protonmail.ch (mail-4027.protonmail.ch [185.70.40.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C641E12C474
	for <linux-bluetooth@vger.kernel.org>; Tue, 14 May 2024 10:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715683956; cv=none; b=mr38NxQ+Rp94g8LX4/h51Ihud7cUIEKc9FEt1exkqYhOCAe0SnaKixR4Uh/OhZFI1kfX5TBkr6qDdDMOYF0mQWymbXXdz/sgT88bUSTCuwppYLQybl1CgE5doiOqWb/Cb6eHhBt3+JOPsEyJ2fwfKf30XVWatrjuXrWQD4KJUI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715683956; c=relaxed/simple;
	bh=ZkYogbEGN8eYzhwpggq3OqaVz7J2MKyL0AB4jX+nygU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oAchfza0/4j+DLw3Yi4gh42vKBApooAegZTbx7kKKeuswnelV6llQWnVu+A4dcgVuCrulXHKCKJ8z9sS2Rsuye95KvaP80cct/B9AzN8hyv7iS2FkjjNHifFP9e0I6oSvI+S25gqr6SVUx850nUOi8FFWGFWRNBm2sWYKG9tuyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=IvzrDRon; arc=none smtp.client-ip=185.70.40.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1715683951; x=1715943151;
	bh=ZkYogbEGN8eYzhwpggq3OqaVz7J2MKyL0AB4jX+nygU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=IvzrDRonBWWVxOdCMVdBPLbbsIH2c/1J2uNfzWSQLSg3d3fGZJTv+LrPPiLNih2hD
	 rKBwhKPF2rzR1to5CGAOcaOncpkx6R8ZKSDppxJlaIfBMxPWwfVcIBS1hHs6Sk/WmQ
	 RD9ulqeK38XA09Mrsi8w9LLwuXPJKZa1QNzGwBzMnFteP+jzOwkEw7B4IdM0b6TyoR
	 NtpUqq0kms6j2pupqgEVjciuF4ExwPTE6HHb99m52dK//GwXXBUJw2uzXZwhInmv4T
	 XtjHZ8OPrY4DWLWN3+CNfIYuwg1as0zNhxilm44GqQ8B0r9Ii1uTVXJnbww7DNUuEC
	 vujMKXY4pj9zw==
Date: Tue, 14 May 2024 10:52:29 +0000
To: "marcel@holtmann.org" <marcel@holtmann.org>, "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>
From: "SoloSaravanan@proton.me" <SoloSaravanan@proton.me>
Cc: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] Bluetooth: btusb: Add device 13d3:3606 as MT7921 device
Message-ID: <5aweNli8mhqprLPB0O418QX4MYtylYw3R6Zaof-xBxNqcuBY9WfT23vrdlrPGSDs2lksHC0iwXGzyVQq91VRQ38hJOecQZX2c_eEqk8Snz4=@proton.me>
Feedback-ID: 84438951:user:proton
X-Pm-Message-ID: 43b918bdc097dd85a3d99f87b251b9118e56e8d3
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1_zPeR0nwFNwl1S8RkK9z2SL2ksqsqGeq7xB99Of9deY"

This is a multi-part message in MIME format.

--b1_zPeR0nwFNwl1S8RkK9z2SL2ksqsqGeq7xB99Of9deY
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Empty Message
--b1_zPeR0nwFNwl1S8RkK9z2SL2ksqsqGeq7xB99Of9deY
Content-Type: text/x-patch; name=0001-Bluetooth-btusb-Add-device-13d3-3606-as-MT7921-devic.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=0001-Bluetooth-btusb-Add-device-13d3-3606-as-MT7921-devic.patch

RnJvbSBhMThlYjk3NDc5NjY4MjJiNzA4YjJmODJlMWNhMDNmYWI3OTYwODBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTb2xvU2FyYXZhbmFuIDxTb2xvU2FyYXZhbmFuQHByb3Rvbi5t
ZT4KRGF0ZTogVHVlLCAxNCBNYXkgMjAyNCAxNjoxODowNSArMDUzMApTdWJqZWN0OiBbUEFUQ0hd
IEJsdWV0b290aDogYnR1c2I6IEFkZCBkZXZpY2UgMTNkMzozNjA2IGFzIE1UNzkyMSBkZXZpY2UK
CkFkZCBWZW5kb3JJRCAxM2QzICYgUHJvZElEIDM2MDYgZm9yIE1lZGlhVGVrIE1UNzkyMSBVU0Ig
Qmx1ZXRvb3RoIGNoaXAuCgpUaGUgaW5mb3JtYXRpb24gaW4gL3N5cy9rZXJuZWwvZGVidWcvdXNi
L2RldmljZXMgYWJvdXQgdGhlIEJsdWV0b290aApkZXZpY2UgaXMgbGlzdGVkIGFzIHRoZSBiZWxv
dy4KClQ6ICBCdXM9MDMgTGV2PTAxIFBybnQ9MDEgUG9ydD0wOSBDbnQ9MDMgRGV2Iz0gIDQgU3Bk
PTQ4MCAgTXhDaD0gMApEOiAgVmVyPSAyLjEwIENscz1lZihtaXNjICkgU3ViPTAyIFByb3Q9MDEg
TXhQUz02NCAjQ2Zncz0gIDEKUDogIFZlbmRvcj0xM2QzIFByb2RJRD0zNjA2IFJldj0gMS4wMApT
OiAgTWFudWZhY3R1cmVyPU1lZGlhVGVrIEluYy4KUzogIFByb2R1Y3Q9V2lyZWxlc3NfRGV2aWNl
ClM6ICBTZXJpYWxOdW1iZXI9MDAwMDAwMDAwCkM6KiAjSWZzPSAzIENmZyM9IDEgQXRyPWUwIE14
UHdyPTEwMG1BCkE6ICBGaXJzdElmIz0gMCBJZkNvdW50PSAzIENscz1lMCh3bGNvbikgU3ViPTAx
IFByb3Q9MDEKSToqIElmIz0gMCBBbHQ9IDAgI0VQcz0gMyBDbHM9ZTAod2xjb24pIFN1Yj0wMSBQ
cm90PTAxIERyaXZlcj1idHVzYgpFOiAgQWQ9ODEoSSkgQXRyPTAzKEludC4pIE14UFM9ICAxNiBJ
dmw9MTI1dXMKRTogIEFkPTgyKEkpIEF0cj0wMihCdWxrKSBNeFBTPSA1MTIgSXZsPTBtcwpFOiAg
QWQ9MDIoTykgQXRyPTAyKEJ1bGspIE14UFM9IDUxMiBJdmw9MG1zCkk6KiBJZiM9IDEgQWx0PSAw
ICNFUHM9IDIgQ2xzPWUwKHdsY29uKSBTdWI9MDEgUHJvdD0wMSBEcml2ZXI9YnR1c2IKRTogIEFk
PTgzKEkpIEF0cj0wMShJc29jKSBNeFBTPSAgIDAgSXZsPTFtcwpFOiAgQWQ9MDMoTykgQXRyPTAx
KElzb2MpIE14UFM9ICAgMCBJdmw9MW1zCkk6ICBJZiM9IDEgQWx0PSAxICNFUHM9IDIgQ2xzPWUw
KHdsY29uKSBTdWI9MDEgUHJvdD0wMSBEcml2ZXI9YnR1c2IKRTogIEFkPTgzKEkpIEF0cj0wMShJ
c29jKSBNeFBTPSAgIDkgSXZsPTFtcwpFOiAgQWQ9MDMoTykgQXRyPTAxKElzb2MpIE14UFM9ICAg
OSBJdmw9MW1zCkk6ICBJZiM9IDEgQWx0PSAyICNFUHM9IDIgQ2xzPWUwKHdsY29uKSBTdWI9MDEg
UHJvdD0wMSBEcml2ZXI9YnR1c2IKRTogIEFkPTgzKEkpIEF0cj0wMShJc29jKSBNeFBTPSAgMTcg
SXZsPTFtcwpFOiAgQWQ9MDMoTykgQXRyPTAxKElzb2MpIE14UFM9ICAxNyBJdmw9MW1zCkk6ICBJ
ZiM9IDEgQWx0PSAzICNFUHM9IDIgQ2xzPWUwKHdsY29uKSBTdWI9MDEgUHJvdD0wMSBEcml2ZXI9
YnR1c2IKRTogIEFkPTgzKEkpIEF0cj0wMShJc29jKSBNeFBTPSAgMjUgSXZsPTFtcwpFOiAgQWQ9
MDMoTykgQXRyPTAxKElzb2MpIE14UFM9ICAyNSBJdmw9MW1zCkk6ICBJZiM9IDEgQWx0PSA0ICNF
UHM9IDIgQ2xzPWUwKHdsY29uKSBTdWI9MDEgUHJvdD0wMSBEcml2ZXI9YnR1c2IKRTogIEFkPTgz
KEkpIEF0cj0wMShJc29jKSBNeFBTPSAgMzMgSXZsPTFtcwpFOiAgQWQ9MDMoTykgQXRyPTAxKElz
b2MpIE14UFM9ICAzMyBJdmw9MW1zCkk6ICBJZiM9IDEgQWx0PSA1ICNFUHM9IDIgQ2xzPWUwKHds
Y29uKSBTdWI9MDEgUHJvdD0wMSBEcml2ZXI9YnR1c2IKRTogIEFkPTgzKEkpIEF0cj0wMShJc29j
KSBNeFBTPSAgNDkgSXZsPTFtcwpFOiAgQWQ9MDMoTykgQXRyPTAxKElzb2MpIE14UFM9ICA0OSBJ
dmw9MW1zCkk6ICBJZiM9IDEgQWx0PSA2ICNFUHM9IDIgQ2xzPWUwKHdsY29uKSBTdWI9MDEgUHJv
dD0wMSBEcml2ZXI9YnR1c2IKRTogIEFkPTgzKEkpIEF0cj0wMShJc29jKSBNeFBTPSAgNjMgSXZs
PTFtcwpFOiAgQWQ9MDMoTykgQXRyPTAxKElzb2MpIE14UFM9ICA2MyBJdmw9MW1zCkk6KiBJZiM9
IDIgQWx0PSAwICNFUHM9IDIgQ2xzPWUwKHdsY29uKSBTdWI9MDEgUHJvdD0wMSBEcml2ZXI9KG5v
bmUpCkU6ICBBZD04YShJKSBBdHI9MDMoSW50LikgTXhQUz0gIDY0IEl2bD0xMjV1cwpFOiAgQWQ9
MGEoTykgQXRyPTAzKEludC4pIE14UFM9ICA2NCBJdmw9MTI1dXMKSTogIElmIz0gMiBBbHQ9IDEg
I0VQcz0gMiBDbHM9ZTAod2xjb24pIFN1Yj0wMSBQcm90PTAxIERyaXZlcj0obm9uZSkKRTogIEFk
PThhKEkpIEF0cj0wMyhJbnQuKSBNeFBTPSA1MTIgSXZsPTEyNXVzCkU6ICBBZD0wYShPKSBBdHI9
MDMoSW50LikgTXhQUz0gNTEyIEl2bD0xMjV1cwoKU2lnbmVkLW9mZi1ieTogU29sb1NhcmF2YW5h
biA8U29sb1NhcmF2YW5hbkBwcm90b24ubWU+Ci0tLQogZHJpdmVycy9ibHVldG9vdGgvYnR1c2Iu
YyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ibHVldG9vdGgvYnR1c2IuYyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0dXNiLmMKaW5k
ZXggZTM5NDZmN2I3MzZlLi5hYWRhYjA0Yzc0NTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmx1ZXRv
b3RoL2J0dXNiLmMKKysrIGIvZHJpdmVycy9ibHVldG9vdGgvYnR1c2IuYwpAQCAtNjE4LDYgKzYx
OCw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2RldmljZV9pZCBxdWlya3NfdGFibGVbXSA9
IHsKIAl7IFVTQl9ERVZJQ0UoMHgwZThkLCAweDA2MDgpLCAuZHJpdmVyX2luZm8gPSBCVFVTQl9N
RURJQVRFSyB8CiAJCQkJCQkgICAgIEJUVVNCX1dJREVCQU5EX1NQRUVDSCB8CiAJCQkJCQkgICAg
IEJUVVNCX1ZBTElEX0xFX1NUQVRFUyB9LAorCXsgVVNCX0RFVklDRSgweDEzZDMsIDB4MzYwNiks
IC5kcml2ZXJfaW5mbyA9IEJUVVNCX01FRElBVEVLIHwKKwkJCQkJCSAgICAgQlRVU0JfV0lERUJB
TkRfU1BFRUNIIHwKKwkJCQkJCSAgICAgQlRVU0JfVkFMSURfTEVfU1RBVEVTIH0sCiAKIAkvKiBN
ZWRpYVRlayBNVDc5MjJBIEJsdWV0b290aCBkZXZpY2VzICovCiAJeyBVU0JfREVWSUNFKDB4MDQ4
OSwgMHhlMGQ4KSwgLmRyaXZlcl9pbmZvID0gQlRVU0JfTUVESUFURUsgfAotLSAKMi40NS4wCgo=

--b1_zPeR0nwFNwl1S8RkK9z2SL2ksqsqGeq7xB99Of9deY--


