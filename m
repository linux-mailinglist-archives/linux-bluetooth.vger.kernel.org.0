Return-Path: <linux-bluetooth+bounces-6289-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A32937713
	for <lists+linux-bluetooth@lfdr.de>; Fri, 19 Jul 2024 13:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01F3B2820AE
	for <lists+linux-bluetooth@lfdr.de>; Fri, 19 Jul 2024 11:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9BD85283;
	Fri, 19 Jul 2024 11:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sw4Dh8Z5"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E28B81749
	for <linux-bluetooth@vger.kernel.org>; Fri, 19 Jul 2024 11:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721388035; cv=none; b=Ago+MSwDOGuVM+8Fge839q4PUnDL25ztkraZu0U1fWqdZmWQcwN27Pi/cOOzy0zkYQDq8VxS30gwyC+u976tuxfwEmPFtVj2k4TqBH331fE58LuWL3PYNbMYG5+gKw64KkADnCaW163srp/m8v36udnK7P1gsrPHTNUe/NXIJrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721388035; c=relaxed/simple;
	bh=S2q9JqOoLEEA0XkcEB8SS0QihZMM0BOgPMTHo229Ims=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RJFQ1/JVc6m8kadcVaqDFIyxwlcrvgxkdfSvw4MgnI7BXkT0lrLDE86op5QvFye3W7iWAFSTfg8e2vGfccW3ZTHIeScVN2CxcpSqO9oYkxHuaGiTjddWJWTTcn4DRoIHAd24SMVs78lnbC29YA09GcfovQ3qZJHwrogPnrLYjzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sw4Dh8Z5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5ACD2C4AF09
	for <linux-bluetooth@vger.kernel.org>; Fri, 19 Jul 2024 11:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721388035;
	bh=S2q9JqOoLEEA0XkcEB8SS0QihZMM0BOgPMTHo229Ims=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sw4Dh8Z5+7JEAluUMpunPO6G7NQiIEzZhzVsHNPccvAv5QpkzSHkJ7NoICjXRqpRd
	 3RQCBEyndPSESa1vu6nystYWJf+6c26Bh3/9tZKBF7WwlW9vro4QWQqGVCdSSGOLfI
	 6s+C6YKbGyH8rN61sRRvenoytNrPz91z2KkhXZny+gQTFHy3kzal583phIIcwg1ptF
	 EKaFywK+lPAhTXEd0TXJ75tJUuAyQ3/tfM/Ly1CNiP0+n9RP4Jr+5sdfx2u3dlomrc
	 WQJDFr5kgg6YJMDkgR5mPDl6WMt7K6A3FXVFsH/ozs8yBQ7VWx+1WI6s3W5I7DFhS/
	 jpxxaE8WP0UVw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 510FEC433E5; Fri, 19 Jul 2024 11:20:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 219057] dongle bluetooth does't work on linux mint
Date: Fri, 19 Jul 2024 11:20:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219057-62941-r3xiwmy1Jc@https.bugzilla.kernel.org/>
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

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please try kernel 6.10 and if it still doesn't work, please attach `dmesg`
output.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

