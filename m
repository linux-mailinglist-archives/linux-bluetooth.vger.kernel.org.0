Return-Path: <linux-bluetooth+bounces-6397-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D73F893BDFB
	for <lists+linux-bluetooth@lfdr.de>; Thu, 25 Jul 2024 10:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 810871F21AE5
	for <lists+linux-bluetooth@lfdr.de>; Thu, 25 Jul 2024 08:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A979175549;
	Thu, 25 Jul 2024 08:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWKzuSUG"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E48C171E58
	for <linux-bluetooth@vger.kernel.org>; Thu, 25 Jul 2024 08:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721896326; cv=none; b=cv7INasEKJ/Ptyzz1/MNCuQdEPEcWGaOhoX0+f2EA8ol4H0qVazJU+oyM5TxBOq+Cb12YbhnD9AaezZ2H4YnlPaDfgF4F6fAdwlFXdDPGA6fva/pBwAxlv4Xia3wEuUCKMqXYj9XmJfeachhUKDeDi6eLJsVXHysEjx5vSeriZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721896326; c=relaxed/simple;
	bh=+Czx11f4dwhKcAPjGxyUv9hIXwnn+j5glFyrEqw28yM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hkd95asJXYMNqdWkwYAwMjAlKINU9m2mpRBcgm+BZYG4HINdTmBS2sA06CnTNodsLeVlhnqWoETYe7S2oi7MjcreW/c2g/naEwBZxv1tFjGGvDu/6xHALMNjpH7dSUlCOXUJKZIvKPepkWLAQspC+J1Y0dmJe7Bpaelyw9Ds9Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWKzuSUG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36576C116B1
	for <linux-bluetooth@vger.kernel.org>; Thu, 25 Jul 2024 08:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721896326;
	bh=+Czx11f4dwhKcAPjGxyUv9hIXwnn+j5glFyrEqw28yM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DWKzuSUGIIGmU7OXn7LvWI7QAtt1o4yFEK0K74VZYkvSSNw+efC/ganamt7azIGnb
	 d7hDh0i7G1yngHBM4qFd9xJ8is/sAhAckfwu+Zie7NPnda3pVhDRLHTsK1c2ZoouwR
	 3AweMH7bAKaS+Uu+ohUz4PPQOOLcJnxx+SJIgCohfv3MnIgF+PvkGPUZSaJjYzGwfE
	 IzcnO9TlWa6wrMyNo47rQMWA8+Wf79ZW+snrpIJA0TgslXLjDNygIMMBbFYkvte/Yw
	 IlTMGuVH/uo7zlWyQj3FalWHbBdRBfCdjGVtPAwIr1U5iUO3w6tnVAbr3Jjrf3nVME
	 Ck2EuChS3DVBQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 289BCC433E5; Thu, 25 Jul 2024 08:32:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 219088] bluetooth scanning doesn't work in 6.10.0
Date: Thu, 25 Jul 2024 08:32:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: eugene.shalygin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219088-62941-LJQhPeOzJk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219088-62941@https.bugzilla.kernel.org/>
References: <bug-219088-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219088

--- Comment #5 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
(In reply to The Linux kernel's regression tracker (Thorsten Leemhuis) from
comment #4)
> thx; I would like to forward this report by mail; can I CC you? this would
> expose name and email address to the public

Thanks, no problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

