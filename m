Return-Path: <linux-bluetooth+bounces-3103-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CC6895B42
	for <lists+linux-bluetooth@lfdr.de>; Tue,  2 Apr 2024 19:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 351171C22042
	for <lists+linux-bluetooth@lfdr.de>; Tue,  2 Apr 2024 17:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F58815AAC7;
	Tue,  2 Apr 2024 17:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwCKw87z"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E277460264
	for <linux-bluetooth@vger.kernel.org>; Tue,  2 Apr 2024 17:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712080762; cv=none; b=ijW92N1opat1svIZ8PwnLlz23UPxPAPLy6h6ikZ9uBMiMiiSYngtybTmyTCAZN6tolzki03jZWlaYD3PuSAguVZ0s7E8w4n5g35HKyU5rjr4Vc7N1hrBRzR0calB25zOvPlJ7R5anq/nmz/rD7rnSta4+/MVbqyim2BfoBqImTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712080762; c=relaxed/simple;
	bh=LPKT844AiQUmftZRB1AllSmESKkiVRUu8+h58LPV+T0=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=MOQblF6WaxD5Sq4VtlDRVgqfNtqTAe/s9mu/SuepY9gMFrn6eNAAoaHgGFsR4w4AHG2FZkjkIzjXWrMsdht76lvBpW2OCBylJgBlKOc7OrH9nKE50ltBrwzUpbzHCr8X+Pr/QHQryFD8Q6J1wUEvMA17VpRwGhMPA3f+oKBWovQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwCKw87z; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-430ad286ab8so32788341cf.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 02 Apr 2024 10:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712080759; x=1712685559; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LPKT844AiQUmftZRB1AllSmESKkiVRUu8+h58LPV+T0=;
        b=QwCKw87zLaBkjdTT1uOhRhR4gVy8q4SGs2/WWQgoCZ4rTSFoGu4m2vqAwNUSXfAmvp
         XARG5fBYRUoxLFX0dX8tTTd1ZBhKn58yA678+9GZsF85AvQ6soRo10VKauR6fa7/wQEE
         6qtKRuju9+F+uMqJ5n1n8Piz576ZsdfngOrSI4ADY4i+Ov02mucOUP5QSKjkEkyvj/3k
         wqjckZO9FFMIlCP/Rlk6W6KNq0vuUDtem3+wlSESd3EYBz6Fnh1PG0kxKefRzYCgQxRR
         wlcOgA0PeVeVbB43ycVHLJf2+bARaIsM4Hk1OxpsdMBPJ3lcfUU50GCEsx8eCqXpAHKL
         ccbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712080759; x=1712685559;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPKT844AiQUmftZRB1AllSmESKkiVRUu8+h58LPV+T0=;
        b=vNd2cLaeezt1OtIxhUyEg8GH+MbY/ex7W2zzkDcSXTHpMsKw0dkEVZ4pKqMfWNf1PG
         KxX5RJSdtsJu8yb+z+oS+2+GYH06AQ25Ske3iS+KmdKxRiiPrfjfj0EDNc6VXMPrWdCd
         ernwi4DyaIAlhdg/Fb5ePXWg0nIbd6/7v/KevCrvdJtinptZ/xAjnQzhmSOMenWpShfw
         5+AqGBj1+dRe2SWBBrsCVMMQ0gnIRvLTGq838fjELcd2Vv8/dR2j/rukfhdx0AFZCGHl
         KwUDFpfuYkiHgdy0ZyHXNNPxV/C6BB9LJxxTC8dSzU32HJ8P8IloSEAcU0BacmMxGVnq
         kf3g==
X-Gm-Message-State: AOJu0YyW5PunAoMDamt/kERrzUl2C1N3nQWoIApRrXdcScvocLeNDhbE
	ZXjZ49DKjG96me8jgeXFA/9xXrZkpt8BymC8zNDPdT0aj8KkMOMwN2yyr6t1
X-Google-Smtp-Source: AGHT+IEJVp3LTHgbsadPPwDXcXMuZJgP1GSbRSiQv3loV0KGo+1PYCoXeSAree0qvPvxrDzJmQxrdw==
X-Received: by 2002:a05:622a:d1:b0:431:49c1:cfc6 with SMTP id p17-20020a05622a00d100b0043149c1cfc6mr490157qtw.20.1712080758440;
        Tue, 02 Apr 2024 10:59:18 -0700 (PDT)
Received: from [172.17.0.2] ([20.102.214.39])
        by smtp.gmail.com with ESMTPSA id ec10-20020a05622a5b8a00b0042f21fe66f7sm5812832qtb.73.2024.04.02.10.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 10:59:18 -0700 (PDT)
Message-ID: <660c4776.050a0220.d6355.d55b@mx.google.com>
Date: Tue, 02 Apr 2024 10:59:18 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============7424925973983786958=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, pav@iki.fi
Subject: RE: tests: add TX timestamping tests
In-Reply-To: <dfac82dfbb128c79c0c62c72a75ccd1da67ec99d.1712076170.git.pav@iki.fi>
References: <dfac82dfbb128c79c0c62c72a75ccd1da67ec99d.1712076170.git.pav@iki.fi>
Reply-To: linux-bluetooth@vger.kernel.org

--===============7424925973983786958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

