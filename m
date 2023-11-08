Return-Path: <linux-bluetooth+bounces-29-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E00FB7E52BE
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Nov 2023 10:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E25D1C20D8F
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Nov 2023 09:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCB4101CA;
	Wed,  8 Nov 2023 09:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OvMkOxDk"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735B5FC17
	for <linux-bluetooth@vger.kernel.org>; Wed,  8 Nov 2023 09:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC2A3C433C9
	for <linux-bluetooth@vger.kernel.org>; Wed,  8 Nov 2023 09:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699436416;
	bh=eaYcnwkGuxhvzDDhLx1ZoeAdmO9MoWUdlChticgGURQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OvMkOxDk4YyPSU7t0lhOKXN2Jvn4Hn9oGlP3bLRVebysFt4AOwyNR1iB8JJge3yoC
	 YcDlkQx1YA6gxhhSHrJt9IWNgAETddYjKVzWRGFgNlq5SAdvHahFroJVC8jj1b/cdZ
	 xQ9b/zhGJVxBucFhZVGOOI08335fISlSMWnC+xlRhGFhW7DC0+1DJR8fAQ1m1/4fD7
	 YVbSQuNUA5vt0/FWP61+ODkzyexABFTPVZBZKJzMEu20mvzGCyMNx3Y115hsLHzzci
	 n6s78H/xIfAOzIiknNRjz35QmP3W9q4vpQZ1gwWe8P14xLms0ULDH6J/dBAjZUg7o/
	 8aXDsKSk1Ci4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D7FDBC53BCD; Wed,  8 Nov 2023 09:40:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 214823] RTL8821CE Bluetooth adapter randomly stopped working,
 only suspend then resume can reset it
Date: Wed, 08 Nov 2023 09:40:15 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: murphyde835@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214823-62941-6bzEhHCqCe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214823-62941@https.bugzilla.kernel.org/>
References: <bug-214823-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214823

Javier Crosby (murphyde835@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |murphyde835@gmail.com

--- Comment #7 from Javier Crosby (murphyde835@gmail.com) ---
I will leave my workaround here:

Add boycott rtw88_8821ce to/and so forth/modprobe.d/blacklist.conf

Introduce https://github.com/tomaspinho/rtl8821ce
https://basketballstarsgame.io

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

