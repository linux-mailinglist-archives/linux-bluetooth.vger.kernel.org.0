Return-Path: <linux-bluetooth+bounces-6205-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 036D29321E3
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jul 2024 10:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23D8C1C20D47
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jul 2024 08:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F00181CF0;
	Tue, 16 Jul 2024 08:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="p+ThRuvw"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B253181BA8
	for <linux-bluetooth@vger.kernel.org>; Tue, 16 Jul 2024 08:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721118690; cv=none; b=mhEJX53zRzARd/NablmSCTG2UnkdW02Odd3Uh6KByOBzSWZh6EmqDg8RDPK1qu0qKI3I+5Z2FvJSlQ9lmszgGSNTuikf7I6QveGkHXr36HgEBvPFXh/p9TG5UkxpY9uxRJSMkbn3fOK/WrlJ8v/myzpcUYfpfOX6USE+ShiV8gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721118690; c=relaxed/simple;
	bh=s49ikt1PanQxeOC8tQP7H4yQyKEnbjBLwF3fTzf0T80=;
	h=From:To:Subject:Mime-Version:Content-Type:Date:Message-ID; b=Y6opqqzrBeOtPSh2Y9FAkZuteHXuNwSpvfxXdREQXwDIxdLExNqRbSah6aJ/VqoxsQEPkRH5RUvZ+d8hMD7zDjRH4eyepdqE57QfRlLMmDlCJgfonJWPhMjQZHjEAGH8lJ1W1pV9Ncjtp/S4sYDfm3Tm2+SgBjfMJPyyBb/WrPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=p+ThRuvw; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1721118678; bh=3sF++onH7c4DCjrrtUb3ma9HfW1SjYef3UZdxermLf0=;
	h=From:To:Subject:Date;
	b=p+ThRuvwuYW6eBtF4el2leaTyaKc3cyyJlUoSoFIEph2NHVD3XVirmpMj/TaaQOiJ
	 gPrx44/AkizD4mB1BcTyAlxnVM2QeROP8F9VjJNzhXnjhq9I06CIQYS52LNryzkUig
	 yQvAGFUL8EVPo37nQacZlBGSu/a3cNfG+QFmxOfo=
X-QQ-FEAT: oHWrrGTW1dCni6VLWI7Xi3lwP5c1dnPf
X-QQ-SSF: 00000000000000F0000000000000
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-XMAILINFO: NYkikJUPiuZj6pibQX09x4y0hvh3zHA2i+D3VJORjhGzacfTOr0H92FwhVWSXh
	 RU2vKYqLk1mOWtTjM36sTKUDp9WZESZYEFoOV3Ch8ZeKbhzVClHJHt7+HAUOIrtG/WG1kX25al/fJ
	 lgPzegZyAEC4rzT5GRO4BEBLU3tVWDCa/gKORWwN1opq9Wvd+c7BpjX/PRGJ/9oY/ywYUy3n8O+RZ
	 9IkOxn8V/NXGdB/F6RIGFxvGAzTBKgDzQa1ohH4d7wjGr+cIr80PB/VYySgSf4SOA9D1j0/AUTRyu
	 Tf0SHHa+YxPTLvWmWHE6zTrWz9qQFuiKkfg8hqqWiG69kJcTdPJXlDrcCYLoTv+o16BO9wElHbti0
	 kSzsCNeUvg2yQ7LU5MTKrsHeJFfyuBn6tMGjUjZxSRL9N3zrvrLyyx5JG9+k6FV1x2SXN3BnHglLd
	 8jhqIUgOJlFwK1HPon1+VYgbPe/nNilIW/3A2u8r2lk+4MGTVNTdEbNj9QHgvpuWe3Mm97t+vCY5g
	 8lKhOl416SQlYSidHaoRBIWBL7zDlI3vVWAWzAQfv/SSvqNchufqflng2AQZL17CZ580WOFN4iwHz
	 FKAYAsG//jlDQfWXD6UwdqnAR8hBVLfM9Bj9uA4+eAVDQx2l0KK+dZxXZujqZmDZVKSCSdczNNyO/
	 ge0Tln/n516Y2+GdDgCZp54GIgNm6Dv3fSFojpuhFfLHfkr9ADvnJX+/rh8EUfzKbasMii7agt/XD
	 siAyeLp9HWbOn30C9UXtCrlw0+W6QvrID0ZQ3O5jf6c1ZyQkOimE8frHe7YlH9Kr70MnXk7Izq1tw
	 UV8VDdp3aeulI1vjVBpQdLWNp0G2d3Vhuxk4HKxPTWvL18kqK3jTcQwQCxkeovgmnr+YbxBdV9W6X
	 gKpv95AkSZTz0z1zkjxnx7JsNB56ba49FklytJoug6O/GriRh5hhVI0QRCGCQVLUzCNmTTXy9bTIx
	 o2rqWnfoGpuzHmCd8/IfB97yPC8uCVscTElMVREeJ4c3eTRXmF
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-STYLE: 
X-QQ-mid: webmail441t1721118677t5684845
From: "=?gb18030?B?Li4uwLTByw==?=" <294305068@qq.com>
To: "=?gb18030?B?bGludXgtYmx1ZXRvb3Ro?=" <linux-bluetooth@vger.kernel.org>, "=?gb18030?B?c2VjdXJpdHk=?=" <security@bluez.org>
Subject: =?gb18030?B?Ymx1ZXogcGF0Y2ijqEFmdGVyIHBhaXJpbmcgc3Vj?=
 =?gb18030?B?Y2Vzc2Z1bGx5LCBsb3cgcG93ZXIgbW91c2UgYW5k?=
 =?gb18030?B?IGtleWJvYXJkIGNvbm5lY3Rpb25zIGNhbm5vdCBi?=
 =?gb18030?B?ZSByZWNlaXZlZKOp?=
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_66962FD5_145471F0_74502759"
Content-Transfer-Encoding: 8Bit
Date: Tue, 16 Jul 2024 16:31:17 +0800
X-Priority: 3
Message-ID: <tencent_65B535511B431B3BF0E7CE04946DB76F140A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x

