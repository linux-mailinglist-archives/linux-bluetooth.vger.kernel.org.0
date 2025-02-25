Return-Path: <linux-bluetooth+bounces-10666-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE38A450D9
	for <lists+linux-bluetooth@lfdr.de>; Wed, 26 Feb 2025 00:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 754913A9F50
	for <lists+linux-bluetooth@lfdr.de>; Tue, 25 Feb 2025 23:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2882356D1;
	Tue, 25 Feb 2025 23:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1O9L8A9"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EAB18C34B
	for <linux-bluetooth@vger.kernel.org>; Tue, 25 Feb 2025 23:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740525162; cv=none; b=ta5/SnLP7BQRNf0mjfZbms074asRiieHS6cvbzSBzohhJKDROhNoKwkCDxVb4Ja/kNn467d21GMczH1Uq2qPXrQdvgCGKQwU6GTG96vZRGy2Nt1WEZxlpXGjKU0YQGTtZrdrEvsqHbUXiH9t1WJsZSzPtXtTBxJTPOtKXD7bT7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740525162; c=relaxed/simple;
	bh=7vo81No5+CCEw7pBp6Xle7MbYhe3IZ+nfIm2bm9R1Ow=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=dKz0522zNvmI8DJJ98cen0g3Dnz8QtCVrJ7j0pnWtMLFa7fGoDuDI4uMAF5f3lpyEe6H4X1FdLobxiXuCQzy5Z41TItOHVUZ4Ml2GFbBj+a97vFEMjQKoim4KgVHKulLp3tbLXTlNy/lTb4Mho0vd6RUE6QvUn9XuwAhANCY7fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1O9L8A9; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fe82414cf7so183442a91.0
        for <linux-bluetooth@vger.kernel.org>; Tue, 25 Feb 2025 15:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740525160; x=1741129960; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7vo81No5+CCEw7pBp6Xle7MbYhe3IZ+nfIm2bm9R1Ow=;
        b=Q1O9L8A98sQA/9szGrwUUjhmoutuhDYjIo9fvivTNly3GxuCfqGK9ayM6yxHanshrX
         I62qceUqNaCgeKEHHBvWFeveIIh2o8cjF2hyUVx9zWdVkVI/PGFzBqNrurrSorr7Yxei
         5SJOLTH90EZeWD3GxXVpU9CdT1SeHIEUPU8iyzBc0xJGNbYk+InOY0wPUH5wCUJlDljr
         JwX1vjfOFzUnfBgBZf3RcXC1mx//p5GYLNNjcQKrMb8wHOKlb56hhoWs8n51UCT4z6AG
         7yPir0xNQxrn1v4359xNnJwVA990alp/Rol69QPuU/DQ1eJNmp93J4QjL1NOVOuSHEXD
         4+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740525160; x=1741129960;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vo81No5+CCEw7pBp6Xle7MbYhe3IZ+nfIm2bm9R1Ow=;
        b=epb1U+yYQMMvi/A4fQ97G9/Y/IPj6AGB5yT/npqcjZLB+dr0D+Nf7juoyCd3Xu5wFy
         OzAF6GzbIEcUrV+zZwggY2yg9pIh9GlUyKylZfoloXhPxIy7xeVsGyDvY3k6VJAWB/MP
         xhaSYjUBNY2akbr7jKXxXjumzPqvBkIKt3HjuDkVhaKBYvbTJ1/h+aWSBl1VMG0Vt6Ad
         DXt14eVcKfNdh+SxCiIYXXHoXHl4PZ8kACWzxAWrvwzcL6TJ3vQAz24xwosAVwvgJHeR
         ZJhhhAzBzpXUBZ0Z/DGf26JSuYd//Z7yaWGeKZzLthggaOA4MVdmMYXyIer0qSon0GyJ
         lDzA==
X-Gm-Message-State: AOJu0Yy8mckS3AtM0jkDUa9oj+B06iWWntVW2hZNVDig6K7K/ECSbBed
	DdxQ4uDuGakQMeOPN1GKBBJosLfBPZKLOKffhKQF73ns0V+d5tOI9QyB7g==
