Return-Path: <linux-bluetooth+bounces-14282-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 723B8B112BD
	for <lists+linux-bluetooth@lfdr.de>; Thu, 24 Jul 2025 22:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 745051CE13E3
	for <lists+linux-bluetooth@lfdr.de>; Thu, 24 Jul 2025 21:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF13C2EBDD8;
	Thu, 24 Jul 2025 20:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmqVZZee"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C10323B628
	for <linux-bluetooth@vger.kernel.org>; Thu, 24 Jul 2025 20:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753390791; cv=none; b=NaUzzNuThh2WN+hr+P4snUjufF/owBVRtLbX6Has8OY9JE5cxuAXSpOtZt7Ul18BqNCgq6YkqVe5VaSfM7Vf1GEvIRTlukvItM4a/CinOZICpED/rNTSYDKofthpNijxdg6lZoH1kDp12fLd/A6QreK49/DSnc/iczvqrtmsNqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753390791; c=relaxed/simple;
	bh=Ljm2d7uhGzdqG72exKoq2D6db/4LHx/ZyaYEx5i7/Zo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OEWsNjUyfsL+dZ7ottZANbh/lOg8CzfOGUJDRfBFYaBbnivNU660mTwYmYiaZbICd5ZEE0F8HxtvHeSZ+9KrxuQUYfP5PzTRGXB4HWfrmUDH1jztYPLn1c0OG1ay4GP1ePGWEzY1PkwhrKu6zqrqF2q1Ci1nxaKdD4Hzooh4ggQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmqVZZee; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C1BC4CEED;
	Thu, 24 Jul 2025 20:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753390790;
	bh=Ljm2d7uhGzdqG72exKoq2D6db/4LHx/ZyaYEx5i7/Zo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EmqVZZeeOBqKh4bfyFsLcRoBf8gKHdB9KqOLkh+01nenNuwQjKi6feXq8rheoLhPA
	 HvCO78LNwrpcRyr2jD2yrFXUBMnCmL0d14ou+5ZAR8vP1yqz7EvZf65VmxEHfS3sz3
	 t/llOOIDV9NyWVUSc+59lO2g9ff3zLFXyF7sCfPg+Vags3bvLIcEa4W/WCPWeI4mzq
	 NtT3oeYVYiqoPj/YW66XD8xxcR2RiJxC1S26XNV6HLavZelY4GalFX8ANnVdWbiQve
	 t18MEc9yN/IkugyWO5GHNTB5IaaagVVubCvQIx8fZcs7tZdfKbNX6/Xq5xSeDW7fpj
	 8IxjZ+Dbr/wZg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB023383BF4E;
	Thu, 24 Jul 2025 21:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] Bluetooth: hci_sync: Fix scan state after PA Sync has
 been
 established
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <175339080849.2527392.4672001699139625421.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jul 2025 21:00:08 +0000
References: <20250724205259.13273-1-luiz.dentz@gmail.com>
In-Reply-To: <20250724205259.13273-1-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 24 Jul 2025 16:52:58 -0400 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> Passive scanning is used to program the address of the peer to be
> synchronized, so once HCI_EV_LE_PA_SYNC_ESTABLISHED is received it
> needs to be updated after clearing HCI_PA_SYNC then call
> hci_update_passive_scan_sync to return it to its original state.
> 
> [...]

Here is the summary with links:
  - [v1] Bluetooth: hci_sync: Fix scan state after PA Sync has been established
    https://git.kernel.org/bluetooth/bluetooth-next/c/1f3837de85e7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



