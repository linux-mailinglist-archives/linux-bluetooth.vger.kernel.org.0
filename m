Return-Path: <linux-bluetooth+bounces-18825-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CmrFLCuog2m2sAMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18825-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Feb 2026 21:12:27 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F213EC5F7
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Feb 2026 21:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E5F5301C5B5
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Feb 2026 20:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300F03A900B;
	Wed,  4 Feb 2026 20:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zozzb+Pz"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E91831A7EA
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Feb 2026 20:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770235852; cv=none; b=nmFgvOu/hCIGg2Tyov4h7GdkRNHpxIiRuyxn7OmUi9xu8W8OhPgKAOG7fuNetV2hHJIMHey+mRtPjIpAU5gxxc6M3GPx/Q7yODGXqpsEYUIbdza/exd10RsvB0T2BHP0OWd6kE0Sx2eVlYCV8ZW0sAT5gaNOa2XBEJhd+OOTYhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770235852; c=relaxed/simple;
	bh=6gbUlBl7vwSu6RIaZbQwACKENfMG883tO2qqBx1pxms=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=eH49wWAfBHge1w0LCrF15Gve8rYR0vOKYiAbis0FYvUoyx3Fi16dugnJ7nNJhaZxaURknnTgxD1WdhSlCcaxXLuW2waVOjQ5+kJn5iwEjx2zGu5QTOTJtGC6rxM/17/WvhIABq6nkPNKImZVe8gWfBenMiG1dVM/m0YrQTa5C08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zozzb+Pz; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-12339e2e2c1so155099c88.1
        for <linux-bluetooth@vger.kernel.org>; Wed, 04 Feb 2026 12:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770235851; x=1770840651; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ac6K33O6+wzEZldVQZ8mILycj2/5pYCF1G2ECFNbBP8=;
        b=Zozzb+PzthE0DQeSFQMxcUOgU6lcfop9CInjhXFFcQ6kbiKgOdAl4+ISIAXL2T5vJ8
         y7p6PHK+63LjSv9TAlaZCBeYkLfm6Ds+J8ehSGOBrfFY+IjBu6gBxDVnX1JhDraedEis
         Jw0bNhf6uo8xXGBi/rFJL7m3Q+ugs02wVKPSqe2Jc/cQu5yyRaKEz9HF5OeGmX+dxqQ1
         Ks+7K/MrP2l4Q0ZH/RzdYHKkLNFDt2k+cHERE8cYWXNxxvrVFhOv+V3SLtvhqmksF3np
         NtcJi1/DZ/ae9Kirvc0r/1nKL0bno28hW8qQu2wvTCKrkqzEmxBcvQ9PslMWDF6ECB0H
         DJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770235851; x=1770840651;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ac6K33O6+wzEZldVQZ8mILycj2/5pYCF1G2ECFNbBP8=;
        b=KqQqJmkuK1SMAUsCEul/ENWO0Fcfy08iR7UpCXNxRTCdqZU0wTu/9i22n/Qkrczhx+
         W7QCxC+fZYmi5zYt/1bC0uAPkxmV+5tidQxc6p4SgplcaacKJWcHJU9vANWE28w0v5t4
         gpIDipRJiUm5fPFZQWg4QlFuGMG/goXMjvaOeNJ0FpsLpgaiTIBYDbRanZ+Fyw3UK2JP
         6JfPUEJ2F1kymGnw02dTBmFvLB0tk6/9AEGeu8NCrWomSEyReXNsAjSsoh3xKfXus51/
         O+B3ZhtA/dIriOvdFWjk3VnJCQiMrodgVe5MfpDpI4IrMhRKhby5XVLl7V2vt8RjS3MJ
         B3ow==
X-Gm-Message-State: AOJu0Yz2F2CGPAZbqunuPT6MF7iI/J+5TgTB52JAykrAXRTX6HhDp9Os
	AmT1bSoeaUhgA2ru/hEh/FnEOGFRox+ofcAOdD73NKktQ0AQDJ+tu9x1rpX/AzAc
X-Gm-Gg: AZuq6aKNANZ0+Vwh0/RIO1Kc+5Xh4wajiJNL13CFa+UuQS3x6SXs/MFSZyXKEY9Jvsb
	f1ylt6Ik9X0aloM6wxMBZXfmRmgbcjf3YGmsogEC5P6iZWSAygvOo7jfuYaU2hbwJqchkxZJpZr
	5PRJVZpkBaN5IpNhchpFjIKZGJh25aqnbHT/yGzk5wh41WEMlfn4vSXOxqF5IQ4WtNxVyiBWlwA
	Q5OiojWp5wWRK+PvZ2tqzrsPSwVGtfoaVD+eFfRv236KJlLfzgDmwHXX+cwEIUGTsBIIEBcoHbS
	JqqJ4EvvLTf8RbeNV+qFY7t/ZqQsmVY/gkkXIdLwgnWQOt8XoHn5W1IYNeCyTzb+J+LCVpxjCqI
	ZxBx3NlcSMgYxR8bjmUcIdhJOO1lQ4oXLTOWr0nNbxFztjdAqE02y/5xvld8YanYSFcP6rIwZ5I
	afOWqd56JWPEbjwtCHCgcnHu+Tft3m
X-Received: by 2002:a05:7022:629c:b0:119:e569:f86a with SMTP id a92af1059eb24-126fc2c2e35mr208207c88.7.1770235851319;
        Wed, 04 Feb 2026 12:10:51 -0800 (PST)
Received: from [172.17.0.2] ([172.208.153.18])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f4e04467sm2257092c88.2.2026.02.04.12.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 12:10:50 -0800 (PST)
Message-ID: <6983a7ca.050a0220.1cb2be.0534@mx.google.com>
Date: Wed, 04 Feb 2026 12:10:50 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============8350767668018029517=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [BlueZ,v1] monitor/l2cap: Add missing result for BT_L2CAP_PDU_ECRED_RECONF_RSP
In-Reply-To: <20260204185707.2327200-1-luiz.dentz@gmail.com>
References: <20260204185707.2327200-1-luiz.dentz@gmail.com>
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
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18825-lists,linux-bluetooth=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mx.google.com:mid,vger.kernel.org:replyto]
X-Rspamd-Queue-Id: 1F213EC5F7
X-Rspamd-Action: no action

--===============8350767668018029517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1050866

---Test result---

Test Summary:
CheckPatch                    PENDING   0.37 seconds
GitLint                       PENDING   0.41 seconds
BuildEll                      PASS      20.80 seconds
BluezMake                     PASS      648.70 seconds
MakeCheck                     PASS      19.04 seconds
MakeDistcheck                 PASS      247.83 seconds
CheckValgrind                 PASS      298.90 seconds
CheckSmatch                   PASS      359.17 seconds
bluezmakeextell               PASS      189.42 seconds
IncrementalBuild              PENDING   0.42 seconds
ScanBuild                     PASS      1039.75 seconds

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


--===============8350767668018029517==--

