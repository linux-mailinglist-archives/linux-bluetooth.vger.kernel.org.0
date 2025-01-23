Return-Path: <linux-bluetooth+bounces-9892-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9149A19D11
	for <lists+linux-bluetooth@lfdr.de>; Thu, 23 Jan 2025 03:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD3AE18894AD
	for <lists+linux-bluetooth@lfdr.de>; Thu, 23 Jan 2025 02:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C146135977;
	Thu, 23 Jan 2025 02:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Kc/gw0vQ"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CA981724
	for <linux-bluetooth@vger.kernel.org>; Thu, 23 Jan 2025 02:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737601080; cv=none; b=O1TzwWcWy+sKOwvOt+vIvkP4fgRhVNtSgbRE/0QGbu5TPlp8YYYuIoQfJn09Vr6fSQyrNCMS86TatGgIdp+Zhwthp+t8IHHyXe16ATLrTvsmGtiOOiC8caXuyjRU11Ew+zkm8GvVVfPIzMPaa1KOS5MAvzsy141FwjbqAbKU75o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737601080; c=relaxed/simple;
	bh=vjpBlcp5SiGkkMb9EgCFDYbOc9+p+QVymFcNZbJrF0k=;
	h=From:To:Subject:Mime-Version:Content-Type:Date:Message-ID; b=kr/YH68WUKJTvvsPqZeR0q7YzRlJJ1XWMu+KUbFLrjY41D8vDzTJ9I+wq83IlcPbVrHIfrzwlmcDF+EV/Hpi0WzxR+xe5pIPccUx4/E+z+x1ruU2IYGz63dYBBD7NBSMusPyVpS01noQyFhQY8m6dLyt7QN2XpMV2PWCuYbCtew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Kc/gw0vQ; arc=none smtp.client-ip=203.205.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1737601064; bh=r/aHP9FUY/sIgFW9D4e14j22DnJRYjkkdlEXnNkHs+8=;
	h=From:To:Subject:Date;
	b=Kc/gw0vQyHaB9MZ0xO6iokQIottaAbzHHuBk5J0cVEmR+j65lugJAqpWE1Pis5G29
	 v1Wjb4xz7yxP9Ps9F4Pm2dbhMaFyYrhAxmCsxtRaGzKwSa5weAlRlYlKwzv0eTTIQ1
	 Wm+0HXhCk7ngleb3oLiLBqhBlERmSLEWdxOyOm9U=
X-QQ-FEAT: oHWrrGTW1dCni6VLWI7Xi3lwP5c1dnPf
X-QQ-SSF: 00000000000000F0000000000000
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-XMAILINFO: M9KQ+9tuJ/rFHIJQx359XJrsXelUJKoq5HOYMYzmQWKT2v2Yn8oPjm81FD4eHa
	 kjBFTbuJrUMadkLzaZc+hfx9x0AJhndzqMVgFCGRCQlgplnp9JxQa5dvXbd4k0ho+hVJ7/04BXgIy
	 aji/GPePFewvq0Di0HmVCwuxoMnDw9pj6ypgWsx+VHuJcXmXUtxwAca53oxt6vRqC8tiCBT/y13V9
	 2c5Tvnh1xmCuSat8XoeBN3cp5YPyT7msEfqWTAippyo96k9zoTB/JryEGLF33jNs1PpZ242xieZ2N
	 s+0NuNhV7oJBtXedchj+mEPwqnNYz4YG8A+B5uGUmSTaF079RMNKv18xIVktpo3UGD2RDhC22nQ+N
	 7FNQiPP8/JCQcMMpRsrZ/1xBSVjAhQwjciB4aDd1tyR+IbNlpW/fiJJ+KFxnpD/1/2IY1Vs7+4cb1
	 XEzGTZ7digG55Ji5Zv0c4s8BClGsTTpzyVNlGQWruOHAe6nswFfOnkq6NMTEZ9HhXWiMHhVCgXKLL
	 ou070tvhiur6DU2f9ttUkKVNCT3eUfcHZKF/+ooJwC+DztZrRhYJq4GNpAS8mkknT7+A0fPJR+Ziw
	 bKLMtRUlmrSKSZIFc/54fj+3b9foEx31Bj+d/2FV9wZJY1tehlfIjK+MitAvKgNwIooLpmdQWNppk
	 iyHXEJxwF0f/OdwNynRBka+7v1ptmRs5vIg+uFjYXind6iDVkV7k2de599MW8LMQV4ijqNNB2w++8
	 CWHWp3gk+v5Kr9xoif/px4tIjErnbcUteq4RcoFuvqULBiI/C5NnJveNDvIDOQSM0agcODBf5hIPT
	 IB+uNbFkpgtf1kKTmtZ9fPm4akdeV6Ki6mmnA+bULM1UjUWUM/5AxQDRZr3s1GnNnRlmmdCK3Scgz
	 qdNXyZq80tvihkVVVsvIegsgXAGnMBW0IvWW5xYwbhXgNmkXzwHOswSJtXns95v8o6GeJ47/goGQR
	 9siKA0uBJmqbfRrmdtkjRQqe9JJtFV/tREC7Ps0dF2e/xbCg7MSuUz/prd5CYSQW87G+hgqdM9BOW
	 b4ZfLyOIwu0RDMDhvWs5s5bu3LG7wlM5fxFGYhlFK0dyhvmzuRo8q3OeT9DWKH9HIM+8zBr3WWNIH
	 Deo=
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-STYLE: 
X-QQ-mid: webmail441t1737601063t3359858
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
	boundary="----=_NextPart_6791B027_157A3B68_781C043F"
