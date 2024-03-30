Return-Path: <linux-bluetooth+bounces-2987-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D1C892BE5
	for <lists+linux-bluetooth@lfdr.de>; Sat, 30 Mar 2024 16:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5D3B2832EE
	for <lists+linux-bluetooth@lfdr.de>; Sat, 30 Mar 2024 15:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E929339AF4;
	Sat, 30 Mar 2024 15:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r1ThMA/t"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D0B36AE4
	for <linux-bluetooth@vger.kernel.org>; Sat, 30 Mar 2024 15:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711813835; cv=none; b=inqfueDQjc0qsCf8yY4XQS2PTKolxcaVAlLVhqBns+sI3n7x1J/TITOAzmKjUDQ1qYtu6aDTTyBZK960jPgE4xuXBlXwU27TEd8XmqQkl1mymwBsQOUs/hvpjuVYm1piAKKo/jIeHtBXpoQ65XkF6TahspNpmAiM9mds5Ixb5iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711813835; c=relaxed/simple;
	bh=QAkLyRJUQOM7ENc4gwFsd6+FzXKQW5rH1yn42ETknIY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=amu+Qh/0RqA5BlbpQ5/52yx5l+fsLXEjfjtp3iKymLjiVzaT3hPM1hY23EtonMscMZGMsRpZNdB3vV4dWJlIBCVAZVYub6yuMhNnnPb6/3ZrvZc8LiteZgr+4+fZe1QGtwXxddo/SJT1k2zo3KnNxaxDxuzrBR7pwRjvB9YkgyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r1ThMA/t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D18B5C43390
	for <linux-bluetooth@vger.kernel.org>; Sat, 30 Mar 2024 15:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711813834;
	bh=QAkLyRJUQOM7ENc4gwFsd6+FzXKQW5rH1yn42ETknIY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=r1ThMA/tc7aiMvLgw3n6vef/ToaazP+E571V1+mz2dmI91dS0kxKY1bBM/Su9nlhT
	 Aj5tQxm696C578Wcnpm/1yhtiKE0rDNWV0vZbNkTHD5BCAE1wyuetM/ApVvQGPxwHy
	 XrO3zj5Gp36P+HmghKC+4xqmrA0pfOY9QFNJlxdeGcXvWhX+ODvqjtHkn2144pHaCx
	 eQoQh/E/E6QRNplNPKUDi0QgLGGkc1RW9dAQ05FtZMLFU3vZ4whKLOLf87Z2d5MIPf
	 ST7B7my5lu0I9OVK+rFPHzx6H/EToHpS8HXJzqvQMXv3x4aqUaeSMUsjJbOOoMlsCN
	 SXAE3fbsWfNMQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BF4A8C53BD2; Sat, 30 Mar 2024 15:50:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 218651] kernel 6.8.2 - Bluetooth bug/dump at boot
Date: Sat, 30 Mar 2024 15:50:34 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218651-62941-RVBMEm4Y6j@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218651-62941@https.bugzilla.kernel.org/>
References: <bug-218651-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218651

--- Comment #13 from The Linux kernel's regression tracker (Thorsten Leemhu=
is) (regressions@leemhuis.info) ---
I asked the stable team to pick up the patch:
https://lore.kernel.org/all/bf267566-c18c-4ad9-9263-8642ecfdef1f@leemhuis.i=
nfo/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

