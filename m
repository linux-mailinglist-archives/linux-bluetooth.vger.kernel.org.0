Return-Path: <linux-bluetooth+bounces-7589-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A1498F453
	for <lists+linux-bluetooth@lfdr.de>; Thu,  3 Oct 2024 18:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 932D01C20DCD
	for <lists+linux-bluetooth@lfdr.de>; Thu,  3 Oct 2024 16:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE2F1A705A;
	Thu,  3 Oct 2024 16:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPJcqMDc"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75223186E3D
	for <linux-bluetooth@vger.kernel.org>; Thu,  3 Oct 2024 16:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727973628; cv=none; b=BKAW6DeENKCvKKo39xIyn5uLDGJ26D+oJweG/Bp8JwJU5FwfP1fdiAfL7IunzEiECHEXhoF/8jSdM8BPj4UV48bNWbMx7LpkMBBqfbcO65+RSLV8+o1a/Tv7FPUh+BUn9w7aaWusWIL7kS7S5W2jy0P4rKO3hEmzgCZq5D28GzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727973628; c=relaxed/simple;
	bh=2FaeZwkzmR/LPMBe6UCioVwJQQm2Lcbk1ZIPWIY7n3w=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BbyKYrRrKOsXgNlof8lKF9E7v78YmZsLss50QKEDqTJeR6DTbgUwYqfj7hQ+Z5qAiLn75D3juq0fIXjx0l3qciPeyEbHJukd/y+aiCVNppRmIrFMmT/77V+JMBXpRn0qGz0VsW3tnp/EygbR2GuHU0who44nNSR/eg2j8DjF0pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPJcqMDc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11096C4CEC5;
	Thu,  3 Oct 2024 16:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727973628;
	bh=2FaeZwkzmR/LPMBe6UCioVwJQQm2Lcbk1ZIPWIY7n3w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XPJcqMDctxElhbyffg32tZT7eBIfSG+XELrSvM2NweabPo29MenpWmsvyeJSGuQKe
	 bLWCvNndUG+MM/Rp2Iq8UCFC6kNUuxbfijdS3FfFtAVbr5dHLoQio0Y4ux7Fe02vKv
	 62a3T4LDN0R4kX+pCNQq06XAQbT6NEpiljLgCf1swB54d6SJu1oqV28Wz/+GC9wsx9
	 ELmw1uLdkll3xzm+cpwX2TBu26iRq1iaWP+QUuD3GcMmaEjseP4W/Bj8GgSoGbGaLK
	 ts1+KK73LY5r+tz+HpJi7MGupjHaXGe4VE2BNtjL91jahdLeGSl/BMP9XxBxlGDpfL
	 iyOhq0gQGgurA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD293803263;
	Thu,  3 Oct 2024 16:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] Bluetooth: hci_conn: Fix UAF in hci_enhanced_setup_sync
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <172797363151.1917736.16977506690005860622.git-patchwork-notify@kernel.org>
Date: Thu, 03 Oct 2024 16:40:31 +0000
References: <20241002152522.3328164-1-luiz.dentz@gmail.com>
In-Reply-To: <20241002152522.3328164-1-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed,  2 Oct 2024 11:25:22 -0400 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This checks if the ACL connection remains valid as it could be destroyed
> while hci_enhanced_setup_sync is pending on cmd_sync leading to the
> following trace:
> 
> BUG: KASAN: slab-use-after-free in hci_enhanced_setup_sync+0x91b/0xa60
> Read of size 1 at addr ffff888002328ffd by task kworker/u5:2/37
> 
> [...]

Here is the summary with links:
  - [v1] Bluetooth: hci_conn: Fix UAF in hci_enhanced_setup_sync
    https://git.kernel.org/bluetooth/bluetooth-next/c/a691ff3d3280

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



