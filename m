Return-Path: <linux-bluetooth+bounces-14566-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6873AB211EF
	for <lists+linux-bluetooth@lfdr.de>; Mon, 11 Aug 2025 18:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 034D43A7D5B
	for <lists+linux-bluetooth@lfdr.de>; Mon, 11 Aug 2025 16:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C3F2C21FC;
	Mon, 11 Aug 2025 16:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQpAvZbT"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578E92C21F2
	for <linux-bluetooth@vger.kernel.org>; Mon, 11 Aug 2025 16:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754928958; cv=none; b=pkDsAlNYGJRELZDVczQgpOrqa1vupZ3OvOopE5E15YFGvRnBHZwT9uZUIwV5RmZJ6IXfdKbIwAQ7XARv6IjMvK4TvHqhmOJgs2j2Cta+J67lH0Vt/T6Wm7ulMVM39E27mEU9OTPl7I4tffkL0CktZmCU+6EOwQdYur2G2G05tN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754928958; c=relaxed/simple;
	bh=1FaPjxH9OIaLlUE3bhn9m3VJ3eMQRwXSqiv3nX9g3JI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=qZxGB/gsAlvRul9JByCjoSGudSD7wXHDC9JAEb2KXZaFztrnhP7KQIqwD3u3xmhQWwdbecCSrO52EkRDsBbCB6hhtJFLQblcqfd3wF63bvYBSawnjpZZz5fequ+FFQFVueBFIZabX4OrN8WEcbXSTLXajlr9LAuSMt9OxJqrgqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQpAvZbT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5EFCC4CEED;
	Mon, 11 Aug 2025 16:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754928957;
	bh=1FaPjxH9OIaLlUE3bhn9m3VJ3eMQRwXSqiv3nX9g3JI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PQpAvZbTmDSzVbr/TMob2WQxtRIvG5lF+zDhY4opvRTuC9rxVHTtqMYdPAk8rD+cj
	 XI62GedxgNKZkTGwbxDisIz/YXn5UPqeCkDROIF/EN3tJloO5/qRDeee0hn75IM0Yg
	 kPh3FE7LN0D60KuNoVfa5r8zj0qI5sj3qK2Y0OXvC78V3o26jOTAZiAxYTkL4lcTNW
	 i9JSSTa0iRPT44jolSiZc3wr3eXLv5MzQNCsAUnL8ZFWFFnfzxPCjWIKu+aAY5Z+Sv
	 SdonW2zJMm3+VXT9N6m8CwiQdtzmmqe73/DXerC/Rep4Y4cGSiXy3WbxCi797f9Otp
	 yidzCOISQyM5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DC6383BF51;
	Mon, 11 Aug 2025 16:16:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: btintel_pcie: Refactor Device Coredump
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <175492896999.1716045.717380548798615007.git-patchwork-notify@kernel.org>
Date: Mon, 11 Aug 2025 16:16:09 +0000
References: <20250806064849.1533531-1-kiran.k@intel.com>
In-Reply-To: <20250806064849.1533531-1-kiran.k@intel.com>
To: K@codeaurora.org, Kiran <kiran.k@intel.com>
Cc: linux-bluetooth@vger.kernel.org, ravishankar.srivatsa@intel.com,
 chandrashekar.devegowda@intel.com, chethan.tumkur.narayan@intel.com

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed,  6 Aug 2025 12:18:49 +0530 you wrote:
> As device coredumps are not HCI traces, maintain the device coredump at
> the driver level and eliminate the dependency on hdev_devcd*()
> 
> Signed-off-by: Kiran K <kiran.k@intel.com>
> Fixes: 07e6bddb54b4 ("Bluetooth: btintel_pcie: Add support for device coredump")
> ---
> changes in v2:
>     - Fix compiler warning reported by android toolchain
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: btintel_pcie: Refactor Device Coredump
    https://git.kernel.org/bluetooth/bluetooth-next/c/7654453aa550

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



