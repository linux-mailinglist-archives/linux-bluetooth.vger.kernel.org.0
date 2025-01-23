Return-Path: <linux-bluetooth+bounces-9894-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E9089A1A02F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 23 Jan 2025 09:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD9657A7A4A
	for <lists+linux-bluetooth@lfdr.de>; Thu, 23 Jan 2025 08:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4198E20C035;
	Thu, 23 Jan 2025 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="JnezRw5M"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C71720C023
	for <linux-bluetooth@vger.kernel.org>; Thu, 23 Jan 2025 08:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737621985; cv=none; b=NRGPzr4d2P357bHnCHUo9No0ub+FuLO/ezlagR7q8HARrcUekLrwiC6gYdnUpi82JVMb3E+LVsep56KGHxkHSl7HCRh4B8ww6OXX3E2a8iVi82x+tezrvgp4Orm/G2sI5RhrHQzs5uQrSh2qznD9wWp93F0cdIdtlRkpBmVazqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737621985; c=relaxed/simple;
	bh=S1cuY1QiI69uNpHDTQU5vyvhGR9idlGLh4JmCWoa24g=;
	h=From:To:Subject:Mime-Version:Content-Type:Date:Message-ID; b=Bxo7yYB0cON7F02oVsB+8JTxMe7MFMHo1hnoTT25UtOj3ZVgiRJrEWUs4iypWiwGlghwAkfN1+heT+sf//60cPBqivpc7gxriyYXfQlKBGSaogVRS8275LHSie3CuXYt/eqvQhGeTV0no+CER7lICYx7Ng3JDsP+qcaoYZq+i0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=JnezRw5M; arc=none smtp.client-ip=203.205.221.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1737621977; bh=us0DGlAaIE2XO19LmQoodprQlI/G/nlkhmCsyj9/WOw=;
	h=From:To:Subject:Date;
	b=JnezRw5MtpGB0GbagS8aqkgphLwMAXUizQEgmxWIAVf5RSCFoek7ix4YkqORRi2Do
	 fUzMIWP+nUQsrn8UzsbpKyq0Tnjv959qGVgzv0Mhlf584OEPBpe9ernH3ED7qMpPVa
	 +OyoZifDCiySbO/WI/L5iyuFECW2KkvIvpbVcK1A=
X-QQ-FEAT: oHWrrGTW1dCni6VLWI7Xi3lwP5c1dnPf
X-QQ-SSF: 00000000000000F0000000000000
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-XMAILINFO: NtHA4HazRbSIBUcDiCg5tKRbuTH3pYqlrhO1UHJB9cC6Nt7DQ792ZwFUlC+ZYG
	 RMGeJcEi4cfScbR41VUPS6J2LMhlsIOpnBhQNEFwA87Rg6X1Ey5xE99TDTbumhKLrHCl2gVPYjnnQ
	 qbL6EOQXT3o6JYi1c5Yad+tH/8vlDHL0xfSCWS/ar6MQhZzYhuvAZ2XFq48TefjqprtN071VvDUui
	 UFT+rknsTn7NEAofuLgbWjx/lGBwLC9KgsBZLQx3Za80/56Vz6gSHFNRVOqx5qAiJhgbBEkkxxrYR
	 iImfuJJSk71npZe9FbCzPwYHf/iYkaszA63WPyb0kDXrVywEHDQPS7lVbVNxDVbdNbs4RqapyBJEH
	 J+fPpkSSSA2QJNN1GF3keDXJ0u6Db/j6TX8WE0IiY2SC25Z7G0sV5Bk/rUfiDfhwAHc62Gg7eCvfK
	 pYvDL2NiRT6Ap5IgKXRsvfkSENj5LodESe6cVIg8knncEvqNbCCmoLZDILGmSaLNRAVtZU5rtU6hI
	 n+Fc3/1E4rv7mppcfziZQX+H+mWcNszfwvX/zSKmrzBtnAaP5dheeAQvGj7+uI+sJU+x+yeBmQU3q
	 c3SnFDOORS3hdHve3lQ7IZeVMP0qa1v6mVoay2ZuT5gktRD33mLQzrOjKYnniYwyHaJFnybocf/7g
	 USLH/YTDc291uszFD6t5lb+sumIBgPk76egC6B/a8n2g0EX31FsewkC0syq1gATigDSnca4BRAvsd
	 BQPI5sIZBibrOl+NiOo4G4MhrGvJiyLdPBSyOe6MPsCO458BSmJ9nxgjTS2DMf6WuxJ24Cc8B7emL
	 Rj4P+Jxuqs9IQ2X2fqyvZwM727fS2KRotnjMFyRGTMqlmULOjbcLsOxDbFZ7aFOqsfbS6jHuh0+i2
	 Iz8LNPbNYXOE7i707zCsOxJqtdui8u+sOQjlHxgoRyM/3fkSr4vihAg9iH9A6WfzHRm1Aa045hXNM
	 +Ma8PAS8RMf+VwFZvSCPDTztYb9c+8SrM+v2yyxg==
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-STYLE: 
X-QQ-mid: webmail441t1737621976t5837590
From: "=?gb18030?B?Li4uwLTByw==?=" <294305068@qq.com>
To: "=?gb18030?B?bGludXgtYmx1ZXRvb3Ro?=" <linux-bluetooth@vger.kernel.org>
Subject: PATCH BlueZ
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_679201D8_17189D58_6978AC68"
Content-Transfer-Encoding: 8Bit
Date: Thu, 23 Jan 2025 16:46:16 +0800
X-Priority: 3
Message-ID: <tencent_D3EFB613EA09E81587F45C8C80CEEDAF8D07@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x

