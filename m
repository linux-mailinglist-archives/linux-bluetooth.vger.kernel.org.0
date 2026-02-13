Return-Path: <linux-bluetooth+bounces-19018-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEBpNIoDj2lJHQEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19018-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 11:57:14 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A4713548E
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 11:57:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5AA13069D54
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 10:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D4634B661;
	Fri, 13 Feb 2026 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOWFrBlF"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D7A34DCD7
	for <linux-bluetooth@vger.kernel.org>; Fri, 13 Feb 2026 10:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770980213; cv=none; b=ih/WkzaxLzH/0Z8rEt+f+EH2kgccQ5ZDE4Z571FEUj1LOertZol1O+Z13mTIPj44Lc1sbOkObASIVqI4VU7Veij+q+/8xUKxErj5Kxx/U2ANOVoWSfA4ntexsd2v6SRUUsF6uvH6mXkoQoNauu1uYhdFPKjkzLp76RhpaAbeqvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770980213; c=relaxed/simple;
	bh=xPbL5CvGxzoAK2Lo/jwNiBHSm+yAeqVCwS4ACPeSl4c=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=iq8tNsIdOG+RicGE8vIQFXSizHQOZFueXkm+rY6miGk6S5BhtmVotvSFwqH7M5eXZ4FMbqIIbybuXP2GkdDCmAAA/6uwNJqb8e2LPfV0d3aGIwy30KYyGDa3i6DaHtnmGrycy9CsnqCHco/6XPbMpM+jRc3hGGWmDqEUPf7KNe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOWFrBlF; arc=none smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-896f9397ecdso9140716d6.3
        for <linux-bluetooth@vger.kernel.org>; Fri, 13 Feb 2026 02:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770980210; x=1771585010; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iLqeKpB1FvKLgm16sNk8U/y4oDuXW615WG7ry4J0ZHY=;
        b=HOWFrBlFGK7h+loqHQdYFKdNP3JookBKiCdJoMHk6po3182OZlIizeRkRxtAqr21qW
         NyaiU4j7xdlmoPJpoZ6MOpqe6WC3XA64FoT+SzE59vSJPeyPvnmIWg8kcePX4jkaIgrH
         tnY5i4DBE/P1FysoA1prd3VMaB7pcgQ/jgsbVD1PpwgUIXykHbNAwMTrey4VEEBjRDH7
         3Ez3+TaCMfX1r123vxm6gfi7I3ay2YNPodjyC/ghHRaK5ARdZEBXSIQSv+eAc57hiBt3
         4cd3IzF6O2UlqmTU3RMUniwSZRoSFamKBC6xl/CG8bN2pQZkH6gydCLT6MI/O/kd6NZA
         IlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770980210; x=1771585010;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLqeKpB1FvKLgm16sNk8U/y4oDuXW615WG7ry4J0ZHY=;
        b=biBlW22RVNxrbIoVYvCrbavd5hY3DELsJ0bBW7W5R7A29HS6NfYtzc3otNMZZma4hb
         DJZXAzvlT4ZMIMtQpA6hnKrdi7OJF+8Cqa0pUNFtF0q8uGDgBguEHhTjYrdYHUNapxmD
         21wzaDRPh/Gevrvx+HjaKRUU9rtcb7+OK4nr/yICGl9mevzpWrMf1BFgILEiciHvg56A
         b/c/aRY2s/CkZ8RznV2LIcDeqLw/ue3d0SULV8GAFFtagu/qCikLK3RmicISCMAKK2dM
         ci9+6J8zf95vDZorf8Nj3VrPpShsPnYv36DSrTMrXrr97ZFMXtrFRVpPfG6cTLj0fP+U
         D0mg==
X-Gm-Message-State: AOJu0YwUdXNfU+YrtkUeV8Iu72QrheMUtnfnDxKO0fnYuIAciF18ieIi
	CbwHD9ZH/YOAgRAvG4ROrhWDCFlPBXj7VXB9eIsAqO01JuMGVJS+ojSkQsAGUtlb
