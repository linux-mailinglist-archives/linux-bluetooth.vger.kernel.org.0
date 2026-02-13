Return-Path: <linux-bluetooth+bounces-19028-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G5iE+F3j2lVRAEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19028-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 20:13:37 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5B3139200
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 20:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 496B4305E33A
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 19:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6DD27FB3E;
	Fri, 13 Feb 2026 19:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO+CaSnO"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E052231842
	for <linux-bluetooth@vger.kernel.org>; Fri, 13 Feb 2026 19:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771010013; cv=none; b=J+KyPJ67hh422+JYMqRU0E2USgyHo1BoWWEhK9XKW2CRiW32ycPx4OiDYlb0BU7VODf0SvUUe2QPwT5XRqTeXVzhSwkoEtz/T6YBUmxTcwYUulKrkENt2dd2tE6esicYTmsw4O73aCCq14CksPgjrMGXqT660DrI7i8GBPfqRm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771010013; c=relaxed/simple;
	bh=zq8v4xm7fjjEg7hQeo0vNwq6dNhKijYlnb/d2QZniW8=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=k7eWXFipf69kW0bE1mw8LL4BDNtCgMt+muuuoSiEAQjMS6aYZCHlRtVMlFztssPwZ9jgbwy26rfYfLi7Zio5gut7xN4v9eVaq43hYdxdqaDdSIOrTcmgMFfSlj5ZjPySImXLbOC+IMYaaMDzQOmF+yUErftjefTtDI93qY0gh9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iO+CaSnO; arc=none smtp.client-ip=209.85.160.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f195.google.com with SMTP id d75a77b69052e-5069ad750b7so11572821cf.2
        for <linux-bluetooth@vger.kernel.org>; Fri, 13 Feb 2026 11:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771010011; x=1771614811; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NaSF48Uzn4fiu79xaTtUOComrQUuggbI2Qqa85rvBjQ=;
        b=iO+CaSnOk9+jwk5AJNlmypy3BRSjrue5+Ytvf9RVuEivCcqKM56invVOe8yyrkdShF
         bQzwUtCPcnnYK2ga+3kLuv7arNT12e/Z2w29DTei33axDrzmUNa+AqcA86oXDFj3aVB1
         +tqg1m6iLJ3es53F2noA2QRO4D9jP/Zpi5TgMrWxIwIxx5ZOxXRw+XHSMGR1M5aVx6o3
         R81s5CaCz85QtjqrtHdQjQ7PrWeKIsOKL9QSVNqJsNMlsUVUjd9GEqnkpuS4tcWzvkec
         y2GizhswNPcxOgdfYWNX+Y/87MnYki1gDmBvl/iFRCJuQ8KoHYwikSd7XidwM3JldyfJ
         hN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771010011; x=1771614811;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaSF48Uzn4fiu79xaTtUOComrQUuggbI2Qqa85rvBjQ=;
        b=fbVUJORkBPh7Saf0ivMFhBEut+oGSyaDaE7zDORVMEthb3/HfKzs2rlI474VqWoUqv
         yg6AHKYAChzt/Ugk2FGD1Z32LYMHrOTdYDISkFrpuW7MI7D6Q7iTaPCOhD5FfOzTtaSj
         1ellMEEpMlODlcXLEWPaQuExeQfjZ6hwxnGceqz1bUeICzneY10ODqU1rq4c0gywm4ce
         JWbFIWm2MsASTTXuCyDWBjCn1nV+ygh3oijScAd9S8YO2PwSHJQvSCDSEVtWfX9HuABD
         AZQM4GP8sKgbebTYJcMHpwv0Fuc0gyJ+vu3UBJz+Zx8S3jd6LP1lXZqLERFF7lBG74gr
         t5YA==
X-Gm-Message-State: AOJu0YxCsMNBtBU7XQTBt/QZLkrlVIVE3R1xQWROqR8qy5THZ3tmcT7E
	oGMAsLdD+eXfzWAYgRr+PXdp6dV5zPHLpiZBmeJn996QyzpJ7i4T/XPxUmf28saI
