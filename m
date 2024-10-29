Return-Path: <linux-bluetooth+bounces-8275-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 653109B4C9D
	for <lists+linux-bluetooth@lfdr.de>; Tue, 29 Oct 2024 15:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F0A01F245B0
	for <lists+linux-bluetooth@lfdr.de>; Tue, 29 Oct 2024 14:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05F51990CD;
	Tue, 29 Oct 2024 14:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VcMTHhWR"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B1E194088
	for <linux-bluetooth@vger.kernel.org>; Tue, 29 Oct 2024 14:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730213436; cv=none; b=K9qitzwL8ahvO1Q6E9gLpXR9cxe0OJeAvdG+XwB01c6kTJuY5eQzK1KUnjvU01x7HT0D5Lih+qO/K53iA1ep9RtCaTakCtH3dtQtrKh6QXPH2ENOqaTwg4QPoJlbem0YnzflShMcEk/swybo0dAdQV49MOWR+4KzK8LHItqeNRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730213436; c=relaxed/simple;
	bh=ZbbR8CWjJ7Xi4prCoX1zJHiSyatGrDjJqU9Jtjl7XH0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lFBIyS9ROLSguuEDNOZ7Xx9Mt7PPsUksEiOo8uj1hxqmHbaGS6vkFRQCFjB4GAU8GXVrXd3HhnnCOSuGzXoSjLAtqGj7qimk57vAdUP6qiDbm6TmmVYcrNeKKd8+2bMlARDEvuNzGHMogq2a0S+xjdQFRYhmFxyTITE4wVlVtds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VcMTHhWR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B17C4CECD;
	Tue, 29 Oct 2024 14:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730213435;
	bh=ZbbR8CWjJ7Xi4prCoX1zJHiSyatGrDjJqU9Jtjl7XH0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VcMTHhWR/h6cF8zPb40dhiOL8AHL2jVZjpL8Yn++3UsmlwgCi3uUfO0rhv1jOtudx
	 c+uid9l6CUuvIfZAsZd3A0Fzk0P4Hx1ktjbYu1iZ25kZ9Kkoq7JcTnvZcNiidSVhf4
	 HzLoD7dMkIqZg1dB54I0qF8iMXKcTFQb6988ZoiB64v4/0a3UK8zrUPLi+FfvSFFvV
	 usryx9vUyZLZp8RR2R7Yhy3NQmqEXC7A4CRkGwkpauw43KO+jV5LSH3IlGtOIvYXtF
	 D/Ef+HoUFn1UcDFI5fTrTmFvU1d/7S+Ihda4j13ASr3ssDGx/dngJoK4anvoBtgpId
	 5dj9UYBLBmnjg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F0B380AC08;
	Tue, 29 Oct 2024 14:50:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] device: only use the address type selection algorithm when
 remote device is a dual-mode device when pair device
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <173021344299.717356.5758569673491459704.git-patchwork-notify@kernel.org>
Date: Tue, 29 Oct 2024 14:50:42 +0000
References: <20241029075830.1268747-1-quic_chejiang@quicinc.com>
In-Reply-To: <20241029075830.1268747-1-quic_chejiang@quicinc.com>
To: Cheng Jiang <quic_chejiang@quicinc.com>
Cc: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 29 Oct 2024 15:58:30 +0800 you wrote:
> For a BLE-only device, if the device is already paired and the upper
> layer attempts to pair it again, the bdaddr_type will be set to
> BDADDR_BREDR since the LE connection is already bonded. This causes the
> device to use the BR/EDR bearer, which stalls the pairing procedure and
> requires waiting for the pairing timeout.
> 
> The bluetoothctl log below shows the error result:
> 
> [...]

Here is the summary with links:
  - [v2] device: only use the address type selection algorithm when remote device is a dual-mode device when pair device
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=6d55c7d7fd0d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



