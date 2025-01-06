Return-Path: <linux-bluetooth+bounces-9558-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D510BA02F7D
	for <lists+linux-bluetooth@lfdr.de>; Mon,  6 Jan 2025 19:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56FD33A5B13
	for <lists+linux-bluetooth@lfdr.de>; Mon,  6 Jan 2025 18:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116D81DF968;
	Mon,  6 Jan 2025 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfjuqZJK"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564771DF743
	for <linux-bluetooth@vger.kernel.org>; Mon,  6 Jan 2025 18:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736187015; cv=none; b=m/NZm0Gnf+H1TnvcDraR/rl4PSkR9pLuCoG60wDB53fANKJlF5rxiGM07UT8+Tl8s/yPyAn9pAK84QSfTgyOBeopJ41bNyGFKup2NNXArALwI3pUNVJXpemQ2DV6M70BUtYWgDlF7Rh6fgnBWOOuvg1SXWVi/WXR7bYkaR90+qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736187015; c=relaxed/simple;
	bh=mv6QZfVBGhZnTsmS+Zz+BM+tNLOnBSyx/dgrGluJcfE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=W5DHKRNer4Y8+bzYdziBQK2VGGKmrPCYjhKRpuI4V8tn2aMLqsacaWvvDkO1wMh4B7uimRMxcB2YQsBkyZI9NPWsaNTT7OqvV0Byc1/j5zRR4F4p5beHBiQITE7IL6035j+mobTqSb6ftQqATQ6dSy0kp+OLiV5WwRte2/x6yDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfjuqZJK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08A9C4CED6;
	Mon,  6 Jan 2025 18:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736187014;
	bh=mv6QZfVBGhZnTsmS+Zz+BM+tNLOnBSyx/dgrGluJcfE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gfjuqZJKtk8mqwjwq9+LFfV9BawWuRbCQODflySImoDBL7jT6e3iN6d7YFbskU4L8
	 faX82Z1cCzlN+PAohE5DWbF0JzfGtfW1r1DXylMVbp2gUB5Ri5AVV+YU/AJVCgMmdV
	 s8F6tKzyw6VwzGDzQzd69vg6xJYe/+IG+SyNzvjhe+9CTeMl/c3x0UWFJF64xhShxh
	 6AVSO9NI4Y9j12MgmjW1dmgVPbx6PlZKVRMX3SvFJA6sT7D42u8AFJFvPjZpLCEXfO
	 mzPsjnnCwX801vWn5ej8VwckSwaBA43OjVQZzVbN6FWroDRPa6jVOncLR2tl7WHc6i
	 cn7lefWjSZYJA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CCD380A97E;
	Mon,  6 Jan 2025 18:10:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btusb: Add hwid for WCN785x
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <173618703575.3577621.3788828572967758823.git-patchwork-notify@kernel.org>
Date: Mon, 06 Jan 2025 18:10:35 +0000
References: <20241220150744.51842-1-rorgate@gmail.com>
In-Reply-To: <20241220150744.51842-1-rorgate@gmail.com>
To: Tobias Daeullary <rorgate@gmail.com>
Cc: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 20 Dec 2024 15:07:35 +0000 you wrote:
> Patch has been tested and pairing/connection issues with 3 different
> devices are gone.
> 
> Signed-off-by: Tobias Daeullary <rorgate@gmail.com>
> ---
>  drivers/bluetooth/btusb.c | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - Bluetooth: btusb: Add hwid for WCN785x
    https://git.kernel.org/bluetooth/bluetooth-next/c/94382af338f5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



