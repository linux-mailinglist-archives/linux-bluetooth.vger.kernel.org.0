Return-Path: <linux-bluetooth+bounces-19207-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIerA4lnl2nfxwIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19207-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Feb 2026 20:42:01 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CF316216E
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Feb 2026 20:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E24D4303BA44
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Feb 2026 19:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B1530CDB1;
	Thu, 19 Feb 2026 19:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikrkN9tr"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA3D30BF79
	for <linux-bluetooth@vger.kernel.org>; Thu, 19 Feb 2026 19:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771530086; cv=none; b=i0lpa724Kd3oQw2fmWslQ5/cmYgSiDzJ1mgObGmFLY2OuNVYFGhUc2nhpjZ+PRJHcgAd7gkebK4uliy+lGSSwDEd581OGRXF34cfENVHf3C/jAliYitTkEPdAT2klKLaaQq1u9aKR7x4QeKLlESHWqZ3hSKdhqQD8bK8c6dy36Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771530086; c=relaxed/simple;
	bh=55t0HgmG1tx/F6gjPsYhxPP1SQ6nJK+8WeNnKCVVbgM=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=fSdQclO9qKmWpieAOExIP4aCiqtf+eDNptGPXesMN6Zbkqj3E8bvlHtEYGhEcA7tYtrmHauHTPORFOY2qNA+8ZcVD+1Au51KpZxgakSKXB8eHJ9D9d/ox6BNtrhLZK+fytONII/Opb+LyMefdycI0iB8iSd/SAlMryS6hFnMWyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikrkN9tr; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8cb4081e82aso160801785a.1
        for <linux-bluetooth@vger.kernel.org>; Thu, 19 Feb 2026 11:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771530084; x=1772134884; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QCtgP9PLBoFZwunZSz024EqFoUIx55DzvGiU0t+rdto=;
        b=ikrkN9tr1g3GnjhYeasGHLYG27t0I01RB744WkQ/7GWTjAn/GAr9R6fbgzu9fBeHu+
         bzBP1GNqEYnzGfYoqLMKWT9vxTz1j3sUVDVPGTdAlCnMCDjU6n+zFU6M9pKVRh3/fqaQ
         aF5QdABapFfLMxHCXFGWHzfvRYv7KA9nrxpDXvlcCHYHtIvBVmARbu4i9sX3hPzsd4Cr
         hal3wdcRTsUzFcYL3nVSJpTD/N+Rv1MPgpPjURgelDD0NzpOmdpUK5FZuCv/9hls7G3h
         e27bINrD+9dDs11Y9BlpBRFFgrb+KdoX8SddUa6gQltmxPV10vZUeJwiaJrqGQ13ezSv
         kEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771530084; x=1772134884;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCtgP9PLBoFZwunZSz024EqFoUIx55DzvGiU0t+rdto=;
        b=lLYtCkcl/6r6yXfG1mJ3psd0tZe32JV/au5hxjK2UHLUk4xuCzaxt+HMvF/rBfXluJ
         GqtiwdO47C6RgKUX5/Sz2YAESh0lJe5ZJEct2jgGdl+nbJ7aAwBBTgJQdgJKY9fvD8/9
         WPBah4T+8wcfCWn98mdLuIXmyYXpZpiyxzgdmrTupbsS5vWPqcmAQ9sEjs1uCw54gwyK
         feiEyGUVxHYedtCYn8/mB4W6okjWUwqf74LA5liyg/thosQ3Arh0mpt/GHx7alk6+e73
         A1q1RCrfvl3deiUgNn6JNLQh+TehN2v6/ae8OFh3Bo4n1yLVLGkVSb4SwQUG2GlrHj7u
         nsPQ==
X-Gm-Message-State: AOJu0YxIR3qVn2KsQBdoDpBIOnNxw4MJvv0+R+WJUrjlomd0Djd7wFPt
	GWQ02iwvYrjjnMD0MlgeHOrAXQtE2W8HqYNwIG4Emrpa2ZWDJLopNISr98GLPDkK