X-Gm-Gg: ASbGnctAJUAdlSqQlOZskff9lRWwKMUIiX9+x9O/ymh3ZvNJqtAuSc9+7qXyP+dnZJ2
	PiRvSrHWt5fYMuJhdicMGgsCXQyDPBy4AyJ9sEHRmh3MmQ7fJ/YF+U4kWLX/fvcmfkADEuaoAgE
	9L9YSccISRBq1V4BedRxqW1mXL5FKGe+WNTUAuM8zyzCOvzsTc7RVntj1n+WxeIvkHNIO69Q6sX
	4vwp+P0SoST/yQVZk4R6aqDDKB5TDNoYSeHiTECFOye/8mN+ytm8nHCn1+F+eKlxF1hA2hnJ2jO
	gmZX8R88Z0Y0/oF1WzjwWOg2DbRPcr0=
X-Google-Smtp-Source: AGHT+IGjswJOB/ReKyuIfV8l/YDoCB7txeoUF+fJRRvyd3dFk1+OnL+JC1xzQy4p1yOrVt+fWpXa1A==
X-Received: by 2002:a17:90a:d2d0:b0:2ee:b2e6:4276 with SMTP id 98e67ed59e1d1-2fe68d06654mr7812523a91.27.1740525159568;
        Tue, 25 Feb 2025 15:12:39 -0800 (PST)
Received: from [172.17.0.2] ([52.155.59.81])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825bb682sm118063a91.18.2025.02.25.15.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 15:12:39 -0800 (PST)
Message-ID: <67be4e67.170a0220.63f31.0abe@mx.google.com>
Date: Tue, 25 Feb 2025 15:12:39 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============1491677147602560989=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [BlueZ,v2,1/3] org.bluez.Device: Introduced PreferredBearer
In-Reply-To: <20250225220059.2821394-1-luiz.dentz@gmail.com>
References: <20250225220059.2821394-1-luiz.dentz@gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org

--===============1491677147602560989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

