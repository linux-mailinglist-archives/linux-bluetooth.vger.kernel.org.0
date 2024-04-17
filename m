Return-Path: <linux-bluetooth+bounces-3659-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1708A7E34
	for <lists+linux-bluetooth@lfdr.de>; Wed, 17 Apr 2024 10:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FF93B25A50
	for <lists+linux-bluetooth@lfdr.de>; Wed, 17 Apr 2024 08:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894597EF1C;
	Wed, 17 Apr 2024 08:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFO+lf8m"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5787E763
	for <linux-bluetooth@vger.kernel.org>; Wed, 17 Apr 2024 08:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342426; cv=none; b=GpvKtfjvn9ANoPtCiPxUDgJds2ETZBM6JgBJxMrGG37k+rkQ1LJtKMBew5Jh6Q3lspgQPy5CXXPK3BT8yFDMA/TMxpuOiLVXPhzGK1DfMWjJF9BkDFSEfpmlANG+ThQoNN+uGrBF1MTNdZch4cS2WFF24M0KZ0Sae/9BjLOU0Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342426; c=relaxed/simple;
	bh=i8Yv7gE23B/omsy/AMtFdU0j94SDQRENRjR608h/XuU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K2355IqXORd6dZ1myi4TA9Fn2Vgxcv/uExVZTfzKdIchAja2+rU4U/4pzi/t8qeJSu9o/GJOix9wAYZCkjZfI/bhIZnecLr8Ar5hqlct+vpLPM7ik/nNdj9ubdSEq21FtSAy8RZ2skj76kZpUDxSH/fZ9hsLeM74+AvQHKMQwNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFO+lf8m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDD27C32783
	for <linux-bluetooth@vger.kernel.org>; Wed, 17 Apr 2024 08:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713342425;
	bh=i8Yv7gE23B/omsy/AMtFdU0j94SDQRENRjR608h/XuU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jFO+lf8mEaCLI5FCiycBhrWiDmdfqsxEhsnh85wK4jE/cVj9hKRQ3TGpG+ITm9C4i
	 EEFsTqMfhPbSAt18anKUDx8gBnKQSZGZhxsMPdIG053CmAuZpO7+UX6fd2fuJkFBPW
	 29MFcUT+lFaS5wgh3RgxWyTeEdlZugRtIcYUmEdkzSgF+afgCwkyyWpOnULUV2HzqT
	 RuvTsE/dknw+1gL2Du/Dzg988gLEr8Sdkl/ke/+kLKKjhvkNXHdKadVOOqJCe7hixU
	 4bg8s+OFKqfUnkTXTmBt6XYNpn0VKnZ/QBuHlNub3GH+xcKY/uXFPf3AALPOA7PTVv
	 1C9RWQE7Oadyg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B9AFCC433E2; Wed, 17 Apr 2024 08:27:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 218726] qca6390 bluetooth fails after disabling/re-enabling
 bluetooth
Date: Wed, 17 Apr 2024 08:27:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wt@penguintechs.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218726-62941-5oZvtEPea1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218726-62941@https.bugzilla.kernel.org/>
References: <bug-218726-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218726

--- Comment #28 from Wren Turkal (wt@penguintechs.org) ---
The last three logs I added add a cold boot with failing toggle, a cold boo=
t,
and a warm boot.

On the cold boots, bluetooth works if I before I manually toggle it within
GNOME.=20

I also tried Plasma, but didn't collect logs. Plasma kills bluetooth almost
immediately after logging in.

Note that the timestamps appear to have the wrong hour until systemd is
signaled. I collected these with the help of journalctl.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

