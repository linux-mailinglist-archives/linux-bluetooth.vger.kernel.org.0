Return-Path: <linux-bluetooth+bounces-18374-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FhaM3Zgc2kCvQAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18374-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 12:50:14 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7417561D
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 12:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67C43303429C
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 11:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB6E2DCBEC;
	Fri, 23 Jan 2026 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2BvHiqa"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9C12E06EA
	for <linux-bluetooth@vger.kernel.org>; Fri, 23 Jan 2026 11:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168874; cv=none; b=m3X0sYAGwgKKMJy8Y+aM3VY/p3zPoH06qdwk4l/iqoxo1ada5IyaCJIkOzGJGMrAq0bModXmFVoYWi3/Ev0aEWnwvdIw0vTmNXEC4gLNOWesAd3TRkpPSSiMIpVWM151KIkGHRyf0RK9ZVfMbpCXeM3CfCVj/NQlbPsKGohHPLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168874; c=relaxed/simple;
	bh=pLQKTHfiPTjC8ouZLm8Xvye19fTurgiw4/FNaUOBFQ0=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=amEFTKeDX05Oyko/gg8WTZFIKL3hMuKjK5xjluwXdsfnfWdCf6F3NgzQTvUnXWkOTE/MSXDkpU9Dp+xHNXjZWkXjkVprLIXtOGjl9BHCPiQ78UmmQ7XsFFf/hhCWbmBDYD6tMpwGVz+PY0+fxpaUl5nzdpszsR/rAErnjXgCPW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2BvHiqa; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2b7381d2d95so542323eec.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 23 Jan 2026 03:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769168872; x=1769773672; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JkqK04Cl7uj6K5EE7NLUnvk8//EqFnn9g493ZY6fRfA=;
        b=h2BvHiqaFVdnKWXT5raqAfmrnO4jRxXihvDQEcDHqhCtzkOMz6iODoEpohr4FC2tDD
         9fd9JSq5/QDw2lJY76/Hkg2XmmwF8s5itab7frT2uqqZUV8VnXL8gen9/yV8T+8tYzUp
         hrOMB83ytzJzDhu651jXScvZ4S3Vxn6DQgO0/yr0GCxfNMsSUe1dSdIKV16IVoroyPJL
         js/wToVM/pq5WA04SOPoaLdepJMItiNW6HWOU0o+LKDRCkHQaEDIQV52H0+26DWddGug
         FAPya9iSijlcgEfI+Qa3r+8jl0mgb0DFpV6X/wxxMTF87GKDNke0CNObX6eXp1mXaQRg
         z1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769168872; x=1769773672;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JkqK04Cl7uj6K5EE7NLUnvk8//EqFnn9g493ZY6fRfA=;
        b=uXkkg3ugfGeSXhxtkpCKviT/xHYEPQ5t9KiR4lx/wQkAUVAt+n9+9kspfoW+HNpux9
         d9ONTT0jkL02RTJe2tHptinwKR3AGO2SwOeee4WIrU76PG5Wk1qu/uNe/XzvLCgSpYxQ
         K2++WqBWSDQIyvby6rh5HrqpxO59Lb8fne0vMtcfYMHlS23cB6ae/x0D5IoDhQ2IRWZq
         5bzVz+HqXt77CwhMVfI8jpCKc5fZjzjgfwRUKn0Ve9KdksN/846o6aiT0vzUZS9QAXbW
         4V+F58ULHDm837g+czJ57ELpCuyC3NoBvpLAuvHA9Thj24W6lvtGy/QW5HajNxiJ7+TB
         /BDA==
X-Gm-Message-State: AOJu0YygCNvqYzAx8W6XmwGIip3KCsIp6DWDUOhtarm6NMVqaB5SyD9V
	EE8w58Dl3tl22ddD7a2tDzYW5/XTLYsjsCTStarO5pUrjP0gI+urEkHyjvd9ETds
X-Gm-Gg: AZuq6aJ6eUc2UiBWbBYanDCD8nb3tA9m54AsFMbARTxMdHSVlgZu6USDHirLbAG55+W
	wVtcHzUzbz7lo4grurFFZ7FW0GHmPJD9PBVsLN5nl5nx9vCLChOHyK23Xo487eYrF5gpMw7cSjx
	rR2rj1X+lS5Ga/U2W9JxTqqSFij8tXgI8tkGBXEgBt218FI4r7aoBQ0mLU6+YPzP32+DGWtFWo6
	Smvi+bVhUHERCzHGDJUgw477hnw16GGX6y0V9h57orCJjN0qTET7gy27b3NKS3locHFHmZnmAlb
	DkbmZ+Tt2JSDaKpXt+E0/xW1jIjjAUuffsxqiLqtqS3z47jI6gV7IZ1s3dSTXembAkhaePgKQ92
	B6EMGFnIbK5fqnLvAcp4J99nSLMja0H9wKXJTKOJ1N6zzMg9SPCmEqAm/K+0VN+jYyt8Pohxq5Y
	+pkVd8ZF6qKmSksQdi
X-Received: by 2002:a05:7301:fa87:b0:2ae:5b9b:c060 with SMTP id 5a478bee46e88-2b7396cb38emr1297643eec.6.1769168871828;
        Fri, 23 Jan 2026 03:47:51 -0800 (PST)
Received: from [172.17.0.2] ([68.220.62.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b742c4043asm890248eec.34.2026.01.23.03.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 03:47:51 -0800 (PST)
Message-ID: <69735fe7.050a0220.17c86f.904b@mx.google.com>
Date: Fri, 23 Jan 2026 03:47:51 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============7338971043881124138=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, frederic.danis@collabora.com
Subject: RE: [BlueZ] doc/qualification: Add PICS and howto for the GATT qualification
In-Reply-To: <20260123105338.677646-1-frederic.danis@collabora.com>
References: <20260123105338.677646-1-frederic.danis@collabora.com>
Reply-To: linux-bluetooth@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-18374-lists,linux-bluetooth=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mx.google.com:mid,checkpatch.pl:url,vger.kernel.org:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9B7417561D
X-Rspamd-Action: no action

--===============7338971043881124138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1046203

---Test result---

Test Summary:
CheckPatch                    PENDING   0.37 seconds
GitLint                       PENDING   0.38 seconds
BuildEll                      PASS      20.01 seconds
BluezMake                     PASS      637.97 seconds
MakeCheck                     PASS      18.98 seconds
MakeDistcheck                 PASS      243.42 seconds
CheckValgrind                 PASS      295.95 seconds
CheckSmatch                   PASS      352.21 seconds
bluezmakeextell               PASS      183.22 seconds
IncrementalBuild              PENDING   0.50 seconds
ScanBuild                     PASS      1020.91 seconds

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


--===============7338971043881124138==--

