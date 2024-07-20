Return-Path: <linux-bluetooth+bounces-6300-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F9B937E9F
	for <lists+linux-bluetooth@lfdr.de>; Sat, 20 Jul 2024 03:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8109282490
	for <lists+linux-bluetooth@lfdr.de>; Sat, 20 Jul 2024 01:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC546FD3;
	Sat, 20 Jul 2024 01:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GuS3h68w"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441251C14
	for <linux-bluetooth@vger.kernel.org>; Sat, 20 Jul 2024 01:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721440150; cv=none; b=dyBbHFZCMSgzQcxXCFaoQLa0F9A3v3cB3NAqZavqwqgnwCtLtvXOx/fSW/+1RsBFJr4QBNtdZIwVirsKFRKY9Zhql/2ITNsuV8e/wymK0u0clZsc+oFC8dXypQ7DZHhDvMctx/aHJFkm+yb0YRcBimx6Z30DhOOSWEkM5Kt/pFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721440150; c=relaxed/simple;
	bh=LLThQiJIx/utBCdRsdkj9QWnYWH1Z7m9OtLoUqsaGac=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E5NiMBXUU4UYLlaVQ2xXqb9y/FJOGNvjuscSn1NxhmQMwt5DHSRiYWLJGvIxKSOOVEsV17pyZk8o12k1gtyt48Pu+9F+xWy7drArTMVHFFbLewrjwYd0fioKoOQ+9m9dYKrjx9g3D+98KVujwuO2OGZkFc3lfbCNX9i3HyiwE3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GuS3h68w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 779B7C32782
	for <linux-bluetooth@vger.kernel.org>; Sat, 20 Jul 2024 01:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721440149;
	bh=LLThQiJIx/utBCdRsdkj9QWnYWH1Z7m9OtLoUqsaGac=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GuS3h68wI3P5StopulOCdWs6fobzv8AOfp7fxbq/UZmm1G2rA33+4ychf9ejjbibR
	 6gKHZBGJ95YpilE2OtYA1Jxkr149bgX5FUnWdk9c9Tu6T8cFdmMTNd86W2wnlpmoBc
	 0ntQKJd7OnIfEFKX11Ga9QhJzf8Y3ISGolisGAYYAX6LkXUp1dmrbMwgkO9ThM0AQJ
	 e13vBa7LlhL1zHxZQ3zN9bTAKUBH6jy1ZLxg1kJWAPaDiIIyXeb8pQ/fpjjJGMl3MR
	 RJ4mLzQpP40fGCG4DNdqmazlbCGmJ8V6GZuIJ0lm/qoNi75y7lhhfeHJkNOnlEK22Q
	 55Wy34u10xDTQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6346FC53B73; Sat, 20 Jul 2024 01:49:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 219057] dongle bluetooth does't work on linux mint
Date: Sat, 20 Jul 2024 01:49:09 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ricardo.andres.riquelmerios97@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219057-62941-bdKgSGtVOU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219057-62941@https.bugzilla.kernel.org/>
References: <bug-219057-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219057

--- Comment #3 from ricardo (ricardo.andres.riquelmerios97@gmail.com) ---
(In reply to Artem S. Tashkinov from comment #1)
> Please try kernel 6.10 and if it still doesn't work, please attach `dmesg`
> output.

I cannot send because is too long and I can't send it but it said the same
error what I am posed here

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

