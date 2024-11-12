Return-Path: <linux-bluetooth+bounces-8592-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCF79C5FD3
	for <lists+linux-bluetooth@lfdr.de>; Tue, 12 Nov 2024 19:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 050C5286171
	for <lists+linux-bluetooth@lfdr.de>; Tue, 12 Nov 2024 18:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D1C215C68;
	Tue, 12 Nov 2024 18:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJF0Xf2d"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A017A215039
	for <linux-bluetooth@vger.kernel.org>; Tue, 12 Nov 2024 18:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731434488; cv=none; b=IJcWD3XwgJQMQpnz2w4Ws5QwZ9uqT0gX1tjEQ6D5pyaV8ebXW19JLOMMBkWYtfIaTA/9wdqjeNAP8LucmENISXBiyn1kSjTywHix1lxmXw6QmdztlRJoCz/izxFZsQYinlxQLpLvbhB9KHxKU5l4kSUZBytb7srGrUzs81zedWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731434488; c=relaxed/simple;
	bh=+LRMgiPXjvmrtQ8dGRzClzQnYwSSOibpmrlvZh5x1rs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DcH+rU4jaANqfMITetfp86a0iVMw6aeJj7kbVv/XlDvkPANXtSscaPRRJjVVx0hygfGvVlt8dzzLh08xldLBRMic2aYKkVL9UJ6A405hiKpLTzQCW3RweA/7nbMc7c36Pk+qpl1Vjn/xFKpyfUErA+Kxb31Zuh0GtGyHT8/8rsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJF0Xf2d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 267AFC4CED6
	for <linux-bluetooth@vger.kernel.org>; Tue, 12 Nov 2024 18:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731434487;
	bh=+LRMgiPXjvmrtQ8dGRzClzQnYwSSOibpmrlvZh5x1rs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cJF0Xf2dvlgUxT2sFlojpzsLv+TzFELq+jo8Rxj6h7Uukkg++WNNHnu+bOlWX3DrM
	 K8CUwbM3HX3vICdh7fPG+/0NeHIprM1v+6vf16oS9zj3VWetbAGsaaG7aPpAujRakW
	 BimXoiT3UuaFCPbhXp2aDJ+stZaZkfJCrFXhgwgFiLn81dWxpbdmYTN61E77pdl+gH
	 RKFR/1DC8lQH8TcJvgtOhx6FlHs+1g0nayI3UmDO2zAR49iN4ZY8G37YE6rAyOJb/i
	 6tWHco3TuzHPILCquCpABtsQi5kJZJnj7VMQwQYOzjBY2sLNSWO24+zohm9XGUUf5U
	 Ay5PALmkOT/1A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 149D4C53BBF; Tue, 12 Nov 2024 18:01:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 219458] bluetooth connection fails after L2CAP: Fix uaf in
 l2cap_connect patch
Date: Tue, 12 Nov 2024 18:01:26 +0000
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
Message-ID: <bug-219458-62941-ApYngPirJF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219458-62941@https.bugzilla.kernel.org/>
References: <bug-219458-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219458

--- Comment #10 from Luiz Von Dentz (luiz.dentz@gmail.com) ---
Patch has been applied to bluetooth-next, pull-request in its way:

https://patchwork.kernel.org/project/bluetooth/patch/20241112175326.930800-=
1-luiz.dentz@gmail.com/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

