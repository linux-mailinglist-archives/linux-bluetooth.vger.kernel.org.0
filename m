Return-Path: <linux-bluetooth+bounces-19107-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGpiHYJ1lGlmEAIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19107-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 15:04:50 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F383214CF59
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 15:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2A8A30FFD0B
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 13:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52FE36C0A8;
	Tue, 17 Feb 2026 13:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4gtEGkh"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5268436B068
	for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 13:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771336613; cv=none; b=gIGxQbRymsNvfpGSj+T9K6pwdVGBZfflBWZPX9gfH315MEkuZ04I4uyLtjHB3xVCswCrnMxk4ay627zhXyMfssFH2NTNRcg4qJRE68iIddc95U7fUf0ZZptM30FCylTVjrWliaea6dfycJ+wxdFD8xwMZJNSimevMxdx7esbeRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771336613; c=relaxed/simple;
	bh=5DU5EAVXpjZRoGLUJtdN34c1AqUpJlbANbZ6UNOseYg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RdhowS5iQlf57qbjH3LngXGzLdtsvxlH98VqWlkxy8Llj7jZdJgYkrnuO4i9mBfzNV/XMC2X/XFZMSPLnEm2pDmZzvUM/KWdvX9ul7CIt/1RVCtqWFDosN4Y5SJajY/xK1FPhxaAfALVRhSxnojzziwUz0juofeo22oBSuGXbf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4gtEGkh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 293F5C2BCB1
	for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 13:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771336613;
	bh=5DU5EAVXpjZRoGLUJtdN34c1AqUpJlbANbZ6UNOseYg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=k4gtEGkhcOcVMNp32vTWG76rVz+YUoUGLu7TB0q4vxWakxiqS8zxyAwWES2O/9K9v
	 hysUdII3mWfmVbCAaB6jAHDiW0BWzJwu7uvbDdlWAVjv0yUcGpRwC1POhjDTv+qyD3
	 OUuHmUu9gil5kR/0uqLkAO46n1uYEKDRk13ltuDTOyy5kBJIFkr7ZTSUDlyoegGaaO
	 nis2ey7X0S/Gx1TC03uJOupUOXwnVKSJZ4+1vHyW0lOXZyJT2R3XpGi9hlHsq2gI3w
	 I7t8gyV+cSd+CwdHW18bv0vqzfZwKPa3Pk+1ASkP7fAMakpNIplOXxPn7BJWdxlUag
	 4wFtMt70Uq/VQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1C931CAB781; Tue, 17 Feb 2026 13:56:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 221096] [PATCH AVAILABLE]Please add MediaTek MT7927 (MT6639)
 Bluetooth support to mainline
Date: Tue, 17 Feb 2026 13:56:52 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221096-62941-s84tpObGh1@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-bluetooth@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	TAGGED_FROM(0.00)[bounces-19107-lists,linux-bluetooth=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: F383214CF59
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221096

--- Comment #2 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
Jean-Fran=C3=A7ois=E2=80=99 patch message:
https://lore.kernel.org/all/496b0f8505eb6ffb19fdbee6f963c62aa6790fba.camel@=
marliere.fr/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

