Return-Path: <linux-bluetooth+bounces-18878-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJJMKfvBiWmVBwUAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18878-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Feb 2026 12:16:11 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F342F10E939
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Feb 2026 12:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B17233013A79
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Feb 2026 11:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315DC36E493;
	Mon,  9 Feb 2026 11:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PupI95ig"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906E93019CB
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Feb 2026 11:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770635766; cv=none; b=bfQeCeBjiu1CqiW/bKzlcmCQZCLUi/gOwfSxg13hwDS2qqteJYIqRxFJqfgbjgRZt8WPmhk+uxIE3HGC3zS4KkPtdvgEaEKiwjtRgw+LvZ+xzl+4hhOibnPF55nNHXyu3MTu0ifUkMO3GupuQwTedNHTKOAHZsf/esq61y7pMgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770635766; c=relaxed/simple;
	bh=2kXh2OKi91RPD3KF5fFtJ1bG70iKvfPbJNrjSBYLkwo=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=i7AeJNKF/TabbsX4pP1IyEEmc+rmsjybblHkVcq2o3wBpz5G9LNr+qU0Vjn2YcRfcfH5caCa7lo2DHEJbn8HeZvmXV6KPbj8A6W18BL3X3+4P1VxQWoLAwSU33cw/eGrdFi6r0K5U18LDshFLEefKEQ4kcfJ1T0h8dk+teG2o6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PupI95ig; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-1270be4d125so1577016c88.1
        for <linux-bluetooth@vger.kernel.org>; Mon, 09 Feb 2026 03:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770635765; x=1771240565; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wm9O0IltCmB1OkJ0ter22S9NuaB0+XvCxndZfzzbvWg=;
        b=PupI95ig92DxRcv8y+GvJ8E6LkElWcThSJRu1NTGsqDPX1NCc1TjM1umYzBIdBfZrV
         Mg8h9CUJP+OJ+C+/ur3e1j1AZihtMWn7RAPcS2T5x4CWhNxd1t2bH6RRnW4ymD6T6WkX
         iJp8yiK4v0Q6SZRqSr17KzC0Dar5F30ixz59bHd7VCUpsV1wZ+TSYqSjZcstMtCgSmXT
         2ZOjcBFfXyVwEIPHKieBkOWycVG9qgT2sp0QqY8BW2kSZcLkfZ4eKUGEFyANCdNI1z0/
         IdGU2qssHHGRt255wgrK5YHOrZhu9bjdqKQQdmU535KGbhoq7osgmm4XBSpmfMWprTBl
         4K1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770635765; x=1771240565;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wm9O0IltCmB1OkJ0ter22S9NuaB0+XvCxndZfzzbvWg=;
        b=TGLIbBfe7O+Vb3azFCu/GFH7BEunWwlfuL3vQxNy6rkhFku+Wxe5VC5sZ/PBFnLXNh
         IoFbFr9PuPEik6iRK7a13ZPTGtwYRqzooiDTZAjM+z3DAp10tzElIyu9FTpjFHbGuUNP
         eKyGjmSehBua1XJBMlLD/R8CylgLLpFpzLVpd3chzW5ooycZOwD7D/EO4FTmDOz40Di+
         b4WNHywLYobkZkUslLlkzQJbAA5TC+AceeqpuQcjwi8KPXFVcH6V7i6jnBdWnk9iY1Qs
         BbKu1bXAImbfNr2seUtIJn8WO2uTvKk5eiolKywnuuhj062aDJiH4E1EfuCiW9NhhR3L
         eNVQ==
X-Gm-Message-State: AOJu0Yxsbi2oqlxPOwhinxMNQGZzX8gKVWoDugZob0E4G8KZsl7qjr4f
	kXNWV78UsVPy8o14Ktoh+aWeQyb2NkzbWl5Qq79rKzNHU7R95FP8GD0vitcwbbEv