Content-Transfer-Encoding: 8Bit
Date: Thu, 23 Jan 2025 10:57:43 +0800
X-Priority: 3
Message-ID: <tencent_6E4380DF36FA0667DB19B51DB485037BEE06@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x

This is a multi-part message in MIME format.

------=_NextPart_6791B027_157A3B68_781C043F
Content-Type: multipart/alternative;
	boundary="----=_NextPart_6791B027_157A3B68_4A66241C";

------=_NextPart_6791B027_157A3B68_4A66241C
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

RnJvbSAwZjJhMjQ1NDM2NDcyY2E4Zjg2YTIwYmEzODZiZjc0ZDk5ODc2NThiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQ0KRnJvbTogY2FpdGFvIDxjYWl0YW9Aa3lsaW5vcy5jbiZndDsN
CkRhdGU6IFRodSwgMjMgSmFuIDIwMjUgMTA6MzQ6NDMgKzA4MDANClN1YmplY3Q6IFtQQVRD
SCBCbHVlWiAwLzFdICoqKiBTVUJKRUNUIEhFUkUgKioqDQoNCioqKiBCTFVSQiBIRVJFICoq
Kg0KDQpjYWl0YW8gKDEpOg0KICBvYmV4ZC9zcmMvbWFuYWdlcjogVGhlIGZpbGUgdHJhbnNm
ZXIgZXJyb3IgbWF0Y2hlcyB0aGUgZGVzY3JpcHRpb24gaW4NCiAgICB0aGUgaGVscCBkb2N1
bWVudC4NCg0KIG9iZXhkL3NyYy9tYW5hZ2VyLmMgfCAzICsrLQ0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KLS0gDQoyLjI1LjENCg0KDQoN
Cg0KDQoNCg0KDQouLi7AtMHLDQoyOTQzMDUwNjhAcXEuY29tDQoNCg0KDQombmJzcDs=