This is a multi-part message in MIME format.

------=_NextPart_66962FD5_145471F0_74502759
Content-Type: multipart/alternative;
	boundary="----=_NextPart_66962FD5_145471F0_18ECCF2F";

------=_NextPart_66962FD5_145471F0_18ECCF2F
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

Qmx1ZXogdmVyc2lvbiBpcyBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gNS42OSAsIHdoZW4g
cGFpcmVkIHN1Y2Nlc3NmdWxseSwgdHVybiBCbHVldG9vdGggb2ZmIGFuZCB0aGVuIG9uLCB1
bmFibGUgdG8gcmVjZWl2ZSBhIGxvdy1wb3dlciBtb3VzZSBhbmQga2V5Ym9hcmQgY29ubmVj
dGlvbi4NCg0KDQoNCkFmdGVyIGFuYWx5c2lzLCB0aGUgbWdtdCBjb21tYW5kKE1HTVRfT1Bf
QUREX0RFVklDRSkgd2FzIG5vdCBzZW50IHRvIHRoZSBrZXJuZWwgYWZ0ZXIgdGhlIHBhaXJp
bmcgY29ubmVjdGlvbiB3YXMgY29tcGxldGVkLg0KDQoNCg0KSGVyZSdzIGhvdyB0byBmaXgg
dGhlIHBhdGNoDQpkaWZmIC0tZ2l0IGEvc3JjL2RldmljZS5jIGIvc3JjL2RldmljZS5jIGlu
ZGV4IDA5N2IxZmJiYS4uN2IxODc4MWM4IDEwMDY0NCAtLS0gYS9zcmMvZGV2aWNlLmMgKysr
IGIvc3JjL2RldmljZS5jIEBAIC02MDYyLDYgKzYwNjIsMTAgQEAgdm9pZCBidGRfZGV2aWNl
X3NldF90ZW1wb3Jhcnkoc3RydWN0IGJ0ZF9kZXZpY2UgKmRldmljZSwgYm9vbCB0ZW1wb3Jh
cnkpICAgIAlpZiAoZGV2aWNlLSZndDticmVkcikgIAkJYWRhcHRlcl9hY2NlcHRfbGlzdF9h
ZGQoZGV2aWNlLSZndDthZGFwdGVyLCBkZXZpY2UpOyArCWVsc2UgaWYgKGRldmljZS0mZ3Q7
bGUpIHsgKwkJZGV2aWNlLSZndDtkaXNhYmxlX2F1dG9fY29ubmVjdCA9IEZBTFNFOyArCQlk
ZXZpY2Vfc2V0X2F1dG9fY29ubmVjdChkZXZpY2UsIFRSVUUpOyArCX0gICAgCXN0b3JlX2Rl
dmljZV9pbmZvKGRldmljZSk7DQoNCg0Kd2ViIGFkZHJlc3M6Jm5ic3A7aHR0cHM6Ly9naXRo
dWIuY29tL2JsdWV6L2JsdWV6L2lzc3Vlcy85MDINCg0KDQouLi7AtMHLDQoyOTQzMDUwNjhA
cXEuY29tDQoNCg0KDQombmJzcDs=

