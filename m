Return-Path: <linux-bluetooth+bounces-6799-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B88D95396C
	for <lists+linux-bluetooth@lfdr.de>; Thu, 15 Aug 2024 19:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43FD61F26362
	for <lists+linux-bluetooth@lfdr.de>; Thu, 15 Aug 2024 17:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2EE3433D6;
	Thu, 15 Aug 2024 17:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TeYdygwX"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A99B2A8D0;
	Thu, 15 Aug 2024 17:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723744028; cv=none; b=WI+/wZs+voNmkJ0sqhTZcHyd7RMlDW8YOeo+wQ+/RbFadJ1u9MkctXMjqR+nTOeAo5+rVC7NX+VRaD4xGuxWtBVvv2kBkRD437AKI8MKWS0wKl8cUmbJj9lTN719mVkZdAVm9EX7+J5fmF96Hv/6fbfGbMgvb5D99vVVIU9JpCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723744028; c=relaxed/simple;
	bh=J9Ex4rw2845fbIv6dd6GHskWLwnSqlJq987NUO+jnp4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QGz9rQqDmnSeAtRXEp3fpXuy2CYVWUmwkjQ6Ni0CaHWtDup3zxO1c+m/wXKJIJvZoaDPsAxcZyWnhYoxUPvpSGP4ZOQ0ivu/MQH61RhByhS1XatdAsYLmYgS5CiGZT4wsYXy1iJsOkI8ikC+FW4okDdHsEpYgaSUyJLEvr0LcLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TeYdygwX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67A6C32786;
	Thu, 15 Aug 2024 17:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723744027;
	bh=J9Ex4rw2845fbIv6dd6GHskWLwnSqlJq987NUO+jnp4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TeYdygwXwEvjMS+m7p6zYIP7NAZeKgJEwF/uXWdp1UBRqcwj31mqAZsr18cZyL5yH
	 YE3v/MkJQwpgBwk6nUO3Ynojv878NXrZ8++23UaLufzHQfoovRypv72zDAND/HxD2Q
	 +pMKQQt4YDggvHAbEMOx4qC5ckAVQbaINdLx2kOwoYgp/BR2rVc03WH3B+k22cfj6s
	 WeVX9ibxUo3hvP9F0t17vofaLvX/H8evvb6NvPY/jQsrnMEHvzp7h+GZbXuKebE6mz
	 71kfQbetz0KRJhb0jD0sJKmfxoUGu6m5Jp1dMXD+/tvRFgimSM9gvpckVI+vgYPGVd
	 +7M245wD7uXOQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F09382327A;
	Thu, 15 Aug 2024 17:47:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: pull request: bluetooth 2024-07-26
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <172374402700.2912401.433953324965673988.git-patchwork-notify@kernel.org>
Date: Thu, 15 Aug 2024 17:47:07 +0000
References: <20240807210103.142483-1-luiz.dentz@gmail.com>
In-Reply-To: <20240807210103.142483-1-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org

Hello:

This pull request was applied to bluetooth/bluetooth-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  7 Aug 2024 17:01:03 -0400 you wrote:
> The following changes since commit 1ca645a2f74a4290527ae27130c8611391b07dbf:
> 
>   net: usb: qmi_wwan: add MeiG Smart SRM825L (2024-08-06 19:35:08 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git tags/for-net-2024-08-07
> 
> [...]

Here is the summary with links:
  - pull request: bluetooth 2024-07-26
    https://git.kernel.org/bluetooth/bluetooth-next/c/b928e7d19dfd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



