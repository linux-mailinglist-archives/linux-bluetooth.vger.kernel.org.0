Return-Path: <linux-bluetooth+bounces-9827-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5D1A16B9D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 20 Jan 2025 12:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00AD4169B2B
	for <lists+linux-bluetooth@lfdr.de>; Mon, 20 Jan 2025 11:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCEC71DF273;
	Mon, 20 Jan 2025 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tl/v9fd7"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF2D1DEFD4
	for <linux-bluetooth@vger.kernel.org>; Mon, 20 Jan 2025 11:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737372587; cv=none; b=jSiW1Ns/Rs0ubP+z4kbOeAPxDAMjgiOg/u1URq0g8XRE/lbxx+262TsyD+JatTAlZjpXghgekGZ5ukNoVoUktgT7WRv/tKNNO85EPwvAMyfzJ/0qvJ7gbAXY4q+atZmlsD7p3uUGCVB+M6HuRceM3t8j5hso1vbFAPzSsUnhI24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737372587; c=relaxed/simple;
	bh=wUZbO/1QQc33OOeyGWCh9JzRL+4HUa5GK5dlrd3fhGQ=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=XlYuhOohxZvp5Q46QlwteilcW1gVLi6Zief4D/Gy1LOEJi3fA/BWEwjLIFqidGorbWpdlJLziHMNqx/x7UmjL3JMVmYSBFaepNfRI1E4zcxEkr9ieRwOOSRsoCpFne/cbrmLPCRIXpfcXbx57CNXGakXMpwKZcpibzkQEXIkkxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tl/v9fd7; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-46901d01355so44440941cf.0
        for <linux-bluetooth@vger.kernel.org>; Mon, 20 Jan 2025 03:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737372584; x=1737977384; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=US3KD7jfEskvov7MXcCgarnb8LtKZLkUBdWHpLKrcGY=;
        b=Tl/v9fd7CVozQla5UW/LJIvQyE7acB7i43m8uYQmWcPh5FcikJHOA0hFmHOxX2meJ2
         jDwstqQLZGBwd7B7n0xRz1tzFwmMVXWbd+C3SCxjp3FS2tewo5xoR2TaEyPUzqvBeMD2
         RV34tzMfR1H0NkfeqJ+b+sks7Q2cZwaFURCCUj3A1CY3cORhsWOj9f41nhkS522FBc/D
         s8946HOKJ4UJXcuels01GUPVuT8LDCxnzdrVl2FTmk9RNx7Af67mwpGguGZ0wvTYwYhx
         8UA03LIIfAQKUe/7+AbpSo7fOnNNG9RTlQW5DXDDgecrLBWR4hvTs61izcVeadRaaxFe
         m6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737372584; x=1737977384;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=US3KD7jfEskvov7MXcCgarnb8LtKZLkUBdWHpLKrcGY=;
        b=TQs4M11SnMio4OwIJGCy3w85n+CXgNLxWVHvhrIF9cRZZgkxBrSh9ed48tSckqEk25
         FGpPdnUGQtPv0oSpYSxEem0kBy0tqR8iRCJuLHHccyKMBQLP1+yxLS/87cmzYEbhB9a8
         nK/nACZiIPZlFDRGjXKTDknND1eBEi22O3lpEnTFYb7wloexRiezc0v+tw5/2UacDcxT
         PsSapkOzf2HWMrHDdchk/xZOnVh9BX6NnIvuUCGoN8aUhK9ujjOVaA92MSuIEt9+IYB9
         2B9XqJIEjH+3BpbDBIWSO6fMD2TyKT/T/VPZ1jdhJfP5f6BNX+YkhL+SGBUwSnoAK4lk
         YibQ==
X-Gm-Message-State: AOJu0Yw0Kn5GTfE9sQV64svsU371TlyX0s5H2A/JkKRoqZTeSuGXF+2o
	1cRJ9bhDAM6lplIPTlOkTsFU7BF/2zjf3vTBmIDB9VKW4wZusxip8ZWE5g==
X-Gm-Gg: ASbGncutlua7CrxEK4j6RRK0Y4eh1+FaYUL1/T6cLX4f5b8rjnOhOtktq3DX0I4tBwg
	/P1GWTk00SX8IxC1Z423b5DlAHOq0aQhkT+djtpBatm+0xZ/xVjiePcauunYld8u+fUIOkgYPH5
	CffONlxogb4qUtSCpHLWARMCZwzmIUqunOBaeX3i4C1gin9xkvBt21lfzJIu0Rihq1GSIJsgftM
	Ot46bJZOzkUYbgU/RUOYCWuNnZ0usBus8T4VZERQhrrChkCcrdlaPnNY3YuxtF21j7VkrhRog==
X-Google-Smtp-Source: AGHT+IEcIka/0lxkLAwE5sUjMII586Os2GBkCEYXFqjBtVpYG4E0vhA2yBiu0aCHwUSk8qrlEh4ZFg==
X-Received: by 2002:a05:622a:134a:b0:46c:791f:bf5e with SMTP id d75a77b69052e-46e12b90580mr199930211cf.42.1737372584226;
        Mon, 20 Jan 2025 03:29:44 -0800 (PST)
Received: from [172.17.0.2] ([20.57.79.79])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e102ec6cfsm41668751cf.3.2025.01.20.03.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 03:29:43 -0800 (PST)
Message-ID: <678e33a7.050a0220.341419.ed78@mx.google.com>
Date: Mon, 20 Jan 2025 03:29:43 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============2433216959285735266=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, chharry@google.com
Subject: RE: Bluetooth: Fix possible infinite recursion of btusb_reset
In-Reply-To: <20250120183938.1.I77eb26ac40229001ac90a70cb877c902456721b7@changeid>
References: <20250120183938.1.I77eb26ac40229001ac90a70cb877c902456721b7@changeid>
Reply-To: linux-bluetooth@vger.kernel.org

--===============2433216959285735266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=926902

---Test result---

Test Summary:
CheckPatch                    PENDING   0.28 seconds
GitLint                       PENDING   0.24 seconds
SubjectPrefix                 PASS      0.11 seconds
BuildKernel                   PASS      24.04 seconds
CheckAllWarning               PASS      26.77 seconds
CheckSparse                   PASS      30.01 seconds
BuildKernel32                 PASS      24.19 seconds
TestRunnerSetup               PASS      429.88 seconds
TestRunner_l2cap-tester       PASS      20.36 seconds
TestRunner_iso-tester         PASS      31.67 seconds
TestRunner_bnep-tester        PASS      4.85 seconds
TestRunner_mgmt-tester        FAIL      120.36 seconds
TestRunner_rfcomm-tester      PASS      7.66 seconds
TestRunner_sco-tester         PASS      9.42 seconds
TestRunner_ioctl-tester       PASS      8.05 seconds
TestRunner_mesh-tester        PASS      6.03 seconds
TestRunner_smp-tester         PASS      7.00 seconds
TestRunner_userchan-tester    PASS      5.06 seconds
IncrementalBuild              PENDING   0.50 seconds

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
Total: 490, Passed: 484 (98.8%), Failed: 2, Not Run: 4

Failed Test Cases
LL Privacy - Add Device 3 (AL is full)               Failed       0.194 seconds
LL Privacy - Start Discovery 2 (Disable RL)          Failed       0.162 seconds
##############################
Test: IncrementalBuild - PENDING
Desc: Incremental build with the patches in the series
Output:



---
Regards,
Linux Bluetooth


--===============2433216959285735266==--

