Return-Path: <linux-bluetooth+bounces-19533-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMyjJklOo2nW/AQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19533-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sat, 28 Feb 2026 21:21:29 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CE11C8443
	for <lists+linux-bluetooth@lfdr.de>; Sat, 28 Feb 2026 21:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE7D1318B93C
	for <lists+linux-bluetooth@lfdr.de>; Sat, 28 Feb 2026 19:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87A5379EEC;
	Sat, 28 Feb 2026 18:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEmReCAt"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3D0379EEE
	for <linux-bluetooth@vger.kernel.org>; Sat, 28 Feb 2026 18:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772301963; cv=none; b=ETVquz3bna8k2LMvgTMMNmB1vAO6SOsocB42X4O5DZPOtCJ2ha/aJyezpEy2atRm9gJ0gRIhgyYTzYReArGukZAl4oim+vlGKp2DBwZzmwwjgA9C1HN/TGddC3V5aX2zxSiWiGms3j7O9Geke4Jdh77F/HsQFPZzDmiqI/kbIAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772301963; c=relaxed/simple;
	bh=dk+KZM/vfVpmPXmPdg0yY7xTVwdNf2rnF7tWG9T6SeQ=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=oDpseRKA50Z+uzCJhTHJ5LfzSTvkRLiewDCGryZtgD7TegsF89AHR+zyY2p036qsLJ2NXPx6MDOi0JkhhoJg0M8kUptKVaeTwlr3S5Uj5a5/8d/RVyRSZ06X0es7LCnhM+oHf573MhMdlIoEFxOK7NmmQvflFVG769pQpl34cFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEmReCAt; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8ca01dc7d40so337127385a.1
        for <linux-bluetooth@vger.kernel.org>; Sat, 28 Feb 2026 10:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772301961; x=1772906761; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2aXNCkOQEe2vCuMqpcRraVPkz9ikyRTyeYa5I3KlJHs=;
        b=jEmReCAtD4UsAX9dVzyL0x/Rpavf3pfP+E6Ubk7CeH+rnsoJ0DCOnD6TLitg4xFnMq
         tbkYQtDetR+IkN0KvLjOZcw89MQHY5E31Z75YNhl+e8Uwst0j+6P0thlQhYre/L/FtBT
         3xsRQ9nCEAi5q5kdIJUjynj7bjpY51n68wUHgNASHqkzN8S834tu+aihWuvhiZlBqfM2
         /Z2yW/6FT+DYH7fwEACxBne2jI0aAcg4Gw35F2EXdShDi5hAAi6+au3y22/86XNn2Y95
         gKek82cUbYFjaDHy3MYPRF3FVz/DtKO81QI+NlDcEghwNtLezPITvs8Ml5trJjo+eH/x
         WEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772301961; x=1772906761;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aXNCkOQEe2vCuMqpcRraVPkz9ikyRTyeYa5I3KlJHs=;
        b=srJbo6/xxgB+WIp7fvST0i/ItRevy1Y9gO/HU1+TQ/xIbFX8AFy92OEsQg/MClpeOi
         JRLY+sVUEL6y3BHehyBy+1nqHix5U49MbQma6sZ+qdyt9DmOxdvU9jfAPWOwx0xmZnUz
         jDqLVBf1GV8RJJ0ypzA4pLhFxuPWnHqz2x/UoKLYvRhUS2gRPb8F/yB6Wtw7njXtE+pX
         xnhueHbjJQ8tA8T+PK/ngibSZXdreDrBE4zlYgAngnpF8auRmqRRTbUdaovCmHEEaHLS
         y4Kx146Um+C+dwwKzJmnTtCPgrUsBmFOWqNs2eZagPEfrRQC0xc606qOg6tdXoiKuui+
         uHZg==
X-Gm-Message-State: AOJu0YxlTmOtXTBQ2m/pZhGfdYX+J5ZixVxVh+hON8JMfFbXNLNaERBY
	06pUtHA7JR7Tzbo4RaYofBOEAtLn0fAlTE0jGmNP+OnB9FRYlnZlUbWBJWvKng==
X-Gm-Gg: ATEYQzxf1vtR4viJrRtfJkKk3mjq+GD5KHLvPmwYo1iggFe0XFpOSgu8+pptoccuFrx
	9sQzaxoXtFOg1zu5a9qDYi82degt9Divlw5O8G1a4shfnXL4ufAwnariAXMO65vCT6gqeY2A7Yh
	xhT06BkK/PILxk6HljfCy3Bl0qqDShF4MePIHMth62gdwn7aL8ovl1+da4oMFYkJcezYFt+dAgT
	CRTK+85F2D7jIiNz/GXfOUfd4utnw9bCkp9UJhWh7qhZEoR3y+uLK9kMzuv+N2nBUqfYVFOi0c4
	0Q9WMQ1EOU9Je4a29vrOsQgXu6CmYeJdQqQRGjkp5C+pu6tsM/fHoUXGA6UEsQrc7wuCiLEhwLu
	+6q/MD0bA9i0rcIraVKZpGGZHPtUpr+vOb5fXxVkRw2zXBdwRUiDUcvptLQbmU39f2VXF1mYoJM
	y0rlG+Xiau9TVas+RHA26jOSkJ529hOWw=