VGhpcyBpcyBhdXRvbWF0ZWQgZW1haWwgYW5kIHBsZWFzZSBkbyBub3QgcmVwbHkgdG8gdGhpcyBl
bWFpbCEKCkRlYXIgc3VibWl0dGVyLAoKVGhhbmsgeW91IGZvciBzdWJtaXR0aW5nIHRoZSBwYXRj
aGVzIHRvIHRoZSBsaW51eCBibHVldG9vdGggbWFpbGluZyBsaXN0LgpUaGlzIGlzIGEgQ0kgdGVz
dCByZXN1bHRzIHdpdGggeW91ciBwYXRjaCBzZXJpZXM6ClBXIExpbms6aHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2JsdWV0b290aC9saXN0Lz9zZXJpZXM9ODQwNzE4CgotLS1U
ZXN0IHJlc3VsdC0tLQoKVGVzdCBTdW1tYXJ5OgpDaGVja1BhdGNoICAgICAgICAgICAgICAgICAg
ICBQQVNTICAgICAgNC4yOSBzZWNvbmRzCkdpdExpbnQgICAgICAgICAgICAgICAgICAgICAgIFBB
U1MgICAgICAyLjMwIHNlY29uZHMKQnVpbGRFbGwgICAgICAgICAgICAgICAgICAgICAgUEFTUyAg
ICAgIDI0LjYwIHNlY29uZHMKQmx1ZXpNYWtlICAgICAgICAgICAgICAgICAgICAgRkFJTCAgICAg
IDUwLjQxIHNlY29uZHMKTWFrZUNoZWNrICAgICAgICAgICAgICAgICAgICAgRkFJTCAgICAgIDE0
Ny43OSBzZWNvbmRzCk1ha2VEaXN0Y2hlY2sgICAgICAgICAgICAgICAgIFBBU1MgICAgICAxNzYu
NjAgc2Vjb25kcwpDaGVja1ZhbGdyaW5kICAgICAgICAgICAgICAgICBGQUlMICAgICAgNDMuMDMg
c2Vjb25kcwpDaGVja1NtYXRjaCAgICAgICAgICAgICAgICAgICBGQUlMICAgICAgOTYuMDQgc2Vj
b25kcwpibHVlem1ha2VleHRlbGwgICAgICAgICAgICAgICBGQUlMICAgICAgMjQuNjkgc2Vjb25k
cwpJbmNyZW1lbnRhbEJ1aWxkICAgICAgICAgICAgICBGQUlMICAgICAgMTQ5My4yOCBzZWNvbmRz
ClNjYW5CdWlsZCAgICAgICAgICAgICAgICAgICAgIEZBSUwgICAgICA1ODMuODggc2Vjb25kcwoK
RGV0YWlscwojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDogQmx1ZXpNYWtlIC0g
RkFJTApEZXNjOiBCdWlsZCBCbHVlWgpPdXRwdXQ6Cgp0b29scy9sMmNhcC10ZXN0ZXIuYzogSW4g
ZnVuY3Rpb24g4oCYbDJjYXBfdHhfdGltZXN0YW1waW5n4oCZOgp0b29scy9sMmNhcC10ZXN0ZXIu
YzoxMjkyOjk6IGVycm9yOiB2YXJpYWJsZSDigJhzb+KAmSBoYXMgaW5pdGlhbGl6ZXIgYnV0IGlu
Y29tcGxldGUgdHlwZQogMTI5MiB8ICBzdHJ1Y3Qgc29fdGltZXN0YW1waW5nIHNvID0gewogICAg
ICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+CnRvb2xzL2wyY2FwLXRlc3Rlci5jOjEyOTM6NDog
ZXJyb3I6IOKAmHN0cnVjdCBzb190aW1lc3RhbXBpbmfigJkgaGFzIG5vIG1lbWJlciBuYW1lZCDi
gJhmbGFnc+KAmQogMTI5MyB8ICAgLmZsYWdzID0gbDJkYXRhLT5zb190aW1lc3RhbXBpbmcsCiAg
ICAgIHwgICAgXn5+fn4KdG9vbHMvbDJjYXAtdGVzdGVyLmM6MTI5MzoxMjogZXJyb3I6IGV4Y2Vz
cyBlbGVtZW50cyBpbiBzdHJ1Y3QgaW5pdGlhbGl6ZXIgWy1XZXJyb3JdCiAxMjkzIHwgICAuZmxh
Z3MgPSBsMmRhdGEtPnNvX3RpbWVzdGFtcGluZywKICAgICAgfCAgICAgICAgICAgIF5+fn5+fgp0
b29scy9sMmNhcC10ZXN0ZXIuYzoxMjkzOjEyOiBub3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBm
b3Ig4oCYc2/igJkpCnRvb2xzL2wyY2FwLXRlc3Rlci5jOjEyOTI6MjU6IGVycm9yOiBzdG9yYWdl
IHNpemUgb2Yg4oCYc2/igJkgaXNu4oCZdCBrbm93bgogMTI5MiB8ICBzdHJ1Y3Qgc29fdGltZXN0
YW1waW5nIHNvID0gewogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgIF5+CnRvb2xzL2wy
Y2FwLXRlc3Rlci5jOjEyOTI6MjU6IGVycm9yOiB1bnVzZWQgdmFyaWFibGUg4oCYc2/igJkgWy1X
ZXJyb3I9dW51c2VkLXZhcmlhYmxlXQpjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFz
IGVycm9ycwptYWtlWzFdOiAqKiogW01ha2VmaWxlOjc4MDc6IHRvb2xzL2wyY2FwLXRlc3Rlci5v
XSBFcnJvciAxCm1ha2VbMV06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCnRv
b2xzL21nbXQtdGVzdGVyLmM6IEluIGZ1bmN0aW9uIOKAmG1haW7igJk6CnRvb2xzL21nbXQtdGVz
dGVyLmM6MTI3MjE6NTogbm90ZTogdmFyaWFibGUgdHJhY2tpbmcgc2l6ZSBsaW1pdCBleGNlZWRl
ZCB3aXRoIOKAmC1mdmFyLXRyYWNraW5nLWFzc2lnbm1lbnRz4oCZLCByZXRyeWluZyB3aXRob3V0
CjEyNzIxIHwgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAgICAgfCAgICAgXn5+
fgptYWtlOiAqKiogW01ha2VmaWxlOjQ2NDk6IGFsbF0gRXJyb3IgMgojIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKVGVzdDogTWFrZUNoZWNrIC0gRkFJTApEZXNjOiBSdW4gQmx1ZXogTWFr
ZSBDaGVjawpPdXRwdXQ6Cgp0b29scy9sMmNhcC10ZXN0ZXIuYzogSW4gZnVuY3Rpb24g4oCYbDJj
YXBfdHhfdGltZXN0YW1waW5n4oCZOgp0b29scy9sMmNhcC10ZXN0ZXIuYzoxMjkyOjk6IGVycm9y
OiB2YXJpYWJsZSDigJhzb+KAmSBoYXMgaW5pdGlhbGl6ZXIgYnV0IGluY29tcGxldGUgdHlwZQog
MTI5MiB8ICBzdHJ1Y3Qgc29fdGltZXN0YW1waW5nIHNvID0gewogICAgICB8ICAgICAgICAgXn5+
fn5+fn5+fn5+fn5+CnRvb2xzL2wyY2FwLXRlc3Rlci5jOjEyOTM6NDogZXJyb3I6IOKAmHN0cnVj
dCBzb190aW1lc3RhbXBpbmfigJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJhmbGFnc+KAmQogMTI5
MyB8ICAgLmZsYWdzID0gbDJkYXRhLT5zb190aW1lc3RhbXBpbmcsCiAgICAgIHwgICAgXn5+fn4K
dG9vbHMvbDJjYXAtdGVzdGVyLmM6MTI5MzoxMjogZXJyb3I6IGV4Y2VzcyBlbGVtZW50cyBpbiBz
dHJ1Y3QgaW5pdGlhbGl6ZXIgWy1XZXJyb3JdCiAxMjkzIHwgICAuZmxhZ3MgPSBsMmRhdGEtPnNv
X3RpbWVzdGFtcGluZywKICAgICAgfCAgICAgICAgICAgIF5+fn5+fgp0b29scy9sMmNhcC10ZXN0
ZXIuYzoxMjkzOjEyOiBub3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBmb3Ig4oCYc2/igJkpCnRv
b2xzL2wyY2FwLXRlc3Rlci5jOjEyOTI6MjU6IGVycm9yOiBzdG9yYWdlIHNpemUgb2Yg4oCYc2/i
gJkgaXNu4oCZdCBrbm93bgogMTI5MiB8ICBzdHJ1Y3Qgc29fdGltZXN0YW1waW5nIHNvID0gewog
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgIF5+CnRvb2xzL2wyY2FwLXRlc3Rlci5jOjEy
OTI6MjU6IGVycm9yOiB1bnVzZWQgdmFyaWFibGUg4oCYc2/igJkgWy1XZXJyb3I9dW51c2VkLXZh
cmlhYmxlXQpjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwptYWtlWzFd
OiAqKiogW01ha2VmaWxlOjc4MDc6IHRvb2xzL2wyY2FwLXRlc3Rlci5vXSBFcnJvciAxCm1ha2U6
ICoqKiBbTWFrZWZpbGU6MTIxODQ6IGNoZWNrXSBFcnJvciAyCiMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwpUZXN0OiBDaGVja1ZhbGdyaW5kIC0gRkFJTApEZXNjOiBSdW4gQmx1ZXogTWFr
ZSBDaGVjayB3aXRoIFZhbGdyaW5kCk91dHB1dDoKCnRvb2xzL2wyY2FwLXRlc3Rlci5jOiBJbiBm
dW5jdGlvbiDigJhsMmNhcF90eF90aW1lc3RhbXBpbmfigJk6CnRvb2xzL2wyY2FwLXRlc3Rlci5j
OjEyOTI6OTogZXJyb3I6IHZhcmlhYmxlIOKAmHNv4oCZIGhhcyBpbml0aWFsaXplciBidXQgaW5j
b21wbGV0ZSB0eXBlCiAxMjkyIHwgIHN0cnVjdCBzb190aW1lc3RhbXBpbmcgc28gPSB7CiAgICAg
IHwgICAgICAgICBefn5+fn5+fn5+fn5+fn4KdG9vbHMvbDJjYXAtdGVzdGVyLmM6MTI5Mzo0OiBl
cnJvcjog4oCYc3RydWN0IHNvX3RpbWVzdGFtcGluZ+KAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKA
mGZsYWdz4oCZCiAxMjkzIHwgICAuZmxhZ3MgPSBsMmRhdGEtPnNvX3RpbWVzdGFtcGluZywKICAg
ICAgfCAgICBefn5+fgp0b29scy9sMmNhcC10ZXN0ZXIuYzoxMjkzOjEyOiBlcnJvcjogZXhjZXNz
IGVsZW1lbnRzIGluIHN0cnVjdCBpbml0aWFsaXplciBbLVdlcnJvcl0KIDEyOTMgfCAgIC5mbGFn
cyA9IGwyZGF0YS0+c29fdGltZXN0YW1waW5nLAogICAgICB8ICAgICAgICAgICAgXn5+fn5+CnRv
b2xzL2wyY2FwLXRlc3Rlci5jOjEyOTM6MTI6IG5vdGU6IChuZWFyIGluaXRpYWxpemF0aW9uIGZv
ciDigJhzb+KAmSkKdG9vbHMvbDJjYXAtdGVzdGVyLmM6MTI5MjoyNTogZXJyb3I6IHN0b3JhZ2Ug
c2l6ZSBvZiDigJhzb+KAmSBpc27igJl0IGtub3duCiAxMjkyIHwgIHN0cnVjdCBzb190aW1lc3Rh
bXBpbmcgc28gPSB7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgXn4KdG9vbHMvbDJj
YXAtdGVzdGVyLmM6MTI5MjoyNTogZXJyb3I6IHVudXNlZCB2YXJpYWJsZSDigJhzb+KAmSBbLVdl
cnJvcj11bnVzZWQtdmFyaWFibGVdCmNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMg
ZXJyb3JzCm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6NzgwNzogdG9vbHMvbDJjYXAtdGVzdGVyLm9d
IEVycm9yIDEKbWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KdG9v
bHMvbWdtdC10ZXN0ZXIuYzogSW4gZnVuY3Rpb24g4oCYbWFpbuKAmToKdG9vbHMvbWdtdC10ZXN0
ZXIuYzoxMjcyMTo1OiBub3RlOiB2YXJpYWJsZSB0cmFja2luZyBzaXplIGxpbWl0IGV4Y2VlZGVk
IHdpdGgg4oCYLWZ2YXItdHJhY2tpbmctYXNzaWdubWVudHPigJksIHJldHJ5aW5nIHdpdGhvdXQK
MTI3MjEgfCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogICAgICB8ICAgICBefn5+
Cm1ha2U6ICoqKiBbTWFrZWZpbGU6MTIxODQ6IGNoZWNrXSBFcnJvciAyCiMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBDaGVja1NtYXRjaCAtIEZBSUwKRGVzYzogUnVuIHNtYXRj
aCB0b29sIHdpdGggc291cmNlCk91dHB1dDoKCnNyYy9zaGFyZWQvY3J5cHRvLmM6MjcxOjIxOiB3
YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9jcnlwdG8u
YzoyNzI6MjM6IHdhcm5pbmc6IFZhcmlhYmxlIGxlbmd0aCBhcnJheSBpcyB1c2VkLgpzcmMvc2hh
cmVkL2dhdHQtaGVscGVycy5jOjc2ODozMTogd2FybmluZzogVmFyaWFibGUgbGVuZ3RoIGFycmF5
IGlzIHVzZWQuCnNyYy9zaGFyZWQvZ2F0dC1oZWxwZXJzLmM6ODMwOjMxOiB3YXJuaW5nOiBWYXJp
YWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9nYXR0LWhlbHBlcnMuYzoxMzIz
OjMxOiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9n
YXR0LWhlbHBlcnMuYzoxMzU0OjIzOiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMg
dXNlZC4Kc3JjL3NoYXJlZC9nYXR0LXNlcnZlci5jOjI3ODoyNTogd2FybmluZzogVmFyaWFibGUg
bGVuZ3RoIGFycmF5IGlzIHVzZWQuCnNyYy9zaGFyZWQvZ2F0dC1zZXJ2ZXIuYzo2MjE6MjU6IHdh
cm5pbmc6IFZhcmlhYmxlIGxlbmd0aCBhcnJheSBpcyB1c2VkLgpzcmMvc2hhcmVkL2dhdHQtc2Vy
dmVyLmM6NzIwOjI1OiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3Jj
L3NoYXJlZC9iYXAuYzoyODI6MjU6IHdhcm5pbmc6IGFycmF5IG9mIGZsZXhpYmxlIHN0cnVjdHVy
ZXMKc3JjL3NoYXJlZC9iYXAuYzogbm90ZTogaW4gaW5jbHVkZWQgZmlsZToKLi9zcmMvc2hhcmVk
L2FzY3MuaDo4ODoyNTogd2FybmluZzogYXJyYXkgb2YgZmxleGlibGUgc3RydWN0dXJlcwpzcmMv
c2hhcmVkL3NoZWxsLmM6IG5vdGU6IGluIGluY2x1ZGVkIGZpbGUgKHRocm91Z2ggL3Vzci9pbmNs
dWRlL3JlYWRsaW5lL3JlYWRsaW5lLmgpOgovdXNyL2luY2x1ZGUvcmVhZGxpbmUvcmx0eXBlZGVm
cy5oOjM1OjIzOiB3YXJuaW5nOiBub24tQU5TSSBmdW5jdGlvbiBkZWNsYXJhdGlvbiBvZiBmdW5j
dGlvbiAnRnVuY3Rpb24nCi91c3IvaW5jbHVkZS9yZWFkbGluZS9ybHR5cGVkZWZzLmg6MzY6MjU6
IHdhcm5pbmc6IG5vbi1BTlNJIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdWRnVu
Y3Rpb24nCi91c3IvaW5jbHVkZS9yZWFkbGluZS9ybHR5cGVkZWZzLmg6Mzc6Mjc6IHdhcm5pbmc6
IG5vbi1BTlNJIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdDUEZ1bmN0aW9uJwov
dXNyL2luY2x1ZGUvcmVhZGxpbmUvcmx0eXBlZGVmcy5oOjM4OjI5OiB3YXJuaW5nOiBub24tQU5T
SSBmdW5jdGlvbiBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnQ1BQRnVuY3Rpb24nCnNyYy9zaGFy
ZWQvY3J5cHRvLmM6MjcxOjIxOiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNl
ZC4Kc3JjL3NoYXJlZC9jcnlwdG8uYzoyNzI6MjM6IHdhcm5pbmc6IFZhcmlhYmxlIGxlbmd0aCBh
cnJheSBpcyB1c2VkLgpzcmMvc2hhcmVkL2dhdHQtaGVscGVycy5jOjc2ODozMTogd2FybmluZzog
VmFyaWFibGUgbGVuZ3RoIGFycmF5IGlzIHVzZWQuCnNyYy9zaGFyZWQvZ2F0dC1oZWxwZXJzLmM6
ODMwOjMxOiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJl
ZC9nYXR0LWhlbHBlcnMuYzoxMzIzOjMxOiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5ndGggYXJyYXkg
aXMgdXNlZC4Kc3JjL3NoYXJlZC9nYXR0LWhlbHBlcnMuYzoxMzU0OjIzOiB3YXJuaW5nOiBWYXJp
YWJsZSBsZW5ndGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9nYXR0LXNlcnZlci5jOjI3ODoy
NTogd2FybmluZzogVmFyaWFibGUgbGVuZ3RoIGFycmF5IGlzIHVzZWQuCnNyYy9zaGFyZWQvZ2F0
dC1zZXJ2ZXIuYzo2MjE6MjU6IHdhcm5pbmc6IFZhcmlhYmxlIGxlbmd0aCBhcnJheSBpcyB1c2Vk
LgpzcmMvc2hhcmVkL2dhdHQtc2VydmVyLmM6NzIwOjI1OiB3YXJuaW5nOiBWYXJpYWJsZSBsZW5n
dGggYXJyYXkgaXMgdXNlZC4Kc3JjL3NoYXJlZC9iYXAuYzoyODI6MjU6IHdhcm5pbmc6IGFycmF5
IG9mIGZsZXhpYmxlIHN0cnVjdHVyZXMKc3JjL3NoYXJlZC9iYXAuYzogbm90ZTogaW4gaW5jbHVk
ZWQgZmlsZToKLi9zcmMvc2hhcmVkL2FzY3MuaDo4ODoyNTogd2FybmluZzogYXJyYXkgb2YgZmxl
eGlibGUgc3RydWN0dXJlcwpzcmMvc2hhcmVkL3NoZWxsLmM6IG5vdGU6IGluIGluY2x1ZGVkIGZp
bGUgKHRocm91Z2ggL3Vzci9pbmNsdWRlL3JlYWRsaW5lL3JlYWRsaW5lLmgpOgovdXNyL2luY2x1
ZGUvcmVhZGxpbmUvcmx0eXBlZGVmcy5oOjM1OjIzOiB3YXJuaW5nOiBub24tQU5TSSBmdW5jdGlv
biBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnRnVuY3Rpb24nCi91c3IvaW5jbHVkZS9yZWFkbGlu
ZS9ybHR5cGVkZWZzLmg6MzY6MjU6IHdhcm5pbmc6IG5vbi1BTlNJIGZ1bmN0aW9uIGRlY2xhcmF0
aW9uIG9mIGZ1bmN0aW9uICdWRnVuY3Rpb24nCi91c3IvaW5jbHVkZS9yZWFkbGluZS9ybHR5cGVk
ZWZzLmg6Mzc6Mjc6IHdhcm5pbmc6IG5vbi1BTlNJIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIG9mIGZ1
bmN0aW9uICdDUEZ1bmN0aW9uJwovdXNyL2luY2x1ZGUvcmVhZGxpbmUvcmx0eXBlZGVmcy5oOjM4
OjI5OiB3YXJuaW5nOiBub24tQU5TSSBmdW5jdGlvbiBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAn
Q1BQRnVuY3Rpb24nCnRvb2xzL21lc2gtY2ZndGVzdC5jOjE0NTM6MTc6IHdhcm5pbmc6IHVua25v
d24gZXNjYXBlIHNlcXVlbmNlOiAnXCUnCnRvb2xzL2wyY2FwLXRlc3Rlci5jOiBJbiBmdW5jdGlv
biDigJhsMmNhcF90eF90aW1lc3RhbXBpbmfigJk6CnRvb2xzL2wyY2FwLXRlc3Rlci5jOjEyOTI6
OTogZXJyb3I6IHZhcmlhYmxlIOKAmHNv4oCZIGhhcyBpbml0aWFsaXplciBidXQgaW5jb21wbGV0
ZSB0eXBlCiAxMjkyIHwgIHN0cnVjdCBzb190aW1lc3RhbXBpbmcgc28gPSB7CiAgICAgIHwgICAg
ICAgICBefn5+fn5+fn5+fn5+fn4KdG9vbHMvbDJjYXAtdGVzdGVyLmM6MTI5Mzo0OiBlcnJvcjog
4oCYc3RydWN0IHNvX3RpbWVzdGFtcGluZ+KAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmGZsYWdz
4oCZCiAxMjkzIHwgICAuZmxhZ3MgPSBsMmRhdGEtPnNvX3RpbWVzdGFtcGluZywKICAgICAgfCAg
ICBefn5+fgp0b29scy9sMmNhcC10ZXN0ZXIuYzoxMjkzOjEyOiBlcnJvcjogZXhjZXNzIGVsZW1l
bnRzIGluIHN0cnVjdCBpbml0aWFsaXplciBbLVdlcnJvcl0KIDEyOTMgfCAgIC5mbGFncyA9IGwy
ZGF0YS0+c29fdGltZXN0YW1waW5nLAogICAgICB8ICAgICAgICAgICAgXn5+fn5+CnRvb2xzL2wy
Y2FwLXRlc3Rlci5jOjEyOTM6MTI6IG5vdGU6IChuZWFyIGluaXRpYWxpemF0aW9uIGZvciDigJhz
b+KAmSkKdG9vbHMvbDJjYXAtdGVzdGVyLmM6MTI5MjoyNTogZXJyb3I6IHN0b3JhZ2Ugc2l6ZSBv
ZiDigJhzb+KAmSBpc27igJl0IGtub3duCiAxMjkyIHwgIHN0cnVjdCBzb190aW1lc3RhbXBpbmcg
c28gPSB7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgXn4KdG9vbHMvbDJjYXAtdGVz
dGVyLmM6MTI5MjoyNTogZXJyb3I6IHVudXNlZCB2YXJpYWJsZSDigJhzb+KAmSBbLVdlcnJvcj11
bnVzZWQtdmFyaWFibGVdCmNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3Jz
Cm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6NzgwNzogdG9vbHMvbDJjYXAtdGVzdGVyLm9dIEVycm9y
IDEKbWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KbWFrZTogKioq
IFtNYWtlZmlsZTo0NjQ5OiBhbGxdIEVycm9yIDIKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjClRlc3Q6IGJsdWV6bWFrZWV4dGVsbCAtIEZBSUwKRGVzYzogQnVpbGQgQmx1ZXogd2l0aCBF
eHRlcm5hbCBFTEwKT3V0cHV0OgoKdG9vbHMvbDJjYXAtdGVzdGVyLmM6IEluIGZ1bmN0aW9uIOKA
mGwyY2FwX3R4X3RpbWVzdGFtcGluZ+KAmToKdG9vbHMvbDJjYXAtdGVzdGVyLmM6MTI5Mjo5OiBl
cnJvcjogdmFyaWFibGUg4oCYc2/igJkgaGFzIGluaXRpYWxpemVyIGJ1dCBpbmNvbXBsZXRlIHR5
cGUKIDEyOTIgfCAgc3RydWN0IHNvX3RpbWVzdGFtcGluZyBzbyA9IHsKICAgICAgfCAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fgp0b29scy9sMmNhcC10ZXN0ZXIuYzoxMjkzOjQ6IGVycm9yOiDigJhz
dHJ1Y3Qgc29fdGltZXN0YW1waW5n4oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYZmxhZ3PigJkK
IDEyOTMgfCAgIC5mbGFncyA9IGwyZGF0YS0+c29fdGltZXN0YW1waW5nLAogICAgICB8ICAgIF5+
fn5+CnRvb2xzL2wyY2FwLXRlc3Rlci5jOjEyOTM6MTI6IGVycm9yOiBleGNlc3MgZWxlbWVudHMg
aW4gc3RydWN0IGluaXRpYWxpemVyIFstV2Vycm9yXQogMTI5MyB8ICAgLmZsYWdzID0gbDJkYXRh
LT5zb190aW1lc3RhbXBpbmcsCiAgICAgIHwgICAgICAgICAgICBefn5+fn4KdG9vbHMvbDJjYXAt
dGVzdGVyLmM6MTI5MzoxMjogbm90ZTogKG5lYXIgaW5pdGlhbGl6YXRpb24gZm9yIOKAmHNv4oCZ
KQp0b29scy9sMmNhcC10ZXN0ZXIuYzoxMjkyOjI1OiBlcnJvcjogc3RvcmFnZSBzaXplIG9mIOKA
mHNv4oCZIGlzbuKAmXQga25vd24KIDEyOTIgfCAgc3RydWN0IHNvX3RpbWVzdGFtcGluZyBzbyA9
IHsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICBefgp0b29scy9sMmNhcC10ZXN0ZXIu
YzoxMjkyOjI1OiBlcnJvcjogdW51c2VkIHZhcmlhYmxlIOKAmHNv4oCZIFstV2Vycm9yPXVudXNl
ZC12YXJpYWJsZV0KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKbWFr
ZVsxXTogKioqIFtNYWtlZmlsZTo3ODA3OiB0b29scy9sMmNhcC10ZXN0ZXIub10gRXJyb3IgMQpt
YWtlWzFdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgptYWtlOiAqKiogW01h
a2VmaWxlOjQ2NDk6IGFsbF0gRXJyb3IgMgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
VGVzdDogSW5jcmVtZW50YWxCdWlsZCAtIEZBSUwKRGVzYzogSW5jcmVtZW50YWwgYnVpbGQgd2l0
aCB0aGUgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzCk91dHB1dDoKW0JsdWVaLHYzLDIvOF0gaXNvLXRl
c3RlcjogQWRkIHRlc3RzIGZvciBUWCB0aW1lc3RhbXBpbmcKCnRvb2xzL2lzby10ZXN0ZXIuYzog
SW4gZnVuY3Rpb24g4oCYaXNvX3R4X3RpbWVzdGFtcGluZ+KAmToKdG9vbHMvaXNvLXRlc3Rlci5j
OjIxMzA6OTogZXJyb3I6IHZhcmlhYmxlIOKAmHNv4oCZIGhhcyBpbml0aWFsaXplciBidXQgaW5j
b21wbGV0ZSB0eXBlCiAyMTMwIHwgIHN0cnVjdCBzb190aW1lc3RhbXBpbmcgc28gPSB7CiAgICAg
IHwgICAgICAgICBefn5+fn5+fn5+fn5+fn4KdG9vbHMvaXNvLXRlc3Rlci5jOjIxMzE6NDogZXJy
b3I6IOKAmHN0cnVjdCBzb190aW1lc3RhbXBpbmfigJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJhm
bGFnc+KAmQogMjEzMSB8ICAgLmZsYWdzID0gaXNvZGF0YS0+c29fdGltZXN0YW1waW5nLAogICAg
ICB8ICAgIF5+fn5+CnRvb2xzL2lzby10ZXN0ZXIuYzoyMTMxOjEyOiBlcnJvcjogZXhjZXNzIGVs
ZW1lbnRzIGluIHN0cnVjdCBpbml0aWFsaXplciBbLVdlcnJvcl0KIDIxMzEgfCAgIC5mbGFncyA9
IGlzb2RhdGEtPnNvX3RpbWVzdGFtcGluZywKICAgICAgfCAgICAgICAgICAgIF5+fn5+fn4KdG9v
bHMvaXNvLXRlc3Rlci5jOjIxMzE6MTI6IG5vdGU6IChuZWFyIGluaXRpYWxpemF0aW9uIGZvciDi
gJhzb+KAmSkKdG9vbHMvaXNvLXRlc3Rlci5jOjIxMzA6MjU6IGVycm9yOiBzdG9yYWdlIHNpemUg
b2Yg4oCYc2/igJkgaXNu4oCZdCBrbm93bgogMjEzMCB8ICBzdHJ1Y3Qgc29fdGltZXN0YW1waW5n
IHNvID0gewogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgIF5+CnRvb2xzL2lzby10ZXN0
ZXIuYzoyMTMwOjI1OiBlcnJvcjogdW51c2VkIHZhcmlhYmxlIOKAmHNv4oCZIFstV2Vycm9yPXVu
dXNlZC12YXJpYWJsZV0KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMK
bWFrZVsxXTogKioqIFtNYWtlZmlsZTo3ODA3OiB0b29scy9pc28tdGVzdGVyLm9dIEVycm9yIDEK
bWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KdG9vbHMvbWdtdC10
ZXN0ZXIuYzogSW4gZnVuY3Rpb24g4oCYbWFpbuKAmToKdG9vbHMvbWdtdC10ZXN0ZXIuYzoxMjcy
MTo1OiBub3RlOiB2YXJpYWJsZSB0cmFja2luZyBzaXplIGxpbWl0IGV4Y2VlZGVkIHdpdGgg4oCY
LWZ2YXItdHJhY2tpbmctYXNzaWdubWVudHPigJksIHJldHJ5aW5nIHdpdGhvdXQKMTI3MjEgfCBp
bnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogICAgICB8ICAgICBefn5+Cm1ha2U6ICoq
KiBbTWFrZWZpbGU6NDY0OTogYWxsXSBFcnJvciAyCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwpUZXN0OiBTY2FuQnVpbGQgLSBGQUlMCkRlc2M6IFJ1biBTY2FuIEJ1aWxkCk91dHB1dDoK
CnNyYy9zaGFyZWQvZ2F0dC1jbGllbnQuYzo0NTE6MjE6IHdhcm5pbmc6IFVzZSBvZiBtZW1vcnkg
YWZ0ZXIgaXQgaXMgZnJlZWQKICAgICAgICBnYXR0X2RiX3VucmVnaXN0ZXIob3AtPmNsaWVudC0+
ZGIsIG9wLT5kYl9pZCk7CiAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn4Kc3Jj
L3NoYXJlZC9nYXR0LWNsaWVudC5jOjY5NjoyOiB3YXJuaW5nOiBVc2Ugb2YgbWVtb3J5IGFmdGVy
IGl0IGlzIGZyZWVkCiAgICAgICAgZGlzY292ZXJ5X29wX2NvbXBsZXRlKG9wLCBmYWxzZSwgYXR0
X2Vjb2RlKTsKICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+CnNyYy9zaGFyZWQvZ2F0dC1jbGllbnQuYzo5OTM6Mjogd2FybmluZzogVXNlIG9mIG1lbW9y
eSBhZnRlciBpdCBpcyBmcmVlZAogICAgICAgIGRpc2NvdmVyeV9vcF9jb21wbGV0ZShvcCwgc3Vj
Y2VzcywgYXR0X2Vjb2RlKTsKICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4Kc3JjL3NoYXJlZC9nYXR0LWNsaWVudC5jOjEwOTk6Mjogd2FybmluZzog
VXNlIG9mIG1lbW9yeSBhZnRlciBpdCBpcyBmcmVlZAogICAgICAgIGRpc2NvdmVyeV9vcF9jb21w
bGV0ZShvcCwgc3VjY2VzcywgYXR0X2Vjb2RlKTsKICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4Kc3JjL3NoYXJlZC9nYXR0LWNsaWVudC5jOjEyOTE6
Mjogd2FybmluZzogVXNlIG9mIG1lbW9yeSBhZnRlciBpdCBpcyBmcmVlZAogICAgICAgIGRpc2Nv
dmVyeV9vcF9jb21wbGV0ZShvcCwgc3VjY2VzcywgYXR0X2Vjb2RlKTsKICAgICAgICBefn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4Kc3JjL3NoYXJlZC9nYXR0LWNs
aWVudC5jOjEzNTY6Mjogd2FybmluZzogVXNlIG9mIG1lbW9yeSBhZnRlciBpdCBpcyBmcmVlZAog
ICAgICAgIGRpc2NvdmVyeV9vcF9jb21wbGV0ZShvcCwgc3VjY2VzcywgYXR0X2Vjb2RlKTsKICAg
ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4Kc3JjL3No
YXJlZC9nYXR0LWNsaWVudC5jOjE2MzE6Njogd2FybmluZzogVXNlIG9mIG1lbW9yeSBhZnRlciBp
dCBpcyBmcmVlZAogICAgICAgIGlmIChyZWFkX2RiX2hhc2gob3ApKSB7CiAgICAgICAgICAgIF5+
fn5+fn5+fn5+fn5+fn4Kc3JjL3NoYXJlZC9nYXR0LWNsaWVudC5jOjE2MzY6Mjogd2FybmluZzog
VXNlIG9mIG1lbW9yeSBhZnRlciBpdCBpcyBmcmVlZAogICAgICAgIGRpc2NvdmVyX2FsbChvcCk7
CiAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgpzcmMvc2hhcmVkL2dhdHQtY2xpZW50LmM6MjE0MDo2
OiB3YXJuaW5nOiBVc2Ugb2YgbWVtb3J5IGFmdGVyIGl0IGlzIGZyZWVkCiAgICAgICAgaWYgKHJl
YWRfZGJfaGFzaChvcCkpIHsKICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgpzcmMvc2hhcmVk
L2dhdHQtY2xpZW50LmM6MjE0ODo4OiB3YXJuaW5nOiBVc2Ugb2YgbWVtb3J5IGFmdGVyIGl0IGlz
IGZyZWVkCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZGlzY292ZXJ5X29wX3JlZihvcCksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn4Kc3JjL3NoYXJl
ZC9nYXR0LWNsaWVudC5jOjMyMzc6Mjogd2FybmluZzogVXNlIG9mIG1lbW9yeSBhZnRlciBpdCBp
cyBmcmVlZAogICAgICAgIGNvbXBsZXRlX3dyaXRlX2xvbmdfb3AocmVxLCBzdWNjZXNzLCAwLCBm
YWxzZSk7CiAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgpzcmMvc2hhcmVkL2dhdHQtY2xpZW50LmM6MzI1OToyOiB3YXJuaW5nOiBVc2Ugb2YgbWVt
b3J5IGFmdGVyIGl0IGlzIGZyZWVkCiAgICAgICAgcmVxdWVzdF91bnJlZihyZXEpOwogICAgICAg
IF5+fn5+fn5+fn5+fn5+fn5+fgoxMiB3YXJuaW5ncyBnZW5lcmF0ZWQuCnNyYy9zaGFyZWQvc2hl
bGwuYzoxMzMxOjEzOiB3YXJuaW5nOiBBY2Nlc3MgdG8gZmllbGQgJ29wdGlvbnMnIHJlc3VsdHMg
aW4gYSBkZXJlZmVyZW5jZSBvZiBhIG51bGwgcG9pbnRlciAobG9hZGVkIGZyb20gdmFyaWFibGUg
J29wdCcpCiAgICAgICAgICAgICAgICAgICAgICAgIGlmIChjICE9IG9wdC0+b3B0aW9uc1tpbmRl
eCAtIG9mZnNldF0udmFsKSB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+
fn5+fn5+fgoxIHdhcm5pbmcgZ2VuZXJhdGVkLgpzcmMvc2hhcmVkL2dhdHQtY2xpZW50LmM6NDUx
OjIxOiB3YXJuaW5nOiBVc2Ugb2YgbWVtb3J5IGFmdGVyIGl0IGlzIGZyZWVkCiAgICAgICAgZ2F0
dF9kYl91bnJlZ2lzdGVyKG9wLT5jbGllbnQtPmRiLCBvcC0+ZGJfaWQpOwogICAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+fn5+fn5+CnNyYy9zaGFyZWQvZ2F0dC1jbGllbnQuYzo2OTY6Mjog
d2FybmluZzogVXNlIG9mIG1lbW9yeSBhZnRlciBpdCBpcyBmcmVlZAogICAgICAgIGRpc2NvdmVy
eV9vcF9jb21wbGV0ZShvcCwgZmFsc2UsIGF0dF9lY29kZSk7CiAgICAgICAgXn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgpzcmMvc2hhcmVkL2dhdHQtY2xpZW50LmM6
OTkzOjI6IHdhcm5pbmc6IFVzZSBvZiBtZW1vcnkgYWZ0ZXIgaXQgaXMgZnJlZWQKICAgICAgICBk
aXNjb3Zlcnlfb3BfY29tcGxldGUob3AsIHN1Y2Nlc3MsIGF0dF9lY29kZSk7CiAgICAgICAgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CnNyYy9zaGFyZWQvZ2F0
dC1jbGllbnQuYzoxMDk5OjI6IHdhcm5pbmc6IFVzZSBvZiBtZW1vcnkgYWZ0ZXIgaXQgaXMgZnJl
ZWQKICAgICAgICBkaXNjb3Zlcnlfb3BfY29tcGxldGUob3AsIHN1Y2Nlc3MsIGF0dF9lY29kZSk7
CiAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CnNy
Yy9zaGFyZWQvZ2F0dC1jbGllbnQuYzoxMjkxOjI6IHdhcm5pbmc6IFVzZSBvZiBtZW1vcnkgYWZ0
ZXIgaXQgaXMgZnJlZWQKICAgICAgICBkaXNjb3Zlcnlfb3BfY29tcGxldGUob3AsIHN1Y2Nlc3Ms
IGF0dF9lY29kZSk7CiAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+CnNyYy9zaGFyZWQvZ2F0dC1jbGllbnQuYzoxMzU2OjI6IHdhcm5pbmc6IFVzZSBv
ZiBtZW1vcnkgYWZ0ZXIgaXQgaXMgZnJlZWQKICAgICAgICBkaXNjb3Zlcnlfb3BfY29tcGxldGUo
b3AsIHN1Y2Nlc3MsIGF0dF9lY29kZSk7CiAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+CnNyYy9zaGFyZWQvZ2F0dC1jbGllbnQuYzoxNjMxOjY6IHdh
cm5pbmc6IFVzZSBvZiBtZW1vcnkgYWZ0ZXIgaXQgaXMgZnJlZWQKICAgICAgICBpZiAocmVhZF9k
Yl9oYXNoKG9wKSkgewogICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+CnNyYy9zaGFyZWQvZ2F0
dC1jbGllbnQuYzoxNjM2OjI6IHdhcm5pbmc6IFVzZSBvZiBtZW1vcnkgYWZ0ZXIgaXQgaXMgZnJl
ZWQKICAgICAgICBkaXNjb3Zlcl9hbGwob3ApOwogICAgICAgIF5+fn5+fn5+fn5+fn5+fn4Kc3Jj
L3NoYXJlZC9nYXR0LWNsaWVudC5jOjIxNDA6Njogd2FybmluZzogVXNlIG9mIG1lbW9yeSBhZnRl
ciBpdCBpcyBmcmVlZAogICAgICAgIGlmIChyZWFkX2RiX2hhc2gob3ApKSB7CiAgICAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn4Kc3JjL3NoYXJlZC9nYXR0LWNsaWVudC5jOjIxNDg6ODogd2Fybmlu
ZzogVXNlIG9mIG1lbW9yeSBhZnRlciBpdCBpcyBmcmVlZAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRpc2NvdmVyeV9vcF9yZWYob3ApLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+
fn5+fn5+fn5+fn5+fn5+fn5+CnNyYy9zaGFyZWQvZ2F0dC1jbGllbnQuYzozMjM3OjI6IHdhcm5p
bmc6IFVzZSBvZiBtZW1vcnkgYWZ0ZXIgaXQgaXMgZnJlZWQKICAgICAgICBjb21wbGV0ZV93cml0
ZV9sb25nX29wKHJlcSwgc3VjY2VzcywgMCwgZmFsc2UpOwogICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4Kc3JjL3NoYXJlZC9nYXR0LWNsaWVudC5j
OjMyNTk6Mjogd2FybmluZzogVXNlIG9mIG1lbW9yeSBhZnRlciBpdCBpcyBmcmVlZAogICAgICAg
IHJlcXVlc3RfdW5yZWYocmVxKTsKICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn4KMTIgd2Fybmlu
Z3MgZ2VuZXJhdGVkLgpzcmMvc2hhcmVkL3NoZWxsLmM6MTMzMToxMzogd2FybmluZzogQWNjZXNz
IHRvIGZpZWxkICdvcHRpb25zJyByZXN1bHRzIGluIGEgZGVyZWZlcmVuY2Ugb2YgYSBudWxsIHBv
aW50ZXIgKGxvYWRlZCBmcm9tIHZhcmlhYmxlICdvcHQnKQogICAgICAgICAgICAgICAgICAgICAg
ICBpZiAoYyAhPSBvcHQtPm9wdGlvbnNbaW5kZXggLSBvZmZzZXRdLnZhbCkgewogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn4KMSB3YXJuaW5nIGdlbmVyYXRlZC4K
dG9vbHMvaGNpYXR0YWNoLmM6ODE2Ojc6IHdhcm5pbmc6IEFsdGhvdWdoIHRoZSB2YWx1ZSBzdG9y
ZWQgdG8gJ24nIGlzIHVzZWQgaW4gdGhlIGVuY2xvc2luZyBleHByZXNzaW9uLCB0aGUgdmFsdWUg
aXMgbmV2ZXIgYWN0dWFsbHkgcmVhZCBmcm9tICduJwogICAgICAgIGlmICgobiA9IHJlYWRfaGNp
X2V2ZW50KGZkLCByZXNwLCAxMCkpIDwgMCkgewogICAgICAgICAgICAgXiAgIH5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4KdG9vbHMvaGNpYXR0YWNoLmM6ODY0Ojc6IHdhcm5pbmc6IEFsdGhv
dWdoIHRoZSB2YWx1ZSBzdG9yZWQgdG8gJ24nIGlzIHVzZWQgaW4gdGhlIGVuY2xvc2luZyBleHBy
ZXNzaW9uLCB0aGUgdmFsdWUgaXMgbmV2ZXIgYWN0dWFsbHkgcmVhZCBmcm9tICduJwogICAgICAg
IGlmICgobiA9IHJlYWRfaGNpX2V2ZW50KGZkLCByZXNwLCA0KSkgPCAwKSB7CiAgICAgICAgICAg
ICBeICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CnRvb2xzL2hjaWF0dGFjaC5jOjg4Njo4
OiB3YXJuaW5nOiBBbHRob3VnaCB0aGUgdmFsdWUgc3RvcmVkIHRvICduJyBpcyB1c2VkIGluIHRo
ZSBlbmNsb3NpbmcgZXhwcmVzc2lvbiwgdGhlIHZhbHVlIGlzIG5ldmVyIGFjdHVhbGx5IHJlYWQg
ZnJvbSAnbicKICAgICAgICAgICAgICAgIGlmICgobiA9IHJlYWRfaGNpX2V2ZW50KGZkLCByZXNw
LCAxMCkpIDwgMCkgewogICAgICAgICAgICAgICAgICAgICBeICAgfn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fgp0b29scy9oY2lhdHRhY2guYzo5MDg6Nzogd2FybmluZzogQWx0aG91Z2ggdGhl
IHZhbHVlIHN0b3JlZCB0byAnbicgaXMgdXNlZCBpbiB0aGUgZW5jbG9zaW5nIGV4cHJlc3Npb24s
IHRoZSB2YWx1ZSBpcyBuZXZlciBhY3R1YWxseSByZWFkIGZyb20gJ24nCiAgICAgICAgaWYgKChu
ID0gcmVhZF9oY2lfZXZlbnQoZmQsIHJlc3AsIDQpKSA8IDApIHsKICAgICAgICAgICAgIF4gICB+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KdG9vbHMvaGNpYXR0YWNoLmM6OTI5Ojc6IHdhcm5p
bmc6IEFsdGhvdWdoIHRoZSB2YWx1ZSBzdG9yZWQgdG8gJ24nIGlzIHVzZWQgaW4gdGhlIGVuY2xv
c2luZyBleHByZXNzaW9uLCB0aGUgdmFsdWUgaXMgbmV2ZXIgYWN0dWFsbHkgcmVhZCBmcm9tICdu
JwogICAgICAgIGlmICgobiA9IHJlYWRfaGNpX2V2ZW50KGZkLCByZXNwLCA0KSkgPCAwKSB7CiAg
ICAgICAgICAgICBeICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CnRvb2xzL2hjaWF0dGFj
aC5jOjk3Mzo3OiB3YXJuaW5nOiBBbHRob3VnaCB0aGUgdmFsdWUgc3RvcmVkIHRvICduJyBpcyB1
c2VkIGluIHRoZSBlbmNsb3NpbmcgZXhwcmVzc2lvbiwgdGhlIHZhbHVlIGlzIG5ldmVyIGFjdHVh
bGx5IHJlYWQgZnJvbSAnbicKICAgICAgICBpZiAoKG4gPSByZWFkX2hjaV9ldmVudChmZCwgcmVz
cCwgNikpIDwgMCkgewogICAgICAgICAgICAgXiAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fgo2IHdhcm5pbmdzIGdlbmVyYXRlZC4Kc3JjL291aS5jOjUwOjI6IHdhcm5pbmc6IFZhbHVlIHN0
b3JlZCB0byAnaHdkYicgaXMgbmV2ZXIgcmVhZAogICAgICAgIGh3ZGIgPSB1ZGV2X2h3ZGJfdW5y
ZWYoaHdkYik7CiAgICAgICAgXiAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fgpzcmMvb3VpLmM6
NTM6Mjogd2FybmluZzogVmFsdWUgc3RvcmVkIHRvICd1ZGV2JyBpcyBuZXZlciByZWFkCiAgICAg
ICAgdWRldiA9IHVkZXZfdW5yZWYodWRldik7CiAgICAgICAgXiAgICAgIH5+fn5+fn5+fn5+fn5+
fn4KMiB3YXJuaW5ncyBnZW5lcmF0ZWQuCnRvb2xzL2hjaWR1bXAuYzoxODA6OTogd2FybmluZzog
UG90ZW50aWFsIGxlYWsgb2YgbWVtb3J5IHBvaW50ZWQgdG8gYnkgJ2RwJwogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGlmIChmZHNbaV0uZmQgPT0gc29jaykKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn5+CnRvb2xzL2hjaWR1bXAuYzoyNDg6MTc6IHdhcm5pbmc6
IEFzc2lnbmVkIHZhbHVlIGlzIGdhcmJhZ2Ugb3IgdW5kZWZpbmVkCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZGgtPnRzX3NlYyAgPSBodG9ibChmcm0udHMudHZfc2VjKTsKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIH5+fn5+fn5+fn5+fn5+fn5+
fn5+CnRvb2xzL2hjaWR1bXAuYzozMjY6OTogd2FybmluZzogMXN0IGZ1bmN0aW9uIGNhbGwgYXJn
dW1lbnQgaXMgYW4gdW5pbml0aWFsaXplZCB2YWx1ZQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGlmIChiZTMydG9oKGRwLmZsYWdzKSAmIDB4MDIpIHsKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn4KL3Vzci9pbmNsdWRlL2VuZGlhbi5o
OjQ2OjIyOiBub3RlOiBleHBhbmRlZCBmcm9tIG1hY3JvICdiZTMydG9oJwojICBkZWZpbmUgYmUz
MnRvaCh4KSBfX2Jzd2FwXzMyICh4KQogICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+
fgp0b29scy9oY2lkdW1wLmM6MzQxOjIwOiB3YXJuaW5nOiAxc3QgZnVuY3Rpb24gY2FsbCBhcmd1
bWVudCBpcyBhbiB1bmluaXRpYWxpemVkIHZhbHVlCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZnJtLmRhdGFfbGVuID0gYmUzMnRvaChkcC5sZW4pOwogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fgovdXNyL2luY2x1ZGUv
ZW5kaWFuLmg6NDY6MjI6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8gJ2JlMzJ0b2gnCiMgIGRl
ZmluZSBiZTMydG9oKHgpIF9fYnN3YXBfMzIgKHgpCiAgICAgICAgICAgICAgICAgICAgIF5+fn5+
fn5+fn5+fn5+CnRvb2xzL2hjaWR1bXAuYzozNDY6MTQ6IHdhcm5pbmc6IDFzdCBmdW5jdGlvbiBj
YWxsIGFyZ3VtZW50IGlzIGFuIHVuaW5pdGlhbGl6ZWQgdmFsdWUKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBvcGNvZGUgPSBiZTMydG9oKGRwLmZsYWdzKSAmIDB4ZmZmZjsKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fgovdXNy
L2luY2x1ZGUvZW5kaWFuLmg6NDY6MjI6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8gJ2JlMzJ0
b2gnCiMgIGRlZmluZSBiZTMydG9oKHgpIF9fYnN3YXBfMzIgKHgpCiAgICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+CnRvb2xzL2hjaWR1bXAuYzozODQ6MTc6IHdhcm5pbmc6IEFzc2ln
bmVkIHZhbHVlIGlzIGdhcmJhZ2Ugb3IgdW5kZWZpbmVkCiAgICAgICAgICAgICAgICAgICAgICAg
IGZybS5kYXRhX2xlbiA9IGJ0b2hzKGRoLmxlbik7CiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBeIH5+fn5+fn5+fn5+fn4KdG9vbHMvaGNpZHVtcC5jOjM5NDoxMTogd2Fybmlu
ZzogQXNzaWduZWQgdmFsdWUgaXMgZ2FyYmFnZSBvciB1bmRlZmluZWQKICAgICAgICAgICAgICAg
IGZybS5sZW4gPSBmcm0uZGF0YV9sZW47CiAgICAgICAgICAgICAgICAgICAgICAgIF4gfn5+fn5+
fn5+fn5+CnRvb2xzL2hjaWR1bXAuYzozOTg6OTogd2FybmluZzogMXN0IGZ1bmN0aW9uIGNhbGwg
YXJndW1lbnQgaXMgYW4gdW5pbml0aWFsaXplZCB2YWx1ZQogICAgICAgICAgICAgICAgICAgICAg
ICB0cyA9IGJlNjR0b2gocGgudHMpOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+
fn5+fn5+fn5+Ci91c3IvaW5jbHVkZS9lbmRpYW4uaDo1MToyMjogbm90ZTogZXhwYW5kZWQgZnJv
bSBtYWNybyAnYmU2NHRvaCcKIyAgZGVmaW5lIGJlNjR0b2goeCkgX19ic3dhcF82NCAoeCkKICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn4KdG9vbHMvaGNpZHVtcC5jOjQwMzoxMzog
d2FybmluZzogMXN0IGZ1bmN0aW9uIGNhbGwgYXJndW1lbnQgaXMgYW4gdW5pbml0aWFsaXplZCB2
YWx1ZQogICAgICAgICAgICAgICAgICAgICAgICBmcm0uaW4gPSBiZTMydG9oKGRwLmZsYWdzKSAm
IDB4MDE7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+
Ci91c3IvaW5jbHVkZS9lbmRpYW4uaDo0NjoyMjogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNybyAn
YmUzMnRvaCcKIyAgZGVmaW5lIGJlMzJ0b2goeCkgX19ic3dhcF8zMiAoeCkKICAgICAgICAgICAg
ICAgICAgICAgXn5+fn5+fn5+fn5+fn4KdG9vbHMvaGNpZHVtcC5jOjQwODoxMTogd2FybmluZzog
QXNzaWduZWQgdmFsdWUgaXMgZ2FyYmFnZSBvciB1bmRlZmluZWQKICAgICAgICAgICAgICAgICAg
ICAgICAgZnJtLmluID0gZGguaW47CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIH5+
fn5+CnRvb2xzL2hjaWR1bXAuYzo0Mzc6Nzogd2FybmluZzogTnVsbCBwb2ludGVyIHBhc3NlZCB0
byAxc3QgcGFyYW1ldGVyIGV4cGVjdGluZyAnbm9ubnVsbCcKICAgICAgICBmZCA9IG9wZW4oZmls
ZSwgb3Blbl9mbGFncywgMDY0NCk7CiAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+CjExIHdhcm5pbmdzIGdlbmVyYXRlZC4KdG9vbHMvcmZjb21tLmM6MjM0OjM6IHdhcm5p
bmc6IFZhbHVlIHN0b3JlZCB0byAnaScgaXMgbmV2ZXIgcmVhZAogICAgICAgICAgICAgICAgaSA9
IGV4ZWN2cChjbWRhcmd2WzBdLCBjbWRhcmd2KTsKICAgICAgICAgICAgICAgIF4gICB+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4KdG9vbHMvcmZjb21tLmM6MjM0Ojc6IHdhcm5pbmc6IE51bGwg
cG9pbnRlciBwYXNzZWQgdG8gMXN0IHBhcmFtZXRlciBleHBlY3RpbmcgJ25vbm51bGwnCiAgICAg
ICAgICAgICAgICBpID0gZXhlY3ZwKGNtZGFyZ3ZbMF0sIGNtZGFyZ3YpOwogICAgICAgICAgICAg
ICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgp0b29scy9yZmNvbW0uYzozNTQ6ODog
d2FybmluZzogQWx0aG91Z2ggdGhlIHZhbHVlIHN0b3JlZCB0byAnZmQnIGlzIHVzZWQgaW4gdGhl
IGVuY2xvc2luZyBleHByZXNzaW9uLCB0aGUgdmFsdWUgaXMgbmV2ZXIgYWN0dWFsbHkgcmVhZCBm
cm9tICdmZCcKICAgICAgICAgICAgICAgIGlmICgoZmQgPSBvcGVuKGRldm5hbWUsIE9fUkRPTkxZ
IHwgT19OT0NUVFkpKSA8IDApIHsKICAgICAgICAgICAgICAgICAgICAgXiAgICB+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CnRvb2xzL3JmY29tbS5jOjQ5NzoxNDogd2FybmluZzog
QXNzaWduZWQgdmFsdWUgaXMgZ2FyYmFnZSBvciB1bmRlZmluZWQKICAgICAgICByZXEuY2hhbm5l
bCA9IHJhZGRyLnJjX2NoYW5uZWw7CiAgICAgICAgICAgICAgICAgICAgXiB+fn5+fn5+fn5+fn5+
fn5+CnRvb2xzL3JmY29tbS5jOjUxNTo4OiB3YXJuaW5nOiBBbHRob3VnaCB0aGUgdmFsdWUgc3Rv
cmVkIHRvICdmZCcgaXMgdXNlZCBpbiB0aGUgZW5jbG9zaW5nIGV4cHJlc3Npb24sIHRoZSB2YWx1
ZSBpcyBuZXZlciBhY3R1YWxseSByZWFkIGZyb20gJ2ZkJwogICAgICAgICAgICAgICAgaWYgKChm
ZCA9IG9wZW4oZGV2bmFtZSwgT19SRE9OTFkgfCBPX05PQ1RUWSkpIDwgMCkgewogICAgICAgICAg
ICAgICAgICAgICBeICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KNSB3YXJu
aW5ncyBnZW5lcmF0ZWQuCnNyYy9zZHAteG1sLmM6MTI2OjEwOiB3YXJuaW5nOiBBc3NpZ25lZCB2
YWx1ZSBpcyBnYXJiYWdlIG9yIHVuZGVmaW5lZAogICAgICAgICAgICAgICAgYnVmWzFdID0gZGF0
YVtpICsgMV07CiAgICAgICAgICAgICAgICAgICAgICAgXiB+fn5+fn5+fn5+fgpzcmMvc2RwLXht
bC5jOjMwMDoxMTogd2FybmluZzogQXNzaWduZWQgdmFsdWUgaXMgZ2FyYmFnZSBvciB1bmRlZmlu
ZWQKICAgICAgICAgICAgICAgICAgICAgICAgYnVmWzFdID0gZGF0YVtpICsgMV07CiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeIH5+fn5+fn5+fn5+CnNyYy9zZHAteG1sLmM6MzM4OjEx
OiB3YXJuaW5nOiBBc3NpZ25lZCB2YWx1ZSBpcyBnYXJiYWdlIG9yIHVuZGVmaW5lZAogICAgICAg
ICAgICAgICAgICAgICAgICBidWZbMV0gPSBkYXRhW2kgKyAxXTsKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF4gfn5+fn5+fn5+fn4KMyB3YXJuaW5ncyBnZW5lcmF0ZWQuCnRvb2xzL2Np
cHRvb2wuYzozNTA6Nzogd2FybmluZzogNXRoIGZ1bmN0aW9uIGNhbGwgYXJndW1lbnQgaXMgYW4g
dW5pbml0aWFsaXplZCB2YWx1ZQogICAgICAgIHNrID0gZG9fY29ubmVjdChjdGwsIGRldl9pZCwg
JnNyYywgJmRzdCwgcHNtLCAoMSA8PCBDTVRQX0xPT1BCQUNLKSk7CiAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fgoxIHdhcm5pbmcgZ2VuZXJhdGVkLgp0b29scy9zZHB0b29sLmM6OTQxOjI2OiB3YXJuaW5nOiBS
ZXN1bHQgb2YgJ21hbGxvYycgaXMgY29udmVydGVkIHRvIGEgcG9pbnRlciBvZiB0eXBlICd1aW50
MzJfdCcsIHdoaWNoIGlzIGluY29tcGF0aWJsZSB3aXRoIHNpemVvZiBvcGVyYW5kIHR5cGUgJ2lu
dCcKICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgKnZhbHVlX2ludCA9IG1hbGxvYyhz
aXplb2YoaW50KSk7CiAgICAgICAgICAgICAgICAgICAgICAgIH5+fn5+fn5+fn4gICAgICAgICAg
ICBefn5+fn4gfn5+fn5+fn5+fn4KdG9vbHMvc2RwdG9vbC5jOjk4MDo0OiB3YXJuaW5nOiAxc3Qg
ZnVuY3Rpb24gY2FsbCBhcmd1bWVudCBpcyBhbiB1bmluaXRpYWxpemVkIHZhbHVlCiAgICAgICAg
ICAgICAgICAgICAgICAgIGZyZWUoYWxsb2NBcnJheVtpXSk7CiAgICAgICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KdG9vbHMvc2RwdG9vbC5jOjM3Nzc6Mjogd2FybmluZzog
UG90ZW50aWFsIGxlYWsgb2YgbWVtb3J5IHBvaW50ZWQgdG8gYnkgJ3NpLm5hbWUnCiAgICAgICAg
cmV0dXJuIGFkZF9zZXJ2aWNlKDAsICZzaSk7CiAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn4KdG9vbHMvc2RwdG9vbC5jOjQxMTI6NDogd2FybmluZzogUG90ZW50aWFsIGxlYWsgb2Yg
bWVtb3J5IHBvaW50ZWQgdG8gYnkgJ2NvbnRleHQuc3ZjJwogICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gLTE7CiAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fgo0IHdhcm5pbmdz
IGdlbmVyYXRlZC4KdG9vbHMvaXNvLXRlc3Rlci5jOiBJbiBmdW5jdGlvbiDigJhpc29fdHhfdGlt
ZXN0YW1waW5n4oCZOgp0b29scy9pc28tdGVzdGVyLmM6MjEzMDo5OiBlcnJvcjogdmFyaWFibGUg
4oCYc2/igJkgaGFzIGluaXRpYWxpemVyIGJ1dCBpbmNvbXBsZXRlIHR5cGUKIDIxMzAgfCAgc3Ry
dWN0IHNvX3RpbWVzdGFtcGluZyBzbyA9IHsKICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fgp0b29scy9pc28tdGVzdGVyLmM6MjEzMTo0OiBlcnJvcjog4oCYc3RydWN0IHNvX3RpbWVzdGFt
cGluZ+KAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmGZsYWdz4oCZCiAyMTMxIHwgICAuZmxhZ3Mg
PSBpc29kYXRhLT5zb190aW1lc3RhbXBpbmcsCiAgICAgIHwgICAgXn5+fn4KdG9vbHMvaXNvLXRl
c3Rlci5jOjIxMzE6MTI6IGVycm9yOiBleGNlc3MgZWxlbWVudHMgaW4gc3RydWN0IGluaXRpYWxp
emVyIFstV2Vycm9yXQogMjEzMSB8ICAgLmZsYWdzID0gaXNvZGF0YS0+c29fdGltZXN0YW1waW5n
LAogICAgICB8ICAgICAgICAgICAgXn5+fn5+fgp0b29scy9pc28tdGVzdGVyLmM6MjEzMToxMjog
bm90ZTogKG5lYXIgaW5pdGlhbGl6YXRpb24gZm9yIOKAmHNv4oCZKQp0b29scy9pc28tdGVzdGVy
LmM6MjEzMDoyNTogZXJyb3I6IHN0b3JhZ2Ugc2l6ZSBvZiDigJhzb+KAmSBpc27igJl0IGtub3du
CiAyMTMwIHwgIHN0cnVjdCBzb190aW1lc3RhbXBpbmcgc28gPSB7CiAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgXn4KdG9vbHMvaXNvLXRlc3Rlci5jOjIxMzA6MjU6IGVycm9yOiB1bnVz
ZWQgdmFyaWFibGUg4oCYc2/igJkgWy1XZXJyb3I9dW51c2VkLXZhcmlhYmxlXQpjYzE6IGFsbCB3
YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwptYWtlWzFdOiAqKiogW01ha2VmaWxlOjc4
MDc6IHRvb2xzL2lzby10ZXN0ZXIub10gRXJyb3IgMQptYWtlWzFdOiAqKiogV2FpdGluZyBmb3Ig
dW5maW5pc2hlZCBqb2JzLi4uLgptYWtlOiAqKiogW01ha2VmaWxlOjQ2NDk6IGFsbF0gRXJyb3Ig
MgoKCi0tLQpSZWdhcmRzLApMaW51eCBCbHVldG9vdGgKCg==

--===============7424925973983786958==--