VGhpcyBpcyBhdXRvbWF0ZWQgZW1haWwgYW5kIHBsZWFzZSBkbyBub3QgcmVwbHkgdG8gdGhpcyBl
bWFpbCEKCkRlYXIgc3VibWl0dGVyLAoKVGhhbmsgeW91IGZvciBzdWJtaXR0aW5nIHRoZSBwYXRj
aGVzIHRvIHRoZSBsaW51eCBibHVldG9vdGggbWFpbGluZyBsaXN0LgpUaGlzIGlzIGEgQ0kgdGVz
dCByZXN1bHRzIHdpdGggeW91ciBwYXRjaCBzZXJpZXM6ClBXIExpbms6aHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2JsdWV0b290aC9saXN0Lz9zZXJpZXM9OTM3NzQwCgotLS1U
ZXN0IHJlc3VsdC0tLQoKVGVzdCBTdW1tYXJ5OgpDaGVja1BhdGNoICAgICAgICAgICAgICAgICAg
ICBQRU5ESU5HICAgMC4zOCBzZWNvbmRzCkdpdExpbnQgICAgICAgICAgICAgICAgICAgICAgIFBF
TkRJTkcgICAwLjMxIHNlY29uZHMKQnVpbGRFbGwgICAgICAgICAgICAgICAgICAgICAgUEFTUyAg
ICAgIDIwLjQ1IHNlY29uZHMKQmx1ZXpNYWtlICAgICAgICAgICAgICAgICAgICAgRkFJTCAgICAg
IDg2LjM3IHNlY29uZHMKTWFrZUNoZWNrICAgICAgICAgICAgICAgICAgICAgRkFJTCAgICAgIDE5
NDQuMDUgc2Vjb25kcwpNYWtlRGlzdGNoZWNrICAgICAgICAgICAgICAgICBQQVNTICAgICAgMTU5
LjQ0IHNlY29uZHMKQ2hlY2tWYWxncmluZCAgICAgICAgICAgICAgICAgRkFJTCAgICAgIDYyLjg0
IHNlY29uZHMKQ2hlY2tTbWF0Y2ggICAgICAgICAgICAgICAgICAgRkFJTCAgICAgIDE1Mi4wMCBz
ZWNvbmRzCmJsdWV6bWFrZWV4dGVsbCAgICAgICAgICAgICAgIEZBSUwgICAgICA2OS4wMyBzZWNv
bmRzCkluY3JlbWVudGFsQnVpbGQgICAgICAgICAgICAgIFBFTkRJTkcgICAwLjM1IHNlY29uZHMK
U2NhbkJ1aWxkICAgICAgICAgICAgICAgICAgICAgUEFTUyAgICAgIDg3Mi40NSBzZWNvbmRzCgpE
ZXRhaWxzCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBDaGVja1BhdGNoIC0g
UEVORElORwpEZXNjOiBSdW4gY2hlY2twYXRjaC5wbCBzY3JpcHQKT3V0cHV0OgoKIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjClRlc3Q6IEdpdExpbnQgLSBQRU5ESU5HCkRlc2M6IFJ1biBn
aXRsaW50Ck91dHB1dDoKCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBCbHVl
ek1ha2UgLSBGQUlMCkRlc2M6IEJ1aWxkIEJsdWVaCk91dHB1dDoKCnRvb2xzL21nbXQtdGVzdGVy
LmM6IEluIGZ1bmN0aW9uIOKAmG1haW7igJk6CnRvb2xzL21nbXQtdGVzdGVyLmM6MTI4OTM6NTog
bm90ZTogdmFyaWFibGUgdHJhY2tpbmcgc2l6ZSBsaW1pdCBleGNlZWRlZCB3aXRoIOKAmC1mdmFy
LXRyYWNraW5nLWFzc2lnbm1lbnRz4oCZLCByZXRyeWluZyB3aXRob3V0CjEyODkzIHwgaW50IG1h
aW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAgICAgfCAgICAgXn5+fgpzcmMvZGV2aWNlLmM6
IEluIGZ1bmN0aW9uIOKAmGRldl9wcm9wZXJ0eV9wcmVmZXJfYmVhcmVyX2V4aXN0c+KAmToKc3Jj
L2RldmljZS5jOjM0MjA6Njg6IGVycm9yOiBzdWdnZXN0IHBhcmVudGhlc2VzIGFyb3VuZCDigJgm
JuKAmSB3aXRoaW4g4oCYfHzigJkgWy1XZXJyb3I9cGFyZW50aGVzZXNdCiAzNDIwIHwgIGlmICgo
ZGV2aWNlLT5icmVkcl9zdGF0ZS5jb25uZWN0ZWQgfHwgZGV2aWNlLT5icmVkcl9zdGF0ZS5ib25k
ZWQpICYmCiAgICAgIHwgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fl5+CiAzNDIxIHwgICAgZGV2aWNlLT5sZV9zdGF0ZS5j
b25uZWN0ZWQgfHwgZGV2aWNlLT5sZV9zdGF0ZS5ib25kZWQpCiAgICAgIHwgICAgfn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAK
Y2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKbWFrZVsxXTogKioqIFtN
YWtlZmlsZToxMTEzNzogc3JjL2JsdWV0b290aGQtZGV2aWNlLm9dIEVycm9yIDEKbWFrZVsxXTog
KioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KbWFrZTogKioqIFtNYWtlZmlsZTo0
NjgyOiBhbGxdIEVycm9yIDIKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjClRlc3Q6IE1h
a2VDaGVjayAtIEZBSUwKRGVzYzogUnVuIEJsdWV6IE1ha2UgQ2hlY2sKT3V0cHV0OgoKdW5pdC90
ZXN0LWF2ZHRwLmM6IEluIGZ1bmN0aW9uIOKAmG1haW7igJk6CnVuaXQvdGVzdC1hdmR0cC5jOjc2
Njo1OiBub3RlOiB2YXJpYWJsZSB0cmFja2luZyBzaXplIGxpbWl0IGV4Y2VlZGVkIHdpdGgg4oCY
LWZ2YXItdHJhY2tpbmctYXNzaWdubWVudHPigJksIHJldHJ5aW5nIHdpdGhvdXQKICA3NjYgfCBp
bnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogICAgICB8ICAgICBefn5+CnVuaXQvdGVz
dC1hdnJjcC5jOiBJbiBmdW5jdGlvbiDigJhtYWlu4oCZOgp1bml0L3Rlc3QtYXZyY3AuYzo5ODk6
NTogbm90ZTogdmFyaWFibGUgdHJhY2tpbmcgc2l6ZSBsaW1pdCBleGNlZWRlZCB3aXRoIOKAmC1m
dmFyLXRyYWNraW5nLWFzc2lnbm1lbnRz4oCZLCByZXRyeWluZyB3aXRob3V0CiAgOTg5IHwgaW50
IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAgICAgfCAgICAgXn5+fgpzcmMvZGV2aWNl
LmM6IEluIGZ1bmN0aW9uIOKAmGRldl9wcm9wZXJ0eV9wcmVmZXJfYmVhcmVyX2V4aXN0c+KAmToK
c3JjL2RldmljZS5jOjM0MjA6Njg6IGVycm9yOiBzdWdnZXN0IHBhcmVudGhlc2VzIGFyb3VuZCDi
gJgmJuKAmSB3aXRoaW4g4oCYfHzigJkgWy1XZXJyb3I9cGFyZW50aGVzZXNdCiAzNDIwIHwgIGlm
ICgoZGV2aWNlLT5icmVkcl9zdGF0ZS5jb25uZWN0ZWQgfHwgZGV2aWNlLT5icmVkcl9zdGF0ZS5i
b25kZWQpICYmCiAgICAgIHwgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fl5+CiAzNDIxIHwgICAgZGV2aWNlLT5sZV9zdGF0
ZS5jb25uZWN0ZWQgfHwgZGV2aWNlLT5sZV9zdGF0ZS5ib25kZWQpCiAgICAgIHwgICAgfn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAKY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKbWFrZVsxXTogKioq
IFtNYWtlZmlsZToxMTEzNzogc3JjL2JsdWV0b290aGQtZGV2aWNlLm9dIEVycm9yIDEKbWFrZTog
KioqIFtNYWtlZmlsZToxMjMyMDogY2hlY2tdIEVycm9yIDIKIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjClRlc3Q6IENoZWNrVmFsZ3JpbmQgLSBGQUlMCkRlc2M6IFJ1biBCbHVleiBNYWtl
IENoZWNrIHdpdGggVmFsZ3JpbmQKT3V0cHV0OgoKdG9vbHMvbWdtdC10ZXN0ZXIuYzogSW4gZnVu
Y3Rpb24g4oCYbWFpbuKAmToKdG9vbHMvbWdtdC10ZXN0ZXIuYzoxMjg5Mzo1OiBub3RlOiB2YXJp
YWJsZSB0cmFja2luZyBzaXplIGxpbWl0IGV4Y2VlZGVkIHdpdGgg4oCYLWZ2YXItdHJhY2tpbmct
YXNzaWdubWVudHPigJksIHJldHJ5aW5nIHdpdGhvdXQKMTI4OTMgfCBpbnQgbWFpbihpbnQgYXJn
YywgY2hhciAqYXJndltdKQogICAgICB8ICAgICBefn5+CnNyYy9kZXZpY2UuYzogSW4gZnVuY3Rp
b24g4oCYZGV2X3Byb3BlcnR5X3ByZWZlcl9iZWFyZXJfZXhpc3Rz4oCZOgpzcmMvZGV2aWNlLmM6
MzQyMDo2ODogZXJyb3I6IHN1Z2dlc3QgcGFyZW50aGVzZXMgYXJvdW5kIOKAmCYm4oCZIHdpdGhp
biDigJh8fOKAmSBbLVdlcnJvcj1wYXJlbnRoZXNlc10KIDM0MjAgfCAgaWYgKChkZXZpY2UtPmJy
ZWRyX3N0YXRlLmNvbm5lY3RlZCB8fCBkZXZpY2UtPmJyZWRyX3N0YXRlLmJvbmRlZCkgJiYKICAg
ICAgfCAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+Xn4KIDM0MjEgfCAgICBkZXZpY2UtPmxlX3N0YXRlLmNvbm5lY3RlZCB8
fCBkZXZpY2UtPmxlX3N0YXRlLmJvbmRlZCkKICAgICAgfCAgICB+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApjYzE6IGFsbCB3
YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwptYWtlWzFdOiAqKiogW01ha2VmaWxlOjEx
MTM3OiBzcmMvYmx1ZXRvb3RoZC1kZXZpY2Uub10gRXJyb3IgMQptYWtlWzFdOiAqKiogV2FpdGlu
ZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgptYWtlOiAqKiogW01ha2VmaWxlOjEyMzIwOiBjaGVj
a10gRXJyb3IgMgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDogQ2hlY2tTbWF0
Y2ggLSBGQUlMCkRlc2M6IFJ1biBzbWF0Y2ggdG9vbCB3aXRoIHNvdXJjZQpPdXRwdXQ6CgpzcmMv
c2hhcmVkL2NyeXB0by5jOjI3MToyMTogd2FybmluZzogVmFyaWFibGUgbGVuZ3RoIGFycmF5IGlz
IHVzZWQuCnNyYy9zaGFyZWQvY3J5cHRvLmM6MjcyOjIzOiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5n
dGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9nYXR0LWhlbHBlcnMuYzo3Njg6MzE6IHdhcm5p
bmc6IFZhcmlhYmxlIGxlbmd0aCBhcnJheSBpcyB1c2VkLgpzcmMvc2hhcmVkL2dhdHQtaGVscGVy
cy5jOjgzMDozMTogd2FybmluZzogVmFyaWFibGUgbGVuZ3RoIGFycmF5IGlzIHVzZWQuCnNyYy9z
aGFyZWQvZ2F0dC1oZWxwZXJzLmM6MTMyMzozMTogd2FybmluZzogVmFyaWFibGUgbGVuZ3RoIGFy
cmF5IGlzIHVzZWQuCnNyYy9zaGFyZWQvZ2F0dC1oZWxwZXJzLmM6MTM1NDoyMzogd2FybmluZzog
VmFyaWFibGUgbGVuZ3RoIGFycmF5IGlzIHVzZWQuCnNyYy9zaGFyZWQvZ2F0dC1zZXJ2ZXIuYzoy
Nzg6MjU6IHdhcm5pbmc6IFZhcmlhYmxlIGxlbmd0aCBhcnJheSBpcyB1c2VkLgpzcmMvc2hhcmVk
L2dhdHQtc2VydmVyLmM6NjE4OjI1OiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMg
dXNlZC4Kc3JjL3NoYXJlZC9nYXR0LXNlcnZlci5jOjcxNjoyNTogd2FybmluZzogVmFyaWFibGUg
bGVuZ3RoIGFycmF5IGlzIHVzZWQuCnNyYy9zaGFyZWQvYmFwLmM6Mjk2OjI1OiB3YXJuaW5nOiBh
cnJheSBvZiBmbGV4aWJsZSBzdHJ1Y3R1cmVzCnNyYy9zaGFyZWQvYmFwLmM6IG5vdGU6IGluIGlu
Y2x1ZGVkIGZpbGU6Ci4vc3JjL3NoYXJlZC9hc2NzLmg6ODg6MjU6IHdhcm5pbmc6IGFycmF5IG9m
IGZsZXhpYmxlIHN0cnVjdHVyZXMKc3JjL3NoYXJlZC9zaGVsbC5jOiBub3RlOiBpbiBpbmNsdWRl
ZCBmaWxlICh0aHJvdWdoIC91c3IvaW5jbHVkZS9yZWFkbGluZS9yZWFkbGluZS5oKToKL3Vzci9p
bmNsdWRlL3JlYWRsaW5lL3JsdHlwZWRlZnMuaDozNToyMzogd2FybmluZzogbm9uLUFOU0kgZnVu
Y3Rpb24gZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ0Z1bmN0aW9uJwovdXNyL2luY2x1ZGUvcmVh
ZGxpbmUvcmx0eXBlZGVmcy5oOjM2OjI1OiB3YXJuaW5nOiBub24tQU5TSSBmdW5jdGlvbiBkZWNs
YXJhdGlvbiBvZiBmdW5jdGlvbiAnVkZ1bmN0aW9uJwovdXNyL2luY2x1ZGUvcmVhZGxpbmUvcmx0
eXBlZGVmcy5oOjM3OjI3OiB3YXJuaW5nOiBub24tQU5TSSBmdW5jdGlvbiBkZWNsYXJhdGlvbiBv
ZiBmdW5jdGlvbiAnQ1BGdW5jdGlvbicKL3Vzci9pbmNsdWRlL3JlYWRsaW5lL3JsdHlwZWRlZnMu
aDozODoyOTogd2FybmluZzogbm9uLUFOU0kgZnVuY3Rpb24gZGVjbGFyYXRpb24gb2YgZnVuY3Rp
b24gJ0NQUEZ1bmN0aW9uJwpzcmMvc2hhcmVkL2NyeXB0by5jOjI3MToyMTogd2FybmluZzogVmFy
aWFibGUgbGVuZ3RoIGFycmF5IGlzIHVzZWQuCnNyYy9zaGFyZWQvY3J5cHRvLmM6MjcyOjIzOiB3
YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9nYXR0LWhl
bHBlcnMuYzo3Njg6MzE6IHdhcm5pbmc6IFZhcmlhYmxlIGxlbmd0aCBhcnJheSBpcyB1c2VkLgpz
cmMvc2hhcmVkL2dhdHQtaGVscGVycy5jOjgzMDozMTogd2FybmluZzogVmFyaWFibGUgbGVuZ3Ro
IGFycmF5IGlzIHVzZWQuCnNyYy9zaGFyZWQvZ2F0dC1oZWxwZXJzLmM6MTMyMzozMTogd2Fybmlu
ZzogVmFyaWFibGUgbGVuZ3RoIGFycmF5IGlzIHVzZWQuCnNyYy9zaGFyZWQvZ2F0dC1oZWxwZXJz
LmM6MTM1NDoyMzogd2FybmluZzogVmFyaWFibGUgbGVuZ3RoIGFycmF5IGlzIHVzZWQuCnNyYy9z
aGFyZWQvZ2F0dC1zZXJ2ZXIuYzoyNzg6MjU6IHdhcm5pbmc6IFZhcmlhYmxlIGxlbmd0aCBhcnJh
eSBpcyB1c2VkLgpzcmMvc2hhcmVkL2dhdHQtc2VydmVyLmM6NjE4OjI1OiB3YXJuaW5nOiBWYXJp
YWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9nYXR0LXNlcnZlci5jOjcxNjoy
NTogd2FybmluZzogVmFyaWFibGUgbGVuZ3RoIGFycmF5IGlzIHVzZWQuCnNyYy9zaGFyZWQvYmFw
LmM6Mjk2OjI1OiB3YXJuaW5nOiBhcnJheSBvZiBmbGV4aWJsZSBzdHJ1Y3R1cmVzCnNyYy9zaGFy
ZWQvYmFwLmM6IG5vdGU6IGluIGluY2x1ZGVkIGZpbGU6Ci4vc3JjL3NoYXJlZC9hc2NzLmg6ODg6
MjU6IHdhcm5pbmc6IGFycmF5IG9mIGZsZXhpYmxlIHN0cnVjdHVyZXMKc3JjL3NoYXJlZC9zaGVs
bC5jOiBub3RlOiBpbiBpbmNsdWRlZCBmaWxlICh0aHJvdWdoIC91c3IvaW5jbHVkZS9yZWFkbGlu
ZS9yZWFkbGluZS5oKToKL3Vzci9pbmNsdWRlL3JlYWRsaW5lL3JsdHlwZWRlZnMuaDozNToyMzog
d2FybmluZzogbm9uLUFOU0kgZnVuY3Rpb24gZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ0Z1bmN0
aW9uJwovdXNyL2luY2x1ZGUvcmVhZGxpbmUvcmx0eXBlZGVmcy5oOjM2OjI1OiB3YXJuaW5nOiBu
b24tQU5TSSBmdW5jdGlvbiBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnVkZ1bmN0aW9uJwovdXNy
L2luY2x1ZGUvcmVhZGxpbmUvcmx0eXBlZGVmcy5oOjM3OjI3OiB3YXJuaW5nOiBub24tQU5TSSBm
dW5jdGlvbiBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnQ1BGdW5jdGlvbicKL3Vzci9pbmNsdWRl
L3JlYWRsaW5lL3JsdHlwZWRlZnMuaDozODoyOTogd2FybmluZzogbm9uLUFOU0kgZnVuY3Rpb24g
ZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ0NQUEZ1bmN0aW9uJwp0b29scy9tZXNoLWNmZ3Rlc3Qu
YzoxNDUzOjE3OiB3YXJuaW5nOiB1bmtub3duIGVzY2FwZSBzZXF1ZW5jZTogJ1wlJwp0b29scy9z
Y28tdGVzdGVyLmM6IG5vdGU6IGluIGluY2x1ZGVkIGZpbGU6Ci4vbGliL2JsdWV0b290aC5oOjIz
MjoxNTogd2FybmluZzogYXJyYXkgb2YgZmxleGlibGUgc3RydWN0dXJlcwouL2xpYi9ibHVldG9v
dGguaDoyMzc6MzE6IHdhcm5pbmc6IGFycmF5IG9mIGZsZXhpYmxlIHN0cnVjdHVyZXMKdG9vbHMv
Ym5lcHRlc3QuYzo2MzQ6Mzk6IHdhcm5pbmc6IHVua25vd24gZXNjYXBlIHNlcXVlbmNlOiAnXCUn
CnRvb2xzL3NlcTJic2VxLmM6NTc6MjY6IHdhcm5pbmc6IFZhcmlhYmxlIGxlbmd0aCBhcnJheSBp
cyB1c2VkLgp0b29scy9vYmV4LWNsaWVudC10b29sLmM6IG5vdGU6IGluIGluY2x1ZGVkIGZpbGUg
KHRocm91Z2ggL3Vzci9pbmNsdWRlL3JlYWRsaW5lL3JlYWRsaW5lLmgpOgovdXNyL2luY2x1ZGUv
cmVhZGxpbmUvcmx0eXBlZGVmcy5oOjM1OjIzOiB3YXJuaW5nOiBub24tQU5TSSBmdW5jdGlvbiBk
ZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnRnVuY3Rpb24nCi91c3IvaW5jbHVkZS9yZWFkbGluZS9y
bHR5cGVkZWZzLmg6MzY6MjU6IHdhcm5pbmc6IG5vbi1BTlNJIGZ1bmN0aW9uIGRlY2xhcmF0aW9u
IG9mIGZ1bmN0aW9uICdWRnVuY3Rpb24nCi91c3IvaW5jbHVkZS9yZWFkbGluZS9ybHR5cGVkZWZz
Lmg6Mzc6Mjc6IHdhcm5pbmc6IG5vbi1BTlNJIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIG9mIGZ1bmN0
aW9uICdDUEZ1bmN0aW9uJwovdXNyL2luY2x1ZGUvcmVhZGxpbmUvcmx0eXBlZGVmcy5oOjM4OjI5
OiB3YXJuaW5nOiBub24tQU5TSSBmdW5jdGlvbiBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnQ1BQ
RnVuY3Rpb24nCmFuZHJvaWQvYXZjdHAuYzo1MDU6MzQ6IHdhcm5pbmc6IFZhcmlhYmxlIGxlbmd0
aCBhcnJheSBpcyB1c2VkLgphbmRyb2lkL2F2Y3RwLmM6NTU2OjM0OiB3YXJuaW5nOiBWYXJpYWJs
ZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4KdW5pdC90ZXN0LWF2cmNwLmM6MzczOjI2OiB3YXJuaW5n
OiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4KdW5pdC90ZXN0LWF2cmNwLmM6Mzk4OjI2
OiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4KdW5pdC90ZXN0LWF2cmNw
LmM6NDE0OjI0OiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4KYW5kcm9p
ZC9hdnJjcC1saWIuYzoxMDg1OjM0OiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMg
dXNlZC4KYW5kcm9pZC9hdnJjcC1saWIuYzoxNTgzOjM0OiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5n
dGggYXJyYXkgaXMgdXNlZC4KYW5kcm9pZC9hdnJjcC1saWIuYzoxNjEyOjM0OiB3YXJuaW5nOiBW
YXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4KYW5kcm9pZC9hdnJjcC1saWIuYzoxNjM4OjM0
OiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL2RldmljZS5jOiBJ
biBmdW5jdGlvbiDigJhkZXZfcHJvcGVydHlfcHJlZmVyX2JlYXJlcl9leGlzdHPigJk6CnNyYy9k
ZXZpY2UuYzozNDIwOjY4OiBlcnJvcjogc3VnZ2VzdCBwYXJlbnRoZXNlcyBhcm91bmQg4oCYJibi
gJkgd2l0aGluIOKAmHx84oCZIFstV2Vycm9yPXBhcmVudGhlc2VzXQogMzQyMCB8ICBpZiAoKGRl
dmljZS0+YnJlZHJfc3RhdGUuY29ubmVjdGVkIHx8IGRldmljZS0+YnJlZHJfc3RhdGUuYm9uZGVk
KSAmJgogICAgICB8ICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5efgogMzQyMSB8ICAgIGRldmljZS0+bGVfc3RhdGUuY29u
bmVjdGVkIHx8IGRldmljZS0+bGVfc3RhdGUuYm9uZGVkKQogICAgICB8ICAgIH5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCmNj
MTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCm1ha2VbMV06ICoqKiBbTWFr
ZWZpbGU6MTExMzc6IHNyYy9ibHVldG9vdGhkLWRldmljZS5vXSBFcnJvciAxCm1ha2VbMV06ICoq
KiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCm1ha2U6ICoqKiBbTWFrZWZpbGU6NDY4
MjogYWxsXSBFcnJvciAyCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBibHVl
em1ha2VleHRlbGwgLSBGQUlMCkRlc2M6IEJ1aWxkIEJsdWV6IHdpdGggRXh0ZXJuYWwgRUxMCk91
dHB1dDoKCnNyYy9kZXZpY2UuYzogSW4gZnVuY3Rpb24g4oCYZGV2X3Byb3BlcnR5X3ByZWZlcl9i
ZWFyZXJfZXhpc3Rz4oCZOgpzcmMvZGV2aWNlLmM6MzQyMDo2ODogZXJyb3I6IHN1Z2dlc3QgcGFy
ZW50aGVzZXMgYXJvdW5kIOKAmCYm4oCZIHdpdGhpbiDigJh8fOKAmSBbLVdlcnJvcj1wYXJlbnRo
ZXNlc10KIDM0MjAgfCAgaWYgKChkZXZpY2UtPmJyZWRyX3N0YXRlLmNvbm5lY3RlZCB8fCBkZXZp
Y2UtPmJyZWRyX3N0YXRlLmJvbmRlZCkgJiYKICAgICAgfCAgICAgIH5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Xn4KIDM0MjEgfCAg
ICBkZXZpY2UtPmxlX3N0YXRlLmNvbm5lY3RlZCB8fCBkZXZpY2UtPmxlX3N0YXRlLmJvbmRlZCkK
ICAgICAgfCAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIApjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVy
cm9ycwptYWtlWzFdOiAqKiogW01ha2VmaWxlOjExMTM3OiBzcmMvYmx1ZXRvb3RoZC1kZXZpY2Uu
b10gRXJyb3IgMQptYWtlWzFdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgpt
YWtlOiAqKiogW01ha2VmaWxlOjQ2ODI6IGFsbF0gRXJyb3IgMgojIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKVGVzdDogSW5jcmVtZW50YWxCdWlsZCAtIFBFTkRJTkcKRGVzYzogSW5jcmVt
ZW50YWwgYnVpbGQgd2l0aCB0aGUgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzCk91dHB1dDoKCgoKLS0t
ClJlZ2FyZHMsCkxpbnV4IEJsdWV0b290aAoK

--===============1491677147602560989==--

