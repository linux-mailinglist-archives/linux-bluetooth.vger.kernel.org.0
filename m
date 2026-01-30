Return-Path: <linux-bluetooth+bounces-18686-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIAzCA77e2n4JgIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18686-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 01:27:58 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86421B5E88
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 01:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 165E43019382
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 00:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1A827F4F5;
	Fri, 30 Jan 2026 00:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDjuKffm"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECE925C809
	for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jan 2026 00:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769732874; cv=none; b=OVBEiR7GXKAxPsldcpzhH26A4W5xFbFpY3cPXXQDG5MjJBtA6WYva7Mnnlb59bZRqCFzpO/xlcDWmNQeQDWRvvmpOepafr3z4tULeXifygJgoFCGQKa5w/e84dBUrCb+YBaWyPTfLS55e6pUttxtcAcTh0T7ebaqv95z2N78UeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769732874; c=relaxed/simple;
	bh=Suq6uS2AaELJQOMp1cTNWUuQiYHkzIXlVdMpOPtl6xU=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=hcrlNxqeUuW2P4RJz2KLqQhHk+tTWjxkfC2B1wN6DGYv3Mnr0WfR2F7gJIBORMgRy/uu4F4yT/hpG7WckidNbb3onZ1dEdfgHCAkEPZibAPoyX3KPperW9em5vX8b6kC63maezkoloXcVDw1iUwZBYI8ywzmrHU7txDtH9mFM6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDjuKffm; arc=none smtp.client-ip=209.85.219.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-8947e6ffd20so18935126d6.1
        for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 16:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769732872; x=1770337672; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DpdLVV9Yipdfk6f5wwDtgxwbMJNCOkGbU9NRzLUHVag=;
        b=WDjuKffmRmmIs9D1uxeVW7hcqxTKSmM7GHiS5Wwek3Ec01XhaSyIYykQIhvr2k28kz
         6TM4k4hlEM1aDvlZwpjWL64pOchWrByoBqKN3QW7c90qh9ebKd4LqA44kwLwlbAS+Ygr
         4AiQJEBV8O8kySxwW8+8MACX7j8m4SL3ZNe2+KY8Vr5EuVQxXe7qU4Cu4t0T8dzv/2T8
         9H+06kFGlCI+IKqY4HuA6Cue/F7P5gOP3tes4oavWnn7w/OSGPBrbbeek5Aw2m4CgFJP
         W6K/XymvmtlsAswBwUaLRIMmQzPA9EwmfeCjY2CwpsGWV+PZp1Sok10mVWrly9XdqZwG
         C+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769732872; x=1770337672;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpdLVV9Yipdfk6f5wwDtgxwbMJNCOkGbU9NRzLUHVag=;
        b=n0vJMhXG4ZEB7nM4wZou2s7wA0JvYLLgaegOGrEgAf7eDOWl8vbMAP7AxcSbi022ep
         Wv500E87QGD3C5kRGvXz1sT+kcp1a3VY8sNMcbfU07u36itvg+11zrPSg3Sne83INDTB
         m6RlHtclOYTKAXFZZKDjU5F8lbXM02YtaU05vvj+eHMLfZkVWkc4Pu6ZJuMYEVAufw94
         XDD/NdN8s9/H7H+1ivF1gHtA7wU8UKkf6e7IrxwjGPVsj4Y7ktgv8HiHL8fFaAjasHBO
         XxCVEpOVWLZcYMwSKQ7aJnRb3urrn00mDM9fLLzLW3tHh9QOzIaCTua9RR+TtBD7MWyU
         bzrQ==
X-Gm-Message-State: AOJu0YzYZuYp0bPXEMUeUSG6VBGacgBY8LfZvHf8K66P1C7gPB2ckQ1u
	3/UlFrprQ1XCcNeQBP27bvaxkhjCsGF6wjNafRSdzPWtpb05XOhZG/BuTyp8NROU
X-Gm-Gg: AZuq6aLfQn8uM8thYsV32ZcUWYejwfrej8OFkuqNYGloIbjcHmq/w3ndSQcL9P82nnY
	qj2BTcSgrwEHxnC5trJ8vYgH+OyzCVvLHhBgV0kjg2/4A73IDksmC5VNbrUJW4kGTlkO7moCiCX
	oQZiCVU26Ja/gh+AwPYzcoOHavQxuJjcm6wbvERJ532x+W1rUIyRPZ3tF49X0MA8GHpex0FU7ED
	1jH1RYdGeool0AIF2dDMDDNwBOqCPTXsAeLIdoiafqKj/YMtfE8ED1hKSPoYERzLmz+sgf6uJrj
	hHH3M7ULLlrHuJvtJL1yydo6QoSwJy2VdTEiN3EDqe7LuNI2uwUKF4jvuZWu3scttKT8VHuUqDq
	ZNWggzaXY78j6yGgi387FuGIQ4uN1oyoUlLc/FiLrPBC6gywRdX8yb/LEALlG1z2DIekPCyyipG
	mMGtYkTkYPu33g/Z9n4lOOSwYJ0EHa
X-Received: by 2002:ad4:4eac:0:b0:894:7a20:4ce7 with SMTP id 6a1803df08f44-894e9f762c4mr18067526d6.28.1769732871700;
        Thu, 29 Jan 2026 16:27:51 -0800 (PST)
Received: from [172.17.0.2] ([64.236.192.145])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50337bbb66dsm43948851cf.29.2026.01.29.16.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 16:27:51 -0800 (PST)
Message-ID: <697bfb07.050a0220.1201c.1766@mx.google.com>
Date: Thu, 29 Jan 2026 16:27:51 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============7206078344246353242=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [BlueZ,v1,01/15] doc/bluetoothctl: Document arguments and add examples
In-Reply-To: <20260129232201.1049568-1-luiz.dentz@gmail.com>
References: <20260129232201.1049568-1-luiz.dentz@gmail.com>
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
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18686-lists,linux-bluetooth=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mx.google.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:replyto,checkpatch.pl:url]
X-Rspamd-Queue-Id: 86421B5E88
X-Rspamd-Action: no action

--===============7206078344246353242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1048745

---Test result---

Test Summary:
CheckPatch                    PENDING   0.27 seconds
GitLint                       PENDING   0.31 seconds
BuildEll                      PASS      19.95 seconds
BluezMake                     PASS      656.27 seconds
MakeCheck                     PASS      18.72 seconds
MakeDistcheck                 PASS      248.74 seconds
CheckValgrind                 PASS      300.98 seconds
CheckSmatch                   PASS      353.32 seconds
bluezmakeextell               PASS      182.38 seconds
IncrementalBuild              PENDING   0.28 seconds
ScanBuild                     PASS      1012.82 seconds

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


--===============7206078344246353242==--

