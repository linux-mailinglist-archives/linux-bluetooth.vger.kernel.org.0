Return-Path: <linux-bluetooth+bounces-7329-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2289997A5A3
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Sep 2024 18:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E7C0B297A5
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Sep 2024 16:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAFE15B0EC;
	Mon, 16 Sep 2024 16:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+f5oOTG"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC58159209
	for <linux-bluetooth@vger.kernel.org>; Mon, 16 Sep 2024 16:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726502438; cv=none; b=izyUn5NpFPoLJ61C7kDVmsmaNlEelSUtpCJHwjG9dBjbQVfTleDAFHQqqsZddLX4J7SBM1o3WqcnVeNy8N8Z7Xu17bQUe58QXQ7Z+P4JftwuMzci1wE+TavwgWKZzJw8btQeDflR5COCCbMEnwyZT13fAyvEgdA+/rSxnnYRIZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726502438; c=relaxed/simple;
	bh=IJ52FTUPrnFGngeFYedQn/d/LfZBd/erzO3xfw3Zxgo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YzLuCjvuXCmKPz9p3aMNJX5mrODScJPfsTSXdGWB6Iyk7HgUPrhc68lIBJyeyh17tpJTE5P85oMyKUEwOpZ1iUVBWnqVNMHfUViGikLrID3C/Xe3+G44FdPEy17Qe3M+IKyTXFzdrV0C3JueUEy/oDiiIjDvcRvqvy8Q6jgKMaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+f5oOTG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9BDC4CEC4;
	Mon, 16 Sep 2024 16:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726502437;
	bh=IJ52FTUPrnFGngeFYedQn/d/LfZBd/erzO3xfw3Zxgo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s+f5oOTGh8WAbsX/NaKuw9BF/bN0uoZmhSzMhCw5V4zvoN5hqQ9r8I6jb9/AhZk70
	 QsD3lwut53KZDA75YZWQvcfl2dURxP957b/7EA8f3fzv8BH16tf13xhYJJZoXZBDWc
	 LKc5Pcv7wGakPDD5vhijB1A2MOIkN8AT3+uIBY7wAb8siAq6XEn0CXiqOQHF4MuAbg
	 vfyc9sEYJeQPPY22FzyDwm5CwBVow99aAyjvFlud0nfng9YB4hPMOtHfByZqpMQASZ
	 JbBL+SffAdX1yzZ2SoA6Q+ipmM3JxWagjJH1Zmfi9L/yqHUBLE7pWCHJJxPoSXwUt7
	 SOlqOf+pnQ0yA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D4B3806644;
	Mon, 16 Sep 2024 16:00:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: MGMT: Fix possible crash on mgmt_index_removed
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <172650243905.3746357.10015994819065841806.git-patchwork-notify@kernel.org>
Date: Mon, 16 Sep 2024 16:00:39 +0000
References: <20240913165010.3240215-1-luiz.dentz@gmail.com>
In-Reply-To: <20240913165010.3240215-1-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 13 Sep 2024 12:50:10 -0400 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> If mgmt_index_removed is called while there are commands queued on
> cmd_sync it could lead to crashes like the bellow trace:
> 
> 0x0000053D: __list_del_entry_valid_or_report+0x98/0xdc
> 0x0000053D: mgmt_pending_remove+0x18/0x58 [bluetooth]
> 0x0000053E: mgmt_remove_adv_monitor_complete+0x80/0x108 [bluetooth]
> 0x0000053E: hci_cmd_sync_work+0xbc/0x164 [bluetooth]
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: MGMT: Fix possible crash on mgmt_index_removed
    https://git.kernel.org/bluetooth/bluetooth-next/c/eb3ad76a07b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