X-Gm-Gg: AZuq6aJGq6+lebk0cN0ua1uTsjp94j7XMlm7IM740IGeSCkz8HVSv962bMvn9YfMwAh
	WLcY6FdVz8wh/HZkM+ah9Ikk31ENb73/NTqnXnhoSuSO8LzYKWuBHKowLGZqSYGNmtglZu6s5sf
	Op+FTFsLjZhxbCPqO7v1ejf01QV+8JWWbPlYTwd1B2cltkBBWHwzbaozPC9FzngAXYVsa8x6Ml/
	Yz6aaknRXRfL4hZqEPk1mAByRUV13k1nlK5jZ91js4MpOpKOOrs3bhHc8kV4SeONomnWcCyQxBY
	VczSjb6/J0T3tvcuhIeCe2FiNcgAzz16P6Su6TqJ7CzF1UiHT8JuRJrOWizPFR32EKw4GhaCYEL
	rxvqeKFYoek1kvnXV8zTvEZ90Qx+YbctHmFBXBR/jA4jo5eAjkBYAwyBnXuLL0sJzIHEr6HbYeb
	DyjtBRQtZ+Zu1tSJQe5mzzmcyYcsR+oA==
X-Received: by 2002:a05:620a:4010:b0:8b2:ea5a:4152 with SMTP id af79cd13be357-8cb4c019b85mr2403562785a.87.1771530083703;
        Thu, 19 Feb 2026 11:41:23 -0800 (PST)
Received: from [172.17.0.2] ([64.236.176.224])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8972a23c824sm204692056d6.34.2026.02.19.11.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 11:41:23 -0800 (PST)
Message-ID: <69976763.050a0220.a64b8.800b@mx.google.com>
Date: Thu, 19 Feb 2026 11:41:23 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============5782595631769127423=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [v2] Bluetooth: L2CAP: Fix not checking output MTU is acceptable on L2CAP_ECRED_CONN_REQ
In-Reply-To: <20260219183343.3167089-1-luiz.dentz@gmail.com>
References: <20260219183343.3167089-1-luiz.dentz@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-19207-lists,linux-bluetooth=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:replyto,checkpatch.pl:url,mx.google.com:mid]
X-Rspamd-Queue-Id: 72CF316216E
X-Rspamd-Action: no action

--===============5782595631769127423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1055632

---Test result---

Test Summary:
CheckPatch                    PENDING   0.49 seconds
GitLint                       PENDING   0.36 seconds
SubjectPrefix                 PASS      0.09 seconds
BuildKernel                   PASS      26.24 seconds
CheckAllWarning               PASS      28.52 seconds
CheckSparse                   WARNING   32.23 seconds
BuildKernel32                 PASS      25.55 seconds
TestRunnerSetup               PASS      561.44 seconds
TestRunner_l2cap-tester       PASS      28.54 seconds
TestRunner_iso-tester         PASS      84.74 seconds
TestRunner_bnep-tester        PASS      6.67 seconds
TestRunner_mgmt-tester        FAIL      130.03 seconds
TestRunner_rfcomm-tester      PASS      9.55 seconds
TestRunner_sco-tester         FAIL      14.78 seconds
TestRunner_ioctl-tester       PASS      10.26 seconds
TestRunner_mesh-tester        FAIL      11.55 seconds
TestRunner_smp-tester         PASS      8.65 seconds
TestRunner_userchan-tester    PASS      8.80 seconds
IncrementalBuild              PENDING   0.77 seconds

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
net/bluetooth/l2cap_core.c:7773:1: error: bad constant expressionnet/bluetooth/l2cap_core.c:7774:1: error: bad constant expressionnet/bluetooth/l2cap_core.c:7776:1: error: bad constant expressionnet/bluetooth/l2cap_core.c:7777:1: error: bad constant expression
##############################
Test: TestRunner_mgmt-tester - FAIL
Desc: Run mgmt-tester with test-runner
Output:
Total: 494, Passed: 489 (99.0%), Failed: 1, Not Run: 4

Failed Test Cases
Read Exp Feature - Success                           Failed       0.107 seconds
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
Mesh - Send cancel - 1                               Timed out    1.821 seconds
Mesh - Send cancel - 2                               Timed out    1.991 seconds
##############################
Test: IncrementalBuild - PENDING
Desc: Incremental build with the patches in the series
Output:



---
Regards,
Linux Bluetooth


--===============5782595631769127423==--