------=_NextPart_66962FD5_145471F0_18ECCF2F
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj48aDEgY2xhc3M9ImdoLWhlYWRlci10aXRsZSBtYi0yIGxo
LWNvbmRlbnNlZCBmMSBtci0wIGZsZXgtYXV0byB3Yi1icmVhay13b3JkIiBzdHlsZT0iYm94
LXNpemluZzogYm9yZGVyLWJveDsgbWFyZ2luOiAwcHggMTUwcHggMHB4IDBweDsgbGluZS1o
ZWlnaHQ6IDEuMTI1OyBvdmVyZmxvdy13cmFwOiBicmVhay13b3JkOyBmbGV4OiAxIDEgYXV0
byAhaW1wb3J0YW50OyB3b3JkLWJyZWFrOiBicmVhay13b3JkICFpbXBvcnRhbnQ7Ij48YmRp
IGNsYXNzPSJqcy1pc3N1ZS10aXRsZSBtYXJrZG93bi10aXRsZSIgc3R5bGU9ImJveC1zaXpp
bmc6IGJvcmRlci1ib3g7IGZvbnQtd2VpZ2h0OiBub3JtYWw7Ij48Zm9udCBzaXplPSI0Ij5C
bHVleiB2ZXJzaW9uIGlzIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byA1LjY5ICwgd2hlbiBw
YWlyZWQgc3VjY2Vzc2Z1bGx5LCB0dXJuIEJsdWV0b290aCBvZmYgYW5kIHRoZW4gb24sIHVu
YWJsZSB0byByZWNlaXZlIGEgbG93LXBvd2VyIG1vdXNlIGFuZCBrZXlib2FyZCBjb25uZWN0
aW9uLjwvZm9udD48L2JkaT48L2gxPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJkaSBj
bGFzcz0ianMtaXNzdWUtdGl0bGUgbWFya2Rvd24tdGl0bGUiIHN0eWxlPSJib3gtc2l6aW5n
OiBib3JkZXItYm94OyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMzEsIDM1LCA0MCk7IGZv
bnQtZmFtaWx5OiAtYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1Nl
Z29lIFVJJnF1b3Q7LCAmcXVvdDtOb3RvIFNhbnMmcXVvdDssIEhlbHZldGljYSwgQXJpYWws
IHNhbnMtc2VyaWYsICZxdW90O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdv
ZSBVSSBFbW9qaSZxdW90OzsiPkFmdGVyIGFuYWx5c2lzLCB0aGUgbWdtdCBjb21tYW5kKE1H
TVRfT1BfQUREX0RFVklDRSkgd2FzIG5vdCBzZW50IHRvIHRoZSBrZXJuZWwgYWZ0ZXIgdGhl
IHBhaXJpbmcgY29ubmVjdGlvbiB3YXMgY29tcGxldGVkLjwvc3Bhbj48L2JkaT48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PjxwIGRpcj0iYXV0byIgc3R5bGU9ImJveC1zaXppbmc6IGJv
cmRlci1ib3g7IG1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogdmFyKC0tYmFzZS1z
aXplLTE2KTsgY29sb3I6IHJnYigzMSwgMzUsIDQwKTsgZm9udC1mYW1pbHk6IC1hcHBsZS1z
eXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7U2Vnb2UgVUkmcXVvdDssICZxdW90
O05vdG8gU2FucyZxdW90OywgSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZiwgJnF1b3Q7
QXBwbGUgQ29sb3IgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJIEVtb2ppJnF1b3Q7OyI+
PGVtIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyI+PHNwYW4gc3R5bGU9ImJveC1z
aXppbmc6IGJvcmRlci1ib3g7IGZvbnQtd2VpZ2h0OiB2YXIoLS1iYXNlLXRleHQtd2VpZ2h0
LXNlbWlib2xkLCA2MDApOyI+SGVyZSdzIGhvdyB0byBmaXggdGhlIHBhdGNoPC9zcGFuPjwv
ZW0+PC9wPjxkaXYgY2xhc3M9ImhpZ2hsaWdodCBoaWdobGlnaHQtc291cmNlLWMgbm90cmFu
c2xhdGUgcG9zaXRpb24tcmVsYXRpdmUgb3ZlcmZsb3ctYXV0byIgZGlyPSJhdXRvIiBzdHls
ZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgbWFyZ2luLWJvdHRvbTogdmFyKC0tYmFzZS1z
aXplLTE2KTsgY29sb3I6IHJnYigzMSwgMzUsIDQwKTsgZm9udC1mYW1pbHk6IC1hcHBsZS1z
eXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7U2Vnb2UgVUkmcXVvdDssICZxdW90
O05vdG8gU2FucyZxdW90OywgSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZiwgJnF1b3Q7
QXBwbGUgQ29sb3IgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJIEVtb2ppJnF1b3Q7OyBw
b3NpdGlvbjogcmVsYXRpdmUgIWltcG9ydGFudDsgb3ZlcmZsb3c6IHZpc2libGUgIWltcG9y
dGFudDsiPjxwcmUgY2xhc3M9Im5vdHJhbnNsYXRlIiBzdHlsZT0iYm94LXNpemluZzogYm9y
ZGVyLWJveDsgZm9udC1mYW1pbHk6IHZhcigtLWZvbnRTdGFjay1tb25vc3BhY2UsIHVpLW1v
bm9zcGFjZSwgU0ZNb25vLVJlZ3VsYXIsIFNGIE1vbm8sIE1lbmxvLCBDb25zb2xhcywgTGli
ZXJhdGlvbiBNb25vLCBtb25vc3BhY2UpOyBmb250LXNpemU6IDEycHg7IG1hcmdpbi10b3A6
IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBvdmVyZmxvdy13cmFwOiBub3JtYWw7IHBhZGRp
bmc6IHZhcigtLWJhc2Utc2l6ZS0xNik7IG92ZXJmbG93OiBhdXRvOyBsaW5lLWhlaWdodDog
MS40NTsgY29sb3I6IHZhcigtLWZnQ29sb3ItZGVmYXVsdCwgdmFyKC0tY29sb3ItZmctZGVm
YXVsdCkpOyBiYWNrZ3JvdW5kLWNvbG9yOiB2YXIoLS1iZ0NvbG9yLW11dGVkLCB2YXIoLS1j
b2xvci1jYW52YXMtc3VidGxlKSk7IGJvcmRlci1yYWRpdXM6IDZweDsgd29yZC1icmVhazog
bm9ybWFsOyI+PHNwYW4gY2xhc3M9InBsLXMxIiBzdHlsZT0iYm94LXNpemluZzogYm9yZGVy
LWJveDsiPmRpZmY8L3NwYW4+IDxzcGFuIGNsYXNzPSJwbC1jMSIgc3R5bGU9ImJveC1zaXpp
bmc6IGJvcmRlci1ib3g7IGNvbG9yOiB2YXIoLS1jb2xvci1wcmV0dHlsaWdodHMtc3ludGF4
LWNvbnN0YW50KTsiPi0tPC9zcGFuPjxzcGFuIGNsYXNzPSJwbC1zMSIgc3R5bGU9ImJveC1z
aXppbmc6IGJvcmRlci1ib3g7Ij5naXQ8L3NwYW4+IDxzcGFuIGNsYXNzPSJwbC1zMSIgc3R5
bGU9ImJveC1zaXppbmc6IGJvcmRlci1ib3g7Ij5hPC9zcGFuPi88c3BhbiBjbGFzcz0icGwt
czEiIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyI+c3JjPC9zcGFuPi88c3BhbiBj
bGFzcz0icGwtczEiIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyI+ZGV2aWNlPC9z
cGFuPi48c3BhbiBjbGFzcz0icGwtYzEiIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94
OyBjb2xvcjogdmFyKC0tY29sb3ItcHJldHR5bGlnaHRzLXN5bnRheC1jb25zdGFudCk7Ij5j
PC9zcGFuPiA8c3BhbiBjbGFzcz0icGwtczEiIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXIt
Ym94OyI+Yjwvc3Bhbj4vPHNwYW4gY2xhc3M9InBsLXMxIiBzdHlsZT0iYm94LXNpemluZzog
Ym9yZGVyLWJveDsiPnNyYzwvc3Bhbj4vPHNwYW4gY2xhc3M9InBsLXMxIiBzdHlsZT0iYm94
LXNpemluZzogYm9yZGVyLWJveDsiPmRldmljZTwvc3Bhbj4uPHNwYW4gY2xhc3M9InBsLWMx
IiBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgY29sb3I6IHZhcigtLWNvbG9yLXBy
ZXR0eWxpZ2h0cy1zeW50YXgtY29uc3RhbnQpOyI+Yzwvc3Bhbj4KPHNwYW4gY2xhc3M9InBs
LXMxIiBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsiPmluZGV4PC9zcGFuPiA8c3Bh
biBjbGFzcz0icGwtYzEiIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyBjb2xvcjog
dmFyKC0tY29sb3ItcHJldHR5bGlnaHRzLXN5bnRheC1jb25zdGFudCk7Ij4wOTc8L3NwYW4+
PHNwYW4gY2xhc3M9InBsLXMxIiBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsiPmIx
ZmJiYTwvc3Bhbj4uPHNwYW4gY2xhc3M9InBsLWMxIiBzdHlsZT0iYm94LXNpemluZzogYm9y
ZGVyLWJveDsgY29sb3I6IHZhcigtLWNvbG9yLXByZXR0eWxpZ2h0cy1zeW50YXgtY29uc3Rh
bnQpOyI+Ljc8L3NwYW4+PHNwYW4gY2xhc3M9InBsLWMxIiBzdHlsZT0iYm94LXNpemluZzog
Ym9yZGVyLWJveDsgY29sb3I6IHZhcigtLWNvbG9yLXByZXR0eWxpZ2h0cy1zeW50YXgtY29u
c3RhbnQpOyI+YjE4NzgxYzg8L3NwYW4+IDxzcGFuIGNsYXNzPSJwbC1jMSIgc3R5bGU9ImJv
eC1zaXppbmc6IGJvcmRlci1ib3g7IGNvbG9yOiB2YXIoLS1jb2xvci1wcmV0dHlsaWdodHMt
c3ludGF4LWNvbnN0YW50KTsiPjEwMDY0NDwvc3Bhbj4KPHNwYW4gY2xhc3M9InBsLWMxIiBz
dHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgY29sb3I6IHZhcigtLWNvbG9yLXByZXR0
eWxpZ2h0cy1zeW50YXgtY29uc3RhbnQpOyI+LS08L3NwYW4+PHNwYW4gY2xhc3M9InBsLWMx
IiBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgY29sb3I6IHZhcigtLWNvbG9yLXBy
ZXR0eWxpZ2h0cy1zeW50YXgtY29uc3RhbnQpOyI+LTwvc3Bhbj4gPHNwYW4gY2xhc3M9InBs
LXMxIiBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsiPmE8L3NwYW4+LzxzcGFuIGNs
YXNzPSJwbC1zMSIgc3R5bGU9ImJveC1zaXppbmc6IGJvcmRlci1ib3g7Ij5zcmM8L3NwYW4+
LzxzcGFuIGNsYXNzPSJwbC1zMSIgc3R5bGU9ImJveC1zaXppbmc6IGJvcmRlci1ib3g7Ij5k
ZXZpY2U8L3NwYW4+LjxzcGFuIGNsYXNzPSJwbC1jMSIgc3R5bGU9ImJveC1zaXppbmc6IGJv
cmRlci1ib3g7IGNvbG9yOiB2YXIoLS1jb2xvci1wcmV0dHlsaWdodHMtc3ludGF4LWNvbnN0
YW50KTsiPmM8L3NwYW4+CjxzcGFuIGNsYXNzPSJwbC1jMSIgc3R5bGU9ImJveC1zaXppbmc6
IGJvcmRlci1ib3g7IGNvbG9yOiB2YXIoLS1jb2xvci1wcmV0dHlsaWdodHMtc3ludGF4LWNv
bnN0YW50KTsiPisrPC9zcGFuPjxzcGFuIGNsYXNzPSJwbC1jMSIgc3R5bGU9ImJveC1zaXpp
bmc6IGJvcmRlci1ib3g7IGNvbG9yOiB2YXIoLS1jb2xvci1wcmV0dHlsaWdodHMtc3ludGF4
LWNvbnN0YW50KTsiPis8L3NwYW4+IDxzcGFuIGNsYXNzPSJwbC1zMSIgc3R5bGU9ImJveC1z
aXppbmc6IGJvcmRlci1ib3g7Ij5iPC9zcGFuPi88c3BhbiBjbGFzcz0icGwtczEiIHN0eWxl
PSJib3gtc2l6aW5nOiBib3JkZXItYm94OyI+c3JjPC9zcGFuPi88c3BhbiBjbGFzcz0icGwt
czEiIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyI+ZGV2aWNlPC9zcGFuPi48c3Bh
biBjbGFzcz0icGwtYzEiIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyBjb2xvcjog
dmFyKC0tY29sb3ItcHJldHR5bGlnaHRzLXN5bnRheC1jb25zdGFudCk7Ij5jPC9zcGFuPgpA
QCA8c3BhbiBjbGFzcz0icGwtYzEiIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyBj
b2xvcjogdmFyKC0tY29sb3ItcHJldHR5bGlnaHRzLXN5bnRheC1jb25zdGFudCk7Ij4tNjA2
Mjwvc3Bhbj4sPHNwYW4gY2xhc3M9InBsLWMxIiBzdHlsZT0iYm94LXNpemluZzogYm9yZGVy
LWJveDsgY29sb3I6IHZhcigtLWNvbG9yLXByZXR0eWxpZ2h0cy1zeW50YXgtY29uc3RhbnQp
OyI+Njwvc3Bhbj4gPHNwYW4gY2xhc3M9InBsLWMxIiBzdHlsZT0iYm94LXNpemluZzogYm9y
ZGVyLWJveDsgY29sb3I6IHZhcigtLWNvbG9yLXByZXR0eWxpZ2h0cy1zeW50YXgtY29uc3Rh
bnQpOyI+Kzwvc3Bhbj48c3BhbiBjbGFzcz0icGwtYzEiIHN0eWxlPSJib3gtc2l6aW5nOiBi
b3JkZXItYm94OyBjb2xvcjogdmFyKC0tY29sb3ItcHJldHR5bGlnaHRzLXN5bnRheC1jb25z
dGFudCk7Ij42MDYyPC9zcGFuPiw8c3BhbiBjbGFzcz0icGwtYzEiIHN0eWxlPSJib3gtc2l6
aW5nOiBib3JkZXItYm94OyBjb2xvcjogdmFyKC0tY29sb3ItcHJldHR5bGlnaHRzLXN5bnRh
eC1jb25zdGFudCk7Ij4xMDwvc3Bhbj4gQEAgPHNwYW4gY2xhc3M9InBsLXNtaSIgc3R5bGU9
ImJveC1zaXppbmc6IGJvcmRlci1ib3g7IGNvbG9yOiB2YXIoLS1jb2xvci1wcmV0dHlsaWdo
dHMtc3ludGF4LXN0b3JhZ2UtbW9kaWZpZXItaW1wb3J0KTsiPnZvaWQ8L3NwYW4+IDxzcGFu
IGNsYXNzPSJwbC1lbiIgc3R5bGU9ImJveC1zaXppbmc6IGJvcmRlci1ib3g7IGNvbG9yOiB2
YXIoLS1jb2xvci1wcmV0dHlsaWdodHMtc3ludGF4LWVudGl0eSk7Ij5idGRfZGV2aWNlX3Nl
dF90ZW1wb3Jhcnk8L3NwYW4+KDxzcGFuIGNsYXNzPSJwbC1rIiBzdHlsZT0iYm94LXNpemlu
ZzogYm9yZGVyLWJveDsgY29sb3I6IHZhcigtLWNvbG9yLXByZXR0eWxpZ2h0cy1zeW50YXgt
a2V5d29yZCk7Ij5zdHJ1Y3Q8L3NwYW4+IDxzcGFuIGNsYXNzPSJwbC1zbWkiIHN0eWxlPSJi
b3gtc2l6aW5nOiBib3JkZXItYm94OyBjb2xvcjogdmFyKC0tY29sb3ItcHJldHR5bGlnaHRz
LXN5bnRheC1zdG9yYWdlLW1vZGlmaWVyLWltcG9ydCk7Ij5idGRfZGV2aWNlPC9zcGFuPiA8
c3BhbiBjbGFzcz0icGwtYzEiIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyBjb2xv
cjogdmFyKC0tY29sb3ItcHJldHR5bGlnaHRzLXN5bnRheC1jb25zdGFudCk7Ij4qPC9zcGFu
PjxzcGFuIGNsYXNzPSJwbC1zMSIgc3R5bGU9ImJveC1zaXppbmc6IGJvcmRlci1ib3g7Ij5k
ZXZpY2U8L3NwYW4+LCA8c3BhbiBjbGFzcz0icGwtc21pIiBzdHlsZT0iYm94LXNpemluZzog
Ym9yZGVyLWJveDsgY29sb3I6IHZhcigtLWNvbG9yLXByZXR0eWxpZ2h0cy1zeW50YXgtc3Rv
cmFnZS1tb2RpZmllci1pbXBvcnQpOyI+Ym9vbDwvc3Bhbj4gPHNwYW4gY2xhc3M9InBsLXMx
IiBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsiPnRlbXBvcmFyeTwvc3Bhbj4pCiAK
IAk8c3BhbiBjbGFzcz0icGwtayIgc3R5bGU9ImJveC1zaXppbmc6IGJvcmRlci1ib3g7IGNv
bG9yOiB2YXIoLS1jb2xvci1wcmV0dHlsaWdodHMtc3ludGF4LWtleXdvcmQpOyI+aWY8L3Nw
YW4+ICg8c3BhbiBjbGFzcz0icGwtczEiIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94
OyI+ZGV2aWNlPC9zcGFuPjxzcGFuIGNsYXNzPSJwbC1jMSIgc3R5bGU9ImJveC1zaXppbmc6
IGJvcmRlci1ib3g7IGNvbG9yOiB2YXIoLS1jb2xvci1wcmV0dHlsaWdodHMtc3ludGF4LWNv
bnN0YW50KTsiPi0mZ3Q7PC9zcGFuPjxzcGFuIGNsYXNzPSJwbC1jMSIgc3R5bGU9ImJveC1z
aXppbmc6IGJvcmRlci1ib3g7IGNvbG9yOiB2YXIoLS1jb2xvci1wcmV0dHlsaWdodHMtc3lu
dGF4LWNvbnN0YW50KTsiPmJyZWRyPC9zcGFuPikKIAkJPHNwYW4gY2xhc3M9InBsLWVuIiBz
dHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgY29sb3I6IHZhcigtLWNvbG9yLXByZXR0
eWxpZ2h0cy1zeW50YXgtZW50aXR5KTsiPmFkYXB0ZXJfYWNjZXB0X2xpc3RfYWRkPC9zcGFu
Pig8c3BhbiBjbGFzcz0icGwtczEiIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyI+
ZGV2aWNlPC9zcGFuPjxzcGFuIGNsYXNzPSJwbC1jMSIgc3R5bGU9ImJveC1zaXppbmc6IGJv
cmRlci1ib3g7IGNvbG9yOiB2YXIoLS1jb2xvci1wcmV0dHlsaWdodHMtc3ludGF4LWNvbnN0
YW50KTsiPi0mZ3Q7PC9zcGFuPjxzcGFuIGNsYXNzPSJwbC1jMSIgc3R5bGU9ImJveC1zaXpp
bmc6IGJvcmRlci1ib3g7IGNvbG9yOiB2YXIoLS1jb2xvci1wcmV0dHlsaWdodHMtc3ludGF4
LWNvbnN0YW50KTsiPmFkYXB0ZXI8L3NwYW4+LCA8c3BhbiBjbGFzcz0icGwtczEiIHN0eWxl
PSJib3gtc2l6aW5nOiBib3JkZXItYm94OyI+ZGV2aWNlPC9zcGFuPik7CjxzcGFuIGNsYXNz
PSJwbC1jMSIgc3R5bGU9ImJveC1zaXppbmc6IGJvcmRlci1ib3g7IGNvbG9yOiB2YXIoLS1j
b2xvci1wcmV0dHlsaWdodHMtc3ludGF4LWNvbnN0YW50KTsiPis8L3NwYW4+CTxzcGFuIGNs
YXNzPSJwbC1zMSIgc3R5bGU9ImJveC1zaXppbmc6IGJvcmRlci1ib3g7Ij5lbHNlPC9zcGFu
PiA8c3BhbiBjbGFzcz0icGwtayIgc3R5bGU9ImJveC1zaXppbmc6IGJvcmRlci1ib3g7IGNv
bG9yOiB2YXIoLS1jb2xvci1wcmV0dHlsaWdodHMtc3ludGF4LWtleXdvcmQpOyI+aWY8L3Nw
YW4+ICg8c3BhbiBjbGFzcz0icGwtczEiIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94
OyI+ZGV2aWNlPC9zcGFuPjxzcGFuIGNsYXNzPSJwbC1jMSIgc3R5bGU9ImJveC1zaXppbmc6
IGJvcmRlci1ib3g7IGNvbG9yOiB2YXIoLS1jb2xvci1wcmV0dHlsaWdodHMtc3ludGF4LWNv
bnN0YW50KTsiPi0mZ3Q7PC9zcGFuPjxzcGFuIGNsYXNzPSJwbC1jMSIgc3R5bGU9ImJveC1z
aXppbmc6IGJvcmRlci1ib3g7IGNvbG9yOiB2YXIoLS1jb2xvci1wcmV0dHlsaWdodHMtc3lu
dGF4LWNvbnN0YW50KTsiPmxlPC9zcGFuPikgewo8c3BhbiBjbGFzcz0icGwtYzEiIHN0eWxl
PSJib3gtc2l6aW5nOiBib3JkZXItYm94OyBjb2xvcjogdmFyKC0tY29sb3ItcHJldHR5bGln
aHRzLXN5bnRheC1jb25zdGFudCk7Ij4rPC9zcGFuPgkJPHNwYW4gY2xhc3M9InBsLXMxIiBz
dHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsiPmRldmljZTwvc3Bhbj48c3BhbiBjbGFz
cz0icGwtYzEiIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyBjb2xvcjogdmFyKC0t
Y29sb3ItcHJldHR5bGlnaHRzLXN5bnRheC1jb25zdGFudCk7Ij4tJmd0Ozwvc3Bhbj48c3Bh
biBjbGFzcz0icGwtYzEiIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyBjb2xvcjog
dmFyKC0tY29sb3ItcHJldHR5bGlnaHRzLXN5bnRheC1jb25zdGFudCk7Ij5kaXNhYmxlX2F1
dG9fY29ubmVjdDwvc3Bhbj4gPHNwYW4gY2xhc3M9InBsLWMxIiBzdHlsZT0iYm94LXNpemlu
ZzogYm9yZGVyLWJveDsgY29sb3I6IHZhcigtLWNvbG9yLXByZXR0eWxpZ2h0cy1zeW50YXgt
Y29uc3RhbnQpOyI+PTwvc3Bhbj4gRkFMU0U7CjxzcGFuIGNsYXNzPSJwbC1jMSIgc3R5bGU9
ImJveC1zaXppbmc6IGJvcmRlci1ib3g7IGNvbG9yOiB2YXIoLS1jb2xvci1wcmV0dHlsaWdo
dHMtc3ludGF4LWNvbnN0YW50KTsiPis8L3NwYW4+CQk8c3BhbiBjbGFzcz0icGwtZW4iIHN0
eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyBjb2xvcjogdmFyKC0tY29sb3ItcHJldHR5
bGlnaHRzLXN5bnRheC1lbnRpdHkpOyI+ZGV2aWNlX3NldF9hdXRvX2Nvbm5lY3Q8L3NwYW4+
KDxzcGFuIGNsYXNzPSJwbC1zMSIgc3R5bGU9ImJveC1zaXppbmc6IGJvcmRlci1ib3g7Ij5k
ZXZpY2U8L3NwYW4+LCBUUlVFKTsKPHNwYW4gY2xhc3M9InBsLWMxIiBzdHlsZT0iYm94LXNp
emluZzogYm9yZGVyLWJveDsgY29sb3I6IHZhcigtLWNvbG9yLXByZXR0eWxpZ2h0cy1zeW50
YXgtY29uc3RhbnQpOyI+Kzwvc3Bhbj4JfQogCiAJPHNwYW4gY2xhc3M9InBsLWVuIiBzdHls
ZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgY29sb3I6IHZhcigtLWNvbG9yLXByZXR0eWxp
Z2h0cy1zeW50YXgtZW50aXR5KTsiPnN0b3JlX2RldmljZV9pbmZvPC9zcGFuPig8c3BhbiBj
bGFzcz0icGwtczEiIHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyI+ZGV2aWNlPC9z
cGFuPik7PC9wcmU+PHByZSBjbGFzcz0ibm90cmFuc2xhdGUiIHN0eWxlPSJib3gtc2l6aW5n
OiBib3JkZXItYm94OyBmb250LWZhbWlseTogdmFyKC0tZm9udFN0YWNrLW1vbm9zcGFjZSwg
dWktbW9ub3NwYWNlLCBTRk1vbm8tUmVndWxhciwgU0YgTW9ubywgTWVubG8sIENvbnNvbGFz
LCBMaWJlcmF0aW9uIE1vbm8sIG1vbm9zcGFjZSk7IGZvbnQtc2l6ZTogMTJweDsgbWFyZ2lu
LXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IG92ZXJmbG93LXdyYXA6IG5vcm1hbDsg
cGFkZGluZzogdmFyKC0tYmFzZS1zaXplLTE2KTsgb3ZlcmZsb3c6IGF1dG87IGxpbmUtaGVp
Z2h0OiAxLjQ1OyBjb2xvcjogdmFyKC0tZmdDb2xvci1kZWZhdWx0LCB2YXIoLS1jb2xvci1m
Zy1kZWZhdWx0KSk7IGJhY2tncm91bmQtY29sb3I6IHZhcigtLWJnQ29sb3ItbXV0ZWQsIHZh
cigtLWNvbG9yLWNhbnZhcy1zdWJ0bGUpKTsgYm9yZGVyLXJhZGl1czogNnB4OyB3b3JkLWJy
ZWFrOiBub3JtYWw7Ij48YnI+PC9wcmU+PC9kaXY+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0i
Y29sb3I6IHJnYigxMDIsIDEwMiwgMTAyKTsgZm9udC1mYW1pbHk6ICZxdW90O1dlblF1YW5Z
aSBNaWNybyBIZWkmcXVvdDssICZxdW90O1NvdXJjZSBIYW4gU2FucyBTQyBOb3JtYWwmcXVv
dDssIFRhaG9tYSwgQXJpYWw7IGZvbnQtc2l6ZTogMTJweDsgdGV4dC1hbGlnbjoganVzdGlm
eTsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDAuNCk7IGJh
Y2tncm91bmQtY29sb3I6IHJnYmEoMjU1LCAyNTUsIDI1NSwgMC44KTsiPndlYiBhZGRyZXNz
OiZuYnNwOzwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6ICZxdW90O1dlblF1YW5Z
aSBNaWNybyBIZWkmcXVvdDssICZxdW90O1NvdXJjZSBIYW4gU2FucyBTQyBOb3JtYWwmcXVv
dDssIFRhaG9tYSwgQXJpYWw7IGZvbnQtc2l6ZTogMTJweDsgdGV4dC1hbGlnbjoganVzdGlm
eTsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDAuNCk7IGJh
Y2tncm91bmQtY29sb3I6IHJnYmEoMjU1LCAyNTUsIDI1NSwgMC44KTsiPjxmb250IGNvbG9y
PSIjZmYwMDAwIj5odHRwczovL2dpdGh1Yi5jb20vYmx1ZXovYmx1ZXovaXNzdWVzLzkwMjwv
Zm9udD48L3NwYW4+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IHJnYmEoMjU1LCAy
NTUsIDI1NSwgMC44KTsgY29sb3I6IHJnYigxMDIsIDEwMiwgMTAyKTsgZm9udC1mYW1pbHk6
ICZxdW90O1dlblF1YW5ZaSBNaWNybyBIZWkmcXVvdDssICZxdW90O1NvdXJjZSBIYW4gU2Fu
cyBTQyBOb3JtYWwmcXVvdDssIFRhaG9tYSwgQXJpYWw7IGZvbnQtc2l6ZTogMTJweDsgdGV4
dC1hbGlnbjoganVzdGlmeTsiPjwvc3Bhbj48L2Rpdj48ZGl2PjxociBhbGlnbj0ibGVmdCIg
c3R5bGU9Im1hcmdpbjogMCAwIDEwcHggMDtib3JkZXI6IDA7Ym9yZGVyLWJvdHRvbToxcHgg
c29saWQgI0U0RTVFNjtoZWlnaHQ6MDtsaW5lLWhlaWdodDowO2ZvbnQtc2l6ZTowO3BhZGRp
bmc6IDIwcHggMCAwIDA7d2lkdGg6IDUwcHg7Ij48ZGl2IHN0eWxlPSJmb250LXNpemU6MTRw
eDtmb250LWZhbWlseTpWZXJkYW5hO2NvbG9yOiMwMDA7Ij48YSBjbGFzcz0ieG1fd3JpdGVf
Y2FyZCIgaWQ9ImluX2FsaWFzIiBzdHlsZT0id2hpdGUtc3BhY2U6IG5vcm1hbDsgZGlzcGxh
eTogaW5saW5lLWJsb2NrOyB0ZXh0LWRlY29yYXRpb246IG5vbmUgIWltcG9ydGFudDtmb250
LWZhbWlseTogLWFwcGxlLXN5c3RlbSxCbGlua01hY1N5c3RlbUZvbnQsUGluZ0ZhbmcgU0Ms
TWljcm9zb2Z0IFlhSGVpOyIgaHJlZj0iaHR0cHM6Ly93eC5tYWlsLnFxLmNvbS9ob21lL2lu
ZGV4P3Q9cmVhZG1haWxfYnVzaW5lc3NjYXJkX21pZHBhZ2UmYW1wO25vY2hlY2s9dHJ1ZSZh
bXA7bmFtZT0uLi4lRTYlOUQlQTUlRTQlQkElODYmYW1wO2ljb249aHR0cCUzQSUyRiUyRnRo
aXJkcXEucWxvZ28uY24lMkZnJTNGYiUzRHNkayUyNmslM0RWVk5IeUZpYWg2a0JFZjlmZWli
NnBnSmclMjZzJTNEMTAwJTI2dCUzRDE1NTY0ODU5MzYlM0ZyYW5kJTNEMTYzNDI1MjQyNCZh
bXA7bWFpbD0yOTQzMDUwNjglNDBxcS5jb20mYW1wO2NvZGU9IiB0YXJnZXQ9Il9ibGFuayI+
PHRhYmxlIHN0eWxlPSJ3aGl0ZS1zcGFjZTogbm9ybWFsO3RhYmxlLWxheW91dDogZml4ZWQ7
IHBhZGRpbmctcmlnaHQ6IDIwcHg7IiBjb250ZW50ZWRpdGFibGU9ImZhbHNlIiBjZWxscGFk
ZGluZz0iMCIgY2VsbHNwYWNpbmc9IjAiPjx0Ym9keT48dHIgdmFsaWduPSJ0b3AiPjx0ZCBz
dHlsZT0id2lkdGg6IDQwcHg7bWluLXdpZHRoOiA0MHB4OyBwYWRkaW5nLXRvcDoxMHB4Ij48
ZGl2IHN0eWxlPSJ3aWR0aDogMzhweDsgaGVpZ2h0OiAzOHB4OyBib3JkZXI6IDFweCAjRkZG
IHNvbGlkOyBib3JkZXItcmFkaXVzOjUwJTsgbWFyZ2luOiAwO3ZlcnRpY2FsLWFsaWduOiB0
b3A7Ym94LXNoYWRvdzogMCAwIDEwcHggMCByZ2JhKDEyNywxNTIsMTc4LDAuMTQpOyI+PGlt
ZyBzcmM9Imh0dHA6Ly90aGlyZHFxLnFsb2dvLmNuL2c/Yj1zZGsmYW1wO2s9VlZOSHlGaWFo
NmtCRWY5ZmVpYjZwZ0pnJmFtcDtzPTEwMCZhbXA7dD0xNTU2NDg1OTM2P3JhbmQ9MTYzNDI1
MjQyNCIgc3R5bGU9IndpZHRoOjEwMCU7aGVpZ2h0OjEwMCU7Ym9yZGVyLXJhZGl1czo1MCU7
cG9pbnRlci1ldmVudHM6IG5vbmU7Ij48L2Rpdj48L3RkPjx0ZCBzdHlsZT0icGFkZGluZzog
MTBweCAwIDhweCAxMHB4OyI+PGRpdiBjbGFzcz0iYnVzaW5lc3NDYXJkX25hbWUiIHN0eWxl
PSJmb250LXNpemU6IDE0cHg7Y29sb3I6ICMzMzMxMkU7bGluZS1oZWlnaHQ6IDIwcHg7IHBh
ZGRpbmctYm90dG9tOiAycHg7IG1hcmdpbjowO2ZvbnQtd2VpZ2h0OiA1MDA7Ij4uLi7AtMHL
PC9kaXY+PGRpdiBjbGFzcz0iYnVzaW5lc3NDYXJkX21haWwiIHN0eWxlPSJmb250LXNpemU6
IDEycHg7Y29sb3I6ICM5OTk4OTY7bGluZS1oZWlnaHQ6IDE4cHg7IG1hcmdpbjowOyI+Mjk0
MzA1MDY4QHFxLmNvbTwvZGl2PjwvdGQ+PC90cj48L3Rib2R5PjwvdGFibGU+PC9hPjwvZGl2
PjwvZGl2PjxkaXY+Jm5ic3A7PC9kaXY+

