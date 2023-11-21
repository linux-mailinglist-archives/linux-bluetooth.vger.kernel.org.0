Return-Path: <linux-bluetooth+bounces-145-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0392D7F22F6
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 Nov 2023 02:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 352531C21816
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 Nov 2023 01:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1210E53A1;
	Tue, 21 Nov 2023 01:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OptXe9Vz"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C0A525A
	for <linux-bluetooth@vger.kernel.org>; Tue, 21 Nov 2023 01:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCB9AC433C8
	for <linux-bluetooth@vger.kernel.org>; Tue, 21 Nov 2023 01:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700529303;
	bh=0NhvCEkh2YpIeYeUzqfYkDZwV6QR5rpAUWGLtWGJu4Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OptXe9Vzg1CajI1Fes4zErj9+g3bc8Tp+Xp/k+eCQFRjtmZeQ/hii4KKp7EJfxYky
	 CGz4cU+ghpsnRUjNZUIZtRHmuxAHD2VJKRHg9g61dOMUMf51u4SPCM7h9rwRMI1tK8
	 149iSogKd0E/BRoHTSWmusD1yyeh/7ZS5NwKGn+ArFXYhJKljPbahjUZeP/wWCxOoq
	 R5XENVy0pZZkRHvXeEzU155waDIzXNAL2/DKazb6YlvR2CDuqk9W9cx/VvRoJI5pfe
	 Lwkoprmo2T2MBRle/KNVsJ6LqUxTU3MraDyTdNU3YFZtbaf1qEnAN63FeNWSy/980i
	 cPoAGSL2nb/fA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B362FC53BD1; Tue, 21 Nov 2023 01:15:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 218142] Bluetooth adapter fails to recognize on kernel
 5.15.0-88-generic
Date: Tue, 21 Nov 2023 01:15:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugs-a21@moonlit-rail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218142-62941-W4Bx7AgMkT@https.bugzilla.kernel.org/>
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

Kris Karas (bugs-a21@moonlit-rail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bugs-a21@moonlit-rail.com

--- Comment #2 from Kris Karas (bugs-a21@moonlit-rail.com) ---
Given Artem mentioned 6.6.1 in comment 1, this bug might apply to me as wel=
l.

I have a regression going from mainline kernel 6.1.62 to 6.1.63, and also f=
rom
kernel 6.6.1 to 6.6.2; I can bisect if patch authors can't locate the relev=
ant
commit.  In the most recent kernels mentioned, bluetooth won't function.

Hardware: ASRock "X470 Taichi" motherboard - on board chipset.
lsusb: ID 8087:0aa7 Intel Corp. Wireless-AC 3168 Bluetooth.
dmesg: Bluetooth: hci0: Legacy ROM 2.x revision 5.0 build 25 week 20 2015
       Bluetooth: hci0: Intel Bluetooth firmware file:
         intel/ibt-hw-37.8.10-fw-22.50.19.14.f.bseq
       Bluetooth: hci0: Intel BT fw patch 0x43 completed & activated
bluez: Version 5.70, bluez firmware version 1.2
Linux kernel firmware: 20231117_7124ce3

On a working kernel (such as 6.6.1), in addition to the dmesg output above,=
 we
have this:
dmesg: Bluetooth: MGMT ver 1.22
       Bluetooth: hci0: Bad flag given (0x1) vs supported (0x0)

On a failed kernel (such as 6.6.2), instead of the good output above, we ha=
ve:
dmesg: Bluetooth: hci0: Opcode 0x0c03 failed: -110
       Bluetooth: hci0: Opcode 0x0c03 failed: -110
       ...
repeats several times as bluez attempts to communicate with hci0.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

