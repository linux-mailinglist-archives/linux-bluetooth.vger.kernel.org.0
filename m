Return-Path: <linux-bluetooth+bounces-346-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4192F8023AF
	for <lists+linux-bluetooth@lfdr.de>; Sun,  3 Dec 2023 13:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBDEA1C204F9
	for <lists+linux-bluetooth@lfdr.de>; Sun,  3 Dec 2023 12:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57013CA65;
	Sun,  3 Dec 2023 12:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBpFkG1U"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93673BE60
	for <linux-bluetooth@vger.kernel.org>; Sun,  3 Dec 2023 12:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA360C433CB
	for <linux-bluetooth@vger.kernel.org>; Sun,  3 Dec 2023 12:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701606029;
	bh=zjwP0ni+2hC951gsEE0P0/LoQRz+opreW+3NAJi5T0A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BBpFkG1UCxIgyHoE/CAWsWo3UfORULmuF+2FrgFZon8iBuhbnuLxz6ljpvHiaooOX
	 CKwY6KouS5/HL/auaTGpK3Ogla1jXk9oSocEY06Lotmo0MesbS/pqka+G6Cx8D0x2e
	 IfUWndlbeyK4U/zJc9E5zgFO/UaivNEsD0MF1OIYHGfpbhfThuYTCUeBR+y3W582QO
	 mio8uGUTovWIFd2kywup+aOguq7UG+Iz97ScuPvWeLd3j+QZb6R87ZzEv+q1LXSVPm
	 KVHGNoj4GIwWto92aG7WNOBJPYFj+YXH/gjJ5egzmQjgsASY4Z1Sm/FquRAkSkaLoZ
	 yagqdhhj7Q0ag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D01BDC53BD3; Sun,  3 Dec 2023 12:20:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 218142] Bluetooth adapter fails to recognize on kernel
 5.15.0-88-generic
Date: Sun, 03 Dec 2023 12:20:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oleksandr@natalenko.name
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218142-62941-UunsK360mH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218142-62941@https.bugzilla.kernel.org/>
References: <bug-218142-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218142

Oleksandr Natalenko (oleksandr@natalenko.name) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |oleksandr@natalenko.name

--- Comment #7 from Oleksandr Natalenko (oleksandr@natalenko.name) ---
Does passing `btusb.enable_autosuspend=3DN` via a kernel cmdline help? [1]

[1] https://lore.kernel.org/lkml/5993222.lOV4Wx5bFT@natalenko.name/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

