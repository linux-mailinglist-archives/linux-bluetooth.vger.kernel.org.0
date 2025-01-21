Return-Path: <linux-bluetooth+bounces-9843-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D00FA17F0A
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 Jan 2025 14:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1767E188B587
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 Jan 2025 13:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF441F2C4C;
	Tue, 21 Jan 2025 13:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0iBW2zc"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B021F2C34
	for <linux-bluetooth@vger.kernel.org>; Tue, 21 Jan 2025 13:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737466887; cv=none; b=Lh/fOYGz4o3N7H6+ZDHhPCk3xUZsSL8LMV7c4S2vlSg/otJgh/Kux5CdSreeVoAjQfYrJc5XSbV0YwPYxGg+532AkOBj/1hUCdGzonoQvqUqQeekcWfes3CWNpSq10d1yKZ5aAyj828B+XuY1PYX09WNmgK1iH/OXKHeOIPCPcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737466887; c=relaxed/simple;
	bh=fiK4CVk5aqEYO2cZpuNY+C/0Ksy2pYJfcGH65OU1wlY=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=oLkncw/4NNq3/NuExvS0kMHONe5pSZEm0gGy47QSqqRIlblDxPI6HM67pcAXN7ZI2Xje8Ziu6DJZqlh6f3ZG/SjxkGo4CJqymqjM/uYHSryl/Xdt7h+lETenmk8enJO6Hp47nTUN3ZqzsReCXG8CcCyT11ddbTS0jkMLmHwYsa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0iBW2zc; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e1a41935c3so78622406d6.3
        for <linux-bluetooth@vger.kernel.org>; Tue, 21 Jan 2025 05:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737466884; x=1738071684; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fiK4CVk5aqEYO2cZpuNY+C/0Ksy2pYJfcGH65OU1wlY=;
        b=e0iBW2zc0IROd9OjrL58BvHI//3y+JUv9CwabmJmBnHwKhPUMojyzGzH3khbh6Ux+L
         DE9BHGud07ynUXNAPUmFN6xNhiRmJA+KwR8/F1EIYOv9+btLPaEcrZtCaCozyoq37d01
         D1OVhHIbEvYIeTHNZzryLQqah0LumM0fOTGA5Fin9V+ybyJH4HeCcmGF24giDxi21fGt
         kastnIwqoRjhAULexZ4vGmj7xjQSlx/vifeULlLytCAuEZ/3BCa0idEwo75IzRQF+I9w
         Z0B80GedYfo32U67YOxxXxCv7lJRpwSrTNzFo3FfOiVLFR1pmG7OfdARECwkL8+mvsIu
         2F9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737466884; x=1738071684;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiK4CVk5aqEYO2cZpuNY+C/0Ksy2pYJfcGH65OU1wlY=;
        b=TjoLuaBbYM9B6RUbIHpYUb1P5kYNVlepoiWNgDZlfhDpsok5H2nmXubhk8Kkeoonw3
         aBO89HTx1iwcvcn9rpVbcrpbc1+MbV593EzLCAifRY1RAmNO1+AMoPIO8XIukuD8DvnU
         Ov/vxvgTDh0Ql4fg0CB/N3dvj89aCp/EZ49Lu0eSbkUuhHIK4fQyQRgMoeDzXfKu94pI
         20SwFWwNvv4FHv0QtY0paqHev+WXJdSvkApCgRX3OYkEdi9Bx/u7Ks1fthyWWLBvLAX5
         vXWT/IN1Xmx+5A3bGY5sK1W0as+YotWMMQHJRlsoqNSS/K7nhzLN0qCRy7bM4bIf/kHv
         C1Pg==
X-Gm-Message-State: AOJu0Yw8aVqKfETsBF7UgKAAPO80IrUouSyO1BW7R3ObmXMykz2RIUg5
	4+gbOk2FcyTLECiEl6MCsPJenGgyZK+uIRTe7l6qUamGN/DUljktmpxdsA==
X-Gm-Gg: ASbGncsD29elUpOixNLCEdx/K1eA+FKYvjRgtSNvwQp20etT179tTHlxBlmbUEG267T
	hYhcv+aov6O9rDb+G2l024hWQaiBoXjxXsab4E042Pj2XVThOQnhTiupMixZ6gmZdOwaRupEZvd
	JeFqZ4wWjHRCz9kdYMWB3MUsLbBC3ZqppiQR8gX+exzhiyaHX7YSUf34OWYNjtZptaQ/1IvyRw0
	l6+tD/B4Q8v7vFxREUg0IKC7kj1fvgWB/qMmfR7wSCgBt+RGUPlr50kPHkfL2UBDBbsCUHbCKRK
	+bk=
