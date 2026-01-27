Return-Path: <linux-bluetooth+bounces-18542-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAn8I9kBeWmOuQEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18542-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:20:09 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A49AD98F03
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E9183040199
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81CE0326953;
	Tue, 27 Jan 2026 18:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzNrzim+"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92FE2222AA
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769537957; cv=none; b=VUjOslO/FuAmExnRnYsRD/GSS5c/XJjtpWmEeZZOZTZhOJJUkcjXn5+GQfQIrVxjVlQgzgChFqzitSsVOSIder28fOuD/OVhKmVR3Jqkl8DuY6pdeBVhLPAO7E58vPghEtNuHlyJvKb8kGZVGavsUo8F0uP1+CYBEhcOhcYHfIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769537957; c=relaxed/simple;
	bh=DjNZi52OM0SK8WmSfvc5N7fE2ZoGQ5Ekc0znGxsRzzg=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=EK9bXXROU7wf7Z/vw7ZlSYQcpu+0bwe0LYKPYw7HVDomfWXxjSLcPKtUjI7h33RPTqs54zUVZwbbQRBooE+++1AZwdjP8TWKQQle2t9JEBYGRMNK6MJeaDW06H0Ms/qo64dqtzCM9TTUf+SoBWsGXke3oiUdyEAigmF9cAXMEdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzNrzim+; arc=none smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-894a2309a29so1025716d6.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 10:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769537954; x=1770142754; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K+/QOB3MrBo/y8VJL3G37YU9drj4crH0/ob87lzS7bY=;
        b=NzNrzim+2X3ZjvxbODgz9pQC89xIrq4LXC1D3Y0bbVpGOC1+03vyr58ls4qYv6hgEO
         0obCK8b5nvgZj82+N72BDKJcQE75CpB4cxyJEqL9QRnuXv8S0CCyI65Tnkyty9ObkzRo
         yzwrz4MW0ak5EnAT1EfJWrSZgA1TL/HU9SW8vmzGDQK6Ad0h6N3nTCrpIfxPBuMflIo8
         OjUMAP1ISw1wTTDcLGlzrGMiRNq3QpHjFpvGXQDMDmW11Q6vFXzwDjf5ZZ6590YfxJF5
         LpnNfj33xTJlVh3Onln9qcX/2iM7zjLeOBbRMP8Smge7+eKfWsvdAnRMAhFc3IYmBEXi
         y4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769537954; x=1770142754;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+/QOB3MrBo/y8VJL3G37YU9drj4crH0/ob87lzS7bY=;
        b=ULSTDWJVlujXciXrKI/lrxGIBlfG31wCCWRDfR7Jrf68QbjzDdRx6dmEgU8EFF3MFG
         DYgDMjU2Jlt0IYOvIedAWT5PtdlhCYdmZ2Li4ZhCatVaOrv4rROEAbilRQOOJm6rIHTJ
         RNO2PNj5xSZIvFHCyf1BaTff60m7k+osQe26GICo4p1WXifsui6bjWu2GEV8P4fAoHHB
         mEQXKoRVosjwwn3Kob9v0tq7lcptYjKVxTXLB7DGYqGBCdWHCmLBTZiHfIWuuXiupBWJ
         ALjsiA8D5ySJnmn0WCVsZMrS/7XbUa4rAufKeA/hEXKKlqmYI7s4Hm4gqM9lidJf1csW
         5Hsw==
X-Gm-Message-State: AOJu0YzM6abhHwYENFBEsdDXV59fBZWVUo8SRYpgQKMbF24yQpQJ4tKc
	OKR7Zum8K3CBw3M7TDZYStX6zZqhUe2NUX3jUvvE//Fr9fenlyJNaCLa/J3lMsqL
X-Gm-Gg: AZuq6aIFegArGr1gszgAZdg+bYdquTHwn/Gpa7kh4sT0ILRTQ6ghCuOsJBdAioahVHS
	/bi80WlQkaLLwpeKQKhz/4XyWPOhh7vkT2Fg+aVDBc1whQNTFDvVK8xZ4EAAwdqEH/gRw2RNO2z
	p6jqe/s5ooPZftNgaSn9MHRDp/XS9audhO6BGuQ99h92CsjOsQtCtSILrLMBW5o3QTHaJhtmoFg
	WBXcI8HjsjksUb93GhXxB76yXGqEoJ1U1LQBYNCHdKUYaI3+AgLWXsLI+bXybrz4JJ3rF4O2wrb
	UgKocIbPMp3u7uVjMI5f6+9zOPkhwcUGxjc6aMekaARvvJw5f6fPCzi5m5bDUieDfXjCMGqAExl
	2OE9VtiWLdCQ3yx7fuh3EX3olMDVPY1J3F1ZXkunAMYfv8KY5+4HBrQvNTkgVOHwoWKVXf9qLzE
	ALdx+Xg+Pa7nwe1K/O
X-Received: by 2002:ad4:5be5:0:b0:894:6c05:c049 with SMTP id 6a1803df08f44-894cd3206b1mr38550476d6.12.1769537954528;
        Tue, 27 Jan 2026 10:19:14 -0800 (PST)
Received: from [172.17.0.2] ([172.183.89.32])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d375ed92sm1855996d6.44.2026.01.27.10.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:19:13 -0800 (PST)
Message-ID: <697901a1.050a0220.2e9b89.935d@mx.google.com>
Date: Tue, 27 Jan 2026 10:19:13 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============9078004676530771061=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, frederic.danis@collabora.com
Subject: RE: [BlueZ] doc/qualification: Add PICS and howto for the HoGP qualification
In-Reply-To: <20260127171543.151581-1-frederic.danis@collabora.com>
References: <20260127171543.151581-1-frederic.danis@collabora.com>
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
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-18542-lists,linux-bluetooth=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mx.google.com:mid,checkpatch.pl:url]
X-Rspamd-Queue-Id: A49AD98F03
X-Rspamd-Action: no action

--===============9078004676530771061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1047700

---Test result---

Test Summary:
CheckPatch                    PENDING   0.39 seconds
GitLint                       PENDING   0.40 seconds
BuildEll                      PASS      17.67 seconds
BluezMake                     PASS      663.84 seconds
MakeCheck                     PASS      17.66 seconds
MakeDistcheck                 PASS      222.31 seconds
CheckValgrind                 PASS      278.88 seconds
CheckSmatch                   PASS      312.95 seconds
bluezmakeextell               PASS      168.20 seconds
IncrementalBuild              PENDING   0.25 seconds
ScanBuild                     PASS      920.59 seconds

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


--===============9078004676530771061==--

