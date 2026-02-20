Return-Path: <linux-bluetooth+bounces-19260-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eI+mBpTMmGmuMgMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19260-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 22:05:24 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE2516AE1F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 22:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D3F3303A936
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 21:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F72A189F30;
	Fri, 20 Feb 2026 21:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4Dgz705"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18B42D1911
	for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 21:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771621509; cv=none; b=NV/jqXLP32ml0nfy+5PZ3hQXqGhswc0eQVo2kAGW9XKnashb3QdvtZXdsPrkoxnHYS4Wm+zNnX5fWrUJQfrvQJ3yaHKlBTAMsBLosOnZWLqXujaIAHePU9ekMeje4B0BNiSOBG71xb/7isybAIvOJohbrPlXfmrMKRmwbX4nJIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771621509; c=relaxed/simple;
	bh=3K7fhOCslc37tQ6k9Uc4rS+odQT70LT5UpUia+0ef6o=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=baFWFPwMXpfOhehdOttSCOnKz/JC+RicUgERxxhac/8XlLktvu6iC9oI9tuytDILhoMilfKdOpJpVZ+iyKH6IhFa5vilK/d1gqeH9fF4n79PFQcaDtjQulTbftqfboTBa8sbFDpHVuUH3x2uMccBixVmxEPk4/OG/bDiMAzMFFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4Dgz705; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2b740872a01so4520981eec.1
        for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 13:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771621506; x=1772226306; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iG97yZSLFgvdbzdpAHhSKQ8XfJMiN2BdbJJpEYIja9A=;
        b=E4Dgz705vTXpyiy+zU5ZqPw/fLzKiCzX6fXYk4B7FXr41QNOQL04Iqeo6hRueof0ht
         GWNc8HoZxx3H3OVLEBLS53KK6UVWvGnjEF9Gb9zejdmJkyrane6JFFkU9+yjIhHnQtUh
         YUrGTBkCwJ+5vUgKL5QbdYc2XRuje770ZvDQpZ39370pnthY0O2Ui/mVGy3VGVgts9ju
         0OFwgkmw3fVlyL4s2m/0nydVAAXCztjr0c57VDRzxWin+eV+2lwwWVM8rO9cgf+8kgaK
         M3hrc4fIsMFbEKswcJpQglmHXlMu5AZ/PW7kK16EvFHoUp+jSaLbdtDtaGxRXq8TVVmr
         rJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771621506; x=1772226306;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iG97yZSLFgvdbzdpAHhSKQ8XfJMiN2BdbJJpEYIja9A=;
        b=R34SQjSm4xdxGRzvRbzq5fGiiNskUNwO3K77jfqWbwywo0si/Bt/ZjUA7OY/AwHwgB
         S9yD6TKfBb42BOVwB5WDhFCz1QcKayh25kN/lSXDztpDLrFvb4S+lU2ELbSKYj62wnDf
         e2kwd2XZu3UOfTFIdHb/4JtbkT6IEGKY9dpKekU9XnhIbxxSjH11zI2Q3f6aBHmA6P0s
         rn2/eijJTX2kmVvmQ3vpvJKr4eVry1huxFzu4FDhvI4/d6tF+B1pXLDdLtt0x9exghk4
         7melh/PeFrlDwmtyk9p45CC/CqjXM3eqzGy6U2WwwRt8algGjbGLLq2p3JBJ3+sXuLHM
         /xAw==
X-Gm-Message-State: AOJu0YzCoa2nDMHOujGbN/vBydYZknvuBgWlTVFU9MuEV5uJ5IAP8ldp
	MIVMaCvnf/siKNeJsDS0x1HM9SAhMa2M5gR3GygXF9e7/81eMy6s7Se9Ivq7IUzS
X-Gm-Gg: AZuq6aJhZAQChlJKuaa6Ex76UwBDvmU4RDpDxwbkzGc6c1v6w6pNNlAJKcj2nmM4oyT
	8duROJdPbLqJa5+s395rOJdnOLCIDjE/THNCRdm2C58M9kwzuxerecK8GwwiC3DqTS1/ZJPgvkW
	hVek5kRYcKFgQD3zIX1vqD0Y+xgtnWpDEk6s3p2Ee+k9L5k0P04jpOfFZoKKn/0cKVQOhJ4s/Ub
	LRTNS9RUHO32/b6iP0xObzZiCiIeI98omEu1smHWgZRN/E8kTSm5rVQuY9EElNrpaZn6DdmjTpl
	dWPnNoKaBGtQyBZcPX8q1CSFBybYRkxZtqdCrhKHHPRXTnOPxhDKomEHHeANHTTT1AmngZ6vpo3
	Xk5yRPp054H+rIPA4soURRnJfzd3qih3CVNY+Hou5NP+dKUc4A+q/zsJxcETm6iAn7zbO9DE1vV
	FeiFMZD/Jv+dyWrnT30uOvuNc4ljQ8gXgco7rMqQ==
X-Received: by 2002:a05:7300:691f:b0:2ae:5dc2:3b08 with SMTP id 5a478bee46e88-2bd7bd08847mr624443eec.18.1771621506525;
        Fri, 20 Feb 2026 13:05:06 -0800 (PST)
Received: from [172.17.0.2] ([40.65.56.228])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7daccc44sm209010eec.15.2026.02.20.13.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 13:05:06 -0800 (PST)
Message-ID: <6998cc82.050a0220.328163.e74c@mx.google.com>
Date: Fri, 20 Feb 2026 13:05:06 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============4776197505160164408=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [BlueZ,v2] l2test: Attempt to use BT_SNDMTU if output MTU has been set
In-Reply-To: <20260220200850.3460177-1-luiz.dentz@gmail.com>
References: <20260220200850.3460177-1-luiz.dentz@gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-19260-lists,linux-bluetooth=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mx.google.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:replyto,checkpatch.pl:url]
X-Rspamd-Queue-Id: 7DE2516AE1F
X-Rspamd-Action: no action

--===============4776197505160164408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1056016

---Test result---

Test Summary:
CheckPatch                    PENDING   0.47 seconds
GitLint                       PENDING   0.44 seconds
BuildEll                      PASS      19.80 seconds
BluezMake                     PASS      645.32 seconds
MakeCheck                     PASS      18.68 seconds
MakeDistcheck                 PASS      239.82 seconds
CheckValgrind                 PASS      290.83 seconds
CheckSmatch                   PASS      346.84 seconds
bluezmakeextell               PASS      180.94 seconds
IncrementalBuild              PENDING   0.36 seconds
ScanBuild                     PASS      1000.33 seconds

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


--===============4776197505160164408==--

