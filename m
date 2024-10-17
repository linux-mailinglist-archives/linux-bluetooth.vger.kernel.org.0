Return-Path: <linux-bluetooth+bounces-7971-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B411D9A2AB9
	for <lists+linux-bluetooth@lfdr.de>; Thu, 17 Oct 2024 19:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 794A928329B
	for <lists+linux-bluetooth@lfdr.de>; Thu, 17 Oct 2024 17:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A381DF998;
	Thu, 17 Oct 2024 17:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVjxfwBG"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9BA1DE2BB
	for <linux-bluetooth@vger.kernel.org>; Thu, 17 Oct 2024 17:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729185624; cv=none; b=R9HQTZRYAziQ7yFuR7Exrd/wygI0BPIMN85p6c4TBUtZmeWb/00YIALTtwrMkf6fzd7gERfaA0Dbfv241orqZ3JpYCxHU8Y9ffSw9+wmgeMBt7r/9iKoxG7ndTcriLRwYuwD8nLtScsk2sz7YuepjL0dFBpEEeFtjwmX1ZCht2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729185624; c=relaxed/simple;
	bh=pAehV615ZS9rD0bzIQYUQUq5AAQEm54kY10v/dO/od4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=eIW4JA4rq3QAAljif/FDgKIqxY+qUBzBR3j82jYu1Qat7Tk87CpbXZSCAeLWxSfz3P0Nbi90ImtV566MuQiHwowwD2oor69ozpK2oav7Ca1qsSZazmWOAqF8EiXFKSUalyqVHAxrah3l7V2D3+DMsv0kzOMzWl+CnaoeBNq8B9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVjxfwBG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40407C4CEC3;
	Thu, 17 Oct 2024 17:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729185624;
	bh=pAehV615ZS9rD0bzIQYUQUq5AAQEm54kY10v/dO/od4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KVjxfwBGsQ2RJl5CpdHmnnMoiLWdPKlLUv5ExbaoLiyNQly6EVsgo4ptdaLyL9hPt
	 Flce75DX9RUzLF/2GX5nA50s/x+jXf4UBVRB2hWqt3HrFThOEgwcr0iprgEzROpvZ5
	 Ff5snlHYqieiMtq1ryCEJC9K3EHaL8w2LA/dXn4nUwP9KunVjAtR9ScedNm8VAcrzH
	 RNLiAUsk/MDSPX65Eekdmbk9v/lsAbnp12oqUJkUKkD3quuVWqWXzW9N1SpbrVOFPx
	 XqqUAlbcZZV8toNx1wBwZz91x2zA7FJEjx2QzcBxx1TcbGfEFE2mraLtgmsKvLId0S
	 QJWgC1SvWwyYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE273809A8A;
	Thu, 17 Oct 2024 17:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth:btintel: Do no pass vendor events to stack
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <172918562875.2545868.16371212670060541741.git-patchwork-notify@kernel.org>
Date: Thu, 17 Oct 2024 17:20:28 +0000
References: <20241017102236.729685-1-kiran.k@intel.com>
In-Reply-To: <20241017102236.729685-1-kiran.k@intel.com>
To: Kiran K <kiran.k@intel.com>
Cc: linux-bluetooth@vger.kernel.org, ravishankar.srivatsa@intel.com,
 chethan.tumkur.narayan@intel.com, chandrashekar.devegowda@intel.com

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 17 Oct 2024 15:52:36 +0530 you wrote:
> During firmware download, vendor specific events like boot up and
> secure send result are generated. These events can be safely processed at
> the driver level. Passing on these events to stack prints unnecessary
> below warning log.
> 
> --
> Bluetooth: hci0: Malformed MSFT vendor event: 0x02
> --
> Fixes: 3368aa357f3b ("Bluetooth: msft: Handle MSFT Monitor Device Event")
> Signed-off-by: Kiran K <kiran.k@intel.com>
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth:btintel: Do no pass vendor events to stack
    https://git.kernel.org/bluetooth/bluetooth-next/c/4d67eb2b5444

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