X-Google-Smtp-Source: AGHT+IGgdXAQvpuUXke453D+6+QITEkoZGAhkGzyrkRn+0fb1by+GAvkurILeQocK8/YEUlBXfUBow==
X-Received: by 2002:a05:6214:2aa8:b0:6d4:1ea3:981d with SMTP id 6a1803df08f44-6e1b223031emr267041136d6.43.1737466883679;
        Tue, 21 Jan 2025 05:41:23 -0800 (PST)
Received: from [172.17.0.2] ([172.200.199.217])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afbf381bsm51023406d6.10.2025.01.21.05.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 05:41:23 -0800 (PST)
Message-ID: <678fa403.0c0a0220.3d2921.39a5@mx.google.com>
Date: Tue, 21 Jan 2025 05:41:23 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============2141329570822126841=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, michal.dzik@streamunlimited.com
Subject: RE: connect VCP profile to MediaTransport volume
In-Reply-To: <20250121124718.3995904-2-michal.dzik@streamunlimited.com>
References: <20250121124718.3995904-2-michal.dzik@streamunlimited.com>
Reply-To: linux-bluetooth@vger.kernel.org

--===============2141329570822126841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

VGhpcyBpcyBhdXRvbWF0ZWQgZW1haWwgYW5kIHBsZWFzZSBkbyBub3QgcmVwbHkgdG8gdGhpcyBl
bWFpbCEKCkRlYXIgc3VibWl0dGVyLAoKVGhhbmsgeW91IGZvciBzdWJtaXR0aW5nIHRoZSBwYXRj
aGVzIHRvIHRoZSBsaW51eCBibHVldG9vdGggbWFpbGluZyBsaXN0LgpUaGlzIGlzIGEgQ0kgdGVz
dCByZXN1bHRzIHdpdGggeW91ciBwYXRjaCBzZXJpZXM6ClBXIExpbms6aHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2JsdWV0b290aC9saXN0Lz9zZXJpZXM9OTI3MjI2CgotLS1U
ZXN0IHJlc3VsdC0tLQoKVGVzdCBTdW1tYXJ5OgpDaGVja1BhdGNoICAgICAgICAgICAgICAgICAg
ICBQRU5ESU5HICAgMC4yMSBzZWNvbmRzCkdpdExpbnQgICAgICAgICAgICAgICAgICAgICAgIFBF
TkRJTkcgICAwLjIxIHNlY29uZHMKQnVpbGRFbGwgICAgICAgICAgICAgICAgICAgICAgUEFTUyAg
ICAgIDIwLjMwIHNlY29uZHMKQmx1ZXpNYWtlICAgICAgICAgICAgICAgICAgICAgRkFJTCAgICAg
IDE3LjkyIHNlY29uZHMKTWFrZUNoZWNrICAgICAgICAgICAgICAgICAgICAgRkFJTCAgICAgIDM1
LjIwIHNlY29uZHMKTWFrZURpc3RjaGVjayAgICAgICAgICAgICAgICAgUEFTUyAgICAgIDE1OS4z
OCBzZWNvbmRzCkNoZWNrVmFsZ3JpbmQgICAgICAgICAgICAgICAgIEZBSUwgICAgICAxNS4wMCBz
ZWNvbmRzCkNoZWNrU21hdGNoICAgICAgICAgICAgICAgICAgIEZBSUwgICAgICAyMC4wOSBzZWNv
bmRzCmJsdWV6bWFrZWV4dGVsbCAgICAgICAgICAgICAgIEZBSUwgICAgICAxMy4zNCBzZWNvbmRz
CkluY3JlbWVudGFsQnVpbGQgICAgICAgICAgICAgIFBFTkRJTkcgICAwLjI1IHNlY29uZHMKU2Nh
bkJ1aWxkICAgICAgICAgICAgICAgICAgICAgUEFTUyAgICAgIDg2MS43MyBzZWNvbmRzCgpEZXRh
aWxzCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBDaGVja1BhdGNoIC0gUEVO
RElORwpEZXNjOiBSdW4gY2hlY2twYXRjaC5wbCBzY3JpcHQKT3V0cHV0OgoKIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjClRlc3Q6IEdpdExpbnQgLSBQRU5ESU5HCkRlc2M6IFJ1biBnaXRs
aW50Ck91dHB1dDoKCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBCbHVlek1h
a2UgLSBGQUlMCkRlc2M6IEJ1aWxkIEJsdWVaCk91dHB1dDoKCnNyYy9zaGFyZWQvdmNwLmM6MjA0
Mjo2OiBlcnJvcjogbm8gcHJldmlvdXMgZGVjbGFyYXRpb24gZm9yIOKAmGJ0X3ZjcF9zZXRfdm9s
dW1lX2NsaWVudOKAmSBbLVdlcnJvcj1taXNzaW5nLWRlY2xhcmF0aW9uc10KIDIwNDIgfCBib29s
IGJ0X3ZjcF9zZXRfdm9sdW1lX2NsaWVudChzdHJ1Y3QgYnRfdmNwICp2Y3AsIHVpbnQ4X3Qgdm9s
dW1lKQogICAgICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CnNyYy9zaGFyZWQvdmNw
LmM6MjA3ODo2OiBlcnJvcjogbm8gcHJldmlvdXMgZGVjbGFyYXRpb24gZm9yIOKAmGJ0X3ZjcF9z
ZXRfdm9sdW1lX3NlcnZlcuKAmSBbLVdlcnJvcj1taXNzaW5nLWRlY2xhcmF0aW9uc10KIDIwNzgg
fCBib29sIGJ0X3ZjcF9zZXRfdm9sdW1lX3NlcnZlcihzdHJ1Y3QgYnRfdmNwICp2Y3AsIHVpbnQ4
X3Qgdm9sdW1lKQogICAgICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CmNjMTogYWxs
IHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6
ODY3Njogc3JjL3NoYXJlZC9saWJzaGFyZWRfbWFpbmxvb3BfbGEtdmNwLmxvXSBFcnJvciAxCm1h
a2VbMV06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCm1ha2U6ICoqKiBbTWFr
ZWZpbGU6NDY5MzogYWxsXSBFcnJvciAyCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpU
ZXN0OiBNYWtlQ2hlY2sgLSBGQUlMCkRlc2M6IFJ1biBCbHVleiBNYWtlIENoZWNrCk91dHB1dDoK
CnNyYy9zaGFyZWQvdmNwLmM6MjA0Mjo2OiBlcnJvcjogbm8gcHJldmlvdXMgZGVjbGFyYXRpb24g
Zm9yIOKAmGJ0X3ZjcF9zZXRfdm9sdW1lX2NsaWVudOKAmSBbLVdlcnJvcj1taXNzaW5nLWRlY2xh
cmF0aW9uc10KIDIwNDIgfCBib29sIGJ0X3ZjcF9zZXRfdm9sdW1lX2NsaWVudChzdHJ1Y3QgYnRf
dmNwICp2Y3AsIHVpbnQ4X3Qgdm9sdW1lKQogICAgICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+CnNyYy9zaGFyZWQvdmNwLmM6MjA3ODo2OiBlcnJvcjogbm8gcHJldmlvdXMgZGVjbGFy
YXRpb24gZm9yIOKAmGJ0X3ZjcF9zZXRfdm9sdW1lX3NlcnZlcuKAmSBbLVdlcnJvcj1taXNzaW5n
LWRlY2xhcmF0aW9uc10KIDIwNzggfCBib29sIGJ0X3ZjcF9zZXRfdm9sdW1lX3NlcnZlcihzdHJ1
Y3QgYnRfdmNwICp2Y3AsIHVpbnQ4X3Qgdm9sdW1lKQogICAgICB8ICAgICAgXn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+CmNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCm1h
a2VbMV06ICoqKiBbTWFrZWZpbGU6ODQzMTogc3JjL3NoYXJlZC9saWJzaGFyZWRfZ2xpYl9sYS12
Y3AubG9dIEVycm9yIDEKbWFrZTogKioqIFtNYWtlZmlsZToxMjM0NDogY2hlY2tdIEVycm9yIDIK
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjClRlc3Q6IENoZWNrVmFsZ3JpbmQgLSBGQUlM
CkRlc2M6IFJ1biBCbHVleiBNYWtlIENoZWNrIHdpdGggVmFsZ3JpbmQKT3V0cHV0OgoKc3JjL3No
YXJlZC92Y3AuYzoyMDQyOjY6IGVycm9yOiBubyBwcmV2aW91cyBkZWNsYXJhdGlvbiBmb3Ig4oCY
YnRfdmNwX3NldF92b2x1bWVfY2xpZW504oCZIFstV2Vycm9yPW1pc3NpbmctZGVjbGFyYXRpb25z
XQogMjA0MiB8IGJvb2wgYnRfdmNwX3NldF92b2x1bWVfY2xpZW50KHN0cnVjdCBidF92Y3AgKnZj
cCwgdWludDhfdCB2b2x1bWUpCiAgICAgIHwgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4K
c3JjL3NoYXJlZC92Y3AuYzoyMDc4OjY6IGVycm9yOiBubyBwcmV2aW91cyBkZWNsYXJhdGlvbiBm
b3Ig4oCYYnRfdmNwX3NldF92b2x1bWVfc2VydmVy4oCZIFstV2Vycm9yPW1pc3NpbmctZGVjbGFy
YXRpb25zXQogMjA3OCB8IGJvb2wgYnRfdmNwX3NldF92b2x1bWVfc2VydmVyKHN0cnVjdCBidF92
Y3AgKnZjcCwgdWludDhfdCB2b2x1bWUpCiAgICAgIHwgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn4KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKbWFrZVsxXTog
KioqIFtNYWtlZmlsZTo4Njc2OiBzcmMvc2hhcmVkL2xpYnNoYXJlZF9tYWlubG9vcF9sYS12Y3Au
bG9dIEVycm9yIDEKbWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4K
bWFrZTogKioqIFtNYWtlZmlsZToxMjM0NDogY2hlY2tdIEVycm9yIDIKIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjClRlc3Q6IENoZWNrU21hdGNoIC0gRkFJTApEZXNjOiBSdW4gc21hdGNo
IHRvb2wgd2l0aCBzb3VyY2UKT3V0cHV0OgoKc3JjL3NoYXJlZC9jcnlwdG8uYzoyNzE6MjE6IHdh
cm5pbmc6IFZhcmlhYmxlIGxlbmd0aCBhcnJheSBpcyB1c2VkLgpzcmMvc2hhcmVkL2NyeXB0by5j
OjI3MjoyMzogd2FybmluZzogVmFyaWFibGUgbGVuZ3RoIGFycmF5IGlzIHVzZWQuCnNyYy9zaGFy
ZWQvZ2F0dC1oZWxwZXJzLmM6NzY4OjMxOiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkg
aXMgdXNlZC4Kc3JjL3NoYXJlZC9nYXR0LWhlbHBlcnMuYzo4MzA6MzE6IHdhcm5pbmc6IFZhcmlh
YmxlIGxlbmd0aCBhcnJheSBpcyB1c2VkLgpzcmMvc2hhcmVkL2dhdHQtaGVscGVycy5jOjEzMjM6
MzE6IHdhcm5pbmc6IFZhcmlhYmxlIGxlbmd0aCBhcnJheSBpcyB1c2VkLgpzcmMvc2hhcmVkL2dh
dHQtaGVscGVycy5jOjEzNTQ6MjM6IHdhcm5pbmc6IFZhcmlhYmxlIGxlbmd0aCBhcnJheSBpcyB1
c2VkLgpzcmMvc2hhcmVkL2dhdHQtc2VydmVyLmM6Mjc4OjI1OiB3YXJuaW5nOiBWYXJpYWJsZSBs
ZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9nYXR0LXNlcnZlci5jOjYxODoyNTogd2Fy
bmluZzogVmFyaWFibGUgbGVuZ3RoIGFycmF5IGlzIHVzZWQuCnNyYy9zaGFyZWQvZ2F0dC1zZXJ2
ZXIuYzo3MTY6MjU6IHdhcm5pbmc6IFZhcmlhYmxlIGxlbmd0aCBhcnJheSBpcyB1c2VkLgpzcmMv
c2hhcmVkL2JhcC5jOjI5NjoyNTogd2FybmluZzogYXJyYXkgb2YgZmxleGlibGUgc3RydWN0dXJl
cwpzcmMvc2hhcmVkL2JhcC5jOiBub3RlOiBpbiBpbmNsdWRlZCBmaWxlOgouL3NyYy9zaGFyZWQv
YXNjcy5oOjg4OjI1OiB3YXJuaW5nOiBhcnJheSBvZiBmbGV4aWJsZSBzdHJ1Y3R1cmVzCnNyYy9z
aGFyZWQvdmNwLmM6MjA0Mjo2OiBlcnJvcjogbm8gcHJldmlvdXMgZGVjbGFyYXRpb24gZm9yIOKA
mGJ0X3ZjcF9zZXRfdm9sdW1lX2NsaWVudOKAmSBbLVdlcnJvcj1taXNzaW5nLWRlY2xhcmF0aW9u
c10KIDIwNDIgfCBib29sIGJ0X3ZjcF9zZXRfdm9sdW1lX2NsaWVudChzdHJ1Y3QgYnRfdmNwICp2
Y3AsIHVpbnQ4X3Qgdm9sdW1lKQogICAgICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
CnNyYy9zaGFyZWQvdmNwLmM6MjA3ODo2OiBlcnJvcjogbm8gcHJldmlvdXMgZGVjbGFyYXRpb24g
Zm9yIOKAmGJ0X3ZjcF9zZXRfdm9sdW1lX3NlcnZlcuKAmSBbLVdlcnJvcj1taXNzaW5nLWRlY2xh
cmF0aW9uc10KIDIwNzggfCBib29sIGJ0X3ZjcF9zZXRfdm9sdW1lX3NlcnZlcihzdHJ1Y3QgYnRf
dmNwICp2Y3AsIHVpbnQ4X3Qgdm9sdW1lKQogICAgICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+CmNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCm1ha2VbMV06
ICoqKiBbTWFrZWZpbGU6ODY3Njogc3JjL3NoYXJlZC9saWJzaGFyZWRfbWFpbmxvb3BfbGEtdmNw
LmxvXSBFcnJvciAxCm1ha2VbMV06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4u
Cm1ha2U6ICoqKiBbTWFrZWZpbGU6NDY5MzogYWxsXSBFcnJvciAyCiMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwpUZXN0OiBibHVlem1ha2VleHRlbGwgLSBGQUlMCkRlc2M6IEJ1aWxkIEJs
dWV6IHdpdGggRXh0ZXJuYWwgRUxMCk91dHB1dDoKCnNyYy9zaGFyZWQvdmNwLmM6MjA0Mjo2OiBl
cnJvcjogbm8gcHJldmlvdXMgZGVjbGFyYXRpb24gZm9yIOKAmGJ0X3ZjcF9zZXRfdm9sdW1lX2Ns
aWVudOKAmSBbLVdlcnJvcj1taXNzaW5nLWRlY2xhcmF0aW9uc10KIDIwNDIgfCBib29sIGJ0X3Zj
cF9zZXRfdm9sdW1lX2NsaWVudChzdHJ1Y3QgYnRfdmNwICp2Y3AsIHVpbnQ4X3Qgdm9sdW1lKQog
ICAgICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CnNyYy9zaGFyZWQvdmNwLmM6MjA3
ODo2OiBlcnJvcjogbm8gcHJldmlvdXMgZGVjbGFyYXRpb24gZm9yIOKAmGJ0X3ZjcF9zZXRfdm9s
dW1lX3NlcnZlcuKAmSBbLVdlcnJvcj1taXNzaW5nLWRlY2xhcmF0aW9uc10KIDIwNzggfCBib29s
IGJ0X3ZjcF9zZXRfdm9sdW1lX3NlcnZlcihzdHJ1Y3QgYnRfdmNwICp2Y3AsIHVpbnQ4X3Qgdm9s
dW1lKQogICAgICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CmNjMTogYWxsIHdhcm5p
bmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6ODY3Njog
c3JjL3NoYXJlZC9saWJzaGFyZWRfbWFpbmxvb3BfbGEtdmNwLmxvXSBFcnJvciAxCm1ha2VbMV06
ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCm1ha2U6ICoqKiBbTWFrZWZpbGU6
NDY5MzogYWxsXSBFcnJvciAyCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBJ
bmNyZW1lbnRhbEJ1aWxkIC0gUEVORElORwpEZXNjOiBJbmNyZW1lbnRhbCBidWlsZCB3aXRoIHRo
ZSBwYXRjaGVzIGluIHRoZSBzZXJpZXMKT3V0cHV0OgoKCgotLS0KUmVnYXJkcywKTGludXggQmx1
ZXRvb3RoCgo=

--===============2141329570822126841==--