X-Received: by 2002:a05:620a:2802:b0:8cb:395e:2b3b with SMTP id af79cd13be357-8cbc8e8b69dmr846508985a.35.1772301960768;
        Sat, 28 Feb 2026 10:06:00 -0800 (PST)
Received: from [172.17.0.2] ([172.177.209.211])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf732bc1sm757552485a.46.2026.02.28.10.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 10:06:00 -0800 (PST)
Message-ID: <69a32e88.050a0220.1bc547.e747@mx.google.com>
Date: Sat, 28 Feb 2026 10:06:00 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============3180188976884167597=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, ericterminal@gmail.com
Subject: RE: [v2] Bluetooth: HIDP: cap report descriptor size in HID setup
In-Reply-To: <20260228172657.53040-1-ericterminal@gmail.com>
References: <20260228172657.53040-1-ericterminal@gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-19533-lists,linux-bluetooth=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mx.google.com:mid,vger.kernel.org:replyto,checkpatch.pl:url]
X-Rspamd-Queue-Id: 18CE11C8443
X-Rspamd-Action: no action

--===============3180188976884167597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1059479

---Test result---

Test Summary:
CheckPatch                    PENDING   0.32 seconds
GitLint                       PENDING   0.19 seconds
SubjectPrefix                 PASS      0.13 seconds
BuildKernel                   PASS      26.70 seconds
CheckAllWarning               PASS      29.21 seconds
CheckSparse                   WARNING   33.20 seconds
BuildKernel32                 PASS      25.72 seconds
TestRunnerSetup               PASS      569.31 seconds
TestRunner_l2cap-tester       FAIL      34.63 seconds
TestRunner_iso-tester         FAIL      65.28 seconds
TestRunner_bnep-tester        PASS      6.43 seconds
TestRunner_mgmt-tester        FAIL      124.24 seconds
TestRunner_rfcomm-tester      PASS      9.57 seconds
TestRunner_sco-tester         FAIL      14.69 seconds
TestRunner_ioctl-tester       PASS      10.30 seconds
TestRunner_mesh-tester        FAIL      11.42 seconds
TestRunner_smp-tester         PASS      8.82 seconds
TestRunner_userchan-tester    PASS      6.75 seconds
IncrementalBuild              PENDING   0.71 seconds

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
Test: CheckSparse - WARNING
Desc: Run sparse tool with linux kernel
Output:
net/bluetooth/hidp/core.c:1477:1: error: bad constant expressionnet/bluetooth/hidp/core.c:1478:1: error: bad constant expressionnet/bluetooth/hidp/core.c:1479:1: error: bad constant expressionnet/bluetooth/hidp/core.c:1480:1: error: bad constant expressionnet/bluetooth/hidp/core.c:1481:1: error: bad constant expressionnet/bluetooth/hidp/core.c:1481:1: error: bad constant expressionnet/bluetooth/hidp/core.c:1482:1: error: bad constant expression
##############################
Test: TestRunner_l2cap-tester - FAIL
Desc: Run l2cap-tester with test-runner
Output:
Total: 96, Passed: 94 (97.9%), Failed: 2, Not Run: 0

Failed Test Cases
L2CAP LE Client - Read 32k Success                   Timed out    2.398 seconds
L2CAP LE Client - RX Timestamping 32k                Timed out    1.891 seconds
##############################
Test: TestRunner_iso-tester - FAIL
Desc: Run iso-tester with test-runner
Output:
BUG: KASAN: slab-use-after-free in le_read_features_complete+0x7e/0x2b0
Total: 141, Passed: 141 (100.0%), Failed: 0, Not Run: 0
##############################
Test: TestRunner_mgmt-tester - FAIL
Desc: Run mgmt-tester with test-runner
Output:
Total: 494, Passed: 489 (99.0%), Failed: 1, Not Run: 4

Failed Test Cases
Read Exp Feature - Success                           Failed       0.112 seconds
##############################
Test: TestRunner_sco-tester - FAIL
Desc: Run sco-tester with test-runner
Output:
WARNING: possible circular locking dependency detected
BUG: sleeping function called from invalid context at net/core/sock.c:3782
Total: 30, Passed: 30 (100.0%), Failed: 0, Not Run: 0
##############################
Test: TestRunner_mesh-tester - FAIL
Desc: Run mesh-tester with test-runner
Output:
Total: 10, Passed: 8 (80.0%), Failed: 2, Not Run: 0

Failed Test Cases
Mesh - Send cancel - 1                               Timed out    1.786 seconds
Mesh - Send cancel - 2                               Timed out    1.996 seconds
##############################
Test: IncrementalBuild - PENDING
Desc: Incremental build with the patches in the series
Output:



---
Regards,
Linux Bluetooth


--===============3180188976884167597==--

