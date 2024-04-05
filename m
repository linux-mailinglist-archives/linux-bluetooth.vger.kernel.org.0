Return-Path: <linux-bluetooth+bounces-3286-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8480789A297
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Apr 2024 18:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B52B21C22451
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Apr 2024 16:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1BD155384;
	Fri,  5 Apr 2024 16:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxxbUr23"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19C0219E4
	for <linux-bluetooth@vger.kernel.org>; Fri,  5 Apr 2024 16:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712334924; cv=none; b=EgHovN/bQnN/tFTyyBVzhlzDcw9257+LTizQBQTf0Vdh/cldgpprU54kEUlcMIKQnQ0zHcKkN1x+wz0Y53S01XMnxFODC3RWHTanlzI/oDtN6colL/1BJ8Ci3a/GA6MsDqPWqEK06I54Ja/ImI7g1aDv9VQ21teblC3KbuxfKRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712334924; c=relaxed/simple;
	bh=r2JEnIeEVbwGtC9tEMxO8GqFwygLQGa0QI6Dn5KBEQw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EX59+uVfWWTX5eIYjYX/bZMIPmMjaOrnAMl/xa4lyCWlq7KWlaAURQ23CscNUOwEZBUoiTcq3H1BgoUtThJoCgknowkeTSMB6TjMGLrFfikHISlNjlWQ2SUowvIoe1ETBupCtlBAwmTabBeI3BBzEmbi6EueVkxT/lzMYpnkCs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxxbUr23; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59C77C433B2
	for <linux-bluetooth@vger.kernel.org>; Fri,  5 Apr 2024 16:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712334924;
	bh=r2JEnIeEVbwGtC9tEMxO8GqFwygLQGa0QI6Dn5KBEQw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GxxbUr23K4J3XZGUUjwvs0GkaZraLQLNa4lU2bpaAf3Whf9knYCRcfwcK5IJ8ZQ87
	 lIZNOjMaWHGhyHvV8uzLRWwudQ5cgWsqJn1Zdd5IOOm/JyOtcXNy1OPyUrv57gm8bV
	 qTWGO1wLQX2FddNTgr9zgoZediQXp8hfwrVs23q3A77aze84TFkb7AUnLAMJZCM3HO
	 CPfh9dwldCQH8R8AZQwOFz1Uz0WLRNHgL+UE4pNJie+6cBM2nGAX3yJc6Rm7idORBz
	 qW1fgkmnUMpdsjCeG/jCezQUmB6BE0/KR4O36lC3fss0eUqccvpXCFaA386Fp6K6xI
	 mKeNaRP502flA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 521AAC4332E; Fri,  5 Apr 2024 16:35:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 218651] kernel 6.8.2 - Bluetooth bug/dump at boot
Date: Fri, 05 Apr 2024 16:35:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: kbugreports@disroot.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218651-62941-bg2sSmtT69@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218651-62941@https.bugzilla.kernel.org/>
References: <bug-218651-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218651

--- Comment #25 from kbugreports@disroot.org ---
Kernel v6.6.25 works fine on my system regarding the bug that was in v6.6.2=
3.
Thanks for the fix!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

