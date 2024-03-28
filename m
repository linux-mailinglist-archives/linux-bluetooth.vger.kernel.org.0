Return-Path: <linux-bluetooth+bounces-2511-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE3387B55A
	for <lists+linux-bluetooth@lfdr.de>; Thu, 14 Mar 2024 00:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B8F22845A1
	for <lists+linux-bluetooth@lfdr.de>; Wed, 13 Mar 2024 23:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58825D73A;
	Wed, 13 Mar 2024 23:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkG/YUF/"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2242260B
	for <linux-bluetooth@vger.kernel.org>; Wed, 13 Mar 2024 23:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710373754; cv=none; b=m8D5rtmirDNNvjrU94YsYI6F28QchfVccvZgxW2hv3CTyvjHWNp9VEijya9hXEwM1JGMApNYFCprZoZFNYSH4ll/118miFhSLrDAg0AXtcWm/goECb8ZTuKmYufLKkALGn/I0epwU++4SsU3ZK+73ITbBi1zWRj74cyfH3+Xrjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710373754; c=relaxed/simple;
	bh=j3hmTbkQrJ4C3xsA9nirlbjQtoC938A9rbJAMbGilVk=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=bXQlhNBqLUxu4PWANh4YbBvm3+bq56c6dssEXYZoyDvJ6odIDEJxY5mweDxwYv54N+Q1EsQ3mBs9FoBQWRSVv2lVQeqPsM0McjwMmrnkwNltnN+QdSYTlRQTQuEKZzfjgqEwQ0zH8D55B8Vt9ALwhAU6siaiQc7GqUqauLrFSVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkG/YUF/; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-42f1d354005so1667071cf.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 13 Mar 2024 16:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710373751; x=1710978551; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j3hmTbkQrJ4C3xsA9nirlbjQtoC938A9rbJAMbGilVk=;
        b=TkG/YUF/X3JfkGbYuDDV8oFRXWUUVDASEKt7/7qqdaR6h1C7snVMJJbZpZ3UVSBI0i
         Pha+vFmruwjm8F3h6wTptJQr4mP5rLIR7snZnMXBMhE4zL4w3P99rHqjI5PmSuSkeJJ7
         7r8iNJlIWQtAm1cu1UkdXWFKRSdBsxFUrSiuctzVQ7ovLPgDtBqfECCNQ+7KxvunQeLo
         XqHFKQ0gMmt4zO+QPn915wUo10tgM4Wk/hXSL/VafJemdbuPtZ/ybTvmjyQ9HtUWL87W
         98zCX2U0DeUyuL10KdI8tm7GGgHllrYHcJi1h3biFVuENzvIWS/uJUSJEMXRAA2qnF9I
         DuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710373751; x=1710978551;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3hmTbkQrJ4C3xsA9nirlbjQtoC938A9rbJAMbGilVk=;
        b=ZcFmqQ0hnQujG5KAmc8xgmvNbNeY4PcYWauwYCeWYqVzKhF4VRhogLM8bCx+EFqs27
         1Idb2jwRHszRniGLy3/h++4ytL4AsZsxsXEqd83ldlH5ujRmpGGjvIulakXNwvzrKpBh
         WHvA4sel90Zhnpi//Kyko5qpwbXVrJfqY0blb+pt3d285sNuFCnd+MWfc2wsTitEokNG
         6MgR7DYHQ6KUn+ensugzEolIuGS/dQIGPm6X3MkgBV1OACnktWowH3GkflilN4yY20mh
         EGt/rj8keuRQ/boscQWB7Gvfg4Y8CEqto4SBdw+xGN/kWtPy+A0H5c1zTGBDdT+BuUgS
         6MXA==
X-Gm-Message-State: AOJu0Yz8n37drdmNX/oCozcBuZR0X1jIQYBb5hl2ENEET9ooT/hFOHu+
	F81ZFH8rzIFFSAyyJ4nx+gyegG1gWqGjGNRWAnKwuWmnDXPMHJ2Xp5qf+ul6
