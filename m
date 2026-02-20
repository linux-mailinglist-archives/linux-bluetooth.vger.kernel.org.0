Return-Path: <linux-bluetooth+bounces-19253-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGhxGvCsmGlSKwMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19253-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 19:50:24 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D32F816A2F3
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 19:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC3033018583
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 18:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEAB36682B;
	Fri, 20 Feb 2026 18:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9pY9BUe"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6622189F30
	for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 18:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771613418; cv=none; b=AbBm20W7w8Pfe0VW89hQVOEJSSKFbJeIF8UebBgoqcRRyzbo/MTzKaALXW9qQNBAC5nemzD4/00xZoppiVCBi5qlKF6/HcPOEiLTJ9ONJkXZotkeOg3Qn3lfiTDXjQRYWWcKoLbQi3+oMJNCpCWDfV8f5Au2/iWjfFBnqPoHPh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771613418; c=relaxed/simple;
	bh=WQN/hPuVqc5wNEUr0uNDJdj19dtXMWTU4hkKHdTjtbQ=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=req4x+QK7ROHYW4igwSRG7QrWtoIGNWnVAyYlWOBARE7tIRHt+MAM6VSDSEsZbeB9UAc2ripM93AXKO2KsCj3tMv9emqzjW4FcsZ2qUvB18qSDmQsAYPGHpCPOTjwoIf2ml85n4tSqIHj2d/enMRPRQ+GBMdwZQm+/CqkZ8Suf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9pY9BUe; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-124afd03fd1so3327171c88.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 10:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771613416; x=1772218216; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wWM3dvEUSC1KFoJeuORbkiqYDOt90SuJs5GcHkdkAn4=;
        b=f9pY9BUeI0K8dWpcVL4QLb5AAhLhsRK6ZqeJfF88c300JyOriGiB9jX7rsYALV79TV
         P8kBzh9o8viIsXj4gEq4YtNa/+nOKbVXn93PHk+graMa9dESlUjXOh6Bggf+s7h6rUtc
         zPSqWypSA7ZZQojjiIDI38OPA9vfGuCmJ/mMGghDNZv9riqsaPr2JW4CE0EiFaM2xwcu
         /D0W0x7wSZbNIvY3/adQ1MKrPZ8Ckn0LBA8baH/6Wv3PY79qBZTIzEh3OEYYShaScuQq
         cJH67jqckqZ+fbvpGmNVtAoU2u1FnM6oqEwjd5WqLfFngACa+M300V7kkc9aN6gHBQow
         rPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771613416; x=1772218216;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWM3dvEUSC1KFoJeuORbkiqYDOt90SuJs5GcHkdkAn4=;
        b=eCaTjtpLorLRmDa0PRE7xCfarWfKQfvAZjGC0IHNJaHzhqhqddeLYVdOTJ3lCqQui9
         FaJrtQXynXNW+pYhB/5owodu4B0YfrbP8r1cvmylvFs3LvOcBh8KqXAfqSy/cmz6TBbw
         RB8J1b2tEXouZbRGvnc7TxJQfVNCMWlp1qQY71EXw19nrvm5A6jbkVTtcyTld6Hc0FYv
         uWYTZCtxhiAgg9D7TUPivzTp8G1fN7dzCrLpHpmMQsgk1lk1rGg2y1egUgMU7Ul0jt/W
         bV+ThxNipcXNtP45HQMsXHtJmXL5+5QtwzQEPH7agB3F+c5rRvxD+yaXJefxnEu0biUz
         DClQ==
X-Gm-Message-State: AOJu0YxZGC/Dg+CEnCVdbc2hEV0yZphSdaEbFVBpaBg/cJbA26l0cVo+
	as4HBeXOYIaimFGwUjE5SsGwzdtJTU1NTDhuxKiNLBv2LK5pkXr2TMwNLRE6sLB2
X-Gm-Gg: AZuq6aJmEJMmccY+GAxitMzcrY3MeeSWm7huMXWOO9AZi75SzGQBe0q9VZ43yZRzi9i
	ShxVLkib7FUL0uEPLWOIMuT5vV2hLRs1ggiw939CikAwUjEu1FRY37b/OLElH1cVFlfzumYhTqn
	cSpdtRLj2pXs0VuBtYRWJDLiSPyO9Z88jQQmq3DmCvGvA8fZlWZ0oGHGmHEB9MLqzkhk82CF4Il
	2qg3zl4Xk579KbIo+6Z/g7fo3Qr/m/K5/GZI+POoELtZ6AmS8iLQovaUjdFT7QcQ8vJZjeLbeWf
	LjbVFcR1+qHtm8eo30GX6+nZZEHjz708krkHAVzNi2IkjasgLBoUpo1W2SKNJemxhuLzw4t/gxD
	VuCW1jRAxoEzKyPUwX6kU6hv2sIO2A5RgFN9+uaDIO9VFMAKU1Uj49+xfG0a2rTiu6ZIplT3xnd
	n90hx9hS2C4eFIQJuDD+lf29Z/RvBi
X-Received: by 2002:a05:7022:f96:b0:119:e56b:91f2 with SMTP id a92af1059eb24-1276ad59485mr200253c88.35.1771613416454;
        Fri, 20 Feb 2026 10:50:16 -0800 (PST)
Received: from [172.17.0.2] ([20.169.74.230])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7b4c7sm298059c88.9.2026.02.20.10.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 10:50:15 -0800 (PST)
Message-ID: <6998ace7.050a0220.3daf40.2ba8@mx.google.com>
Date: Fri, 20 Feb 2026 10:50:15 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============3636718783085019203=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [BlueZ,v1] l2test: Attempt to use BT_SNDMTU if output MTU has been set
In-Reply-To: <20260220174044.3421300-1-luiz.dentz@gmail.com>
References: <20260220174044.3421300-1-luiz.dentz@gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-19253-lists,linux-bluetooth=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NEQ_ENVFROM(0.00)[blueztestbot@gmail.com,linux-bluetooth@vger.kernel.org];
	HAS_REPLYTO(0.00)[linux-bluetooth@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mx.google.com:mid,vger.kernel.org:replyto]
X-Rspamd-Queue-Id: D32F816A2F3
X-Rspamd-Action: no action

--===============3636718783085019203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1055977

---Test result---

Test Summary:
CheckPatch                    PENDING   0.44 seconds
GitLint                       PENDING   0.41 seconds
BuildEll                      PASS      17.77 seconds
BluezMake                     PASS      647.35 seconds
MakeCheck                     PASS      18.10 seconds
MakeDistcheck                 PASS      218.80 seconds
CheckValgrind                 PASS      278.31 seconds
CheckSmatch                   PASS      312.34 seconds
bluezmakeextell               PASS      168.30 seconds
IncrementalBuild              PENDING   0.32 seconds
ScanBuild                     PASS      914.40 seconds

Details
##############################
Test: CheckPatch - PENDING
Desc: Run checkpatch.pl script
Output:

##############################
Test: GitLint - PENDING
Desc: Run gitlint
Output:

##############################
Test: IncrementalBuild - PENDING
Desc: Incremental build with the patches in the series
Output:



---
Regards,
Linux Bluetooth


--===============3636718783085019203==--

