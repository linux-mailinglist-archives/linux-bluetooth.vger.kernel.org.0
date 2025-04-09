Return-Path: <linux-bluetooth+bounces-11588-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A36A82075
	for <lists+linux-bluetooth@lfdr.de>; Wed,  9 Apr 2025 10:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66B171BA0ACA
	for <lists+linux-bluetooth@lfdr.de>; Wed,  9 Apr 2025 08:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0751DF755;
	Wed,  9 Apr 2025 08:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lh+l/f8c"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4314322D4E3
	for <linux-bluetooth@vger.kernel.org>; Wed,  9 Apr 2025 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188355; cv=none; b=eMH4T+BB8V3HsIz4D/jupMwFgdwoTbz34ogEx6xUNAR576UNKHKqDnUePQ7rd48Kx9HNwXP/Wpo3kedRRZlZzGA8BdqRRgshNFhtxA3mosZqW6n7PCYgYzG0HAGEGCcqa+ls6pibrRORi50M/dBB6e+BqO81C3TQERaZjT5+RWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188355; c=relaxed/simple;
	bh=NzupdMKKdpHhbIX+kP7VWklfoFikkalcBidIzszUhk0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MOF9V4fHWqvz9TSIyuFoEh2oZjhaHWMcMc5NYN1oTdhKy6xDigsSEvIqaQPp/dE1u3G0o94Me5CJV/0+H8KVMdw62GNX10REziYm0B2bomTOVNGGR6Hl0x4nPIsihbJt/mdGXGKxy+JCm2THsjne7rMU3Asi4bvTxS1XGXEfU5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lh+l/f8c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B02BAC4CEE7
	for <linux-bluetooth@vger.kernel.org>; Wed,  9 Apr 2025 08:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744188354;
	bh=NzupdMKKdpHhbIX+kP7VWklfoFikkalcBidIzszUhk0=;
	h=From:To:Subject:Date:From;
	b=Lh+l/f8clOi+t400jQrmsJNkTePOs7/iW7rLcGsAeWn5pq9XmTICjIhzapjlc8eEt
	 mvfEu2+lEZYjLEJ0duLJTWvF5XsMM7ZsNdRFxebqXqswn6NplxUxGfVBFQ9c48nFTA
	 u0MyoEmccmXo6HHO9LYb1RuqkEIoerrtyvbpXpgxoGRM6QHWzTeDu4nnEVzkh6VGmA
	 O82ln4GrPe+o9/fHqmXd/HF2jXboYLYklsukdgVsM4LrUpWRnKh8ZnrLTQ3uSqU2CI
	 RyN5V64+S4HIjbQ4WcMJboG2g0R0mTR0UHbUWgj08j6Xe+gebYYYw7LZqtwR9kOmeB
	 UmBYxIR1MfrxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 92E2DC3279F; Wed,  9 Apr 2025 08:45:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 219997] New: [rtw89] Headset unusable because of delays and
 stutter
Date: Wed, 09 Apr 2025 08:45:54 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: f.menning@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219997-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219997

            Bug ID: 219997
           Summary: [rtw89] Headset unusable because of delays and stutter
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Bluetooth
          Assignee: linux-bluetooth@vger.kernel.org
          Reporter: f.menning@gmail.com
        Regression: No

I have a notebook with a rtw89, and I'm unable to listen to any music/audio,
it's very unstable.

It works fine when connected over a cable.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