X-Gm-Gg: AZuq6aISmXnwNH/pSYIDJ/c24/5zYERaS8KtOOQ4FinxDDa/xSIPK0QeU6b5XJhJzKX
	hSbOMh7qyxIfE/zUXY4FTdA1DabRv12xQswm3efjF1hcsyXdeF8eFdSr/Zh0UICScdBtBpKCtw1
	YzDWMkff2afaWUiazh7DNRrCCqEOLtASdWuTT8Acd3hrSthqGXfjqo5xpvVkov8XO0K7L8zaxVo
	HtUc0foZKaJOf1jugM+KTNf/gIANVdvrTIVBmUiS6fP9PJMHN+5g0XcuGzr4LLtc+G/YeYpZzDA
	eeBxX/x7g/mVraqadNVKsHA85uVPGJEUQ32hIGsW01OUzl/QTdxe/B8me1Q3x/njMP2RZJcRqUI
	x47dYBWTbwdGfl55ZSnP+0ukp6rSa0prxSZZGVtVByKDGGfFb8QWrvvr/unmip6hRTvawtWgrI1
	poY8dydzKhjtkQF/IygtTO4Mwj7+EB
X-Received: by 2002:a05:622a:19a0:b0:502:9f6b:a3b3 with SMTP id d75a77b69052e-506b3fc9f96mr7952641cf.37.1771010010805;
        Fri, 13 Feb 2026 11:13:30 -0800 (PST)
Received: from [172.17.0.2] ([64.236.160.17])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50684bb9251sm68301131cf.30.2026.02.13.11.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 11:13:30 -0800 (PST)
Message-ID: <698f77da.c80a0220.2f35d5.a704@mx.google.com>
Date: Fri, 13 Feb 2026 11:13:30 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============8674476243847809490=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [v1] Bluetooth: L2CAP: Fix missing key size check for L2CAP_LE_CONN_REQ
In-Reply-To: <20260213183333.1830534-1-luiz.dentz@gmail.com>
References: <20260213183333.1830534-1-luiz.dentz@gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19028-lists,linux-bluetooth=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+,1:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blueztestbot@gmail.com,linux-bluetooth@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[linux-bluetooth@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:replyto,mx.google.com:mid]
X-Rspamd-Queue-Id: 9E5B3139200
X-Rspamd-Action: no action

--===============8674476243847809490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1054013

---Test result---

Test Summary:
CheckPatch                    PENDING   0.31 seconds
GitLint                       PENDING   0.34 seconds
SubjectPrefix                 PASS      0.09 seconds
BuildKernel                   PASS      26.30 seconds
CheckAllWarning               PASS      29.05 seconds
CheckSparse                   WARNING   32.73 seconds
BuildKernel32                 PASS      25.85 seconds
TestRunnerSetup               PASS      571.48 seconds
TestRunner_l2cap-tester       PASS      28.98 seconds
TestRunner_iso-tester         PASS      94.70 seconds
TestRunner_bnep-tester        PASS      6.58 seconds
TestRunner_mgmt-tester        FAIL      120.29 seconds
TestRunner_rfcomm-tester      PASS      9.93 seconds
TestRunner_sco-tester         FAIL      15.02 seconds
TestRunner_ioctl-tester       PASS      10.69 seconds
TestRunner_mesh-tester        FAIL      12.44 seconds
TestRunner_smp-tester         PASS      9.04 seconds
TestRunner_userchan-tester    PASS      7.10 seconds
IncrementalBuild              PENDING   0.88 seconds

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
net/bluetooth/l2cap_core.c:7772:1: error: bad constant expressionnet/bluetooth/l2cap_core.c:7773:1: error: bad constant expressionnet/bluetooth/l2cap_core.c:7775:1: error: bad constant expressionnet/bluetooth/l2cap_core.c:7776:1: error: bad constant expression
##############################
Test: TestRunner_mgmt-tester - FAIL
Desc: Run mgmt-tester with test-runner
Output:
Total: 494, Passed: 489 (99.0%), Failed: 1, Not Run: 4

Failed Test Cases
Read Exp Feature - Success                           Failed       0.115 seconds
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
Mesh - Send cancel - 1                               Timed out    2.414 seconds
Mesh - Send cancel - 2                               Timed out    1.992 seconds
##############################
Test: IncrementalBuild - PENDING
Desc: Incremental build with the patches in the series
Output:



---
Regards,
Linux Bluetooth


--===============8674476243847809490==--

