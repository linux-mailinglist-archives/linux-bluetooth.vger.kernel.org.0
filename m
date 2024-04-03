Return-Path: <linux-bluetooth+bounces-3180-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B34897A40
	for <lists+linux-bluetooth@lfdr.de>; Wed,  3 Apr 2024 22:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C3D9280DD0
	for <lists+linux-bluetooth@lfdr.de>; Wed,  3 Apr 2024 20:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745A2156231;
	Wed,  3 Apr 2024 20:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izt6vQNz"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B2B14C5B3
	for <linux-bluetooth@vger.kernel.org>; Wed,  3 Apr 2024 20:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712177303; cv=none; b=GsLjQfG0xQBnRjL3M9wo9nHqf3KHvOR18Qi+rK2VgJx8ptnNhRGVkwuS5rBVgWDVKabwfUJQ5MkLvV0BjnMQTzg7hK3gqEY40r3H4IJ4asCQZieystBP63jNHevzUlw9uNB/lYPjVk/TokoE6uxbdV6xPAIMkVmr+nTesJwZeNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712177303; c=relaxed/simple;
	bh=uJ9ZpxuAySI8LIqmd8d0cdEW93M9TrJibYnpDZpUzIc=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=BDpx3cyCI2g6G6HWYqKwvIHOWIhju7sS44VC4HGMuG9803qZQ/QEgx2QXdsPcjpotZN9KiYp3A9Ld1Clu734TNAw6QZDJJavpm6BSzutGSxvR8zbZ2bsHYBFRJOp42Kc0xZsIn3ztfye7dUZSGqdghG5UYRBaUl2/tgd7hy33Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izt6vQNz; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-430a65e973bso1424671cf.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 03 Apr 2024 13:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712177300; x=1712782100; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uJ9ZpxuAySI8LIqmd8d0cdEW93M9TrJibYnpDZpUzIc=;
        b=izt6vQNz3TZ0llOhNET0ZZuPs+Zp1MZd4rWnoV/jERQjnitARCnbh5e9k3aWjHXZRZ
         WIbxS6m+mTP67AzeMyH536hE0i8XJJjrTWwFT8ajvvUvz/ino4rD3yDCA+T8Pvx5Zhx8
         WXzxSO2e4ALJ1CV+K45a/4wjcAr8nAPcLxL83KkAAcsGGX6bW3bejVvezrUG34C/eb4g
         dRAGd8tBXUHk7vnsqsNshuACCQmtatH4jXG7j1VuagmNMHh1tm4Xmch8IAo2Mt+hyrrD
         MsHGqnPga8nId7iqCqKJsMQ5H9NI8YNKCuPE3G4Dyr3T2wOnRHSepzdS/9XU/BFFXqvA
         6Xnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712177300; x=1712782100;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJ9ZpxuAySI8LIqmd8d0cdEW93M9TrJibYnpDZpUzIc=;
        b=TLH8ZQgqCUVJMNoeUiJKUTkNWR5yWdtpwY7wBNONMt+0xJMtk7DO0WnqEPIHRmbcM8
         SjUJ6j+cF/5cmCHDpZqeW6qgsOrFYkUq9G9taQKGmGvEfJxe6machAgG4RzeHo+4m+6V
         TrXH5XuZFquGEQDzcLaiipQdVd9liqjLTV9psbTktCVD30MEu8UKnv/1ZCwIGZKQ71oE
         AazYHFPxEBce8BiKPLH68iou5uVjx268leJkIxITZFM7K9UWyNOXB8hh/RltH/YdRyqf
         PsNNW6M0pIeUCcxURNwzfYskFLNjCGyX1vSd1uweUSLjNkYJmul2X1GjLy5aCtMFEzpB
         /aDA==
X-Gm-Message-State: AOJu0YzjQOJxhqHdln/YO6C+MDF2/nB8WsgJhtf8dXeH6Rvun14MSlot
	yvVgvhRGob7fnT+BdJ/Zu9QSXu+quRnvACgfaW86XO4upQqth25s+3RCctug
X-Google-Smtp-Source: AGHT+IGvh87g0iveS6Tm+IdVIHuTi4wSAl20w3XoQoeKY5QwCQIAXH4oN5dG4fWs3jE0N//f9Ut8Cg==
X-Received: by 2002:a05:622a:390:b0:432:e8ef:7ffe with SMTP id j16-20020a05622a039000b00432e8ef7ffemr490061qtx.36.1712177300585;
        Wed, 03 Apr 2024 13:48:20 -0700 (PDT)
Received: from [172.17.0.2] ([172.183.131.240])
        by smtp.gmail.com with ESMTPSA id ev3-20020a05622a510300b00430ce167becsm6945148qtb.1.2024.04.03.13.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 13:48:20 -0700 (PDT)
Message-ID: <660dc094.050a0220.919de.490b@mx.google.com>
Date: Wed, 03 Apr 2024 13:48:20 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============5618661350018046318=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, pav@iki.fi
Subject: RE: tests: add TX timestamping tests
In-Reply-To: <231de55e44e48272c02dac8ee735af9316ec46e0.1712168788.git.pav@iki.fi>
References: <231de55e44e48272c02dac8ee735af9316ec46e0.1712168788.git.pav@iki.fi>
Reply-To: linux-bluetooth@vger.kernel.org

--===============5618661350018046318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