------=_NextPart_6791B027_157A3B68_4A66241C
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj48ZGl2IHN0eWxlPSJjb2xvcjogcmdiKDUxLCA1MSwgNTEp
OyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjQ1LCAyNDUsIDI0NSk7IGZvbnQtZmFtaWx5OiAm
cXVvdDtEcm9pZCBTYW5zIE1vbm8mcXVvdDssICZxdW90O21vbm9zcGFjZSZxdW90OywgbW9u
b3NwYWNlOyBsaW5lLWhlaWdodDogMTlweDsgd2hpdGUtc3BhY2U6IHByZTsiPjxkaXY+RnJv
bSAwZjJhMjQ1NDM2NDcyY2E4Zjg2YTIwYmEzODZiZjc0ZDk5ODc2NThiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMTwvZGl2PjxkaXY+RnJvbTogY2FpdGFvICZsdDtjYWl0YW9Aa3lsaW5v
cy5jbiZndDs8L2Rpdj48ZGl2PkRhdGU6IFRodSwgMjMgSmFuIDIwMjUgMTA6MzQ6NDMgKzA4
MDA8L2Rpdj48ZGl2PlN1YmplY3Q6IFtQQVRDSCBCbHVlWiAwLzFdICoqKiBTVUJKRUNUIEhF
UkUgKioqPC9kaXY+PGJyPjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOiAjNGI2OWM2OyI+Kioq
IEJMVVJCIEhFUkUgKioqPC9zcGFuPjwvZGl2Pjxicj48ZGl2PmNhaXRhbyAoMSk6PC9kaXY+
PGRpdj4gIG9iZXhkL3NyYy9tYW5hZ2VyOiBUaGUgZmlsZSB0cmFuc2ZlciBlcnJvciBtYXRj
aGVzIHRoZSBkZXNjcmlwdGlvbiBpbjwvZGl2PjxkaXY+ICAgIHRoZSBoZWxwIGRvY3VtZW50
LjwvZGl2Pjxicj48ZGl2PiBvYmV4ZC9zcmMvbWFuYWdlci5jIHwgMyArKy08L2Rpdj48ZGl2
PiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pPC9kaXY+
PGJyPjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOiAjNzc3Nzc3OyI+LTwvc3Bhbj48c3BhbiBz
dHlsZT0iY29sb3I6ICNjNzNkMjA7Ij4tIDwvc3Bhbj48L2Rpdj48ZGl2PjIuMjUuMTwvZGl2
Pjxicj48YnI+PC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48aHIgYWxpZ249Imxl
ZnQiIHN0eWxlPSJtYXJnaW46IDAgMCAxMHB4IDA7Ym9yZGVyOiAwO2JvcmRlci1ib3R0b206
MXB4IHNvbGlkICNFNEU1RTY7aGVpZ2h0OjA7bGluZS1oZWlnaHQ6MDtmb250LXNpemU6MDtw
YWRkaW5nOiAyMHB4IDAgMCAwO3dpZHRoOiA1MHB4OyI+PGRpdiBzdHlsZT0iZm9udC1zaXpl
OjE0cHg7Zm9udC1mYW1pbHk6VmVyZGFuYTtjb2xvcjojMDAwOyI+PGEgY2xhc3M9InhtX3dy
aXRlX2NhcmQiIGlkPSJpbl9hbGlhcyIgc3R5bGU9IndoaXRlLXNwYWNlOiBub3JtYWw7IGRp
c3BsYXk6IGlubGluZS1ibG9jazsgdGV4dC1kZWNvcmF0aW9uOiBub25lICFpbXBvcnRhbnQ7
Zm9udC1mYW1pbHk6IC1hcHBsZS1zeXN0ZW0sQmxpbmtNYWNTeXN0ZW1Gb250LFBpbmdGYW5n
IFNDLE1pY3Jvc29mdCBZYUhlaTsiIGhyZWY9Imh0dHBzOi8vd3gubWFpbC5xcS5jb20vaG9t
ZS9pbmRleD90PXJlYWRtYWlsX2J1c2luZXNzY2FyZF9taWRwYWdlJmFtcDtub2NoZWNrPXRy
dWUmYW1wO25hbWU9Li4uJUU2JTlEJUE1JUU0JUJBJTg2JmFtcDtpY29uPWh0dHAlM0ElMkYl
MkZ0aGlyZHFxLnFsb2dvLmNuJTJGZyUzRmIlM0RzZGslMjZrJTNEVlZOSHlGaWFoNmtCRWY5
ZmVpYjZwZ0pnJTI2cyUzRDEwMCUyNnQlM0QxNTU2NDg1OTM2JTNGcmFuZCUzRDE2MzQyNTI0
MjQmYW1wO21haWw9Mjk0MzA1MDY4JTQwcXEuY29tJmFtcDtjb2RlPSIgdGFyZ2V0PSJfYmxh
bmsiPjx0YWJsZSBzdHlsZT0id2hpdGUtc3BhY2U6IG5vcm1hbDt0YWJsZS1sYXlvdXQ6IGZp
eGVkOyBwYWRkaW5nLXJpZ2h0OiAyMHB4OyIgY29udGVudGVkaXRhYmxlPSJmYWxzZSIgY2Vs
bHBhZGRpbmc9IjAiIGNlbGxzcGFjaW5nPSIwIj48dGJvZHk+PHRyIHZhbGlnbj0idG9wIj48
dGQgc3R5bGU9IndpZHRoOiA0MHB4O21pbi13aWR0aDogNDBweDsgcGFkZGluZy10b3A6MTBw
eCI+PGRpdiBzdHlsZT0id2lkdGg6IDM4cHg7IGhlaWdodDogMzhweDsgYm9yZGVyOiAxcHgg
I0ZGRiBzb2xpZDsgYm9yZGVyLXJhZGl1czo1MCU7IG1hcmdpbjogMDt2ZXJ0aWNhbC1hbGln
bjogdG9wO2JveC1zaGFkb3c6IDAgMCAxMHB4IDAgcmdiYSgxMjcsMTUyLDE3OCwwLjE0KTsi
PjxpbWcgc3JjPSJodHRwOi8vdGhpcmRxcS5xbG9nby5jbi9nP2I9c2RrJmFtcDtrPVZWTkh5
RmlhaDZrQkVmOWZlaWI2cGdKZyZhbXA7cz0xMDAmYW1wO3Q9MTU1NjQ4NTkzNj9yYW5kPTE2
MzQyNTI0MjQiIHN0eWxlPSJ3aWR0aDoxMDAlO2hlaWdodDoxMDAlO2JvcmRlci1yYWRpdXM6
NTAlO3BvaW50ZXItZXZlbnRzOiBub25lOyI+PC9kaXY+PC90ZD48dGQgc3R5bGU9InBhZGRp
bmc6IDEwcHggMCA4cHggMTBweDsiPjxkaXYgY2xhc3M9ImJ1c2luZXNzQ2FyZF9uYW1lIiBz
dHlsZT0iZm9udC1zaXplOiAxNHB4O2NvbG9yOiAjMzMzMTJFO2xpbmUtaGVpZ2h0OiAyMHB4
OyBwYWRkaW5nLWJvdHRvbTogMnB4OyBtYXJnaW46MDtmb250LXdlaWdodDogNTAwOyI+Li4u
wLTByzwvZGl2PjxkaXYgY2xhc3M9ImJ1c2luZXNzQ2FyZF9tYWlsIiBzdHlsZT0iZm9udC1z
aXplOiAxMnB4O2NvbG9yOiAjOTk5ODk2O2xpbmUtaGVpZ2h0OiAxOHB4OyBtYXJnaW46MDsi
PjI5NDMwNTA2OEBxcS5jb208L2Rpdj48L3RkPjwvdHI+PC90Ym9keT48L3RhYmxlPjwvYT48
L2Rpdj48L2Rpdj48ZGl2PiZuYnNwOzwvZGl2Pg==

