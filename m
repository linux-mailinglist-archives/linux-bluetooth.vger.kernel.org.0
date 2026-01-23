Return-Path: <linux-bluetooth+bounces-18387-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIGjEJeyc2liyAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18387-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 18:40:39 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C119791EB
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 18:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 949573014C3A
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 17:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D0125B1C7;
	Fri, 23 Jan 2026 17:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6iaBL7B"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E296713D503
	for <linux-bluetooth@vger.kernel.org>; Fri, 23 Jan 2026 17:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769190034; cv=none; b=YtwdIsdGSZFs0Lc1MtN8Lv6fn0iAthGCP87nQYkdl3ciuLAGHVjc0wir7zkhR4OSF6Z9biftU1dvoaqMGwUzRFxWM+XWu1RPoqRDtVlvaZTySYJw3izG9qyyip1nOfdJF3KKXBZ+LWzNYH00bMxp0PKaYp9orOCrGVApYU/WQ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769190034; c=relaxed/simple;
	bh=eFLYMBhRdavDl5n767oY65KSGp2mY2GD7b7h0BedVgc=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=kO/afs8qVEEvF5TRw3kP7tnddHFMHdWA3YNsGKg+cOdTGrmCDN2zUUlGp6kaouQd6BhmSiehVr7FSFaNvU3G4qWPYlu4fN273dbzpW2Wta6l1FcVu6R+XogRCHcGKQwno9zaZsJM7Vh5LfhJ3+HaclunrcAs22O74UIQ2ToxyVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6iaBL7B; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-1220154725fso2408370c88.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 23 Jan 2026 09:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769190032; x=1769794832; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2JhUCH53w2u/tK/oK5dmmXk3/PAuYYk4kd32uoYeEd0=;
        b=Z6iaBL7BIfy1LsqLFF9OwUDApvIe95iDisC5RzzQMJkJzTeHHSuy6QdX6Bo8926wcW
         pNhjugKDfw3b4Ui7BVkzKEWHqIh7qvY2Y2PdzYVtNCpGKOeXc4USzYFIAyD2+Dq8/U0X
         Mls/1nASRxXuBRYynYMuOCMC89yO64tva6fvhPnFygnPZ8U6sOKkuODCzUUsAjwzDZdJ
         zTWwdRUgUqM0LlMP2lJiX4N020tEE/SSC9m7RZJxKiBt698j/xurLBk5QrbuRpZv8AkM
         5BBmVaFdPR/qJCa6gsiZLdjxcqhFF4KCjBx66AQdLakv4cxrw6V9UsdXJ4FsonU7v89H
         oAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769190032; x=1769794832;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2JhUCH53w2u/tK/oK5dmmXk3/PAuYYk4kd32uoYeEd0=;
        b=KuwsmpJxvdtdS7O4MBqJRz0QTkBb9+YuBEUFiyNOU7y3bWuJYU0tRkk8AX4bk+k/Lz
         3JQSs5KxlTcRdE3iAQSL6C0ocqUUdSQUVT3r+xzzMzArmC1jOEmIfrkoS6fSVuMMSVK2
         42Y2BH7OtPCCvVAtBhXperbGrOtjRLsVQ4w+yzpv3SbisiNg/r6Cga/YdQ6/nxvrnzSc
         w2X6aJkgPKb4lUifvXbkURG88HsDMFAfi5tFs/fZ84pa/DXSLw0YOtp4reRUr+7hFDA9
         ZRiF0RR6XUoiaBIC7tnKhUob6vYYW/Kj/dWGhOki2gyyT6pMXdQ3/wc8C1P9txqX92Lx
         nFTw==
X-Gm-Message-State: AOJu0YwEpv+z8TIsSr/t5VW2UPKJR0Dr1umBDgauPrsGDi9A+MzG/IGn
	t66xkN3ObOZzG0JTjYWcKpRl6B1VPy4+1ppQM7oIpCmNI135wbvsDgjEH+Fp83/m
X-Gm-Gg: AZuq6aKy2Yppk8KRtGRZcn+EE8BldmrRV3E0YceeIKbB4fpAeBTZgAXhS9mmc71lm+Y
	U1rkp7ip5MDEdLnWIHW+MfU8d6j+Kfq55aamd2XBJTqWcisYrIxGzKh2du+S5z1e9j7c+bM6l7Q
	DRA6iXnS49/GQw1B09lFQ2PBgz4rJRDXDohm9PkPYoffjFyR/YnH4IHT8/zSk+Pu4YjAouPV4V9
	IdpFITW5Nd89FuG8iGrJBoMJHNjqtxKHGuDAqznDPG+ddctUNnhmZX0wZnU7oiNjyA4oD/chl4G
	RCaiqF+QypobGKwGldIh23h9h3AvSUGXa1bLDLT9vQMUiGk74HiNFxi0QZ/gLbATX7at8yowzSL
	3cu3EHUWSkdAHv1np5XXgiaXvKVDHmzLhoaxGpl11WfnLzhXkHks2iKWf9vlMjJRqpdaha4ZVml
	pSlb78Zbk2PdXv4zGUr59aSnR2K9OI
X-Received: by 2002:a05:7022:670d:b0:11b:9386:a38f with SMTP id a92af1059eb24-12476b203damr4250670c88.22.1769190031459;
        Fri, 23 Jan 2026 09:40:31 -0800 (PST)
Received: from [172.17.0.2] ([52.159.244.176])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d9a4698sm5161537c88.16.2026.01.23.09.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:40:30 -0800 (PST)
Message-ID: <6973b28e.050a0220.285ea1.492d@mx.google.com>
Date: Fri, 23 Jan 2026 09:40:30 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============0727033095230946582=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, frederic.danis@collabora.com
Subject: RE: [BlueZ] plugins/admin: Fix storage file location
In-Reply-To: <20260123164257.853415-1-frederic.danis@collabora.com>
References: <20260123164257.853415-1-frederic.danis@collabora.com>
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
	TAGGED_FROM(0.00)[bounces-18387-lists,linux-bluetooth=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C119791EB
X-Rspamd-Action: no action

--===============0727033095230946582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1046379

---Test result---

Test Summary:
CheckPatch                    PENDING   0.37 seconds
GitLint                       PENDING   0.37 seconds
BuildEll                      PASS      20.23 seconds
BluezMake                     PASS      647.61 seconds
MakeCheck                     PASS      18.58 seconds
MakeDistcheck                 PASS      240.22 seconds
CheckValgrind                 PASS      292.37 seconds
CheckSmatch                   PASS      350.13 seconds
bluezmakeextell               PASS      181.61 seconds
IncrementalBuild              PENDING   0.35 seconds
ScanBuild                     PASS      1032.07 seconds

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


--===============0727033095230946582==--

