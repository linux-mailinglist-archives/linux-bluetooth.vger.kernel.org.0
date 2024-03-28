Return-Path: <linux-bluetooth+bounces-2495-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6D887B142
	for <lists+linux-bluetooth@lfdr.de>; Wed, 13 Mar 2024 20:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 524441C287AC
	for <lists+linux-bluetooth@lfdr.de>; Wed, 13 Mar 2024 19:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A6B61687;
	Wed, 13 Mar 2024 18:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mx1BT6f+"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6484F42AA7
	for <linux-bluetooth@vger.kernel.org>; Wed, 13 Mar 2024 18:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710354876; cv=none; b=l6usgRZobwcSrqw3+AGv5uFQT40dDqxRX+H35tQ3ozUbiX8yDDL4uw6cdXL4X4UkpWWTqMk6ZtJeccD7yAKBP+6k3uEXLlyN4iT+hR9d3yzKVDZZEAFj9bWCgoTgps3sodizBVeeHhso4eJXafr/T6JAQf/Sr5M/EVKvySqDV3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710354876; c=relaxed/simple;
	bh=0Th/otnXy5z439FZcxARoDmONB0CRVcKd+UGgmVhUuo=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=cAJOarHczOeXMSzs4yk2wS1dyR5vqRdhHXZ8EDH8H5oBcWERJBXK5mooyim00RdMEntFRraINF34qswajCXD6mQ4b/z+43sYd5JB37Bau30N58XZZdJBdzrcHLAKbJEvHnLs8KGfu+73mXN804HG5v+0A9vbuNywr9w70KUajbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mx1BT6f+; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-690de619293so1438806d6.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 13 Mar 2024 11:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710354873; x=1710959673; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0Th/otnXy5z439FZcxARoDmONB0CRVcKd+UGgmVhUuo=;
        b=Mx1BT6f+E88j9YF+HyjsYOpgpflT8XajhIkI4Egq7umInLOFLqt1nCnroxB2tFOCzI
         0LWfIuC3aZKd9bhxiDLZ1eTysePrfoJLduxO8ZU/xRvANDI8Z5Y4oNs3li75DiiiNqX4
         nlaAIbEDAfcEWVag8raRwJErSa79p4eGjHRrSnIHaB4uVoOuY04iTOqIe+3npVEyHskN
         5C2CrtYziuwtGrU5p0aYUcz1gtul+pjYWcJjGwfYXW37LpWR7B6Iqy/TQOBIcSKv6o5V
         RCY6E1HIgJt0AtI2xm33ORCjqSbc2MuWiAC+6oC3sgQr783v3hDHMg8Yo3Sv/WIOIAN9
         CzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710354873; x=1710959673;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Th/otnXy5z439FZcxARoDmONB0CRVcKd+UGgmVhUuo=;
        b=p3c6hBq3yLZ0FWEQ06MibH4oAWBdqUJZudYg5vGu6bCE/PtM2WNMsXLPS0ZG4XJmil
         v4Tjh+R6r/+mmbcw6GEO1cYmEBJ31rJDWildvZTAbCkwWORX2Q/1ulgXLKVKQ5aIYPlZ
         VwyLJLHcHEYo+bDjqyeACLtgOK02O/Fv5malO8H4tsoa+/B23BQf5c3NLmyV2bxwPNQP
         qm1l1d6lL88lxPXF7IcEONqU0nIcX5frAq4Dbj1S364PJgQACgFgUTLcBMbAxdAj0vSW
         7OFt31epOHp9wtXaLb30L4BaLf+v5go8JPKhQ4BAW7YqXTTrnJRy2rC+VTKM5F549l45
         E8fQ==
X-Gm-Message-State: AOJu0YyuhhcthERdTbvEWHoWZFAqi8k+8VIuaXbrOOPlTOLVLaTfjmRz
	2Fc9bNdshWjzUwmvf1prhvK+yGCBdTymzQOjvEIYkxdD4kKBGgmoLLbGlmyF
