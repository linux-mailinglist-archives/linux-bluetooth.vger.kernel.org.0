Return-Path: <linux-bluetooth+bounces-18820-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDW2MjkGg2lLgwMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18820-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Feb 2026 09:41:29 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B6DE344C
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Feb 2026 09:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C46A3121811
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Feb 2026 08:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9864539448C;
	Wed,  4 Feb 2026 08:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZIebUTdK"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26386394475
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Feb 2026 08:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770194126; cv=none; b=FlNQb9D1dKe4BLjtGOWMUi+BpAsJffuf+7DeEVO3M5xHWDmOw9qTRkCs0JqC+ffV8qdvPeIE4sAcUsIsVsN63T934lIunSrOIvgG5nXFHRBUeSuvrf4l09AjxeNHDI0SnAhK2cnkGR19s8bHqhvm7AKor3dspja2tLxKfA9NCSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770194126; c=relaxed/simple;
	bh=yeKRlF1Os7t6iRi8JTDQZME4p46PCVLYkIAaHT4KYdA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UlRJ9MhZZ//R5EzQR3qM1Vsmo9JG5rY6mkf2W6ReoEgHAjNC4FuvF/2/Bs0rl9q6p1yorZSaJIJBMxiWiPutMAlxk4/GlkJQK+BUDrVXhiEsTSZW376hujKOP0ZvT9EPuKVDH2WAGS5OCT6OE02TOGByrxc7jAxAu5VeuFyGkjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZIebUTdK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB327C2BC86
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Feb 2026 08:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770194125;
	bh=yeKRlF1Os7t6iRi8JTDQZME4p46PCVLYkIAaHT4KYdA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZIebUTdKE8SXkourfSDNU8mHssZWpXk1YCADoTc02TWnTD5B+pH1yXETkL9F61mgs
	 fXZxt7OpJkb2QUqhzA+b4NtLPJ1XEJF1omfmo6B69UPKHAoDOY5ppLYgW1/f0k79ln
	 z9Vh2OkBOy/VLwX3EcX2yvXSozAlAl245v670BHtxMIZ/czwW9SZ4B4TuKkRshP5cn
	 SdNwDq3JCK1jzlbYC6NBZgBv3opC3ZJPz0moQxqb66ScTdRkqbgm6JvpCSoBZNzKrj
	 qT4Gkk0Sg7RtmIxQYBLxGAxI8MatWVZWzrX5tiphag5OF9M3jVYdni2SLrw8wYKBRu
	 i+ONyteJj7HVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B258EC3279F; Wed,  4 Feb 2026 08:35:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 221045] Intel AX201 wireless driver not working
Date: Wed, 04 Feb 2026 08:35:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: network-wireless-intel
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_network-wireless-intel@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to
Message-ID: <bug-221045-62941-biBBXApEIS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221045-62941@https.bugzilla.kernel.org/>
References: <bug-221045-62941@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-18820-lists,linux-bluetooth=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-bluetooth@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 47B6DE344C
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221045

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Bluetooth                   |network-wireless-intel
           Assignee|linux-bluetooth@vger.kernel |drivers_network-wireless-in
                   |.org                        |tel@kernel-bugs.kernel.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