VGhpcyBpcyBhdXRvbWF0ZWQgZW1haWwgYW5kIHBsZWFzZSBkbyBub3QgcmVwbHkgdG8gdGhpcyBl
bWFpbCEKCkRlYXIgc3VibWl0dGVyLAoKVGhhbmsgeW91IGZvciBzdWJtaXR0aW5nIHRoZSBwYXRj
aGVzIHRvIHRoZSBsaW51eCBibHVldG9vdGggbWFpbGluZyBsaXN0LgpUaGlzIGlzIGEgQ0kgdGVz
dCByZXN1bHRzIHdpdGggeW91ciBwYXRjaCBzZXJpZXM6ClBXIExpbms6aHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2JsdWV0b290aC9saXN0Lz9zZXJpZXM9ODQxMTkzCgotLS1U
ZXN0IHJlc3VsdC0tLQoKVGVzdCBTdW1tYXJ5OgpDaGVja1BhdGNoICAgICAgICAgICAgICAgICAg
ICBQQVNTICAgICAgMy44MCBzZWNvbmRzCkdpdExpbnQgICAgICAgICAgICAgICAgICAgICAgIFBB
U1MgICAgICAyLjE1IHNlY29uZHMKQnVpbGRFbGwgICAgICAgICAgICAgICAgICAgICAgUEFTUyAg
ICAgIDI0Ljk3IHNlY29uZHMKQmx1ZXpNYWtlICAgICAgICAgICAgICAgICAgICAgRkFJTCAgICAg
IDUyLjI2IHNlY29uZHMKTWFrZUNoZWNrICAgICAgICAgICAgICAgICAgICAgRkFJTCAgICAgIDE1
My42OCBzZWNvbmRzCk1ha2VEaXN0Y2hlY2sgICAgICAgICAgICAgICAgIFBBU1MgICAgICAxODAu
ODcgc2Vjb25kcwpDaGVja1ZhbGdyaW5kICAgICAgICAgICAgICAgICBGQUlMICAgICAgNDQuMDUg
c2Vjb25kcwpDaGVja1NtYXRjaCAgICAgICAgICAgICAgICAgICBGQUlMICAgICAgOTcuMzQgc2Vj
b25kcwpibHVlem1ha2VleHRlbGwgICAgICAgICAgICAgICBGQUlMICAgICAgMjUuMDYgc2Vjb25k
cwpJbmNyZW1lbnRhbEJ1aWxkICAgICAgICAgICAgICBGQUlMICAgICAgNjY0Ni43OSBzZWNvbmRz
ClNjYW5CdWlsZCAgICAgICAgICAgICAgICAgICAgIEZBSUwgICAgICA2MDMuMTYgc2Vjb25kcwoK
RGV0YWlscwojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDogQmx1ZXpNYWtlIC0g
RkFJTApEZXNjOiBCdWlsZCBCbHVlWgpPdXRwdXQ6Cgp0b29scy9zY28tdGVzdGVyLmM6IEluIGZ1
bmN0aW9uIOKAmHNjb19jb25uZWN0X2Ni4oCZOgp0b29scy9zY28tdGVzdGVyLmM6NzEzOjQ6IGVy
cm9yOiDigJhyZXTigJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9u
IFstV2Vycm9yPW1heWJlLXVuaW5pdGlhbGl6ZWRdCiAgNzEzIHwgICAgdGVzdGVyX3dhcm4oIkZh
aWxlZCB0byB3cml0ZSAldSBieXRlczogJXp1ICVzICglZCkiLAogICAgICB8ICAgIF5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KICA3MTQgfCAgICAg
IHNjb2RhdGEtPmRhdGFfbGVuLCByZXQsIHN0cmVycm9yKGVycm5vKSwKICAgICAgfCAgICAgIH5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KICA3MTUgfCAgICAgIGVycm5v
KTsKICAgICAgfCAgICAgIH5+fn5+fgpjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFz
IGVycm9ycwptYWtlWzFdOiAqKiogW01ha2VmaWxlOjc4MDc6IHRvb2xzL3Njby10ZXN0ZXIub10g
RXJyb3IgMQptYWtlWzFdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgp0b29s
cy9tZ210LXRlc3Rlci5jOiBJbiBmdW5jdGlvbiDigJhtYWlu4oCZOgp0b29scy9tZ210LXRlc3Rl
ci5jOjEyNzIxOjU6IG5vdGU6IHZhcmlhYmxlIHRyYWNraW5nIHNpemUgbGltaXQgZXhjZWVkZWQg
d2l0aCDigJgtZnZhci10cmFja2luZy1hc3NpZ25tZW50c+KAmSwgcmV0cnlpbmcgd2l0aG91dAox
MjcyMSB8IGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAgICAgIHwgICAgIF5+fn4K
bWFrZTogKioqIFtNYWtlZmlsZTo0NjQ5OiBhbGxdIEVycm9yIDIKIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjClRlc3Q6IE1ha2VDaGVjayAtIEZBSUwKRGVzYzogUnVuIEJsdWV6IE1ha2Ug
Q2hlY2sKT3V0cHV0OgoKdG9vbHMvc2NvLXRlc3Rlci5jOiBJbiBmdW5jdGlvbiDigJhzY29fY29u
bmVjdF9jYuKAmToKdG9vbHMvc2NvLXRlc3Rlci5jOjcxMzo0OiBlcnJvcjog4oCYcmV04oCZIG1h
eSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlvbiBbLVdlcnJvcj1tYXliZS11
bmluaXRpYWxpemVkXQogIDcxMyB8ICAgIHRlc3Rlcl93YXJuKCJGYWlsZWQgdG8gd3JpdGUgJXUg
Ynl0ZXM6ICV6dSAlcyAoJWQpIiwKICAgICAgfCAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CiAgNzE0IHwgICAgICBzY29kYXRhLT5kYXRhX2xl
biwgcmV0LCBzdHJlcnJvcihlcnJubyksCiAgICAgIHwgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+CiAgNzE1IHwgICAgICBlcnJubyk7CiAgICAgIHwgICAgICB+
fn5+fn4KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKbWFrZVsxXTog
KioqIFtNYWtlZmlsZTo3ODA3OiB0b29scy9zY28tdGVzdGVyLm9dIEVycm9yIDEKbWFrZTogKioq
IFtNYWtlZmlsZToxMjE4NDogY2hlY2tdIEVycm9yIDIKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjClRlc3Q6IENoZWNrVmFsZ3JpbmQgLSBGQUlMCkRlc2M6IFJ1biBCbHVleiBNYWtlIENo
ZWNrIHdpdGggVmFsZ3JpbmQKT3V0cHV0OgoKdG9vbHMvc2NvLXRlc3Rlci5jOiBJbiBmdW5jdGlv
biDigJhzY29fY29ubmVjdF9jYuKAmToKdG9vbHMvc2NvLXRlc3Rlci5jOjcxMzo0OiBlcnJvcjog
4oCYcmV04oCZIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlvbiBbLVdl
cnJvcj1tYXliZS11bmluaXRpYWxpemVkXQogIDcxMyB8ICAgIHRlc3Rlcl93YXJuKCJGYWlsZWQg
dG8gd3JpdGUgJXUgYnl0ZXM6ICV6dSAlcyAoJWQpIiwKICAgICAgfCAgICBefn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CiAgNzE0IHwgICAgICBzY29k
YXRhLT5kYXRhX2xlbiwgcmV0LCBzdHJlcnJvcihlcnJubyksCiAgICAgIHwgICAgICB+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CiAgNzE1IHwgICAgICBlcnJubyk7CiAg
ICAgIHwgICAgICB+fn5+fn4KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJv
cnMKbWFrZVsxXTogKioqIFtNYWtlZmlsZTo3ODA3OiB0b29scy9zY28tdGVzdGVyLm9dIEVycm9y
IDEKbWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KdG9vbHMvbWdt
dC10ZXN0ZXIuYzogSW4gZnVuY3Rpb24g4oCYbWFpbuKAmToKdG9vbHMvbWdtdC10ZXN0ZXIuYzox
MjcyMTo1OiBub3RlOiB2YXJpYWJsZSB0cmFja2luZyBzaXplIGxpbWl0IGV4Y2VlZGVkIHdpdGgg
4oCYLWZ2YXItdHJhY2tpbmctYXNzaWdubWVudHPigJksIHJldHJ5aW5nIHdpdGhvdXQKMTI3MjEg
fCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogICAgICB8ICAgICBefn5+Cm1ha2U6
ICoqKiBbTWFrZWZpbGU6MTIxODQ6IGNoZWNrXSBFcnJvciAyCiMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwpUZXN0OiBDaGVja1NtYXRjaCAtIEZBSUwKRGVzYzogUnVuIHNtYXRjaCB0b29s
IHdpdGggc291cmNlCk91dHB1dDoKCnNyYy9zaGFyZWQvY3J5cHRvLmM6MjcxOjIxOiB3YXJuaW5n
OiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9jcnlwdG8uYzoyNzI6
MjM6IHdhcm5pbmc6IFZhcmlhYmxlIGxlbmd0aCBhcnJheSBpcyB1c2VkLgpzcmMvc2hhcmVkL2dh
dHQtaGVscGVycy5jOjc2ODozMTogd2FybmluZzogVmFyaWFibGUgbGVuZ3RoIGFycmF5IGlzIHVz
ZWQuCnNyYy9zaGFyZWQvZ2F0dC1oZWxwZXJzLmM6ODMwOjMxOiB3YXJuaW5nOiBWYXJpYWJsZSBs
ZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9nYXR0LWhlbHBlcnMuYzoxMzIzOjMxOiB3
YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9nYXR0LWhl
bHBlcnMuYzoxMzU0OjIzOiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4K
c3JjL3NoYXJlZC9nYXR0LXNlcnZlci5jOjI3ODoyNTogd2FybmluZzogVmFyaWFibGUgbGVuZ3Ro
IGFycmF5IGlzIHVzZWQuCnNyYy9zaGFyZWQvZ2F0dC1zZXJ2ZXIuYzo2MjE6MjU6IHdhcm5pbmc6
IFZhcmlhYmxlIGxlbmd0aCBhcnJheSBpcyB1c2VkLgpzcmMvc2hhcmVkL2dhdHQtc2VydmVyLmM6
NzIwOjI1OiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJl
ZC9iYXAuYzoyODI6MjU6IHdhcm5pbmc6IGFycmF5IG9mIGZsZXhpYmxlIHN0cnVjdHVyZXMKc3Jj
L3NoYXJlZC9iYXAuYzogbm90ZTogaW4gaW5jbHVkZWQgZmlsZToKLi9zcmMvc2hhcmVkL2FzY3Mu
aDo4ODoyNTogd2FybmluZzogYXJyYXkgb2YgZmxleGlibGUgc3RydWN0dXJlcwpzcmMvc2hhcmVk
L3NoZWxsLmM6IG5vdGU6IGluIGluY2x1ZGVkIGZpbGUgKHRocm91Z2ggL3Vzci9pbmNsdWRlL3Jl
YWRsaW5lL3JlYWRsaW5lLmgpOgovdXNyL2luY2x1ZGUvcmVhZGxpbmUvcmx0eXBlZGVmcy5oOjM1
OjIzOiB3YXJuaW5nOiBub24tQU5TSSBmdW5jdGlvbiBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAn
RnVuY3Rpb24nCi91c3IvaW5jbHVkZS9yZWFkbGluZS9ybHR5cGVkZWZzLmg6MzY6MjU6IHdhcm5p
bmc6IG5vbi1BTlNJIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdWRnVuY3Rpb24n
Ci91c3IvaW5jbHVkZS9yZWFkbGluZS9ybHR5cGVkZWZzLmg6Mzc6Mjc6IHdhcm5pbmc6IG5vbi1B
TlNJIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdDUEZ1bmN0aW9uJwovdXNyL2lu
Y2x1ZGUvcmVhZGxpbmUvcmx0eXBlZGVmcy5oOjM4OjI5OiB3YXJuaW5nOiBub24tQU5TSSBmdW5j
dGlvbiBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnQ1BQRnVuY3Rpb24nCnNyYy9zaGFyZWQvY3J5
cHRvLmM6MjcxOjIxOiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3Jj
L3NoYXJlZC9jcnlwdG8uYzoyNzI6MjM6IHdhcm5pbmc6IFZhcmlhYmxlIGxlbmd0aCBhcnJheSBp
cyB1c2VkLgpzcmMvc2hhcmVkL2dhdHQtaGVscGVycy5jOjc2ODozMTogd2FybmluZzogVmFyaWFi
bGUgbGVuZ3RoIGFycmF5IGlzIHVzZWQuCnNyYy9zaGFyZWQvZ2F0dC1oZWxwZXJzLmM6ODMwOjMx
OiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9nYXR0
LWhlbHBlcnMuYzoxMzIzOjMxOiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNl
ZC4Kc3JjL3NoYXJlZC9nYXR0LWhlbHBlcnMuYzoxMzU0OjIzOiB3YXJuaW5nOiBWYXJpYWJsZSBs
ZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9nYXR0LXNlcnZlci5jOjI3ODoyNTogd2Fy
bmluZzogVmFyaWFibGUgbGVuZ3RoIGFycmF5IGlzIHVzZWQuCnNyYy9zaGFyZWQvZ2F0dC1zZXJ2
ZXIuYzo2MjE6MjU6IHdhcm5pbmc6IFZhcmlhYmxlIGxlbmd0aCBhcnJheSBpcyB1c2VkLgpzcmMv
c2hhcmVkL2dhdHQtc2VydmVyLmM6NzIwOjI1OiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJy
YXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9iYXAuYzoyODI6MjU6IHdhcm5pbmc6IGFycmF5IG9mIGZs
ZXhpYmxlIHN0cnVjdHVyZXMKc3JjL3NoYXJlZC9iYXAuYzogbm90ZTogaW4gaW5jbHVkZWQgZmls
ZToKLi9zcmMvc2hhcmVkL2FzY3MuaDo4ODoyNTogd2FybmluZzogYXJyYXkgb2YgZmxleGlibGUg
c3RydWN0dXJlcwpzcmMvc2hhcmVkL3NoZWxsLmM6IG5vdGU6IGluIGluY2x1ZGVkIGZpbGUgKHRo
cm91Z2ggL3Vzci9pbmNsdWRlL3JlYWRsaW5lL3JlYWRsaW5lLmgpOgovdXNyL2luY2x1ZGUvcmVh
ZGxpbmUvcmx0eXBlZGVmcy5oOjM1OjIzOiB3YXJuaW5nOiBub24tQU5TSSBmdW5jdGlvbiBkZWNs
YXJhdGlvbiBvZiBmdW5jdGlvbiAnRnVuY3Rpb24nCi91c3IvaW5jbHVkZS9yZWFkbGluZS9ybHR5
cGVkZWZzLmg6MzY6MjU6IHdhcm5pbmc6IG5vbi1BTlNJIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIG9m
IGZ1bmN0aW9uICdWRnVuY3Rpb24nCi91c3IvaW5jbHVkZS9yZWFkbGluZS9ybHR5cGVkZWZzLmg6
Mzc6Mjc6IHdhcm5pbmc6IG5vbi1BTlNJIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9u
ICdDUEZ1bmN0aW9uJwovdXNyL2luY2x1ZGUvcmVhZGxpbmUvcmx0eXBlZGVmcy5oOjM4OjI5OiB3
YXJuaW5nOiBub24tQU5TSSBmdW5jdGlvbiBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnQ1BQRnVu
Y3Rpb24nCnRvb2xzL21lc2gtY2ZndGVzdC5jOjE0NTM6MTc6IHdhcm5pbmc6IHVua25vd24gZXNj
YXBlIHNlcXVlbmNlOiAnXCUnCnRvb2xzL3Njby10ZXN0ZXIuYzogbm90ZTogaW4gaW5jbHVkZWQg
ZmlsZToKLi9saWIvYmx1ZXRvb3RoLmg6MjE5OjE1OiB3YXJuaW5nOiBhcnJheSBvZiBmbGV4aWJs
ZSBzdHJ1Y3R1cmVzCi4vbGliL2JsdWV0b290aC5oOjIyNDozMTogd2FybmluZzogYXJyYXkgb2Yg
ZmxleGlibGUgc3RydWN0dXJlcwp0b29scy9zY28tdGVzdGVyLmM6IEluIGZ1bmN0aW9uIOKAmHNj
b19jb25uZWN0X2Ni4oCZOgp0b29scy9zY28tdGVzdGVyLmM6NzEyOjY6IGVycm9yOiDigJhyZXTi
gJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uIFstV2Vycm9yPW1h
eWJlLXVuaW5pdGlhbGl6ZWRdCiAgNzEyIHwgICBpZiAoc2NvZGF0YS0+ZGF0YV9sZW4gIT0gcmV0
KSB7CiAgICAgIHwgICAgICBeCmNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJy
b3JzCm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6NzgwNzogdG9vbHMvc2NvLXRlc3Rlci5vXSBFcnJv
ciAxCm1ha2VbMV06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCm1ha2U6ICoq
KiBbTWFrZWZpbGU6NDY0OTogYWxsXSBFcnJvciAyCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwpUZXN0OiBibHVlem1ha2VleHRlbGwgLSBGQUlMCkRlc2M6IEJ1aWxkIEJsdWV6IHdpdGgg
RXh0ZXJuYWwgRUxMCk91dHB1dDoKCnRvb2xzL3Njby10ZXN0ZXIuYzogSW4gZnVuY3Rpb24g4oCY
c2NvX2Nvbm5lY3RfY2LigJk6CnRvb2xzL3Njby10ZXN0ZXIuYzo3MTI6NjogZXJyb3I6IOKAmHJl
dOKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24gWy1XZXJyb3I9
bWF5YmUtdW5pbml0aWFsaXplZF0KICA3MTIgfCAgIGlmIChzY29kYXRhLT5kYXRhX2xlbiAhPSBy
ZXQpIHsKICAgICAgfCAgICAgIF4KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBl
cnJvcnMKbWFrZVsxXTogKioqIFtNYWtlZmlsZTo3ODA3OiB0b29scy9zY28tdGVzdGVyLm9dIEVy
cm9yIDEKbWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KbWFrZTog
KioqIFtNYWtlZmlsZTo0NjQ5OiBhbGxdIEVycm9yIDIKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjClRlc3Q6IEluY3JlbWVudGFsQnVpbGQgLSBGQUlMCkRlc2M6IEluY3JlbWVudGFsIGJ1
aWxkIHdpdGggdGhlIHBhdGNoZXMgaW4gdGhlIHNlcmllcwpPdXRwdXQ6CltCbHVlWix2Niw1Lzdd
IHNjby10ZXN0ZXI6IGFkZCBUWCB0aW1lc3RhbXBpbmcgdGVzdAoKdG9vbHMvc2NvLXRlc3Rlci5j
OiBJbiBmdW5jdGlvbiDigJhzY29fY29ubmVjdF9jYuKAmToKdG9vbHMvc2NvLXRlc3Rlci5jOjcx
Mzo0OiBlcnJvcjog4oCYcmV04oCZIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBm
dW5jdGlvbiBbLVdlcnJvcj1tYXliZS11bmluaXRpYWxpemVkXQogIDcxMyB8ICAgIHRlc3Rlcl93
YXJuKCJGYWlsZWQgdG8gd3JpdGUgJXUgYnl0ZXM6ICV6dSAlcyAoJWQpIiwKICAgICAgfCAgICBe
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CiAgNzE0
IHwgICAgICBzY29kYXRhLT5kYXRhX2xlbiwgcmV0LCBzdHJlcnJvcihlcnJubyksCiAgICAgIHwg
ICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CiAgNzE1IHwgICAg
ICBlcnJubyk7CiAgICAgIHwgICAgICB+fn5+fn4KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJl
YXRlZCBhcyBlcnJvcnMKbWFrZVsxXTogKioqIFtNYWtlZmlsZTo3ODA3OiB0b29scy9zY28tdGVz
dGVyLm9dIEVycm9yIDEKbWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4u
Li4KdG9vbHMvbWdtdC10ZXN0ZXIuYzogSW4gZnVuY3Rpb24g4oCYbWFpbuKAmToKdG9vbHMvbWdt
dC10ZXN0ZXIuYzoxMjcyMTo1OiBub3RlOiB2YXJpYWJsZSB0cmFja2luZyBzaXplIGxpbWl0IGV4
Y2VlZGVkIHdpdGgg4oCYLWZ2YXItdHJhY2tpbmctYXNzaWdubWVudHPigJksIHJldHJ5aW5nIHdp
dGhvdXQKMTI3MjEgfCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogICAgICB8ICAg
ICBefn5+Cm1ha2U6ICoqKiBbTWFrZWZpbGU6NDY0OTogYWxsXSBFcnJvciAyCiMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBTY2FuQnVpbGQgLSBGQUlMCkRlc2M6IFJ1biBTY2Fu
IEJ1aWxkCk91dHB1dDoKCnNyYy9zaGFyZWQvZ2F0dC1jbGllbnQuYzo0NTE6MjE6IHdhcm5pbmc6
IFVzZSBvZiBtZW1vcnkgYWZ0ZXIgaXQgaXMgZnJlZWQKICAgICAgICBnYXR0X2RiX3VucmVnaXN0
ZXIob3AtPmNsaWVudC0+ZGIsIG9wLT5kYl9pZCk7CiAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn4Kc3JjL3NoYXJlZC9nYXR0LWNsaWVudC5jOjY5NjoyOiB3YXJuaW5nOiBVc2Ug
b2YgbWVtb3J5IGFmdGVyIGl0IGlzIGZyZWVkCiAgICAgICAgZGlzY292ZXJ5X29wX2NvbXBsZXRl
KG9wLCBmYWxzZSwgYXR0X2Vjb2RlKTsKICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+CnNyYy9zaGFyZWQvZ2F0dC1jbGllbnQuYzo5OTM6Mjogd2Fybmlu
ZzogVXNlIG9mIG1lbW9yeSBhZnRlciBpdCBpcyBmcmVlZAogICAgICAgIGRpc2NvdmVyeV9vcF9j
b21wbGV0ZShvcCwgc3VjY2VzcywgYXR0X2Vjb2RlKTsKICAgICAgICBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4Kc3JjL3NoYXJlZC9nYXR0LWNsaWVudC5jOjEw
OTk6Mjogd2FybmluZzogVXNlIG9mIG1lbW9yeSBhZnRlciBpdCBpcyBmcmVlZAogICAgICAgIGRp
c2NvdmVyeV9vcF9jb21wbGV0ZShvcCwgc3VjY2VzcywgYXR0X2Vjb2RlKTsKICAgICAgICBefn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4Kc3JjL3NoYXJlZC9nYXR0
LWNsaWVudC5jOjEyOTE6Mjogd2FybmluZzogVXNlIG9mIG1lbW9yeSBhZnRlciBpdCBpcyBmcmVl
ZAogICAgICAgIGRpc2NvdmVyeV9vcF9jb21wbGV0ZShvcCwgc3VjY2VzcywgYXR0X2Vjb2RlKTsK
ICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4Kc3Jj
L3NoYXJlZC9nYXR0LWNsaWVudC5jOjEzNTY6Mjogd2FybmluZzogVXNlIG9mIG1lbW9yeSBhZnRl
ciBpdCBpcyBmcmVlZAogICAgICAgIGRpc2NvdmVyeV9vcF9jb21wbGV0ZShvcCwgc3VjY2Vzcywg
YXR0X2Vjb2RlKTsKICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4Kc3JjL3NoYXJlZC9nYXR0LWNsaWVudC5jOjE2MzE6Njogd2FybmluZzogVXNlIG9m
IG1lbW9yeSBhZnRlciBpdCBpcyBmcmVlZAogICAgICAgIGlmIChyZWFkX2RiX2hhc2gob3ApKSB7
CiAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4Kc3JjL3NoYXJlZC9nYXR0LWNsaWVudC5jOjE2
MzY6Mjogd2FybmluZzogVXNlIG9mIG1lbW9yeSBhZnRlciBpdCBpcyBmcmVlZAogICAgICAgIGRp
c2NvdmVyX2FsbChvcCk7CiAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgpzcmMvc2hhcmVkL2dhdHQt
Y2xpZW50LmM6MjE0MDo2OiB3YXJuaW5nOiBVc2Ugb2YgbWVtb3J5IGFmdGVyIGl0IGlzIGZyZWVk
CiAgICAgICAgaWYgKHJlYWRfZGJfaGFzaChvcCkpIHsKICAgICAgICAgICAgXn5+fn5+fn5+fn5+
fn5+fgpzcmMvc2hhcmVkL2dhdHQtY2xpZW50LmM6MjE0ODo4OiB3YXJuaW5nOiBVc2Ugb2YgbWVt
b3J5IGFmdGVyIGl0IGlzIGZyZWVkCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZGlzY292ZXJ5X29wX3JlZihvcCksCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+
fn5+fn4Kc3JjL3NoYXJlZC9nYXR0LWNsaWVudC5jOjMyMzc6Mjogd2FybmluZzogVXNlIG9mIG1l
bW9yeSBhZnRlciBpdCBpcyBmcmVlZAogICAgICAgIGNvbXBsZXRlX3dyaXRlX2xvbmdfb3AocmVx
LCBzdWNjZXNzLCAwLCBmYWxzZSk7CiAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fgpzcmMvc2hhcmVkL2dhdHQtY2xpZW50LmM6MzI1OToyOiB3YXJu
aW5nOiBVc2Ugb2YgbWVtb3J5IGFmdGVyIGl0IGlzIGZyZWVkCiAgICAgICAgcmVxdWVzdF91bnJl
ZihyZXEpOwogICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fgoxMiB3YXJuaW5ncyBnZW5lcmF0ZWQu
CnNyYy9zaGFyZWQvc2hlbGwuYzoxMzMxOjEzOiB3YXJuaW5nOiBBY2Nlc3MgdG8gZmllbGQgJ29w
dGlvbnMnIHJlc3VsdHMgaW4gYSBkZXJlZmVyZW5jZSBvZiBhIG51bGwgcG9pbnRlciAobG9hZGVk
IGZyb20gdmFyaWFibGUgJ29wdCcpCiAgICAgICAgICAgICAgICAgICAgICAgIGlmIChjICE9IG9w
dC0+b3B0aW9uc1tpbmRleCAtIG9mZnNldF0udmFsKSB7CiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5+fn5+fn5+fn5+fgoxIHdhcm5pbmcgZ2VuZXJhdGVkLgpzcmMvc2hhcmVkL2dh
dHQtY2xpZW50LmM6NDUxOjIxOiB3YXJuaW5nOiBVc2Ugb2YgbWVtb3J5IGFmdGVyIGl0IGlzIGZy
ZWVkCiAgICAgICAgZ2F0dF9kYl91bnJlZ2lzdGVyKG9wLT5jbGllbnQtPmRiLCBvcC0+ZGJfaWQp
OwogICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+CnNyYy9zaGFyZWQvZ2F0dC1j
bGllbnQuYzo2OTY6Mjogd2FybmluZzogVXNlIG9mIG1lbW9yeSBhZnRlciBpdCBpcyBmcmVlZAog
ICAgICAgIGRpc2NvdmVyeV9vcF9jb21wbGV0ZShvcCwgZmFsc2UsIGF0dF9lY29kZSk7CiAgICAg
ICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgpzcmMvc2hhcmVk
L2dhdHQtY2xpZW50LmM6OTkzOjI6IHdhcm5pbmc6IFVzZSBvZiBtZW1vcnkgYWZ0ZXIgaXQgaXMg
ZnJlZWQKICAgICAgICBkaXNjb3Zlcnlfb3BfY29tcGxldGUob3AsIHN1Y2Nlc3MsIGF0dF9lY29k
ZSk7CiAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
CnNyYy9zaGFyZWQvZ2F0dC1jbGllbnQuYzoxMDk5OjI6IHdhcm5pbmc6IFVzZSBvZiBtZW1vcnkg
YWZ0ZXIgaXQgaXMgZnJlZWQKICAgICAgICBkaXNjb3Zlcnlfb3BfY29tcGxldGUob3AsIHN1Y2Nl
c3MsIGF0dF9lY29kZSk7CiAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+CnNyYy9zaGFyZWQvZ2F0dC1jbGllbnQuYzoxMjkxOjI6IHdhcm5pbmc6IFVz
ZSBvZiBtZW1vcnkgYWZ0ZXIgaXQgaXMgZnJlZWQKICAgICAgICBkaXNjb3Zlcnlfb3BfY29tcGxl
dGUob3AsIHN1Y2Nlc3MsIGF0dF9lY29kZSk7CiAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CnNyYy9zaGFyZWQvZ2F0dC1jbGllbnQuYzoxMzU2OjI6
IHdhcm5pbmc6IFVzZSBvZiBtZW1vcnkgYWZ0ZXIgaXQgaXMgZnJlZWQKICAgICAgICBkaXNjb3Zl
cnlfb3BfY29tcGxldGUob3AsIHN1Y2Nlc3MsIGF0dF9lY29kZSk7CiAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CnNyYy9zaGFyZWQvZ2F0dC1jbGll
bnQuYzoxNjMxOjY6IHdhcm5pbmc6IFVzZSBvZiBtZW1vcnkgYWZ0ZXIgaXQgaXMgZnJlZWQKICAg
ICAgICBpZiAocmVhZF9kYl9oYXNoKG9wKSkgewogICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
CnNyYy9zaGFyZWQvZ2F0dC1jbGllbnQuYzoxNjM2OjI6IHdhcm5pbmc6IFVzZSBvZiBtZW1vcnkg
YWZ0ZXIgaXQgaXMgZnJlZWQKICAgICAgICBkaXNjb3Zlcl9hbGwob3ApOwogICAgICAgIF5+fn5+
fn5+fn5+fn5+fn4Kc3JjL3NoYXJlZC9nYXR0LWNsaWVudC5jOjIxNDA6Njogd2FybmluZzogVXNl
IG9mIG1lbW9yeSBhZnRlciBpdCBpcyBmcmVlZAogICAgICAgIGlmIChyZWFkX2RiX2hhc2gob3Ap
KSB7CiAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4Kc3JjL3NoYXJlZC9nYXR0LWNsaWVudC5j
OjIxNDg6ODogd2FybmluZzogVXNlIG9mIG1lbW9yeSBhZnRlciBpdCBpcyBmcmVlZAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRpc2NvdmVy
eV9vcF9yZWYob3ApLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+CnNyYy9zaGFyZWQvZ2F0dC1jbGllbnQu
YzozMjM3OjI6IHdhcm5pbmc6IFVzZSBvZiBtZW1vcnkgYWZ0ZXIgaXQgaXMgZnJlZWQKICAgICAg
ICBjb21wbGV0ZV93cml0ZV9sb25nX29wKHJlcSwgc3VjY2VzcywgMCwgZmFsc2UpOwogICAgICAg
IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4Kc3JjL3NoYXJl
ZC9nYXR0LWNsaWVudC5jOjMyNTk6Mjogd2FybmluZzogVXNlIG9mIG1lbW9yeSBhZnRlciBpdCBp
cyBmcmVlZAogICAgICAgIHJlcXVlc3RfdW5yZWYocmVxKTsKICAgICAgICBefn5+fn5+fn5+fn5+
fn5+fn4KMTIgd2FybmluZ3MgZ2VuZXJhdGVkLgpzcmMvc2hhcmVkL3NoZWxsLmM6MTMzMToxMzog
d2FybmluZzogQWNjZXNzIHRvIGZpZWxkICdvcHRpb25zJyByZXN1bHRzIGluIGEgZGVyZWZlcmVu
Y2Ugb2YgYSBudWxsIHBvaW50ZXIgKGxvYWRlZCBmcm9tIHZhcmlhYmxlICdvcHQnKQogICAgICAg
ICAgICAgICAgICAgICAgICBpZiAoYyAhPSBvcHQtPm9wdGlvbnNbaW5kZXggLSBvZmZzZXRdLnZh
bCkgewogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn4KMSB3YXJu
aW5nIGdlbmVyYXRlZC4KdG9vbHMvaGNpYXR0YWNoLmM6ODE2Ojc6IHdhcm5pbmc6IEFsdGhvdWdo
IHRoZSB2YWx1ZSBzdG9yZWQgdG8gJ24nIGlzIHVzZWQgaW4gdGhlIGVuY2xvc2luZyBleHByZXNz
aW9uLCB0aGUgdmFsdWUgaXMgbmV2ZXIgYWN0dWFsbHkgcmVhZCBmcm9tICduJwogICAgICAgIGlm
ICgobiA9IHJlYWRfaGNpX2V2ZW50KGZkLCByZXNwLCAxMCkpIDwgMCkgewogICAgICAgICAgICAg
XiAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KdG9vbHMvaGNpYXR0YWNoLmM6ODY0Ojc6
IHdhcm5pbmc6IEFsdGhvdWdoIHRoZSB2YWx1ZSBzdG9yZWQgdG8gJ24nIGlzIHVzZWQgaW4gdGhl
IGVuY2xvc2luZyBleHByZXNzaW9uLCB0aGUgdmFsdWUgaXMgbmV2ZXIgYWN0dWFsbHkgcmVhZCBm
cm9tICduJwogICAgICAgIGlmICgobiA9IHJlYWRfaGNpX2V2ZW50KGZkLCByZXNwLCA0KSkgPCAw
KSB7CiAgICAgICAgICAgICBeICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CnRvb2xzL2hj
aWF0dGFjaC5jOjg4Njo4OiB3YXJuaW5nOiBBbHRob3VnaCB0aGUgdmFsdWUgc3RvcmVkIHRvICdu
JyBpcyB1c2VkIGluIHRoZSBlbmNsb3NpbmcgZXhwcmVzc2lvbiwgdGhlIHZhbHVlIGlzIG5ldmVy
IGFjdHVhbGx5IHJlYWQgZnJvbSAnbicKICAgICAgICAgICAgICAgIGlmICgobiA9IHJlYWRfaGNp
X2V2ZW50KGZkLCByZXNwLCAxMCkpIDwgMCkgewogICAgICAgICAgICAgICAgICAgICBeICAgfn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgp0b29scy9oY2lhdHRhY2guYzo5MDg6Nzogd2Fybmlu
ZzogQWx0aG91Z2ggdGhlIHZhbHVlIHN0b3JlZCB0byAnbicgaXMgdXNlZCBpbiB0aGUgZW5jbG9z
aW5nIGV4cHJlc3Npb24sIHRoZSB2YWx1ZSBpcyBuZXZlciBhY3R1YWxseSByZWFkIGZyb20gJ24n
CiAgICAgICAgaWYgKChuID0gcmVhZF9oY2lfZXZlbnQoZmQsIHJlc3AsIDQpKSA8IDApIHsKICAg
ICAgICAgICAgIF4gICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KdG9vbHMvaGNpYXR0YWNo
LmM6OTI5Ojc6IHdhcm5pbmc6IEFsdGhvdWdoIHRoZSB2YWx1ZSBzdG9yZWQgdG8gJ24nIGlzIHVz
ZWQgaW4gdGhlIGVuY2xvc2luZyBleHByZXNzaW9uLCB0aGUgdmFsdWUgaXMgbmV2ZXIgYWN0dWFs
bHkgcmVhZCBmcm9tICduJwogICAgICAgIGlmICgobiA9IHJlYWRfaGNpX2V2ZW50KGZkLCByZXNw
LCA0KSkgPCAwKSB7CiAgICAgICAgICAgICBeICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
CnRvb2xzL2hjaWF0dGFjaC5jOjk3Mzo3OiB3YXJuaW5nOiBBbHRob3VnaCB0aGUgdmFsdWUgc3Rv
cmVkIHRvICduJyBpcyB1c2VkIGluIHRoZSBlbmNsb3NpbmcgZXhwcmVzc2lvbiwgdGhlIHZhbHVl
IGlzIG5ldmVyIGFjdHVhbGx5IHJlYWQgZnJvbSAnbicKICAgICAgICBpZiAoKG4gPSByZWFkX2hj
aV9ldmVudChmZCwgcmVzcCwgNikpIDwgMCkgewogICAgICAgICAgICAgXiAgIH5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fgo2IHdhcm5pbmdzIGdlbmVyYXRlZC4Kc3JjL291aS5jOjUwOjI6IHdh
cm5pbmc6IFZhbHVlIHN0b3JlZCB0byAnaHdkYicgaXMgbmV2ZXIgcmVhZAogICAgICAgIGh3ZGIg
PSB1ZGV2X2h3ZGJfdW5yZWYoaHdkYik7CiAgICAgICAgXiAgICAgIH5+fn5+fn5+fn5+fn5+fn5+
fn5+fgpzcmMvb3VpLmM6NTM6Mjogd2FybmluZzogVmFsdWUgc3RvcmVkIHRvICd1ZGV2JyBpcyBu
ZXZlciByZWFkCiAgICAgICAgdWRldiA9IHVkZXZfdW5yZWYodWRldik7CiAgICAgICAgXiAgICAg
IH5+fn5+fn5+fn5+fn5+fn4KMiB3YXJuaW5ncyBnZW5lcmF0ZWQuCnRvb2xzL2hjaWR1bXAuYzox
ODA6OTogd2FybmluZzogUG90ZW50aWFsIGxlYWsgb2YgbWVtb3J5IHBvaW50ZWQgdG8gYnkgJ2Rw
JwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChmZHNbaV0uZmQgPT0gc29jaykK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+CnRvb2xzL2hjaWR1bXAuYzoy
NDg6MTc6IHdhcm5pbmc6IEFzc2lnbmVkIHZhbHVlIGlzIGdhcmJhZ2Ugb3IgdW5kZWZpbmVkCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGgtPnRzX3NlYyAgPSBodG9ibChmcm0udHMu
dHZfc2VjKTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIH5+
fn5+fn5+fn5+fn5+fn5+fn5+CnRvb2xzL2hjaWR1bXAuYzozMjY6OTogd2FybmluZzogMXN0IGZ1
bmN0aW9uIGNhbGwgYXJndW1lbnQgaXMgYW4gdW5pbml0aWFsaXplZCB2YWx1ZQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGlmIChiZTMydG9oKGRwLmZsYWdzKSAmIDB4MDIpIHsKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn4KL3Vzci9p
bmNsdWRlL2VuZGlhbi5oOjQ2OjIyOiBub3RlOiBleHBhbmRlZCBmcm9tIG1hY3JvICdiZTMydG9o
JwojICBkZWZpbmUgYmUzMnRvaCh4KSBfX2Jzd2FwXzMyICh4KQogICAgICAgICAgICAgICAgICAg
ICBefn5+fn5+fn5+fn5+fgp0b29scy9oY2lkdW1wLmM6MzQxOjIwOiB3YXJuaW5nOiAxc3QgZnVu
Y3Rpb24gY2FsbCBhcmd1bWVudCBpcyBhbiB1bmluaXRpYWxpemVkIHZhbHVlCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZnJtLmRhdGFfbGVuID0gYmUzMnRvaChkcC5sZW4pOwogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fgovdXNyL2luY2x1ZGUvZW5kaWFuLmg6NDY6MjI6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8g
J2JlMzJ0b2gnCiMgIGRlZmluZSBiZTMydG9oKHgpIF9fYnN3YXBfMzIgKHgpCiAgICAgICAgICAg
ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+CnRvb2xzL2hjaWR1bXAuYzozNDY6MTQ6IHdhcm5pbmc6
IDFzdCBmdW5jdGlvbiBjYWxsIGFyZ3VtZW50IGlzIGFuIHVuaW5pdGlhbGl6ZWQgdmFsdWUKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvcGNvZGUgPSBiZTMydG9oKGRwLmZsYWdzKSAm
IDB4ZmZmZjsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+
fn5+fn5+fn5+fgovdXNyL2luY2x1ZGUvZW5kaWFuLmg6NDY6MjI6IG5vdGU6IGV4cGFuZGVkIGZy
b20gbWFjcm8gJ2JlMzJ0b2gnCiMgIGRlZmluZSBiZTMydG9oKHgpIF9fYnN3YXBfMzIgKHgpCiAg
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+CnRvb2xzL2hjaWR1bXAuYzozODQ6MTc6
IHdhcm5pbmc6IEFzc2lnbmVkIHZhbHVlIGlzIGdhcmJhZ2Ugb3IgdW5kZWZpbmVkCiAgICAgICAg
ICAgICAgICAgICAgICAgIGZybS5kYXRhX2xlbiA9IGJ0b2hzKGRoLmxlbik7CiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBeIH5+fn5+fn5+fn5+fn4KdG9vbHMvaGNpZHVtcC5j
OjM5NDoxMTogd2FybmluZzogQXNzaWduZWQgdmFsdWUgaXMgZ2FyYmFnZSBvciB1bmRlZmluZWQK
ICAgICAgICAgICAgICAgIGZybS5sZW4gPSBmcm0uZGF0YV9sZW47CiAgICAgICAgICAgICAgICAg
ICAgICAgIF4gfn5+fn5+fn5+fn5+CnRvb2xzL2hjaWR1bXAuYzozOTg6OTogd2FybmluZzogMXN0
IGZ1bmN0aW9uIGNhbGwgYXJndW1lbnQgaXMgYW4gdW5pbml0aWFsaXplZCB2YWx1ZQogICAgICAg
ICAgICAgICAgICAgICAgICB0cyA9IGJlNjR0b2gocGgudHMpOwogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+Ci91c3IvaW5jbHVkZS9lbmRpYW4uaDo1MToyMjogbm90
ZTogZXhwYW5kZWQgZnJvbSBtYWNybyAnYmU2NHRvaCcKIyAgZGVmaW5lIGJlNjR0b2goeCkgX19i
c3dhcF82NCAoeCkKICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn4KdG9vbHMvaGNp
ZHVtcC5jOjQwMzoxMzogd2FybmluZzogMXN0IGZ1bmN0aW9uIGNhbGwgYXJndW1lbnQgaXMgYW4g
dW5pbml0aWFsaXplZCB2YWx1ZQogICAgICAgICAgICAgICAgICAgICAgICBmcm0uaW4gPSBiZTMy
dG9oKGRwLmZsYWdzKSAmIDB4MDE7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+
fn5+fn5+fn5+fn5+fn5+Ci91c3IvaW5jbHVkZS9lbmRpYW4uaDo0NjoyMjogbm90ZTogZXhwYW5k
ZWQgZnJvbSBtYWNybyAnYmUzMnRvaCcKIyAgZGVmaW5lIGJlMzJ0b2goeCkgX19ic3dhcF8zMiAo
eCkKICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn4KdG9vbHMvaGNpZHVtcC5jOjQw
ODoxMTogd2FybmluZzogQXNzaWduZWQgdmFsdWUgaXMgZ2FyYmFnZSBvciB1bmRlZmluZWQKICAg
ICAgICAgICAgICAgICAgICAgICAgZnJtLmluID0gZGguaW47CiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBeIH5+fn5+CnRvb2xzL2hjaWR1bXAuYzo0Mzc6Nzogd2FybmluZzogTnVsbCBw
b2ludGVyIHBhc3NlZCB0byAxc3QgcGFyYW1ldGVyIGV4cGVjdGluZyAnbm9ubnVsbCcKICAgICAg
ICBmZCA9IG9wZW4oZmlsZSwgb3Blbl9mbGFncywgMDY0NCk7CiAgICAgICAgICAgICBefn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+CjExIHdhcm5pbmdzIGdlbmVyYXRlZC4KdG9vbHMvcmZjb21t
LmM6MjM0OjM6IHdhcm5pbmc6IFZhbHVlIHN0b3JlZCB0byAnaScgaXMgbmV2ZXIgcmVhZAogICAg
ICAgICAgICAgICAgaSA9IGV4ZWN2cChjbWRhcmd2WzBdLCBjbWRhcmd2KTsKICAgICAgICAgICAg
ICAgIF4gICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KdG9vbHMvcmZjb21tLmM6MjM0Ojc6
IHdhcm5pbmc6IE51bGwgcG9pbnRlciBwYXNzZWQgdG8gMXN0IHBhcmFtZXRlciBleHBlY3Rpbmcg
J25vbm51bGwnCiAgICAgICAgICAgICAgICBpID0gZXhlY3ZwKGNtZGFyZ3ZbMF0sIGNtZGFyZ3Yp
OwogICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgp0b29scy9y
ZmNvbW0uYzozNTQ6ODogd2FybmluZzogQWx0aG91Z2ggdGhlIHZhbHVlIHN0b3JlZCB0byAnZmQn
IGlzIHVzZWQgaW4gdGhlIGVuY2xvc2luZyBleHByZXNzaW9uLCB0aGUgdmFsdWUgaXMgbmV2ZXIg
YWN0dWFsbHkgcmVhZCBmcm9tICdmZCcKICAgICAgICAgICAgICAgIGlmICgoZmQgPSBvcGVuKGRl
dm5hbWUsIE9fUkRPTkxZIHwgT19OT0NUVFkpKSA8IDApIHsKICAgICAgICAgICAgICAgICAgICAg
XiAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CnRvb2xzL3JmY29tbS5jOjQ5
NzoxNDogd2FybmluZzogQXNzaWduZWQgdmFsdWUgaXMgZ2FyYmFnZSBvciB1bmRlZmluZWQKICAg
ICAgICByZXEuY2hhbm5lbCA9IHJhZGRyLnJjX2NoYW5uZWw7CiAgICAgICAgICAgICAgICAgICAg
XiB+fn5+fn5+fn5+fn5+fn5+CnRvb2xzL3JmY29tbS5jOjUxNTo4OiB3YXJuaW5nOiBBbHRob3Vn
aCB0aGUgdmFsdWUgc3RvcmVkIHRvICdmZCcgaXMgdXNlZCBpbiB0aGUgZW5jbG9zaW5nIGV4cHJl
c3Npb24sIHRoZSB2YWx1ZSBpcyBuZXZlciBhY3R1YWxseSByZWFkIGZyb20gJ2ZkJwogICAgICAg
ICAgICAgICAgaWYgKChmZCA9IG9wZW4oZGV2bmFtZSwgT19SRE9OTFkgfCBPX05PQ1RUWSkpIDwg
MCkgewogICAgICAgICAgICAgICAgICAgICBeICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4KNSB3YXJuaW5ncyBnZW5lcmF0ZWQuCnNyYy9zZHAteG1sLmM6MTI2OjEwOiB3YXJu
aW5nOiBBc3NpZ25lZCB2YWx1ZSBpcyBnYXJiYWdlIG9yIHVuZGVmaW5lZAogICAgICAgICAgICAg
ICAgYnVmWzFdID0gZGF0YVtpICsgMV07CiAgICAgICAgICAgICAgICAgICAgICAgXiB+fn5+fn5+
fn5+fgpzcmMvc2RwLXhtbC5jOjMwMDoxMTogd2FybmluZzogQXNzaWduZWQgdmFsdWUgaXMgZ2Fy
YmFnZSBvciB1bmRlZmluZWQKICAgICAgICAgICAgICAgICAgICAgICAgYnVmWzFdID0gZGF0YVtp
ICsgMV07CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIH5+fn5+fn5+fn5+CnNyYy9z
ZHAteG1sLmM6MzM4OjExOiB3YXJuaW5nOiBBc3NpZ25lZCB2YWx1ZSBpcyBnYXJiYWdlIG9yIHVu
ZGVmaW5lZAogICAgICAgICAgICAgICAgICAgICAgICBidWZbMV0gPSBkYXRhW2kgKyAxXTsKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4gfn5+fn5+fn5+fn4KMyB3YXJuaW5ncyBnZW5l
cmF0ZWQuCnRvb2xzL2NpcHRvb2wuYzozNTA6Nzogd2FybmluZzogNXRoIGZ1bmN0aW9uIGNhbGwg
YXJndW1lbnQgaXMgYW4gdW5pbml0aWFsaXplZCB2YWx1ZQogICAgICAgIHNrID0gZG9fY29ubmVj
dChjdGwsIGRldl9pZCwgJnNyYywgJmRzdCwgcHNtLCAoMSA8PCBDTVRQX0xPT1BCQUNLKSk7CiAg
ICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fgoxIHdhcm5pbmcgZ2VuZXJhdGVkLgp0b29scy9zZHB0b29sLmM6OTQx
OjI2OiB3YXJuaW5nOiBSZXN1bHQgb2YgJ21hbGxvYycgaXMgY29udmVydGVkIHRvIGEgcG9pbnRl
ciBvZiB0eXBlICd1aW50MzJfdCcsIHdoaWNoIGlzIGluY29tcGF0aWJsZSB3aXRoIHNpemVvZiBv
cGVyYW5kIHR5cGUgJ2ludCcKICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgKnZhbHVl
X2ludCA9IG1hbGxvYyhzaXplb2YoaW50KSk7CiAgICAgICAgICAgICAgICAgICAgICAgIH5+fn5+
fn5+fn4gICAgICAgICAgICBefn5+fn4gfn5+fn5+fn5+fn4KdG9vbHMvc2RwdG9vbC5jOjk4MDo0
OiB3YXJuaW5nOiAxc3QgZnVuY3Rpb24gY2FsbCBhcmd1bWVudCBpcyBhbiB1bmluaXRpYWxpemVk
IHZhbHVlCiAgICAgICAgICAgICAgICAgICAgICAgIGZyZWUoYWxsb2NBcnJheVtpXSk7CiAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KdG9vbHMvc2RwdG9vbC5jOjM3
Nzc6Mjogd2FybmluZzogUG90ZW50aWFsIGxlYWsgb2YgbWVtb3J5IHBvaW50ZWQgdG8gYnkgJ3Np
Lm5hbWUnCiAgICAgICAgcmV0dXJuIGFkZF9zZXJ2aWNlKDAsICZzaSk7CiAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4KdG9vbHMvc2RwdG9vbC5jOjQxMTI6NDogd2FybmluZzogUG90
ZW50aWFsIGxlYWsgb2YgbWVtb3J5IHBvaW50ZWQgdG8gYnkgJ2NvbnRleHQuc3ZjJwogICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gLTE7CiAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+
fn5+fgo0IHdhcm5pbmdzIGdlbmVyYXRlZC4KdG9vbHMvc2NvLXRlc3Rlci5jOiBJbiBmdW5jdGlv
biDigJhzY29fY29ubmVjdF9jYuKAmToKdG9vbHMvc2NvLXRlc3Rlci5jOjcxMjo2OiBlcnJvcjog
4oCYcmV04oCZIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlvbiBbLVdl
cnJvcj1tYXliZS11bmluaXRpYWxpemVkXQogIDcxMiB8ICAgaWYgKHNjb2RhdGEtPmRhdGFfbGVu
ICE9IHJldCkgewogICAgICB8ICAgICAgXgpjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVk
IGFzIGVycm9ycwptYWtlWzFdOiAqKiogW01ha2VmaWxlOjc4MDc6IHRvb2xzL3Njby10ZXN0ZXIu
b10gRXJyb3IgMQptYWtlWzFdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgpt
YWtlOiAqKiogW01ha2VmaWxlOjQ2NDk6IGFsbF0gRXJyb3IgMgoKCi0tLQpSZWdhcmRzLApMaW51
eCBCbHVldG9vdGgKCg==

--===============5618661350018046318==--