X-Gm-Gg: AZuq6aL2wbNUp4LXSmdVPYp3cQ9VZXNQQYqO+L4kiCocSpsTgEPwpBz9lTcpDVxXMRZ
	vE39EO+Pv3fheWSZHUEm2Ux4W6O10n522euTNN/iwaU0po/6JiNLCGIIoG975uV3hDLAqPM1pMP
	HCgNeiTm00GlTnwQ8LhnWATJOsfNpLShldwiTzzl3H/h99rsbL/2TWfq9o0dBDA55KCzYpTOMXf
	Xq4UdLWse2OARGQSCHvnzLXpV2zDrpQbZPE3ajENTzLL2gTgBwaRjli5EXAQ0kpbFC9/GcdYQBM
	lfpwLVm+rU3B11F18WEqBhPku9EyUESU4UAMxu+zmOCF+KeOVxhNHlIE8ksoszkye7FGcaUSKLN
	k3g6zx2BEjB79AVywYZa8/HnvO4O/A94hDX+ah/PRdyCY6NXsrfrUt+TZweZgs7xh/+XjJ+Mwuo
	51RTEz/NEpcCm2LJIayQ8APQa+LUozNg==
X-Received: by 2002:ad4:4ee9:0:b0:897:277:d03e with SMTP id 6a1803df08f44-89736246fd4mr17370006d6.58.1770980210458;
        Fri, 13 Feb 2026 02:56:50 -0800 (PST)
Received: from [172.17.0.2] ([145.132.103.68])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cdd1541sm62437086d6.49.2026.02.13.02.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 02:56:50 -0800 (PST)
Message-ID: <698f0372.050a0220.5cf22.087c@mx.google.com>
Date: Fri, 13 Feb 2026 02:56:50 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============0879920480903804564=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, chris.lu@mediatek.com
Subject: RE: [v1,1/2] Bluetooth: btusb: MT7922: Add VID/PID 0e8d/223c
In-Reply-To: <20260213095843.226923-1-chris.lu@mediatek.com>
References: <20260213095843.226923-1-chris.lu@mediatek.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.64 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	CTYPE_MIXED_BOGUS(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19018-lists,linux-bluetooth=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[blueztestbot@gmail.com,linux-bluetooth@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[linux-bluetooth@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mx.google.com:mid,checkpatch.pl:url,vger.kernel.org:replyto]
X-Rspamd-Queue-Id: 34A4713548E
X-Rspamd-Action: no action

--===============0879920480903804564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1053873

---Test result---

Test Summary:
CheckPatch                    PENDING   0.39 seconds
GitLint                       PENDING   0.27 seconds
SubjectPrefix                 PASS      0.25 seconds
BuildKernel                   PASS      26.29 seconds
CheckAllWarning               PASS      30.31 seconds
CheckSparse                   WARNING   32.12 seconds
BuildKernel32                 PASS      25.72 seconds
TestRunnerSetup               PASS      565.64 seconds
TestRunner_l2cap-tester       PASS      28.94 seconds
TestRunner_iso-tester         PASS      104.80 seconds
TestRunner_bnep-tester        PASS      6.46 seconds
TestRunner_mgmt-tester        FAIL      119.12 seconds
TestRunner_rfcomm-tester      PASS      9.78 seconds
TestRunner_sco-tester         FAIL      14.96 seconds
TestRunner_ioctl-tester       PASS      10.78 seconds
TestRunner_mesh-tester        FAIL      12.51 seconds
TestRunner_smp-tester         PASS      8.97 seconds
TestRunner_userchan-tester    PASS      6.96 seconds
IncrementalBuild              PENDING   1.04 seconds

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
drivers/bluetooth/btusb.c:4663:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4664:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4666:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4667:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4669:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4670:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4672:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4673:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4675:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4676:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4677:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4678:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4678:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4663:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4664:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4666:1: erro
 r: bad constant expressiondrivers/bluetooth/btusb.c:4667:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4669:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4670:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4672:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4673:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4675:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4676:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4677:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4678:1: error: bad constant expressiondrivers/bluetooth/btusb.c:4678:1: error: bad constant expression
##############################
Test: TestRunner_mgmt-tester - FAIL
Desc: Run mgmt-tester with test-runner
Output:
Total: 494, Passed: 489 (99.0%), Failed: 1, Not Run: 4

Failed Test Cases
Read Exp Feature - Success                           Failed       0.114 seconds
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
Mesh - Send cancel - 1                               Timed out    2.581 seconds
Mesh - Send cancel - 2                               Timed out    1.985 seconds
##############################
Test: IncrementalBuild - PENDING
Desc: Incremental build with the patches in the series
Output:



---
Regards,
Linux Bluetooth


--===============0879920480903804564==--

