Return-Path: <linux-bluetooth+bounces-18399-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFRVEmWQd2m9hgEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18399-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 17:03:49 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B14F8A750
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 17:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 262043016EE9
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 16:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A392BFC8F;
	Mon, 26 Jan 2026 16:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDQ0tBrF"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A910D283FC8
	for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jan 2026 16:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769443422; cv=none; b=tEnXVcCe3FeeJjK/AwWXrwoIq3KxUHBHruiv81SIOzueFoDXhb197Ubxz7DYbSLqK/MxsfN29f70iL1J5Poi3gu79puko+2VN+Ilue3MWakee3jq4ROLzSIY/wEzlNPIpQaivUglbxhU8HZg47daTvNzJo5xeqB2yKs2gEhoRpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769443422; c=relaxed/simple;
	bh=7w4kwb3VS5SbAF1pFq9+GvYCubN7fQbs3aYxO8nnL0k=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=O588rSZIQPy9ezNLip+EhpbfEWJASHLiI/9CAPNVTi/8rHnXpI150nPj0RUmcHLQ+TrRl4TmgNcpuhhZm9WZxIDpkA9PaFA1A/nCKzrAm7LuLJ4kpj4hnDgnOkV/qx7ipSMyzCB/d4wNh4Vn20SFZlX8X71AYHNcyKy21JQIpr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDQ0tBrF; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2b71557299dso6596108eec.1
        for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jan 2026 08:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769443419; x=1770048219; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vtSU1IJb2zGLe8t8v+PaG58KTZDs+dtHTA9Np+rcBes=;
        b=hDQ0tBrFH3oIwY3J03pLmeRwJ6uYnpPVJ605CLuDuL/lxDfDp385AdJSKEpSuYk7bn
         olBxqRSxXXurqVIomePBl2FNtoL/PspU1GmBYcDgegtm9kd5d3g1NxGbB6LnGV8r6Q24
         ZMSuep8vejyD/d6sNBw3pGvAgDaI3RP2qeclKdlIPKora78fKJLYmiga0ZemumtsO/ys
         dtR4bytF7mo+Q8c/XuObMGnelygFvDxOo8OhzXZK6Q6iFKMs7E1g2TX7QioHr9Wpszvv
         VD2q3oPLbe6AcjTQDZxHB33L7SZ63Ffu7Yj99d4Cg2je3YXY/LF9uckxXkHQuVbC5Kx8
         duKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769443419; x=1770048219;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtSU1IJb2zGLe8t8v+PaG58KTZDs+dtHTA9Np+rcBes=;
        b=QHfLgQmnklphZXgHXYJ+TdTcBiG7HV6nO8LycFiiD3LeDv8wZNbqvAGSRZDQHxyZ+A
         GHZy0USo4zdqa8n8gfk4E9pQ7Q6VCjx+/thnYnERznbR0S72EjxYaHAC5Sn1k0RkhKBJ
         ZnbC4I+p9gufZKR1SpTspfcBaWxFMvu6U9aAgSdKjnsOBgluWPfdNoI5yFyML+sdUrAs
         J1m5jyEvfffEe0cwhzQddj1AFH3ndja/jJ0Jj4fc++w5qCHAlrvFVpFWiaHgcE4lbNOt
         kD5pgMiRd3Jk4b+icqLqkLPkaRbzb04Noc3zEb1LnXfdnaU+pXfQV6/j7tttrjAjXHZb
         8wdg==
X-Gm-Message-State: AOJu0YxSFsbZbwc7ze+eIKobHa03sNIoynfqlJhumlG82yTMuhBqKd6U
	aASOBo/HPqXFs9qOMTjv8cVBLmpY+Sn8vhJUErpFMmrIFoZt4mvR5MI7eY7EpBfU
X-Gm-Gg: AZuq6aIQKyI+Hzx1yUnMS3ZbxmoWobbgCTjvlbHvxelXbDBgbRQN+qp+T9+1xeLjN1S
	GiFt2Cx+8lmg4mRPgv5/WZ+FTZPguw2uBmGogqH9IR+REsDb90db14lNN5cy78mdoiEjGzwDT0A
	4tqFMxrXyFvYFOPLG7+DH8PM4puWTpDdFO9Rh1pscIVtKdIs0Ym/cPEJZU3X5dgociPLtJ8GiHY
	U17SgJxlJURyuyceakY6oPcZHi4/SpyZA3RFaYl3jy4gMU7dO9Zhb6h1rvTpqumPY8tUavggbzw
	bgQx54YA1oagiUTM3mRGcDxvLnmfW5zHWB9X1enukAEaw/x75D7SrNv7oLf57TNVlnM+N/e3wdf
	Scl31oMfsbetOmr9zpBnBqbrMqhGHQB1Sk9DyAkHSOHjzwfza394bODRGT05z8AEYttcjPhBZHh
	caSD8633+7NiJxE/Fo+zE=
X-Received: by 2002:a05:7300:3c05:b0:2af:7f2:50b3 with SMTP id 5a478bee46e88-2b7642198e4mr2145041eec.5.1769443419162;
        Mon, 26 Jan 2026 08:03:39 -0800 (PST)
Received: from [172.17.0.2] ([172.184.210.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a6c4a68sm16100613eec.12.2026.01.26.08.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:03:38 -0800 (PST)
Message-ID: <6977905a.050a0220.10e47.0f5f@mx.google.com>
Date: Mon, 26 Jan 2026 08:03:38 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============7382163692245044196=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [BlueZ,v1] shared/tmap: Fix TMAP/SR/SGGIT/CHA/BV-01-C on big endian
In-Reply-To: <20260126145752.3528305-1-luiz.dentz@gmail.com>
References: <20260126145752.3528305-1-luiz.dentz@gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-18399-lists,linux-bluetooth=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mx.google.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:replyto]
X-Rspamd-Queue-Id: 9B14F8A750
X-Rspamd-Action: no action

--===============7382163692245044196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1047158

---Test result---

Test Summary:
CheckPatch                    PENDING   0.47 seconds
GitLint                       PENDING   0.39 seconds
BuildEll                      PASS      19.97 seconds
BluezMake                     PASS      638.41 seconds
MakeCheck                     PASS      18.87 seconds
MakeDistcheck                 PASS      240.14 seconds
CheckValgrind                 PASS      292.76 seconds
CheckSmatch                   PASS      347.94 seconds
bluezmakeextell               PASS      181.41 seconds
IncrementalBuild              PENDING   0.65 seconds
ScanBuild                     PASS      1018.03 seconds

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


--===============7382163692245044196==--

