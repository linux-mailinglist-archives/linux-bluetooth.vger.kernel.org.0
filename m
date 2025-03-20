Return-Path: <linux-bluetooth+bounces-11237-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D85A6AE27
	for <lists+linux-bluetooth@lfdr.de>; Thu, 20 Mar 2025 20:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C01E94A185D
	for <lists+linux-bluetooth@lfdr.de>; Thu, 20 Mar 2025 19:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A104322B8AC;
	Thu, 20 Mar 2025 19:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHhZI6it"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0781222B5A8
	for <linux-bluetooth@vger.kernel.org>; Thu, 20 Mar 2025 19:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742497214; cv=none; b=AaO9HiXiItFdb9A2cVLCToiJR26d4UdS2IWEDL49GCPKFmrS0boZ/tGwsIZYsdQ5BdR7uiRmdW2QZz4uUj+gclAzIsg4RIIZVPna9DOYVkEplADABpYN2d0XlX97RKU/cbygsptrfGNVL7C4eLDVevcF9NFccP940EtdBcS2kxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742497214; c=relaxed/simple;
	bh=NEZ0rI5A75Txibf+rJXS8XzOzwnMxkssaCT94DrtaH0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=b9JX/WAqGn35/XK+35Ea9QlZiVicS9Wi4c5ttFUNrBvWpi0GCtXtTeBLxCKgJ8HqHvzTcbYKC/ZGfupKhZbz/T0JpdLdzyZZC9AQ6JYBHUncbcNjWUILDrzaOkmXlW/Tuxx9JcyRtfS0DCOsFpq35lGGOMJ2/033gMX5WKE9eZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MHhZI6it; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDD1C4CEE8;
	Thu, 20 Mar 2025 19:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742497213;
	bh=NEZ0rI5A75Txibf+rJXS8XzOzwnMxkssaCT94DrtaH0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MHhZI6itgekY3OOlImVhza5cjsLmPaM3BvfZW4tsLdsBKaM/SKlORugIAkSxmOyz+
	 r3uEIxiIX2G03JIewQwJuGpQzhTcLpf8kSAEYj1N/NLa6jlRaGLNz+6r0HvkQRZHnP
	 KQTcpwlqTcHhSZIdjFE6+MIZSO/VQ3qYBSfRKCCvXHyOVWA36QpttBDdeW5kvyhhAB
	 TaYliZRQyPbByj0Bvz3O5qI9cNl9wOLd/u+UT5ujVFqMs8M8uBua7DyqiwRjjRK6qi
	 xTqGhZnNveouIjNCQGvEYTN807hhkgDl/9kQdYZ0zeEPF6/gDztVvntgGsD0QNTaD0
	 1jXzmdLlGqylA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DB33806654;
	Thu, 20 Mar 2025 19:00:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: btintel: Add support to configure TX power
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <174249724900.1878155.11686206489527320241.git-patchwork-notify@kernel.org>
Date: Thu, 20 Mar 2025 19:00:49 +0000
References: <20250307110011.1960049-1-vijay.satija@intel.com>
In-Reply-To: <20250307110011.1960049-1-vijay.satija@intel.com>
To: Vijay Satija <vijay.satija@intel.com>
Cc: linux-bluetooth@vger.kernel.org, ravishankar.srivatsa@intel.com,
 chethan.tumkur.narayan@intel.com, chandrashekar.devegowda@intel.com,
 kiran.k@intel.com

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri,  7 Mar 2025 16:30:11 +0530 you wrote:
> BRDS - Bluetooth Regulatory Domain Specific absorption rate
> 
> Bluetooth has regulatory limitations which prohibit or allow usage of certain
> bands or channels as well as limiting Tx power. The Tx power values can be
> configured in ACPI table. This patch reads from ACPI entry configures the
> controller accordingly.
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: btintel: Add support to configure TX power
    https://git.kernel.org/bluetooth/bluetooth-next/c/82fcec755f99

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



