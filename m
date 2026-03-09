Return-Path: <linux-bluetooth+bounces-19941-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AakFMq+rmlEIgIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19941-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Mar 2026 13:36:26 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F36238F29
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Mar 2026 13:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 142AE3097A44
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Mar 2026 12:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE1A3A5E84;
	Mon,  9 Mar 2026 12:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODs+Dylp"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7140B362129
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Mar 2026 12:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773059341; cv=none; b=mkJs5tOinKsoaoIFKoQ5pL8DMlYMxBemjZTlCxCXGHy2YsydmaK47wmpuuFMvmfW7gBl/mP5fyp8WK8DIQn74gILAGdp7xogVMyglbMih2RoGVAriE7OdDyxDJFnTXS0+m7K+9ysf1MKA3HMwEgqQgpAA6hnZiysn+PaCgN3h2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773059341; c=relaxed/simple;
	bh=wmlmAkyTnXjzM8wUAyUX41Hu6A3QQtIwnj+xGxBckTk=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=i0/B02brK64gELlNtvqEw72+1MNKUs6bJUBGtx4Yg8W2tW7uS9KcjSow7NsDLRci6JRLuetI69ZYGpBJW7jAD0tnTDAdYpg0mJjwdVvEkrmGT5G5Gbx0FAxa4uDZwwK0bwQi5oDDUBVYhE4HIaiofy0zsaMYBZCINqHjol/1xlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODs+Dylp; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c70b5594f4so1176895385a.1
        for <linux-bluetooth@vger.kernel.org>; Mon, 09 Mar 2026 05:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773059339; x=1773664139; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RFaCAbFwUCKV5IU8rEeYZ/CvxNA7pfncO9DXIvt4hCg=;
        b=ODs+DylpU5AGTvASqZg1OYJUK6M9sIb0W4ZForFMMQMnoUMsBwXRXdv5RnTX0TPpKV
         DeTJMicH/HSoiDVfKVlYXSyeoxBm7xqfuOeQwT3fL3XWkHQS27MGM/T9xEcsfsS4Vvsv
         IQW5Dkqdz5u1TCN99Ce2fu+3XsGtup5y4yvlZV6eCxS+VE0AHNenw9TkJKsBrADBa+Fs
         rc/gO5MYOPKMcuBbXXAgk7lMLaEkt9niOpE5fYwYvmE/Iu6dYeOuZwsphR/Gy9rJoMpT
         ndTJ0fB3rez797duw2EnNiPJGcfBr70zeiE9qfotONvl6aUfmjPV3AgMiMSi84VBrNSZ
         2a6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773059339; x=1773664139;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFaCAbFwUCKV5IU8rEeYZ/CvxNA7pfncO9DXIvt4hCg=;
        b=bTsMbHKb3xusRNQh1mLfNCMmU8Yiif2xVyRNnJ13A5bMi54P7J/PKlp2WCh1WXLRcI
         DFhCTVhu5oupHqToKRULBS5Ga0ja5UzCaa33J302BS+tVPfz4FRXmO/mfC1qjRFEAXB3
         HYe0Wkr2aX3ZAbrgJiaQ4D5YHG4ygL2oWSEATatiK4R4rd/KmwalqSpHPndevigZ0i2X
         EaMER2RdJ+oqSIxT2Z+hMj/RcdIpbvLVnSSWkyWy7IHicv6Fn17ECuSORua9xkHs8SOn
         OW3xlhhxd5DH9KF7qvUTe8AZ3Yh1TBDb29Fu68bfPKd8JHPv7a5TUFAOXu7NTrOqAggP
         vCjQ==
X-Gm-Message-State: AOJu0YzcSqDWvlREoh2qZ1P0kQYVU6LNBD2ECiChsofOtHanYoKkOnFq
	XJT8mbcFx1120igGMdnnO3oKLQ8dRfGKftcaL3cy8E9VdyvspKZaLSrV8PXE4Q==
X-Gm-Gg: ATEYQzzMcFqcsQTI9fFThRt5gmQiH6khoyA+Zk3PXEo1rV8KwWwxYM501P7sbNk7Tgx
	EQ1fCpGT0V4wn5GZZO4TPd/j+Ax8N2U71eq0PMQ/YuXUKCNxg4mXZv36OkGyB9Oaud61mQs71vg
	8Clc15VjimDfp8zZpC5FrhE68myZxo1x4Jlbb+vvkD5zdJmZKbX2iA5m1PISUzwGMjy46jqiWht
	lKCEBfb43jfnPe6bbMjJShQs4fsq+z0Fg5cZz7TQ/xYj1E5Rt37hw2ycHZxuWmQ+/WvKwuoY1SL
	Oo+Ix4mDSJmHKOxggNzvokwkWEdnoZ5XX4zfYDrlkDgVLFOXK92dd7C8dnfKp5YDN5i4x87/1ZY
	78aei4uU4bSyWaoAAPcyyraPdmN/YXP8XRXTCyuWORO6NI7YfUcjo0Y2cJSpOB6XQKrJevTk7gq
	HnPHt2wCmOVEY6+4CbicQ/W0f/Sjon
X-Received: by 2002:a05:620a:459f:b0:8cd:9281:2ea9 with SMTP id af79cd13be357-8cd928134d6mr24416685a.36.1773059338671;
        Mon, 09 Mar 2026 05:28:58 -0700 (PDT)
Received: from [172.17.0.2] ([172.183.91.33])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f484288sm665787985a.7.2026.03.09.05.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:28:56 -0700 (PDT)
Message-ID: <69aebd08.050a0220.104848.e7de@mx.google.com>
Date: Mon, 09 Mar 2026 05:28:56 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============8063172814741379442=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, jinwang.li@oss.qualcomm.com
Subject: RE: [v3] transport: Fix set volume failure with invalid device volume
In-Reply-To: <20260309111826.3998132-1-jinwang.li@oss.qualcomm.com>
References: <20260309111826.3998132-1-jinwang.li@oss.qualcomm.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Queue-Id: B1F36238F29
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-19941-lists,linux-bluetooth=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blueztestbot@gmail.com,linux-bluetooth@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[linux-bluetooth@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.962];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mx.google.com:mid,vger.kernel.org:replyto]
X-Rspamd-Action: no action

--===============8063172814741379442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1063601

---Test result---

Test Summary:
CheckPatch                    PENDING   0.31 seconds
GitLint                       PENDING   0.35 seconds
BuildEll                      PASS      18.10 seconds
BluezMake                     PASS      647.42 seconds
MakeCheck                     PASS      17.80 seconds
MakeDistcheck                 PASS      224.06 seconds
CheckValgrind                 PASS      282.15 seconds
CheckSmatch                   PASS      320.31 seconds
bluezmakeextell               PASS      170.43 seconds
IncrementalBuild              PENDING   0.87 seconds
ScanBuild                     PASS      950.75 seconds

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


--===============8063172814741379442==--

