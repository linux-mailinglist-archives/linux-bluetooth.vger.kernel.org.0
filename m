Return-Path: <linux-bluetooth+bounces-19422-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO0cLxk9n2kiZgQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19422-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Feb 2026 19:19:05 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1017E19C262
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Feb 2026 19:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38F033110C1F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Feb 2026 18:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55062DF6EA;
	Wed, 25 Feb 2026 18:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCTdVxHr"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15B12E0B58
	for <linux-bluetooth@vger.kernel.org>; Wed, 25 Feb 2026 18:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772043456; cv=none; b=ByTMg8zpAID8K/MHr435uMdZyTBpCZ/qF3c+/VB/EHuu0Y2MbvNxCdaNRuBQ7+4/MtiTpS2dWNqFpPwtHzathoS23mpfkeE4YHWI45s3TShjPWBIyQvDiAvwgHgf2X+a+YZh305FrgPjYn32ylRkNH1oSb/GREF3CzR9Oownymk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772043456; c=relaxed/simple;
	bh=Jnrjzs37Xua7YiSWWpG5UN5tqTKriD1Z2A6poTFRqbc=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=K4ybky4FjXDwmxKuZ8yoooVM9lxSRaiE1oz2YxuHIgv91WH7GATSTbjf5EY/GW4w4u8a2Bt7yyYg4EgqpVmiIfPSJHgHcu4x9+k0HtXDBimvCz22I8Ogn/ihcoq9/2Flqj+N1rRKci/lbG+as+wBQ53hbGYm/hD4dt3PsV1EOW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCTdVxHr; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso142268eec.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 Feb 2026 10:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772043453; x=1772648253; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HUbzuJU8LTE/4vzMYa2A+9AwWl8EeWfZg9hkdqVFSBU=;
        b=eCTdVxHrxlxulLjcgzzJZAMDXzJcEgAbkojwxR2mMaudm0hQyd25YQeF6Blr4FvUOe
         ZaUTaMJLBp9fBcbgyU5lwPLiHzF0nZTAdOYgXtp43ySaRR1EXtT5yS3PRe1TibT2MBLa
         /S7xT3ZnUX0pYuQduDstKjVBQKI0Utop0Wop55cTAO/CMnDyA5h/KLyGGlDZ4hB/pTkQ
         QtB8HRBUOl7FdXofwrusHzVyOZMjkwz+e+xd0nLka2vZT4xyjbhYenX5oLL3okQ/oG2a
         F8T7v23106H78j2g5AYjuPgMSIUdSHiUT/qAccHxAJiG7iBXl/xDe+UpzpzB32m0DZbZ
         DDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772043453; x=1772648253;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUbzuJU8LTE/4vzMYa2A+9AwWl8EeWfZg9hkdqVFSBU=;
        b=oPu3dqAjVnjwTT5553gaQF7G0GUChsrpjzL6I8/3FGnfdGtsyUXE5YtHFR/SVEmkU2
         SeRHkxLOTtoSB1cqCev8SdFrN7KBxLNfAVY7Q1soYDeBfprbG9a+h5rJTYQ0JWi6zrS6
         J3ix1sZ4CzHJW9nFSdL1d8mIjSAYDpqan0tmEXH9M9DyEoXuBF6IlX4SueLiq+ydHf9Y
         moQuF2kBSJe+YFdGnG7ZmdNpsHEMbLuqilIr9Kr6W6OKrQd2sNUSWTcCALjKEVwW5r9d
         0P366QlBYO3qpVCO2fLbbx4gQqxSg4BR4iHgq2CFgttrHILrRZNxAiWa8IXZNul0iwtj
         NyVg==
X-Gm-Message-State: AOJu0YzKdwNETfjarH33e+p6k9gXtSTS0+584vCb4Z4lNLnryG5zeKLZ
	Q8gAN+hVvS6lQuL9u8hix+11ff/kuM8HLqzK22H2FGL97JJgqOHeWonXGeHr0S8l
X-Gm-Gg: ATEYQzxofDNfWZTbI/M50jjWkTh4/6KfO0Pl6qqzo8WxdzeGQEUdlFYcIG6KPQfHgre
	c9AcG/d2FpxeJnl3dD176St2kRtC21Db2OBWWHcjNn3p5Fr/TpQQ7a9NUnhoMJvkXJNz+CMU8Lb
	rCSwnuBkvBRrEHp8Hkzn/FcMaVGbLoD0OOSDIYtwtTluVQX1XuMyclLGWxhGXRDhHnJ4djV5xTy
	Bo1U5YIsWJMFFpKzXAQo+P4PXbcsfkPrLeXCMiars1fKiphbEXtXfYmhObaNyFs4zuooX7HvJKv
	Me+m12K8UQGZu70IF7MEaLKMuKHS/gK0YKFdQlIH0zIj9laeamFSSHlRbYb9zHLDekYSQKeBSQE
	hEKdJF1/FNj/yFKr1fdMhvvD9zQPMWuQ5sx6mQEYQUHF+YOJq6sRMmToylTwm2V/r8oBM+5jMXW
	S1hIm5EGGlpaR2MoPzXVLaEreizpVv