------=_NextPart_6791B027_157A3B68_4A66241C--

------=_NextPart_6791B027_157A3B68_781C043F
Content-Type: application/octet-stream;
	charset="gb18030";
	name="0000-cover-letter.patch"
Content-Disposition: attachment; filename="0000-cover-letter.patch"
Content-Transfer-Encoding: base64

RnJvbSAwZjJhMjQ1NDM2NDcyY2E4Zjg2YTIwYmEzODZiZjc0ZDk5ODc2NThiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBjYWl0YW8gPGNhaXRhb0BreWxpbm9zLmNuPgpEYXRl
OiBUaHUsIDIzIEphbiAyMDI1IDEwOjM0OjQzICswODAwClN1YmplY3Q6IFtQQVRDSCBCbHVl
WiAwLzFdICoqKiBTVUJKRUNUIEhFUkUgKioqCgoqKiogQkxVUkIgSEVSRSAqKioKCmNhaXRh
byAoMSk6CiAgb2JleGQvc3JjL21hbmFnZXI6IFRoZSBmaWxlIHRyYW5zZmVyIGVycm9yIG1h
dGNoZXMgdGhlIGRlc2NyaXB0aW9uIGluCiAgICB0aGUgaGVscCBkb2N1bWVudC4KCiBvYmV4
ZC9zcmMvbWFuYWdlci5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCi0tIAoyLjI1LjEKCg==

