Return-Path: <linux-bluetooth+bounces-19917-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ELkA1uFrWkx3wEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19917-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sun, 08 Mar 2026 15:19:07 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 044172309F3
	for <lists+linux-bluetooth@lfdr.de>; Sun, 08 Mar 2026 15:19:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4EE3F30069BB
	for <lists+linux-bluetooth@lfdr.de>; Sun,  8 Mar 2026 14:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FF21F3B87;
	Sun,  8 Mar 2026 14:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5O/KUq8"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC0B16F288
	for <linux-bluetooth@vger.kernel.org>; Sun,  8 Mar 2026 14:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772979540; cv=none; b=hbtq5IDX5WdmIXHp5eGQFJjrj6+hsf2GwdDLnJKCRPzKek+g9nd2Ku4ns8uvJrv8vx20GIIea7zt03Nak7z8GaJ4ci8asKle/BGxMi4EYe6FUn0qrEDON03Zm1eKNQz2MOIRd8NR4IFmJ7+b3qg3xQBqOfID+J72BA+EuiaoLrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772979540; c=relaxed/simple;
	bh=aN+TJ0bdEJP01M4g58sWIxCutZmYQdd7GdmFLv2XgmU=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=G5B1lnNkTUafF2TM9Kjw0kpCz6Xmwku/GLsUL+stbPoiGVuFKYlYm3BqtQtVzXutj+Y/F+5dRPx3rK3E4wZsZOPzZCP09KBum+uLvfpdqwV3DfkO6+CP59yW0gzKMq8Qn0OdQQLLullSyda2RMardmhfFKUBp7j3mKzBkcAnIbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5O/KUq8; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-67934c83063so4153990eaf.0
        for <linux-bluetooth@vger.kernel.org>; Sun, 08 Mar 2026 07:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772979538; x=1773584338; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DdaeBH1Rdm6hAV49CDyhUZbu/tTBP5IMDhnUSHMJ4iU=;
        b=f5O/KUq8rTKP0JHGYMfdeSgMNQqY0Ows04o3I73tX2eLw8x2vUizbqmAWMTKyx4xi9
         uVpB9asyrQ2JtH/qYOH0W0xYW54mKTxK0Gnz7ufl43P+9qpbVAxLHEAgJRZCDBCHJt/8
         Wj20wuN9MfhTLlPWC266EU8/6G0Spf7tGge+HXkommcmJJi/2MPk0InUZMb827mSDM4d
         G14SRhGnCUyBYYbWNGQWSJ8f9aHDvoDL/+p6tIQPsy99yyubY3Wl2tP21cLir+ZA7RRP
         6euQe9/D7RfOeYDRfkG9LBoQouGW7Ll1u/gSwabuiFdE+2kNrKQMUNlO7JJSO+Ta4gAk
         jDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772979538; x=1773584338;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdaeBH1Rdm6hAV49CDyhUZbu/tTBP5IMDhnUSHMJ4iU=;
        b=eKMBclRpSNXxMOu9xHT9hqQ+yam8cakpSdLiAoaxhxPFaMya+i+3t4BIE2hPLw/mRx
         nbyQTKnQuVXRPTkSlFw7E1DVpTpP8A3mczMH7x73S8zPslEykFGU5aIQd3ancFTXA4w2
         g2istT5u/oOnG+50Ns8bLjJDAmz+ZZIVDlZCK/i/ySWqWSXXpD3VBfdaAEDLI+7h1vIv
         ZC4g4Q/6SlYuSe3KQ5QTjkzK/W8jUuDHOHgbdQOnN7S81E+a0B4ExiGyuesxGQNI9np+
         4xC/vSeoYiKtCIDriWqIrZFDbMp5PuzefQDLK/ImyIpq3VEtDOBnAcQt2x2eYamVE4ZD
         Qv+A==
X-Gm-Message-State: AOJu0YzKwaXxig2LpYTnJok/ailhBKJE3tMAIajeh3w6o0fC73l+q+qY
	VB5PK7rqX7z9HxONNam6qlNl4jsxoPg4sPmdP+c8PVsKZyKYap35+2ynjuT84w==
X-Gm-Gg: ATEYQzxWQ0dpjP6+RwEHkIWvkpCyxXtMGOo7mUrYzzgci2FVaqS/9vnIr2AdPrSnGuf
	9v8wrSYcB0hOb+/FKoWugRESR9HlGUDDLbINAOUlTilrbZQ24rtw1TX5lPheV1dNNjhJa3eADCV
	RfrHsCBF04DwPkc+wg7q311598C5CERxSexAhxrG9Wh+WUoufHy7MgC6mXUMKIx8oJnSCVsjDv7
	jW5HMtmwkHCMaDiLUY6brebXq/OolLDFWcCKW1iRoU6GEumDWPBW3J/BZKy4J0afgssoFtThBbF
	TDHuFryDAXpOiMlwbhoR0vQBvf3rF+yFrq7cG39TQBm0dRRU/CAGbQlEyxO/cvbrOLt//vRmbA1
	IhZT4LEjwgvAM7AkZxP4lYGGIIpunlITKEe3nSYU5iYibOxv+tbeKIjOrOOwSfvcY5oB7ZBIuUF
	yX9S7sSfAZPP//nSNNo0fieHwSquFV9A==
X-Received: by 2002:a05:6820:4987:b0:67a:2305:5e4f with SMTP id 006d021491bc7-67b9bc6c990mr4156141eaf.13.1772979537953;
        Sun, 08 Mar 2026 07:18:57 -0700 (PDT)
Received: from [172.17.0.2] ([52.165.213.180])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e688d587sm6361356fac.19.2026.03.08.07.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 07:18:57 -0700 (PDT)
Message-ID: <69ad8551.050a0220.661bc.4259@mx.google.com>
Date: Sun, 08 Mar 2026 07:18:57 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============7128471520723303872=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, martinbts@gmx.net
Subject: RE: Nintendo Switch 2 support
In-Reply-To: <20260308124745.19248-2-martinbts@gmx.net>
References: <20260308124745.19248-2-martinbts@gmx.net>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Queue-Id: 044172309F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-19917-lists,linux-bluetooth=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmx.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NEQ_ENVFROM(0.00)[blueztestbot@gmail.com,linux-bluetooth@vger.kernel.org];
	HAS_REPLYTO(0.00)[linux-bluetooth@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.959];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,checkpatch.pl:url]
X-Rspamd-Action: no action

--===============7128471520723303872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1063221

---Test result---

Test Summary:
CheckPatch                    PENDING   0.26 seconds
GitLint                       PENDING   0.28 seconds
BuildEll                      PASS      21.24 seconds
BluezMake                     PASS      642.66 seconds
MakeCheck                     PASS      18.67 seconds
MakeDistcheck                 PASS      246.70 seconds
CheckValgrind                 PASS      298.72 seconds
CheckSmatch                   PASS      364.69 seconds
bluezmakeextell               PASS      182.79 seconds
IncrementalBuild              PENDING   0.24 seconds
ScanBuild                     PASS      1039.90 seconds

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


--===============7128471520723303872==--

