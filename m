Return-Path: <linux-bluetooth+bounces-7792-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5832A9974DF
	for <lists+linux-bluetooth@lfdr.de>; Wed,  9 Oct 2024 20:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19D5E281548
	for <lists+linux-bluetooth@lfdr.de>; Wed,  9 Oct 2024 18:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A961E04B5;
	Wed,  9 Oct 2024 18:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ec7qM6s9"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6C013F43A
	for <linux-bluetooth@vger.kernel.org>; Wed,  9 Oct 2024 18:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728498303; cv=none; b=vD8qbA117nLXPbCe00KtAKJZhNCEwWZt5cRSd9yG9VY7en2fDZ4vjzcwNoRMyv0ZNf2542B5nUTilos8VXnv6iHxLglOqZZENVziFIjKPakwHBZXyBX4YwGOkSL/CEjg6btLFrAySpdW4A5enkQufBN34LuZC69By7FAw+/rfCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728498303; c=relaxed/simple;
	bh=MMXo+MXUtFo03kphNnqax9vPidjXFHfFl7EYRcfZwgI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hySyb7MQ7zTvwQ+UxK1s3WuVDucYnss0TbFyW/Zwnnbu9quQKlNzdflFoqlhnSV2SlbSFarXYkXy4sBM1HZstvcftqQnPbWVtNbVXrN6iVPfMSGJq4ycvkpgAtUjWdocTox4YGgpbNmLRvlg0/urzZ76ghAxovk28uurqBoM/cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ec7qM6s9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCAF9C4CED1
	for <linux-bluetooth@vger.kernel.org>; Wed,  9 Oct 2024 18:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728498302;
	bh=MMXo+MXUtFo03kphNnqax9vPidjXFHfFl7EYRcfZwgI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ec7qM6s9oVc8RCzyBftorqWMT3Cu/RKfWpYshDdxx5+WuFT4lI/x/yZHAyviJ6u0R
	 +iDakXt2Ej3MCjzkvhKGrji1NP90B4acie7IiAdEtLyAeYYN3QPfpfD7yBD+C10/xD
	 V3Fqka3xKRi588DHYX7B7DPFPxkaR2579C7dH+MIWpbTdhgi1ix7hNSV+pxi2MDvlp
	 M+u2ukCoZlVJlwS+8FvEjn1HbqgZRSEUEs31cJjOvqM3PbbZGZ6Jb97cHiyFcw+cu3
	 dfXpvW40cCp3CzyQL7CcM4RLC88+adjhqKMxA0yz8w8UnYRxoz+06a8Y4vGveX1XQe
	 Ib9r8OgXmQw0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BD886C53BCA; Wed,  9 Oct 2024 18:25:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 219365] USB bluetooth dongle stop working after upgrade from
 6.11.1 to 6.11.2
Date: Wed, 09 Oct 2024 18:25:02 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219365-62941-nCe7k9roZl@https.bugzilla.kernel.org/>
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

Luiz Von Dentz (luiz.dentz@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |luiz.dentz@gmail.com

--- Comment #6 from Luiz Von Dentz (luiz.dentz@gmail.com) ---
I guess we need to USB traces to check if that really what is at play since=
 we
are giving a bigger buffer to the USB stack perhaps it expecting the ZLP to
finish the transfer but it never happens for some reason.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

