Return-Path: <linux-bluetooth+bounces-15507-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7326BA2DEB
	for <lists+linux-bluetooth@lfdr.de>; Fri, 26 Sep 2025 10:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6452F2A4B99
	for <lists+linux-bluetooth@lfdr.de>; Fri, 26 Sep 2025 08:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D705D28BAB1;
	Fri, 26 Sep 2025 08:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tp5Q4iGs"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3373D28BABA
	for <linux-bluetooth@vger.kernel.org>; Fri, 26 Sep 2025 08:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758873608; cv=none; b=cjrQ92sPsBE7gN5za/ljmUbNWsEXBbYxcfs4L7pmUZzZWwytayYycph9yvssJBP9bzU9vJfSy+fxh2ygtsiMBXNxOYw0xTnxzQ77wLWRj4IgSsfWpneKNyue0pFi0FUD/uJzS2Q72SV2KKQifFETWKxq04DjOf36tkqD4r0bv7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758873608; c=relaxed/simple;
	bh=UHLCrWAYlI05co2tImiGIK1Pd15vX0ziDpLQ1r1E8LI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UwkDJt3ZRVjExLwn6n4n8ibtWFJ5CvUsQ/eCvxT/OrYlmulFMtsPB4QWu5Mu4P+Jzp6rfegyc/madLfM+m82StqkKXnYQp7LpjfXCZsygXQDQNnZ6nleYiuzXpta5/31wZteYDmFeSCD7ZvUxVtCvyKzG36m4nqbR2Ix7RbqEWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tp5Q4iGs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD0F8C4CEF7
	for <linux-bluetooth@vger.kernel.org>; Fri, 26 Sep 2025 08:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758873607;
	bh=UHLCrWAYlI05co2tImiGIK1Pd15vX0ziDpLQ1r1E8LI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Tp5Q4iGslddAsBphgRb6VV46rUgbZmmT9PV6JGscUHRJPzukduiIaSFFT+JhDP2Yi
	 Fg5TojsmODOvBYcC9uzc71EjfmO2NQmWkJ8E3QLIT6Wp77eU9gAtLJoJoBrlOvoDSI
	 dtKyTwv6NJqO4i38cuhcc8+J6yQPHIvC6/XDLTQ6qJYTwKWAQmcZEC+hDdq07RJ9Q0
	 MywzhIIB7q4iJfIMsiK6/dzlAj9m/aQ5OGYFdMbALKWI/pxW66luvv1TfJAhkU5pgy
	 MFwNmRKxhCywm2ErLbK0dZPBNFXHwrJP0Tnkoi5OT9bCPLlU2Km/6k3sQG+yhZ2fWV
	 UCbP31H3zrFaQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BD4A3C41612; Fri, 26 Sep 2025 08:00:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 121221] Unable to pair / use Genius Navigator 900 Pro mouse
Date: Fri, 26 Sep 2025 08:00:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: savannapatt.erso.n.70.4@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-121221-62941-y7I3Gf5bnD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-121221-62941@https.bugzilla.kernel.org/>
References: <bug-121221-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D121221

Padavano99 (savannapatt.erso.n.70.4@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |savannapatt.erso.n.70.4@gma
                   |                            |il.com

--- Comment #10 from Padavano99 (savannapatt.erso.n.70.4@gmail.com) ---
I could tell a lot of https://jordy-s.online/ passion went into creating th=
is
production.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

