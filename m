Return-Path: <linux-bluetooth+bounces-7072-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FB3962FBA
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Aug 2024 20:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B0E61F23514
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Aug 2024 18:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4F9156997;
	Wed, 28 Aug 2024 18:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+5B9aYF"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B143B14F115
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Aug 2024 18:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724869240; cv=none; b=MNMIqlwM2ho9Al8Qv6Fj8gMpGsbzHGp+bJCDkpYK73GihNu0wPej3ySt+KlnoDWWrB/RrE7OghkV6pmIK0LxeTlTOkwxjF6vA7gR8QxGKCrJmzVdyMRZjztkCDOqSEV2Cd5BdHG+5jJSQIfE0YbeEeJGkRZnmjABFpNmmkNHeOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724869240; c=relaxed/simple;
	bh=AnieVs01aTCqwyAiMsrbGvj4N1pdp+PWOqyNwhJLiZs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XTs62A41eqVjKkV5jxb88iJe5ZT6CY5I3DmFG1ZOYZ/mamMPNlzSXbD7hJtQkki90r5B+rEUFCgsNaitRhPir8iA/efBVlFZ6CLqq7IxigxHaTLV66cpc3Vxs6IIKcVCjiM/VX7qOeUGK5W2xfs3H25ozJD8bIMD2dMlbC6HbMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+5B9aYF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF13C4CEC0;
	Wed, 28 Aug 2024 18:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724869240;
	bh=AnieVs01aTCqwyAiMsrbGvj4N1pdp+PWOqyNwhJLiZs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Z+5B9aYFkEVwMk5lF2EDO9cjHoEvFcRjK6NbiPjO1sTUdFZtrdlxw8tnjNeJXahOV
	 vVYncr6pnb3cW7cKBVNOaJr6AvTceUXltqWLTjOUICDEuyMwT29oZFOM8rnwyPgopK
	 lv1nRBEGZ+oqaSUyVK+79B2jB3YJl6SSZD8Me4I4DnDiHRnPhW5V7ITx7AYV67Jozg
	 OUO6fTAuiYyyCZd5Wi4GND4n684Jpe5jdrREz0Sz50qoTPyJSzf3DLwSm/i5Oq/WVo
	 V1Pmig1Z/s8v//hHD5tJafpM7O41I4kR2QLRRejfEubQJozVELxQKN0pFxqGHQubOD
	 x1ymTyuvGCSzw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE1B73809A80;
	Wed, 28 Aug 2024 18:20:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v1 1/2] adapter: Fix up address type when loading keys
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <172486924048.1386371.5642530544321817083.git-patchwork-notify@kernel.org>
Date: Wed, 28 Aug 2024 18:20:40 +0000
References: <20240828153956.861220-1-luiz.dentz@gmail.com>
In-Reply-To: <20240828153956.861220-1-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org

Hello:

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 28 Aug 2024 11:39:55 -0400 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> Due to kernel change 59b047bc9808
> ("Bluetooth: MGMT/SMP: Fix address type when using SMP over BREDR/LE")
> some keys maybe store using the wrong/invalid address type as per MGMT
> API, so this attempts to fix them up.
> 
> [...]

Here is the summary with links:
  - [BlueZ,v1,1/2] adapter: Fix up address type when loading keys
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=366a8c522b64
  - [BlueZ,v1,2/2] Revert "adapter: Fix link key address type for old kernels"
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=d6515f4ca7d4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