X-Google-Smtp-Source: AGHT+IHafXXshI+OpMhptlqH3vvYmQrm9jjxdaXA+ZasAWL2MRcRZsFrg5zfwD0o2I86COIprBF4sg==
X-Received: by 2002:a0c:f10a:0:b0:690:d881:3b40 with SMTP id i10-20020a0cf10a000000b00690d8813b40mr254349qvl.11.1710373751475;
        Wed, 13 Mar 2024 16:49:11 -0700 (PDT)
Received: from [172.17.0.2] ([74.249.13.190])
        by smtp.gmail.com with ESMTPSA id a12-20020a056214062c00b0068fef1264f6sm176129qvx.101.2024.03.13.16.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 16:49:11 -0700 (PDT)
Message-ID: <65f23b77.050a0220.d6cb8.0c6c@mx.google.com>
Date: Wed, 13 Mar 2024 16:49:11 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============3242894383830598436=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [BlueZ,v4,1/6] client/player: Split unicast and broadcast presets
In-Reply-To: <20240313194400.1397477-1-luiz.dentz@gmail.com>
References: <20240313194400.1397477-1-luiz.dentz@gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org

--===============3242894383830598436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

VGhpcyBpcyBhdXRvbWF0ZWQgZW1haWwgYW5kIHBsZWFzZSBkbyBub3QgcmVwbHkgdG8gdGhpcyBl
bWFpbCEKCkRlYXIgc3VibWl0dGVyLAoKVGhhbmsgeW91IGZvciBzdWJtaXR0aW5nIHRoZSBwYXRj
aGVzIHRvIHRoZSBsaW51eCBibHVldG9vdGggbWFpbGluZyBsaXN0LgpUaGlzIGlzIGEgQ0kgdGVz
dCByZXN1bHRzIHdpdGggeW91ciBwYXRjaCBzZXJpZXM6ClBXIExpbms6aHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2JsdWV0b290aC9saXN0Lz9zZXJpZXM9ODM1MDgzCgotLS1U
ZXN0IHJlc3VsdC0tLQoKVGVzdCBTdW1tYXJ5OgpDaGVja1BhdGNoICAgICAgICAgICAgICAgICAg
ICBGQUlMICAgICAgMy4zOCBzZWNvbmRzCkdpdExpbnQgICAgICAgICAgICAgICAgICAgICAgIFBB
U1MgICAgICAxLjgzIHNlY29uZHMKQnVpbGRFbGwgICAgICAgICAgICAgICAgICAgICAgUEFTUyAg
ICAgIDIzLjk4IHNlY29uZHMKQmx1ZXpNYWtlICAgICAgICAgICAgICAgICAgICAgUEFTUyAgICAg
IDE2NjAuMzkgc2Vjb25kcwpNYWtlQ2hlY2sgICAgICAgICAgICAgICAgICAgICBGQUlMICAgICAg
MTAuODggc2Vjb25kcwpNYWtlRGlzdGNoZWNrICAgICAgICAgICAgICAgICBGQUlMICAgICAgMzUu
MjIgc2Vjb25kcwpDaGVja1ZhbGdyaW5kICAgICAgICAgICAgICAgICBGQUlMICAgICAgMjM1LjM2
IHNlY29uZHMKQ2hlY2tTbWF0Y2ggICAgICAgICAgICAgICAgICAgUEFTUyAgICAgIDM0Ny4wNCBz
ZWNvbmRzCmJsdWV6bWFrZWV4dGVsbCAgICAgICAgICAgICAgIFBBU1MgICAgICAxMTcuOTIgc2Vj
b25kcwpJbmNyZW1lbnRhbEJ1aWxkICAgICAgICAgICAgICBQQVNTICAgICAgOTQ4Ni40NCBzZWNv
bmRzClNjYW5CdWlsZCAgICAgICAgICAgICAgICAgICAgIFBBU1MgICAgICA5NzAuODEgc2Vjb25k
cwoKRGV0YWlscwojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDogQ2hlY2tQYXRj
aCAtIEZBSUwKRGVzYzogUnVuIGNoZWNrcGF0Y2gucGwgc2NyaXB0Ck91dHB1dDoKW0JsdWVaLHY0
LDIvNl0gY2xpZW50L3BsYXllcjogVXNlIG1hY3JvcyBmcm9tIGxjMy5oIHRvIGRlZmluZSBwcmVz
ZXRzCldBUk5JTkc6UkVQRUFURURfV09SRDogUG9zc2libGUgcmVwZWF0ZWQgd29yZDogJ2ZvcicK
Izk3OiAKVGhpcyBtYWtlcyB1c2Ugb2YgbWFjcm9zIGZvciBmb3IgbGMzLmggdG8gZGVmaW5lIHBy
ZXNldCBjb25maWd1cmF0aW9uCgovZ2l0aHViL3dvcmtzcGFjZS9zcmMvc3JjLzEzNTkxODUxLnBh
dGNoIHRvdGFsOiAwIGVycm9ycywgMSB3YXJuaW5ncywgMzk3IGxpbmVzIGNoZWNrZWQKCk5PVEU6
IEZvciBzb21lIG9mIHRoZSByZXBvcnRlZCBkZWZlY3RzLCBjaGVja3BhdGNoIG1heSBiZSBhYmxl
IHRvCiAgICAgIG1lY2hhbmljYWxseSBjb252ZXJ0IHRvIHRoZSB0eXBpY2FsIHN0eWxlIHVzaW5n
IC0tZml4IG9yIC0tZml4LWlucGxhY2UuCgovZ2l0aHViL3dvcmtzcGFjZS9zcmMvc3JjLzEzNTkx
ODUxLnBhdGNoIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4KCk5PVEU6IElnbm9y
ZWQgbWVzc2FnZSB0eXBlczogQ09NTUlUX01FU1NBR0UgQ09NUExFWF9NQUNSTyBDT05TVF9TVFJV
Q1QgRklMRV9QQVRIX0NIQU5HRVMgTUlTU0lOR19TSUdOX09GRiBQUkVGRVJfUEFDS0VEIFNQRFhf
TElDRU5TRV9UQUcgU1BMSVRfU1RSSU5HIFNTQ0FORl9UT19LU1RSVE8KCk5PVEU6IElmIGFueSBv
ZiB0aGUgZXJyb3JzIGFyZSBmYWxzZSBwb3NpdGl2ZXMsIHBsZWFzZSByZXBvcnQKICAgICAgdGhl
bSB0byB0aGUgbWFpbnRhaW5lciwgc2VlIENIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgoKW0Js
dWVaLHY0LDMvNl0gc2hhcmVkL2xjMzogQWRkIGRlZmluaXRpb24gZm9yIGJyb2FkY2FzdCBjb25m
aWd1cmF0aW9ucwpXQVJOSU5HOlBSRUZFUl9ERUZJTkVEX0FUVFJJQlVURV9NQUNSTzogUHJlZmVy
IF9fcGFja2VkIG92ZXIgX19hdHRyaWJ1dGVfXygocGFja2VkKSkKIzEyNjogRklMRTogc3JjL3No
YXJlZC9iYXAtZGVmcy5oOjE1OgorI2RlZmluZSBfX3BhY2tlZCBfX2F0dHJpYnV0ZV9fKChwYWNr
ZWQpKQoKL2dpdGh1Yi93b3Jrc3BhY2Uvc3JjL3NyYy8xMzU5MTg1Mi5wYXRjaCB0b3RhbDogMCBl
cnJvcnMsIDEgd2FybmluZ3MsIDg1MyBsaW5lcyBjaGVja2VkCgpOT1RFOiBGb3Igc29tZSBvZiB0
aGUgcmVwb3J0ZWQgZGVmZWN0cywgY2hlY2twYXRjaCBtYXkgYmUgYWJsZSB0bwogICAgICBtZWNo
YW5pY2FsbHkgY29udmVydCB0byB0aGUgdHlwaWNhbCBzdHlsZSB1c2luZyAtLWZpeCBvciAtLWZp
eC1pbnBsYWNlLgoKL2dpdGh1Yi93b3Jrc3BhY2Uvc3JjL3NyYy8xMzU5MTg1Mi5wYXRjaCBoYXMg
c3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuCgpOT1RFOiBJZ25vcmVkIG1lc3NhZ2UgdHlw
ZXM6IENPTU1JVF9NRVNTQUdFIENPTVBMRVhfTUFDUk8gQ09OU1RfU1RSVUNUIEZJTEVfUEFUSF9D
SEFOR0VTIE1JU1NJTkdfU0lHTl9PRkYgUFJFRkVSX1BBQ0tFRCBTUERYX0xJQ0VOU0VfVEFHIFNQ
TElUX1NUUklORyBTU0NBTkZfVE9fS1NUUlRPCgpOT1RFOiBJZiBhbnkgb2YgdGhlIGVycm9ycyBh
cmUgZmFsc2UgcG9zaXRpdmVzLCBwbGVhc2UgcmVwb3J0CiAgICAgIHRoZW0gdG8gdGhlIG1haW50
YWluZXIsIHNlZSBDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKCltCbHVlWix2NCw0LzZdIGNs
aWVudC9wbGF5ZXI6IFVzZSBRT1MgbWFjcm9zIGZyb20gbGMzLmggdG8gZGVmaW5lIHByZXNldHMK
V0FSTklORzpSRVBFQVRFRF9XT1JEOiBQb3NzaWJsZSByZXBlYXRlZCB3b3JkOiAnZm9yJwojOTc6
IApUaGlzIG1ha2VzIHVzZSBvZiBRT1MgbWFjcm9zIGZvciBmb3IgbGMzLmggdG8gZGVmaW5lIHBy
ZXNldAoKL2dpdGh1Yi93b3Jrc3BhY2Uvc3JjL3NyYy8xMzU5MTg1NC5wYXRjaCB0b3RhbDogMCBl
cnJvcnMsIDEgd2FybmluZ3MsIDU5NyBsaW5lcyBjaGVja2VkCgpOT1RFOiBGb3Igc29tZSBvZiB0
aGUgcmVwb3J0ZWQgZGVmZWN0cywgY2hlY2twYXRjaCBtYXkgYmUgYWJsZSB0bwogICAgICBtZWNo
YW5pY2FsbHkgY29udmVydCB0byB0aGUgdHlwaWNhbCBzdHlsZSB1c2luZyAtLWZpeCBvciAtLWZp
eC1pbnBsYWNlLgoKL2dpdGh1Yi93b3Jrc3BhY2Uvc3JjL3NyYy8xMzU5MTg1NC5wYXRjaCBoYXMg
c3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuCgpOT1RFOiBJZ25vcmVkIG1lc3NhZ2UgdHlw
ZXM6IENPTU1JVF9NRVNTQUdFIENPTVBMRVhfTUFDUk8gQ09OU1RfU1RSVUNUIEZJTEVfUEFUSF9D
SEFOR0VTIE1JU1NJTkdfU0lHTl9PRkYgUFJFRkVSX1BBQ0tFRCBTUERYX0xJQ0VOU0VfVEFHIFNQ
TElUX1NUUklORyBTU0NBTkZfVE9fS1NUUlRPCgpOT1RFOiBJZiBhbnkgb2YgdGhlIGVycm9ycyBh
cmUgZmFsc2UgcG9zaXRpdmVzLCBwbGVhc2UgcmVwb3J0CiAgICAgIHRoZW0gdG8gdGhlIG1haW50
YWluZXIsIHNlZSBDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKCiMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwpUZXN0OiBNYWtlQ2hlY2sgLSBGQUlMCkRlc2M6IFJ1biBCbHVleiBNYWtl
IENoZWNrCk91dHB1dDoKCi4vdGVzdC1kcml2ZXI6IGxpbmUgMTA3OiAzMTk1NyBBYm9ydGVkICAg
ICAgICAgICAgICAgICAoY29yZSBkdW1wZWQpICIkQCIgPiAkbG9nX2ZpbGUgMj4mMQptYWtlWzNd
OiAqKiogW01ha2VmaWxlOjExNjQyOiB0ZXN0LXN1aXRlLmxvZ10gRXJyb3IgMQptYWtlWzJdOiAq
KiogW01ha2VmaWxlOjExNzUwOiBjaGVjay1URVNUU10gRXJyb3IgMgptYWtlWzFdOiAqKiogW01h
a2VmaWxlOjEyMTc5OiBjaGVjay1hbV0gRXJyb3IgMgptYWtlOiAqKiogW01ha2VmaWxlOjEyMTgx
OiBjaGVja10gRXJyb3IgMgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDogTWFr
ZURpc3RjaGVjayAtIEZBSUwKRGVzYzogUnVuIEJsdWV6IE1ha2UgRGlzdGNoZWNrCk91dHB1dDoK
ClBhY2thZ2UgY3VwcyB3YXMgbm90IGZvdW5kIGluIHRoZSBwa2ctY29uZmlnIHNlYXJjaCBwYXRo
LgpQZXJoYXBzIHlvdSBzaG91bGQgYWRkIHRoZSBkaXJlY3RvcnkgY29udGFpbmluZyBgY3Vwcy5w
YycKdG8gdGhlIFBLR19DT05GSUdfUEFUSCBlbnZpcm9ubWVudCB2YXJpYWJsZQpObyBwYWNrYWdl
ICdjdXBzJyBmb3VuZApJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vLi4vc3JjL3NoYXJlZC9iYXAu
YzozMDoKLi4vLi4vc3JjL3NoYXJlZC9iYXAuaDoxMzoxMDogZmF0YWwgZXJyb3I6IHNyYy9zaGFy
ZWQvYmFwLWRlZnMuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQogICAxMyB8ICNpbmNsdWRl
ICJzcmMvc2hhcmVkL2JhcC1kZWZzLmgiCiAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4KY29tcGlsYXRpb24gdGVybWluYXRlZC4KbWFrZVsyXTogKioqIFtNYWtlZmlsZTo4
NTcwOiBzcmMvc2hhcmVkL2xpYnNoYXJlZF9tYWlubG9vcF9sYS1iYXAubG9dIEVycm9yIDEKbWFr
ZVsyXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KbWFrZVsxXTogKioqIFtN
YWtlZmlsZTo0NjQ2OiBhbGxdIEVycm9yIDIKbWFrZTogKioqIFtNYWtlZmlsZToxMjEwMjogZGlz
dGNoZWNrXSBFcnJvciAxCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBDaGVj
a1ZhbGdyaW5kIC0gRkFJTApEZXNjOiBSdW4gQmx1ZXogTWFrZSBDaGVjayB3aXRoIFZhbGdyaW5k
Ck91dHB1dDoKCnRvb2xzL21nbXQtdGVzdGVyLmM6IEluIGZ1bmN0aW9uIOKAmG1haW7igJk6CnRv
b2xzL21nbXQtdGVzdGVyLmM6MTI3MjE6NTogbm90ZTogdmFyaWFibGUgdHJhY2tpbmcgc2l6ZSBs
aW1pdCBleGNlZWRlZCB3aXRoIOKAmC1mdmFyLXRyYWNraW5nLWFzc2lnbm1lbnRz4oCZLCByZXRy
eWluZyB3aXRob3V0CjEyNzIxIHwgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAg
ICAgfCAgICAgXn5+fgouL3Rlc3QtZHJpdmVyOiBsaW5lIDEwNzogNjIyNDggQWJvcnRlZCAgICAg
ICAgICAgICAgICAgKGNvcmUgZHVtcGVkKSAiJEAiID4gJGxvZ19maWxlIDI+JjEKbWFrZVszXTog
KioqIFtNYWtlZmlsZToxMTY0MjogdGVzdC1zdWl0ZS5sb2ddIEVycm9yIDEKbWFrZVsyXTogKioq
IFtNYWtlZmlsZToxMTc1MDogY2hlY2stVEVTVFNdIEVycm9yIDIKbWFrZVsxXTogKioqIFtNYWtl
ZmlsZToxMjE3OTogY2hlY2stYW1dIEVycm9yIDIKbWFrZTogKioqIFtNYWtlZmlsZToxMjE4MTog
Y2hlY2tdIEVycm9yIDIKCgotLS0KUmVnYXJkcywKTGludXggQmx1ZXRvb3RoCgo=

--===============3242894383830598436==--