------=_NextPart_66962FD5_145471F0_18ECCF2F--

------=_NextPart_66962FD5_145471F0_74502759
Content-Type: application/octet-stream;
	charset="gb18030";
	name="1.patch"
Content-Disposition: attachment; filename="1.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NyYy9kZXZpY2UuYyBiL3NyYy9kZXZpY2UuYwppbmRleCAwOTdiMWZi
YmEuLjdiMTg3ODFjOCAxMDA2NDQKLS0tIGEvc3JjL2RldmljZS5jCisrKyBiL3NyYy9kZXZp
Y2UuYwpAQCAtNjA2Miw2ICs2MDYyLDEwIEBAIHZvaWQgYnRkX2RldmljZV9zZXRfdGVtcG9y
YXJ5KHN0cnVjdCBidGRfZGV2aWNlICpkZXZpY2UsIGJvb2wgdGVtcG9yYXJ5KQogCiAJaWYg
KGRldmljZS0+YnJlZHIpCiAJCWFkYXB0ZXJfYWNjZXB0X2xpc3RfYWRkKGRldmljZS0+YWRh
cHRlciwgZGV2aWNlKTsKKwllbHNlIGlmIChkZXZpY2UtPmxlKSB7CisJCWRldmljZS0+ZGlz
YWJsZV9hdXRvX2Nvbm5lY3QgPSBGQUxTRTsKKwkJZGV2aWNlX3NldF9hdXRvX2Nvbm5lY3Qo
ZGV2aWNlLCBUUlVFKTsKKwl9CiAKIAlzdG9yZV9kZXZpY2VfaW5mbyhkZXZpY2UpOwogCg==

------=_NextPart_66962FD5_145471F0_74502759--