X-Gm-Gg: AZuq6aKG86DXDNUgxZruBZu5nS4EYp2gdVVnB5TKs6cl3tAl50EqMVMV17E0J7TjMcZ
	pRdgYvU5zq+1qnzyYgezOg1dtEpr0SSw73XdjuqpJBPzUJME0nmQEuPTW65XV+J1gavUQK2mh5x
	P0dsgJcpls1rqBm4QHrjTkSPPplrIt5vEPN4wA3tNuj6K3gDQi7K7abB60gJJl0svTT/gFIFytd
	Ci3R8Y7QSKU3gf5hqpUhjvb80JgSncHL8l+YpovNV0A0fZ1177o8YOwHUyhGJUD1jlnFitHJs9p
	WnEB5chrM75QcQXAcs0EfpXfLxoBlv8Aq2mlDf6gAQ3mRqhO7k6j2iiqJZ991iLiJh97iSHOgJb
	k0d6JhaoozNRPN/WnpI4dMsXIOSS7hFIMDzwh2ZXDwMIhiZn9L7EMCUcsvL9Givgw83ijW1pZ+U
	zWS3PQ5HLkAoRO40lg7f8=
X-Received: by 2002:a05:7301:290a:b0:2b7:ff39:3123 with SMTP id 5a478bee46e88-2b85646ded5mr5828052eec.9.1770635765213;
        Mon, 09 Feb 2026 03:16:05 -0800 (PST)
Received: from [172.17.0.2] ([172.184.209.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855b1a6d3sm7383430eec.15.2026.02.09.03.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:16:04 -0800 (PST)
Message-ID: <6989c1f4.050a0220.380479.310c@mx.google.com>
Date: Mon, 09 Feb 2026 03:16:04 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============7901626956094955264=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, youjingxiaogao2@gmail.com
Subject: RE: Bluetooth: fix use-after-free in hci_conn_drop
In-Reply-To: <20260209100211.36533-1-youjingxiaogao2@gmail.com>
References: <20260209100211.36533-1-youjingxiaogao2@gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-18878-lists,linux-bluetooth=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mx.google.com:mid]
X-Rspamd-Queue-Id: F342F10E939
X-Rspamd-Action: no action

--===============7901626956094955264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1052221

---Test result---

Test Summary:
CheckPatch                    PENDING   0.47 seconds
GitLint                       PENDING   0.33 seconds
SubjectPrefix                 PASS      0.06 seconds
BuildKernel                   PASS      25.77 seconds
CheckAllWarning               PASS      28.45 seconds
CheckSparse                   PASS      31.85 seconds
BuildKernel32                 PASS      24.99 seconds
TestRunnerSetup               PASS      560.46 seconds
TestRunner_l2cap-tester       PASS      28.11 seconds
TestRunner_iso-tester         PASS      91.87 seconds
TestRunner_bnep-tester        PASS      6.46 seconds
TestRunner_mgmt-tester        FAIL      117.55 seconds
TestRunner_rfcomm-tester      PASS      9.58 seconds
TestRunner_sco-tester         FAIL      14.80 seconds
TestRunner_ioctl-tester       PASS      10.10 seconds
TestRunner_mesh-tester        FAIL      12.52 seconds
TestRunner_smp-tester         PASS      8.69 seconds
TestRunner_userchan-tester    PASS      6.63 seconds
IncrementalBuild              PENDING   1.02 seconds

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
Test: TestRunner_mgmt-tester - FAIL
Desc: Run mgmt-tester with test-runner
Output:
Total: 494, Passed: 489 (99.0%), Failed: 1, Not Run: 4

Failed Test Cases
Read Exp Feature - Success                           Failed       0.106 seconds
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
Mesh - Send cancel - 1                               Timed out    2.774 seconds
Mesh - Send cancel - 2                               Timed out    1.992 seconds
##############################
Test: IncrementalBuild - PENDING
Desc: Incremental build with the patches in the series
Output:



---
Regards,
Linux Bluetooth


--===============7901626956094955264==--

