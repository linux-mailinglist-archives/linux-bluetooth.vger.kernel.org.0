Return-Path: <linux-bluetooth+bounces-3252-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FBB8998A6
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Apr 2024 10:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C84B81C21042
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Apr 2024 08:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6198015FA7F;
	Fri,  5 Apr 2024 08:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxEWRDGJ"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E1D611E
	for <linux-bluetooth@vger.kernel.org>; Fri,  5 Apr 2024 08:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712307496; cv=none; b=PqgTE2+aE3uCeSehNlqv13ykNNNwgLvvzLMcr6VvhUQNT8bzDpbxRlx5o+KbjR4EHCpOhq/onjdQ8ZB+19ikUvW4V26UXBFANz7N1dKJejAyHE/wRX9wrVtY+UpfuQO53A8yzsumPK/Z8yvwetLRFEjRqyCR3WRCgUDwRDlgNAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712307496; c=relaxed/simple;
	bh=U9lKvYJZEnXVwAJFkovWVPc617fff7L/ugC+AylLJ4E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NNTHVXVo9mwn3I3+I33x9S9Mc7N+TGkfTo0CaSfmY0r7GWA2FasFUcnqPmxr75avzc2iWapl/+ENbNipBJaWmAiPFjh2L7Ytzrw9WI7wjGztB0y4kArcM45n6D98N59UpEOxaYR8t9hfHrYcO5l2TejyIv8h+j9O5+prsqS5AT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxEWRDGJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75EE3C43390
	for <linux-bluetooth@vger.kernel.org>; Fri,  5 Apr 2024 08:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712307496;
	bh=U9lKvYJZEnXVwAJFkovWVPc617fff7L/ugC+AylLJ4E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SxEWRDGJFsbGTtzPhs7PD2Q689QbRohrqdASeSSeSBH/pC/oi70cYRuceiAeQ/dGW
	 iyRLmlDcSNlDk+k7DYU0vw5xHqeIObl2yn9Rsnbjw4cjNCxXvYOyeFsGMCuHriiJuC
	 QXTwOUR9xcxegy54Wx39Uy2mOXTP0sW/FMUPWLLXO+nilSmc+yv89j9dPCIg0chAyX
	 SS46fyC7bawQjm1BqGiQCXWTBfTA9nVlnk5jGRvnT04o1QCMM+jxpgolsNs0pgNs27
	 ek7yqqmdP5/IjVsZdjN+DXKC5XAf3ZTrmdl/2aFqFSlQiUOtMpeBK1TXm+HYXXc4wB
	 zAqTRbGD1ADiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 633EEC53BD6; Fri,  5 Apr 2024 08:58:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 218680] bluetooth connected status not shown in KDE desktop
 GUIs
Date: Fri, 05 Apr 2024 08:58:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: abetakehiko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218680-62941-uPsa8zugbK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218680-62941@https.bugzilla.kernel.org/>
References: <bug-218680-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218680

--- Comment #3 from Takehiko Abe (abetakehiko@gmail.com) ---
(In reply to Bagas Sanjaya from comment #2)

Tested the patch with 6.7.12 stable branch. It works. It fixed the problem.

Thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

