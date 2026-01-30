Return-Path: <linux-bluetooth+bounces-18774-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NjmXK585fWnAQwIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18774-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sat, 31 Jan 2026 00:07:11 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08452BF4F0
	for <lists+linux-bluetooth@lfdr.de>; Sat, 31 Jan 2026 00:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 594DE300B9A6
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 23:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37903366070;
	Fri, 30 Jan 2026 23:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0Q5OhLr"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B3936606E
	for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jan 2026 23:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769814425; cv=none; b=n/jkTC/oHNw4dFejB4zqdvWrWZ7Ln7+097KhtUvrSw982kWZGU0svYaUmKvUCXgnpL3FxrtIK/QDpeK2sCoJIeoJs9IGR1yA4KLzxJ7DJo+DuzJTvH8TrMxdNBSrPOXr/lJheHytzvJT2X6YFOdeBpeJQHV3wSxrn8h0tKynKC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769814425; c=relaxed/simple;
	bh=1ELipZR4cSGn42MNkS1/i/ceNRLZlmXwUrdd58Oq/18=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=rpPzaDcZJfhvQuNm6F/Cxm53crxOimZ8nBFPyhD83E4Dsvhuu29dahZT6BU3hD0FRuHduyN9xEmwutuX53CCrnuCWujFVEIjzW57KYkMvFuh6EOx8JtolxwB45USJrVrfCBf1MdD4RALIhBqf/1xvJvOMO+OrXChQDBdwQ+ueYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0Q5OhLr; arc=none smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-8946f12b1cfso30868706d6.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jan 2026 15:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769814423; x=1770419223; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jez0IkTk0NZDB4VmR+MvAUgyAD81bjJnChVoja+Vsd0=;
        b=S0Q5OhLrOBTqM3mt5PUNT3nmRMwVai5HVrp9PAW3VIeqBUg6nWtYs+xNHL85xQkxpK
         VLLqV4OmtAJpvIizaoYg9t7l8a7gmnFfmmvekSPZflxedqcmTvLGrk/DDI1rXLI4trQB
         4CFgLB3Rw2bN2mkyEuO4urcciwIi4ZgJgXio13QUisRrSUuEy2ZcFbZT600v2dFV8oom
         4nxux1G32BO942ZJpz5IwYixHXHzu0owqttiLhMK9DHqADkWeVGfHUhgffm1HjQBAfc/
         XYZbTz5jAfl7q4MNZIvgj+PxfxkpJLkdrd2gGwHnroR/3WDgipbsPk5d3IVFKxb6U6Ol
         KzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769814423; x=1770419223;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jez0IkTk0NZDB4VmR+MvAUgyAD81bjJnChVoja+Vsd0=;
        b=L2m4W0waDVaY78UjQ814qcsmD8Ta9fZZOw9MtUtefgCUW+zs7ykBRTw12yy6bnYxUW
         /O8/1vgiulyQs+KKCIz1Q5lHDnzUaYxnwrVS/li18WS5Xc0qAasX3MxEIAMnlr6F6eCu
         uP1Ig/ry4QmfruPaGa6F5/+oaNb8s9Dumze6mQpjqD5PTvBfuonYIR35bZq5ymUqH2ya
         EFlbVpsbr2XHqD5Mnb3+XxiOzGgzXmJ4UfNeh82MZ+lcjHrZGEE47QA2FFv0pDrMzYGN
         vzvqlaDpi5RxUj0pkkPe9TxJNRmGz3DKKkObQR24Eob8K+4aB6Niqd/Up00OjfKUVtFr
         /PdA==
X-Gm-Message-State: AOJu0Yxkwe6LzTorinbFYNxdXmdwDWWqAJG++A4KdCkIxghYb/874IUZ
	2iUfK53spYT8e2M/XgXeuBjlYnRGeiYMPmr4ElOV5YmFkhAdrQQRIUvjiSl+YKrj
X-Gm-Gg: AZuq6aIuS3m4+p+M/KxASvLBjJZ2rOyodHCAyFYTWMbFetbaVDLzxeZ5RMFTS22r84T
	RymQBZCUvOCvv7zNcFS4DwUXfXiiffd3CL3JP00E4UTQ2ECqDX40Fs+aSTcceXAAEkLXBoJwnZR
	O4bLUPNGUrKzviwCEgkkQa3+nxc5gONGRPJSqVA3hRnDlG/uQ1HMARdiKIBOeBrvSkSSm9e/pn6
	3GCEd4M1fOI8bmuaA9UFvxY2pjFpygnoIFLRoPWdnN1dHB4Pe4mTvuUFoy6/2Fr70jBrOZER81o
	upiPVnZpSuSIq/yc75NGw3wuoIWUzFwnmRn2vu/CuHy4F1M16h2OQE9XSjA6+BTQKNXA/f3z9Fa
	RIkoXpjmhe1GXxFnUTQ9c3t7zbkEFM/pOV11UJYBNYrJzITSPDHmXxkyeUCJ8HccxXu6Bo1l4w3
	iQePdAquq+DOZKKiGQ
X-Received: by 2002:ad4:4eac:0:b0:894:7144:756a with SMTP id 6a1803df08f44-894e9f756d7mr56204756d6.26.1769814423166;
        Fri, 30 Jan 2026 15:07:03 -0800 (PST)
Received: from [172.17.0.2] ([48.214.53.112])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5033745c4f0sm77102991cf.1.2026.01.30.15.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 15:07:02 -0800 (PST)
Message-ID: <697d3996.050a0220.1f57fb.3441@mx.google.com>
Date: Fri, 30 Jan 2026 15:07:02 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============5565150516896988482=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: doc: Add cross-references between bluetoothctl and D-Bus API docs
In-Reply-To: <20260130220229.1346261-2-luiz.dentz@gmail.com>
References: <20260130220229.1346261-2-luiz.dentz@gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-18774-lists,linux-bluetooth=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mx.google.com:mid,vger.kernel.org:replyto,checkpatch.pl:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 08452BF4F0
X-Rspamd-Action: no action

--===============5565150516896988482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1049160

---Test result---

Test Summary:
CheckPatch                    PENDING   0.29 seconds
GitLint                       PENDING   0.29 seconds
BuildEll                      PASS      20.01 seconds
BluezMake                     PASS      651.61 seconds
MakeCheck                     PASS      18.49 seconds
MakeDistcheck                 PASS      245.13 seconds
CheckValgrind                 PASS      297.33 seconds
CheckSmatch                   PASS      351.08 seconds
bluezmakeextell               PASS      183.04 seconds
IncrementalBuild              PENDING   0.32 seconds
ScanBuild                     PASS      1024.57 seconds

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


--===============5565150516896988482==--

