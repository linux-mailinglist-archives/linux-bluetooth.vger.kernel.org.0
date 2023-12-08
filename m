Return-Path: <linux-bluetooth+bounces-458-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F09680A015
	for <lists+linux-bluetooth@lfdr.de>; Fri,  8 Dec 2023 10:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B959C1F217DA
	for <lists+linux-bluetooth@lfdr.de>; Fri,  8 Dec 2023 09:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4633012B9B;
	Fri,  8 Dec 2023 09:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+4N52mn"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66929A3
	for <linux-bluetooth@vger.kernel.org>; Fri,  8 Dec 2023 01:57:21 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-677fba00a49so15013156d6.1
        for <linux-bluetooth@vger.kernel.org>; Fri, 08 Dec 2023 01:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702029440; x=1702634240; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4C4ClHPe+MjvgiDciNaLE6OFwDl9IH/YNgVkYVL3sZE=;
        b=d+4N52mno6mOEJwDHj43ZMiRVsxc0ylFVrEMWtE7SzqSRDLuM/Xc4CQhJD8iY+sHRc
         crqTFGg3lf/1jyNC/P6wuJEvT5h4hwHGIAJYpaIXt838k6X9DvZvcGRZiOw1/KhoxN+f
         xiTll9DGH71iNjQaikLIsWU8Dpqo2mZlxtsGi1ERTsJHM38gqwOqx6Yb4EY6VGSE30BC
         HUXGfEBp4jHRzZji6++tVAObvl6vdSsRXrUBe5/6Xb8NUJr9PoeZbq/KBSnMoWn6LR7q
         iSe9A2QoRWmi/vfwEhj4Z0k0C+KOsy/33debIplM56TW9A/+7phVPE8i3HCxa1w0/D6/
         XXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702029440; x=1702634240;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4C4ClHPe+MjvgiDciNaLE6OFwDl9IH/YNgVkYVL3sZE=;
        b=fZoMCoZnoN2b2eG7fwgy51YmMS5kUugZFTSVvhqS50TTeZU46luZI9GUgs/PWX43ew
         oq7bN19AXB8jQ5fOjTnPpxU2W9ZMOI+kIECj0EvgGLvuorRpu3ejNpAouYYG/1FjRmRi
         2ZLqHZOr5c8qzXjwJuvmArQvKaVLBHDy/2RTArXzZ0yeI6FOzKqfruFfZKzSs9byvycs
         5f03ACd0AiZ0yxbpuQncalDLjpievz08ixdd5hz5TMxY/tutRmGhJ6R28Yd8y1LmenFk
         LDkaFWuQ/4u9fkJj1tulXMqbP850FwLr9VmyGUMPM8MfH62GiFof8A2siLJdk5ta0Oh6
         GoDA==
X-Gm-Message-State: AOJu0YxXaI8E9OOpsG9azDVec9vj97E5SncfOJ0rq4c5s1pUD9nnu6L2
	0NykInGPt34/JG966ktDrN6bqBSK+JI=
X-Google-Smtp-Source: AGHT+IHFwqt91fd9PO426gOuY/0yzyyLa4SyJ8l9rYEllyRHW/EftgujHxDaLjf1MqKg8YLWWWyKlw==
X-Received: by 2002:a05:6214:5507:b0:67a:a721:7207 with SMTP id mb7-20020a056214550700b0067aa7217207mr1009987qvb.36.1702029440290;
        Fri, 08 Dec 2023 01:57:20 -0800 (PST)
Received: from [172.17.0.2] ([20.51.206.230])
        by smtp.gmail.com with ESMTPSA id e5-20020a0cf745000000b0067a0eecf4easm675981qvo.31.2023.12.08.01.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 01:57:20 -0800 (PST)
Message-ID: <6572e880.0c0a0220.ba9e5.3654@mx.google.com>
Date: Fri, 08 Dec 2023 01:57:20 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============3766656584196138351=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, brgl@bgdev.pl
Subject: RE: Bluetooth: power-on QCA6390 correctly
In-Reply-To: <20231208090936.27769-2-brgl@bgdev.pl>
References: <20231208090936.27769-2-brgl@bgdev.pl>
Reply-To: linux-bluetooth@vger.kernel.org

--===============3766656584196138351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=808173

---Test result---

Test Summary:
CheckPatch                    PASS      1.97 seconds
GitLint                       FAIL      1.45 seconds
SubjectPrefix                 FAIL      0.69 seconds
BuildKernel                   PASS      28.63 seconds
CheckAllWarning               PASS      31.34 seconds
CheckSparse                   PASS      37.30 seconds
CheckSmatch                   PASS      101.04 seconds
BuildKernel32                 PASS      27.67 seconds
TestRunnerSetup               PASS      430.36 seconds
TestRunner_l2cap-tester       PASS      23.40 seconds
TestRunner_iso-tester         PASS      50.16 seconds
TestRunner_bnep-tester        PASS      7.24 seconds
TestRunner_mgmt-tester        FAIL      166.09 seconds
TestRunner_rfcomm-tester      PASS      11.38 seconds
TestRunner_sco-tester         PASS      14.92 seconds
TestRunner_ioctl-tester       PASS      12.37 seconds
TestRunner_mesh-tester        PASS      9.17 seconds
TestRunner_smp-tester         PASS      10.05 seconds
TestRunner_userchan-tester    PASS      7.77 seconds
IncrementalBuild              PASS      35.78 seconds

Details
##############################
Test: GitLint - FAIL
Desc: Run gitlint
Output:
[RESEND,v2,2/3] dt-bindings: net: bluetooth: qualcomm: add regulators for QCA6390

WARNING: I3 - ignore-body-lines: gitlint will be switching from using Python regex 'match' (match beginning) to 'search' (match anywhere) semantics. Please review your ignore-body-lines.regex option accordingly. To remove this warning, set general.regex-style-search=True. More details: https://jorisroovers.github.io/gitlint/configuration/#regex-style-search
1: T1 Title exceeds max length (81>80): "[RESEND,v2,2/3] dt-bindings: net: bluetooth: qualcomm: add regulators for QCA6390"
##############################
Test: SubjectPrefix - FAIL
Desc: Check subject contains "Bluetooth" prefix
Output:
"Bluetooth: " prefix is not specified in the subject
"Bluetooth: " prefix is not specified in the subject
##############################
Test: TestRunner_mgmt-tester - FAIL
Desc: Run mgmt-tester with test-runner
Output:
Total: 497, Passed: 496 (99.8%), Failed: 1, Not Run: 0

Failed Test Cases
LL Privacy - Start Discovery 2 (Disable RL)          Failed       0.301 seconds


---
Regards,
Linux Bluetooth


--===============3766656584196138351==--

