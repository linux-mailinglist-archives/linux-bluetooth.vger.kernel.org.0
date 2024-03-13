Return-Path: <linux-bluetooth+bounces-2494-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA25E87B119
	for <lists+linux-bluetooth@lfdr.de>; Wed, 13 Mar 2024 20:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E22928C842
	for <lists+linux-bluetooth@lfdr.de>; Wed, 13 Mar 2024 19:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88AF760EE8;
	Wed, 13 Mar 2024 18:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JP49rI1I"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137FE60EDB
	for <linux-bluetooth@vger.kernel.org>; Wed, 13 Mar 2024 18:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710354228; cv=none; b=iOPRoXTwncxbOJuWhxh4Q5f04l1VdxEQ/1vMJW2iN3ldssn0L3M/Y2NCgxPF5A1OrVn1WhsWJt+grFu0jOflntbYSorAOg1K//WvAU97rQgSqAIqEXDfK5y77HWa8OfdL9cJyCHez+c+gvo+8iXKOl7g1QQNhNMOG7dpElHqG24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710354228; c=relaxed/simple;
	bh=37CRkb5Dtv7nNESRNUMbNSp7xs5KArnu4uQ0iyXqR2o=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=uU4+BIQw/WUKhd+0ItMJJAguIG31NsR+SjyrOopact7crFcnXL1O6hYwcLQ0le8bdqK91ufGtorn4FMwTanZELSAFabfLEeQ33oFc/02bBaUQ1dc5v/wv2dg1KdY5b4j5t0CUZiQ+UQdb6U0qCjTZWAkoyKEhtgjgkkV+i8hlMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JP49rI1I; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-690d75c73f4so1059406d6.2
        for <linux-bluetooth@vger.kernel.org>; Wed, 13 Mar 2024 11:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710354226; x=1710959026; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=37CRkb5Dtv7nNESRNUMbNSp7xs5KArnu4uQ0iyXqR2o=;
        b=JP49rI1IT3oRD2UEgYjwp4JKaJTb83ZyZNjO0n916m8OtJiwcpIM6rwFl6liX5ZJtk
         nuPhPyS4IyuKcQW6PA/McBg7zMiQ2EvpcxmcI4+I6cPtFd1yLNjSXY3PHpQlTaJ5abJK
         JTH4+QS4OTUsVoV/JGLiy62xnHX620+oSwj0NIlPtjSBtzTiRJB8PcuUWW2pNx0XeO8O
         Thxa/3dlpc5QLQc5dYo93pgZHNqlCQERrFfsG97dzucYhRD/dXnX5nMV7MnbQ2bJ8R1y
         tCdmzxlMXthxxkfACbZThVMnU9rPf3FkbNaH+9sv/lJKh5CCzoxbS5WNwVM5IZm9VjN4
         N2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710354226; x=1710959026;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37CRkb5Dtv7nNESRNUMbNSp7xs5KArnu4uQ0iyXqR2o=;
        b=Y482jp92azpy5EkXfQyS+Hqii7YKJPqv1uXIkVPGYLR61yC/68vL2oJ349YDp3P3ho
         5XAZNw3Fi0iLLixkPkk9c4oQu0ve/9o82NSVaelHsSorPnjPJJKC8urPQtfaBnkDjDVj
         ViGevya4sOvneBWMf8Hand50V3yw8IkLHPJZFFN3cW2bviAtXUbb16XQDNr7OvrWRcUM
         BlKGW8tX2ny8CQPAJCfVsADH0uihL4KbZM7C+WeX8E99Lhg9SYaoXpczp6sDvscq+gIi
         bG3WKZy+of0JzvHJqKcHfErimoVDSCYft3XSLLRf8T5j8Cbz2phCph5np6wZqjf0Ik4k
         EubA==
X-Gm-Message-State: AOJu0Yze2XCcBVBCFQcLDNnONAG00+Ca/m23qZnjyZ6Gp4fhw74YEiaP
	XxsKJiOVKgf9UAkBrsfJIdiljcN/Gh5/0MCqTGJJ08H6ih5JtuNSEFB/e0Ml
