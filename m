Return-Path: <linux-bluetooth+bounces-7905-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB1799F196
	for <lists+linux-bluetooth@lfdr.de>; Tue, 15 Oct 2024 17:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D832B1C230CC
	for <lists+linux-bluetooth@lfdr.de>; Tue, 15 Oct 2024 15:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A9F1F666C;
	Tue, 15 Oct 2024 15:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGpGOWEj"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244C91D5144
	for <linux-bluetooth@vger.kernel.org>; Tue, 15 Oct 2024 15:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729006697; cv=none; b=djUCFgTsCmaFQBWseaouI1JNEHsOU4YmreqMFeX8oWczCYPEhhXIAZV2ugsXMFrblUMfH/VQBrBSL9sIKnIQ9rGlBOxWSA03MXzWmAKTDLEHX67P9v3K3ITfMAtg8jNrfDL1Wx6aEaYSQlenDI0jC+ksqldVzieDQ8qrbS4CneY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729006697; c=relaxed/simple;
	bh=xqQdsVtvQxluw+zkKLTda42Abfan652dMrcAmdhm6o8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LnNfFMq8L3CQoWU+WHyoqhrvl0NyjJ1rNh48nOWjAyAkx5wqM7kLO19T+GrHdoYnfXj1Tce0ozVi63XirCdjCKVDXOOJGu/sMtxNiaVbUiSOtPZFz8roPKHW4HtI+N7s+9REVFoe+pflaZ99MSgrRHws6uyT162xzZskzBj0cag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGpGOWEj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBE39C4CED0
	for <linux-bluetooth@vger.kernel.org>; Tue, 15 Oct 2024 15:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729006696;
	bh=xqQdsVtvQxluw+zkKLTda42Abfan652dMrcAmdhm6o8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UGpGOWEjsFlHz2kJSwp11806mNKChlWpQPK4mroOR6i8+vU8CgFTYl9upjL8vMTvZ
	 BuZmA+UA0tsZVRO62yzwPoWZywGIVL4DhhVOL8Z3mJ44yMNjF5A9NpeXIWqqAkfPP8
	 ZRn/T/o76LhjMfoMWg00p3Ojy0axf8yb6a1LFbgEQjLuUUGDgn3YLp6W17aTAYfM4A
	 u2xV3g3DLKNEQnKqVxREXUlYJYE1D4t4SX47o1nbNnveS5KQ3XGmAsIT0aYxui5Ep8
	 I8mvqyYhzlZHApjigR8zyPK6yMh/a96SZzcd+hZWanCHHGP7zYlTCL1BLArjs8S69A
	 WdJIkz1Uq3Q0w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ADEB3C53BCA; Tue, 15 Oct 2024 15:38:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 219365] USB bluetooth dongle stop working after upgrade from
 6.11.1 to 6.11.2
Date: Tue, 15 Oct 2024 15:38:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luiz.dentz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219365-62941-cqySPezBOY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219365-62941@https.bugzilla.kernel.org/>
References: <bug-219365-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219365

--- Comment #10 from Luiz Von Dentz (luiz.dentz@gmail.com) ---
https://patchwork.kernel.org/project/bluetooth/patch/20241015153719.497388-=
1-luiz.dentz@gmail.com/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