------=_NextPart_6791B027_157A3B68_781C043F
Content-Type: application/octet-stream;
	charset="gb18030";
	name="0001-obexd-src-manager-The-file-transfer-error-matches-th.patch"
Content-Disposition: attachment; filename="0001-obexd-src-manager-The-file-transfer-error-matches-th.patch"
Content-Transfer-Encoding: base64

RnJvbSAwZjJhMjQ1NDM2NDcyY2E4Zjg2YTIwYmEzODZiZjc0ZDk5ODc2NThiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBjYWl0YW8gPGNhaXRhb0BreWxpbm9zLmNuPgpEYXRl
OiBUaHUsIDIzIEphbiAyMDI1IDEwOjMzOjE1ICswODAwClN1YmplY3Q6IFtQQVRDSCBCbHVl
WiAxLzFdIG9iZXhkL3NyYy9tYW5hZ2VyOiBUaGUgZmlsZSB0cmFuc2ZlciBlcnJvciBtYXRj
aGVzCiB0aGUgZGVzY3JpcHRpb24gaW4gdGhlIGhlbHAgZG9jdW1lbnQuCgotLS0KIG9iZXhk
L3NyYy9tYW5hZ2VyLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL29iZXhkL3NyYy9tYW5hZ2VyLmMgYi9v
YmV4ZC9zcmMvbWFuYWdlci5jCmluZGV4IDVhNmZkOWI0Yi4uNjg4YjNhZTg1IDEwMDY0NAot
LS0gYS9vYmV4ZC9zcmMvbWFuYWdlci5jCisrKyBiL29iZXhkL3NyYy9tYW5hZ2VyLmMKQEAg
LTM5LDYgKzM5LDcgQEAKICNkZWZpbmUgU0VTU0lPTl9JTlRFUkZBQ0UgT0JFWERfU0VSVklD
RSAiLlNlc3Npb24xIgogI2RlZmluZSBBR0VOVF9JTlRFUkZBQ0UgT0JFWERfU0VSVklDRSAi
LkFnZW50MSIKICNkZWZpbmUgT0JFWF9FUlJPUl9SRUpFQ1QgICAgICAib3JnLmJsdWV6Lm9i
ZXguRXJyb3IuUmVqZWN0ZWQiCisjZGVmaW5lIE9CRVhfRVJST1JfQ0FOQ0VMICAgICAgIm9y
Zy5ibHVlei5vYmV4LkVycm9yLkNhbmNlbGVkIgogCiAjZGVmaW5lIFRJTUVPVVQgNjAqMTAw
MCAvKiBUaW1lb3V0IGZvciB1c2VyIHJlc3BvbnNlIChtaWxpc2Vjb25kcykgKi8KIApAQCAt
NjMyLDcgKzYzMyw3IEBAIHN0YXRpYyB2b2lkIGFnZW50X3JlcGx5KERCdXNQZW5kaW5nQ2Fs
bCAqY2FsbCwgdm9pZCAqdXNlcl9kYXRhKQogCQllcnJvcigiQWdlbnQgcmVwbGllZCB3aXRo
IGFuIGVycm9yOiAlcywgJXMiLAogCQkJCWRlcnIubmFtZSwgZGVyci5tZXNzYWdlKTsKIAot
CQlpZiAoZGJ1c19lcnJvcl9oYXNfbmFtZSgmZGVyciwgREJVU19FUlJPUl9OT19SRVBMWSkp
CisJCWlmIChkYnVzX2Vycm9yX2hhc19uYW1lKCZkZXJyLCBEQlVTX0VSUk9SX05PX1JFUExZ
KSB8fCBkYnVzX2Vycm9yX2hhc19uYW1lKCZkZXJyLCBPQkVYX0VSUk9SX0NBTkNFTCkpCiAJ
CQlhZ2VudF9jYW5jZWwoKTsKIAkJZWxzZSBpZiAoZGJ1c19lcnJvcl9oYXNfbmFtZSgmZGVy
ciwgT0JFWF9FUlJPUl9SRUpFQ1QpKQogCQkJYWdlbnQtPmF1dGhfcmVqZWN0ID0gVFJVRTsK
LS0gCjIuMjUuMQoK

------=_NextPart_6791B027_157A3B68_781C043F--


