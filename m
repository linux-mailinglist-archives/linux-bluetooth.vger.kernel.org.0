Return-Path: <linux-bluetooth+bounces-19106-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMyeHPBulGk0DwIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19106-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 14:36:48 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E202B14CA9F
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 14:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F14430518DD
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 13:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECC436BCCF;
	Tue, 17 Feb 2026 13:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkSH2qIT"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD14361656
	for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 13:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771335280; cv=none; b=KTyXcixqb3qTgUdzFfvN35f75wTVNaa5we8NO2WQGF/q46ZY3xs5WnGe88ABO4dBIiE8C1b+1pCMpncFCL6M6wnTP0tgSHteBiIZPMFd72tFFzFZvMesMtU7mtYiMX5CTiZuCm+zDD1DxceLrRhlYKcxEPffP9SvNplpYxDWllg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771335280; c=relaxed/simple;
	bh=5lCWy+iERWA3jjI8di54rNRpHXhOvYT6zBDU8yMLUp0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QKwuAeWNEXF7tMSb+wA7rOMQ1G23wx5DtjSjsPY9/ykAGYs4UHn9b4msqZk/NJ7KqP4/GQdU7j85l7530tFnU5Sie0t0MtHclNUH7nnO3VRQZfrqfN1bTvlB1XvlzASzgZQk3d9JQU6SFVtwxn2QSpiQyOACxVY5mRnODMVuuYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkSH2qIT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0613AC2BCB0
	for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 13:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771335280;
	bh=5lCWy+iERWA3jjI8di54rNRpHXhOvYT6zBDU8yMLUp0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HkSH2qITgk+/fkYhDBMVQ4l0IsDyMzy/cpi/mrWMPPmtoUXlJ3Vyqx4XkS1PVai0R
	 8ZgkhXkGqHEff41CwCkm4Sb1vnQw0mLj5zAp/NLuIyvyJgamfVZekbgfjlSjQvBA9g
	 +uX8LUqUevGqt+8i/Y+OJJFPvZKcvQhsfAmY8lCiaY/cbfQKUbuYCqrCBR5spbrdiz
	 qPojUd78+S+sGdF5n/CqHaEPpVkAvSFXxN7+Ymi0gyVDkqzg8tbtY4kZHrldT1qhsE
	 Iif7I1fNL4eu4pJnb40uOzEYcyWHypRdSsKFoLdtrYYyul6HVsjbv+n1QwU/kEOcRp
	 8W31pcdmqxhKQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E66A3C4160E; Tue, 17 Feb 2026 13:34:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 221096] [PATCH AVAILABLE]Please add MediaTek MT7927 (MT6639)
 Bluetooth support to mainline
Date: Tue, 17 Feb 2026 13:34:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: javier.tia+bugzilla.kernel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221096-62941-930yRE0TBW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221096-62941@https.bugzilla.kernel.org/>
References: <bug-221096-62941@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-bluetooth@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,jetm.github.io:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	TAGGED_FROM(0.00)[bounces-19106-lists,linux-bluetooth=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: E202B14CA9F
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221096

javier.tia+bugzilla.kernel@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |javier.tia+bugzilla.kernel@
                   |                            |gmail.com

--- Comment #1 from javier.tia+bugzilla.kernel@gmail.com ---
Thank you for the patch; I have waited some time for this after finding out=
 my
mobo was lacking the proper Bluetooth support.

I wrote about it in
https://jetm.github.io/blog/posts/enabling-mt7927-bluetooth-on-linux/ and
created https://aur.archlinux.org/packages/btusb-mt7927-dkms.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