This is a multi-part message in MIME format.

------=_NextPart_679201D8_17189D58_6978AC68
Content-Type: multipart/alternative;
	boundary="----=_NextPart_679201D8_17189D58_1A88647E";

------=_NextPart_679201D8_17189D58_1A88647E
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

RnJvbSA4OTk3MTM5NjRlMmE2ZTFlY2UwOGE4NDM5OGI4N2Q5MjNiYTEwODJlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQ0KIEZyb206IGNhaXRhbyA8Y2FpdGFvQGt5bGlub3MuY24mZ3Q7
DQogRGF0ZTogVGh1LCAyMyBKYW4gMjAyNSAxNjozMjo1NyArMDgwMA0KIFN1YmplY3Q6IFtQ
QVRDSCBCbHVlWiAwLzFdICoqKiBTVUJKRUNUIEhFUkUgKioqDQogDQogKioqIEJMVVJCIEhF
UkUgKioqDQogDQogY2FpdGFvICgxKToNCiAgYmF0dGVyeS5jOiBUaGUgYmF0dGVyeSBpcyBu
b3QgaW5pdGlhbGl6ZWQsIGFuZCBpbml0aWFsaXplIHRoZSBiYXR0ZXJ5DQogDQogIHByb2Zp
bGVzL2JhdHRlcnkvYmF0dGVyeS5jIHwgMiArKw0KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspDQogDQogLS0gDQogMi4yNS4x