X-Google-Smtp-Source: AGHT+IEeCTlY6a60dAK0QAKuEMG+1C7ejIWee8RIgxFDwx3SOU2Q3ANs4QpiAxFP6oS3WR/IHpApww==
X-Received: by 2002:a0c:dc81:0:b0:690:baf4:6109 with SMTP id n1-20020a0cdc81000000b00690baf46109mr814411qvk.23.1710354225711;
        Wed, 13 Mar 2024 11:23:45 -0700 (PDT)
Received: from [172.17.0.2] ([20.97.191.176])
        by smtp.gmail.com with ESMTPSA id p10-20020a0ccb8a000000b0068fba49ae81sm4954089qvk.57.2024.03.13.11.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 11:23:45 -0700 (PDT)
Message-ID: <65f1ef31.0c0a0220.85f68.4098@mx.google.com>
Date: Wed, 13 Mar 2024 11:23:45 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============6389719937958124135=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [BlueZ,v2,1/4] client/player: Split unicast and broadcast presets
In-Reply-To: <20240313150706.1279036-1-luiz.dentz@gmail.com>
References: <20240313150706.1279036-1-luiz.dentz@gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org

--===============6389719937958124135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

VGhpcyBpcyBhdXRvbWF0ZWQgZW1haWwgYW5kIHBsZWFzZSBkbyBub3QgcmVwbHkgdG8gdGhpcyBl
bWFpbCEKCkRlYXIgc3VibWl0dGVyLAoKVGhhbmsgeW91IGZvciBzdWJtaXR0aW5nIHRoZSBwYXRj
aGVzIHRvIHRoZSBsaW51eCBibHVldG9vdGggbWFpbGluZyBsaXN0LgpUaGlzIGlzIGEgQ0kgdGVz
dCByZXN1bHRzIHdpdGggeW91ciBwYXRjaCBzZXJpZXM6ClBXIExpbms6aHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2JsdWV0b290aC9saXN0Lz9zZXJpZXM9ODM0OTk3CgotLS1U
ZXN0IHJlc3VsdC0tLQoKVGVzdCBTdW1tYXJ5OgpDaGVja1BhdGNoICAgICAgICAgICAgICAgICAg
ICBGQUlMICAgICAgMi41MyBzZWNvbmRzCkdpdExpbnQgICAgICAgICAgICAgICAgICAgICAgIFBB
U1MgICAgICAxLjIwIHNlY29uZHMKQnVpbGRFbGwgICAgICAgICAgICAgICAgICAgICAgUEFTUyAg
ICAgIDIzLjkzIHNlY29uZHMKQmx1ZXpNYWtlICAgICAgICAgICAgICAgICAgICAgUEFTUyAgICAg
IDE2NzMuMTQgc2Vjb25kcwpNYWtlQ2hlY2sgICAgICAgICAgICAgICAgICAgICBGQUlMICAgICAg
MTEuMjAgc2Vjb25kcwpNYWtlRGlzdGNoZWNrICAgICAgICAgICAgICAgICBGQUlMICAgICAgMzQu
ODMgc2Vjb25kcwpDaGVja1ZhbGdyaW5kICAgICAgICAgICAgICAgICBGQUlMICAgICAgMjM0LjYy
IHNlY29uZHMKQ2hlY2tTbWF0Y2ggICAgICAgICAgICAgICAgICAgUEFTUyAgICAgIDM0My45NiBz
ZWNvbmRzCmJsdWV6bWFrZWV4dGVsbCAgICAgICAgICAgICAgIFBBU1MgICAgICAxMTcuNjQgc2Vj
b25kcwpJbmNyZW1lbnRhbEJ1aWxkICAgICAgICAgICAgICBQQVNTICAgICAgNjIwMi4xOCBzZWNv
bmRzClNjYW5CdWlsZCAgICAgICAgICAgICAgICAgICAgIFBBU1MgICAgICA5NjMuNjcgc2Vjb25k
cwoKRGV0YWlscwojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDogQ2hlY2tQYXRj
aCAtIEZBSUwKRGVzYzogUnVuIGNoZWNrcGF0Y2gucGwgc2NyaXB0Ck91dHB1dDoKW0JsdWVaLHYy
LDIvNF0gY2xpZW50L3BsYXllcjogVXNlIG1hY3JvcyBmcm9tIGxjMy5oIHRvIGRlZmluZSBwcmVz
ZXRzCldBUk5JTkc6UkVQRUFURURfV09SRDogUG9zc2libGUgcmVwZWF0ZWQgd29yZDogJ2ZvcicK
Izk3OiAKVGhpcyBtYWtlcyB1c2Ugb2YgbWFjcm9zIGZvciBmb3IgbGMzLmggdG8gZGVmaW5lIHBy
ZXNldCBjb25maWd1cmF0aW9uCgovZ2l0aHViL3dvcmtzcGFjZS9zcmMvc3JjLzEzNTkxNTA0LnBh
dGNoIHRvdGFsOiAwIGVycm9ycywgMSB3YXJuaW5ncywgMzk3IGxpbmVzIGNoZWNrZWQKCk5PVEU6
IEZvciBzb21lIG9mIHRoZSByZXBvcnRlZCBkZWZlY3RzLCBjaGVja3BhdGNoIG1heSBiZSBhYmxl
IHRvCiAgICAgIG1lY2hhbmljYWxseSBjb252ZXJ0IHRvIHRoZSB0eXBpY2FsIHN0eWxlIHVzaW5n
IC0tZml4IG9yIC0tZml4LWlucGxhY2UuCgovZ2l0aHViL3dvcmtzcGFjZS9zcmMvc3JjLzEzNTkx
NTA0LnBhdGNoIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4KCk5PVEU6IElnbm9y
ZWQgbWVzc2FnZSB0eXBlczogQ09NTUlUX01FU1NBR0UgQ09NUExFWF9NQUNSTyBDT05TVF9TVFJV
Q1QgRklMRV9QQVRIX0NIQU5HRVMgTUlTU0lOR19TSUdOX09GRiBQUkVGRVJfUEFDS0VEIFNQRFhf
TElDRU5TRV9UQUcgU1BMSVRfU1RSSU5HIFNTQ0FORl9UT19LU1RSVE8KCk5PVEU6IElmIGFueSBv
ZiB0aGUgZXJyb3JzIGFyZSBmYWxzZSBwb3NpdGl2ZXMsIHBsZWFzZSByZXBvcnQKICAgICAgdGhl
bSB0byB0aGUgbWFpbnRhaW5lciwgc2VlIENIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgoKW0Js
dWVaLHYyLDMvNF0gc2hhcmVkL2xjMzogQWRkIGRlZmluaXRpb24gZm9yIGJyb2FkY2FzdCBjb25m
aWd1cmF0aW9ucwpXQVJOSU5HOlBSRUZFUl9ERUZJTkVEX0FUVFJJQlVURV9NQUNSTzogUHJlZmVy
IF9fcGFja2VkIG92ZXIgX19hdHRyaWJ1dGVfXygocGFja2VkKSkKIzEyNjogRklMRTogc3JjL3No
YXJlZC9iYXAtZGVmcy5oOjE1OgorI2RlZmluZSBfX3BhY2tlZCBfX2F0dHJpYnV0ZV9fKChwYWNr
ZWQpKQoKRVJST1I6UE9JTlRFUl9MT0NBVElPTjogImZvbyAqIGJhciIgc2hvdWxkIGJlICJmb28g
KmJhciIKIzUzMjogRklMRTogc3JjL3NoYXJlZC9sYzMuaDo3NjI6CisJCQkJCV9hYyAqIExDM19D
T05GSUdfRlJBTUVfTEVOXzhfMSwgXAoKRVJST1I6UE9JTlRFUl9MT0NBVElPTjogImZvbyAqIGJh
ciIgc2hvdWxkIGJlICJmb28gKmJhciIKIzU0MDogRklMRTogc3JjL3NoYXJlZC9sYzMuaDo3NzA6
CisJCQkJCV9hYyAqIExDM19DT05GSUdfRlJBTUVfTEVOXzhfMSwgXAoKRVJST1I6UE9JTlRFUl9M
T0NBVElPTjogImZvbyAqIGJhciIgc2hvdWxkIGJlICJmb28gKmJhciIKIzU0NjogRklMRTogc3Jj
L3NoYXJlZC9sYzMuaDo3NzY6CisJCQkJCV9hYyAqIExDM19DT05GSUdfRlJBTUVfTEVOXzhfMiwg
XAoKRVJST1I6UE9JTlRFUl9MT0NBVElPTjogImZvbyAqIGJhciIgc2hvdWxkIGJlICJmb28gKmJh
ciIKIzU1NDogRklMRTogc3JjL3NoYXJlZC9sYzMuaDo3ODQ6CisJCQkJCV9hYyAqIExDM19DT05G
SUdfRlJBTUVfTEVOXzhfMiwgXAoKRVJST1I6UE9JTlRFUl9MT0NBVElPTjogImZvbyAqIGJhciIg
c2hvdWxkIGJlICJmb28gKmJhciIKIzU2MDogRklMRTogc3JjL3NoYXJlZC9sYzMuaDo3OTA6CisJ
CQkJCV9hYyAqIExDM19DT05GSUdfRlJBTUVfTEVOXzE2XzEsIFwKCkVSUk9SOlBPSU5URVJfTE9D
QVRJT046ICJmb28gKiBiYXIiIHNob3VsZCBiZSAiZm9vICpiYXIiCiM1Njg6IEZJTEU6IHNyYy9z
aGFyZWQvbGMzLmg6Nzk4OgorCQkJCQlfYWMgKiBMQzNfQ09ORklHX0ZSQU1FX0xFTl8xNl8xLCBc
CgpFUlJPUjpQT0lOVEVSX0xPQ0FUSU9OOiAiZm9vICogYmFyIiBzaG91bGQgYmUgImZvbyAqYmFy
IgojNTc0OiBGSUxFOiBzcmMvc2hhcmVkL2xjMy5oOjgwNDoKKwkJCQkJX2FjICogTEMzX0NPTkZJ
R19GUkFNRV9MRU5fMTZfMiwgXAoKRVJST1I6UE9JTlRFUl9MT0NBVElPTjogImZvbyAqIGJhciIg
c2hvdWxkIGJlICJmb28gKmJhciIKIzU4MjogRklMRTogc3JjL3NoYXJlZC9sYzMuaDo4MTI6CisJ
CQkJCV9hYyAqIExDM19DT05GSUdfRlJBTUVfTEVOXzE2XzIsIFwKCkVSUk9SOlBPSU5URVJfTE9D
QVRJT046ICJmb28gKiBiYXIiIHNob3VsZCBiZSAiZm9vICpiYXIiCiM1ODg6IEZJTEU6IHNyYy9z
aGFyZWQvbGMzLmg6ODE4OgorCQkJCQlfYWMgKiBMQzNfQ09ORklHX0ZSQU1FX0xFTl8yNF8xLCBc
CgpFUlJPUjpQT0lOVEVSX0xPQ0FUSU9OOiAiZm9vICogYmFyIiBzaG91bGQgYmUgImZvbyAqYmFy
IgojNTk2OiBGSUxFOiBzcmMvc2hhcmVkL2xjMy5oOjgyNjoKKwkJCQkJX2FjICogTEMzX0NPTkZJ
R19GUkFNRV9MRU5fMjRfMSwgXAoKRVJST1I6UE9JTlRFUl9MT0NBVElPTjogImZvbyAqIGJhciIg
c2hvdWxkIGJlICJmb28gKmJhciIKIzYwMjogRklMRTogc3JjL3NoYXJlZC9sYzMuaDo4MzI6CisJ
CQkJCV9hYyAqIExDM19DT05GSUdfRlJBTUVfTEVOXzI0XzIsIFwKCkVSUk9SOlBPSU5URVJfTE9D
QVRJT046ICJmb28gKiBiYXIiIHNob3VsZCBiZSAiZm9vICpiYXIiCiM2MTA6IEZJTEU6IHNyYy9z
aGFyZWQvbGMzLmg6ODQwOgorCQkJCQlfYWMgKiBMQzNfQ09ORklHX0ZSQU1FX0xFTl8yNF8yLCBc
CgpFUlJPUjpQT0lOVEVSX0xPQ0FUSU9OOiAiZm9vICogYmFyIiBzaG91bGQgYmUgImZvbyAqYmFy
IgojNjMwOiBGSUxFOiBzcmMvc2hhcmVkL2xjMy5oOjg2MDoKKwkJCQkJX2FjICogTEMzX0NPTkZJ
R19GUkFNRV9MRU5fMzJfMiwgXAoKRVJST1I6UE9JTlRFUl9MT0NBVElPTjogImZvbyAqIGJhciIg
c2hvdWxkIGJlICJmb28gKmJhciIKIzYzODogRklMRTogc3JjL3NoYXJlZC9sYzMuaDo4Njg6CisJ
CQkJCV9hYyAqIExDM19DT05GSUdfRlJBTUVfTEVOXzMyXzIsIFwKCkVSUk9SOlBPSU5URVJfTE9D
QVRJT046ICJmb28gKiBiYXIiIHNob3VsZCBiZSAiZm9vICpiYXIiCiM2NDY6IEZJTEU6IHNyYy9z
aGFyZWQvbGMzLmg6ODc2OgorCQkJCQlfYWMgKiBMQzNfQ09ORklHX0ZSQU1FX0xFTl80NF8xLCBc
CgpFUlJPUjpQT0lOVEVSX0xPQ0FUSU9OOiAiZm9vICogYmFyIiBzaG91bGQgYmUgImZvbyAqYmFy
IgojNjU1OiBGSUxFOiBzcmMvc2hhcmVkL2xjMy5oOjg4NToKKwkJCQkJX2FjICogTEMzX0NPTkZJ
R19GUkFNRV9MRU5fNDRfMSwgXAoKRVJST1I6UE9JTlRFUl9MT0NBVElPTjogImZvbyAqIGJhciIg
c2hvdWxkIGJlICJmb28gKmJhciIKIzY2MzogRklMRTogc3JjL3NoYXJlZC9sYzMuaDo4OTM6CisJ
CQkJCV9hYyAqIExDM19DT05GSUdfRlJBTUVfTEVOXzQ0XzIsIFwKCkVSUk9SOlBPSU5URVJfTE9D
QVRJT046ICJmb28gKiBiYXIiIHNob3VsZCBiZSAiZm9vICpiYXIiCiM2NzI6IEZJTEU6IHNyYy9z
aGFyZWQvbGMzLmg6OTAyOgorCQkJCQlfYWMgKiBMQzNfQ09ORklHX0ZSQU1FX0xFTl80NF8yLCBc
CgpFUlJPUjpQT0lOVEVSX0xPQ0FUSU9OOiAiZm9vICogYmFyIiBzaG91bGQgYmUgImZvbyAqYmFy
IgojNjc5OiBGSUxFOiBzcmMvc2hhcmVkL2xjMy5oOjkwOToKKwkJCQkJX2FjICogTEMzX0NPTkZJ
R19GUkFNRV9MRU5fNDhfMSxcCgpFUlJPUjpQT0lOVEVSX0xPQ0FUSU9OOiAiZm9vICogYmFyIiBz
aG91bGQgYmUgImZvbyAqYmFyIgojNjg3OiBGSUxFOiBzcmMvc2hhcmVkL2xjMy5oOjkxNzoKKwkJ
CQkJX2FjICogTEMzX0NPTkZJR19GUkFNRV9MRU5fNDhfMSwgXAoKRVJST1I6UE9JTlRFUl9MT0NB
VElPTjogImZvbyAqIGJhciIgc2hvdWxkIGJlICJmb28gKmJhciIKIzY5NDogRklMRTogc3JjL3No
YXJlZC9sYzMuaDo5MjQ6CisJCQkJCV9hYyAqIExDM19DT05GSUdfRlJBTUVfTEVOXzQ4XzIsIFwK
CkVSUk9SOlBPSU5URVJfTE9DQVRJT046ICJmb28gKiBiYXIiIHNob3VsZCBiZSAiZm9vICpiYXIi
CiM3MDI6IEZJTEU6IHNyYy9zaGFyZWQvbGMzLmg6OTMyOgorCQkJCQlfYWMgKiBMQzNfQ09ORklH
X0ZSQU1FX0xFTl80OF8yLCBcCgpFUlJPUjpQT0lOVEVSX0xPQ0FUSU9OOiAiZm9vICogYmFyIiBz
aG91bGQgYmUgImZvbyAqYmFyIgojNzA5OiBGSUxFOiBzcmMvc2hhcmVkL2xjMy5oOjkzOToKKwkJ
CQkJX2FjICogTEMzX0NPTkZJR19GUkFNRV9MRU5fNDhfMywgXAoKRVJST1I6UE9JTlRFUl9MT0NB
VElPTjogImZvbyAqIGJhciIgc2hvdWxkIGJlICJmb28gKmJhciIKIzcxNzogRklMRTogc3JjL3No
YXJlZC9sYzMuaDo5NDc6CisJCQkJCV9hYyAqIExDM19DT05GSUdfRlJBTUVfTEVOXzQ4XzMsIFwK
CkVSUk9SOlBPSU5URVJfTE9DQVRJT046ICJmb28gKiBiYXIiIHNob3VsZCBiZSAiZm9vICpiYXIi
CiM3MjQ6IEZJTEU6IHNyYy9zaGFyZWQvbGMzLmg6OTU0OgorCQkJCQlfYWMgKiBMQzNfQ09ORklH
X0ZSQU1FX0xFTl80OF80LCBcCgpFUlJPUjpQT0lOVEVSX0xPQ0FUSU9OOiAiZm9vICogYmFyIiBz
aG91bGQgYmUgImZvbyAqYmFyIgojNzMyOiBGSUxFOiBzcmMvc2hhcmVkL2xjMy5oOjk2MjoKKwkJ
CQkJX2FjICogTEMzX0NPTkZJR19GUkFNRV9MRU5fNDhfNCwgXAoKRVJST1I6UE9JTlRFUl9MT0NB
VElPTjogImZvbyAqIGJhciIgc2hvdWxkIGJlICJmb28gKmJhciIKIzczOTogRklMRTogc3JjL3No
YXJlZC9sYzMuaDo5Njk6CisJCQkJCV9hYyAqIExDM19DT05GSUdfRlJBTUVfTEVOXzQ4XzUsIFwK
CkVSUk9SOlBPSU5URVJfTE9DQVRJT046ICJmb28gKiBiYXIiIHNob3VsZCBiZSAiZm9vICpiYXIi
CiM3NDc6IEZJTEU6IHNyYy9zaGFyZWQvbGMzLmg6OTc3OgorCQkJCQlfYWMgKiBMQzNfQ09ORklH
X0ZSQU1FX0xFTl80OF81LCBcCgpFUlJPUjpQT0lOVEVSX0xPQ0FUSU9OOiAiZm9vICogYmFyIiBz
aG91bGQgYmUgImZvbyAqYmFyIgojNzU0OiBGSUxFOiBzcmMvc2hhcmVkL2xjMy5oOjk4NDoKKwkJ
CQkJX2FjICogTEMzX0NPTkZJR19GUkFNRV9MRU5fNDhfNiwgXAoKRVJST1I6UE9JTlRFUl9MT0NB
VElPTjogImZvbyAqIGJhciIgc2hvdWxkIGJlICJmb28gKmJhciIKIzc2MjogRklMRTogc3JjL3No
YXJlZC9sYzMuaDo5OTI6CisJCQkJCV9hYyAqIExDM19DT05GSUdfRlJBTUVfTEVOXzQ4XzYsIFwK
Ci9naXRodWIvd29ya3NwYWNlL3NyYy9zcmMvMTM1OTE1MDUucGF0Y2ggdG90YWw6IDMwIGVycm9y
cywgMSB3YXJuaW5ncywgNjMzIGxpbmVzIGNoZWNrZWQKCk5PVEU6IEZvciBzb21lIG9mIHRoZSBy
ZXBvcnRlZCBkZWZlY3RzLCBjaGVja3BhdGNoIG1heSBiZSBhYmxlIHRvCiAgICAgIG1lY2hhbmlj
YWxseSBjb252ZXJ0IHRvIHRoZSB0eXBpY2FsIHN0eWxlIHVzaW5nIC0tZml4IG9yIC0tZml4LWlu
cGxhY2UuCgovZ2l0aHViL3dvcmtzcGFjZS9zcmMvc3JjLzEzNTkxNTA1LnBhdGNoIGhhcyBzdHls
ZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4KCk5PVEU6IElnbm9yZWQgbWVzc2FnZSB0eXBlczog
Q09NTUlUX01FU1NBR0UgQ09NUExFWF9NQUNSTyBDT05TVF9TVFJVQ1QgRklMRV9QQVRIX0NIQU5H
RVMgTUlTU0lOR19TSUdOX09GRiBQUkVGRVJfUEFDS0VEIFNQRFhfTElDRU5TRV9UQUcgU1BMSVRf
U1RSSU5HIFNTQ0FORl9UT19LU1RSVE8KCk5PVEU6IElmIGFueSBvZiB0aGUgZXJyb3JzIGFyZSBm
YWxzZSBwb3NpdGl2ZXMsIHBsZWFzZSByZXBvcnQKICAgICAgdGhlbSB0byB0aGUgbWFpbnRhaW5l
ciwgc2VlIENIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgoKW0JsdWVaLHYyLDQvNF0gY2xpZW50
L3BsYXllcjogVXNlIFFPUyBtYWNyb3MgZnJvbSBsYzMuaCB0byBkZWZpbmUgcHJlc2V0cwpXQVJO
SU5HOlJFUEVBVEVEX1dPUkQ6IFBvc3NpYmxlIHJlcGVhdGVkIHdvcmQ6ICdmb3InCiM5NzogClRo
aXMgbWFrZXMgdXNlIG9mIFFPUyBtYWNyb3MgZm9yIGZvciBsYzMuaCB0byBkZWZpbmUgcHJlc2V0
CgovZ2l0aHViL3dvcmtzcGFjZS9zcmMvc3JjLzEzNTkxNTA2LnBhdGNoIHRvdGFsOiAwIGVycm9y
cywgMSB3YXJuaW5ncywgNTk3IGxpbmVzIGNoZWNrZWQKCk5PVEU6IEZvciBzb21lIG9mIHRoZSBy
ZXBvcnRlZCBkZWZlY3RzLCBjaGVja3BhdGNoIG1heSBiZSBhYmxlIHRvCiAgICAgIG1lY2hhbmlj
YWxseSBjb252ZXJ0IHRvIHRoZSB0eXBpY2FsIHN0eWxlIHVzaW5nIC0tZml4IG9yIC0tZml4LWlu
cGxhY2UuCgovZ2l0aHViL3dvcmtzcGFjZS9zcmMvc3JjLzEzNTkxNTA2LnBhdGNoIGhhcyBzdHls
ZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4KCk5PVEU6IElnbm9yZWQgbWVzc2FnZSB0eXBlczog
Q09NTUlUX01FU1NBR0UgQ09NUExFWF9NQUNSTyBDT05TVF9TVFJVQ1QgRklMRV9QQVRIX0NIQU5H
RVMgTUlTU0lOR19TSUdOX09GRiBQUkVGRVJfUEFDS0VEIFNQRFhfTElDRU5TRV9UQUcgU1BMSVRf
U1RSSU5HIFNTQ0FORl9UT19LU1RSVE8KCk5PVEU6IElmIGFueSBvZiB0aGUgZXJyb3JzIGFyZSBm
YWxzZSBwb3NpdGl2ZXMsIHBsZWFzZSByZXBvcnQKICAgICAgdGhlbSB0byB0aGUgbWFpbnRhaW5l
ciwgc2VlIENIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgoKIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjClRlc3Q6IE1ha2VDaGVjayAtIEZBSUwKRGVzYzogUnVuIEJsdWV6IE1ha2UgQ2hl
Y2sKT3V0cHV0OgoKLi90ZXN0LWRyaXZlcjogbGluZSAxMDc6IDMxOTQ3IEFib3J0ZWQgICAgICAg
ICAgICAgICAgIChjb3JlIGR1bXBlZCkgIiRAIiA+ICRsb2dfZmlsZSAyPiYxCm1ha2VbM106ICoq
KiBbTWFrZWZpbGU6MTE2NDI6IHRlc3Qtc3VpdGUubG9nXSBFcnJvciAxCm1ha2VbMl06ICoqKiBb
TWFrZWZpbGU6MTE3NTA6IGNoZWNrLVRFU1RTXSBFcnJvciAyCm1ha2VbMV06ICoqKiBbTWFrZWZp
bGU6MTIxNzk6IGNoZWNrLWFtXSBFcnJvciAyCm1ha2U6ICoqKiBbTWFrZWZpbGU6MTIxODE6IGNo
ZWNrXSBFcnJvciAyCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBNYWtlRGlz
dGNoZWNrIC0gRkFJTApEZXNjOiBSdW4gQmx1ZXogTWFrZSBEaXN0Y2hlY2sKT3V0cHV0OgoKUGFj
a2FnZSBjdXBzIHdhcyBub3QgZm91bmQgaW4gdGhlIHBrZy1jb25maWcgc2VhcmNoIHBhdGguClBl
cmhhcHMgeW91IHNob3VsZCBhZGQgdGhlIGRpcmVjdG9yeSBjb250YWluaW5nIGBjdXBzLnBjJwp0
byB0aGUgUEtHX0NPTkZJR19QQVRIIGVudmlyb25tZW50IHZhcmlhYmxlCk5vIHBhY2thZ2UgJ2N1
cHMnIGZvdW5kCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi8uLi9zcmMvc2hhcmVkL2JhcC5jOjMw
OgouLi8uLi9zcmMvc2hhcmVkL2JhcC5oOjEzOjEwOiBmYXRhbCBlcnJvcjogc3JjL3NoYXJlZC9i
YXAtZGVmcy5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CiAgIDEzIHwgI2luY2x1ZGUgInNy
Yy9zaGFyZWQvYmFwLWRlZnMuaCIKICAgICAgfCAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgpjb21waWxhdGlvbiB0ZXJtaW5hdGVkLgptYWtlWzJdOiAqKiogW01ha2VmaWxlOjg1NzA6
IHNyYy9zaGFyZWQvbGlic2hhcmVkX21haW5sb29wX2xhLWJhcC5sb10gRXJyb3IgMQptYWtlWzJd
OiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgptYWtlWzFdOiAqKiogW01ha2Vm
aWxlOjQ2NDY6IGFsbF0gRXJyb3IgMgptYWtlOiAqKiogW01ha2VmaWxlOjEyMTAyOiBkaXN0Y2hl
Y2tdIEVycm9yIDEKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjClRlc3Q6IENoZWNrVmFs
Z3JpbmQgLSBGQUlMCkRlc2M6IFJ1biBCbHVleiBNYWtlIENoZWNrIHdpdGggVmFsZ3JpbmQKT3V0
cHV0OgoKdG9vbHMvbWdtdC10ZXN0ZXIuYzogSW4gZnVuY3Rpb24g4oCYbWFpbuKAmToKdG9vbHMv
bWdtdC10ZXN0ZXIuYzoxMjcyMTo1OiBub3RlOiB2YXJpYWJsZSB0cmFja2luZyBzaXplIGxpbWl0
IGV4Y2VlZGVkIHdpdGgg4oCYLWZ2YXItdHJhY2tpbmctYXNzaWdubWVudHPigJksIHJldHJ5aW5n
IHdpdGhvdXQKMTI3MjEgfCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogICAgICB8
ICAgICBefn5+Ci4vdGVzdC1kcml2ZXI6IGxpbmUgMTA3OiA2MjIzOCBBYm9ydGVkICAgICAgICAg
ICAgICAgICAoY29yZSBkdW1wZWQpICIkQCIgPiAkbG9nX2ZpbGUgMj4mMQptYWtlWzNdOiAqKiog
W01ha2VmaWxlOjExNjQyOiB0ZXN0LXN1aXRlLmxvZ10gRXJyb3IgMQptYWtlWzJdOiAqKiogW01h
a2VmaWxlOjExNzUwOiBjaGVjay1URVNUU10gRXJyb3IgMgptYWtlWzFdOiAqKiogW01ha2VmaWxl
OjEyMTc5OiBjaGVjay1hbV0gRXJyb3IgMgptYWtlOiAqKiogW01ha2VmaWxlOjEyMTgxOiBjaGVj
a10gRXJyb3IgMgoKCi0tLQpSZWdhcmRzLApMaW51eCBCbHVldG9vdGgKCg==

--===============6389719937958124135==--

