Return-Path: <linux-bluetooth+bounces-11150-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D76A67B7B
	for <lists+linux-bluetooth@lfdr.de>; Tue, 18 Mar 2025 19:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 274BC1748EB
	for <lists+linux-bluetooth@lfdr.de>; Tue, 18 Mar 2025 18:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F96212B05;
	Tue, 18 Mar 2025 18:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rzD/Ee+N"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD703212B31
	for <linux-bluetooth@vger.kernel.org>; Tue, 18 Mar 2025 18:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742320803; cv=none; b=p//53siNEewkNL7Q121DxZG1KLa7fphOsak6L34y/X03jgoBdExopch5xvodnRm5ODUfijCdoNE3K+UyuQgkWYQgbPuM3u74SpAx5b15hydDO2oY73xaRTGfJZ0krcAZ75v79tUZdCvTlOD3paoq58Tt0VmixUI5GG3ksFOrBxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742320803; c=relaxed/simple;
	bh=EM3CpJ4mXbu4T+mskRtiWp4dFbiy9barn9QbLF8/E0Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rWgQa6/MlXA+smRVCs039DaDzQYlvfrs8Yqgd7aHZivETas0MoZac+Jk9716AX10kCPE0cnxdDYlyPX3axDUX6lTW/EthuQ879DEK+43/zbO1SF1Mbto0f9ouwMcscCMZMuI6REH3MmT2zGJI2MI6FAgKS1K5/JcXyIPDpNYmzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rzD/Ee+N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431D0C4CEE3;
	Tue, 18 Mar 2025 18:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742320803;
	bh=EM3CpJ4mXbu4T+mskRtiWp4dFbiy9barn9QbLF8/E0Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rzD/Ee+N9CBwaoX8a5vgis5diCAABnczaYWKQiE028PnMUq2DAsNI0qtymPXKuiI7
	 bfFSrspyLN+WFMl3tzuYIs+YhFA7JpMX+W+UFvDOxc9pNvoGi5nkDXw2sbX5bM+AhM
	 n7hTsZ6Noz1GBH4+NXk76WzFrorsNigYCiGw8/Q+ygrwdE8Ys83elUDSssLUVckbKI
	 U/lOeoTaRm6Zn8bULvwnPhD2wN6G8y3bFzO/IRNWN4tdhG2l/V6BWZOUK9YE3BbmO0
	 hX2tM7wfbmd2EP9iq5mLJDvAG1Rdzamnqg/abA31tFncDTtB6gHyHFH7524n2qMO6w
	 OTeOHCUjV3lmg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB54F380DBE8;
	Tue, 18 Mar 2025 18:00:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] obex: Publish SDP record for Phonebook Access Client
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <174232083851.406856.17395315028049576073.git-patchwork-notify@kernel.org>
Date: Tue, 18 Mar 2025 18:00:38 +0000
References: <20250318132741.92320-1-frederic.danis@collabora.com>
In-Reply-To: <20250318132741.92320-1-frederic.danis@collabora.com>
To: =?utf-8?b?RnLDqWTDqXJpYyBEYW5pcyA8ZnJlZGVyaWMuZGFuaXNAY29sbGFib3JhLmNvbT4=?=@codeaurora.org
Cc: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 18 Mar 2025 14:27:41 +0100 you wrote:
> This is required for passing below PTS test cases:
> 
> 1. PBAP/PCE/SGSIT/ATTR/BV-01-C
>    Attribute GSIT - Bluetooth Profile Descriptor List, PBAP 1.2
> 2. PBAP/PCE/SGSIT/OFFS/BV-02-C
>    Attribute ID Offset String GSIT - Service Name
> 3. PBAP/PCE/SGSIT/SERR/BV-01-C
>    Service record GSIT - PBAP PCE
> 
> [...]

Here is the summary with links:
  - [BlueZ] obex: Publish SDP record for Phonebook Access Client
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=3b9a6d3f6186

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



