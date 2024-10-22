Return-Path: <linux-bluetooth+bounces-8061-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CA79A9E52
	for <lists+linux-bluetooth@lfdr.de>; Tue, 22 Oct 2024 11:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EED541F21EA4
	for <lists+linux-bluetooth@lfdr.de>; Tue, 22 Oct 2024 09:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C76175D35;
	Tue, 22 Oct 2024 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEx3pmfP"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D45312D75C
	for <linux-bluetooth@vger.kernel.org>; Tue, 22 Oct 2024 09:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729588850; cv=none; b=WKkv0g6UzZr26hiS+StlloZSXB1hM1LEvD1h23Qzgwsq4FgmaglS4AhQSqa3BsYfpLtTNGqX/Aru5DO4cmk7nh4OdkJGPUqCF6YWPqwF/qauNo2a3lKcjLfqyF96C+Pt6sqL5m0w2B4wg19dz75q8Zbf34hNkXFyq+Y9CD7HXPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729588850; c=relaxed/simple;
	bh=IzXBu4+ewmyM8fGoKk2L7UyWY7FdMHYnNtkXIW0Jn3U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h5Cj0tH9+U0WhnFBVlVvoIP128CnRbwOEzAfhXTIVd4CVho+jdzQZvVQqrIrSKMP0/B8AEAgzFFJCHmXd9ag0KxSuwQQmyD7K4excyAJXdYME545kVz/ixTwYeQorR4GwOB5QSNbea0vqFs9Hv/SPyy6yOliND0i0gi6kQFg8eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEx3pmfP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EC8BC4CEC3
	for <linux-bluetooth@vger.kernel.org>; Tue, 22 Oct 2024 09:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729588850;
	bh=IzXBu4+ewmyM8fGoKk2L7UyWY7FdMHYnNtkXIW0Jn3U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CEx3pmfPoqmiTswFsdg/Ysb6LnUbQk92f5jIdnJ+LiEO3CA5IjCwho/CnyoN6Xina
	 n8tdppbBHcv9b85r9Eh9MLjOlOzPvR29oGXSIHeAR/LQaJdKw+QxQKxobU0Ci2zWWO
	 bRyevGJ2jiYLcJ0wXD21ktXUBWDiR1FiyjVEonKBXCB+HZzSBzxBJkwa7yn3kFI0d0
	 PvDZRuDuU8uiba9KWY+YGLsHmeYGTTDzdvs+67JRoIEPBXSWYvlbN93/j/Yi4V5ukC
	 m9jmAs8KHS8yQMKBMEjdtLSXaMLtIz12y2WVAeYoG15qlj59Qw18jLzLC7tAlkKLnG
	 HF8/LIjDRc8FA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1D5E9C53BBF; Tue, 22 Oct 2024 09:20:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 219405] [regression] mt7922 bluetooth scanning does not work in
 6.11.4
Date: Tue, 22 Oct 2024 09:20:49 +0000
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
X-Bugzilla-Changed-Fields: cf_kernel_version cf_regression
Message-ID: <bug-219405-62941-cUvlRmLTzg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219405-62941@https.bugzilla.kernel.org/>
References: <bug-219405-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219405

Eugene Shalygin (eugene.shalygin@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.11.4
         Regression|No                          |Yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

