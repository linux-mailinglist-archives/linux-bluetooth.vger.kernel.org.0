Return-Path: <linux-bluetooth+bounces-3685-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2BF8A8730
	for <lists+linux-bluetooth@lfdr.de>; Wed, 17 Apr 2024 17:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 700131C217BB
	for <lists+linux-bluetooth@lfdr.de>; Wed, 17 Apr 2024 15:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945D1148317;
	Wed, 17 Apr 2024 15:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGIn/JqS"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022CA1482F1
	for <linux-bluetooth@vger.kernel.org>; Wed, 17 Apr 2024 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713366838; cv=none; b=L1bku7fA0MrMaiFMupzw+hxkNUk9/oU7ykvblQ48NGx3LqZWejydkzmt1NDgTUS0ywcqLLAiSkQROQOYSMjs0hgLKpcNtuvkc/NsooRnPBWpf9/fLJrbUz7iWdmCWzp5zm0mCmsi4deZU9/AFSs9zj9TBN2tGQrPBh+aGqfGTO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713366838; c=relaxed/simple;
	bh=fcLJlSM0bwZlni0F9Vs2gmMTbbHw3DGtg+LRlhDh2Fs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gf1m30t8pH0jivmkLWH0OrQzXYi4Ek8j4B9WCtE7f6h5kkEw5WEBioTtHrWMucrnYUB8PsU0na3HxySMjBC7AJ62WfUAb3cYn+0QeNyjDwES211Y/41WGswYLEK4Bgk/GLtxfIpR16n3DlE3woxb2bLVxfEqaM3DA3JXgIxY4q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGIn/JqS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F056C4AF0B
	for <linux-bluetooth@vger.kernel.org>; Wed, 17 Apr 2024 15:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713366837;
	bh=fcLJlSM0bwZlni0F9Vs2gmMTbbHw3DGtg+LRlhDh2Fs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IGIn/JqSdRzzZJSlN+nyJkhdBbAn7R/7ThzDeNU7g0yH32dV8i6z9D4SYXxs8p8n1
	 Wx8M51l+caEzSR2qyyGo8aSMyY+mCVilAO0DaXwwnRD/5OvmvCqyQBpOEEkcHyUvR5
	 mTTkIhj75OJLCKT4oj6ZMMIy4h3wWpBrX2wpQWRMmxk9160jOuNP0Y4fXR3w3DfzX5
	 WPii5Qsa0NQfpQXyQquYdVUziY/3SBXnqU7Mkup2c8g6qOlwmgKD7UJfQf400eBFze
	 h72zZjp5HWAbjhzVAFCqJFG4cXljDFZMRxRsAlkY9b8kBcN0q7yPbrFIYWJ6XtkT3u
	 lwZOpXeHcpsAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7B419C433E3; Wed, 17 Apr 2024 15:13:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 218726] qca6390 bluetooth fails after disabling/re-enabling
 bluetooth
Date: Wed, 17 Apr 2024 15:13:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: quic_zijuhu@quicinc.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218726-62941-oWpBrS51Th@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218726-62941@https.bugzilla.kernel.org/>
References: <bug-218726-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218726

--- Comment #36 from Zijun Hu (quic_zijuhu@quicinc.com) ---
Hi Wren,
sorry, it is my mistake, my 2nd debugging patch don't completely revert the
Commit=20
56d074d26c58. i have updated that debugging patches.

you ONLY need to apply below two changes over the tip of bluetooth-next tre=
e.

https://patchwork.kernel.org/project/bluetooth/patch/1713095825-4954-2-git-=
send-email-quic_zijuhu@quicinc.com/

https://patchwork.kernel.org/project/bluetooth/patch/1713366251-22144-1-git=
-send-email-quic_zijuhu@quicinc.com/

if there are conflict, you maybe git reset beluetooth-next tree into below
commit and apply the above two changes.
e00fc2700a3f Bluetooth: btusb: Fix triggering coredump implementation for Q=
CA

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

