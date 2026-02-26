Return-Path: <linux-bluetooth+bounces-19447-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDU5BMtqoGk3jgQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19447-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Feb 2026 16:46:19 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B751B1A90C3
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Feb 2026 16:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 25F4D308CA93
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Feb 2026 15:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A0B410D3A;
	Thu, 26 Feb 2026 15:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NR2On75z"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C0D410D26
	for <linux-bluetooth@vger.kernel.org>; Thu, 26 Feb 2026 15:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120644; cv=none; b=dY2jH95Hl8GyXszYUaNXrsfo2SA8UMNZCUfbke3ZjrUfFNadW3f3GidgalUfcAQT4scCCctKpTdHnRvikR5mPGxuuu1CyVj0WOMoncblpPlHbVho2BJnL2+djLSwDUnlpwfn0n1Rzjm2yivbkk6fV+jrpinqQGXQ0J3Y4Y8v9rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120644; c=relaxed/simple;
	bh=TolCWRaSHCL3XIzrXo933ndL23s39kCotw9NggDV/Lg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iRqCFptaeV1oBWgfxo/BrYhP2lp3D3M1g4ot8QCjLHpoFWb9exyhBvUkaWTjlMBYW+oghd8Vmu8stzZE7XYTSRG/AjYCiNe7l3gQepSuvD37l7urAvoSbAM1kRH4Wh6QtDF/1KaCUPJbzT57WiFqz2gPblBBFBpAe4zjlhhGYis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NR2On75z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94126C2BC86
	for <linux-bluetooth@vger.kernel.org>; Thu, 26 Feb 2026 15:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772120643;
	bh=TolCWRaSHCL3XIzrXo933ndL23s39kCotw9NggDV/Lg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NR2On75z6ychP3QeP9DuRCgBXIdYyZEAanFD1TB2o+p3P1E+tvozeVS/JxljhbWHS
	 W5sDtAQczeuY614EbvHczep0C8viwgDHJ4AZ5mOa8FlVtW4mb+icIPvoIZcmzo5j8G
	 R6zXVJYCkUJAFmDL/ri73cTUHbcMV8M8b7MBvkCRFe7mKHXSGHhcHHnBQIqUczdXNy
	 oGBjp2/ibVOdd7UwzaMEVPEiUthE8I2GO/Hbpzipe3fmh+9CtVx/JwFpXH9DUo2HaX
	 DacqjTUJM9W8G0xY3hjiZItVWtBfCP6CDR0/ZtwrsQMPVoQIGMYkYbLoB61emH6QcG
	 y7r4A4cTWj6Jg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8F56BC41612; Thu, 26 Feb 2026 15:44:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 221140] 0000:00:14.7 btintel_pcie ibt-0190-0291 HP Omnibook
 Ultra Flip 14
Date: Thu, 26 Feb 2026 15:44:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: paolo.baruffa@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-221140-62941-cq8RanC35w@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221140-62941@https.bugzilla.kernel.org/>
References: <bug-221140-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19447-lists,linux-bluetooth=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-bluetooth@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B751B1A90C3
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221140

paolo.baruffa@protonmail.com (paolo.baruffa@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.18.9

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