X-Google-Smtp-Source: AGHT+IGxpR5MlVRBowxvtdqEYsdJQJGxgwU32vUnKcVcwWtnuIydYSQadSFWi9cKR+TjUCNfhQAE9w==
X-Received: by 2002:ad4:4f87:0:b0:690:cec3:c154 with SMTP id em7-20020ad44f87000000b00690cec3c154mr703372qvb.34.1710354873153;
        Wed, 13 Mar 2024 11:34:33 -0700 (PDT)
Received: from [172.17.0.2] ([20.81.46.163])
        by smtp.gmail.com with ESMTPSA id fc11-20020ad44f2b000000b00690cd39da04sm3597282qvb.32.2024.03.13.11.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 11:34:32 -0700 (PDT)
Message-ID: <65f1f1b8.d40a0220.2007d.14f9@mx.google.com>
Date: Wed, 13 Mar 2024 11:34:32 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============6957419283217840124=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [BlueZ,v3,1/4] client/player: Split unicast and broadcast presets
In-Reply-To: <20240313151238.1294526-1-luiz.dentz@gmail.com>
References: <20240313151238.1294526-1-luiz.dentz@gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org

--===============6957419283217840124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

VGhpcyBpcyBhdXRvbWF0ZWQgZW1haWwgYW5kIHBsZWFzZSBkbyBub3QgcmVwbHkgdG8gdGhpcyBl
bWFpbCEKCkRlYXIgc3VibWl0dGVyLAoKVGhhbmsgeW91IGZvciBzdWJtaXR0aW5nIHRoZSBwYXRj
aGVzIHRvIHRoZSBsaW51eCBibHVldG9vdGggbWFpbGluZyBsaXN0LgpUaGlzIGlzIGEgQ0kgdGVz
dCByZXN1bHRzIHdpdGggeW91ciBwYXRjaCBzZXJpZXM6ClBXIExpbms6aHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2JsdWV0b290aC9saXN0Lz9zZXJpZXM9ODM0OTk4CgotLS1U
ZXN0IHJlc3VsdC0tLQoKVGVzdCBTdW1tYXJ5OgpDaGVja1BhdGNoICAgICAgICAgICAgICAgICAg
ICBGQUlMICAgICAgMi42MyBzZWNvbmRzCkdpdExpbnQgICAgICAgICAgICAgICAgICAgICAgIFBB
U1MgICAgICAxLjI0IHNlY29uZHMKQnVpbGRFbGwgICAgICAgICAgICAgICAgICAgICAgUEFTUyAg
ICAgIDI0Ljc3IHNlY29uZHMKQmx1ZXpNYWtlICAgICAgICAgICAgICAgICAgICAgUEFTUyAgICAg
IDE4MTQuMDYgc2Vjb25kcwpNYWtlQ2hlY2sgICAgICAgICAgICAgICAgICAgICBGQUlMICAgICAg
MTEuMDcgc2Vjb25kcwpNYWtlRGlzdGNoZWNrICAgICAgICAgICAgICAgICBGQUlMICAgICAgMzYu
Njkgc2Vjb25kcwpDaGVja1ZhbGdyaW5kICAgICAgICAgICAgICAgICBGQUlMICAgICAgMjQxLjc0
IHNlY29uZHMKQ2hlY2tTbWF0Y2ggICAgICAgICAgICAgICAgICAgUEFTUyAgICAgIDM1NS44NyBz
ZWNvbmRzCmJsdWV6bWFrZWV4dGVsbCAgICAgICAgICAgICAgIFBBU1MgICAgICAxMjIuMjMgc2Vj
b25kcwpJbmNyZW1lbnRhbEJ1aWxkICAgICAgICAgICAgICBQQVNTICAgICAgNjYwOS41OSBzZWNv
bmRzClNjYW5CdWlsZCAgICAgICAgICAgICAgICAgICAgIFBBU1MgICAgICAxMDMzLjYzIHNlY29u
ZHMKCkRldGFpbHMKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjClRlc3Q6IENoZWNrUGF0
Y2ggLSBGQUlMCkRlc2M6IFJ1biBjaGVja3BhdGNoLnBsIHNjcmlwdApPdXRwdXQ6CltCbHVlWix2
MywyLzRdIGNsaWVudC9wbGF5ZXI6IFVzZSBtYWNyb3MgZnJvbSBsYzMuaCB0byBkZWZpbmUgcHJl
c2V0cwpXQVJOSU5HOlJFUEVBVEVEX1dPUkQ6IFBvc3NpYmxlIHJlcGVhdGVkIHdvcmQ6ICdmb3In
CiM5NzogClRoaXMgbWFrZXMgdXNlIG9mIG1hY3JvcyBmb3IgZm9yIGxjMy5oIHRvIGRlZmluZSBw
cmVzZXQgY29uZmlndXJhdGlvbgoKL2dpdGh1Yi93b3Jrc3BhY2Uvc3JjL3NyYy8xMzU5MTUxOC5w
YXRjaCB0b3RhbDogMCBlcnJvcnMsIDEgd2FybmluZ3MsIDM5NyBsaW5lcyBjaGVja2VkCgpOT1RF
OiBGb3Igc29tZSBvZiB0aGUgcmVwb3J0ZWQgZGVmZWN0cywgY2hlY2twYXRjaCBtYXkgYmUgYWJs
ZSB0bwogICAgICBtZWNoYW5pY2FsbHkgY29udmVydCB0byB0aGUgdHlwaWNhbCBzdHlsZSB1c2lu
ZyAtLWZpeCBvciAtLWZpeC1pbnBsYWNlLgoKL2dpdGh1Yi93b3Jrc3BhY2Uvc3JjL3NyYy8xMzU5
MTUxOC5wYXRjaCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuCgpOT1RFOiBJZ25v
cmVkIG1lc3NhZ2UgdHlwZXM6IENPTU1JVF9NRVNTQUdFIENPTVBMRVhfTUFDUk8gQ09OU1RfU1RS
VUNUIEZJTEVfUEFUSF9DSEFOR0VTIE1JU1NJTkdfU0lHTl9PRkYgUFJFRkVSX1BBQ0tFRCBTUERY
X0xJQ0VOU0VfVEFHIFNQTElUX1NUUklORyBTU0NBTkZfVE9fS1NUUlRPCgpOT1RFOiBJZiBhbnkg
b2YgdGhlIGVycm9ycyBhcmUgZmFsc2UgcG9zaXRpdmVzLCBwbGVhc2UgcmVwb3J0CiAgICAgIHRo
ZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZSBDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKCltC
bHVlWix2MywzLzRdIHNoYXJlZC9sYzM6IEFkZCBkZWZpbml0aW9uIGZvciBicm9hZGNhc3QgY29u
ZmlndXJhdGlvbnMKV0FSTklORzpQUkVGRVJfREVGSU5FRF9BVFRSSUJVVEVfTUFDUk86IFByZWZl
ciBfX3BhY2tlZCBvdmVyIF9fYXR0cmlidXRlX18oKHBhY2tlZCkpCiMxMjY6IEZJTEU6IHNyYy9z
aGFyZWQvYmFwLWRlZnMuaDoxNToKKyNkZWZpbmUgX19wYWNrZWQgX19hdHRyaWJ1dGVfXygocGFj
a2VkKSkKCi9naXRodWIvd29ya3NwYWNlL3NyYy9zcmMvMTM1OTE1MTkucGF0Y2ggdG90YWw6IDAg
ZXJyb3JzLCAxIHdhcm5pbmdzLCA4NTMgbGluZXMgY2hlY2tlZAoKTk9URTogRm9yIHNvbWUgb2Yg
dGhlIHJlcG9ydGVkIGRlZmVjdHMsIGNoZWNrcGF0Y2ggbWF5IGJlIGFibGUgdG8KICAgICAgbWVj
aGFuaWNhbGx5IGNvbnZlcnQgdG8gdGhlIHR5cGljYWwgc3R5bGUgdXNpbmcgLS1maXggb3IgLS1m
aXgtaW5wbGFjZS4KCi9naXRodWIvd29ya3NwYWNlL3NyYy9zcmMvMTM1OTE1MTkucGF0Y2ggaGFz
IHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LgoKTk9URTogSWdub3JlZCBtZXNzYWdlIHR5
cGVzOiBDT01NSVRfTUVTU0FHRSBDT01QTEVYX01BQ1JPIENPTlNUX1NUUlVDVCBGSUxFX1BBVEhf
Q0hBTkdFUyBNSVNTSU5HX1NJR05fT0ZGIFBSRUZFUl9QQUNLRUQgU1BEWF9MSUNFTlNFX1RBRyBT
UExJVF9TVFJJTkcgU1NDQU5GX1RPX0tTVFJUTwoKTk9URTogSWYgYW55IG9mIHRoZSBlcnJvcnMg
YXJlIGZhbHNlIHBvc2l0aXZlcywgcGxlYXNlIHJlcG9ydAogICAgICB0aGVtIHRvIHRoZSBtYWlu
dGFpbmVyLCBzZWUgQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCgpbQmx1ZVosdjMsNC80XSBj
bGllbnQvcGxheWVyOiBVc2UgUU9TIG1hY3JvcyBmcm9tIGxjMy5oIHRvIGRlZmluZSBwcmVzZXRz
CldBUk5JTkc6UkVQRUFURURfV09SRDogUG9zc2libGUgcmVwZWF0ZWQgd29yZDogJ2ZvcicKIzk3
OiAKVGhpcyBtYWtlcyB1c2Ugb2YgUU9TIG1hY3JvcyBmb3IgZm9yIGxjMy5oIHRvIGRlZmluZSBw
cmVzZXQKCi9naXRodWIvd29ya3NwYWNlL3NyYy9zcmMvMTM1OTE1MjAucGF0Y2ggdG90YWw6IDAg
ZXJyb3JzLCAxIHdhcm5pbmdzLCA1OTcgbGluZXMgY2hlY2tlZAoKTk9URTogRm9yIHNvbWUgb2Yg
dGhlIHJlcG9ydGVkIGRlZmVjdHMsIGNoZWNrcGF0Y2ggbWF5IGJlIGFibGUgdG8KICAgICAgbWVj
aGFuaWNhbGx5IGNvbnZlcnQgdG8gdGhlIHR5cGljYWwgc3R5bGUgdXNpbmcgLS1maXggb3IgLS1m
aXgtaW5wbGFjZS4KCi9naXRodWIvd29ya3NwYWNlL3NyYy9zcmMvMTM1OTE1MjAucGF0Y2ggaGFz
IHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LgoKTk9URTogSWdub3JlZCBtZXNzYWdlIHR5
cGVzOiBDT01NSVRfTUVTU0FHRSBDT01QTEVYX01BQ1JPIENPTlNUX1NUUlVDVCBGSUxFX1BBVEhf
Q0hBTkdFUyBNSVNTSU5HX1NJR05fT0ZGIFBSRUZFUl9QQUNLRUQgU1BEWF9MSUNFTlNFX1RBRyBT
UExJVF9TVFJJTkcgU1NDQU5GX1RPX0tTVFJUTwoKTk9URTogSWYgYW55IG9mIHRoZSBlcnJvcnMg
YXJlIGZhbHNlIHBvc2l0aXZlcywgcGxlYXNlIHJlcG9ydAogICAgICB0aGVtIHRvIHRoZSBtYWlu
dGFpbmVyLCBzZWUgQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCgojIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKVGVzdDogTWFrZUNoZWNrIC0gRkFJTApEZXNjOiBSdW4gQmx1ZXogTWFr
ZSBDaGVjawpPdXRwdXQ6CgouL3Rlc3QtZHJpdmVyOiBsaW5lIDEwNzogMzE5NDcgQWJvcnRlZCAg
ICAgICAgICAgICAgICAgKGNvcmUgZHVtcGVkKSAiJEAiID4gJGxvZ19maWxlIDI+JjEKbWFrZVsz
XTogKioqIFtNYWtlZmlsZToxMTY0MjogdGVzdC1zdWl0ZS5sb2ddIEVycm9yIDEKbWFrZVsyXTog
KioqIFtNYWtlZmlsZToxMTc1MDogY2hlY2stVEVTVFNdIEVycm9yIDIKbWFrZVsxXTogKioqIFtN
YWtlZmlsZToxMjE3OTogY2hlY2stYW1dIEVycm9yIDIKbWFrZTogKioqIFtNYWtlZmlsZToxMjE4
MTogY2hlY2tdIEVycm9yIDIKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjClRlc3Q6IE1h
a2VEaXN0Y2hlY2sgLSBGQUlMCkRlc2M6IFJ1biBCbHVleiBNYWtlIERpc3RjaGVjawpPdXRwdXQ6
CgpQYWNrYWdlIGN1cHMgd2FzIG5vdCBmb3VuZCBpbiB0aGUgcGtnLWNvbmZpZyBzZWFyY2ggcGF0
aC4KUGVyaGFwcyB5b3Ugc2hvdWxkIGFkZCB0aGUgZGlyZWN0b3J5IGNvbnRhaW5pbmcgYGN1cHMu
cGMnCnRvIHRoZSBQS0dfQ09ORklHX1BBVEggZW52aXJvbm1lbnQgdmFyaWFibGUKTm8gcGFja2Fn
ZSAnY3VwcycgZm91bmQKSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uLy4uL3NyYy9zaGFyZWQvYmFw
LmM6MzA6Ci4uLy4uL3NyYy9zaGFyZWQvYmFwLmg6MTM6MTA6IGZhdGFsIGVycm9yOiBzcmMvc2hh
cmVkL2JhcC1kZWZzLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKICAgMTMgfCAjaW5jbHVk
ZSAic3JjL3NoYXJlZC9iYXAtZGVmcy5oIgogICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+CmNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuCm1ha2VbMl06ICoqKiBbTWFrZWZpbGU6
ODU3MDogc3JjL3NoYXJlZC9saWJzaGFyZWRfbWFpbmxvb3BfbGEtYmFwLmxvXSBFcnJvciAxCm1h
a2VbMl06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCm1ha2VbMV06ICoqKiBb
TWFrZWZpbGU6NDY0NjogYWxsXSBFcnJvciAyCm1ha2U6ICoqKiBbTWFrZWZpbGU6MTIxMDI6IGRp
c3RjaGVja10gRXJyb3IgMQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDogQ2hl
Y2tWYWxncmluZCAtIEZBSUwKRGVzYzogUnVuIEJsdWV6IE1ha2UgQ2hlY2sgd2l0aCBWYWxncmlu
ZApPdXRwdXQ6Cgp0b29scy9tZ210LXRlc3Rlci5jOiBJbiBmdW5jdGlvbiDigJhtYWlu4oCZOgp0
b29scy9tZ210LXRlc3Rlci5jOjEyNzIxOjU6IG5vdGU6IHZhcmlhYmxlIHRyYWNraW5nIHNpemUg
bGltaXQgZXhjZWVkZWQgd2l0aCDigJgtZnZhci10cmFja2luZy1hc3NpZ25tZW50c+KAmSwgcmV0
cnlpbmcgd2l0aG91dAoxMjcyMSB8IGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAg
ICAgIHwgICAgIF5+fn4KLi90ZXN0LWRyaXZlcjogbGluZSAxMDc6IDYyMjM4IEFib3J0ZWQgICAg
ICAgICAgICAgICAgIChjb3JlIGR1bXBlZCkgIiRAIiA+ICRsb2dfZmlsZSAyPiYxCm1ha2VbM106
ICoqKiBbTWFrZWZpbGU6MTE2NDI6IHRlc3Qtc3VpdGUubG9nXSBFcnJvciAxCm1ha2VbMl06ICoq
KiBbTWFrZWZpbGU6MTE3NTA6IGNoZWNrLVRFU1RTXSBFcnJvciAyCm1ha2VbMV06ICoqKiBbTWFr
ZWZpbGU6MTIxNzk6IGNoZWNrLWFtXSBFcnJvciAyCm1ha2U6ICoqKiBbTWFrZWZpbGU6MTIxODE6
IGNoZWNrXSBFcnJvciAyCgoKLS0tClJlZ2FyZHMsCkxpbnV4IEJsdWV0b290aAoK

--===============6957419283217840124==--