------=_NextPart_679201D8_17189D58_1A88647E
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdiBzdHlsZT0iY29sb3I6IHJnYig1MSwgNTEsIDUxKTsgZm9u
dC1mYW1pbHk6ICZxdW90O0Ryb2lkIFNhbnMgTW9ubyZxdW90OywgJnF1b3Q7bW9ub3NwYWNl
JnF1b3Q7LCBtb25vc3BhY2U7IHdoaXRlLXNwYWNlOiBwcmU7Ij48ZGl2PkZyb20gODk5NzEz
OTY0ZTJhNmUxZWNlMDhhODQzOThiODdkOTIzYmExMDgyZSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDE8L2Rpdj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogcmdiKDI0NSwgMjQ1
LCAyNDUpOyI+Cjwvc3Bhbj48ZGl2PkZyb206IGNhaXRhbyAmbHQ7Y2FpdGFvQGt5bGlub3Mu
Y24mZ3Q7PC9kaXY+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IHJnYigyNDUsIDI0
NSwgMjQ1KTsiPgo8L3NwYW4+PGRpdj5EYXRlOiBUaHUsIDIzIEphbiAyMDI1IDE2OjMyOjU3
ICswODAwPC9kaXY+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IHJnYigyNDUsIDI0
NSwgMjQ1KTsiPgo8L3NwYW4+PGRpdj5TdWJqZWN0OiBbUEFUQ0ggQmx1ZVogMC8xXSAqKiog
U1VCSkVDVCBIRVJFICoqKjwvZGl2PjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiBy
Z2IoMjQ1LCAyNDUsIDI0NSk7Ij4KPC9zcGFuPjxicj48c3BhbiBzdHlsZT0iYmFja2dyb3Vu
ZC1jb2xvcjogcmdiKDI0NSwgMjQ1LCAyNDUpOyI+Cjwvc3Bhbj48ZGl2PjxzcGFuIHN0eWxl
PSJjb2xvcjogcmdiKDc1LCAxMDUsIDE5OCk7Ij4qKiogQkxVUkIgSEVSRSAqKio8L3NwYW4+
PC9kaXY+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6IHJnYigyNDUsIDI0NSwgMjQ1
KTsiPgo8L3NwYW4+PGJyPjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjQ1
LCAyNDUsIDI0NSk7Ij4KPC9zcGFuPjxkaXY+Y2FpdGFvICgxKTo8L2Rpdj48c3BhbiBzdHls
ZT0iYmFja2dyb3VuZC1jb2xvcjogcmdiKDI0NSwgMjQ1LCAyNDUpOyI+Cjwvc3Bhbj48ZGl2
PiBiYXR0ZXJ5LmM6IFRoZSBiYXR0ZXJ5IGlzIG5vdCBpbml0aWFsaXplZCwgYW5kIGluaXRp
YWxpemUgdGhlIGJhdHRlcnk8L2Rpdj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjog
cmdiKDI0NSwgMjQ1LCAyNDUpOyI+Cjwvc3Bhbj48YnI+PHNwYW4gc3R5bGU9ImJhY2tncm91
bmQtY29sb3I6IHJnYigyNDUsIDI0NSwgMjQ1KTsiPgo8L3NwYW4+PGRpdj4gcHJvZmlsZXMv
YmF0dGVyeS9iYXR0ZXJ5LmMgfCAyICsrPC9kaXY+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQt
Y29sb3I6IHJnYigyNDUsIDI0NSwgMjQ1KTsiPgo8L3NwYW4+PGRpdj4gMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKTwvZGl2PjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9y
OiByZ2IoMjQ1LCAyNDUsIDI0NSk7Ij4KPC9zcGFuPjxicj48c3BhbiBzdHlsZT0iYmFja2dy
b3VuZC1jb2xvcjogcmdiKDI0NSwgMjQ1LCAyNDUpOyI+Cjwvc3Bhbj48ZGl2PjxzcGFuIHN0
eWxlPSJjb2xvcjogcmdiKDExOSwgMTE5LCAxMTkpOyI+LTwvc3Bhbj48c3BhbiBzdHlsZT0i
Y29sb3I6IHJnYigxOTksIDYxLCAzMik7Ij4tIDwvc3Bhbj48L2Rpdj48c3BhbiBzdHlsZT0i
YmFja2dyb3VuZC1jb2xvcjogcmdiKDI0NSwgMjQ1LCAyNDUpOyI+Cjwvc3Bhbj48ZGl2PjIu
MjUuMTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9y
OiByZ2IoMjQ1LCAyNDUsIDI0NSk7Ij48L3NwYW4+PC9kaXY+

------=_NextPart_679201D8_17189D58_1A88647E--

------=_NextPart_679201D8_17189D58_6978AC68
Content-Type: application/octet-stream;
	charset="gb18030";
	name="0000-cover-letter.patch"
