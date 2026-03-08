Return-Path: <linux-bluetooth+bounces-19918-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM9jOxmOrWlE4QEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19918-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sun, 08 Mar 2026 15:56:25 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3E4230CE2
	for <lists+linux-bluetooth@lfdr.de>; Sun, 08 Mar 2026 15:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E723E3007882
	for <lists+linux-bluetooth@lfdr.de>; Sun,  8 Mar 2026 14:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13A2271468;
	Sun,  8 Mar 2026 14:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X3AzcP4f"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AD325771
	for <linux-bluetooth@vger.kernel.org>; Sun,  8 Mar 2026 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772981780; cv=none; b=OfR4xWp12V173CemjQ+VhHfujRbqrPN90gJLh6oeb+qo0+4904nz0QK36/xv716LrJRWIW6QM7pf/WR7H2mzk7uEObGhggTURon7OAZkRY/qKYtw5RqX/5ihdkwx/1Acbc3SShw1q9HlfIa9WsLi3a/935bHXIKiMuIHbg1GQZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772981780; c=relaxed/simple;
	bh=u8WdYIN+m0Movn4cX56lpeHYTjXLGH0jBvQDWCOlTdw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tip5p325ianr8yv8P4tkwA1Lc/Qv6YHlgQibVpe73D+4nJULNIfaRYfzcLOxlccgTZL0FSCAma27seLUes9Jq5FplFkavUoDaWwRn32eNqQQVfzbzAx4OgmqBO+PtWtDNDe4Y+MHjJIA0acWnbVsrm6fFmHSrhndaomKa75Z1hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X3AzcP4f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9D89C2BCB0
	for <linux-bluetooth@vger.kernel.org>; Sun,  8 Mar 2026 14:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772981779;
	bh=u8WdYIN+m0Movn4cX56lpeHYTjXLGH0jBvQDWCOlTdw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=X3AzcP4f9/dg7rgxKwExqa73EBIBQI8UwWjeJZym5s+cWlqFRMghL64jmz3M6P/5T
	 02010BEnGfAPCLjL5pNSmsjSXsnF/tJNsmpKXxj3A0KbLg8I3KYxo0cc+OCABr3VsN
	 e2TR+H+AlyKwT50NXYY8xt4J0nTFUZ1MyR4nKWzvTuJl3VKf3hBRK2oFsD3DyYiKu7
	 acGHHwDSigN+ygTXDF58JPDkjZX9/DK86sg0bvdtFW5EM59b3GRST9snRkv5BB8kAw
	 eH+59QoLsqJ36YbfxH7SLmWwGmt930L7UAqL4++oENVNXOmfbC2UDZcH7zSzTgHbPV
	 94sNoBF7t6yqA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B28A9C41612; Sun,  8 Mar 2026 14:56:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 220344] Intel AX211 bluetooth randomly disconnects and
 reconnects, started after kernel update
Date: Sun, 08 Mar 2026 14:56:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guyrutenberg@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220344-62941-NrflAJrt9n@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220344-62941@https.bugzilla.kernel.org/>
References: <bug-220344-62941@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 8C3E4230CE2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-bluetooth@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	TAGGED_FROM(0.00)[bounces-19918-lists,linux-bluetooth=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D220344

Guy Rutenberg (guyrutenberg@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |guyrutenberg@gmail.com

--- Comment #8 from Guy Rutenberg (guyrutenberg@gmail.com) ---
Hi,

I have the exact same issue on similar hardware - Lenovo T14 Gen4. It start=
ed a
while ago (more than a year). The issue manifests itself only in certain
locations: The same computer and bluetooth headset work perfectly fine in my
office, but I get the hiccups and disconnects at home.

I've already tried everything Tal wrote down as well. I've tried various
kernels and downgraded the iwlwifi firmware all the way back to Dec 2022 and
couldn't find the version it worked properly with.

I'm running kernel 6.18.15+deb14-amd64, Debian Unstable.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

