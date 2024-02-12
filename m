Return-Path: <linux-bluetooth+bounces-1751-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 724C785109D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 12 Feb 2024 11:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12B8FB2289D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 12 Feb 2024 10:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2072F18021;
	Mon, 12 Feb 2024 10:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8oehKfz"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8192E12B70
	for <linux-bluetooth@vger.kernel.org>; Mon, 12 Feb 2024 10:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707733326; cv=none; b=BqpgHPh6uYw76XqEsmhX4ca6SyZxSV/iwhja8tb9XSB6J6IeTh9ZK0FPbAIO0DzgH2s4N0eZsDgyx9q8NUwUZ8cLDTry2Qujggb5ePGfmYJiOC220+nEyi5Clhd/sj3j22vULECl7eM3XvFJ5FnYlUDzg3R5CZ/WgW0us/79Me4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707733326; c=relaxed/simple;
	bh=4cSMvPFM82VGliD1iQeEv1xW88KH+nd9LROq4jgulME=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OgUBZpWiS+cSD7+D9nva6H6L0V5KXIq5c7Twsj0BeFUcLTcWVW6XyY9Rry2LZAjg/HKzpmR8ZyntAjB/kg0p0P9pTAKwapmUo9glDzxxhCCJtDcYxuEuYpWh18d411L8nyxQ247WcnB801fRFcGwnYzvoLDXyFnc52YZUH/0BsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8oehKfz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 166AFC433F1
	for <linux-bluetooth@vger.kernel.org>; Mon, 12 Feb 2024 10:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707733326;
	bh=4cSMvPFM82VGliD1iQeEv1xW88KH+nd9LROq4jgulME=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=n8oehKfzh25DjdEEg4CTm5NIdGHwuoPjh4h+DzxwipQpRpoRnl7Ua5ixHDOqNdcpK
	 wsU9EnG3iNgj7314vCknkz8w1l7Za/BlUR93na/GN1P9GVgrC4kGnogIAPhXKfsSys
	 kTh9+BjkboH71Z5gnm/oA//Nqsh3+2Jsmo+1xVBC3EZn75vNfUtYx7ceasgLI5ROAv
	 n8/KDGsox2GH82enAtuuLlUQDkuh4Ad6s7cmAH7CX+O0Bn7Vim0zp019UXFODsVeQ5
	 subYdroD/uZwryefQGmU0CMZcwH4uT8X7ntEB7/KCrpx293UJxKxLcID0h6XwlOJe1
	 SWk4eTtIm4K/Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CA938C53BCD; Mon, 12 Feb 2024 10:22:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 218468] Unable to transfer file via Bluetooth from mobile phone
 to Linux system
Date: Mon, 12 Feb 2024 10:22:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-218468-62941-SBP3UA8X84@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218468-62941@https.bugzilla.kernel.org/>
References: <bug-218468-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218468

Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Unable to transfer file via |Unable to transfer file via
                   |Bluetooth from Nokia N9     |Bluetooth from mobile phone
                   |                            |to Linux system

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