Content-Disposition: attachment; filename="0000-cover-letter.patch"
Content-Transfer-Encoding: base64

RnJvbSA4OTk3MTM5NjRlMmE2ZTFlY2UwOGE4NDM5OGI4N2Q5MjNiYTEwODJlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBjYWl0YW8gPGNhaXRhb0BreWxpbm9zLmNuPgpEYXRl
OiBUaHUsIDIzIEphbiAyMDI1IDE2OjMyOjU3ICswODAwClN1YmplY3Q6IFtQQVRDSCBCbHVl
WiAwLzFdICoqKiBTVUJKRUNUIEhFUkUgKioqCgoqKiogQkxVUkIgSEVSRSAqKioKCmNhaXRh
byAoMSk6CiAgYmF0dGVyeS5jOiBUaGUgYmF0dGVyeSBpcyBub3QgaW5pdGlhbGl6ZWQsIGFu
ZCBpbml0aWFsaXplIHRoZSBiYXR0ZXJ5CgogcHJvZmlsZXMvYmF0dGVyeS9iYXR0ZXJ5LmMg
fCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgotLSAKMi4yNS4xCgo=

------=_NextPart_679201D8_17189D58_6978AC68
Content-Type: application/octet-stream;
	charset="gb18030";
	name="0001-battery.c-The-battery-is-not-initialized-and-initial.patch"
Content-Disposition: attachment; filename="0001-battery.c-The-battery-is-not-initialized-and-initial.patch"
Content-Transfer-Encoding: base64

RnJvbSA4OTk3MTM5NjRlMmE2ZTFlY2UwOGE4NDM5OGI4N2Q5MjNiYTEwODJlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBjYWl0YW8gPGNhaXRhb0BreWxpbm9zLmNuPgpEYXRl
OiBUaHUsIDIzIEphbiAyMDI1IDE2OjMyOjI1ICswODAwClN1YmplY3Q6IFtQQVRDSCBCbHVl
WiAxLzFdIGJhdHRlcnkuYzogVGhlIGJhdHRlcnkgaXMgbm90IGluaXRpYWxpemVkLCBhbmQK
IGluaXRpYWxpemUgdGhlIGJhdHRlcnkKCmZpeDogaHR0cHM6Ly9naXRodWIuY29tL2JsdWV6
L2JsdWV6L2lzc3Vlcy8xMDQyCi0tLQogcHJvZmlsZXMvYmF0dGVyeS9iYXR0ZXJ5LmMgfCAy
ICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcHJv
ZmlsZXMvYmF0dGVyeS9iYXR0ZXJ5LmMgYi9wcm9maWxlcy9iYXR0ZXJ5L2JhdHRlcnkuYwpp
bmRleCA1MzE4ZDQwZDEuLmEzMTRmM2E0NCAxMDA2NDQKLS0tIGEvcHJvZmlsZXMvYmF0dGVy
eS9iYXR0ZXJ5LmMKKysrIGIvcHJvZmlsZXMvYmF0dGVyeS9iYXR0ZXJ5LmMKQEAgLTEzOSw2
ICsxMzksOCBAQCBzdGF0aWMgdm9pZCBiYXR0X2lvX2NjY193cml0dGVuX2NiKHVpbnQxNl90
IGF0dF9lY29kZSwgdm9pZCAqdXNlcl9kYXRhKQogCWdfZnJlZSAoYmF0dC0+aW5pdGlhbF92
YWx1ZSk7CiAJYmF0dC0+aW5pdGlhbF92YWx1ZSA9IE5VTEw7CiAKKwlidGRfYmF0dGVyeV91
cGRhdGUoYmF0dC0+YmF0dGVyeSwgYmF0dC0+cGVyY2VudGFnZSk7CisKIAlEQkcoIkJhdHRl
cnkgTGV2ZWw6IG5vdGlmaWNhdGlvbiBlbmFibGVkIik7CiB9CiAKLS0gCjIuMjUuMQoK

------=_NextPart_679201D8_17189D58_6978AC68--


