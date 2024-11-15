Return-Path: <linux-bluetooth+bounces-8646-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF90D9CD9B4
	for <lists+linux-bluetooth@lfdr.de>; Fri, 15 Nov 2024 08:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 362DC1F213C2
	for <lists+linux-bluetooth@lfdr.de>; Fri, 15 Nov 2024 07:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F46187561;
	Fri, 15 Nov 2024 07:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtDXHNht"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACFDA32
	for <linux-bluetooth@vger.kernel.org>; Fri, 15 Nov 2024 07:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731654772; cv=none; b=nM+firBKrtKwaCMSnPhUIeeR2VKw4yuBIwabbP7Rejhz5dLwM8sFJWZJu0mDHDLRHufbz38RddyXeHOkOcYXtdh825A0bnEdLYxSyzot0HWLIQekJBXImll0SryOQq5+8aS6CAIwC88jAhYUeRY3DbAWjKfD1/5hQKjb4Z2ovL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731654772; c=relaxed/simple;
	bh=OafAliWn/fLB7aBmQMMrsYJbkXm3WtzwH3fuMjTA4sA=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=lt3GhA9SPb6ffZ4krLMDT557R/IephwT9SGxTb5FshUgZAiIortpCu7jACxav1ERxOu/3olBZGi7FRCxAOQ4EehAZJ9Lf90CQ9Qk54O+ij2fywG3dDopK4LGErdgnXCRYlO05YW2RjI10zxjAu8ZJ4GOo8MLkA3ECgjG0ImqvmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtDXHNht; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5139cd002b7so647727e0c.0
        for <linux-bluetooth@vger.kernel.org>; Thu, 14 Nov 2024 23:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731654769; x=1732259569; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OafAliWn/fLB7aBmQMMrsYJbkXm3WtzwH3fuMjTA4sA=;
        b=UtDXHNhtpOMzh0PWvL4SaC4tqfYdihIIoCCrbJdXuXjivtJaRUD9jlJQ8gf5BsZuKl
         nTf8mLEfR+jKXQBgg1/Ax7kITRdTHB0ne7xhZ5Z4M98kAri8iaw+zmL5MVjIYeADSPEf
         odQLdM2V/Arf2idbAzaueBJo++97g8aRRzcUPJRZqKNqsMTWDe7V3nv6XHFBUphx+MI1
         GeoNuo+5lnlonSwuFAL7xYVE9qMqCtQOHdyLwoeVi1T6COopFmqqIvmlt88BzTmiSdxq
         q3RcY3Xm2f9WLucQ7lSGwUZ4xNkK3PMhZGImbr4Jqc+xkt2e+N8jBt8+QiVMItHcR99/
         arSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731654769; x=1732259569;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OafAliWn/fLB7aBmQMMrsYJbkXm3WtzwH3fuMjTA4sA=;
        b=Xq9hFjBoIi6kRIcyAOT/EXVLc4JMWcrY7pKAoSMWaG2mqcQblaDNB1kPMyLS+cH/+f
         DNEdWwDFeEIoz5E52fbNSAfGetvGT6aqC1cvZYC7Oy+Kvv4yqpa/9KahtRhilo56e9ne
         uGCLOSbIk+zjIT9YP01zCgmJ6i5wNMUENaWmckqYqa694XmpPlD1xCPQDQ3zc5IR2/rR
         B64XSN5ESVNSCvZ4eibHyo76fJeSgFuY88t5xCdAUvL0jf7X0bYjkDkDbtbFfTiFcYjB
         5AcvOZnzOSQni+hmyscFVw7vjFCsI6W3MgvhK/t6/8i1XTSQ6TC8aLVO5jiXwP1QwpPV
         kQjA==
X-Gm-Message-State: AOJu0YxVMdhiA8ireicccs43bOMg7X5dck9w0hkfSVBXPnNsyTizt/xf
	70zEnWh6A+aD/RYtBaF53cgadPjrw+mmmuyWBmzGzsM9nYjCeKUjl34jcQ==