X-Received: by 2002:a05:693c:4082:b0:2b8:6896:d0e6 with SMTP id 5a478bee46e88-2bdd0ed03fdmr3859eec.7.1772043452379;
        Wed, 25 Feb 2026 10:17:32 -0800 (PST)
Received: from [172.17.0.2] ([104.209.12.68])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7daa37c7sm9119542eec.12.2026.02.25.10.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 10:17:31 -0800 (PST)
Message-ID: <699f3cbb.050a0220.322062.c50e@mx.google.com>
Date: Wed, 25 Feb 2026 10:17:31 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============2206187727268950643=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, ceggers@arri.de
Subject: RE: [1/4] Bluetooth: L2CAP: CoC: Disconnect if received packet's SDU exceeds IMTU
In-Reply-To: <20260225170728.30327-1-ceggers@arri.de>
References: <20260225170728.30327-1-ceggers@arri.de>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blueztestbot@gmail.com,linux-bluetooth@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-19422-lists,linux-bluetooth=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[linux-bluetooth@vger.kernel.org]
X-Rspamd-Queue-Id: 1017E19C262
X-Rspamd-Action: no action

--===============2206187727268950643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1057934

---Test result---

Test Summary:
CheckPatch                    PENDING   0.61 seconds
GitLint                       PENDING   0.39 seconds
SubjectPrefix                 PASS      0.22 seconds
BuildKernel                   PASS      26.19 seconds
CheckAllWarning               PASS      29.05 seconds
CheckSparse                   WARNING   32.68 seconds
BuildKernel32                 PASS      25.67 seconds
TestRunnerSetup               PASS      566.33 seconds
TestRunner_l2cap-tester       FAIL      32.80 seconds
TestRunner_iso-tester         PASS      98.12 seconds
TestRunner_bnep-tester        PASS      6.43 seconds
TestRunner_mgmt-tester        FAIL      117.95 seconds
TestRunner_rfcomm-tester      PASS      9.52 seconds
TestRunner_sco-tester         FAIL      14.51 seconds
TestRunner_ioctl-tester       PASS      10.38 seconds
TestRunner_mesh-tester        FAIL      12.51 seconds
TestRunner_smp-tester         PASS      8.73 seconds
TestRunner_userchan-tester    PASS      6.78 seconds
IncrementalBuild              PENDING   0.99 seconds

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
net/bluetooth/l2cap_core.c:7785:1: error: bad constant expressionnet/bluetooth/l2cap_core.c:7786:1: error: bad constant expressionnet/bluetooth/l2cap_core.c:7788:1: error: bad constant expressionnet/bluetooth/l2cap_core.c:7789:1: error: bad constant expressionnet/bluetooth/l2cap_core.c:7785:1: error: bad constant expressionnet/bluetooth/l2cap_core.c:7786:1: error: bad constant expressionnet/bluetooth/l2cap_core.c:7788:1: error: bad constant expressionnet/bluetooth/l2cap_core.c:7789:1: error: bad constant expressionnet/bluetooth/l2cap_core.c:7785:1: error: bad constant expressionnet/bluetooth/l2cap_core.c:7786:1: error: bad constant expressionnet/bluetooth/l2cap_core.c:7788:1: error: bad constant expressionnet/bluetooth/l2cap_core.c:7789:1: error: bad constant expression
##############################
Test: TestRunner_l2cap-tester - FAIL
Desc: Run l2cap-tester with test-runner
Output:
Total: 96, Passed: 94 (97.9%), Failed: 2, Not Run: 0

Failed Test Cases
L2CAP LE Client - Read 32k Success                   Timed out    2.507 seconds
L2CAP LE Client - RX Timestamping 32k                Timed out    1.890 seconds
##############################
Test: TestRunner_mgmt-tester - FAIL
Desc: Run mgmt-tester with test-runner
Output:
Total: 494, Passed: 489 (99.0%), Failed: 1, Not Run: 4

Failed Test Cases
Read Exp Feature - Success                           Failed       0.108 seconds
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
Mesh - Send cancel - 1                               Timed out    2.702 seconds
Mesh - Send cancel - 2                               Timed out    1.987 seconds
##############################
Test: IncrementalBuild - PENDING
Desc: Incremental build with the patches in the series
Output:



---
Regards,
Linux Bluetooth


--===============2206187727268950643==--

