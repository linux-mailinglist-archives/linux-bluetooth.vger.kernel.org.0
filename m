Return-Path: <linux-bluetooth+bounces-18819-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEkzBC/tgmmqfAMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18819-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Feb 2026 07:54:39 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA5CE2715
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Feb 2026 07:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04EB430186AD
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Feb 2026 06:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8FF3876BE;
	Wed,  4 Feb 2026 06:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9q1Gy5K"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8BA387593
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Feb 2026 06:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770188073; cv=none; b=rL4w0oe9iPmIL276jcypGOi6tOTWcY54UFZZbO/4Nm1pzQO4TjSrcUFf/jDTS3vazEkeG2O+514Cql3SxYYOSkLF9sREr9T0NUJYfK3zhMcxfRjNtH14IytbNW7AbjzfNJUkok/SgvLq8jjqJ99o4OxmxWs6UzzryePPtyljV1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770188073; c=relaxed/simple;
	bh=k1louEX48bOyPYjjyyX7S3hm8rwb73te9+Atmg1ovZE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EHZJwaBkhOMp5OjXSrIg5gGIWMgLMt8kUfuzRjjVtfrjVquOo4lQpxslQ9IO7SHCvJhZRtiBtRLjmUWRiahbDmqwbuZRyBdU2hk2+1NQX8O3eJBR78DaSZH7VNfDAqoO/ulcIeEY69e4IFy9dNelbsNytLU/pXYq946GSCSQ21Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9q1Gy5K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 297F1C4CEF7
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Feb 2026 06:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770188073;
	bh=k1louEX48bOyPYjjyyX7S3hm8rwb73te9+Atmg1ovZE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=e9q1Gy5KPe6cuPHF+R1yVR1zxkj6g0NhEps5jSTR6M+y7rvpgZ19sA0hzTmX/kAXn
	 59LyDuINaE2+KBTwP2PKH9b41Ay01tvP4Kf7CNca2UuYwTeg3jK567nswqgmgROh7t
	 xSW76+8jkt/TJ5vpFBShqV3Qcuu8VIRXZMv9WQXjy0kmVdORUMiFGiJL8JK5+ICcLT
	 vwqI6GDFgnMToAudzH3/xokRNUbotEiLlGVb4R9NXX3eXC60K3/2zFuxyFFmGOCsx6
	 tVNav//2WFVlABfNaFBOzhQV+QOy27FXGVIiyZFEFoTSPzT0niuBOpXuFxmMrevKU9
	 7wTmhbYN9hFQg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 18FFDC3279F; Wed,  4 Feb 2026 06:54:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 221041] [BUG] bluetooth: hci_h5: kernel panic in h5_recv
 (general protection fault / KASAN null-ptr-deref) via TTY ioctls (syzkaller)
Date: Wed, 04 Feb 2026 06:54:32 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: w15303746062@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-kernel@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_severity
Message-ID: <bug-221041-62941-jyERIsRBcC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221041-62941@https.bugzilla.kernel.org/>
References: <bug-221041-62941@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-18819-lists,linux-bluetooth=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-bluetooth@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AFA5CE2715
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221041

=E7=8E=8B=E6=98=8E=E7=85=9C (w15303746062@163.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|normal                      |high

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.=