X-Google-Smtp-Source: AGHT+IEcQL9Dnvi8OQH9JlsZUamovubIo7mDWlk+qRcwrcr3wVFysBEB9sC9XMmROgTpM2+nvWRkYw==
X-Received: by 2002:a67:ee8d:0:b0:4ad:63b1:eb62 with SMTP id ada2fe7eead31-4ad63b1eeb5mr1431073137.4.1731654769196;
        Thu, 14 Nov 2024 23:12:49 -0800 (PST)
Received: from [172.17.0.2] ([74.249.21.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4635a9e9824sm15916871cf.26.2024.11.14.23.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 23:12:48 -0800 (PST)
Message-ID: <6736f470.050a0220.21c6a1.57f8@mx.google.com>
Date: Thu, 14 Nov 2024 23:12:48 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============6273364113398779719=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, quic_dgangire@quicinc.com
Subject: RE: [BlueZ,v3] tools/obexctl: Add support for system/session bus
In-Reply-To: <20241115064304.503655-1-quic_dgangire@quicinc.com>
References: <20241115064304.503655-1-quic_dgangire@quicinc.com>
Reply-To: linux-bluetooth@vger.kernel.org

--===============6273364113398779719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

VGhpcyBpcyBhdXRvbWF0ZWQgZW1haWwgYW5kIHBsZWFzZSBkbyBub3QgcmVwbHkgdG8gdGhpcyBl
bWFpbCEKCkRlYXIgc3VibWl0dGVyLAoKVGhhbmsgeW91IGZvciBzdWJtaXR0aW5nIHRoZSBwYXRj
aGVzIHRvIHRoZSBsaW51eCBibHVldG9vdGggbWFpbGluZyBsaXN0LgpUaGlzIGlzIGEgQ0kgdGVz
dCByZXN1bHRzIHdpdGggeW91ciBwYXRjaCBzZXJpZXM6ClBXIExpbms6aHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2JsdWV0b290aC9saXN0Lz9zZXJpZXM9OTA5ODU3CgotLS1U
ZXN0IHJlc3VsdC0tLQoKVGVzdCBTdW1tYXJ5OgpDaGVja1BhdGNoICAgICAgICAgICAgICAgICAg
ICBQRU5ESU5HICAgMC4yMCBzZWNvbmRzCkdpdExpbnQgICAgICAgICAgICAgICAgICAgICAgIFBF
TkRJTkcgICAwLjIwIHNlY29uZHMKQnVpbGRFbGwgICAgICAgICAgICAgICAgICAgICAgUEFTUyAg
ICAgIDIwLjQ0IHNlY29uZHMKQmx1ZXpNYWtlICAgICAgICAgICAgICAgICAgICAgRkFJTCAgICAg
IDQ5LjAxIHNlY29uZHMKTWFrZUNoZWNrICAgICAgICAgICAgICAgICAgICAgRkFJTCAgICAgIDE2
NC40MCBzZWNvbmRzCk1ha2VEaXN0Y2hlY2sgICAgICAgICAgICAgICAgIFBBU1MgICAgICAxNTku
MDQgc2Vjb25kcwpDaGVja1ZhbGdyaW5kICAgICAgICAgICAgICAgICBGQUlMICAgICAgNDEuODEg
c2Vjb25kcwpDaGVja1NtYXRjaCAgICAgICAgICAgICAgICAgICBGQUlMICAgICAgOTMuODEgc2Vj
b25kcwpibHVlem1ha2VleHRlbGwgICAgICAgICAgICAgICBGQUlMICAgICAgMjQuNTEgc2Vjb25k
cwpJbmNyZW1lbnRhbEJ1aWxkICAgICAgICAgICAgICBQRU5ESU5HICAgMC4yNyBzZWNvbmRzClNj
YW5CdWlsZCAgICAgICAgICAgICAgICAgICAgIFBBU1MgICAgICA4NDIuODcgc2Vjb25kcwoKRGV0
YWlscwojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDogQ2hlY2tQYXRjaCAtIFBF
TkRJTkcKRGVzYzogUnVuIGNoZWNrcGF0Y2gucGwgc2NyaXB0Ck91dHB1dDoKCiMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBHaXRMaW50IC0gUEVORElORwpEZXNjOiBSdW4gZ2l0
bGludApPdXRwdXQ6CgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDogQmx1ZXpN
YWtlIC0gRkFJTApEZXNjOiBCdWlsZCBCbHVlWgpPdXRwdXQ6Cgp0b29scy9vYmV4Y3RsLmM6IElu
IGZ1bmN0aW9uIOKAmGNoZWNrX29iZXhkX3NlcnZpY2XigJk6CnRvb2xzL29iZXhjdGwuYzoyMTYw
OjI6IGVycm9yOiBJU08gQzkwIGZvcmJpZHMgbWl4ZWQgZGVjbGFyYXRpb25zIGFuZCBjb2RlIFst
V2Vycm9yPWRlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudF0KIDIxNjAgfCAgYm9vbCBoYXNfb3du
ZXIgPSBkYnVzX2J1c19uYW1lX2hhc19vd25lcihjb25uLCBPQkVYRF9TRVJWSUNFLCAmZXJyKTsK
ICAgICAgfCAgXn5+fgp0b29scy9vYmV4Y3RsLmM6IEluIGZ1bmN0aW9uIOKAmG1haW7igJk6CnRv
b2xzL29iZXhjdGwuYzoyMTc5OjI6IGVycm9yOiBJU08gQzkwIGZvcmJpZHMgbWl4ZWQgZGVjbGFy
YXRpb25zIGFuZCBjb2RlIFstV2Vycm9yPWRlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudF0KIDIx
NzkgfCAgYm9vbCBzZXNzaW9uX2J1c19hY3RpdmUgPSBmYWxzZTsKICAgICAgfCAgXn5+fgp0b29s
cy9vYmV4Y3RsLmM6MjIwNToyOiBlcnJvcjog4oCYY2xpZW504oCZIG1heSBiZSB1c2VkIHVuaW5p
dGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlvbiBbLVdlcnJvcj1tYXliZS11bmluaXRpYWxpemVkXQog
MjIwNSB8ICBnX2RidXNfY2xpZW50X3VucmVmKGNsaWVudCk7CiAgICAgIHwgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fgpjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9y
cwptYWtlWzFdOiAqKiogW01ha2VmaWxlOjc4NzU6IHRvb2xzL29iZXhjdGwub10gRXJyb3IgMQpt
YWtlWzFdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgp0b29scy9tZ210LXRl
c3Rlci5jOiBJbiBmdW5jdGlvbiDigJhtYWlu4oCZOgp0b29scy9tZ210LXRlc3Rlci5jOjEyNzI1
OjU6IG5vdGU6IHZhcmlhYmxlIHRyYWNraW5nIHNpemUgbGltaXQgZXhjZWVkZWQgd2l0aCDigJgt
ZnZhci10cmFja2luZy1hc3NpZ25tZW50c+KAmSwgcmV0cnlpbmcgd2l0aG91dAoxMjcyNSB8IGlu
dCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAgICAgIHwgICAgIF5+fn4KbWFrZTogKioq
IFtNYWtlZmlsZTo0NjkzOiBhbGxdIEVycm9yIDIKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjClRlc3Q6IE1ha2VDaGVjayAtIEZBSUwKRGVzYzogUnVuIEJsdWV6IE1ha2UgQ2hlY2sKT3V0
cHV0OgoKdG9vbHMvb2JleGN0bC5jOiBJbiBmdW5jdGlvbiDigJhjaGVja19vYmV4ZF9zZXJ2aWNl
4oCZOgp0b29scy9vYmV4Y3RsLmM6MjE2MDoyOiBlcnJvcjogSVNPIEM5MCBmb3JiaWRzIG1peGVk
IGRlY2xhcmF0aW9ucyBhbmQgY29kZSBbLVdlcnJvcj1kZWNsYXJhdGlvbi1hZnRlci1zdGF0ZW1l
bnRdCiAyMTYwIHwgIGJvb2wgaGFzX293bmVyID0gZGJ1c19idXNfbmFtZV9oYXNfb3duZXIoY29u
biwgT0JFWERfU0VSVklDRSwgJmVycik7CiAgICAgIHwgIF5+fn4KdG9vbHMvb2JleGN0bC5jOiBJ
biBmdW5jdGlvbiDigJhtYWlu4oCZOgp0b29scy9vYmV4Y3RsLmM6MjE3OToyOiBlcnJvcjogSVNP
IEM5MCBmb3JiaWRzIG1peGVkIGRlY2xhcmF0aW9ucyBhbmQgY29kZSBbLVdlcnJvcj1kZWNsYXJh
dGlvbi1hZnRlci1zdGF0ZW1lbnRdCiAyMTc5IHwgIGJvb2wgc2Vzc2lvbl9idXNfYWN0aXZlID0g
ZmFsc2U7CiAgICAgIHwgIF5+fn4KdG9vbHMvb2JleGN0bC5jOjIyMDU6MjogZXJyb3I6IOKAmGNs
aWVudOKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24gWy1XZXJy
b3I9bWF5YmUtdW5pbml0aWFsaXplZF0KIDIyMDUgfCAgZ19kYnVzX2NsaWVudF91bnJlZihjbGll
bnQpOwogICAgICB8ICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KY2MxOiBhbGwgd2Fybmlu
Z3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKbWFrZVsxXTogKioqIFtNYWtlZmlsZTo3ODc1OiB0
b29scy9vYmV4Y3RsLm9dIEVycm9yIDEKbWFrZTogKioqIFtNYWtlZmlsZToxMjM1ODogY2hlY2td
IEVycm9yIDIKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjClRlc3Q6IENoZWNrVmFsZ3Jp
bmQgLSBGQUlMCkRlc2M6IFJ1biBCbHVleiBNYWtlIENoZWNrIHdpdGggVmFsZ3JpbmQKT3V0cHV0
OgoKdG9vbHMvb2JleGN0bC5jOiBJbiBmdW5jdGlvbiDigJhjaGVja19vYmV4ZF9zZXJ2aWNl4oCZ
Ogp0b29scy9vYmV4Y3RsLmM6MjE2MDoyOiBlcnJvcjogSVNPIEM5MCBmb3JiaWRzIG1peGVkIGRl
Y2xhcmF0aW9ucyBhbmQgY29kZSBbLVdlcnJvcj1kZWNsYXJhdGlvbi1hZnRlci1zdGF0ZW1lbnRd
CiAyMTYwIHwgIGJvb2wgaGFzX293bmVyID0gZGJ1c19idXNfbmFtZV9oYXNfb3duZXIoY29ubiwg
T0JFWERfU0VSVklDRSwgJmVycik7CiAgICAgIHwgIF5+fn4KdG9vbHMvb2JleGN0bC5jOiBJbiBm
dW5jdGlvbiDigJhtYWlu4oCZOgp0b29scy9vYmV4Y3RsLmM6MjE3OToyOiBlcnJvcjogSVNPIEM5
MCBmb3JiaWRzIG1peGVkIGRlY2xhcmF0aW9ucyBhbmQgY29kZSBbLVdlcnJvcj1kZWNsYXJhdGlv
bi1hZnRlci1zdGF0ZW1lbnRdCiAyMTc5IHwgIGJvb2wgc2Vzc2lvbl9idXNfYWN0aXZlID0gZmFs
c2U7CiAgICAgIHwgIF5+fn4KdG9vbHMvb2JleGN0bC5jOjIyMDU6MjogZXJyb3I6IOKAmGNsaWVu
dOKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24gWy1XZXJyb3I9
bWF5YmUtdW5pbml0aWFsaXplZF0KIDIyMDUgfCAgZ19kYnVzX2NsaWVudF91bnJlZihjbGllbnQp
OwogICAgICB8ICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KY2MxOiBhbGwgd2FybmluZ3Mg
YmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKbWFrZVsxXTogKioqIFtNYWtlZmlsZTo3ODc1OiB0b29s
cy9vYmV4Y3RsLm9dIEVycm9yIDEKbWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQg
am9icy4uLi4KdG9vbHMvbWdtdC10ZXN0ZXIuYzogSW4gZnVuY3Rpb24g4oCYbWFpbuKAmToKdG9v
bHMvbWdtdC10ZXN0ZXIuYzoxMjcyNTo1OiBub3RlOiB2YXJpYWJsZSB0cmFja2luZyBzaXplIGxp
bWl0IGV4Y2VlZGVkIHdpdGgg4oCYLWZ2YXItdHJhY2tpbmctYXNzaWdubWVudHPigJksIHJldHJ5
aW5nIHdpdGhvdXQKMTI3MjUgfCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogICAg
ICB8ICAgICBefn5+Cm1ha2U6ICoqKiBbTWFrZWZpbGU6MTIzNTg6IGNoZWNrXSBFcnJvciAyCiMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBDaGVja1NtYXRjaCAtIEZBSUwKRGVz
YzogUnVuIHNtYXRjaCB0b29sIHdpdGggc291cmNlCk91dHB1dDoKCnNyYy9zaGFyZWQvY3J5cHRv
LmM6MjcxOjIxOiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL3No
YXJlZC9jcnlwdG8uYzoyNzI6MjM6IHdhcm5pbmc6IFZhcmlhYmxlIGxlbmd0aCBhcnJheSBpcyB1
c2VkLgpzcmMvc2hhcmVkL2dhdHQtaGVscGVycy5jOjc2ODozMTogd2FybmluZzogVmFyaWFibGUg
bGVuZ3RoIGFycmF5IGlzIHVzZWQuCnNyYy9zaGFyZWQvZ2F0dC1oZWxwZXJzLmM6ODMwOjMxOiB3
YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9nYXR0LWhl
bHBlcnMuYzoxMzIzOjMxOiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4K
c3JjL3NoYXJlZC9nYXR0LWhlbHBlcnMuYzoxMzU0OjIzOiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5n
dGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9nYXR0LXNlcnZlci5jOjI3ODoyNTogd2Fybmlu
ZzogVmFyaWFibGUgbGVuZ3RoIGFycmF5IGlzIHVzZWQuCnNyYy9zaGFyZWQvZ2F0dC1zZXJ2ZXIu
Yzo2MTg6MjU6IHdhcm5pbmc6IFZhcmlhYmxlIGxlbmd0aCBhcnJheSBpcyB1c2VkLgpzcmMvc2hh
cmVkL2dhdHQtc2VydmVyLmM6NzE2OjI1OiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkg
aXMgdXNlZC4Kc3JjL3NoYXJlZC9iYXAuYzoyOTY6MjU6IHdhcm5pbmc6IGFycmF5IG9mIGZsZXhp
YmxlIHN0cnVjdHVyZXMKc3JjL3NoYXJlZC9iYXAuYzogbm90ZTogaW4gaW5jbHVkZWQgZmlsZToK
Li9zcmMvc2hhcmVkL2FzY3MuaDo4ODoyNTogd2FybmluZzogYXJyYXkgb2YgZmxleGlibGUgc3Ry
dWN0dXJlcwpzcmMvc2hhcmVkL3NoZWxsLmM6IG5vdGU6IGluIGluY2x1ZGVkIGZpbGUgKHRocm91
Z2ggL3Vzci9pbmNsdWRlL3JlYWRsaW5lL3JlYWRsaW5lLmgpOgovdXNyL2luY2x1ZGUvcmVhZGxp
bmUvcmx0eXBlZGVmcy5oOjM1OjIzOiB3YXJuaW5nOiBub24tQU5TSSBmdW5jdGlvbiBkZWNsYXJh
dGlvbiBvZiBmdW5jdGlvbiAnRnVuY3Rpb24nCi91c3IvaW5jbHVkZS9yZWFkbGluZS9ybHR5cGVk
ZWZzLmg6MzY6MjU6IHdhcm5pbmc6IG5vbi1BTlNJIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIG9mIGZ1
bmN0aW9uICdWRnVuY3Rpb24nCi91c3IvaW5jbHVkZS9yZWFkbGluZS9ybHR5cGVkZWZzLmg6Mzc6
Mjc6IHdhcm5pbmc6IG5vbi1BTlNJIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdD
UEZ1bmN0aW9uJwovdXNyL2luY2x1ZGUvcmVhZGxpbmUvcmx0eXBlZGVmcy5oOjM4OjI5OiB3YXJu
aW5nOiBub24tQU5TSSBmdW5jdGlvbiBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnQ1BQRnVuY3Rp
b24nCnNyYy9zaGFyZWQvY3J5cHRvLmM6MjcxOjIxOiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGgg
YXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9jcnlwdG8uYzoyNzI6MjM6IHdhcm5pbmc6IFZhcmlh
YmxlIGxlbmd0aCBhcnJheSBpcyB1c2VkLgpzcmMvc2hhcmVkL2dhdHQtaGVscGVycy5jOjc2ODoz
MTogd2FybmluZzogVmFyaWFibGUgbGVuZ3RoIGFycmF5IGlzIHVzZWQuCnNyYy9zaGFyZWQvZ2F0
dC1oZWxwZXJzLmM6ODMwOjMxOiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNl
ZC4Kc3JjL3NoYXJlZC9nYXR0LWhlbHBlcnMuYzoxMzIzOjMxOiB3YXJuaW5nOiBWYXJpYWJsZSBs
ZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9nYXR0LWhlbHBlcnMuYzoxMzU0OjIzOiB3
YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9nYXR0LXNl
cnZlci5jOjI3ODoyNTogd2FybmluZzogVmFyaWFibGUgbGVuZ3RoIGFycmF5IGlzIHVzZWQuCnNy
Yy9zaGFyZWQvZ2F0dC1zZXJ2ZXIuYzo2MTg6MjU6IHdhcm5pbmc6IFZhcmlhYmxlIGxlbmd0aCBh
cnJheSBpcyB1c2VkLgpzcmMvc2hhcmVkL2dhdHQtc2VydmVyLmM6NzE2OjI1OiB3YXJuaW5nOiBW
YXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9iYXAuYzoyOTY6MjU6IHdh
cm5pbmc6IGFycmF5IG9mIGZsZXhpYmxlIHN0cnVjdHVyZXMKc3JjL3NoYXJlZC9iYXAuYzogbm90
ZTogaW4gaW5jbHVkZWQgZmlsZToKLi9zcmMvc2hhcmVkL2FzY3MuaDo4ODoyNTogd2FybmluZzog
YXJyYXkgb2YgZmxleGlibGUgc3RydWN0dXJlcwpzcmMvc2hhcmVkL3NoZWxsLmM6IG5vdGU6IGlu
IGluY2x1ZGVkIGZpbGUgKHRocm91Z2ggL3Vzci9pbmNsdWRlL3JlYWRsaW5lL3JlYWRsaW5lLmgp
OgovdXNyL2luY2x1ZGUvcmVhZGxpbmUvcmx0eXBlZGVmcy5oOjM1OjIzOiB3YXJuaW5nOiBub24t
QU5TSSBmdW5jdGlvbiBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnRnVuY3Rpb24nCi91c3IvaW5j
bHVkZS9yZWFkbGluZS9ybHR5cGVkZWZzLmg6MzY6MjU6IHdhcm5pbmc6IG5vbi1BTlNJIGZ1bmN0
aW9uIGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdWRnVuY3Rpb24nCi91c3IvaW5jbHVkZS9yZWFk
bGluZS9ybHR5cGVkZWZzLmg6Mzc6Mjc6IHdhcm5pbmc6IG5vbi1BTlNJIGZ1bmN0aW9uIGRlY2xh
cmF0aW9uIG9mIGZ1bmN0aW9uICdDUEZ1bmN0aW9uJwovdXNyL2luY2x1ZGUvcmVhZGxpbmUvcmx0
eXBlZGVmcy5oOjM4OjI5OiB3YXJuaW5nOiBub24tQU5TSSBmdW5jdGlvbiBkZWNsYXJhdGlvbiBv
ZiBmdW5jdGlvbiAnQ1BQRnVuY3Rpb24nCnRvb2xzL21lc2gtY2ZndGVzdC5jOjE0NTM6MTc6IHdh
cm5pbmc6IHVua25vd24gZXNjYXBlIHNlcXVlbmNlOiAnXCUnCnRvb2xzL3Njby10ZXN0ZXIuYzog
bm90ZTogaW4gaW5jbHVkZWQgZmlsZToKLi9saWIvYmx1ZXRvb3RoLmg6MjE5OjE1OiB3YXJuaW5n
OiBhcnJheSBvZiBmbGV4aWJsZSBzdHJ1Y3R1cmVzCi4vbGliL2JsdWV0b290aC5oOjIyNDozMTog
d2FybmluZzogYXJyYXkgb2YgZmxleGlibGUgc3RydWN0dXJlcwp0b29scy9ibmVwdGVzdC5jOjYz
NDozOTogd2FybmluZzogdW5rbm93biBlc2NhcGUgc2VxdWVuY2U6ICdcJScKdG9vbHMvc2VxMmJz
ZXEuYzo1NzoyNjogd2FybmluZzogVmFyaWFibGUgbGVuZ3RoIGFycmF5IGlzIHVzZWQuCnRvb2xz
L29iZXgtY2xpZW50LXRvb2wuYzogbm90ZTogaW4gaW5jbHVkZWQgZmlsZSAodGhyb3VnaCAvdXNy
L2luY2x1ZGUvcmVhZGxpbmUvcmVhZGxpbmUuaCk6Ci91c3IvaW5jbHVkZS9yZWFkbGluZS9ybHR5
cGVkZWZzLmg6MzU6MjM6IHdhcm5pbmc6IG5vbi1BTlNJIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIG9m
IGZ1bmN0aW9uICdGdW5jdGlvbicKL3Vzci9pbmNsdWRlL3JlYWRsaW5lL3JsdHlwZWRlZnMuaDoz
NjoyNTogd2FybmluZzogbm9uLUFOU0kgZnVuY3Rpb24gZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g
J1ZGdW5jdGlvbicKL3Vzci9pbmNsdWRlL3JlYWRsaW5lL3JsdHlwZWRlZnMuaDozNzoyNzogd2Fy
bmluZzogbm9uLUFOU0kgZnVuY3Rpb24gZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ0NQRnVuY3Rp
b24nCi91c3IvaW5jbHVkZS9yZWFkbGluZS9ybHR5cGVkZWZzLmg6Mzg6Mjk6IHdhcm5pbmc6IG5v
bi1BTlNJIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdDUFBGdW5jdGlvbicKdG9v
bHMvb2JleGN0bC5jOjIxNjA6OTogd2FybmluZzogbWl4aW5nIGRlY2xhcmF0aW9ucyBhbmQgY29k
ZQp0b29scy9vYmV4Y3RsLmM6MjE3OTo5OiB3YXJuaW5nOiBtaXhpbmcgZGVjbGFyYXRpb25zIGFu
ZCBjb2RlCnRvb2xzL29iZXhjdGwuYzogSW4gZnVuY3Rpb24g4oCYY2hlY2tfb2JleGRfc2Vydmlj
ZeKAmToKdG9vbHMvb2JleGN0bC5jOjIxNjA6MjogZXJyb3I6IElTTyBDOTAgZm9yYmlkcyBtaXhl
ZCBkZWNsYXJhdGlvbnMgYW5kIGNvZGUgWy1XZXJyb3I9ZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVt
ZW50XQogMjE2MCB8ICBib29sIGhhc19vd25lciA9IGRidXNfYnVzX25hbWVfaGFzX293bmVyKGNv
bm4sIE9CRVhEX1NFUlZJQ0UsICZlcnIpOwogICAgICB8ICBefn5+CnRvb2xzL29iZXhjdGwuYzog
SW4gZnVuY3Rpb24g4oCYbWFpbuKAmToKdG9vbHMvb2JleGN0bC5jOjIxNzk6MjogZXJyb3I6IElT
TyBDOTAgZm9yYmlkcyBtaXhlZCBkZWNsYXJhdGlvbnMgYW5kIGNvZGUgWy1XZXJyb3I9ZGVjbGFy
YXRpb24tYWZ0ZXItc3RhdGVtZW50XQogMjE3OSB8ICBib29sIHNlc3Npb25fYnVzX2FjdGl2ZSA9
IGZhbHNlOwogICAgICB8ICBefn5+CnRvb2xzL29iZXhjdGwuYzoyMjA1OjI6IGVycm9yOiDigJhj
bGllbnTigJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uIFstV2Vy
cm9yPW1heWJlLXVuaW5pdGlhbGl6ZWRdCiAyMjA1IHwgIGdfZGJ1c19jbGllbnRfdW5yZWYoY2xp
ZW50KTsKICAgICAgfCAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CmNjMTogYWxsIHdhcm5p
bmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6Nzg3NTog
dG9vbHMvb2JleGN0bC5vXSBFcnJvciAxCm1ha2VbMV06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlz
aGVkIGpvYnMuLi4uCm1ha2U6ICoqKiBbTWFrZWZpbGU6NDY5MzogYWxsXSBFcnJvciAyCiMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBibHVlem1ha2VleHRlbGwgLSBGQUlMCkRl
c2M6IEJ1aWxkIEJsdWV6IHdpdGggRXh0ZXJuYWwgRUxMCk91dHB1dDoKCnRvb2xzL29iZXhjdGwu
YzogSW4gZnVuY3Rpb24g4oCYY2hlY2tfb2JleGRfc2VydmljZeKAmToKdG9vbHMvb2JleGN0bC5j
OjIxNjA6MjogZXJyb3I6IElTTyBDOTAgZm9yYmlkcyBtaXhlZCBkZWNsYXJhdGlvbnMgYW5kIGNv
ZGUgWy1XZXJyb3I9ZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50XQogMjE2MCB8ICBib29sIGhh
c19vd25lciA9IGRidXNfYnVzX25hbWVfaGFzX293bmVyKGNvbm4sIE9CRVhEX1NFUlZJQ0UsICZl
cnIpOwogICAgICB8ICBefn5+CnRvb2xzL29iZXhjdGwuYzogSW4gZnVuY3Rpb24g4oCYbWFpbuKA
mToKdG9vbHMvb2JleGN0bC5jOjIxNzk6MjogZXJyb3I6IElTTyBDOTAgZm9yYmlkcyBtaXhlZCBk
ZWNsYXJhdGlvbnMgYW5kIGNvZGUgWy1XZXJyb3I9ZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50
XQogMjE3OSB8ICBib29sIHNlc3Npb25fYnVzX2FjdGl2ZSA9IGZhbHNlOwogICAgICB8ICBefn5+
CnRvb2xzL29iZXhjdGwuYzoyMjA1OjI6IGVycm9yOiDigJhjbGllbnTigJkgbWF5IGJlIHVzZWQg
dW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uIFstV2Vycm9yPW1heWJlLXVuaW5pdGlhbGl6
ZWRdCiAyMjA1IHwgIGdfZGJ1c19jbGllbnRfdW5yZWYoY2xpZW50KTsKICAgICAgfCAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+CmNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMg
ZXJyb3JzCm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6Nzg3NTogdG9vbHMvb2JleGN0bC5vXSBFcnJv
ciAxCm1ha2VbMV06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCm1ha2U6ICoq
KiBbTWFrZWZpbGU6NDY5MzogYWxsXSBFcnJvciAyCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwpUZXN0OiBJbmNyZW1lbnRhbEJ1aWxkIC0gUEVORElORwpEZXNjOiBJbmNyZW1lbnRhbCBi
dWlsZCB3aXRoIHRoZSBwYXRjaGVzIGluIHRoZSBzZXJpZXMKT3V0cHV0OgoKCgotLS0KUmVnYXJk
cywKTGludXggQmx1ZXRvb3RoCgo=

--===============6273364113398779719==--

